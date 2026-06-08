// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xccsds_wavelet_transform.h"

extern XCcsds_wavelet_transform_Config XCcsds_wavelet_transform_ConfigTable[];

#ifdef SDT
XCcsds_wavelet_transform_Config *XCcsds_wavelet_transform_LookupConfig(UINTPTR BaseAddress) {
	XCcsds_wavelet_transform_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XCcsds_wavelet_transform_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XCcsds_wavelet_transform_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XCcsds_wavelet_transform_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCcsds_wavelet_transform_Initialize(XCcsds_wavelet_transform *InstancePtr, UINTPTR BaseAddress) {
	XCcsds_wavelet_transform_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCcsds_wavelet_transform_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCcsds_wavelet_transform_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XCcsds_wavelet_transform_Config *XCcsds_wavelet_transform_LookupConfig(u16 DeviceId) {
	XCcsds_wavelet_transform_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCCSDS_WAVELET_TRANSFORM_NUM_INSTANCES; Index++) {
		if (XCcsds_wavelet_transform_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XCcsds_wavelet_transform_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCcsds_wavelet_transform_Initialize(XCcsds_wavelet_transform *InstancePtr, u16 DeviceId) {
	XCcsds_wavelet_transform_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCcsds_wavelet_transform_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCcsds_wavelet_transform_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

