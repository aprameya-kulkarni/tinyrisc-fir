`timescale 1ns/1ps

module counter_tb;

    reg clk;
    reg rst;
    wire [7:0] count;

    counter dut (
        .clk   (clk),
        .rst   (rst),
        .count (count)
    );

    // 10 ns clock period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_tb);

        clk = 1'b0;
        rst = 1'b1;

        // Hold reset for two clock cycles
        #20;

        rst = 1'b0;

        // Let the counter run
        #100;

        $finish;
    end

endmodule
