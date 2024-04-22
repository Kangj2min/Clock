//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date: 2024.04.01
// License : https://github.com/matbi86/matbi_fpga_season_1/blob/master/LICENSE
// Design Name: top_clock_AXI
// Module Name: top_clock_AXI
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

module top_clock_AXI #
(
	// Users to add parameters here

	// User parameters ends
	// Do not modify the parameters beyond this line


	// Parameters of Axi Slave Bus Interface S00_AXI
	parameter integer C_S00_AXI_DATA_WIDTH	= 32,
	parameter integer C_S00_AXI_ADDR_WIDTH	= 4
)
(
	// (lab3) Users to add ports here
    input [3:0] sw,  // enable
    output [3:0] led, // blink each sec, min, hour 

	// User ports ends
	// Do not modify the ports beyond this line


	// Ports of Axi Slave Bus Interface S00_AXI
	input wire  s00_axi_aclk,
	input wire  s00_axi_aresetn,
	input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
	input wire [2 : 0] s00_axi_awprot,
	input wire  s00_axi_awvalid,
	output wire  s00_axi_awready,
	input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
	input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
	input wire  s00_axi_wvalid,
	output wire  s00_axi_wready,
	output wire [1 : 0] s00_axi_bresp,
	output wire  s00_axi_bvalid,
	input wire  s00_axi_bready,
	input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
	input wire [2 : 0] s00_axi_arprot,
	input wire  s00_axi_arvalid,
	output wire  s00_axi_arready,
	output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
	output wire [1 : 0] s00_axi_rresp,
	output wire  s00_axi_rvalid,
	input wire  s00_axi_rready
);

	wire [31:0] w_freq;
	wire [31:0] w_time;

// Instantiation of Axi Bus Interface S00_AXI
	ip_v1_0 # ( 
		.C_S00_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S00_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) ip_v1_0_inst (

		// (lab3) Users to add ports here
		.o_freq(w_freq),
		.i_time(w_time),

		.s00_axi_aclk	(s00_axi_aclk	),
		.s00_axi_aresetn(s00_axi_aresetn),
		.s00_axi_awaddr	(s00_axi_awaddr	),
		.s00_axi_awprot	(s00_axi_awprot	),
		.s00_axi_awvalid(s00_axi_awvalid),
		.s00_axi_awready(s00_axi_awready),
		.s00_axi_wdata	(s00_axi_wdata	),
		.s00_axi_wstrb	(s00_axi_wstrb	),
		.s00_axi_wvalid	(s00_axi_wvalid	),
		.s00_axi_wready	(s00_axi_wready	),
		.s00_axi_bresp	(s00_axi_bresp	),
		.s00_axi_bvalid	(s00_axi_bvalid	),
		.s00_axi_bready	(s00_axi_bready	),
		.s00_axi_araddr	(s00_axi_araddr	),
		.s00_axi_arprot	(s00_axi_arprot	),
		.s00_axi_arvalid(s00_axi_arvalid),
		.s00_axi_arready(s00_axi_arready),
		.s00_axi_rdata	(s00_axi_rdata	),
		.s00_axi_rresp	(s00_axi_rresp	),
		.s00_axi_rvalid	(s00_axi_rvalid	),
		.s00_axi_rready	(s00_axi_rready	)
	);

localparam P_COUNT_BIT = 30; // (default) 30b, under 1GHz. 2^30 = 1073741824
localparam P_SEC_BIT	 = 6; // 2^6 = 64
localparam P_MIN_BIT	 = 6; // 2^6 = 64 
localparam P_HOUR_BIT = 5; // 2^5 = 32 

wire clk = s00_axi_aclk;
wire i_run_en = sw[0];
wire [P_COUNT_BIT-1:0] 	i_freq = w_freq[P_COUNT_BIT-1:0];
wire [P_SEC_BIT-1:0]	sec;
wire [P_MIN_BIT-1:0]	min;
wire [P_HOUR_BIT-1:0]	hour;

assign w_time = {15'b0, hour, min, sec};

assign led[0] = sec[0];
assign led[1] = min[0];
assign led[2] = hour[0];

reg reset;
always @(posedge clk) begin
	reset <= !s00_axi_aresetn;
end

top_clock 
# (
	.P_COUNT_BIT	(P_COUNT_BIT),
	.P_SEC_BIT	 	(P_SEC_BIT	),
	.P_MIN_BIT	 	(P_MIN_BIT	),
	.P_HOUR_BIT		(P_HOUR_BIT	)
) u_top_clock(
	.clk 				(clk),
	.reset 				(reset),
	.i_run_en			(i_run_en),
	.i_freq				(i_freq),
    .sec				(sec ),
    .min				(min ),
    .hour				(hour)
);

endmodule
