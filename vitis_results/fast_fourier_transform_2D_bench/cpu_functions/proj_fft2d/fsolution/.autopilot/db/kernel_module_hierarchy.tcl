set ModuleHierarchy {[{
"Name" : "FFT2D_flat", "RefName" : "FFT2D_flat","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "VITIS_LOOP_63_2","RefName" : "VITIS_LOOP_63_2","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_FFT2D_flat_Outline_VITIS_LOOP_19_1_fu_237", "RefName" : "FFT2D_flat_Outline_VITIS_LOOP_19_1","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_19_1","RefName" : "VITIS_LOOP_19_1","ID" : "3","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_FFT2D_flat_Pipeline_VITIS_LOOP_21_2_fu_30", "RefName" : "FFT2D_flat_Pipeline_VITIS_LOOP_21_2","ID" : "4","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_21_2","RefName" : "VITIS_LOOP_21_2","ID" : "5","Type" : "pipeline"},]},]},]},
	{"Name" : "grp_FFT2D_flat_Outline_VITIS_LOOP_30_3_fu_242", "RefName" : "FFT2D_flat_Outline_VITIS_LOOP_30_3","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_30_3","RefName" : "VITIS_LOOP_30_3","ID" : "7","Type" : "no",
			"SubInsts" : [
			{"Name" : "sin_or_cos_float_s", "RefName" : "sin_or_cos_float_s","ID" : "8","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_sin_or_cos_float_Pipeline_1_fu_296", "RefName" : "sin_or_cos_float_Pipeline_1","ID" : "9","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "10","Type" : "pipeline"},]},
					{"Name" : "grp_sin_or_cos_float_Pipeline_2_fu_304", "RefName" : "sin_or_cos_float_Pipeline_2","ID" : "11","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "12","Type" : "pipeline"},]},]},
			{"Name" : "sin_or_cos_float_s", "RefName" : "sin_or_cos_float_s","ID" : "13","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_sin_or_cos_float_Pipeline_1_fu_296", "RefName" : "sin_or_cos_float_Pipeline_1","ID" : "14","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "15","Type" : "pipeline"},]},
					{"Name" : "grp_sin_or_cos_float_Pipeline_2_fu_304", "RefName" : "sin_or_cos_float_Pipeline_2","ID" : "16","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "17","Type" : "pipeline"},]},]},],
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_34_4","RefName" : "VITIS_LOOP_34_4","ID" : "18","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_FFT2D_flat_Pipeline_VITIS_LOOP_37_5_fu_121", "RefName" : "FFT2D_flat_Pipeline_VITIS_LOOP_37_5","ID" : "19","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_37_5","RefName" : "VITIS_LOOP_37_5","ID" : "20","Type" : "pipeline"},]},]},]},]},]},
	{"Name" : "VITIS_LOOP_68_3","RefName" : "VITIS_LOOP_68_3","ID" : "21","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_FFT2D_flat_Pipeline_VITIS_LOOP_69_4_fu_257", "RefName" : "FFT2D_flat_Pipeline_VITIS_LOOP_69_4","ID" : "22","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_69_4","RefName" : "VITIS_LOOP_69_4","ID" : "23","Type" : "pipeline"},]},
	{"Name" : "grp_FFT2D_flat_Pipeline_VITIS_LOOP_72_5_fu_274", "RefName" : "FFT2D_flat_Pipeline_VITIS_LOOP_72_5","ID" : "24","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_72_5","RefName" : "VITIS_LOOP_72_5","ID" : "25","Type" : "pipeline"},]},],
	"SubLoops" : [
	{"Name" : "VITIS_LOOP_19_1","RefName" : "VITIS_LOOP_19_1","ID" : "26","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_FFT2D_flat_Pipeline_VITIS_LOOP_21_21_fu_266", "RefName" : "FFT2D_flat_Pipeline_VITIS_LOOP_21_21","ID" : "27","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_21_2","RefName" : "VITIS_LOOP_21_2","ID" : "28","Type" : "pipeline"},]},]},
	{"Name" : "VITIS_LOOP_30_3","RefName" : "VITIS_LOOP_30_3","ID" : "29","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_sin_or_cos_float_s_fu_282", "RefName" : "sin_or_cos_float_s","ID" : "30","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_sin_or_cos_float_Pipeline_1_fu_296", "RefName" : "sin_or_cos_float_Pipeline_1","ID" : "31","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "32","Type" : "pipeline"},]},
				{"Name" : "grp_sin_or_cos_float_Pipeline_2_fu_304", "RefName" : "sin_or_cos_float_Pipeline_2","ID" : "33","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "34","Type" : "pipeline"},]},]},
		{"Name" : "grp_sin_or_cos_float_s_fu_297", "RefName" : "sin_or_cos_float_s","ID" : "35","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_sin_or_cos_float_Pipeline_1_fu_296", "RefName" : "sin_or_cos_float_Pipeline_1","ID" : "36","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "37","Type" : "pipeline"},]},
				{"Name" : "grp_sin_or_cos_float_Pipeline_2_fu_304", "RefName" : "sin_or_cos_float_Pipeline_2","ID" : "38","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "39","Type" : "pipeline"},]},]},],
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_34_4","RefName" : "VITIS_LOOP_34_4","ID" : "40","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_FFT2D_flat_Pipeline_VITIS_LOOP_37_52_fu_312", "RefName" : "FFT2D_flat_Pipeline_VITIS_LOOP_37_52","ID" : "41","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_37_5","RefName" : "VITIS_LOOP_37_5","ID" : "42","Type" : "pipeline"},]},]},]},]},]
}]}