module memory(inout [15:0] din_out,input [15:0] address,input load,clk,ctrl);
reg [15:0] mem [255:0];
integer i;
wire [15:0] data;
initial 
$readmemb("/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/memory.txt",mem);
genvar j;
generate for(j=0;j<16;j=j+1) begin: loop
bufif1(din_out[j],data[j],ctrl);
end
endgenerate
assign data = mem[address];
always @(posedge clk) begin
if(load) mem[address]=din_out;
end
always @(mem) begin
for(i=0;i<=255;i=i+1)             
$display ("Memory[%d]=%h",i,mem[i]);
end	
endmodule 