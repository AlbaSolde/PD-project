// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of output_data
//        bit 31~0 - output_data[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of conv_1_output
//        bit 31~0 - conv_1_output[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of pooling_1_output
//        bit 31~0 - pooling_1_output[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of conv_2_output
//        bit 31~0 - conv_2_output[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of pooling_2_output
//        bit 31~0 - pooling_2_output[31:0] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of dense_layer_1_output
//        bit 31~0 - dense_layer_1_output[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of dense_layer_2_output
//        bit 31~0 - dense_layer_2_output[31:0] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of input_data
//        bit 31~0 - input_data[31:0] (Read/Write)
// 0x4c : reserved
// 0x50 : Data signal of kernel_1_data
//        bit 31~0 - kernel_1_data[31:0] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of kernel_2_data
//        bit 31~0 - kernel_2_data[31:0] (Read/Write)
// 0x5c : reserved
// 0x60 : Data signal of weights_1
//        bit 31~0 - weights_1[31:0] (Read/Write)
// 0x64 : reserved
// 0x68 : Data signal of weights_2
//        bit 31~0 - weights_2[31:0] (Read/Write)
// 0x6c : reserved
// 0x70 : Data signal of input_data_size
//        bit 31~0 - input_data_size[31:0] (Read/Write)
// 0x74 : reserved
// 0x78 : Data signal of output_data_size
//        bit 31~0 - output_data_size[31:0] (Read/Write)
// 0x7c : reserved
// 0x80 : Data signal of kernel_1_size
//        bit 31~0 - kernel_1_size[31:0] (Read/Write)
// 0x84 : reserved
// 0x88 : Data signal of kernel_2_size
//        bit 31~0 - kernel_2_size[31:0] (Read/Write)
// 0x8c : reserved
// 0x90 : Data signal of stride_1_size
//        bit 31~0 - stride_1_size[31:0] (Read/Write)
// 0x94 : reserved
// 0x98 : Data signal of stride_2_size
//        bit 31~0 - stride_2_size[31:0] (Read/Write)
// 0x9c : reserved
// 0xa0 : Data signal of neurons_dense_1_size
//        bit 31~0 - neurons_dense_1_size[31:0] (Read/Write)
// 0xa4 : reserved
// 0xa8 : Data signal of neurons_dense_2_size
//        bit 31~0 - neurons_dense_2_size[31:0] (Read/Write)
// 0xac : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL                   0x00
#define CONTROL_ADDR_GIE                       0x04
#define CONTROL_ADDR_IER                       0x08
#define CONTROL_ADDR_ISR                       0x0c
#define CONTROL_ADDR_OUTPUT_DATA_DATA          0x10
#define CONTROL_BITS_OUTPUT_DATA_DATA          32
#define CONTROL_ADDR_CONV_1_OUTPUT_DATA        0x18
#define CONTROL_BITS_CONV_1_OUTPUT_DATA        32
#define CONTROL_ADDR_POOLING_1_OUTPUT_DATA     0x20
#define CONTROL_BITS_POOLING_1_OUTPUT_DATA     32
#define CONTROL_ADDR_CONV_2_OUTPUT_DATA        0x28
#define CONTROL_BITS_CONV_2_OUTPUT_DATA        32
#define CONTROL_ADDR_POOLING_2_OUTPUT_DATA     0x30
#define CONTROL_BITS_POOLING_2_OUTPUT_DATA     32
#define CONTROL_ADDR_DENSE_LAYER_1_OUTPUT_DATA 0x38
#define CONTROL_BITS_DENSE_LAYER_1_OUTPUT_DATA 32
#define CONTROL_ADDR_DENSE_LAYER_2_OUTPUT_DATA 0x40
#define CONTROL_BITS_DENSE_LAYER_2_OUTPUT_DATA 32
#define CONTROL_ADDR_INPUT_DATA_DATA           0x48
#define CONTROL_BITS_INPUT_DATA_DATA           32
#define CONTROL_ADDR_KERNEL_1_DATA_DATA        0x50
#define CONTROL_BITS_KERNEL_1_DATA_DATA        32
#define CONTROL_ADDR_KERNEL_2_DATA_DATA        0x58
#define CONTROL_BITS_KERNEL_2_DATA_DATA        32
#define CONTROL_ADDR_WEIGHTS_1_DATA            0x60
#define CONTROL_BITS_WEIGHTS_1_DATA            32
#define CONTROL_ADDR_WEIGHTS_2_DATA            0x68
#define CONTROL_BITS_WEIGHTS_2_DATA            32
#define CONTROL_ADDR_INPUT_DATA_SIZE_DATA      0x70
#define CONTROL_BITS_INPUT_DATA_SIZE_DATA      32
#define CONTROL_ADDR_OUTPUT_DATA_SIZE_DATA     0x78
#define CONTROL_BITS_OUTPUT_DATA_SIZE_DATA     32
#define CONTROL_ADDR_KERNEL_1_SIZE_DATA        0x80
#define CONTROL_BITS_KERNEL_1_SIZE_DATA        32
#define CONTROL_ADDR_KERNEL_2_SIZE_DATA        0x88
#define CONTROL_BITS_KERNEL_2_SIZE_DATA        32
#define CONTROL_ADDR_STRIDE_1_SIZE_DATA        0x90
#define CONTROL_BITS_STRIDE_1_SIZE_DATA        32
#define CONTROL_ADDR_STRIDE_2_SIZE_DATA        0x98
#define CONTROL_BITS_STRIDE_2_SIZE_DATA        32
#define CONTROL_ADDR_NEURONS_DENSE_1_SIZE_DATA 0xa0
#define CONTROL_BITS_NEURONS_DENSE_1_SIZE_DATA 32
#define CONTROL_ADDR_NEURONS_DENSE_2_SIZE_DATA 0xa8
#define CONTROL_BITS_NEURONS_DENSE_2_SIZE_DATA 32
