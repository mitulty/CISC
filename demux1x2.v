module demux1x2(in,o1,o2,reg_out,sel);
input [15:0] in;
output [15:0] o1,o2; 
input sel,reg_out;
assign o1=(reg_out==1'b1 && sel==1'b0)?in:16'bz;//-----Reg_To_Bus_A
assign o2=(reg_out==1'b1 && sel==1'b1)?in:16'bz;//-----Reg_To_Bus_B
endmodule 