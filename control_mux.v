module control_mux(in1,in2,in3,in4,sel,out);
input [4:0] in1,in2,in3,in4;
input [1:0] sel;
output reg [4:0] out;

always @(*) begin
if(sel==2'b11) out=in1;
else if(sel==2'b10) out=in2;
else if(sel==2'b01) out=in3;
else out=in4;
end
endmodule 