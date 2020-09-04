module min_proc(clk,rst);
input clk,rst;
wire [114:0] ctrl_lines;
wire [33:0] cwr;
wire [15:0] IRF_out,IRE_out;
wire [15:0] EDB,EAB;
wire z_flag,load_IRF,load_IRE,load_data,ctrl_data_out;

datapath dt(clk,rst,ctrl_lines,z_flag,EAB,EDB);

reg_IR IRF(clk,rst,load_IRF,EDB,IRF_out);
assign load_IRF=cwr[8];

reg_IR IRE(clk,rst,load_IRE,IRF_out,IRE_out);
assign load_IRE=cwr[7];

memory mem(EDB,EAB,load_data,clk,ctrl_data_out);
assign load_data=cwr[32];
assign ctrl_data_out=cwr[33];
controller ctr(clk,rst,z_flag,IRF_out,cwr);

control_line_gen clg(IRE_out,cwr,ctrl_lines);
endmodule
