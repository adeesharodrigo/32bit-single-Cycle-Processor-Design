//`include "ifu.v"
module ifu_tb(

);
    reg clk, ins_rd;
    wire [31:0] instruction;

    ifu IFU(clk,ins_rd,instruction);

    initial
    begin
        $dumpfile("IFU_output_wave.vcd");
        $dumpvars(0,ifu_tb);
    end

   
    initial
    $monitor($time, "clk = %b, ins_rd = %b, instruction = %h", clk,ins_rd,instruction);

    
    initial
    begin
        ins_rd = 1'b0;
        #20 ins_rd = 1'b1;
        #200 ins_rd = 1'b0;
        #100 ins_rd = 1'b1;
    end

 
    initial
    begin
        clk = 1;
        forever #20 clk = ~clk;
    end

    //initial
    //#400 $finish;

endmodule