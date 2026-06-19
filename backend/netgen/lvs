if [ -z "$1" ]; then
    echo "Usage: lvs <circuit_name>"
    exit 0
fi

T=$1
C1=$(realpath -m "../xschem/$1.spice")
C2=$(realpath -m "../magic/$1.spice")
C1W=$(realpath -m "./.xschem_wrapper.spice")
R=$1.log
S=$PDK_ROOT/$PDK/libs.tech/netgen/${PDK}_setup.tcl

if [ ! -f $C1 ]; then
  echo "Error: File $C1 not found"
  exit 1
fi

if [ ! -f $C2 ]; then
  echo "Error: File $C2 not found"
  exit 1
fi

rm "$R"

echo ".include $PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice" > $C1W
echo ".include $C1" >> $C1W

netgen -batch lvs "$C1W $T" "$C2 $T" $S $R

if [ ! -f $R ]; then
  exit 1
fi

if grep -q "Circuits match uniquely." "$R"; then
    Result="Circuits match uniquely!"
else
    Result="Circuits mismatch!"
fi

echo ----------------------------------------- | tee -a "$R"
echo Finish comparing spice netlist of $T between: | tee -a "$R"
echo "Circuit 1: $C1 (last modified: $(date -r $C1 "+%Y-%m-%d %H:%M:%S"))" | tee -a "$R"
echo "Circuit 2: $C2 (last modified: $(date -r $C2 "+%Y-%m-%d %H:%M:%S"))" | tee -a "$R"
echo Final result: $Result | tee -a "$R"
echo Report file: "$R" | tee -a "$R"
echo ----------------------------------------- | tee -a "$R"
