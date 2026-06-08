set ModuleHierarchy {[{
"Name" : "fft_function", "RefName" : "fft_function","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "VITIS_LOOP_69_1","RefName" : "VITIS_LOOP_69_1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_aux_fft_function_fu_91", "RefName" : "aux_fft_function","ID" : "2","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_aux_fft_function_Outline_VITIS_LOOP_14_1_fu_52", "RefName" : "aux_fft_function_Outline_VITIS_LOOP_14_1","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_14_1","RefName" : "VITIS_LOOP_14_1","ID" : "4","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_aux_fft_function_Pipeline_VITIS_LOOP_21_2_fu_48", "RefName" : "aux_fft_function_Pipeline_VITIS_LOOP_21_2","ID" : "5","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_21_2","RefName" : "VITIS_LOOP_21_2","ID" : "6","Type" : "pipeline"},]},]},]},
			{"Name" : "grp_aux_fft_function_Outline_VITIS_LOOP_30_3_fu_59", "RefName" : "aux_fft_function_Outline_VITIS_LOOP_30_3","ID" : "7","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_30_3","RefName" : "VITIS_LOOP_30_3","ID" : "8","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_sin_or_cos_double_s_fu_125", "RefName" : "sin_or_cos_double_s","ID" : "9","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_sin_or_cos_double_Pipeline_1_fu_360", "RefName" : "sin_or_cos_double_Pipeline_1","ID" : "10","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "11","Type" : "pipeline"},]},
						{"Name" : "grp_sin_or_cos_double_Pipeline_2_fu_367", "RefName" : "sin_or_cos_double_Pipeline_2","ID" : "12","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "13","Type" : "pipeline"},]},
						{"Name" : "grp_sin_or_cos_double_Pipeline_3_fu_378", "RefName" : "sin_or_cos_double_Pipeline_3","ID" : "14","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "15","Type" : "pipeline"},]},
						{"Name" : "grp_sin_or_cos_double_Pipeline_4_fu_390", "RefName" : "sin_or_cos_double_Pipeline_4","ID" : "16","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "17","Type" : "pipeline"},]},]},],
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_39_4","RefName" : "VITIS_LOOP_39_4","ID" : "18","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_aux_fft_function_Pipeline_VITIS_LOOP_40_5_fu_142", "RefName" : "aux_fft_function_Pipeline_VITIS_LOOP_40_5","ID" : "19","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_40_5","RefName" : "VITIS_LOOP_40_5","ID" : "20","Type" : "pipeline"},]},]},]},]},]},]},]
}]}