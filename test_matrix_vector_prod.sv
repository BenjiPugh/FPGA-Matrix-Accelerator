`timescale 1ns / 100ps

`define SIMULATION

module test_matrix_vector_prod;

// Timing parameters
parameter CLK_HZ = 12_000_000;
parameter CLK_PERIOD_NS = (1_000_000_000/CLK_HZ);

// The acceptable float error, given that different floating point calulation
// schemes result in slightly different results.
parameter FLOAT_ERROR = 0.1;

// Matrix
real mat_0_0;
real mat_0_1;
real mat_0_2;
real mat_0_3;
real mat_1_0;
real mat_1_1;
real mat_1_2;
real mat_1_3;
real mat_2_0;
real mat_2_1;
real mat_2_2;
real mat_2_3;
real mat_3_0;
real mat_3_1;
real mat_3_2;
real mat_3_3;

// Vector
real vector_0;
real vector_1;
real vector_2;
real vector_3;

// Vector outputs
real product_0;
real product_1;
real product_2;
real product_3;

// Handshake inputs and outputs
wire i_ready, o_valid;
logic i_valid, o_ready;

// Desired products
real target_0;
real target_1;
real target_2;
real target_3;

matrix_vector_prod_seq UUT(
    rst, clk, i_ready, i_valid

    mat_0_0, mat_0_1, mat_0_2, mat_0_3,
    mat_1_0, mat_1_1, mat_1_2, mat_1_3,
    mat_2_0, mat_2_1, mat_2_2, mat_2_3,
    mat_3_0, mat_3_1, mat_3_2, mat_3_3,

    vector_0, vector_1, vector_2, vector_3,

    product_0, product_1, product_2, product_3,

    o_valid, o_ready
    );

// Run our clock.
always #(CLK_PERIOD_NS/2) clk = ~clk;

initial begin
    // Initialize module inputs.
    clk = 0;
    rst = 1;
    i_valid = 0;
    o_ready = 1;

    // Assert reset for long enough.
    repeat(2) @(negedge clk);

    
    end
endmodule