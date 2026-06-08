// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xccsds_wavelet_transform.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCcsds_wavelet_transform_CfgInitialize(XCcsds_wavelet_transform *InstancePtr, XCcsds_wavelet_transform_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCcsds_wavelet_transform_Start(XCcsds_wavelet_transform *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XCcsds_wavelet_transform_IsDone(XCcsds_wavelet_transform *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XCcsds_wavelet_transform_IsIdle(XCcsds_wavelet_transform *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XCcsds_wavelet_transform_IsReady(XCcsds_wavelet_transform *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XCcsds_wavelet_transform_EnableAutoRestart(XCcsds_wavelet_transform *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XCcsds_wavelet_transform_DisableAutoRestart(XCcsds_wavelet_transform *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_AP_CTRL, 0);
}

void XCcsds_wavelet_transform_Set_A(XCcsds_wavelet_transform *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_A_DATA, (u32)(Data));
    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XCcsds_wavelet_transform_Get_A(XCcsds_wavelet_transform *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_A_DATA);
    Data += (u64)XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XCcsds_wavelet_transform_Set_B(XCcsds_wavelet_transform *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_B_DATA, (u32)(Data));
    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XCcsds_wavelet_transform_Get_B(XCcsds_wavelet_transform *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_B_DATA);
    Data += (u64)XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XCcsds_wavelet_transform_Set_size(XCcsds_wavelet_transform *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_SIZE_DATA, Data);
}

u32 XCcsds_wavelet_transform_Get_size(XCcsds_wavelet_transform *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_SIZE_DATA);
    return Data;
}

void XCcsds_wavelet_transform_InterruptGlobalEnable(XCcsds_wavelet_transform *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_GIE, 1);
}

void XCcsds_wavelet_transform_InterruptGlobalDisable(XCcsds_wavelet_transform *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_GIE, 0);
}

void XCcsds_wavelet_transform_InterruptEnable(XCcsds_wavelet_transform *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_IER);
    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_IER, Register | Mask);
}

void XCcsds_wavelet_transform_InterruptDisable(XCcsds_wavelet_transform *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_IER);
    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_IER, Register & (~Mask));
}

void XCcsds_wavelet_transform_InterruptClear(XCcsds_wavelet_transform *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCcsds_wavelet_transform_WriteReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_ISR, Mask);
}

u32 XCcsds_wavelet_transform_InterruptGetEnabled(XCcsds_wavelet_transform *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_IER);
}

u32 XCcsds_wavelet_transform_InterruptGetStatus(XCcsds_wavelet_transform *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCcsds_wavelet_transform_ReadReg(InstancePtr->Control_BaseAddress, XCCSDS_WAVELET_TRANSFORM_CONTROL_ADDR_ISR);
}

