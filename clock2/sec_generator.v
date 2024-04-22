`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 20:43:06
// Design Name: 
// Module Name: sec_generator
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
clk,
reset_s,
reset_all,
en,
i_freq,
sec,
sec_tic
);
parameter P_COUNT_BIT=30;
parameter P_SEC_BIT=6;

input  clk,reset_s,reset_all,en;
input [P_COUNT_BIT-1:0] i_freq;

wire reset_all;
output reg [P_SEC_BIT-1:0] sec;
output sec_tic;

assign sec_tic = sec==59 ? 1'b1 : 1'b0;
reg [P_COUNT_BIT-1:0] r_counter;
 always @ (posedge clk) begin
    if(reset_s) begin
        r_counter <= {P_COUNT_BIT{1'b0}};
        sec <= 6'b000_000;
    end else if (reset_all) begin
        r_counter <= {P_COUNT_BIT{1'b0}};
        sec <= 0;

    end else begin
        if(en) begin
            if(r_counter == i_freq-1) begin
                r_counter <= 0;
                sec <= sec + 1'b1;
                if(sec == 59) begin
                    sec <= 0;
                end
             end else begin
                r_counter <= r_counter +1'b1;
             end
        end
        else begin
            sec <= 6'b000_000;
             r_counter <= 0;
        end
    end
end
endmodule