`timescale 1ns/1ns

module one_digit(
  input inc,
  input rstn,
  output reg [3:0] d,
  output reg carry);
  
  parameter MAX = 9;
  
  initial d = 0;
  
  always @(posedge inc, negedge rstn) begin
    if (!rstn) begin
      d <= 0;
      carry <= 0;
    end
    else begin
    	d = (d == MAX ? 0 : d+1);
    	carry = (d == 0);
  	end
  end
 
endmodule
