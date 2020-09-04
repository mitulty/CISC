module datapath(clk,rstn,control_word,z_flag_out,EAB,EDB);
input clk,rstn;
input [114:0] control_word;
inout wor [15:0] EDB;
output wor [15:0] EAB;
output z_flag_out;
wire load_pc,load_T1,load_T2,load_z_flag,z_flag_in,pc_to_bus_A,T1_to_bus_B,T1_to_bus_A,T2_to_bus_B,T2_to_bus_A,bus_B_to_T2,load_din,din_to_bus_B,buf_AO_sel,AO_ctrl,DO_ctrl;
wire [1:0] sel_alu_in2,ctrl_bit;
wor [15:0] internal_bus_A;
wor [15:0] internal_bus_B;
wire [15:0] alu_in2;
wire [31:0] reg_ctrl_output;
wire [15:0] T1_data_out;
wire [15:0] T2_data_in,T2_data_out;
wire [15:0] pc_in,pc_out;
wire [15:0] din_out,buf_AO_in;
wire [31:0] load_R,Bus_select;
wire [15:0] R_data_in[31:0];
wire [15:0] R_data_out[31:0];
wire [15:0] result; 
genvar i;
//--------------------------Control Word------------------------------------
assign load_pc=control_word[114];
assign pc_to_bus_A=control_word[113];
assign load_T1=control_word[112];
assign T1_to_bus_A=control_word[111];
assign T1_to_bus_B=control_word[110];
assign sel_alu_in2=control_word[109:108];
assign load_z_flag=control_word[107];
assign load_T2=control_word[106];
assign T2_to_bus_B=control_word[105];
assign T2_to_bus_A=control_word[104];
assign bus_B_to_T2=control_word[103];
assign load_din=control_word[102];
assign din_to_bus_B=control_word[101];
assign buf_AO_sel=control_word[100];
assign AO_ctrl=control_word[99];
assign DO_ctrl=control_word[98];
assign ctrl_bit=control_word[97:96];
assign load_R=control_word[95:64];
assign reg_ctrl_output=control_word[63:32];
assign Bus_select=control_word[31:0];
//----------------------------PC--------------------------------------------
reg_Nbit #(16) PC(clk,rstn,load_pc,pc_in,pc_out);
generate for(i=0;i<16;i=i+1) begin:pc_loop
bufif1 buf_pc_in(pc_in[i],internal_bus_B[i],load_pc);
bufif1 buf_pc_out(internal_bus_A[i],pc_out[i],pc_to_bus_A);
end
endgenerate
//----------------------------T1--------------------------------------------
reg_Nbit #(16) T1(clk,rstn,load_T1,result,T1_data_out);
generate for(i=0;i<16;i=i+1) begin:T1_loop
bufif1 buf1_T1_out(internal_bus_B[i],T1_data_out[i],T1_to_bus_B);
bufif1 buf2_T1_out(internal_bus_A[i],T1_data_out[i],T1_to_bus_A);
end 
endgenerate 
//----------------------------T2--------------------------------------------
reg_Nbit #(16) T2(clk,rstn,load_T2,T2_data_in,T2_data_out);
generate for(i=0;i<16;i=i+1) begin:T2_loop
bufif1 buf_T2_out_Bus_B(internal_bus_B[i],T2_data_out[i],T2_to_bus_B);
bufif1 buf_T2_out_Bus_A(internal_bus_A[i],T2_data_out[i],T2_to_bus_A);
bufif1 buf_T2_in(T2_data_in[i],internal_bus_B[i],bus_B_to_T2);
end
endgenerate

//----------------------------Reg_File--------------------------------------------
generate for(i=0;i<32;i=i+1) begin:reg_file_loop
reg_Nbit #(16) R(clk,rstn,load_R[i],R_data_in[i],R_data_out[i]);
mux2x1 mux_input(internal_bus_A,internal_bus_B,load_R[i],R_data_in[i]);
demux1x2 demux_output(R_data_out[i],internal_bus_A,internal_bus_B,reg_ctrl_output[i],Bus_select[i]);
end
endgenerate 

//----------------------------ALU--------------------------------------------
alu op(ctrl_bit,internal_bus_A,alu_in2,result,z_flag_in);
mux4x1 alu_mux(internal_bus_B,sel_alu_in2,alu_in2);
reg_Nbit #(1) Z_Flag(clk,rstn,load_z_flag,z_flag_in,z_flag_out);


//----------------------------DIN--------------------------------------------
reg_Nbit #(16) DIN(clk,rstn,load_din,EDB,din_out);
generate for(i=0;i<16;i=i+1) begin:DIN_loop
bufif1 buf_din_out(internal_bus_B[i],din_out[i],din_to_bus_B);
end
endgenerate
//-----------------------------BUFFERS-----------------------------------------
mux2x1 AO_input(internal_bus_A,internal_bus_B,buf_AO_sel,buf_AO_in);
generate for(i=0;i<16;i=i+1) begin:Buffers_loop
bufif1 buf_AO(EAB[i],buf_AO_in[i],AO_ctrl);
bufif1 buf_DO(EDB[i],internal_bus_A[i],DO_ctrl);
end
endgenerate
endmodule
