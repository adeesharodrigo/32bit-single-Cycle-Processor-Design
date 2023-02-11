//`include "ifu_mem.v"

module ifu(
	input clk,ins_rd, 
	output [31:0] instruction
);

reg [31:0] pc;

initial
begin
	if (ins_rd==1'b1)
		begin
			pc = 32'b0;
		end
end

ifu_mem mem(pc,ins_rd,instruction);


always @(posedge clk, posedge ins_rd)
    begin
        if(ins_rd == 1'b1)  
        pc <= 0;
        else
        pc <= pc+4;   
    end
endmodule