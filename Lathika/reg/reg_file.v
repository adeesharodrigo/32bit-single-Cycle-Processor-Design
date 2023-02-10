// reg_file_31 registers (without pc)
`timescale 1ns/1ps

module reg_file(
	input clk,
	//reg_write
	input reg_wrt_en,
	input [4:0] rd,
	input [31:0] rd_data,
	//reg_read
	input [4:0] rs_1,
	input [4:0] rs_2,
	
	output [31:0] rs_1_data,
	output [31:0] rs_2_data

);

	reg [31:0] reg_block [30:0];
	integer i;
	
	initial begin
		for (i=0;i<31; i=i+1)
		reg_block[i] = 32'b0;
	end
	
	always @ (posedge clk) begin
	if (reg_wrt_en) begin 
		reg_block[rd] = rd_data;
	end
	end
	
	assign rs_1_data = reg_block[rs_1];
	assign rs_2_data = reg_block[rs_2];
	
	endmodule