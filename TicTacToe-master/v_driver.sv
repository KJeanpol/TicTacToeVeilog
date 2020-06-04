module v_driver(
    // Clock input
    input wire clk,
    // Data input to be displayed, 1-bit becuase its black and white
    input wire data,
    // Outputs to trigger the transfer of data and the calculation of the next frame
    output reg transfer_start,
    output reg logic_start,
    // Outputs for the VGA connector
    output wire [9:0] x_val,
    output wire [8:0] y_val, 
    output wire h_sync, v_sync,
    output wire [3:0] red, green, blue
    );
    // Parameters for the size of the screen
    parameter X_MAX         = 10'd639;
    parameter Y_MAX         = 9'd479;
    parameter X_SIZE        = 10'd799;
    parameter Y_SIZE        = 10'd525;
    parameter X_ZERO        = 10'b0000000000;
    parameter Y_ZERO        = 10'b0000000000;
    parameter COUNT_MULT    = 3'd6;
    
    // Registers to track the current and next position of the output
    reg [9:0] x_reg = X_ZERO, x_next = X_ZERO + 1'b1, y_reg = Y_ZERO, y_next = Y_ZERO;
    // Registers for the values of the color outputs
    reg [3:0] red_reg = 4'h0, red_next = 4'h0, green_reg = 4'h0, green_next = 4'h0, blue_reg = 4'h0, blue_next = 4'h0;
    // Registers to track the sync pusles both horizontally and vertically
    reg h_sync_reg = 1'b0, h_sync_next = 1'b0, v_sync_reg = 1'b0, v_sync_next = 1'b0;
    // Register to track whether the output should be enabled or not
    reg v_en;
    // Counter to divide the clock by 6
    reg [2:0] count = 3'b000, count_next = 3'b000;
    
    // Always block to clock through the next state of all the registers in the design
    always @ (posedge clk) begin
        count       <= count_next;
        x_reg       <= x_next;
        y_reg       <= y_next;
        v_sync_reg  <= v_sync_next;
        h_sync_reg  <= h_sync_next;
        red_reg     <= red_next;
        green_reg   <= green_next;
        blue_reg    <= blue_next;
        v_en        <= ( (x_reg < 10'd640) & (y_reg < 10'd480) );

        // Case block to output the read data from the memory or to output black
        // if we're outside the displayed portion of the screen
        case(v_en)
            1: begin
                    red_next    <= {4{data}};
                    green_next  <= {4{data}};
                    blue_next   <= {4{data}};
                end
            0: begin
                    red_next    <= 4'h0;
                    green_next  <= 4'h0;
                    blue_next   <= 4'h0;
                end
        endcase 
    end

    always_comb begin
        // Start the transfer at the 432nd line, so that the transfer wont over write anything
        // that hasn't been displayed yet but will finish as early as possible
        transfer_start = (x_next == X_ZERO & y_next == 10'd432) ? 1'b1 : 1'b0;
        // Logic will start calculating the next frame once the new frame starts
        logic_start = (x_next == X_ZERO + 1'b1 & y_next == Y_ZERO) ? 1'b1 : 1'b0;
        // sync pulses for ~90 pixels on the horizontal and ~2 pixels on the vertical
        h_sync_next = (x_reg > 10'd659) & (x_reg < 10'd756);
        v_sync_next = (y_reg > 10'd493) & (y_reg < 10'd496);
        // the counter to divide the clock by 6
        count_next = (count < COUNT_MULT - 1'b1) ? count + 1'b1 : 4'b0000;
        // Count x is the counter is at 5, increment y if x is at the end of the row
        // reset both to 0 if they reach the end of the screen
        y_next  = (x_reg == X_SIZE) ? ( (y_reg < Y_SIZE) ? y_reg + 1'b1 : Y_ZERO) : y_reg;
        x_next  = (x_reg == X_SIZE) ? X_ZERO : ( (count == COUNT_MULT - 1'b1) ? ( x_reg + 1'b1 ) : x_reg );
    end

    // Assign output registers
    // X and Y registers form the address for the memory to read
    assign red = red_reg;
    assign green = green_reg;
    assign blue = blue_reg;
    assign h_sync = h_sync_reg;
    assign v_sync = v_sync_reg;
    assign x_val = x_reg;
    assign y_val = y_reg[8:0];  
    
endmodule