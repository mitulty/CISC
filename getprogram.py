def assembler(instruction):
	machine_inst=""
	inst=instruction.split(" ")
	print(inst)
	if(inst[0]=='HALT'):
		machine_inst='1111000000000000'
	elif(inst[0]=='NOP'):
		machine_inst='1001000000000000'
	elif(inst[0][0]=='#'):
		print(inst[0][1:])
		d=(bin(int(inst[0][1:])))
		machine_inst=d[2:].zfill(16)
	else:			
		machine_inst+=opcode[(inst[0])]		
		if(inst[0]=='BZ'):
			machine_inst+='0000000'
			machine_inst+=register_dictionary[(inst[1])]
		elif(inst[0]=='TEST'):
			machine_inst+='00000'
			machine_inst+=addressing_mode[(inst[1])]
			machine_inst+=register_dictionary[(inst[2])]
		else:
			machine_inst+=register_dictionary[(inst[1])]
			if(inst[0]=='POP' or inst[0]=='PUSH'):
				machine_inst+=addressing_mode['AR']
			else:
				machine_inst+=addressing_mode[(inst[2])]
			machine_inst+=register_dictionary[(inst[3])]
	if(len(machine_inst)!=16):
		  raise Exception("Sorry,incorrect instruction")
	file1.write(machine_inst+"\n")
	print(machine_inst)
	
def getcode():
	count=0		 
	with open("program.txt",'r') as f:
		lines = list(line for line in (l.strip() for l in f) if line)
	for i in lines:
		if((i.split(";")[0])!=''):	
				count=count+1
				assembler((i.split(";")[0]).rstrip('\n'))
	return(count)
def fillempty(c):
	for i in range(256-c):
		file1.write("1111000000000000"+"\n")
register_dictionary={'R0':'00000','R1':'00001','R2':'00010','R3':'00011','R4':'00100','R5':'00101','R6':'00110','R7':'00111','R8':'01000','R9':'01001','R10':'01010','R11':'01011','R12':'01100','R13':'01101','R14':'01110', 'R15':'01111','R16':'10000','R17':'10001','R18':'10010','R19':'10011','R20':'10100','R21':'10101','R22':'10110','R23':'10111','R24':'11000','R25':'11001','R26':'11010','R27':'11011','R28':'11100','R29':'11101','R30':'11110', 'R31':'11111'}
opcode={'ADD':'0000','SUB':'0001','NAND':'0010','POP':'0011','PUSH':'0100','LOAD':'0101','STORE':'0110','BZ':'0111','TEST':'1000','NOP':'1001','HALT':'1111'}
addressing_mode={'AB':'00','AI':'01','AR':'11'}
file1 = open("memory.txt","w+")
c=getcode()
print(c)
fillempty(c)
file1.close()	
