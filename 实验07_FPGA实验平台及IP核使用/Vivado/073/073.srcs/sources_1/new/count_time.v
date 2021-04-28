`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2020 16:18:59
// Design Name: 
// Module Name: count_time
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


module count_time(
    input clk_10m,
    input rst,
    output reg [3:0] tenth, sec, ten_sec, min
    );
    //create 0.1s pulse signal
    reg [19:0]count;
    wire pulse;
    always@(posedge clk_10m or posedge rst)
    begin
        if(rst || count >= 20'hf423f) //hex f 423f = dec 999 999
            count <= 20'h0;
        else 
            count <= count + 20'h1;
    end
    assign pulse = (count == 20'h1);
    //count time
    //tenth sec
    always@(posedge clk_10m or posedge rst)
    begin
        if(rst) tenth <= 4'h4;
        else if(pulse)
        begin
            if(tenth >= 4'h9) tenth <= 4'h0;
            else              tenth <= tenth + 4'h1;
        end
    end
    //sec
    always@(posedge clk_10m or posedge rst)
    begin
        if(rst) sec <= 4'h3;
        else if(pulse)
        begin
            if(sec >= 4'h9 && tenth >= 4'h9)
                sec <= 4'h0;
            else if(tenth >= 4'h9) sec <= sec + 4'h1;
        end
    end
    //ten_sec
    always@(posedge clk_10m or posedge rst)
    begin
        if(rst) ten_sec <= 4'h2;
        else if(pulse)
        begin
            if(ten_sec >= 4'h5 && sec >= 4'h9 && tenth >= 4'h9) 
                ten_sec <= 4'h0;
            else if(sec >= 4'h9 && tenth >= 4'h9) ten_sec <= ten_sec + 4'h1;
        end
    end
    //min
    always@(posedge clk_10m or posedge rst)
    begin
        if(rst) min <= 4'h1;
        else if(pulse)
        begin
            if(min >= 4'h9 && ten_sec >= 4'h5 && sec >= 4'h9 && tenth >= 4'h9) 
                min <= 4'h0;
            else if(ten_sec >= 4'h5 && sec >= 4'h9 && tenth >= 4'h9) min <= min + 4'h1;
        end
    end
endmodule
