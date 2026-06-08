set ModuleHierarchy {[{
"Name" : "cifar10", "RefName" : "cifar10","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_convolution_fu_446", "RefName" : "convolution","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_21_1","RefName" : "VITIS_LOOP_21_1","ID" : "2","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_convolution_Pipeline_VITIS_LOOP_26_2_fu_117", "RefName" : "convolution_Pipeline_VITIS_LOOP_26_2","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_26_2","RefName" : "VITIS_LOOP_26_2","ID" : "4","Type" : "pipeline"},]},]},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_fu_457", "RefName" : "cifar10_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_51_1_VITIS_LOOP_53_2","RefName" : "VITIS_LOOP_51_1_VITIS_LOOP_53_2","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_108_1_VITIS_LOOP_110_2_fu_480", "RefName" : "cifar10_Pipeline_VITIS_LOOP_108_1_VITIS_LOOP_110_2","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_108_1_VITIS_LOOP_110_2","RefName" : "VITIS_LOOP_108_1_VITIS_LOOP_110_2","ID" : "8","Type" : "no",
		"SubInsts" : [
		{"Name" : "pow_generic_double_s", "RefName" : "pow_generic_double_s","ID" : "9","Type" : "pipeline"},]},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_21_fu_513", "RefName" : "cifar10_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_21","ID" : "10","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_51_1_VITIS_LOOP_53_2","RefName" : "VITIS_LOOP_51_1_VITIS_LOOP_53_2","ID" : "11","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_108_1_VITIS_LOOP_110_22_fu_522", "RefName" : "cifar10_Pipeline_VITIS_LOOP_108_1_VITIS_LOOP_110_22","ID" : "12","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_108_1_VITIS_LOOP_110_2","RefName" : "VITIS_LOOP_108_1_VITIS_LOOP_110_2","ID" : "13","Type" : "no",
		"SubInsts" : [
		{"Name" : "pow_generic_double_s", "RefName" : "pow_generic_double_s","ID" : "14","Type" : "pipeline"},]},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_71_1_fu_579", "RefName" : "cifar10_Pipeline_VITIS_LOOP_71_1","ID" : "15","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_71_1","RefName" : "VITIS_LOOP_71_1","ID" : "16","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_71_15_fu_597", "RefName" : "cifar10_Pipeline_VITIS_LOOP_71_15","ID" : "17","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_71_1","RefName" : "VITIS_LOOP_71_1","ID" : "18","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_140_1_fu_605", "RefName" : "cifar10_Pipeline_VITIS_LOOP_140_1","ID" : "19","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_140_1","RefName" : "VITIS_LOOP_140_1","ID" : "20","Type" : "pipeline"},]},
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_147_2_fu_615", "RefName" : "cifar10_Pipeline_VITIS_LOOP_147_2","ID" : "21","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_147_2","RefName" : "VITIS_LOOP_147_2","ID" : "22","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "VITIS_LOOP_88_1","RefName" : "VITIS_LOOP_88_1","ID" : "23","Type" : "no",
	"SubLoops" : [
	{"Name" : "VITIS_LOOP_90_2","RefName" : "VITIS_LOOP_90_2","ID" : "24","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_93_3_VITIS_LOOP_95_4_fu_466", "RefName" : "cifar10_Pipeline_VITIS_LOOP_93_3_VITIS_LOOP_95_4","ID" : "25","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_93_3_VITIS_LOOP_95_4","RefName" : "VITIS_LOOP_93_3_VITIS_LOOP_95_4","ID" : "26","Type" : "pipeline"},]},]},]},
	{"Name" : "VITIS_LOOP_88_1","RefName" : "VITIS_LOOP_88_1","ID" : "27","Type" : "no",
	"SubLoops" : [
	{"Name" : "VITIS_LOOP_90_2","RefName" : "VITIS_LOOP_90_2","ID" : "28","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_93_3_VITIS_LOOP_95_43_fu_555", "RefName" : "cifar10_Pipeline_VITIS_LOOP_93_3_VITIS_LOOP_95_43","ID" : "29","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_93_3_VITIS_LOOP_95_4","RefName" : "VITIS_LOOP_93_3_VITIS_LOOP_95_4","ID" : "30","Type" : "pipeline"},]},]},]},
	{"Name" : "VITIS_LOOP_120_1","RefName" : "VITIS_LOOP_120_1","ID" : "31","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_125_3_fu_569", "RefName" : "cifar10_Pipeline_VITIS_LOOP_125_3","ID" : "32","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_125_3","RefName" : "VITIS_LOOP_125_3","ID" : "33","Type" : "pipeline"},]},]},
	{"Name" : "VITIS_LOOP_120_1","RefName" : "VITIS_LOOP_120_1","ID" : "34","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_cifar10_Pipeline_VITIS_LOOP_125_34_fu_587", "RefName" : "cifar10_Pipeline_VITIS_LOOP_125_34","ID" : "35","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_125_3","RefName" : "VITIS_LOOP_125_3","ID" : "36","Type" : "pipeline"},]},]},]
}]}