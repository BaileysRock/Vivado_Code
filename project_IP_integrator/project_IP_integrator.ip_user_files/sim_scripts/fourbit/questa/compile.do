vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  \
"../../../bd/fourbit/ipshared/2836/sources_1/new/D_trigger.v" \
"../../../bd/fourbit/ip/fourbit_D_trigger_0_0/sim/fourbit_D_trigger_0_0.v" \
"../../../bd/fourbit/ip/fourbit_D_trigger_1_1/sim/fourbit_D_trigger_1_1.v" \
"../../../bd/fourbit/ip/fourbit_D_trigger_2_0/sim/fourbit_D_trigger_2_0.v" \
"../../../bd/fourbit/ip/fourbit_D_trigger_3_0/sim/fourbit_D_trigger_3_0.v" \
"../../../bd/fourbit/sim/fourbit.v" \


vlog -work xil_defaultlib \
"glbl.v"

