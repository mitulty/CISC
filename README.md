# CISC
This project is an implementation of Simple MIN Processor based on CISC Architecture.It is based on the concept of Microprogrammed Control Unit in which the the
control signals for the instructions are stored in a control store unit. The desing was developed using the "Hardware Flowchart Method". The following basic instructions
are implemented:
-> ADD
-> SUB
-> NAND
-> LOAD
-> STORE
-> POP
-> PUSH
-> BZ
-> TEST
-> NOP(No Operation)
-> HALT

The project includes a python program named "getprogram.py" which converts the assembly code into the machine language. The assembly code is written in the file
program.txt. The code for the processor is written in Verilog and the tools used for synthesis/simulation were Intel Quartus Prime and Modelsim.
