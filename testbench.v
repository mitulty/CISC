`timescale 1ns/1ps
module testbench;
reg clk,rstn;

wire [113:0] control_lines=my_pro.ctrl_lines;
wire [4:0] cwr=my_pro.ctr.address;
wire [15:0] PC=my_pro.dt.pc_out;
wire [15:0] R_data_out[31:0];
wire [15:0] IRE=my_pro.IRE_out;
wire [15:0] IRF=my_pro.IRF_out;
wire [15:0] Bus_A=my_pro.dt.internal_bus_A;
wire [15:0] Bus_B=my_pro.dt.internal_bus_B;
wire [33:0] control_store_rom[24:0];
wire [15:0] EAB=my_pro.EAB;
wire [15:0] EDB=my_pro.EDB;
wire load_IRF=my_pro.load_IRF;
wire load_IRE=my_pro.load_IRE;
reg [5*8:1] State_Name;

genvar i;
generate for(i=0;i<32;i=i+1) begin:loop
assign R_data_out[i]=my_pro.dt.R_data_out[i];
end
endgenerate
generate for(i=0;i<=24;i=i+1) begin:loop_2
assign control_store_rom[i]=my_pro.ctr.csr.csr_word[i];
end
endgenerate

min_proc my_pro(clk,rstn);

initial begin
clk = 1;
rstn=1;
end

always @(cwr) begin
if(cwr==5'b00000) State_Name="ABDM1";
else if(cwr==5'b00001) State_Name="ABDM2";
else if(cwr==5'b00010) State_Name="ABDM3";
else if(cwr==5'b00011) State_Name="ABDM4";
else if(cwr==5'b00100) State_Name="ADRM1";
else if(cwr==5'b00101) State_Name="BRZZ1";
else if(cwr==5'b00110) State_Name="BRZZ2";
else if(cwr==5'b00111) State_Name="BRZZ3";
else if(cwr==5'b01000) State_Name="LDRM1";
else if(cwr==5'b01001) State_Name="LDRM2";
else if(cwr==5'b01010) State_Name="OPRM1";
else if(cwr==5'b01011) State_Name="OPRM2";
else if(cwr==5'b01100) State_Name="STRM1";
else if(cwr==5'b01101) State_Name="TEST1";
else if(cwr==5'b01110) State_Name="POPR1";
else if(cwr==5'b01111) State_Name="POPR2";
else if(cwr==5'b10000) State_Name="PUSH1";
else if(cwr==5'b10001) State_Name="PUSH2";
else if(cwr==5'b10010) State_Name="LDRR1";
else if(cwr==5'b10011) State_Name="STRR1";
else if(cwr==5'b10100) State_Name="OPRR1";
else if(cwr==5'b10101) State_Name="OPRR2";
else if(cwr==5'b10110) State_Name="PSRR1";
else if(cwr==5'b10111) State_Name="PSRR2";
else  State_Name="HALT1";
end
always begin
clk = ~clk;
#25;
end
initial begin #1600 $stop; end
initial begin
#10;
rstn=0;
#30;
rstn=1;
end
endmodule
