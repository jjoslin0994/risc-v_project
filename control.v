/* Filename: control.v
 * Description: Control module for RISC-V- based CPU design
 * Author: Jonathan Joslin
 * Date: 12/10/2024 
 * Project: RISC-V project v1.0
 * 
 * Copyright (c) 2024, Jonathan Joslin. All rights reserved.
 *
 * This software is provided "as is," without warranty of any kind, express or implied, 
 * including but not limited to the warranties of merchantability, fitness for a particular 
 * purpose, and noninfringement. In no event shall the authors be liable for any claim, 
 * damages, or other liability, whether in an action of contract, tort, or otherwise, arising 
 * from, out of, or in connection with the software or the use or other dealings in the software.
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted 
 * provided that the following conditions are met:
 * - Redistributions of source code must retain the above copyright notice, this list of conditions, 
 *   and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, this list of conditions, 
 *   and the following disclaimer in the documentation and/or other materials provided with the 
 *   distribution.
 */

module control (
    input [6:0] cmdOp, cmdF7,
    input [2:0] cmdF3,
    input [4:0] rs1, rs2, rd
);

//-------------------------------------------------------------------
// cmdOp symbolic constants
//-------------------------------------------------------------------
localparam [6:0] R_TYPE = 7'b0110011,
                 I_TYPE = 7'b0010011,
                 S_TYPE = 7'b0100011,
                 B_TYPE = 7'b1100011,
                 U_TYPE = 0110111,
                 J_TYPE = 1101111;

//-------------------------------------------------------------------
// fuction 3 symbolic constants
//-------------------------------------------------------------------
localparam [2:0]    // Arithemtic Operations
                    F3_ADD      = 3'b000,
                    F3_SUB      = 3'b000,
                    F3_MUL      = 3'b000,
                    F3_ADDI     = 3'b000,
                    F3_SRA      = 3'b101,
                    F3_SRAI     = 3'b101,
                    F3_SLT      = 3'b010,

                    // Logical Operations
                    F3_AND      = 3'b111,
                    F3_OR       = 3'b110,
                    F3_XOR      = 3'b100,
                    F3_SLL      = 3'b001, 
                    F3_SRL      = 3'b101,
                    F3_ANDI     = 3'b001, 
                    F3_ORI      = 3'b110,
                    F3_XORI     = 3'b100,
                    
                    // Branch Operations
                    F3_BEQ      = 3'b000,
                    F3_BNE      = 3'b001,
                    F3_BLT      = 3'b100,
                    F3_BGE      = 3'b101,
                    F3_BLTU     = 3'b110,
                    F2_BGEU     = 3'b111,

                    // Jump Operations
                    F3_JALR     = 3'b000;


//-------------------------------------------------------------------
// fuction 7 symbolic constants
//-------------------------------------------------------------------
localparam [6:0]    F7_ADD          = 7'b0000000,
                    F7_SUB          = 7'b0100000,
                    F7_MUL          = 7'b0000001,
                    F7_SHIFT_ARITH  = 7'b0100000,
                    F7_SHIFT_LOGIC  = 7'b0000000,
                    F7_OTHERS       = 7'b???????;


                 
endmodule
