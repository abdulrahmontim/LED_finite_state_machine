`timescale 1ns / 1ps


module led_fsm_tb;
    reg clk;
    reg reset_n;
    wire [3:0] leds;

    // DUT
    led_fsm dut (
        .clk(clk),
        .reset_n(reset_n),
        .leds(leds)
    );

    // clock 20 ns period
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

        initial begin
        $dumpfile("led_fsm.vcd");
        $dumpvars(0, led_fsm_tb);
    end

    initial begin
        reset_n = 0;
        #40;
        reset_n = 1;

        #200;
        $stop;
    end

endmodule
