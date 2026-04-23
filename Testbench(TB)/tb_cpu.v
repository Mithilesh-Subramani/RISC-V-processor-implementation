module tb_cpu;

reg clk;
reg [31:0] instr;

risc_v_processor uut (
    .clk(clk),
    .instr(instr)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("cpu_wave.vcd");
    $dumpvars(0, tb_cpu);

    clk = 0;

    // ADD x3 = x1 + x2
    instr = 32'b0000000_00010_00001_000_00011_0110011;
    #20;

    // SUB x3 = x1 - x2
    instr = 32'b0100000_00010_00001_000_00011_0110011;
    #20;

    $finish;
end

endmodule