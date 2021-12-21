`timescale 1ns/1ps
`default_nettype none
module mux16(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,switch,out);

// An N wide 16 Mux. Module created by Avinash, modified to use floats

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
input real in8;
input real in9;
input real in10;
input real in11;
input real in12;
input real in13;
input real in14;
input real in15;

input  wire [3:0] switch;
output real out;

real mux0, mux1;
//make 4:1 out of 2 8:1 muxes and a 2:1 mux
mux8 #(.N(N)) MUX_0 (.in0(in0), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .in5(in5), .in6(in6), .in7(in7), .switch(switch[2:0]), .out(mux0));
mux8 #(.N(N)) MUX_1 (.in0(in8), .in1(in9), .in2(in10), .in3(in11), .in4(in12), .in5(in13), .in6(in14), .in7(in15), .switch(switch[2:0]), .out(mux1));
always_comb out = switch[3] ? mux1 : mux0;

endmodule
