set ModuleHierarchy {[{
"Name" : "cifar10", "RefName" : "cifar10","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "VITIS_LOOP_161_1","RefName" : "VITIS_LOOP_161_1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_convolution_fu_417", "RefName" : "convolution","ID" : "2","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_26_2_fu_77", "RefName" : "convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_26_2","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_21_1_VITIS_LOOP_26_2","RefName" : "VITIS_LOOP_21_1_VITIS_LOOP_26_2","ID" : "4","Type" : "pipeline"},]},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_47_2_fu_430", "RefName" : "cifar10_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_47_2","ID" : "5","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_45_1_VITIS_LOOP_47_2","RefName" : "VITIS_LOOP_45_1_VITIS_LOOP_47_2","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_109_1_VITIS_LOOP_111_2_fu_438", "RefName" : "cifar10_Pipeline_VITIS_LOOP_109_1_VITIS_LOOP_111_2","ID" : "7","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_109_1_VITIS_LOOP_111_2","RefName" : "VITIS_LOOP_109_1_VITIS_LOOP_111_2","ID" : "8","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "pow_generic_double_s", "RefName" : "pow_generic_double_s","ID" : "9","Type" : "pipeline"},]},]},
	{"Name" : "grp_convolution_1_fu_480", "RefName" : "convolution_1","ID" : "10","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_convolution_1_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_26_2_fu_67", "RefName" : "convolution_1_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_26_2","ID" : "11","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_21_1_VITIS_LOOP_26_2","RefName" : "VITIS_LOOP_21_1_VITIS_LOOP_26_2","ID" : "12","Type" : "pipeline"},]},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_47_21_fu_491", "RefName" : "cifar10_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_47_21","ID" : "13","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_45_1_VITIS_LOOP_47_2","RefName" : "VITIS_LOOP_45_1_VITIS_LOOP_47_2","ID" : "14","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_109_1_VITIS_LOOP_111_22_fu_498", "RefName" : "cifar10_Pipeline_VITIS_LOOP_109_1_VITIS_LOOP_111_22","ID" : "15","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_109_1_VITIS_LOOP_111_2","RefName" : "VITIS_LOOP_109_1_VITIS_LOOP_111_2","ID" : "16","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "pow_generic_double_s", "RefName" : "pow_generic_double_s","ID" : "17","Type" : "pipeline"},]},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_121_1_VITIS_LOOP_126_3_fu_538", "RefName" : "cifar10_Pipeline_VITIS_LOOP_121_1_VITIS_LOOP_126_3","ID" : "18","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_121_1_VITIS_LOOP_126_3","RefName" : "VITIS_LOOP_121_1_VITIS_LOOP_126_3","ID" : "19","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_72_1_fu_546", "RefName" : "cifar10_Pipeline_VITIS_LOOP_72_1","ID" : "20","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_72_1","RefName" : "VITIS_LOOP_72_1","ID" : "21","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_121_1_VITIS_LOOP_126_34_fu_553", "RefName" : "cifar10_Pipeline_VITIS_LOOP_121_1_VITIS_LOOP_126_34","ID" : "22","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_121_1_VITIS_LOOP_126_3","RefName" : "VITIS_LOOP_121_1_VITIS_LOOP_126_3","ID" : "23","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_72_15_fu_561", "RefName" : "cifar10_Pipeline_VITIS_LOOP_72_15","ID" : "24","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_72_1","RefName" : "VITIS_LOOP_72_1","ID" : "25","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_141_1_fu_569", "RefName" : "cifar10_Pipeline_VITIS_LOOP_141_1","ID" : "26","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_141_1","RefName" : "VITIS_LOOP_141_1","ID" : "27","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_148_2_fu_576", "RefName" : "cifar10_Pipeline_VITIS_LOOP_148_2","ID" : "28","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_148_2","RefName" : "VITIS_LOOP_148_2","ID" : "29","Type" : "pipeline"},]},],
	"SubLoops" : [
	{"Name" : "VITIS_LOOP_89_1","RefName" : "VITIS_LOOP_89_1","ID" : "30","Type" : "no",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_91_2","RefName" : "VITIS_LOOP_91_2","ID" : "31","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_94_3_VITIS_LOOP_96_4_fu_471", "RefName" : "cifar10_Pipeline_VITIS_LOOP_94_3_VITIS_LOOP_96_4","ID" : "32","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_94_3_VITIS_LOOP_96_4","RefName" : "VITIS_LOOP_94_3_VITIS_LOOP_96_4","ID" : "33","Type" : "pipeline"},]},]},]},
	{"Name" : "VITIS_LOOP_89_1","RefName" : "VITIS_LOOP_89_1","ID" : "34","Type" : "no",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_91_2","RefName" : "VITIS_LOOP_91_2","ID" : "35","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_94_3_VITIS_LOOP_96_43_fu_529", "RefName" : "cifar10_Pipeline_VITIS_LOOP_94_3_VITIS_LOOP_96_43","ID" : "36","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_94_3_VITIS_LOOP_96_4","RefName" : "VITIS_LOOP_94_3_VITIS_LOOP_96_4","ID" : "37","Type" : "pipeline"},]},]},]},]},]
}]}