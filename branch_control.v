module branch_control(nx,z,bc);
input [4:0] nx;
input z;
output reg [4:0] bc;
always @(*) begin
if(z==1'b1 && nx==5'b11001) bc=5'b00110;
else bc=5'b00111;
end
endmodule 