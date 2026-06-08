// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xcifar10.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCifar10_CfgInitialize(XCifar10 *InstancePtr, XCifar10_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCifar10_Start(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_AP_CTRL) & 0x80;
    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XCifar10_IsDone(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XCifar10_IsIdle(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XCifar10_IsReady(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XCifar10_EnableAutoRestart(XCifar10 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XCifar10_DisableAutoRestart(XCifar10 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_AP_CTRL, 0);
}

void XCifar10_Set_output_data(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_OUTPUT_DATA_DATA, Data);
}

u32 XCifar10_Get_output_data(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_OUTPUT_DATA_DATA);
    return Data;
}

void XCifar10_Set_conv_1_output(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_CONV_1_OUTPUT_DATA, Data);
}

u32 XCifar10_Get_conv_1_output(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_CONV_1_OUTPUT_DATA);
    return Data;
}

void XCifar10_Set_pooling_1_output(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_POOLING_1_OUTPUT_DATA, Data);
}

u32 XCifar10_Get_pooling_1_output(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_POOLING_1_OUTPUT_DATA);
    return Data;
}

void XCifar10_Set_conv_2_output(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_CONV_2_OUTPUT_DATA, Data);
}

u32 XCifar10_Get_conv_2_output(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_CONV_2_OUTPUT_DATA);
    return Data;
}

void XCifar10_Set_pooling_2_output(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_POOLING_2_OUTPUT_DATA, Data);
}

u32 XCifar10_Get_pooling_2_output(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_POOLING_2_OUTPUT_DATA);
    return Data;
}

void XCifar10_Set_dense_layer_1_output(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_DENSE_LAYER_1_OUTPUT_DATA, Data);
}

u32 XCifar10_Get_dense_layer_1_output(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_DENSE_LAYER_1_OUTPUT_DATA);
    return Data;
}

void XCifar10_Set_dense_layer_2_output(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_DENSE_LAYER_2_OUTPUT_DATA, Data);
}

u32 XCifar10_Get_dense_layer_2_output(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_DENSE_LAYER_2_OUTPUT_DATA);
    return Data;
}

void XCifar10_Set_input_data(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_INPUT_DATA_DATA, Data);
}

u32 XCifar10_Get_input_data(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_INPUT_DATA_DATA);
    return Data;
}

void XCifar10_Set_kernel_1_data(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_KERNEL_1_DATA_DATA, Data);
}

u32 XCifar10_Get_kernel_1_data(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_KERNEL_1_DATA_DATA);
    return Data;
}

void XCifar10_Set_kernel_2_data(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_KERNEL_2_DATA_DATA, Data);
}

u32 XCifar10_Get_kernel_2_data(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_KERNEL_2_DATA_DATA);
    return Data;
}

void XCifar10_Set_weights_1(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_WEIGHTS_1_DATA, Data);
}

u32 XCifar10_Get_weights_1(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_WEIGHTS_1_DATA);
    return Data;
}

void XCifar10_Set_weights_2(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_WEIGHTS_2_DATA, Data);
}

u32 XCifar10_Get_weights_2(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_WEIGHTS_2_DATA);
    return Data;
}

void XCifar10_Set_input_data_size(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_INPUT_DATA_SIZE_DATA, Data);
}

u32 XCifar10_Get_input_data_size(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_INPUT_DATA_SIZE_DATA);
    return Data;
}

void XCifar10_Set_output_data_size(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_OUTPUT_DATA_SIZE_DATA, Data);
}

u32 XCifar10_Get_output_data_size(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_OUTPUT_DATA_SIZE_DATA);
    return Data;
}

void XCifar10_Set_kernel_1_size(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_KERNEL_1_SIZE_DATA, Data);
}

u32 XCifar10_Get_kernel_1_size(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_KERNEL_1_SIZE_DATA);
    return Data;
}

void XCifar10_Set_kernel_2_size(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_KERNEL_2_SIZE_DATA, Data);
}

u32 XCifar10_Get_kernel_2_size(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_KERNEL_2_SIZE_DATA);
    return Data;
}

void XCifar10_Set_stride_1_size(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_STRIDE_1_SIZE_DATA, Data);
}

u32 XCifar10_Get_stride_1_size(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_STRIDE_1_SIZE_DATA);
    return Data;
}

void XCifar10_Set_stride_2_size(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_STRIDE_2_SIZE_DATA, Data);
}

u32 XCifar10_Get_stride_2_size(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_STRIDE_2_SIZE_DATA);
    return Data;
}

void XCifar10_Set_neurons_dense_1_size(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_NEURONS_DENSE_1_SIZE_DATA, Data);
}

u32 XCifar10_Get_neurons_dense_1_size(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_NEURONS_DENSE_1_SIZE_DATA);
    return Data;
}

void XCifar10_Set_neurons_dense_2_size(XCifar10 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_NEURONS_DENSE_2_SIZE_DATA, Data);
}

u32 XCifar10_Get_neurons_dense_2_size(XCifar10 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_NEURONS_DENSE_2_SIZE_DATA);
    return Data;
}

void XCifar10_InterruptGlobalEnable(XCifar10 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_GIE, 1);
}

void XCifar10_InterruptGlobalDisable(XCifar10 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_GIE, 0);
}

void XCifar10_InterruptEnable(XCifar10 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_IER);
    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_IER, Register | Mask);
}

void XCifar10_InterruptDisable(XCifar10 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_IER);
    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_IER, Register & (~Mask));
}

void XCifar10_InterruptClear(XCifar10 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCifar10_WriteReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_ISR, Mask);
}

u32 XCifar10_InterruptGetEnabled(XCifar10 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_IER);
}

u32 XCifar10_InterruptGetStatus(XCifar10 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCifar10_ReadReg(InstancePtr->Control_BaseAddress, XCIFAR10_CONTROL_ADDR_ISR);
}

