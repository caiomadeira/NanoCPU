if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vcom nanoCPU.vhd
vcom nanoTB.vhd

#vsim -voptargs=+acc=lprn -t ps work.nanoCPU_TB
# Especificando nanosegundos ao inves de picosegundos
vsim -voptargs=+acc=lprn -t ns work.nanoCPU_TB

do wave.do

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

# Aqui, executa a simulação
run 300  ns ;# configura o tempo de simulação

