
`timescale 1ns/1ps

module tb_lzc8;

reg [7:0] A;
reg VDD, GND;

wire V;
wire P2, P1, P0;

integer i;

lzc8 dut (
    .V(V),
    .P2(P2),
    .P1(P1),
    .P0(P0),
    .VDD(VDD),
    .GND(GND),
    .A(A)
);

initial begin
    $dumpfile("lzc8.vcd");
    $dumpvars(0, tb_lzc8);

    VDD = 1'b1;
    GND = 1'b0;

    for (i = 0; i < 256; i = i + 1) begin
        A = i;
        #10;
        $display("Time=%0t ns, A=%b, V=%b, P=%b%b%b",
                 $time, A, V, P2, P1, P0);
    end

    $finish;
end

endmodule

