
`timescale 1ns/1ps

module tb_lzc16;

reg [15:0] A;
reg VDD, GND;

wire [4:0] Y;

integer i;

// Device Under Test
lzc16 dut (
    .Y(Y),
    .A(A),
    .VDD(VDD),
    .GND(GND)
);

initial begin
    $dumpfile("lzc16.vcd");
    $dumpvars(0, tb_lzc16);

    VDD = 1'b1;
    GND = 1'b0;

    // Test all 65536 input combinations
    for (i = 0; i < 65536; i = i + 1) begin
        A = i;
        #10;

        $display("Time=%0t ns, A=%b, Y=%b",
                 $time, A, Y);
    end

    $finish;
end

endmodule

