module tb_alu;

reg [31:0] a, b;
reg [2:0] alu_ctrl;
wire [31:0] result;

alu uut (
    .a(a),
    .b(b),
    .alu_ctrl(alu_ctrl),
    .result(result)
);

initial begin
$dumpfile("wave.vcd");
$dumpvars(0, tb_alu);
    $monitor("a=%d b=%d ctrl=%b result=%d", a, b, alu_ctrl, result);

    // ADD
    a = 10; b = 5; alu_ctrl = 3'b000;
    #10;

    // SUB
    a = 10; b = 5; alu_ctrl = 3'b001;
    #10;

    // AND
    a = 10; b = 5; alu_ctrl = 3'b010;
    #10;

    // OR
    a = 10; b = 5; alu_ctrl = 3'b011;
    #10;

    $finish;

end

endmodule