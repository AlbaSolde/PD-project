set ModuleHierarchy {[{
"Name" : "softmax", "RefName" : "softmax","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_softmax_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_48_2_fu_69", "RefName" : "softmax_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_48_2","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_46_1_VITIS_LOOP_48_2","RefName" : "VITIS_LOOP_46_1_VITIS_LOOP_48_2","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_softmax_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_58_4_fu_76", "RefName" : "softmax_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_58_4","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_56_3_VITIS_LOOP_58_4","RefName" : "VITIS_LOOP_56_3_VITIS_LOOP_58_4","ID" : "4","Type" : "pipeline"},]},]
}]}