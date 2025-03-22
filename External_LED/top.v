module top(
    output reg led,
    input wire clk
);

reg [23:0] counter;

always @(posedge clk) begin
    counter <= counter + 1;
    led <= counter[23]; // Adjust the bit to change blink rate
end
endmodule

