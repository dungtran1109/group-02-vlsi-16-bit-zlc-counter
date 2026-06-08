module zlc_ref (input [15:0] A, output reg [4:0] Y);
    integer i;
    reg     found;
    always @(*) begin
        Y = 5'd16;
        found = 1'b0;
        for (i = 15; i >= 0; i = i - 1)
            if (A[i] && !found) begin
                Y = 15 - i;
                found = 1'b1;
            end
    end
endmodule
