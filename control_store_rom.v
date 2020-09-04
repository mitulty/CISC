module control_store_rom(address,data_out);
input [4:0] address;
output [33:0] data_out;
reg [33:0] csr_word[24:0];
initial $readmemb("/home/morack/intelFPGA_lite/18.1/Verilog_Codes/MIN_Processor/control_store.txt",csr_word);
assign data_out=csr_word[address];
endmodule 