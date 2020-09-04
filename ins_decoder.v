module ins_decoder(instruction,IB,SB);
input [15:0] instruction;
output reg [4:0] IB,SB;

always @(*) begin
IB=5'b11111;
if(instruction[15:12]==4'b1111) IB=5'b11000;
else
if(instruction[15:12]==4'b1001) IB=5'b10110;
else
if(instruction[15:12]==4'b0111) IB=5'b00101;
else
if(instruction[6:5]==2'b00) IB=5'b00000;
else if(instruction[6:5]==2'b01) IB=5'b00100;
else begin
case(instruction[15:12])
4'b0000:IB=5'b10100;
4'b0001:IB=5'b10100;
4'b0010:IB=5'b10100;
4'b0011:IB=5'b01110;
4'b0100:IB=5'b10000;
4'b0101:IB=5'b10010;
4'b0110:IB=5'b10011;
endcase
end
end

always @(*) begin
SB=5'b00000;
case(instruction[15:12])
4'b0000:SB=5'b01010;
4'b0001:SB=5'b01010;
4'b0010:SB=5'b01010;
4'b0101:SB=5'b01000;
4'b0110:SB=5'b01100;
4'b1000:SB=5'b01101;
endcase
end

endmodule
