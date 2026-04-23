module control_unit(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [2:0] alu_ctrl,
    output reg reg_write
);

always @(*) begin
    case(opcode)

        7'b0110011: begin // R-type instructions
            reg_write = 1;

            case({funct7, funct3})
                10'b0000000_000: alu_ctrl = 3'b000; // ADD
                10'b0100000_000: alu_ctrl = 3'b001; // SUB
                10'b0000000_111: alu_ctrl = 3'b010; // AND
                10'b0000000_110: alu_ctrl = 3'b011; // OR
                default: alu_ctrl = 3'b000;
            endcase
        end

        default: begin
            reg_write = 0;
            alu_ctrl = 3'b000;
        end

    endcase
end

endmodule