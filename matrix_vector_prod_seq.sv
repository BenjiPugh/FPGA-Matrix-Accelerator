module matrix_vector_prod_seq(
    rst, clk, i_ready, i_valid,

    mat_0_0, mat_0_1, mat_0_2, mat_0_3,
    mat_1_0, mat_1_1, mat_1_2, mat_1_3,
    mat_2_0, mat_2_1, mat_2_2, mat_2_3,
    mat_3_0, mat_3_1, mat_3_2, mat_3_3,

    vector_0, vector_1, vector_2, vector_3,

    product_0, product_1, product_2, product_3,

    o_valid, o_ready
    );
/*
A combinational float-based matrix-vector product using behavioral logic
Operates on 4x4 matrices and 4 long vectors
*/

input logic clk, rst;

// Matrix inputs
input real mat_0_0;
input real mat_0_1;
input real mat_0_2;
input real mat_0_3;
input real mat_1_0;
input real mat_1_1;
input real mat_1_2;
input real mat_1_3;
input real mat_2_0;
input real mat_2_1;
input real mat_2_2;
input real mat_2_3;
input real mat_3_0;
input real mat_3_1;
input real mat_3_2;
input real mat_3_3;

// Vector inputs
input real vector_0;
input real vector_1;
input real vector_2;
input real vector_3;

// Vector outputs
output real product_0;
output real product_1;
output real product_2;
output real product_3;


// Handshake inputs and outputs
output logic i_ready, o_valid;
input logic i_valid, o_ready;


typedef enum logic [1:0] {
  S_IDLE, S_COMPUTE, S_DONE, S_ERROR
} accelerator_state;
accelerator_state state;

logic [3:0] matrix_index; // Counting from top left corner down
real a, b, result; // Multiplication parameters and output

// Put all of the matrix values in Muxes so we can access them individually
// using the matrix index.

mux16 #(.N(64)) matrix(.in0(mat_0_0),.in1(mat_0_1),.in2(mat_0_2),.in3(mat_0_3),
                       .in4(mat_1_0),.in5(mat_1_1),.in6(mat_1_2),.in7(mat_1_3),
                       .in8(mat_2_0),.in9(mat_2_1),.in10(mat_2_2),.in11(mat_2_3),
                       .in12(mat_3_0),.in13(mat_3_1),.in14(mat_3_2),.in15(mat_3_3),
                       .switch(matrix_index), .out(a));

mux4 #(.N(64)) vector(.in0(vector_0),.in1(vector_1),.in2(vector_2),.in3(vector_3),
                      .switch(matrix_index[1:0]), .out(b));


always_comb begin: multiplication
    result = a * b;
end


always_ff @(posedge clk) begin: index_iteration
    if (rst) begin
        // Reset the state and the matrix index
        state <= S_IDLE;
    end else begin
        case (state)
            S_IDLE : begin
                matrix_index <= 0;
                product_0 <= 0;
                product_1 <= 0;
                product_2 <= 0;
                product_3 <= 0;
                if (i_valid) begin
                    state <= S_COMPUTE;
                end
            end
            S_COMPUTE : begin

                // If all of the matrix indices have been iterated through, then go into the done state
                if (matrix_index == 4'b1111) begin
                    state <= S_DONE;
                end else begin
                    matrix_index <= matrix_index + 1;
                end

                // Choose which product to add to.
                case (matrix_index[3:2])
                    2'b00 : product_0 <= product_0 + result;
                    2'b01 : product_1 <= product_1 + result;
                    2'b10 : product_2 <= product_2 + result;
                    2'b11 : product_3 <= product_3 + result;
                endcase
            end
            S_DONE : begin
                if (o_ready) begin
                    state <= S_IDLE;
                end
            end
            default : state <= S_ERROR;
            
        endcase
    end
end


// Control 
always_comb begin : handshake_control
    case (state)
        S_IDLE : begin
            i_ready = 1;
            o_valid = 0;
        end
        S_COMPUTE : begin
            i_ready = 0;
            o_valid = 0;
        end
        S_DONE : begin
            i_ready = 0;
            o_valid = 1;
        end
        S_ERROR : begin
            i_ready = 0;
            o_valid = 0;
        end
        default : begin
            i_ready = 0;
            o_valid = 0;
        end
    endcase
end

endmodule