from <https://stackoverflow.com/questions/2102746/what-do-curly-braces-mean-in-verilog>

    input [15:0] a;  // 16-bit input
    output [31:0] result; // 32-bit output
    assign result = {{16{a[15]}}, {a[15:0]}};

In 1800-2017 LRM:
* 11.4.12 Concatenation operators
* 11.4.12.1 Replication operator
