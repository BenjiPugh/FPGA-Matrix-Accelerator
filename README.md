# FPGA-Matrix-Accelerator
A four dimensional Matrix-Vector Product module written in SystemVerilog.

## Repo Organization
This repo contains a LaTeX doc (and PDF) describing the project, as well as all of the modules implemented and helper python scripts.
The combinational and sequential implementations of Matrix-Vector multiplication are contained in `matrix_vector_prod_comb.sv` and `matrix_vector_prod_seq.sv` respectively.

`verilog_helper.py` contains helper scripts for creating the matrix modules. `generate_matrix_testvector.py` creates a testvector for the testbench, while `matrix_vector_prod.tv` is the testvector file. Finally, `mux4.sv`, `mux8.sv`, and `mux16.sv` are helper SystemVerilog modules written by Avinash Uttamchandani.

## Details
Computer Architecture project

Olin College of Engineering

Benji Pugh
