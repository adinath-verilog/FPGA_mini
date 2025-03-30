module servo_motor (
    input wire clk,          // System clock
    output  reg duty,  // Duty cycle for PWM (0 to 255)
    output reg pwm          // PWM output signal to control servo
);

    reg [15:0] counter;  // Counter for PWM signal generation
    parameter MAX_COUNT = 50000;  // 50Hz PWM signal (20ms period)
    
    always @(posedge clk) begin
        if (counter >= MAX_COUNT - 1) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

    always @(posedge clk) begin
        if (counter < (duty * MAX_COUNT) / 255) begin
            pwm <= 1;  // Generate high signal
        end else begin
            pwm <= 0;  // Generate low signal
        end
    end

endmodule
