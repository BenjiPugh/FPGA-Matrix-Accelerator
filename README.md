# FPGA-Matrix-Accelerator
A four dimensional Matrix-Vector Product module written in SystemVerilog.

Currently, the testbench is in a nonworking state. This is because SystemVerilog deals with the "real" datatype (64 bit float) differently from integers or logic, meaning loading in testvectors is more difficult. I hope to resolve this either by figuring the specific syntax to use, or by reworking the modules to deal with the "logic" datatype instead of "real" and use existing multiplication modules as opposed to dealing with SystemVerilog's quirks and features. The side benefit is that this would make the module more situation-appropriate because 3d graphics rarely deal with data larger than 16 bit floats.

## Repo Organization
This repo contains a LaTeX doc (and PDF) describing the project, as well as all of the modules implemented and helper python scripts.
The combinational and sequential implementations of Matrix-Vector multiplication are contained in `matrix_vector_prod_comb.sv` and `matrix_vector_prod_seq.sv` respectively.

`verilog_helper.py` contains helper scripts for creating the matrix modules. `generate_matrix_testvector.py` creates a testvector for the testbench, while `matrix_vector_prod.tv` is the testvector file. Finally, `mux4.sv`, `mux8.sv`, and `mux16.sv` are helper SystemVerilog modules written by Avinash Uttamchandani.

## Details
Computer Architecture project

Olin College of Engineering

Benji Pugh
