# Design ZLC Counter VLSI

Design a 16-bit Zero Leading Counter (ZLC) circuit using the complete design flow demonstrated in the design example.
A Zero Leading Counter counts the number of consecutive zeros starting from the most significant bit (MSB) of the input word. For example, the 16-bit input 16'b0001011000100000 contains three leading zeros, so the output should be 5'b00011.
If you implement the design as a combinational circuit, the module should include: a 16-bit input A and a 5-bit output Y.
If you implement the design as a sequential circuit, you may introduce additional signals as needed, such as clk, data_ready, or similar control signals.
