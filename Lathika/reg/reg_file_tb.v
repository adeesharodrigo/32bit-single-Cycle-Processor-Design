`timescale 1ns/1ps

module reg_file_tb;

reg [4:0] rd, rs_1, rs_2;
reg reg_wrt_en , clk;
reg [31:0] rd_data;
wire [31:0] rs_1_data, rs_2_data;

initial 
begin
$monitor("simtime=%g, clk=%b reg_wrt_en=%b, rd=%b, rd_data=%b,rs_1=%b, rs_2 =%b, rs_1_data=%b, rs_2_data=%b ",$time, clk, reg_wrt_en, rd, rd_data, rs_1, rs_2, rs_1_data, rs_2_data);
end

reg_file regf(.clk(clk), .reg_wrt_en(reg_wrt_en), .rd(rd),.rd_data(rd_data), .rs_1(rs_1), .rs_2(rs_2), .rs_1_data(rs_1_data), .rs_2_data(rs_2_data)); // module installation

initial 
begin

	#5 clk=1'b0; reg_wrt_en=1'b0; rd= 5'b00000; rd_data=32'b01000000000000000000000011001101; rs_1 =5'b00000; rs_2 =5'b00001;
	#5 clk=1'b1; reg_wrt_en=1'b0; rd= 5'b00000; rd_data=32'b01000000000000000000000011001101; rs_1 =5'b00000; rs_2 =5'b00001;
	
	#5 clk=1'b0; reg_wrt_en=1'b1; rd= 5'b00000; rd_data=32'b01000000000000000000000011001101; rs_1 =5'b00000; rs_2 =5'b00001;
	#5 clk=1'b1; reg_wrt_en=1'b1; rd= 5'b00000; rd_data=32'b01000000000000000000000011001101; rs_1 =5'b00000; rs_2 =5'b00001;
	
	#5 clk=1'b0; reg_wrt_en=1'b0; rd= 5'b00010; rd_data=32'b01000000000000000000000011001111; rs_1 =5'b00000; rs_2 =5'b00010;
	#5 clk=1'b1; reg_wrt_en=1'b0; rd= 5'b00010; rd_data=32'b01000000000000000000000011001111; rs_1 =5'b00000; rs_2 =5'b00010;
	
	#5 clk=1'b0; reg_wrt_en=1'b0; rd= 5'b00010; rd_data=32'b01000000000000000000000011001111; rs_1 =5'b00000; rs_2 =5'b00010;
	#5 clk=1'b1; reg_wrt_en=1'b0; rd= 5'b00010; rd_data=32'b01000000000000000000000011001111; rs_1 =5'b00000; rs_2 =5'b00010;

end

endmodule
