`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/20 11:36:17
// Design Name: 
// Module Name: sec_gen
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


module sec_gen(
reset,
clk,
en,
one_sec_tick,
sec,
min_tic
);

parameter P_SEC_BIT=6;

input  reset,en,clk;
input one_sec_tick;
output reg [P_SEC_BIT-1:0] sec;
output min_tic;

assign min_tic = sec==59 ? 1'b1 : 1'b0;

//reg [P_COUNT_BIT-1:0] r_counter;
always @(posedge clk ) begin
    if(reset) begin
            sec <= {P_SEC_BIT{1'b0}};
    end else begin
        if(en && one_sec_tick) begin
            if(sec == 59) begin
                sec <= 0;
            end else begin
                sec <= sec + 1'b1;
            end
        end
    end
end
endmodule
