`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2020 19:07:09
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input CLK, RESET,
    input UP, LEFT, DOWN, RIGHT,
    output reg [3:0] VGA_R, VGA_G, VGA_B,
    output VGA_HS, VGA_VS
    );
    
    parameter SCREEN_H = 1024;
    parameter SCREEN_V = 768;
    parameter UNIT = 32;
    
    wire VGA_clk, locked; //65 MHz
    wire displayArea;
    wire [10:0] xCount, yCount; //x ,y pixel
    wire cel;
    wire in_space;
    wire cel_border;
    wire out_space;
    
    // generate VGA clock (65 MHz) from input clock (100 MHz)
    clk_wiz_0 clk_wiz_0(
        .clk_in1 (CLK),
        .reset (RESET),
        .clk_out1 (VGA_clk),
        .locked (locked)
    );
    
    //VGA controller
    VGA_gen VGA_gen(
        .CLK(VGA_clk), .RESET(~locked),
        .displayArea(displayArea),
        .xCount(xCount),.yCount(yCount),
        .VGA_HS(VGA_HS),.VGA_VS(VGA_VS)
    );
    
    //color cels
    cel_color cel_color(
        .VGA_clk(VGA_clk),
        .displayArea(displayArea),
        .xCount(xCount), .yCount(yCount),
        .cel(cel), .in_space(in_space), .cel_border(cel_border), .out_space(out_space)
        ); 
        
   always@(posedge VGA_clk)
    begin
        if(cel)             {VGA_R, VGA_G, VGA_B} <= 12'h340;
		else if(in_space)   {VGA_R, VGA_G, VGA_B} <= 12'h3;
		else if(cel_border) {VGA_R, VGA_G, VGA_B} <= 12'h34;
		else if(out_space)  {VGA_R, VGA_G, VGA_B} <= 12'h70;
	end
	
endmodule


//////////////////////////////////////////////////////////////////////////////////////////////////////
module VGA_gen(
    input   CLK, RESET, //clk=65MHzz
    output displayArea,
    output reg [10:0] xCount,yCount, //x,y pixel
    output reg VGA_HS,VGA_VS
    );
    parameter H_CNT = 11'd1343; //136+160+1024+24=1344-1
    parameter V_CNT = 11'd805; //6+29+768+3=806-1
    
    reg h_de, v_de; //data enable
    reg [10:0] h_cnt,v_cnt;
    
    always@(posedge CLK)
    begin
        if(RESET)
            h_cnt <= 11'd0;
        else if(h_cnt>=H_CNT)
            h_cnt <= 11'd0;
        else
            h_cnt <= h_cnt + 11'd1;
    end
    always@(posedge CLK)
    begin
        if(RESET)
            v_cnt <= 11'd0;
        else if(h_cnt==H_CNT)
        begin
            if(v_cnt>=V_CNT)
                v_cnt <= 11'd0;
            else
                v_cnt <= v_cnt + 11'd1;
        end
    end
    always@(posedge CLK)
    begin
        if(RESET)
            h_de <= 1'b0;
        else if((h_cnt>=296)&&(h_cnt<=1319))
            h_de <= 1'b1;
        else
            h_de <= 1'b0;
    end
    always@(posedge CLK)
    begin
        if(RESET)
            v_de <= 1'b0;
        else if((v_cnt>=35)&&(v_cnt<=802))
            v_de <= 1'b1;
        else
            v_de <= 1'b0;
    end
    always@(posedge CLK)
    begin
        if(RESET)
            VGA_HS <= 1'b1;
        else if(h_cnt<=11'd135)
            VGA_HS <= 1'b0;
        else
            VGA_HS <= 1'b1;
    end
    always@(posedge CLK)
    begin
        if(RESET)
 
            VGA_VS <= 1'b1;
        else if(v_cnt<=11'd5)
            VGA_VS <= 1'b0;
        else
            VGA_VS <= 1'b1;
    end
    always@(posedge CLK)
    begin
        if(h_de == 1'h0)
            xCount <= 11'h0;
        else 
            xCount <= xCount + 11'h1;
    end
    always@(negedge h_de)
    begin
        if(v_de == 1'h0)
            yCount <= 11'h0;
        else 
            yCount <= yCount + 11'h1;
    end
    assign displayArea = (v_de==1 && h_de==1);
endmodule
//////////////////////////////////////////////////////////////////////////////////
module cel_color(
    input VGA_clk,
	input displayArea,
    input [10:0] xCount, yCount,
    output reg cel, in_space, cel_border, out_space
    );
    parameter CEL_SIZE = 32;
    parameter OUT_SPACE = 1;
    parameter IN_SPACE = 2;
    parameter BORDER = 2;
    
    wire [10:0] q_x = xCount/(CEL_SIZE);
    wire [10:0] q_y = yCount/(CEL_SIZE);
    
    wire [7:0] cel_x = xCount - q_x*CEL_SIZE;
    wire [7:0] cel_y = yCount - q_y*CEL_SIZE;
    
    integer i = IN_SPACE + BORDER + OUT_SPACE;
    integer j = BORDER + OUT_SPACE;
    integer k = OUT_SPACE;
	
    always@(posedge VGA_clk)
	begin
	    if(displayArea)
		begin
		    cel <= (cel_x >= i) && (cel_y >= i) && (cel_x < CEL_SIZE - i) && (cel_y < CEL_SIZE - i) ? 1 : 0;
			if(cel)
			begin
			    in_space   <= 0; 
			    cel_border <= 0; 
			    out_space  <= 0;
			end
			else
			begin
    	        in_space = (cel_x >= j) && (cel_y >= j) && (cel_x < CEL_SIZE - j) && (cel_y < CEL_SIZE - j) ? 1 : 0;
				if(in_space)
				begin
			        cel_border <= 0; 
			        out_space  <= 0;
			    end
				else
				begin
    				cel_border = (cel_x >= k) && (cel_y >= k) && (cel_x < CEL_SIZE - k) && (cel_y < CEL_SIZE - k) ? 1 : 0;
					if(cel_border)
			            out_space  <= 0;
					else
					    out_space = 1;
				end
			end
	    end
	end
endmodule
