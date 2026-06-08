`timescale 1ns / 1ps

module tb_lzc16;
    reg [15:0] A;
    wire [4:0] Y;

    // Map các bit của Vector A và Y vào từng chân lẻ của netlist
    lzc16 uut (
        .Y4(Y[4]), .Y3(Y[3]), .Y2(Y[2]), .Y1(Y[1]), .Y0(Y[0]),
        .A15(A[15]), .A14(A[14]), .A13(A[13]), .A12(A[12]),
        .A11(A[11]), .A10(A[10]), .A9(A[9]),   .A8(A[8]),
        .A7(A[7]),   .A6(A[6]),   .A5(A[5]),   .A4(A[4]),
        .A3(A[3]),   .A2(A[2]),   .A1(A[1]),   .A0(A[0])
    );

    initial begin
        $dumpfile("lzc16_wave.vcd");
        $dumpvars(0, tb_lzc16);

        $monitor("Time=%0t | A=%b | Zeros Y=%d", $time, A, Y);

        // Test các trường hợp
        A = 16'b0001_0110_0010_0000; #10; // Đề bài (3 số 0)
        A = 16'b1000_0000_0000_0000; #10; // 0 số 0
        A = 16'b0000_0000_0000_0000; #10; // 16 số 0
        A = 16'b0000_0000_1111_1111; #10; // 8 số 0

        $finish;
    end
endmodule
