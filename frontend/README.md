# 🔢 16-bit Zero Leading Counter (ZLC) — SKY130A ASIC Design

> A high-performance combinational 16-bit leading zero counter implemented using **sky130_fd_sc_hd** standard cell library on the open-source SKY130A PDK.

![PDK](https://img.shields.io/badge/PDK-sky130A-green)
![DRC](https://img.shields.io/badge/DRC-clean-brightgreen)
![Sim](https://img.shields.io/badge/simulation-5007%2F5007%20PASS-brightgreen)
![MaxClock](https://img.shields.io/badge/max%20clock-662%20MHz-blue)
![Cells](https://img.shields.io/badge/cells-46-orange)

---

## 📋 Table of Contents

1. [What is ZLC?](#what-is-zlc)
2. [Architecture](#architecture)
3. [Results](#results)
4. [File Structure](#file-structure)
5. [How to Run (Step by Step)](#how-to-run-step-by-step)
6. [Tools Required](#tools-required)

---

## What is ZLC?

The **Zero Leading Counter** counts consecutive zero bits from the **MSB** of a 16-bit input.

```
Input:  0001 0110 0010 0000  →  Output: 3  (3 leading zeros)
Input:  0000 0000 0000 0000  →  Output: 16 (all zeros)
Input:  1111 1111 1111 1111  →  Output: 0  (MSB is 1)
Input:  0000 0000 0000 0001  →  Output: 15 (only bit 0 is 1)
```

**Interface:**
- Input  : `A[15:0]` — 16-bit data
- Output : `Y[4:0]`  — leading zero count (0 to 16)

---

## Architecture

### Tree Structure

```
A[15:0]
   │
   ├─ A[15:14] ─► lzc2 #0 ─┐
   ├─ A[13:12] ─► lzc2 #1 ─┤─► lzc4 #0 ─┐
   ├─ A[11:10] ─► lzc2 #2 ─┤              │
   ├─ A[9:8]   ─► lzc2 #3 ─┘─► lzc4 #1 ─┤─► lzc8_L ─┐
   │                                       │             │
   ├─ A[7:6]   ─► lzc2 #4 ─┐              │             │
   ├─ A[5:4]   ─► lzc2 #5 ─┤─► lzc4 #2 ─┘             │
   ├─ A[3:2]   ─► lzc2 #6 ─┤              ─► lzc4 #3 ──┤─► lzc8_R ─┐
   └─ A[1:0]   ─► lzc2 #7 ─┘                            │             │
                                                          │             ▼
                                                          └──────► lzc16 ──► Y[4:0]
```

### Combine Logic (at each level)

```verilog
V   = vL | vR        // any '1' in either half?
sel = ~vL            // left half all-zero → look right
P_high = sel
P_low  = sel ? pR : pL
```

### Standard Cells Used

| Cell | Count | Role |
|------|-------|------|
| `sky130_fd_sc_hd__or2_1`  | 15 | Valid bit (V = vL OR vR) |
| `sky130_fd_sc_hd__inv_1`  | 16 | Select signal (sel = ~vL) |
| `sky130_fd_sc_hd__mux2_1` | 11 | Position mux |
| `sky130_fd_sc_hd__and2_1` |  4 | Output gating |
| **Total** | **46** | |

---

## Results

### ⚡ Timing

| Metric | Value |
|--------|-------|
| Critical path | 1.31 ns |
| **Max clock rate** | **662 MHz** |
| **Throughput** | **662 Mops/s** |
| Setup slack @ 10ns | +8.49 ns ✅ |
| Hold slack | +0.40 ns ✅ |

Critical path: `A3 → or2 → inv → mux → and2 → Y0`

### 🔋 Power

| Frequency | Power |
|-----------|-------|
| 1 MHz | **0.057 µW** |
| 100 MHz | 5.71 µW |
| 662 MHz (max) | **37.8 µW** |

### 📐 Layout

| Metric | Value |
|--------|-------|
| Area | **~604 µm²** |
| Width × Height | 26.96 × 22.40 µm |
| Aspect ratio | **1.20 : 1** |
| Rows | 7 rows × 340 λ |
| DRC errors | **0** ✅ |
| LVS device match | **46 / 46** ✅ |

### ✅ Simulation

| Test | Result |
|------|--------|
| Directed test cases | 7 / 7 ✅ |
| Random test cases | 5000 / 5000 ✅ |
| **Total** | **5007 / 5007 PASS** ✅ |

---

## File Structure

```
frontend/
├── xschem/                     ← Schematic (Xschem)
│   ├── lzc2.sch  + lzc2.sym    # Leaf cell — 2-bit
│   ├── lzc4.sch  + lzc4.sym    # Level 1  — 4-bit
│   ├── lzc8.sch  + lzc8.sym    # Level 2  — 8-bit
│   ├── lzc16.sch + lzc16.sym   # Top level — 16-bit
│   ├── lzc16.v                 # Exported structural netlist
│   └── tb_lzc16.v              # Testbench
│
├── iverilog/                   ← Functional Simulation
│   ├── lzc16_tb.v              # Self-checking testbench
│   ├── zlc_ref.v               # Golden reference model
│   └── lzc16.vcd               # Waveform output
│
├── opensta/                    ← Static Timing Analysis
│   ├── lzc16_max.tcl           # STA at max frequency (1.51ns)
│   ├── lzc16_1mhz.tcl          # Power analysis at 1 MHz
│   ├── lzc16.tcl               # STA at 10ns period
│   └── *.log                   # Results logs
│
├── magic/                      ← Physical Layout (Magic)
│   ├── lzc16.mag               # Layout — 46 cells placed
│   ├── place2.tcl              # Placement script
│   └── lzc16.spice             # Extracted netlist
│
└── README_handoff.md           ← Guide for backend engineer
```

---

## How to Run (Step by Step)

### Prerequisites — Install OSIC Debian VM

All tools are pre-installed in the **OSIC Debian VM** (VirtualBox).  
PDK location: `/usr/local/share/pdk/sky130A/`

---

### Step 1 — Clone the Repository

```bash
git clone https://github.com/dungtran1109/group-02-vlsi-16-bit-zlc-counter.git
cd group-02-vlsi-16-bit-zlc-counter/frontend
```

---

### Step 2 — Run Functional Simulation

```bash
cd iverilog/

# Compile
iverilog -g2012 -o lzc16_sim \
    lzc16.v lzc16_tb.v zlc_ref.v \
    /usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v \
    /usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v

# Run simulation
vvp lzc16_sim
```

**Expected output:**
```
------ TEST PASSED: all 5007 cases match ------
```

```bash
# View waveform
gtkwave lzc16.vcd &
```

---

### Step 3 — Run Static Timing Analysis

```bash
cd opensta/

# Max frequency STA
sta lzc16_max.tcl
```

**Expected output:**
```
Critical path: 1.31 ns
Max clock: 662 MHz
Setup slack: MET
```

```bash
# Power at 1 MHz
sta lzc16_1mhz.tcl
# Expected: Total power ≈ 0.057 µW
```

---

### Step 4 — Open Schematic in Xschem

```bash
cd xschem/

# Open top-level schematic
xschem lzc16.sch &
```

Navigate hierarchy:
- Click on `lzc8` symbol → `E` to descend
- Click on `lzc4` symbol → `E` to descend
- Click on `lzc2` symbol → `E` to descend
- Press `Ctrl+E` to go back up

---

### Step 5 — Open Layout in Magic

```bash
cd magic/

# Open layout with sky130A technology
magic -d XR -T sky130A lzc16 &
```

In the **tkcon** window:
```tcl
view          # zoom to fit all cells
expand        # show transistor details
drc check     # verify DRC = 0
drc count     # should show 0 errors
```

---

### Step 6 — Re-run Placement (if needed)

```bash
cd magic/
magic -d XR -T sky130A &
```

In tkcon:
```tcl
source place2.tcl   # place all 46 cells
save lzc16          # save layout
view                # zoom fit
```

---

### Step 7 — Extract Netlist & Check LVS

In Magic tkcon:
```tcl
extract all
ext2spice hierarchy on
ext2spice
```

Then run LVS:
```bash
cd netgen/
netgen -batch lvs \
  "../magic/lzc16.spice lzc16" \
  "../xschem/lzc16.spice lzc16" \
  /usr/local/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl \
  lzc16_lvs.out

cat lzc16_lvs.out | grep "Final result"
# Circuit 1: 46 devices  Circuit 2: 46 devices → MATCH ✅
```

---

## Tools Required

| Tool | Version | Purpose |
|------|---------|---------|
| **Magic VLSI** | 8.3+ | Layout editor |
| **Xschem** | 3.4+ | Schematic capture |
| **iverilog** | 11+ | Verilog simulation |
| **GTKWave** | 3.3+ | Waveform viewer |
| **OpenSTA** | 2.6+ | Static timing analysis |
| **Netgen** | 1.5+ | LVS verification |
| **sky130A PDK** | 1.0.582 | Process design kit |

Install all tools via **OSIC Debian VM**:  
https://iic-jku.github.io/iic-osic-tools/

---

## Liberty File

```
/usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/
sky130_fd_sc_hd__tt_025C_1v80.lib
```
Corner: **Typical-Typical, 25°C, 1.8V**

---

*Built with open-source EDA: Magic · Xschem · iverilog · OpenSTA · Netgen · SKY130A PDK*
