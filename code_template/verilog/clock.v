`timescale 1ns/100ps

module clock_hhmm(
  input clk,
  output reg [3:0][3:0] d);
  
  wire carry_from_mm;
  wire dummy;
  // wire [3:0][3:0] t;
  
  two_digits #(.MAX(24)) hh(
    .inc(carry_from_mm),
    .d({d[3], d[2]}),
    .carry(dummy));
  two_digits #(.MAX(60)) mm(
    .inc(clk),
    .d({d[1], d[0]}),
    .carry(carry_from_mm));
  
  // assign d = t;
  
 
endmodule

