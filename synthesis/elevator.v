`timescale 1s / 1ms

module elevator (
    input [3:0] Request_Floor,    // Target floor
    input [3:0] In_Current_Floor, // Current floor of the elevator
    input Over_Weight,            // Elevator overweight signal
    input Door_Open,              // Door open signal
    input Floor_Sensor,           // Floor sensor signal
    input clk, reset,           // Clock and reset signals
    output reg [3:0] Out_Current_Floor, // Elevator's current floor output
    output reg Direction,         // Elevator direction (1=up, 0=down)
    output reg Complete,          // Movement complete signal
    output reg Door_Alert,        // Alert if door open > 3 minutes
    output reg Weight_Alert       // Alert if elevator is overweight
);

    reg [7:0] door_timer; // Timer for door open duration

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Out_Current_Floor <= In_Current_Floor; // Reset to initial floor
            Direction <= 0;  // Reset direction
            Complete <= 1;   // Reset complete signal (ELEVATOR STOP)
            Door_Alert <= 0; // Reset door alert
            Weight_Alert <= 0; // Reset weight alert
            door_timer <= 0; // Reset door timer
        end else begin
            // Overweight condition
            if (Over_Weight) begin
                Weight_Alert <= 1;
                Complete <= 1; // Stop elevator
            end else begin
                Weight_Alert <= 0;
            end

            // Door open alert
            if (Door_Open) begin
                if (door_timer < 255) // Limit timer to prevent overflow
                    door_timer <= door_timer + 1;
                if (door_timer >= 180) // Trigger alert after 3 minutes
                    Door_Alert <= 1;
            end else begin
                door_timer <= 0;
                Door_Alert <= 0;
            end

            // Normal operation
            if (!Complete && !Door_Alert && !Weight_Alert) begin
                if (Request_Floor > Out_Current_Floor) begin
                    Direction <= 1; // Moving up
                    if (Floor_Sensor) begin
                        Out_Current_Floor <= Out_Current_Floor + 1;
                    end
                end else if (Request_Floor < Out_Current_Floor) begin
                    Direction <= 0; // Moving down
                    if (Floor_Sensor) begin
                        Out_Current_Floor <= Out_Current_Floor - 1;
                    end
                end else if (Request_Floor == Out_Current_Floor) begin
                    Complete <= 1; // Target floor reached
                end
            end else begin
                Complete <= 0; //MOVE ELEVATOR
            end
        end
    end
endmodule

