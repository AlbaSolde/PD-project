# PD Project: High-Level Synthesis of Hardware Accelerators using Bambu and Vitis HLS

## Overview

This repository contains the work developed for the *Processor Design* course, focused on the generation of FPGA hardware accelerators from C/C++ applications using High-Level Synthesis (HLS).

The project evaluates and compares two HLS toolchains:

* **PandA-Bambu**
* **AMD Vitis HLS**

The generated RTL designs were synthesized and implemented using AMD Vivado targeting a Xilinx Zynq-7020 FPGA device.

The objective is to analyze synthesis feasibility, resource utilization, timing performance, and implementation challenges across a representative set of computational benchmarks.

---

## Repository Structure

```text
PD-project/
├── bambu_results/
├── vitis_results/
└── docs/
```

### bambu_results/

Contains all experiments performed using PandA-Bambu, including:

* Source code adaptations
* Synthesis scripts
* Generated reports
* Benchmark-specific modifications

### vitis_results/

Contains all experiments performed using AMD Vitis HLS, including:

* HLS projects
* TCL scripts
* Vivado integration files
* Resource and timing reports

### docs/

Project documentation and reports.

---

## Benchmarks

The evaluation is primarily based on kernels from the GPU4S Bench benchmark suite:

The benchmarks evaluated in this project include:

* LRN (Local Response Normalization)
* CIFAR-10 inference
* Convolution 2D
* Correlation 2D
* FFT
* FFT2D
* FIR Filter
* Matrix Multiplication
* Matrix Multiplication FP16
* Tensor Matrix Multiplication
* Max Pooling
* Memory Bandwidth
* ReLU
* Softmax
* Wavelet Transform

Some benchmarks required source-level modifications to become synthesizable with PandA-Bambu. These modifications are documented in the corresponding benchmark directories and project reports.

---

## Target Platform

* Operating System: Kubuntu 24.04 LTS
* PandA-Bambu: 2024.10
* AMD Vitis HLS
* AMD Vivado
* FPGA: Xilinx Zynq-7020 (xc7z020clg484-1)

---

## External Resources

This work builds upon the following open-source projects:

- GPU4S Bench:
  https://github.com/OBPMark/GPU4S_Bench

- PandA-Bambu:
  https://github.com/ferrandi/PandA-bambu

---

## Author

Alba Soldevilla González

Processor Design Project
Universitat Politècnica de Catalunya (UPC)
