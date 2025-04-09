`timescale 1s / 1ms

module Elevator_Controller_tb;
    reg [3:0] Request_Floor;
    reg [3:0] In_Current_Floor;
    reg Over_Weight, Door_Open, Floor_Sensor, clock, reset;
    wire [3:0] Out_Current_Floor;
    wire Direction, Complete, Door_Alert, Weight_Alert;

    Elevator_Controller uut (
        .Request_Floor(Request_Floor),
        .In_Current_Floor(In_Current_Floor),
        .Over_Weight(Over_Weight),
        .Door_Open(Door_Open),
        .Floor_Sensor(Floor_Sensor),
        .clock(clock),
        .reset(reset),
        .Out_Current_Floor(Out_Current_Floor),
        .Direction(Direction),
        .Complete(Complete),
        .Door_Alert(Door_Alert),
        .Weight_Alert(Weight_Alert)
    );

    initial begin
        // Initialize signals
        clock = 0;
        reset = 1;
        Request_Floor = 4'b0000;
        In_Current_Floor = 4'b0000;
        Over_Weight = 0;
        Door_Open = 0;
        Floor_Sensor = 0;

        // Reset sequence
        #5 reset = 0;

        // Test normal operation
        #5 Request_Floor = 4'b0010; // Request floor 2
        Floor_Sensor = 1; #5 Floor_Sensor = 0; // Simulate passing floor 1
        #5 Floor_Sensor = 1; #5 Floor_Sensor = 0; // Simulate passing floor 2

        // Test overweight condition
        #10 Over_Weight = 1; #10 Over_Weight = 0;

        // Test door alert (door open for more than 3 minutes)
        #10 Door_Open = 1;
        #190; // Wait for 3+ minutes
        if (Door_Alert)
            $display("Door Alert Triggered as Expected");
        Door_Open = 0; #5;
        if (!Door_Alert)
            $display("Door Alert Reset Correctly");

        // Test direction
        #5 Request_Floor = 4'b0001; // Request floor 1 (down direction)
        Floor_Sensor = 1; #5 Floor_Sensor = 0; // Simulate passing floor 1

        // End simulation
        #50 $finish;
    end

    always #1 clock = ~clock; // Clock generation
endmodule

