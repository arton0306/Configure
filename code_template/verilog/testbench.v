`timescale 1ns/100ps

module one_digit_TB();
  reg clk;
  reg rstn;
  wire [3:0] d;
  wire carry;
  
  one_digit m0(.inc(clk), .rstn(rstn), .d(d), .carry(carry));
  
  always #0.5 clk = ~clk;
  
  initial begin
    // $dumpfile("one_digit.vcd");
    // $dumpvars(1, m0);
    clk = 0;
    rstn = 1;
    
    //#30 $finish;
  end
  
endmodule

module two_digits_TB();
  reg clk;
  wire [1:0][3:0] d;
  wire carry;
  
  two_digits #(.MAX(60)) hh(.inc(clk), .d(d), .carry(carry));
  
  always #0.5 clk = ~clk;
  
  initial begin
    // $dumpfile("two_digits.vcd");
    // $dumpvars(1, hh);
    clk = 0;
    
    // #200 $finish;
  end
  
endmodule

module clock_hhmm_TB();
  reg clk;
  wire [3:0][3:0] d;
  
  clock_hhmm hhmm(.clk(clk), .d(d));
  
  always #0.5 clk = ~clk;
  
  initial begin
    $dumpfile("hhmm.vcd");
    $dumpvars(1, hhmm);
    clk = 0;
    
    #5000
    $finish;
  end
  
endmodule

