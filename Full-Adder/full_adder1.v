module full_adder1 (output wire s, C_out,
						  input wire a,b,c);

wire w1, w2, w3;
xor x1(w1, a, b),
	 x2(s, c, w1);
nand n2(w2, a, b),
	  n1(w3, w1, c),
	  n3(C_out, w3, w2);
endmodule
	 