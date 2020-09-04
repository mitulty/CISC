module mux4x1(in1,sel,out);
input [15:0] in1;
output reg [15:0] out;
input [1:0] sel;

always @(*) begin
if(sel==2'b00) out=in1;
else if(sel==2'b01) out=1;
else if(sel==2'b10) out=0;
else out=-1;
end
endmodule 