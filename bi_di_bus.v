module bi_di_bus(in1,in2,ctrl,out);
output [15:0] out;
input [15:0] in2;
inout [15:0] in1;
input ctrl;

bufif1 buffer1(in1,in2,ctrl);
bufif1 buffer2(out,in1,~ctrl);
endmodule
