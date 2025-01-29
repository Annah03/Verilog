module multiplexer (output wire y,
						  input wire a, b, c, d, e, f, g, s0, s1,
						  input wire [1:0] Sel);
						  
		 //determine results of first multiplexer
		 wire f1;
		 
		 //first multiplexer
		 assign f1 = (a && ~s0 && ~s1) ||
						 (b && ~s1 && s0)  ||
						 (c && s1 && ~s0)  ||
						 (d && s1 && s0);
						 
		 //second multiplexer
		 assign y = (f1 && ~Sel[1] && ~Sel[0]) ||
						(e && ~Sel[1] && Sel[0])   || 
						(f && Sel[1] && ~Sel[0])   ||
						(g && Sel[1] && Sel[0]);		
	    endmodule