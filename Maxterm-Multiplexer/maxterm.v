module maxterm (output wire F,
					 input wire A, B, C);
		//internal nets
		wire An, Bn, Cn;  
		wire M0, M1, M3, M5, M7;
		
		//not's
		assign An = ~A;  
		assign Bn = ~B;
		assign Cn = ~C;
		
		//implement maxterms
		assign M0 = A || B || C;
		assign M1 = A || B || Cn;
		assign M3 = A || Bn || Cn;
		assign M5 = An || B || Cn;
		assign M7 = An || Bn || Cn;
		
		//POS
		assign F = M0 && M1 && M3 && M5 && M7;
		
		endmodule