module rgb_blink(
    output trigpin,
    input  echopin,
    output reg led,      // Original indicator
    output led1,         // First Set
    output led2,
    output led3,
    output led4,
    output led5,         // Second Set
    output led6,
    output led7,
    output led8
);

    wire clk;

    // 48 MHz Internal Oscillator
    SB_HFOSC #(.CLKHF_DIV("0b00")) u_hfosc (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF(clk)
    );

    // Timing Constants
    localparam PING_CYCLE      = 22'd2880000;
    localparam TRIG_PULSE       = 9'd480;      
    localparam THRESHOLD_35CM  = 17'd97440;   

    reg [21:0] timer = 0;
    reg [8:0]  trig_timer = 0;
    reg        trig = 0;
    reg echo_sync1 = 0, echo_sync2 = 0, echo_prev = 0;

    always @(posedge clk) begin
        echo_sync1 <= echopin;
        echo_sync2 <= echo_sync1;
        echo_prev  <= echo_sync2;
    end

    // Trigger Logic
    always @(posedge clk) begin
        if (timer == 0) begin
            timer <= PING_CYCLE - 1;
            trig_timer <= TRIG_PULSE;
            trig <= 1'b1;
        end else begin
            timer <= timer - 1;
            if (trig_timer == 0) trig <= 1'b0;
            else trig_timer <= trig_timer - 1;
        end
    end

    assign trigpin = trig;

    // Echo Measurement
    reg [16:0] echo_down_cnt = 0;
    reg        echo_active = 0;
    reg        object_near = 0;

    always @(posedge clk) begin
        if (echo_sync2 == 1'b1 && echo_prev == 1'b0) begin
            echo_down_cnt <= THRESHOLD_35CM;
            echo_active <= 1'b1;
        end
        else if (echo_sync2 == 1'b1 && echo_active) begin
            if (echo_down_cnt != 0) echo_down_cnt <= echo_down_cnt - 1;
            else echo_active <= 1'b0;
        end
        else if (echo_sync2 == 1'b0 && echo_prev == 1'b1) begin
            if (echo_active && (echo_down_cnt < THRESHOLD_35CM)) begin
                led <= 1'b1;
                object_near <= 1'b1;
            end else begin
                led <= 1'b0;
                object_near <= 1'b0;
            end
            echo_active <= 1'b0;
        end
    end

    // Both sets mirror the same logic
    assign {led1, led2, led3, led4, led5, led6, led7, led8} = object_near ? 8'b10101010 : 8'b10011001;

endmodule
