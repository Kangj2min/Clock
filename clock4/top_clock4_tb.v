`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/20 14:42:57
// Design Name: 
// Module Name: topclock4_tb
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


module topclock4_tb;
parameter P_COUNT_BIT = 5;
parameter P_SEC_BIT=6;
parameter P_MIN_BIT=6;
parameter P_HOUR_BIT=5;

reg reset;
reg clk;
reg [P_COUNT_BIT-1:0] i_freq;
reg en;

wire [P_SEC_BIT-1:0] sec;
wire [P_MIN_BIT-1:0] min;
wire [P_HOUR_BIT-1:0] hour;

top_clock4 #(
.P_COUNT_BIT(P_COUNT_BIT),
.P_SEC_BIT(P_SEC_BIT),
.P_MIN_BIT(P_MIN_BIT),
.P_HOUR_BIT(P_HOUR_BIT)) u_top_clock4(
.reset(reset),
.clk(clk),
.i_freq(i_freq),
.en(en),
.sec(sec),
.min(min),
.hour(hour)
);

always #5 clk=~clk;

initial begin
clk=1'b0;
reset=1'b1;
en=1'b0;
i_freq={P_COUNT_BIT{1'b0}};
#100
reset=1'b0;
en=1'b1;
i_freq={P_COUNT_BIT{1'b1}};

@(posedge clk);
#28000000
$finish;
end
    
endmodule
