def generate_matrix_wires(rows, cols, float_length):
    """
    Generate wires of float type for matrix values in row, column order.
    Args:
        rows: Integer describing row length of matrix
        cols: Integer describing column length of matrix
        float_length: the bit length of the floats
    """
    for i in range(rows):
        for j in range(cols):
            print("input wire [" + str(float_length - 1) + ":0] mat_"+ str(i) + "_" + str(j)+";")

def generate_matrix_args(rows, cols):
    """
    Generate args matrix values in row, column order.
    Args:
        rows: Integer describing row length of matrix
        cols: Integer describing column length of matrix
    """
    for i in range(rows):
        for j in range(cols):
            print("mat_"+ str(i) + "_" + str(j) + ",")

#generate_matrix_wires(4, 4, 16)
#generate_matrix_args(4,4)
