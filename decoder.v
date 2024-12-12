/* Filename: decoder.v
 * Description: Instruction Decoder module for RISC-V- based CPU design
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


module decoder(
    input [31:0] instruction,
    output [6:0] cmdOp, cmdF7,
    output [2:0] cmdF3,
    output [4:0] rs1, rs2, rd
);

//---------------------------------------------
// Control
//---------------------------------------------
assign cmdOp    = instruction [6:0];
assign cmdF3    = instruction [14:12];
assign cmdF7    = instruction [31: 25];

//---------------------------------------------
// Read Addresses
//---------------------------------------------
assign rs1      = instruction [19:15];
assign rs2      = instruction [24:20];

//---------------------------------------------
// Destination Address
//---------------------------------------------
assign rd       = instruction [11:7] ; 

endmodule