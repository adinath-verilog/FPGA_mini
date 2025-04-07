module tilt (
    input wire switch_input,     // Connected to GPIO pin
    output reg led_output        // Just to visualize
);
assign led_output =! switch_input;
endmodule

