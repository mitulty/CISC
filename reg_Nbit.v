module reg_Nbit(clk,rstn,Load,data_in,data_out);
parameter N=4;
input clk,rstn,Load;
input [N-1:0] data_in;
output [N-1:0] data_out;
reg [N-1:0] d;
always @(posedge clk) begin
if(rstn==1'b0) d<={N{1'b0}};
else if(Load==1'b1) d<=data_in;
else d<=data_out;
end
assign data_out=d;
endmodule 