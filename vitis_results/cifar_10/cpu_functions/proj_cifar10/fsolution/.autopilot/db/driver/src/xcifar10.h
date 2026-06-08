// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XCIFAR10_H
#define XCIFAR10_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xcifar10_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u32 Control_BaseAddress;
} XCifar10_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XCifar10;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XCifar10_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XCifar10_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XCifar10_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XCifar10_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XCifar10_Initialize(XCifar10 *InstancePtr, UINTPTR BaseAddress);
XCifar10_Config* XCifar10_LookupConfig(UINTPTR BaseAddress);
#else
int XCifar10_Initialize(XCifar10 *InstancePtr, u16 DeviceId);
XCifar10_Config* XCifar10_LookupConfig(u16 DeviceId);
#endif
int XCifar10_CfgInitialize(XCifar10 *InstancePtr, XCifar10_Config *ConfigPtr);
#else
int XCifar10_Initialize(XCifar10 *InstancePtr, const char* InstanceName);
int XCifar10_Release(XCifar10 *InstancePtr);
#endif

void XCifar10_Start(XCifar10 *InstancePtr);
u32 XCifar10_IsDone(XCifar10 *InstancePtr);
u32 XCifar10_IsIdle(XCifar10 *InstancePtr);
u32 XCifar10_IsReady(XCifar10 *InstancePtr);
void XCifar10_EnableAutoRestart(XCifar10 *InstancePtr);
void XCifar10_DisableAutoRestart(XCifar10 *InstancePtr);

void XCifar10_Set_output_data(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_output_data(XCifar10 *InstancePtr);
void XCifar10_Set_conv_1_output(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_conv_1_output(XCifar10 *InstancePtr);
void XCifar10_Set_pooling_1_output(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_pooling_1_output(XCifar10 *InstancePtr);
void XCifar10_Set_conv_2_output(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_conv_2_output(XCifar10 *InstancePtr);
void XCifar10_Set_pooling_2_output(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_pooling_2_output(XCifar10 *InstancePtr);
void XCifar10_Set_dense_layer_1_output(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_dense_layer_1_output(XCifar10 *InstancePtr);
void XCifar10_Set_dense_layer_2_output(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_dense_layer_2_output(XCifar10 *InstancePtr);
void XCifar10_Set_input_data(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_input_data(XCifar10 *InstancePtr);
void XCifar10_Set_kernel_1_data(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_kernel_1_data(XCifar10 *InstancePtr);
void XCifar10_Set_kernel_2_data(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_kernel_2_data(XCifar10 *InstancePtr);
void XCifar10_Set_weights_1(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_weights_1(XCifar10 *InstancePtr);
void XCifar10_Set_weights_2(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_weights_2(XCifar10 *InstancePtr);
void XCifar10_Set_input_data_size(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_input_data_size(XCifar10 *InstancePtr);
void XCifar10_Set_output_data_size(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_output_data_size(XCifar10 *InstancePtr);
void XCifar10_Set_kernel_1_size(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_kernel_1_size(XCifar10 *InstancePtr);
void XCifar10_Set_kernel_2_size(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_kernel_2_size(XCifar10 *InstancePtr);
void XCifar10_Set_stride_1_size(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_stride_1_size(XCifar10 *InstancePtr);
void XCifar10_Set_stride_2_size(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_stride_2_size(XCifar10 *InstancePtr);
void XCifar10_Set_neurons_dense_1_size(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_neurons_dense_1_size(XCifar10 *InstancePtr);
void XCifar10_Set_neurons_dense_2_size(XCifar10 *InstancePtr, u32 Data);
u32 XCifar10_Get_neurons_dense_2_size(XCifar10 *InstancePtr);

void XCifar10_InterruptGlobalEnable(XCifar10 *InstancePtr);
void XCifar10_InterruptGlobalDisable(XCifar10 *InstancePtr);
void XCifar10_InterruptEnable(XCifar10 *InstancePtr, u32 Mask);
void XCifar10_InterruptDisable(XCifar10 *InstancePtr, u32 Mask);
void XCifar10_InterruptClear(XCifar10 *InstancePtr, u32 Mask);
u32 XCifar10_InterruptGetEnabled(XCifar10 *InstancePtr);
u32 XCifar10_InterruptGetStatus(XCifar10 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
