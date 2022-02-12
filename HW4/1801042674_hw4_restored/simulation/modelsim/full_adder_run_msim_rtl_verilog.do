transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/_4bit_adder.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/half_adder.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/_32bit_adder.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/_32bit_and.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/_32bit_or.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/_32bit_xor.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/_32bit_nor.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/_32bit_sub.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/_32bit_slt.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/_8x3mux.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/sign_extend.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/Control.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/ALU_control.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/mux_2X1.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/mux_2X1_32bit.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/MiniMIPS.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/mux_2X1_3bit.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/mips_registers.v}
vlog -vlog01compat -work work +incdir+C:/altera/1801042674_hw4_restored {C:/altera/1801042674_hw4_restored/data_memory.v}

