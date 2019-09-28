`timescale 1ns/100ps

module two_digits(
  input inc,
  output reg [1:0][3:0] d,
  output reg carry);
  
  parameter MAX = 24;
  
  wire dummy;
  reg carry0;
  wire [1:0][3:0] t;
  reg rstn;
  
  one_digit #(.MAX(9)) d1(
    .inc(carry0),
    .rstn(rstn),
    .d(t[1]),
    .carry(dummy));
  one_digit #(.MAX(9)) d0(
    .inc(inc),
    .rstn(rstn),
    .d(t[0]),
    .carry(carry0));
 
  initial rstn = 1;
  
  always @ * begin
    if (t[1]==MAX/10 && t[0]==MAX%10) begin
      carry <= 1;
      d <= 0;
      rstn <= 0;
      #0.2 rstn <= 1;
    end
    else begin
      carry <= 0;
      d <= t;
    end
  end
  
endmodule

