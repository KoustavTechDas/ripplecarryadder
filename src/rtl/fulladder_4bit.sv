//Half Adder
module halfadder(
  input h_a,h_b,
  output h_s,h_c
);
  assign h_s = h_a ^ h_b;
  assign h_c = h_a & h_b;
endmodule


//1 bit Full Adder
module fulladder_1bit(
  input f_a,f_b,f_cin,
  output f_s,f_c
);
  wire s0,c0,c1;
  halfadder HA0 (.h_a(f_a), .h_b(f_b), .h_s(s0), .h_c(c0));
  halfadder HA1 (.h_a(s0), .h_b(f_cin), .h_s(f_s), .h_c(c1));
  assign f_c = c0 | c1;
endmodule


//4 bit Full Adder
module fulladder_4bit(
  input [3:0] A,B,
  input Cin,
  output [3:0] Sum,
  output Cout
);
  wire c0,c1,c2;
  fulladder_1bit FA0 (.f_a(A[0]), .f_b(B[0]), .f_cin(Cin), .f_s(Sum[0]), .f_c(c0));
  fulladder_1bit FA1 (.f_a(A[1]), .f_b(B[1]), .f_cin(c0), .f_s(Sum[1]), .f_c(c1));
  fulladder_1bit FA2 (.f_a(A[2]), .f_b(B[2]), .f_cin(c1), .f_s(Sum[2]), .f_c(c2));
  fulladder_1bit FA3 (.f_a(A[3]), .f_b(B[3]), .f_cin(c2), .f_s(Sum[3]), .f_c(Cout));
endmodule
                                      
