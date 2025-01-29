module hw8 (output reg out,
				input wire clk, reset, in);
	reg [1:0] current_state; 
	reg [1:0] next_state;
	parameter A = 0,
				 B = 1,
				 C = 2,
				 D = 3;

	always @ (posedge clk or posedge reset)
		begin: STATE_MEMORY
			if (reset)
				current_state <= A;
			else 
				current_state <= next_state;
		end
	
	
	always @ (current_state or in)      
		begin: NEXT_STATE_LOGIC
			case (current_state)
				A: if (in)
						next_state = B;
					else 
					   next_state = A;
				B: if (in)
						next_state = C;
					else
						next_state = A;
				C: if (!in)
						next_state = D;
					else
						next_state = C;
				D: if (in)
						next_state = B;
					else
						next_state = A;
			endcase
		end
	
	always @ (current_state or in)
		begin: OUTPUT_LOGIC
			case (current_state)
				A : out = 0;
				B : out = 0;
				C : out = 0;
				D : if (in)
						out = 1;
					 else
						out = 0;
			endcase
		end
endmodule
			
				 