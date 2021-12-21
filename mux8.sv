`timescale 1ns/1ps
`default_nettype none
module mux8(in0,in1,in2,in3,in4,in5,in6,in7,switch,out);

// An N wide 8 Mux. Module created by Avinash, modified to use floats

//parameter definitions
parameter N = 1;
//port definitions
input real in0;
input real in1;
input real in2;
input real in3;
input real in4;
input real in5;
input real in6;
input real in7;
input  wire [2:0] switch;
output real out;

real mux0, mux1;
//make 4:1 out of 2 4:1 muxes and a 2:1 mux
mux4 #(.N(N)) MUX_0 (.in0(in0), .in1(in1), .in2(in2), .in3(in3), .switch(switch[1:0]), .out(mux0));
mux4 #(.N(N)) MUX_1 (.in0(in4), .in1(in5), .in2(in6), .in3(in7), .switch(switch[1:0]), .out(mux1));
always_comb out = switch[2] ? mux1 : mux0;

endmodule
