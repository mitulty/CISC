transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/reg_Nbit.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/min_proc.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/datapath.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/alu.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/mux2x1.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/mux4x1.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/demux1x2.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/controller.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/ins_decoder.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/control_mux.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/branch_control.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/control_line_gen.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/reg_IR.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/sequencing_logic.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/reg_CW.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/reg_CAR.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/control_store_rom.v}
vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/memory.v}

vlog -vlog01compat -work work +incdir+/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor {/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
add wave sim:/testbench/my_pro/ctr/sl/*
add wave sim:/testbench/my_pro/dt/*
view structure
view signals
run -all
