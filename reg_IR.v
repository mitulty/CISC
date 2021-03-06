module reg_IR(clk,rstn,Load,data_in,data_out);
input clk,rstn,Load;
input [15:0] data_in;
output [15:0] data_out;
reg [15:0] d;
always @(posedge clk) begin
if(rstn==1'b0) d={16{1'b1}};
else if(Load==1'b1) d=data_in;
else d=data_out;
end
assign data_out=d;
endmodule 