`timescale 1ns/1ps
module lzc16_tb;
    reg  [15:0] A;
    wire [4:0]  Y, Yref;
    integer     i, errors;

    lzc16 dut (
        .A15(A[15]), .A14(A[14]), .A13(A[13]), .A12(A[12]),
        .A11(A[11]), .A10(A[10]), .A9 (A[9]),  .A8 (A[8]),
        .A7 (A[7]),  .A6 (A[6]),  .A5 (A[5]),  .A4 (A[4]),
        .A3 (A[3]),  .A2 (A[2]),  .A1 (A[1]),  .A0 (A[0]),
        .Y4 (Y[4]),  .Y3 (Y[3]),  .Y2 (Y[2]),  .Y1 (Y[1]),  .Y0(Y[0])
    );
    zlc_ref gold (.A(A), .Y(Yref));

    task check;
        begin
            #1;
            if (Y !== Yref) begin
                $display("MISMATCH  A=%b  dut=%0d  ref=%0d", A, Y, Yref);
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        $dumpfile("lzc16.vcd");
        $dumpvars(0, lzc16_tb);
        errors = 0;

        A = 16'b0001011000100000; check();   // expect 3
        A = 16'h0000;             check();   // expect 16
        A = 16'hFFFF;             check();   // expect 0
        A = 16'h8000;             check();   // expect 0
        A = 16'h0001;             check();   // expect 15
        A = 16'h4000;             check();   // expect 1
        A = 16'h0100;             check();   // expect 7

        for (i = 0; i < 5000; i = i + 1) begin
            A = $random;
            check();
        end

        if (errors == 0) $display("------ TEST PASSED: tat ca khop ------");
        else             $display("------ TEST FAILED: %0d loi ------", errors);
        $finish;
    end
endmodule
