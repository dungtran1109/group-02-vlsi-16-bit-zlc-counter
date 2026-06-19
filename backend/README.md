# Backend

---

**Công việc:**
- Layout bằng Magic
- Routing + power rails
- Chạy DRC
- LVS
- Extract parasitic

---

## 🛠️ Hướng dẫn thực hiện (Guidelines)

### 1. Netlist export

Return to the terminal, and export the netlist of the lzc16 counter in the magic directory:

```bash
$ ./netlist lzc16
...
lzc16.spice lzc16.rcx.spice created successfully!
```
### 1. Layout vs schematic (LVS)
Change the working directory to netgen and perform the LVS on the 16 bit leading zero counter circuit:
```bash
$cd ../netgen$ ./lvs lzc16
...
-----------------------------------------
Finish comparing spice netlist of lzc16 between:
Circuit 1: group-02-vlsi-16-bit-zlc-counter/backend/netgen/lzc16.spice (last modified: 2026-06-19 15:30:00)
Circuit 2: group-02-vlsi-16-bit-zlc-counter/backend/magic/lzc16.spice (last modified: 2026-06-19 16:15:22)
Final result: Circuits match uniquely!
Report file: lzc16.log
-----------------------------------------
