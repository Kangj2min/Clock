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


module min_gen(
reset,
clk,
en,
min_gen_tic,
min,
hour_tic
);
parameter P_COUNT_BIT=30;
parameter P_MIN_BIT=6;

input  reset,en,clk;
input min_gen_tic;
output reg [P_MIN_BIT-1:0] min;
output hour_tic;

assign hour_tic = min==59 ? 1'b1 : 1'b0;


 always @ (posedge clk) begin
    if(reset) begin
        min <= {P_MIN_BIT{1'b0}};
    end else begin
        if(en && min_gen_tic) begin
            if(min == 59) begin
                min <= 0;
            end else begin
            min <= min+ 1'b1;
            end
        end
    end 
end
endmodule
