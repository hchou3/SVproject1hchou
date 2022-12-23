/*************************************************************
/*************************************************************
| Name of program :CSE341 SV Makeup Project

| Author: Henry Chou
| Date Created : 2/10/22
| Date last updated : 2/10/22
| Function : Full adder
| Method : making adder and 16 bit adder in Icarus Verilog 
| Additional Comments : 
\***********************************************************/
`timescale 1ns/100ps
module stage4(addr, rd1, rd2);// stage 4 read in
  input  [4:0]  addr;//5 bit address for the register
  output [15:0] rd1, rd2;//16 bit registers to store read
  reg [15:0] RAM[15:0][1:0]; //internal variables to store the data being read from the file
  initial
    begin
      $readmemb("memfile.dat", RAM); // initialize memory in binary
    end
  assign rd1 = RAM[addr][0]; // word aligned for rd1 in one column in file
  assign rd2 = RAM[addr][1]; // word aligned for rd2 in other column in file
	// memory loaded in as pair of columns
endmodule 

module halfadder(a,b,s,c);
  input a,b;// inputs
  output s,c;//outputs
  
  xor #14.25 (s,a,b);//xor + and gates take inputs and produce outputs
  and #14.75 (c,a,b);
  //xor (s,a,b);//xor + and gates take inputs and produce outputs
  //and (c,a,b); uncomment this and comment above to turn off delays
endmodule 

module addsub(a,b,cin,s,cout);//FA w/o delays 
  input a,b,cin;//input and ouput for FA
  output s,cout;
  wire h1_s, h1_c,h2_c;//result for HF1 and HF2 connects to next gates 
  halfadder hf1(a,b,h1_s,h1_c);//HF1
  halfadder hf2(h1_s,cin,s,h2_c);//HF2
  or #12 (cout,h1_c,h2_c); //Ending or gate 
  //or #12 (cout,h1_c,h2_c); //uncomment to turn off delaus
endmodule

module ripplecarry(a,b,c_in,s,cout);
  input [15:0]a;
  input [15:0]b;//input bits 
  input c_in;//carry in and function bit
  
  wire [15:0]asb;// xor bits
  wire c_in1,c_in2,c_in3,c_in4,c_in5,c_in6,c_in7,c_in8,c_in9,c_in10,c_in11,c_in12,c_in13,c_in14,c_in15;//carry out 
  
  output [15:0]s;
  output cout; 
  //xor gates used to determine the operation (+/-)
  /*xor (asb[0],b[0],c_in);
  xor (asb[1],b[1],c_in);
  xor (asb[2],b[2],c_in);
  xor (asb[3],b[3],c_in);
  xor (asb[4],b[4],c_in);
  xor (asb[5],b[5],c_in);
  xor (asb[6],b[6],c_in);
  xor (asb[7],b[7],c_in);
  xor (asb[8],b[8],c_in);
  xor (asb[9],b[9],c_in);// w/odelays
  xor (asb[10],b[10],c_in);
  xor (asb[11],b[11],c_in);
  xor (asb[12],b[12],c_in);
  xor (asb[13],b[13],c_in);
  xor (asb[14],b[14],c_in);
  xor (asb[15],b[15],c_in);*/
  
  xor #14.25 (asb[0],b[0],c_in);
  xor #14.25 (asb[1],b[1],c_in);
  xor #14.25 (asb[2],b[2],c_in);
  xor #14.25 (asb[3],b[3],c_in);
  xor #14.25 (asb[4],b[4],c_in);
  xor #14.25 (asb[5],b[5],c_in);
  xor #14.25 (asb[6],b[6],c_in);
  xor #14.25 (asb[7],b[7],c_in);
  xor #14.25 (asb[8],b[8],c_in);
  xor #14.25 (asb[9],b[9],c_in);// w/ delays
  xor #14.25 (asb[10],b[10],c_in);
  xor #14.25 (asb[11],b[11],c_in);
  xor #14.25 (asb[12],b[12],c_in);
  xor #14.25 (asb[13],b[13],c_in);
  xor #14.25(asb[14],b[14],c_in);
  xor #14.25(asb[15],b[15],c_in);
  
  addsub fa0(a[0],asb[0],c_in,s[0],c_in1);
  addsub fa1(a[1],asb[1],c_in1,s[1],c_in2);
  addsub fa2(a[2],asb[2],c_in2,s[2],c_in3);
  addsub fa3(a[3],asb[3],c_in3,s[3],c_in4);
  addsub fa4(a[4],asb[4],c_in4,s[4],c_in5);
  addsub fa5(a[5],asb[5],c_in5,s[5],c_in6);
  addsub fa6(a[6],asb[6],c_in6,s[6],c_in7);
  addsub fa7(a[7],asb[7],c_in7,s[7],c_in8);
  addsub fa8(a[8],asb[8],c_in8,s[8],c_in9);
  addsub fa9(a[9],asb[9],c_in9,s[9],c_in10);//full adder/subtractors that make the ripple carry 
  addsub fa10(a[10],asb[10],c_in10,s[10],c_in11);
  addsub fa11(a[11],asb[11],c_in11,s[11],c_in12);
  addsub fa12(a[12],asb[12],c_in12,s[12],c_in13);
  addsub fa13(a[13],asb[13],c_in13,s[13],c_in14);
  addsub fa14(a[14],asb[14],c_in14,s[14],c_in15);
  addsub fa15(a[15],asb[15],c_in15,s[15],cout);// last full adder with carry out bit/ overflow 
endmodule
