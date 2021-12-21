`timescale 1ns/1ps
`default_nettype none
module mux4(in0,in1,in2,in3,switch,out);

// An N wide 4 Mux. Module created by Avinash, modified to use floats

//parameter definitions
parameter N = 1;
//port definitions
input real in0;
input real in1;
input real in2;
input real in3;
input  wire [1:0] switch;
output real out;

real mux0, mux1;
// make 4:1 out of 3 2:1 muxes.
always_comb mux0 = switch[0] ? in1 : in0;
always_comb mux1 = switch[0] ? in3 : in2;
always_comb out = switch[1] ? mux1 : mux0;

endmodule
