# HOWTO — Chạy dự án 16-bit Zero Leading Counter (ZLC)

Hướng dẫn chạy từng bước toàn bộ design flow trên VM OSIC Debian (đã cài sẵn SKY130 PDK + EDA tools).

> PDK: `/usr/local/share/pdk/sky130A/`
> Tools cần: `git`, `iverilog`, `gtkwave`, `xschem`, `sta` (OpenSTA), `magic`, `netgen`, `ngspice`, `gaw`.

---

## 0. Clone repo (kèm submodule reference)

```bash
git clone --recursive https://github.com/dungtran1109/group-02-vlsi-16-bit-zlc-counter.git
cd group-02-vlsi-16-bit-zlc-counter

# Nếu lỡ clone không có --recursive thì chạy:
git submodule update --init --recursive
```

Submodule `sky130_adder_4bit/` là design example tham khảo, không phải code mình sửa.

---

## 1. FRONTEND — RTL & Mô phỏng chức năng (iverilog)

Mục tiêu: kiểm tra netlist `lzc16.v` (xuất từ Xschem) chạy đúng chức năng.

> **Lưu ý**: testbench thuộc repo là [`tb_lzc16.v`](frontend/iverilog/tb_lzc16.v) (không phải `lzc16_tb.v`). Nó sweep toàn bộ 65 536 vector đầu vào và dump VCD; **không** tự so với reference. `zlc_ref.v` là reference để dành, chưa gắn vào TB nên không cần include khi compile.

```bash
cd frontend/iverilog

# (Một lần) sync netlist canonical từ xschem nếu chưa có:
cp ../xschem/lzc16.v ./lzc16.v

# Biên dịch netlist + testbench + thư viện sky130
iverilog -g2012 -o lzc16_sim \
    lzc16.v tb_lzc16.v \
    /usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v \
    /usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v

# Chạy mô phỏng — sweep 65 536 vector, dump lzc16.vcd
vvp lzc16_sim

# Xem dạng sóng
gtkwave lzc16.vcd &
```

Trong GTKWave: chọn module `tb_lzc16` → kéo `A[15:0]` và `Y[4:0]` vào cửa sổ waveform → chụp ảnh lưu vào `images/waveform.png`.

---

## 2. FRONTEND — Schematic (Xschem)

Mục tiêu: xem schematic phân cấp và **xuất lại netlist** (Verilog + SPICE) khi có chỉnh sửa.

```bash
cd ../xschem
xschem lzc16.sch &
```

Trong Xschem:
- Click vào subcell `lzc8` → bấm `E` để đi vào trong. Tiếp tục `lzc4` → `lzc2`.
- Bấm `Ctrl+E` để quay ra ngoài.
- Menu **Netlist** → chọn mode **Verilog** → tạo `lzc16.v`.
- Menu **Netlist** → chọn mode **SPICE** → tạo `lzc16.spice`.

> **Quan trọng**: Xschem xuất port dưới dạng **bus** (`input wire [15:0] A`, `output wire [4:0] Y`). Các file SDC trong `opensta/*.tcl` và testbench [`tb_lzc16.v`](frontend/iverilog/tb_lzc16.v) đã được viết theo bus-form nên **khớp được**. Đừng sửa tay sang flat-form (`A15..A0`) vì sẽ phá STA.

Sau khi xuất lại, đồng bộ netlist sang các thư mục dùng:

```bash
cp lzc16.v       ../iverilog/lzc16.v
cp lzc16.v       ../opensta/lzc16.v
cp lzc16.spice   ../../backend/netgen/lzc16.spice    # cho LVS
```

Chụp screenshot `lzc2.sch`, `lzc4.sch`, `lzc8.sch`, `lzc16.sch` lưu vào `images/sch_lzc{2,4,8,16}.png`.

---

## 3. FRONTEND — Static Timing Analysis (OpenSTA)

Mục tiêu: lấy critical path, max clock, power cho bảng metrics trong report.

> **Yêu cầu**: `opensta/lzc16.v` phải đồng bộ với `xschem/lzc16.v` (bước 2). Cả SDC ([`lzc16.tcl`](frontend/opensta/lzc16.tcl), [`lzc16_max.tcl`](frontend/opensta/lzc16_max.tcl), [`lzc16_1mhz.tcl`](frontend/opensta/lzc16_1mhz.tcl)) và netlist đều theo bus-form `A[15:0]`, `Y[4:0]`. Nếu OpenSTA log báo `port 'A[15]' not found` hoặc `No paths found.` → netlist trong `opensta/` đang là phiên bản flat cũ, chạy lại `cp ../xschem/lzc16.v ./lzc16.v`.

```bash
cd ../opensta

# Critical path + max clock
sta -no_init lzc16_max.tcl  | tee lzc16_run2.log

# Power @ 1 MHz (bảng metrics)
sta -no_init lzc16_1mhz.tcl | tee lzc16_run3.log

# Sanity check @ 10 ns
sta -no_init lzc16.tcl      | tee lzc16_run1.log
```

Ghi lại các con số: **critical path delay**, **max clock (MHz)**, **power @ 1 MHz**, **power @ max clock**. Chúng sẽ điền vào bảng metrics cuối report.

Số tham chiếu hiện tại (sau khi sync netlist bus-form):

| Run | Period | Slack | Total power |
|---|---|---|---|
| `lzc16_run1.log` | 10 ns (100 MHz) | +8.49 ns MET | 5.71 µW |
| `lzc16_run2.log` | 1.51 ns (max) | +0.40 ns MET | 37.8 µW |
| `lzc16_run3.log` | 1000 ns (1 MHz) | +998.49 ns MET | 0.057 µW |

---

## 4. BACKEND — Layout (Magic)

