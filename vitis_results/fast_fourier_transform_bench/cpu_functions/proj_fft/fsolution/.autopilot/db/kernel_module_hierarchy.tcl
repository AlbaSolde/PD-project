set ModuleHierarchy {[{
"Name" : "fft_function", "RefName" : "fft_function","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_fft_function_Outline_VITIS_LOOP_12_1_fu_46", "RefName" : "fft_function_Outline_VITIS_LOOP_12_1","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_12_1","RefName" : "VITIS_LOOP_12_1","ID" : "2","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_fft_function_Pipeline_VITIS_LOOP_18_2_fu_48", "RefName" : "fft_function_Pipeline_VITIS_LOOP_18_2","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_18_2","RefName" : "VITIS_LOOP_18_2","ID" : "4","Type" : "pipeline"},]},]},]},
	{"Name" : "grp_fft_function_Outline_VITIS_LOOP_27_3_fu_53", "RefName" : "fft_function_Outline_VITIS_LOOP_27_3","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_27_3","RefName" : "VITIS_LOOP_27_3","ID" : "6","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_sin_or_cos_double_s_fu_102", "RefName" : "sin_or_cos_double_s","ID" : "7","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_sin_or_cos_double_Pipeline_1_fu_360", "RefName" : "sin_or_cos_double_Pipeline_1","ID" : "8","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "9","Type" : "pipeline"},]},
				{"Name" : "grp_sin_or_cos_double_Pipeline_2_fu_367", "RefName" : "sin_or_cos_double_Pipeline_2","ID" : "10","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "11","Type" : "pipeline"},]},
				{"Name" : "grp_sin_or_cos_double_Pipeline_3_fu_378", "RefName" : "sin_or_cos_double_Pipeline_3","ID" : "12","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "13","Type" : "pipeline"},]},
				{"Name" : "grp_sin_or_cos_double_Pipeline_4_fu_390", "RefName" : "sin_or_cos_double_Pipeline_4","ID" : "14","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "15","Type" : "pipeline"},]},]},],
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_36_4","RefName" : "VITIS_LOOP_36_4","ID" : "16","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_fft_function_Pipeline_VITIS_LOOP_37_5_fu_119", "RefName" : "fft_function_Pipeline_VITIS_LOOP_37_5","ID" : "17","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_37_5","RefName" : "VITIS_LOOP_37_5","ID" : "18","Type" : "pipeline"},]},]},]},]},]
}]}