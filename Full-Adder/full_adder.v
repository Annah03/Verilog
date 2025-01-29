//A Full Adder is composed of two xor gates, two and gates, and one or gate
module full_adder
		(
			output wire S, C_out,
			input wire A, B, C_in
		);
wire XOR1_out, AND1_out, AND2_out;
		assign XOR1_out = A ^ B;
		assign AND1_out = XOR1_out && C_in;
		assign AND2_out = A && B;
		assign S = XOR1_out ^ C_in;
		assign C_out = AND1_out || AND2_out;
endmodule
