// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
(* DowngradeIPIdentifiedWarnings="yes" *) module cifar10_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [31:0]                   output_data,
    output wire [31:0]                   conv_1_output,
    output wire [31:0]                   pooling_1_output,
    output wire [31:0]                   conv_2_output,
    output wire [31:0]                   pooling_2_output,
    output wire [31:0]                   dense_layer_1_output,
    output wire [31:0]                   dense_layer_2_output,
    output wire [31:0]                   input_data,
    output wire [31:0]                   kernel_1_data,
    output wire [31:0]                   kernel_2_data,
    output wire [31:0]                   weights_1,
    output wire [31:0]                   weights_2,
    output wire [31:0]                   input_data_size,
    output wire [31:0]                   output_data_size,
    output wire [31:0]                   kernel_1_size,
    output wire [31:0]                   kernel_2_size,
    output wire [31:0]                   stride_1_size,
    output wire [31:0]                   stride_2_size,
    output wire [31:0]                   neurons_dense_1_size,
    output wire [31:0]                   neurons_dense_2_size,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_hs
//
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL                     = 8'h00,
    ADDR_GIE                         = 8'h04,
    ADDR_IER                         = 8'h08,
    ADDR_ISR                         = 8'h0c,
    ADDR_OUTPUT_DATA_DATA_0          = 8'h10,
    ADDR_OUTPUT_DATA_CTRL            = 8'h14,
    ADDR_CONV_1_OUTPUT_DATA_0        = 8'h18,
    ADDR_CONV_1_OUTPUT_CTRL          = 8'h1c,
    ADDR_POOLING_1_OUTPUT_DATA_0     = 8'h20,
    ADDR_POOLING_1_OUTPUT_CTRL       = 8'h24,
    ADDR_CONV_2_OUTPUT_DATA_0        = 8'h28,
    ADDR_CONV_2_OUTPUT_CTRL          = 8'h2c,
    ADDR_POOLING_2_OUTPUT_DATA_0     = 8'h30,
    ADDR_POOLING_2_OUTPUT_CTRL       = 8'h34,
    ADDR_DENSE_LAYER_1_OUTPUT_DATA_0 = 8'h38,
    ADDR_DENSE_LAYER_1_OUTPUT_CTRL   = 8'h3c,
    ADDR_DENSE_LAYER_2_OUTPUT_DATA_0 = 8'h40,
    ADDR_DENSE_LAYER_2_OUTPUT_CTRL   = 8'h44,
    ADDR_INPUT_DATA_DATA_0           = 8'h48,
    ADDR_INPUT_DATA_CTRL             = 8'h4c,
    ADDR_KERNEL_1_DATA_DATA_0        = 8'h50,
    ADDR_KERNEL_1_DATA_CTRL          = 8'h54,
    ADDR_KERNEL_2_DATA_DATA_0        = 8'h58,
    ADDR_KERNEL_2_DATA_CTRL          = 8'h5c,
    ADDR_WEIGHTS_1_DATA_0            = 8'h60,
    ADDR_WEIGHTS_1_CTRL              = 8'h64,
    ADDR_WEIGHTS_2_DATA_0            = 8'h68,
    ADDR_WEIGHTS_2_CTRL              = 8'h6c,
    ADDR_INPUT_DATA_SIZE_DATA_0      = 8'h70,
    ADDR_INPUT_DATA_SIZE_CTRL        = 8'h74,
    ADDR_OUTPUT_DATA_SIZE_DATA_0     = 8'h78,
    ADDR_OUTPUT_DATA_SIZE_CTRL       = 8'h7c,
    ADDR_KERNEL_1_SIZE_DATA_0        = 8'h80,
    ADDR_KERNEL_1_SIZE_CTRL          = 8'h84,
    ADDR_KERNEL_2_SIZE_DATA_0        = 8'h88,
    ADDR_KERNEL_2_SIZE_CTRL          = 8'h8c,
    ADDR_STRIDE_1_SIZE_DATA_0        = 8'h90,
    ADDR_STRIDE_1_SIZE_CTRL          = 8'h94,
    ADDR_STRIDE_2_SIZE_DATA_0        = 8'h98,
    ADDR_STRIDE_2_SIZE_CTRL          = 8'h9c,
    ADDR_NEURONS_DENSE_1_SIZE_DATA_0 = 8'ha0,
    ADDR_NEURONS_DENSE_1_SIZE_CTRL   = 8'ha4,
    ADDR_NEURONS_DENSE_2_SIZE_DATA_0 = 8'ha8,
    ADDR_NEURONS_DENSE_2_SIZE_CTRL   = 8'hac,
    WRIDLE                           = 2'd0,
    WRDATA                           = 2'd1,
    WRRESP                           = 2'd2,
    WRRESET                          = 2'd3,
    RDIDLE                           = 2'd0,
    RDDATA                           = 2'd1,
    RDRESET                          = 2'd2,
    ADDR_BITS                = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle = 1'b0;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [31:0]                   int_output_data = 'b0;
    reg  [31:0]                   int_conv_1_output = 'b0;
    reg  [31:0]                   int_pooling_1_output = 'b0;
    reg  [31:0]                   int_conv_2_output = 'b0;
    reg  [31:0]                   int_pooling_2_output = 'b0;
    reg  [31:0]                   int_dense_layer_1_output = 'b0;
    reg  [31:0]                   int_dense_layer_2_output = 'b0;
    reg  [31:0]                   int_input_data = 'b0;
    reg  [31:0]                   int_kernel_1_data = 'b0;
    reg  [31:0]                   int_kernel_2_data = 'b0;
    reg  [31:0]                   int_weights_1 = 'b0;
    reg  [31:0]                   int_weights_2 = 'b0;
    reg  [31:0]                   int_input_data_size = 'b0;
    reg  [31:0]                   int_output_data_size = 'b0;
    reg  [31:0]                   int_kernel_1_size = 'b0;
    reg  [31:0]                   int_kernel_2_size = 'b0;
    reg  [31:0]                   int_stride_1_size = 'b0;
    reg  [31:0]                   int_stride_2_size = 'b0;
    reg  [31:0]                   int_neurons_dense_1_size = 'b0;
    reg  [31:0]                   int_neurons_dense_2_size = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BVALID  = (wstate == WRRESP);
