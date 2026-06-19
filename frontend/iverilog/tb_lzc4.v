`timescale 1ns/1ps

module tb_lzc4;

reg [3:0] A;
reg VDD, GND;

wire V;
wire P1;
wire P0;

integer i;

// Device Under Test
lzc4 dut (
    .V(V),
    .P1(P1),
    .P0(P0),
    .A(A),
    .VDD(VDD),
    .GND(GND)
);

initial begin
    $dumpfile("lzc4.vcd");
    $dumpvars(0, tb_lzc4);

    VDD = 1'b1;
    GND = 1'b0;

    for (i = 0; i < 16; i = i + 1) begin
        A = i;
        #10;
        $display("Time=%0t ns, A=%b, V=%b, P=%b%b",
                  $time, A, V, P1, P0);
    end

    $finish;
end

endmodule
