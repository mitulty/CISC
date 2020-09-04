module mux2x1(in1,in2,sel,out);
input [15:0] in1,in2;
output reg [15:0] out;
input sel;

always @(*) begin
if(sel==1'b0) out=in1;
else out=in2;
end
endmodule 