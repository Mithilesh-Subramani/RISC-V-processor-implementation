module tb_reg_file;

reg clk;
reg [4:0] rs1, rs2, rd;
reg [31:0] write_data;
reg reg_write;
wire [31:0] read_data1, read_data2;

reg_file uut (
    .clk(clk),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_data),
    .reg_write(reg_write),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// Clock
always #5 clk = ~clk;

initial begin
    $dumpfile("reg_wave.vcd");
    $dumpvars(0, tb_reg_file);

    clk = 0;

    // Write 10 to register 1
    rd = 5'd1;
    write_data = 10;
    reg_write = 1;
    #10;

    // Write 20 to register 2
    rd = 5'd2;
    write_data = 20;
    #10;

    // Read registers
    reg_write = 0;
    rs1 = 5'd1;
    rs2 = 5'd2;
    #10;

    $finish;
end

endmodule