Mục tiêu: mở layout đã đặt 46 cells; nếu cần đặt lại từ đầu thì chạy `place2.tcl`.

```bash
cd ../../backend/magic
magic -d XR -T sky130A lzc16 &
```

Trong cửa sổ `tkcon`:

```tcl
view          ;# zoom hiển thị toàn bộ 46 cells
expand        ;# bung transistor bên trong các cell
```

Nếu muốn đặt lại từ đầu:

```bash
rm lzc16.mag
magic -d XR -T sky130A &
```
```tcl
source place2.tcl
save lzc16
view
```

---

## 5. BACKEND — Routing + Power rails

Routing được chia làm nhiều pha (tcl scripts đã có sẵn). Trong tkcon Magic:

```tcl
source route_p1.tcl    ;# pha 1
source route_p1b.tcl   ;# pha 1 fix
source route_p2.tcl    ;# pha 2
source route_p3.tcl    ;# pha 3
source route_p3fix.tcl ;# pha 3 fix
source add_ports.tcl   ;# label cho 16 input A và 5 output Y ở biên
source add_ports2.tcl
save lzc16
```

Yêu cầu: 16 port `A[15:0]` ở một biên, 5 port `Y[4:0]` ở biên đối diện, VPWR/VGND straps nối đủ 7 hàng.

---

## 6. BACKEND — DRC

Trong tkcon:

```tcl
drc check
drc count
;# Mong đợi: Total DRC errors found: 0
```

Chụp ảnh kết quả DRC = 0 lưu vào `images/drc_result.png`.

---

## 7. BACKEND — Extract netlist + Parasitic (RCX)

Dùng script đã có:

```bash
cd /home/me/workspace/group-02-vlsi-16-bit-zlc-counter/backend/magic
./netlist lzc16
# Sinh ra: lzc16.spice (flat) và lzc16.rcx.spice (có parasitic R/C)
```

---

## 8. BACKEND — LVS (Netgen)

```bash
cd ../netgen
./lvs lzc16
# Mong đợi: Final result: Circuits match uniquely!
```

Script `lvs` đọc trực tiếp:
- **Schematic side:** `frontend/xschem/lzc16.spice` (top `**.subckt` / `*+` continuation tự động được un-comment + bus-pin commas → spaces khi build `.xschem_wrapper.spice`).
- **Layout side:** `backend/magic/lzc16.spice` (sinh từ bước 7).

Đối chiếu mong đợi (4 mức phân cấp):

| Cell  | Devices (sch ↔ lay) | Nets | Kết quả |
|-------|---------------------|------|---------|
| lzc2  | 2 ↔ 2               | 6    | match   |
| lzc4  | 5 ↔ 5               | 13+  | match   |
| lzc8  | 6 ↔ 6               | 18+  | match   |
| lzc16 | 12 ↔ 12             | 36   | match   |

Nếu báo mismatch → kiểm tra lại routing/port labels rồi chạy lại bước 7 và 8.

---

## 9. VALIDATION — Post-layout simulation (ngspice)

Mục tiêu: kiểm tra layout sau extract chạy đúng chức năng với parasitic R/C.

```bash
cd ../ngspice
ngspice -b -r lzc16.rcx.raw lzc16_tb.spice

# Xem dạng sóng
gaw lzc16.rcx.raw &
```

Testbench `lzc16_tb.spice` kích thích `IN3` (≡ `A[3]`) bằng xung 0→1.8V tại 2 ns, 1.8V→0 tại 12 ns; các bit khác giữ 0. Mong đợi:

| t       | A     | Y (decimal = 16−leading-zeros mapping) | COUNT4 | COUNT3 | COUNT2 | COUNT1 | COUNT0 |
|---------|-------|----------------------------------------|--------|--------|--------|--------|--------|
| 1 ns    | 0x0000 | 16 (`10000`) | 1.8 V | 0 | 0 | 0 | 0 |
| 7 ns    | 0x0008 | 12 (`01100`) | 0     | 1.8 V | 1.8 V | 0 | 0 |
| 15 ns   | 0x0000 | 16 (`10000`) | 1.8 V | 0 | 0 | 0 | 0 |

(`COUNT0..4` được khai báo trong TB theo thứ tự port của subckt: `Y[0] Y[1] Y[4] Y[3] Y[2]`.)

---

## 10. VALIDATION — Tổng hợp metrics cho report

Lấy số từ các bước trước điền vào bảng:

| Throughput (Mops/s) | Max clock (MHz) | Power @ 1 MHz (µW) | Power @ max clock (µW) | Layout area (µm²) | Aspect ratio (W:H) |
|---|---|---|---|---|---|
| (= Max clock) | step 3 | step 3 | step 3 | step 4 (W × H) | step 4 (W:H) |

- **Throughput** = max clock (vì là combinational, 1 op/cycle).
- **Layout area** đo từ Magic (`box` hoặc xem `lzc16.def`).
- **Aspect ratio** = W : H của bounding box layout.

---

## 11. Đóng gói nộp bài

```bash
cd /home/me/workspace
zip -r group-02-vlsi-16-bit-zlc-counter.zip group-02-vlsi-16-bit-zlc-counter \
    -x 'group-02-vlsi-16-bit-zlc-counter/sky130_adder_4bit/*' \
       'group-02-vlsi-16-bit-zlc-counter/.git/*'
```

Nộp file `.zip` cùng với report PDF.

---

## Phân công nhanh theo team

| Team | Bước phụ trách | Tools |
|---|---|---|
| Frontend | 1, 2, 3 | iverilog, gtkwave, xschem, OpenSTA |
| Backend  | 4, 5, 6, 7, 8 | Magic, Netgen |
| Validation | 9, 10, 11 + report | ngspice, gaw, OpenSTA (đọc lại log) |
