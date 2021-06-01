onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fourbit_opt

do {wave.do}

view wave
view structure
view signals

do {fourbit.udo}

run -all

quit -force
