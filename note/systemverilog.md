# module port

### ANSI style port list (1800-2017 page 703)
*  If the direction is omitted, it shall default to inout.
*  If the data type is omitted, it shall default to logic, except for interconnect ports, which have no
data type.
*  For input and inout ports, the port shall default to a net of default net type. The default net
type can be changed using the `default_nettype` compiler directive.
*  If the data type is omitted or declared with the implicit_data_type syntax, the port kind
shall default to a net of default net type. 
*  many examples in page 704

# naming

*  Implementations may set a limit on the maximum length of identifiers, but the limit shall be at least 1024 characters. If an identifier exceeds the implementation-specific length limit, an error shall be reported. (1800-2017 page 70)
*  Escaped identifiers shall start with the backslash character (\) and end with white space (space, tab, newline). They provide a means of including any of the printable ASCII characters in an identifier (the decimal values 33 through 126, or 21 through 7E in hexadecimal). Neither the leading backslash character nor the terminating white space is considered to be part of the identifier. Therefore, an escaped identifier \cpu3 is treated the same as a nonescaped identifier cpu3. (1800-2017 page 70)

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
*  Conversions between signed and unsigned values shall keep the same bit representation; only the interpretation changes. (1800-2017, 11.4.3.1)

### 2-state / 4-state (2017 6.11)
*  2-state: bit, byte, shortint, int, longint
*  4-state: logic, reg, integer, time
*  When a 4-state value is automatically converted to a 2-state value, any unknown or high-impedance bits shall be converted to zeros. (2017 6.11.2)

### default value
*  4-state integral: 'X (1800-2017 page 102, table 6.7) 
*  2-state integral: '0 (1800-2017 page 102, table 6.7) 
*  The default initialization value for a net shall be the value z. The trireg net is an exception. The trireg net shall default to the value x. (1800-2017 6.7.1 page 98)

### integer literal constants (2017 5.7.1)
*  1st form: simple decimal number
   *  i.g. 12345, -56789, 100 (page 73)
   *  signed (page 73: simple decimal numbers without the size and the base format shall be treated as signed integers.)
*  2nd form: based literal constant
   *  i.g. 5'd12, 4'B1010, 8'hFF, 3'sb111, 'b101
   *  unsigned if not using "s"
   *  case-insensitive
   *  the base specifications can be h, d, o, b
   *  optional signed "s" can be put before the base specification; it does not affect the bit pattern specified, only its interpretation
   *  a plus or minus operator preceding the size constant is a unary plus or minus operator
   *  if the size of the unsigned number is larger than the size specified for the literal constant, the unsigned number shall be truncated from the left
   *  if the size is not specified, the number is ~~at least~~ 32 bits (1800-2017 Table 11-21, page 283)
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
*   immediate assertion: `assert ...`
*   deferred assertion: `assert #0 ...` also name "deferred immediate assertion", one kind of immediate assertion
*   concurrent assertion: `assert property ...`

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
    
# Confusing Parts

### macro define (1800-2017)
*   In page 678, it says "The text specified for macro text shall not be split across the following lexical tokens: comments, numbers, string literals, identifiers, keywords, operators". However, in page 680, it provides some mechanism to construct string literals and identifiers.
*   In page 680, it says macro text can include \`\", \`\\\`\", and \`\`; however, nothing about other usage. Is single backslash(\\) also available? What is the meaning of the code below? (The user might want use macro to construct identifier with leading backslash.)

    \`define ABC(a) \\\`\`a\`\`_set
    
### connecting module instance ports by name (1800-2017)
In page 712, section 23.3.2.2, it says `Multiple module instance port connections are not allowed.`, for example,

    module test;
        A ia (.i(a), .i(b));   // illegal connection of input port twice
    endmodule
    
    module A(input i);
    endmodule

but how about `A ia (.i(), .i(b));` or `A ia (.i(), .i());`

### based literal constant without specifying the size
*   In 1800-2017 Table 11-21, page 283, it says the bit length is "same as integer".
*   In 1800-2017 page 73, it says the number of bits that make up an unsized number (which is a simple decimal number or a number with a base specifier but no size specification) shall be at least 32.
