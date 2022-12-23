# SVproject2hchou
Makeup Project 2

This is a 16 bit ripple carry adder/subtractor. It reads in 2 16 bit two's integers from the memfile and includes a function bit. The function bit determines if the ripple carry will perform adding or subtracting. It uses xor gates that take in the function bit along with the second input bits, which help determine the arithmetic function. Then the ripple carry inputs them into 16 consecutive full adders and finally prints out the sum. An overflow bit is included if the sum goes over 16 bits.

This system contains 3 modules:
stage4: Modified function from the lab which is used to read in pairs of 16 bit integers
halfadder: a half adder that contains an and and xor gate and used in the full adder as a component
addsub: a standard full adder that contains 2 half adders and an or gate.
ripplecarry: the 16 bit ripple carry that includes 16 xor gates to determine the arithmetic operation and 16 full adders which will carry out the addition/subtraction of these numbers. In this case, subtraction is done by adding a positive integer and a negative integer.

To test the file, use the testbench.sv file and the design.sv file in edaplayground. There is an option to run the ripplecarry module with delays and without delays by uncommenting and commenting the xor/and/or gates. Instructions are also stated in the file. 
Make sure to comment out all modules in testbench.sv except the module to be tested. When pressing run in EDAplayground, testbench results will be displayed in the command shell at the bottom of the page. 

Has the option to run with delays and without delays. Delays are calculated from values for xor/or/buf/and gates provided to me by Texas Instruments, am currently waiting for the link to reference the pages I was provided.
