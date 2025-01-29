module hw7(output reg z,
			  input wire clk, reset, w);
	reg current_state, next_state;
	parameter A = 2'b00, 
				 B = 2'b01,
				 C = 2'b10;
			  
	always @ (posedge clk) //synchronous active high reset
		begin: STATE_MEMORY
			if (reset)
				current_state <= A;
			else 
				current_state <= next_state;
		end
	always @ (current_state or w)
		begin: NEXT_STATE_LOGIC
			case (current_state)
				A : if (w==0)
						next_state = A;
					 else
						next_state = B;
				B : if (w==0)
						next_state = A;
					 else
						next_state = C;
				C : if (w==0)
						next_state = A;
					 else
						next_state = C;
			endcase
		end
	always @ (current_state or w)
		begin: OUTPUT_LOGIC
			case (current_state)
				A : z = 0;
				B : if (w==0)
						z = 0;
					 else 
						z = 1;
				C : if (w==0)
						z = 0;
					 else
						z = 1;
			 endcase
		end
endmodule
						
			
		
	