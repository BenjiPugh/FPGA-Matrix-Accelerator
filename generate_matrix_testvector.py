import numpy as np


f = open("matrix_vector_prod.tv", "w")

def add_testcase(input_matrix, input_vector):
    testvector_row = ""
    for row in range(4):
        for col in range(4):
            testvector_row += str(input_matrix[row, col]) + "_"
    for col in range(4):
        testvector_row += str(input_vector[col]) + "_"
    target_vector = input_matrix.dot(input_vector)
    for col in range(3):
        testvector_row += str(target_vector[col]) + "_"
    testvector_row += str(target_vector[3])
    f.write(testvector_row + "\n")
    
# Specific edge cases to test 

# The identity matrix multiplying a vector should output the same vector.
identity_matrix = np.eye(4, dtype=float)
add_testcase(identity_matrix, np.arange(4, dtype=float))

# The zero matrix multiplying a vector should result in a zero vector.
zero_matrix = np.zeros((4,4), dtype=float)
add_testcase(zero_matrix, np.arange(4, dtype=float))

# Check that the zero vector results in a zero vector output.
zero_vector = np.zeros(4, dtype=float)
add_testcase(identity_matrix, zero_vector)

def generate_random_cases(number_cases):
    for i in range(number_cases):
        rand_matrix = np.random.rand(4,4)
        rand_vector = np.random.rand(4)
        add_testcase(rand_matrix, rand_vector)

generate_random_cases(10)

f.close()