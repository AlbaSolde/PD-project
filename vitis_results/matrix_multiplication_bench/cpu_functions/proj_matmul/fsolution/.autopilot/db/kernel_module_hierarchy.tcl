set ModuleHierarchy {[{
"Name" : "matrix_multiplication", "RefName" : "matrix_multiplication","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "VITIS_LOOP_4_1","RefName" : "VITIS_LOOP_4_1","ID" : "1","Type" : "no",
	"SubLoops" : [
	{"Name" : "VITIS_LOOP_6_2","RefName" : "VITIS_LOOP_6_2","ID" : "2","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_matrix_multiplication_Pipeline_VITIS_LOOP_8_3_fu_108", "RefName" : "matrix_multiplication_Pipeline_VITIS_LOOP_8_3","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_8_3","RefName" : "VITIS_LOOP_8_3","ID" : "4","Type" : "pipeline"},]},]},]},]
}]}