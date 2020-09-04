module sequencing_logic(ins,cbr,z_flag,addr);
input [32:0] cbr;
input [15:0] ins;
input z_flag;
output [4:0] addr;
wire [4:0] IB,SB,DB,BC,NA;
wire [1:0] TY;
assign TY=cbr[6:5];
assign NA=cbr[4:0];
assign DB=cbr[4:0];

ins_decoder ind(ins,IB,SB);
branch_control bctrl(NA,z_flag,BC);
control_mux mx(IB,SB,BC,DB,TY,addr);
endmodule 