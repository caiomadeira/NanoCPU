onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color White /nanoCPU_TB/CPU/ck
add wave -noupdate -color White /nanoCPU_TB/CPU/rst

add wave -noupdate -divider memoria
add wave -noupdate -color White       /nanoCPU_TB/CPU/we
add wave -noupdate -radix unsigned /nanoCPU_TB/CPU/address
add wave -noupdate -radix unsigned /nanoCPU_TB/CPU/dataR
add wave -noupdate -radix unsigned /nanoCPU_TB/CPU/dataW

add wave -noupdate -divider {estado e inst}
add wave -noupdate /nanoCPU_TB/CPU/state
add wave -noupdate /nanoCPU_TB/CPU/inst

add wave -noupdate -divider {PC e IR}
add wave -noupdate -radix unsigned /nanoCPU_TB/CPU/i
add wave -noupdate -radix unsigned /nanoCPU_TB/CPU/IR
add wave -noupdate -radix unsigned /nanoCPU_TB/CPU/PC

add wave -noupdate -divider registradores
add wave -noupdate -color Yellow -radix unsigned /nanoCPU_TB/CPU/reg(0)
add wave -noupdate -color Yellow -radix unsigned /nanoCPU_TB/CPU/reg(1)
add wave -noupdate -color Yellow -radix unsigned /nanoCPU_TB/CPU/reg(2)
add wave -noupdate -color Yellow -radix unsigned /nanoCPU_TB/CPU/reg(3)

add wave -noupdate -divider memoria

add wave -noupdate -radix unsigned /nanoCPU_TB/CPU/we
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(20)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(21)

add wave -noupdate -radix unsigned /nanoCPU_TB/memory(0)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(1)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(2)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(3)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(4)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(5)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(6)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(7)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(8)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(9)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(10)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(11)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(12)
add wave -noupdate -radix unsigned /nanoCPU_TB/memory(13)