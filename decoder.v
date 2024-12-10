module decoder(
    input [31:0] instruction,
    output [6:0] cmdOp, cmdF7,
    output [2:0] cmdF3,
    output [4:0] rs1, rs2, rd,
    output [19:0] imm_1,
    output [11:0] imm_2,
);

//---------------------------------------------
// Control
//---------------------------------------------
assign cmdOp    = instruction [6:0];
assign cmdF3    = instruction [14:12];
assign cmdF7    = instruction [31: 25];

//---------------------------------------------
// Immediates
//---------------------------------------------
assign imm_1    = instruction [31:12]; // grab max possible imm will be parsed according to op in control
assign imm_2    = instruction [19:7];

//---------------------------------------------
// Read Addresses
//---------------------------------------------
assign rs1      = instruction[19:15];
assign rs2      = instruction[24:20];

//---------------------------------------------
// Destination Address
//---------------------------------------------
assign rd       =[11:7] instruction; 

endmodule