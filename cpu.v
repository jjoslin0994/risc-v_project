`timescale 1ps/1ps
module cpu(
    input wire clk, reset
);

//------------------------------------------------------
// CPU states
//------------------------------------------------------
localparam [2:0] FETCH  = 3'b000,
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
    .insturciton(instruction),
    .cmdOp(cmdOp),
);

// Control
control_unit ctrl_1(
    //not sure yet
);

endmodule


