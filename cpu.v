/* Filename: cpu.v
 * Description: CPU FSM and top module of design
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

`timescale 1ps/1ps
module cpu(
    input wire clk, reset
);

//------------------------------------------------------
// CPU states
//------------------------------------------------------
localparam [2:0]    FETCH  = 3'b000,
                    DECODE  = 3'b001,
                    EXECUTE = 3'b010,
                    MEM     = 3'b011,
                    WB      = 3'b100;
reg [2:0] cpu_state_q, cpu_nextState_q;
                
reg [31:0] pc_q;
reg [31:0] instruction_q;       // Instruction for current cycle
wire [31:0] instruction_next;   // instruction from insruction memory
wire [31:0] opA, opB;           // operands to pass to alu if applicable 
wire [6:0] cmdOp, cmdF7;        // control instructions
wire [2:0] cmdF3;               // "-------------------"

//-----------------------------------------------------
// CPU core functionality
//-----------------------------------------------------
always @ (posedge clk) begin
    case(cpu_state_q) 
        FETCH : begin
            instruction_q <= instruction_next; // Fetch instruction from memory
        end
        DECODE : begin
            
        end
        EXECUTE : begin

        end
        MEM : begin

        end
        WB : begin

        end

    endcase
end

always @ (posedge clk, posedge reset) begin
        if(reset) begin
        cpu_state_q     <= FETCH;
        pc_q            <= 0;
        instruction_q   <= 31'b0;
    end else begin
        cpu_state_q <= cpu_nextState_q;
    end
end

//-------------------------------------------------------------------
// Next-state Logic
//-------------------------------------------------------------------
always @ (*)begin

    case(cpu_state_q)
        FETCH   : cpu_nextState_q = DECODE;
        DECODE  : cpu_nextState_q = EXECUTE;
        EXECUTE : cpu_nextState_q = MEM;
        MEM     : cpu_nextState_q = WB;
        WB      : cpu_nextState_q = FETCH; 
    endcase

end


//-------------------------------------------------------------------
// Instantiations
//-------------------------------------------------------------------

// Instruction memeory 
ints_mem im_1(
    .pc(pc_q),                  // program counter input
    .instruction(instruction_next)   // insturciton fetched from memory
);

// Decoder
decoder d_1(
    .insturciton(instruction),      // Input
    .cmdOp(cmdOp),                  // Outputs
    .cmdF3(cmdF3),
    .cmdF7(cmdF7),
    .rs1(rs1), .rs2(rs2), .rd(rd)
);

// Control
control_unit ctrl_1(
    .cmdOp(cmdOp), .cmdF7(cmdF7),
    .cmdF3(cmdF3),
    .rs1(rs1), .rs2(rs2), .rd(rd)
);

endmodule