assign BRESP   = 2'b00;  // OKAY
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY & BVALID)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= {AWADDR[ADDR_BITS-1:2], {2{1'b0}}};
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_OUTPUT_DATA_DATA_0: begin
                    rdata <= int_output_data[31:0];
                end
                ADDR_CONV_1_OUTPUT_DATA_0: begin
                    rdata <= int_conv_1_output[31:0];
                end
                ADDR_POOLING_1_OUTPUT_DATA_0: begin
                    rdata <= int_pooling_1_output[31:0];
                end
                ADDR_CONV_2_OUTPUT_DATA_0: begin
                    rdata <= int_conv_2_output[31:0];
                end
                ADDR_POOLING_2_OUTPUT_DATA_0: begin
                    rdata <= int_pooling_2_output[31:0];
                end
                ADDR_DENSE_LAYER_1_OUTPUT_DATA_0: begin
                    rdata <= int_dense_layer_1_output[31:0];
                end
                ADDR_DENSE_LAYER_2_OUTPUT_DATA_0: begin
                    rdata <= int_dense_layer_2_output[31:0];
                end
                ADDR_INPUT_DATA_DATA_0: begin
                    rdata <= int_input_data[31:0];
                end
                ADDR_KERNEL_1_DATA_DATA_0: begin
                    rdata <= int_kernel_1_data[31:0];
                end
                ADDR_KERNEL_2_DATA_DATA_0: begin
                    rdata <= int_kernel_2_data[31:0];
                end
                ADDR_WEIGHTS_1_DATA_0: begin
                    rdata <= int_weights_1[31:0];
                end
                ADDR_WEIGHTS_2_DATA_0: begin
                    rdata <= int_weights_2[31:0];
                end
                ADDR_INPUT_DATA_SIZE_DATA_0: begin
                    rdata <= int_input_data_size[31:0];
                end
                ADDR_OUTPUT_DATA_SIZE_DATA_0: begin
                    rdata <= int_output_data_size[31:0];
                end
                ADDR_KERNEL_1_SIZE_DATA_0: begin
                    rdata <= int_kernel_1_size[31:0];
                end
                ADDR_KERNEL_2_SIZE_DATA_0: begin
                    rdata <= int_kernel_2_size[31:0];
                end
                ADDR_STRIDE_1_SIZE_DATA_0: begin
                    rdata <= int_stride_1_size[31:0];
                end
                ADDR_STRIDE_2_SIZE_DATA_0: begin
                    rdata <= int_stride_2_size[31:0];
                end
                ADDR_NEURONS_DENSE_1_SIZE_DATA_0: begin
                    rdata <= int_neurons_dense_1_size[31:0];
                end
                ADDR_NEURONS_DENSE_2_SIZE_DATA_0: begin
                    rdata <= int_neurons_dense_2_size[31:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt            = int_interrupt;
assign ap_start             = int_ap_start;
assign task_ap_done         = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready        = ap_ready && !int_auto_restart;
assign auto_restart_done    = auto_restart_status && (ap_idle && !int_ap_idle);
assign output_data          = int_output_data;
assign conv_1_output        = int_conv_1_output;
assign pooling_1_output     = int_pooling_1_output;
assign conv_2_output        = int_conv_2_output;
assign pooling_2_output     = int_pooling_2_output;
assign dense_layer_1_output = int_dense_layer_1_output;
assign dense_layer_2_output = int_dense_layer_2_output;
assign input_data           = int_input_data;
assign kernel_1_data        = int_kernel_1_data;
assign kernel_2_data        = int_kernel_2_data;
assign weights_1            = int_weights_1;
assign weights_2            = int_weights_2;
assign input_data_size      = int_input_data_size;
assign output_data_size     = int_output_data_size;
assign kernel_1_size        = int_kernel_1_size;
assign kernel_2_size        = int_kernel_2_size;
assign stride_1_size        = int_stride_1_size;
assign stride_2_size        = int_stride_2_size;
assign neurons_dense_1_size = int_neurons_dense_1_size;
assign neurons_dense_2_size = int_neurons_dense_2_size;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <= WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_output_data[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_data[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_DATA_DATA_0)
            int_output_data[31:0] <= (WDATA[31:0] & wmask) | (int_output_data[31:0] & ~wmask);
    end
end

// int_conv_1_output[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_conv_1_output[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CONV_1_OUTPUT_DATA_0)
            int_conv_1_output[31:0] <= (WDATA[31:0] & wmask) | (int_conv_1_output[31:0] & ~wmask);
    end
end

// int_pooling_1_output[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_pooling_1_output[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_POOLING_1_OUTPUT_DATA_0)
            int_pooling_1_output[31:0] <= (WDATA[31:0] & wmask) | (int_pooling_1_output[31:0] & ~wmask);
    end
end

// int_conv_2_output[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_conv_2_output[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CONV_2_OUTPUT_DATA_0)
            int_conv_2_output[31:0] <= (WDATA[31:0] & wmask) | (int_conv_2_output[31:0] & ~wmask);
    end
end

// int_pooling_2_output[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_pooling_2_output[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_POOLING_2_OUTPUT_DATA_0)
            int_pooling_2_output[31:0] <= (WDATA[31:0] & wmask) | (int_pooling_2_output[31:0] & ~wmask);
    end
end

// int_dense_layer_1_output[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dense_layer_1_output[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DENSE_LAYER_1_OUTPUT_DATA_0)
            int_dense_layer_1_output[31:0] <= (WDATA[31:0] & wmask) | (int_dense_layer_1_output[31:0] & ~wmask);
    end
end

// int_dense_layer_2_output[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dense_layer_2_output[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DENSE_LAYER_2_OUTPUT_DATA_0)
            int_dense_layer_2_output[31:0] <= (WDATA[31:0] & wmask) | (int_dense_layer_2_output[31:0] & ~wmask);
    end
end

// int_input_data[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_input_data[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_INPUT_DATA_DATA_0)
            int_input_data[31:0] <= (WDATA[31:0] & wmask) | (int_input_data[31:0] & ~wmask);
    end
end

// int_kernel_1_data[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_1_data[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_1_DATA_DATA_0)
            int_kernel_1_data[31:0] <= (WDATA[31:0] & wmask) | (int_kernel_1_data[31:0] & ~wmask);
    end
end

// int_kernel_2_data[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_2_data[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_2_DATA_DATA_0)
            int_kernel_2_data[31:0] <= (WDATA[31:0] & wmask) | (int_kernel_2_data[31:0] & ~wmask);
    end
end

// int_weights_1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WEIGHTS_1_DATA_0)
            int_weights_1[31:0] <= (WDATA[31:0] & wmask) | (int_weights_1[31:0] & ~wmask);
    end
end

// int_weights_2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WEIGHTS_2_DATA_0)
            int_weights_2[31:0] <= (WDATA[31:0] & wmask) | (int_weights_2[31:0] & ~wmask);
    end
end

// int_input_data_size[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_input_data_size[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_INPUT_DATA_SIZE_DATA_0)
            int_input_data_size[31:0] <= (WDATA[31:0] & wmask) | (int_input_data_size[31:0] & ~wmask);
    end
end

// int_output_data_size[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_data_size[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_DATA_SIZE_DATA_0)
            int_output_data_size[31:0] <= (WDATA[31:0] & wmask) | (int_output_data_size[31:0] & ~wmask);
    end
end

// int_kernel_1_size[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_1_size[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_1_SIZE_DATA_0)
            int_kernel_1_size[31:0] <= (WDATA[31:0] & wmask) | (int_kernel_1_size[31:0] & ~wmask);
    end
end

// int_kernel_2_size[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_2_size[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_2_SIZE_DATA_0)
            int_kernel_2_size[31:0] <= (WDATA[31:0] & wmask) | (int_kernel_2_size[31:0] & ~wmask);
    end
end

// int_stride_1_size[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_stride_1_size[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STRIDE_1_SIZE_DATA_0)
            int_stride_1_size[31:0] <= (WDATA[31:0] & wmask) | (int_stride_1_size[31:0] & ~wmask);
    end
end

// int_stride_2_size[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_stride_2_size[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STRIDE_2_SIZE_DATA_0)
            int_stride_2_size[31:0] <= (WDATA[31:0] & wmask) | (int_stride_2_size[31:0] & ~wmask);
    end
end

// int_neurons_dense_1_size[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_neurons_dense_1_size[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NEURONS_DENSE_1_SIZE_DATA_0)
            int_neurons_dense_1_size[31:0] <= (WDATA[31:0] & wmask) | (int_neurons_dense_1_size[31:0] & ~wmask);
    end
end

// int_neurons_dense_2_size[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_neurons_dense_2_size[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NEURONS_DENSE_2_SIZE_DATA_0)
            int_neurons_dense_2_size[31:0] <= (WDATA[31:0] & wmask) | (int_neurons_dense_2_size[31:0] & ~wmask);
    end
end

//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr[0] & int_ier[0] & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
        if (int_gie & ~int_isr[1] & int_ier[1] & ap_ready)
            $display ("// Interrupt Monitor : interrupt for ap_ready detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on

//------------------------Memory logic-------------------

endmodule
