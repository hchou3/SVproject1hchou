/* *************************************************************
/* ***************************************************************
| Name of program :CSE341 SV Makeup Project

| Author: Henry Chou
| Date Created : 2/10/22
| Date last updated : 2/10/22
| Function : Full adder
| Method : making adder and 16 bit adder in Icarus Verilog 
| Additional Comments : \***********************************************************/
//`timescale 1ns/100ps
/*module hf_tb;
  reg atb, btb;// half adder inputs
  wire stb, ctb;//half adder outputs
  
  halfadder dut(.a(atb),.b(btb),.s(stb),.c(ctb));
   //half adder test function
  initial 
    begin
      $dumpfile("hf.vcd");
      $dumpvars;
  end
  always 
    begin
      atb=0; btb=0; //test cases for halfadder
      #2
      atb=1; btb=0; 
      #2
      atb=0; btb=1;
      #2
      atb=1; btb=1;
      #2
      $finish;
    end 
  
  initial 
    begin
     $display(" INPUT  |OUTPUT\n");
      $display(" A | B | S | C");//display outputs for half adder, should match the chart
      $monitor(" %b   %b   %b   %b ",atb,btb,stb,ctb);
  end
endmodule */

/*module addsub_tb;
  reg atb, btb, cintb;//adder inputs
  wire stb, ctb;// adder outputs
  
  addsub dut(.a(atb),.b(btb),.cin(cintb),.s(stb),.cout(ctb));//adder inputs 
  
  initial 
    begin
      $dumpfile("addersub.vcd");
      $dumpvars;
  end
  always 
    begin
      atb=0; btb=0; cintb=0; //test cases for add/sub, make sure it matches the chart
      #1
      atb=0; btb=0; cintb=1;
      #1
      atb=0; btb=1; cintb=0;
      #1
      atb=0; btb=1; cintb=1;
      #1
      atb=1; btb=0; cintb=0;
      #1
      atb=1; btb=0; cintb=1;
      #1
      atb=1; btb=1; cintb=0;
      #1
      atb=1; btb=1; cintb=1;
      #1
      $finish;
    end 
  
  initial 
    begin
      $display(" INPUT      |OUTPUT");
      $display(" A |B |Cin |Cout | S ");//display chart for EDAplayground
      $monitor(" %b  %b   %b    %b     %b",atb,btb,cintb,ctb,stb);
  end
endmodule*/

/*module ripple_tb;
  reg [15:0]atb,btb;
  reg cintb;
  reg [4:0]addtb;// address for read in
  wire [15:0]stb;
  wire coutb;
  // ripple carry variables
  
  initial //initial address to begin
    begin
      addtb = 5'b00;// first address
      cintb = 0;//initial value set to add
    end
  
  stage4 d1(.addr(addtb),.rd1(atb),.rd2(btb));//read in function
  ripplecarry d2(.a(atb),.b(btb),.c_in(cintb),.s(stb),.cout(coutb));//ripple carry function for testing
  
  always 
    begin	
      #1348 addtb += 1; // time for all delays: 70 for FA * 16 bits + 14.25 xor * 16 bits
      #1 cintb=1;
    end
  
  initial 
    begin
      $dumpfile("ripcarry.vcd");
      $dumpvars;
  end
  
  initial // display outputs of the ripple carry adder here
    begin
      $display(" INPUT      |OUTPUT");
      $display(" addr       A    		   B     	     Cin  Cout S ");
      $monitor(" %b     %b      %b    %b     %b  %b",addtb, atb,btb,cintb,coutb,stb);
  end
  initial #13480 $finish;//timestamp set to 13480 since there are 10 tests in the memfile, tests should end at this time
endmodule*/
