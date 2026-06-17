`timescale 1ns/1ps

module tb_zlc2;

    reg HI;
    reg LO;

    wire V;
    wire P;

    // DUT (Device Under Test)
    lzc2 uut (
        .V(V),
        .P(P),
        .HI(HI),
        .LO(LO)
    );

    initial begin
        $dumpfile("lzc2.vcd");
        $dumpvars(0, tb_zlc2);

        // test all cases
        HI = 0; LO = 0; #10;
        HI = 0; LO = 1; #10;
        HI = 1; LO = 0; #10;
        HI = 1; LO = 1; #10;

        $finish;
    end

endmodule
