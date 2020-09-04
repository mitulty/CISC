module controller(clk,rstn,z_flag,IRF_val,control_word);
input clk,rstn;
input z_flag;
input [15:0] IRF_val;
output wire [33:0] control_word;
wire [33:0] control_word_rom;
wire [4:0] micro_address,address;
sequencing_logic sl(IRF_val,control_word,z_flag,micro_address);
control_store_rom csr(micro_address,control_word_rom);
reg_CW control_word_register(clk,rstn,1'b1,control_word_rom,control_word);
reg_CAR control_address_register(clk,rstn,1'b1,micro_address,address);
endmodule 