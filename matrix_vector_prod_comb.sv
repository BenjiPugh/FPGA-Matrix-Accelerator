module matrix_vector_prod(
    mat_0_0, mat_0_1, mat_0_2, mat_0_3,
    mat_1_0, mat_1_1, mat_1_2, mat_1_3,
    mat_2_0, mat_2_1, mat_2_2, mat_2_3,
    mat_3_0, mat_3_1, mat_3_2, mat_3_3,

    vector_0, vector_1, vector_2, vector_3,

    product_0, product_1, product_2, product_3
    );
/*
A combinational float-based matrix-vector product using behavioral logic
*/ 

input float [15:0] mat_0_0;
input float [15:0] mat_0_1;
input float [15:0] mat_0_2;
input float [15:0] mat_0_3;
input float [15:0] mat_1_0;
input float [15:0] mat_1_1;
input float [15:0] mat_1_2;
input float [15:0] mat_1_3;
input float [15:0] mat_2_0;
input float [15:0] mat_2_1;
input float [15:0] mat_2_2;
input float [15:0] mat_2_3;
input float [15:0] mat_3_0;
input float [15:0] mat_3_1;
input float [15:0] mat_3_2;
input float [15:0] mat_3_3;

input float [15:0] vector_0;
input float [15:0] vector_1;
input float [15:0] vector_2;
input float [15:0] vector_3;

output float [15:0] product_0;
output float [15:0] product_1;
output float [15:0] product_2;
output float [15:0] product_3;

always_comb begin: multiply_rows_vector
    product_0 = mat_0_0*vector_0 +
                mat_0_1*vector_1 +
                mat_0_2*vector_2 +
                mat_0_3*vector_3;
    
    product_1 = mat_1_0*vector_0 +
                mat_1_1*vector_1 +
                mat_1_2*vector_2 +
                mat_1_3*vector_3;
    
    product_2 = mat_2_0*vector_0 +
                mat_2_1*vector_1 +
                mat_2_2*vector_2 +
                mat_2_3*vector_3;
    
    product_3 = mat_3_0*vector_0 +
                mat_3_1*vector_1 +
                mat_3_2*vector_2 +
                mat_3_3*vector_3;
end

endmodule