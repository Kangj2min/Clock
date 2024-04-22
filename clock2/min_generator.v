`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 21:00:30
// Design Name: 
// Module Name: min_gen
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
clk,
reset_m,
sec_tic,
reset_all,
min,
min_tic,
    );
parameter P_MIN_BIT=6;
input clk,reset_m,sec_tic,reset_all;
output reg [P_MIN_BIT-1:0] min;
wire reset_all;
output min_tic;
assign min_tic = min ==59 & sec_tic ? 1'b1 : 1'b0;
always @ (posedge clk) begin
    if(reset_m) begin
        min <= 0;
    end else if(reset_all) begin
        min <= 0;
    end else begin
        if(sec_tic) begin
           min <= min + 1'b1;
           if(min==59) begin
                min <=0;
           end
        end 
     end
end
endmodule