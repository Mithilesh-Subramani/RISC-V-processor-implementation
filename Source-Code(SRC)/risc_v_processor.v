module risc_v_processor(
    input clk,
    input [31:0] instr
);

// Extract fields
wire [6:0] opcode = instr[6:0];
wire [4:0] rd  = instr[11:7];
wire [2:0] funct3 = instr[14:12];
wire [4:0] rs1 = instr[19:15];
wire [4:0] rs2 = instr[24:20];
wire [6:0] funct7 = instr[31:25];

// Wires
wire [31:0] read_data1, read_data2, alu_result;
wire [2:0] alu_ctrl;
wire reg_write;

// Modules

control_unit CU (
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .alu_ctrl(alu_ctrl),
    .reg_write(reg_write)
);

reg_file RF (
    .clk(clk),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(alu_result),
    .reg_write(reg_write),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

alu ALU (
    .a(read_data1),
    .b(read_data2),
    .alu_ctrl(alu_ctrl),
    .result(alu_result)
);

endmodule