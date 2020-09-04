module control_line_gen(ins,cwr,ctrl_line);
input [15:0] ins;
input [33:0] cwr;
output [114:0] ctrl_line;
reg [1:0] alu_op_bit;
reg [31:0] load_Reg,Reg_to_Bus;
reg [31:0] Bus_select;

assign ctrl_line={cwr[31:27],cwr[25:14],alu_op_bit,load_Reg,Reg_to_Bus,Bus_select};

//---------------------------------ALU Operation Select-----------------------
always @(*) begin
if(cwr[26]==1'b1) alu_op_bit=2'b00;//ADD
else if(cwr[26]==1'b0) begin
if(ins[15:12]==4'b0000) alu_op_bit=2'b00;//--ADD Ins 
else if(ins[15:12]==4'b0001) alu_op_bit=2'b01;//--SUB Ins
else alu_op_bit=2'b11;//--NAND Ins
end
end

//---------------------------------Reg File Input{13:12}-----------------------
always @(*) begin
load_Reg={32{1'b0}};
if(cwr[13:12]==2'b00) load_Reg={32{1'b0}};
else if(cwr[13:12]==2'b01) load_Reg[ins[4:0]]=1'b1;
else if(cwr[13:12]==2'b10) load_Reg[ins[11:7]]=1'b1;
else 	begin load_Reg[ins[4:0]]=1'b1;load_Reg[ins[11:7]]=1'b1;end
end

//---------------------------------Reg File Output{11:9}-----------------------
always @(*) begin
Reg_to_Bus={32{1'b0}};Bus_select={32{1'b0}};
if(cwr[11:9]==3'b000) begin Reg_to_Bus[ins[11:7]]=1'b1;Bus_select[ins[11:7]]=1'b0; end//Rx-->Bus_A
else if(cwr[11:9]==3'b001) begin Reg_to_Bus[ins[11:7]]=1'b1;Bus_select[ins[11:7]]=1'b1; end //Rx-->Bus_B
else if(cwr[11:9]==2'b010) begin Reg_to_Bus[ins[4:0]]=1'b1;Bus_select[ins[4:0]]=1'b0; end//Ry-->Bus_A
else if(cwr[11:9]==3'b011) begin Reg_to_Bus[ins[4:0]]=1'b1;Bus_select[ins[4:0]]=1'b1; end //Ry-->Bus_B
else if(cwr[11:9]==3'b111)	begin Reg_to_Bus[ins[4:0]]=1'b1;Reg_to_Bus[ins[11:7]]=1'b1;Bus_select[ins[4:0]]=1'b1;Bus_select[ins[11:7]]=1'b0; end//-----Both Rx-->Bus_A,Ry-->Bus_B
else begin Reg_to_Bus={32{1'b0}};Bus_select={32{1'b0}}; end //No transfer
end
endmodule		