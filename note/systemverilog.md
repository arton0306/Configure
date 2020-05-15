# data types (1800-2017 chapter 6)

## net types
*  net types: supply0 | supply1 | tri | triand | trior | trireg | tri0 | tri1 | uwire | wire | wand | wor
*  A net can be written by one or more continuous assignments, by primitive outputs, or through module ports.
The resultant value of multiple drivers is determined by the resolution function of the net type. A net cannot
be procedurally assigned. If a net on one side of a port is driven by a variable on the other side, a continuous
assignment is implied. (1800-2017 6.5 page 85)
*  If a data type is not specified in the net declaration or if only a range and/or signing is specified, then the data
type of the net is implicitly declared as logic. (1800-2017 6.7.1 page 98)
*  A valid data type for a net shall be one of the following: (1800-2017 6.7.1 page 98)
   *  A 4-state integral type, including a packed array or packed structure.
   *  A fixed-size unpacked array or unpacked structure, where each element has a valid data type for a net.
*  The default initialization value for a net shall be the value z. (1800-2017 6.7.1 page 98)

## var types
*  One form of variable declaration consists of a data type followed by one or more instances. (1800-2017 6.8 page 101)
*  Another form of variable declaration begins with the keyword var. The data type is optional in this case. If
a data type is not specified or if only a range and/or signing is specified, then the data type is implicitly
declared as logic. (1800-2017 6.8 page 101)

## integer

### signed/unsigned
*  default signed: byte, shortint, int, integer, longint
*  default unsigned: time, bit, reg, logic

### 2-state / 4-state (2017 6.11)
*  2-state: bit, byte, shortint, int, longint
*  4-state: logic, reg, integer, time
*  When a 4-state value is automatically converted to a 2-state value, any unknown or high-impedance bits shall be converted to zeros. (2017 6.11.2)

### default value
*  4-state integral: 'X (1800-2017 page 102) 
*  2-state integral: '0 (1800-2017 page 102) 
*  The default initialization value for a net shall be the value z. The trireg net is an exception. The trireg net shall default to the value x. (1800-2017 6.7.1 page 98)

### integer literal constants (2017 5.7.1)
*  1st form: simple decimal number
   *  i.g. 12345, -56789, 100
   *  signed
*  2nd form: based literal constant
   *  i.g. 5'd12, 4'B1010, 8'hFF, 3'sb111, 'b101
   *  unsigned if not using "s"
   *  case-insensitive
   *  the base specifications can be h, d, o, b
   *  optional signed "s" can be put before the base specification; it does not affect the bit pattern specified, only its interpretation
   *  a plus or minus operator preceding the size constant is a unary plus or minus operator
   *  if the size of the unsigned number is larger than the size specified for the literal constant, the unsigned number shall be truncated from the left
   *  if the size is not specified, the number is at least 32 bits
   *  special: '0, '1, 'X, 'x, 'Z, 'z, sets all bits to specified value
*  more example for 2nd form
   *  -4 'sd15 : this is equivalent to -(-4'd 1), or '0001'
   *  12'hx : a 12-bit unknown number
   *  `logic [15:0] a; a = '0;` : sets all 16 bits to 0 

# Term

### expression bit lengths (2017 11.6)

not easy, read the spec

### concatenation operators, replication operator (2017 11.4.12 11.4.12.1)

from <https://stackoverflow.com/questions/2102746/what-do-curly-braces-mean-in-verilog>

    input [15:0] a;  // 16-bit input
    output [31:0] result; // 32-bit output
    assign result = {{16{a[15]}}, {a[15:0]}};

### assignment patterns (2017 10.9)

Assignment patterns are used for assignments to describe patterns of assignments to structure fields and
array elements.

    var int A[N] = '{default:1};
    var integer i = '{31:1, 23:1, 15:1, 8:1, default:0};
    typedef struct {real r, th;} C;
    var C x = '{th:PI/2.0, r:1.0};
    var real y [0:1] = '{0.0, 1.1}, z [0:9] = '{default: 3.1416};
    
    var int B[4] = '{a, b, c, d};
    var C y = '{1.0, PI/2.0};
    '{a, b, c, d} = B;

### simple bit vector type (2017 6.11.1)

refer to the data types that can directly represent a one-dimensional packed array of bits.

### DUT
The semiconductor device being tested is often called the DUT(Device Under Test). It is also sometimes called a UUT(Unit Under Test).

### PLI

Verilog PLI(Programming Language Interface )

### non-ANCI style module header (2017 23.2.1)
*   The non-ANCI style separates the definition of the module header from the declarations of the
module ports and internal data. i.g. `module mymod(a,b,c); ...`
*   The syntax is similiar the pre-ANCI(K&R) style of function definition, which is obsolete in C language.

### concurrent assertion / immediate assertion
*   immediate assertion: assert ...
*   concurrent assertion: assert property ...

#### an example of immediate assertion
    always @(posedge clk)
        if (state == REQ)
            assert (req1 || req2);
            else begin
                t = $time;
                #5 $error("assert failed at time %0t",t);
            end

# Cook Book

### function

    function logic[31:0] myfunc(int a, int b); 
        myfunc = a+b;
    endfunction

    function logic[31:0] myfunc2(int a, int b); 
        return a+b;
    endfunction
  
### task

    task mytask(input a, input b); 
    endtask

    module top(input int a, input int b, output int out);
        initial 
            mytask(a,b);
    endmodule
