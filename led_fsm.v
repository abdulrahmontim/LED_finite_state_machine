`timescale 1ns / 1ps

module led_fsm (
    input  wire       clk,
    input  wire       reset_n,
    output reg  [3:0] leds
);

    // state variable
    reg [1:0] state;

    // state values
    localparam S0 = 2'd0;
    localparam S1 =2'd1;
    localparam S2 = 2'd2;
    localparam S3 = 2'd3;

    // state transition
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= S0;
            leds  <= 4'b0001;   //LED1 ON
        end else begin
            case (state)
                S0: begin
                    state <= S1;
                    leds  <= 4'b0010; // LED2 ON
                end
                S1: begin
                    state <= S2;
                    leds  <= 4'b0100; // LED3 ON
                end
                S2: begin
                    state <= S3;
                    leds  <= 4'b1000; //LED4 ON
                end
                S3: begin
                    state <= S0;
                    leds  <= 4'b0001; // LED1 ON
                end
            endcase
        end
    end

endmodule
