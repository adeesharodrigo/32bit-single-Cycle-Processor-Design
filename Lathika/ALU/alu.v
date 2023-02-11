module alu(

input [31:0] in_1,
input [31:0] in_2,
input [3:0] alu_ctrl,

output reg [31:0] alu_out,
output zero

);


always @ (*)
begin
	case (alu_ctrl)
		4'b0000 : alu_out = in_1 + in_2; //add
		4'b0001 : alu_out = in_1 - in_2; //sub
		4'b0010 : alu_out = in_1<< in_2; //shift left
		4'b0011 : alu_out = in_1 >> in_2; //shift right
		4'b0100 : alu_out = $signed(in_1) >>> in_2; //shift arithmatic left (keep the sign)
		4'b0101 : alu_out = ~in_1		 ;	//invert
		4'b0110 : alu_out = in_1 | in_2; //or
		4'b0111 : alu_out = in_1 & in_2; //and
		4'b1000 : begin if (in_1>in_2) alu_out =32'b1; else alu_out = 32'b0; end //compaier
		
		default : alu_out = in_1 + in_2;
	endcase
	
end
assign zero = (alu_out == 32'b0) ? 1'b1 : 1'b0;
		

endmodule