module alu(control_bit,alu_in_1,alu_in_2,alu_out,z_val);
input [1:0] control_bit;
input [15:0] alu_in_1,alu_in_2;
output [15:0] alu_out;
output z_val;
reg [15:0]alu_result;

assign alu_out=alu_result[15:0];
assign z_val=(alu_result==16'b0)?1'b1:1'b0;
always @(*) begin
if(control_bit==2'b00) alu_result=alu_in_1+alu_in_2;
else if(control_bit==2'b01) alu_result=alu_in_1-alu_in_2;
else alu_result=~(alu_in_1 & alu_in_2);
end
endmodule 

