# type

## net type (2017 6.7)
*  supply0 | supply1 | tri | triand | trior | trireg | tri0 | tri1 | uwire | wire | wand | wor
*  If a data type is not specified in the net declaration or if only a range and/or signing is specified, then the data
type of the net is implicitly declared as logic.
*  A valid data type for a net shall be one of the following:
   *  A 4-state integral type, including a packed array or packed structure.
   *  A fixed-size unpacked array or unpacked structure, where each element has a valid data type for a net.
*  The default initialization value for a net shall be the value z.

## integer

### signed/unsigned
*  default signed: byte, shortint, int, integer, longint
*  default unsigned: time, bit, reg, logic

### 2-state / 4-state (2017 6.11)
*  2-state: bit, byte, shortint, int, longint
*  4-state: logic, reg, integer, time

### default value
*  4-state integral: 'X
*  2-state integral: '0

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

### simple bit vector type (2017 6.11.1)

refer to the data types that can directly represent a one-dimensional packed array of bits.

### PLI

Verilog PLI(Programming Language Interface )

### non-ANCI style module header (2017 23.2.1)
*   The non-ANCI style separates the definition of the module header from the declarations of the
module ports and internal data. i.g. `module mymod(a,b,c); ...`
*   The syntax is similiar the pre-ANCI(K&R) style of function definition, which is obsolete in C language.

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
