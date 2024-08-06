module graphics_engine(
    output wire [1:0] r, g, b,
    input wire [9:0] x, y,
    input wire frame_active, clk, rst_n
    );
    
    parameter [21:0] tt08_line0 = 22'b0000000000000001111100;
    parameter [21:0] tt08_line1 = 22'b0000000000000010000010;
    parameter [21:0] tt08_line2 = 22'b0111000111000100011111;
    parameter [21:0] tt08_line3 = 22'b1000101001100100001000;
    parameter [21:0] tt08_line4 = 22'b0111001010100101111001;
    parameter [21:0] tt08_line5 = 22'b1000101100100100101001;
    parameter [21:0] tt08_line6 = 22'b0111000111000100100001;
    parameter [21:0] tt08_line7 = 22'b0000000000000010100010;
    parameter [21:0] tt08_line8 = 22'b0000000000000000111100;
    
    parameter [45:0] demosiine_line0 = 46'b0000011100000111001110000000000000000000001111;
    parameter [45:0] demosiine_line1 = 46'b1000100010001000100001000000000000000000010001;
    parameter [45:0] demosiine_line2 = 46'b0111000001110000000000100000000000000000100001;
    parameter [45:0] demosiine_line3 = 46'b0000000000000000000000100000000000000000100001;
    parameter [45:0] demosiine_line4 = 46'b1111010010111011100111000110010001011110100001;
    parameter [45:0] demosiine_line5 = 46'b0001010110010001001000001001011011000010100001;
    parameter [45:0] demosiine_line6 = 46'b0111011010010001001000001001010101001110100001;
    parameter [45:0] demosiine_line7 = 46'b0001010010010001000100001001010001000010010001;
    parameter [45:0] demosiine_line8 = 46'b1111010010111011100011100110010001011110001111;
    
    wire [7:0] y_sc8, x_sc8;
    
    wire [7:0] tt08_off_y, tt08_off_x;
    wire [7:0] demosiine_off_y, demosiine_off_x;
    
    assign y_sc8 = y[9:3];
    assign x_sc8 = x[9:3];
    
    assign tt08_off_y = y_sc8 - 24;
    assign tt08_off_x = x_sc8 - 30;
    assign demosiine_off_y = y_sc8 - 12;
    assign demosiine_off_x = x_sc8 - 18;
    
    reg [5:0] rgb;
    assign r = rgb[5:4];
    assign g = rgb[3:2];
    assign b = rgb[1:0];
        
    always @(posedge clk) begin
        if (tt08_off_x < 23) begin
            case (tt08_off_y)
                7'd0: rgb <= { 6{tt08_line0[tt08_off_x]} };
                7'd1: rgb <= { 6{tt08_line1[tt08_off_x]} };
                7'd2: rgb <= { 6{tt08_line2[tt08_off_x]} };
                7'd3: rgb <= { 6{tt08_line3[tt08_off_x]} };
                7'd4: rgb <= { 6{tt08_line4[tt08_off_x]} };
                7'd5: rgb <= { 6{tt08_line5[tt08_off_x]} };
                7'd6: rgb <= { 6{tt08_line6[tt08_off_x]} };
                7'd7: rgb <= { 6{tt08_line7[tt08_off_x]} };
                7'd8: rgb <= { 6{tt08_line8[tt08_off_x]} };
//                default: rgb <= 0;
            endcase
        end
        
        if (demosiine_off_x < 47) begin
            case (demosiine_off_y)
                7'd0: rgb <= { 6{demosiine_line0[demosiine_off_x]} };
                7'd1: rgb <= { 6{demosiine_line1[demosiine_off_x]} };
                7'd2: rgb <= { 6{demosiine_line2[demosiine_off_x]} };
                7'd3: rgb <= { 6{demosiine_line3[demosiine_off_x]} };
                7'd4: rgb <= { 6{demosiine_line4[demosiine_off_x]} };
                7'd5: rgb <= { 6{demosiine_line5[demosiine_off_x]} };
                7'd6: rgb <= { 6{demosiine_line6[demosiine_off_x]} };
                7'd7: rgb <= { 6{demosiine_line7[demosiine_off_x]} };
                7'd8: rgb <= { 6{demosiine_line8[demosiine_off_x]} };
//                default: rgb <= 0;
            endcase
        end
    end
    
    // List all unused inputs to prevent warnings
    wire _unused = &{x[7:0], y[7:0], rst_n, 1'b0};
endmodule
