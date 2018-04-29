onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib simple_led_opt

do {wave.do}

view wave
view structure
view signals

do {simple_led.udo}

run -all

quit -force
