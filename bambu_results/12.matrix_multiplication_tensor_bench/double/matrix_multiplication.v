// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-04-17T09:36:42
// Bambu executed with: bambu --top-fname=matrix_multiplication -DDOUBLE lib_cpu.cpp 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************


`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1,
    value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_SE(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    if (wenable)
      reg_out1 <= in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_STD(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    reg_out1 <= in1;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lut_expr_FU(in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  in8,
  in9,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input in2;
  input in3;
  input in4;
  input in5;
  input in6;
  input in7;
  input in8;
  input in9;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg[7:0] cleaned_in0;
  wire [7:0] in0;
  wire[BITSIZE_in1-1:0] shifted_s;
  assign in0 = {in9, in8, in7, in6, in5, in4, in3, in2};
  generate
    genvar i0;
    for (i0=0; i0<8; i0=i0+1)
    begin : L0
          always @(*)
          begin
             if (in0[i0] == 1'b1)
                cleaned_in0[i0] = 1'b1;
             else
                cleaned_in0[i0] = 1'b0;
          end
    end
  endgenerate
  assign shifted_s = in1 >> cleaned_in0;
  assign out1[0] = shifted_s[0];
  generate
     if(BITSIZE_out1 > 1)
       assign out1[BITSIZE_out1-1:1] = 0;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output out1;
  assign out1 = in1 != {BITSIZE_in1{1'b0}};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BMEMORY_CTRLN(clock,
  in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
  Min_oe_ram,
  Mout_oe_ram,
  Min_we_ram,
  Mout_we_ram,
  Min_addr_ram,
  Mout_addr_ram,
  M_Rdata_ram,
  Min_Wdata_ram,
  Mout_Wdata_ram,
  Min_data_ram_size,
  Mout_data_ram_size,
  M_DataRdy);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_Min_oe_ram=1, PORTSIZE_Min_oe_ram=2,
    BITSIZE_Min_we_ram=1, PORTSIZE_Min_we_ram=2,
    BITSIZE_Mout_oe_ram=1, PORTSIZE_Mout_oe_ram=2,
    BITSIZE_Mout_we_ram=1, PORTSIZE_Mout_we_ram=2,
    BITSIZE_M_DataRdy=1, PORTSIZE_M_DataRdy=2,
    BITSIZE_Min_addr_ram=1, PORTSIZE_Min_addr_ram=2,
    BITSIZE_Mout_addr_ram=1, PORTSIZE_Mout_addr_ram=2,
    BITSIZE_M_Rdata_ram=8, PORTSIZE_M_Rdata_ram=2,
    BITSIZE_Min_Wdata_ram=8, PORTSIZE_Min_Wdata_ram=2,
    BITSIZE_Mout_Wdata_ram=8, PORTSIZE_Mout_Wdata_ram=2,
    BITSIZE_Min_data_ram_size=1, PORTSIZE_Min_data_ram_size=2,
    BITSIZE_Mout_data_ram_size=1, PORTSIZE_Mout_data_ram_size=2;
  // IN
  input clock;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_Min_oe_ram-1:0] Min_oe_ram;
  input [PORTSIZE_Min_we_ram-1:0] Min_we_ram;
  input [(PORTSIZE_Min_addr_ram*BITSIZE_Min_addr_ram)+(-1):0] Min_addr_ram;
  input [(PORTSIZE_M_Rdata_ram*BITSIZE_M_Rdata_ram)+(-1):0] M_Rdata_ram;
  input [(PORTSIZE_Min_Wdata_ram*BITSIZE_Min_Wdata_ram)+(-1):0] Min_Wdata_ram;
  input [(PORTSIZE_Min_data_ram_size*BITSIZE_Min_data_ram_size)+(-1):0] Min_data_ram_size;
  input [PORTSIZE_M_DataRdy-1:0] M_DataRdy;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
  output [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
  output [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
  output [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
  output [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;
  
  parameter max_n_writes = PORTSIZE_sel_STORE > PORTSIZE_Mout_we_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_we_ram;
  parameter max_n_reads = PORTSIZE_sel_LOAD > PORTSIZE_Mout_oe_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_oe_ram;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  wire  [(PORTSIZE_in2*BITSIZE_in2)-1:0] tmp_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  assign tmp_addr = in2;
  generate
  genvar i;
    for (i=0; i<max_n_rw; i=i+1)
    begin : L0
      assign Mout_addr_ram[(i+1)*BITSIZE_Mout_addr_ram-1:i*BITSIZE_Mout_addr_ram] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (tmp_addr[(i+1)*BITSIZE_in2-1:i*BITSIZE_in2]) : Min_addr_ram[(i+1)*BITSIZE_Min_addr_ram-1:i*BITSIZE_Min_addr_ram];
    end
    endgenerate
  assign Mout_oe_ram = int_sel_LOAD | Min_oe_ram;
  assign Mout_we_ram = int_sel_STORE | Min_we_ram;
  generate
    for (i=0; i<max_n_reads; i=i+1)
    begin : L1
      assign out1[(i+1)*BITSIZE_out1-1:i*BITSIZE_out1] = M_Rdata_ram[i*BITSIZE_M_Rdata_ram+BITSIZE_out1-1:i*BITSIZE_M_Rdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L2
      assign Mout_Wdata_ram[(i+1)*BITSIZE_Mout_Wdata_ram-1:i*BITSIZE_Mout_Wdata_ram] = int_sel_STORE[i] ? in1[(i+1)*BITSIZE_in1-1:i*BITSIZE_in1] : Min_Wdata_ram[(i+1)*BITSIZE_Min_Wdata_ram-1:i*BITSIZE_Min_Wdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L3
      assign Mout_data_ram_size[(i+1)*BITSIZE_Mout_data_ram_size-1:i*BITSIZE_Mout_data_ram_size] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (in3[(i+1)*BITSIZE_in3-1:i*BITSIZE_in3]) : Min_data_ram_size[(i+1)*BITSIZE_Min_data_ram_size-1:i*BITSIZE_Min_data_ram_size];
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_eq_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_le_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 <= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    localparam arg2_bitsize = $clog2(PRECISION);
  `else
    localparam arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 << in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 << in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_mult_expr_FU(clock,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PIPE_PARAMETER=0;
  // IN
  input clock;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  generate
    if(PIPE_PARAMETER==1)
    begin
      reg [BITSIZE_out1-1:0] out1_reg;
      assign out1 = out1_reg;
      always @(posedge clock)
      begin
        out1_reg <= in1 * in2;
      end
    end
    else if(PIPE_PARAMETER>1)
    begin
      reg [BITSIZE_in1-1:0] in1_in;
      reg [BITSIZE_in2-1:0] in2_in;
      wire [BITSIZE_out1-1:0] mult_res;
      reg [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
      integer i;
      assign mult_res = in1_in * in2_in;
      always @(posedge clock)
      begin
        in1_in <= in1;
        in2_in <= in2;
        mul[PIPE_PARAMETER-2] <= mult_res;
        for (i=0; i<PIPE_PARAMETER-2; i=i+1)
          mul[i] <= mul[i+1];
      end
      assign out1 = mul[0];
    end
    else
    begin
      assign out1 = in1 * in2;
    end
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_pointer_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    LSB_PARAMETER=-1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  wire [BITSIZE_out1-1:0] in1_tmp;
  wire [BITSIZE_out1-1:0] in2_tmp;
  assign in1_tmp = in1;
  assign in2_tmp = in2;generate if (BITSIZE_out1 > LSB_PARAMETER) assign out1[BITSIZE_out1-1:LSB_PARAMETER] = (in1_tmp[BITSIZE_out1-1:LSB_PARAMETER] + in2_tmp[BITSIZE_out1-1:LSB_PARAMETER]); else assign out1 = 0; endgenerate
  generate if (LSB_PARAMETER != 0 && BITSIZE_out1 > LSB_PARAMETER) assign out1[LSB_PARAMETER-1:0] = 0; endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_UNSIGNED_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2020-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_extract_bit_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output out1;
  assign out1 = (in1 >> in2)&1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_and_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    localparam arg2_bitsize = $clog2(PRECISION);
  `else
    localparam arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 <<< in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 <<< in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    localparam arg2_bitsize = $clog2(PRECISION);
  `else
    localparam arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >>> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >>> in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_and_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_concat_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1,
    OFFSET_PARAMETER=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  localparam nbit_out = BITSIZE_out1 > OFFSET_PARAMETER ? BITSIZE_out1 : 1+OFFSET_PARAMETER;
  wire [nbit_out-1:0] tmp_in1;
  wire [OFFSET_PARAMETER-1:0] tmp_in2;
  generate
    if(BITSIZE_in1 >= nbit_out)
      assign tmp_in1=in1[nbit_out-1:0];
    else
      assign tmp_in1={{(nbit_out-BITSIZE_in1){1'b0}},in1};
  endgenerate
  generate
    if(BITSIZE_in2 >= OFFSET_PARAMETER)
      assign tmp_in2=in2[OFFSET_PARAMETER-1:0];
    else
      assign tmp_in2={{(OFFSET_PARAMETER-BITSIZE_in2){1'b0}},in2};
  endgenerate
  assign out1 = {tmp_in1[nbit_out-1:OFFSET_PARAMETER] , tmp_in2};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 | in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_not_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = ~in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_xor_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 ^ in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_cond_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_gt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 > in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 < in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_minus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 - in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ne_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    localparam arg2_bitsize = $clog2(PRECISION);
  `else
    localparam arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >> in2;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ternary_pm_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2 - in3;
endmodule

// Datapath RTL description for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_adde11m52b_1023nih(clock,
  reset,
  in_port_a,
  in_port_b,
  return_port,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_51,
  wrenable_reg_52,
  wrenable_reg_53,
  wrenable_reg_54,
  wrenable_reg_55,
  wrenable_reg_56,
  wrenable_reg_57,
  wrenable_reg_58,
  wrenable_reg_59,
  wrenable_reg_6,
  wrenable_reg_60,
  wrenable_reg_61,
  wrenable_reg_62,
  wrenable_reg_63,
  wrenable_reg_64,
  wrenable_reg_65,
  wrenable_reg_66,
  wrenable_reg_67,
  wrenable_reg_68,
  wrenable_reg_69,
  wrenable_reg_7,
  wrenable_reg_70,
  wrenable_reg_71,
  wrenable_reg_72,
  wrenable_reg_73,
  wrenable_reg_74,
  wrenable_reg_75,
  wrenable_reg_76,
  wrenable_reg_77,
  wrenable_reg_8,
  wrenable_reg_9);
  // IN
  input clock;
  input reset;
  input [63:0] in_port_a;
  input [63:0] in_port_b;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_27;
  input wrenable_reg_28;
  input wrenable_reg_29;
  input wrenable_reg_3;
  input wrenable_reg_30;
  input wrenable_reg_31;
  input wrenable_reg_32;
  input wrenable_reg_33;
  input wrenable_reg_34;
  input wrenable_reg_35;
  input wrenable_reg_36;
  input wrenable_reg_37;
  input wrenable_reg_38;
  input wrenable_reg_39;
  input wrenable_reg_4;
  input wrenable_reg_40;
  input wrenable_reg_41;
  input wrenable_reg_42;
  input wrenable_reg_43;
  input wrenable_reg_44;
  input wrenable_reg_45;
  input wrenable_reg_46;
  input wrenable_reg_47;
  input wrenable_reg_48;
  input wrenable_reg_49;
  input wrenable_reg_5;
  input wrenable_reg_50;
  input wrenable_reg_51;
  input wrenable_reg_52;
  input wrenable_reg_53;
  input wrenable_reg_54;
  input wrenable_reg_55;
  input wrenable_reg_56;
  input wrenable_reg_57;
  input wrenable_reg_58;
  input wrenable_reg_59;
  input wrenable_reg_6;
  input wrenable_reg_60;
  input wrenable_reg_61;
  input wrenable_reg_62;
  input wrenable_reg_63;
  input wrenable_reg_64;
  input wrenable_reg_65;
  input wrenable_reg_66;
  input wrenable_reg_67;
  input wrenable_reg_68;
  input wrenable_reg_69;
  input wrenable_reg_7;
  input wrenable_reg_70;
  input wrenable_reg_71;
  input wrenable_reg_72;
  input wrenable_reg_73;
  input wrenable_reg_74;
  input wrenable_reg_75;
  input wrenable_reg_76;
  input wrenable_reg_77;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [63:0] return_port;
  // Component and signal declarations
  wire [5:0] out_ASSIGN_UNSIGNED_FU_110_i0_fu___float_adde11m52b_1023nih_43668_46946;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_43668_46944;
  wire [0:0] out_IUdata_converter_FU_105_i0_fu___float_adde11m52b_1023nih_43668_44403;
  wire [0:0] out_IUdata_converter_FU_106_i0_fu___float_adde11m52b_1023nih_43668_44424;
  wire [0:0] out_IUdata_converter_FU_107_i0_fu___float_adde11m52b_1023nih_43668_44444;
  wire [0:0] out_IUdata_converter_FU_108_i0_fu___float_adde11m52b_1023nih_43668_44464;
  wire [0:0] out_IUdata_converter_FU_109_i0_fu___float_adde11m52b_1023nih_43668_44487;
  wire [55:0] out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_43668_43827;
  wire [5:0] out_IUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_43668_44108;
  wire [63:0] out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_43668_43759;
  wire signed [1:0] out_UIdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_43668_44099;
  wire signed [1:0] out_UIdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_43668_45877;
  wire signed [1:0] out_UIdata_converter_FU_26_i0_fu___float_adde11m52b_1023nih_43668_45887;
  wire signed [1:0] out_UIdata_converter_FU_2_i0_fu___float_adde11m52b_1023nih_43668_43750;
  wire signed [1:0] out_UIdata_converter_FU_69_i0_fu___float_adde11m52b_1023nih_43668_45896;
  wire signed [1:0] out_UIdata_converter_FU_88_i0_fu___float_adde11m52b_1023nih_43668_45905;
  wire signed [1:0] out_UIdata_converter_FU_92_i0_fu___float_adde11m52b_1023nih_43668_45914;
  wire signed [1:0] out_UIdata_converter_FU_9_i0_fu___float_adde11m52b_1023nih_43668_43818;
  wire out_UUdata_converter_FU_104_i0_fu___float_adde11m52b_1023nih_43668_45923;
  wire out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_43668_43918;
  wire out_UUdata_converter_FU_123_i0_fu___float_adde11m52b_1023nih_43668_44702;
  wire out_UUdata_converter_FU_12_i0_fu___float_adde11m52b_1023nih_43668_43932;
  wire out_UUdata_converter_FU_134_i0_fu___float_adde11m52b_1023nih_43668_46942;
  wire out_UUdata_converter_FU_136_i0_fu___float_adde11m52b_1023nih_43668_46936;
  wire [5:0] out_UUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_43668_44111;
  wire [5:0] out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_43668_44120;
  wire out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_43668_44225;
  wire signed [6:0] out_bit_and_expr_FU_0_8_8_138_i0_fu___float_adde11m52b_1023nih_43668_44346;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [5:0] out_const_10;
  wire [6:0] out_const_11;
  wire [6:0] out_const_12;
  wire [6:0] out_const_13;
  wire [5:0] out_const_14;
  wire [5:0] out_const_15;
  wire [6:0] out_const_16;
  wire out_const_17;
  wire [1:0] out_const_18;
  wire [2:0] out_const_19;
  wire [2:0] out_const_2;
  wire [3:0] out_const_20;
  wire [4:0] out_const_21;
  wire [5:0] out_const_22;
  wire [16:0] out_const_23;
  wire [51:0] out_const_24;
  wire [24:0] out_const_25;
  wire [56:0] out_const_26;
  wire [5:0] out_const_27;
  wire [4:0] out_const_28;
  wire [5:0] out_const_29;
  wire [3:0] out_const_3;
  wire [6:0] out_const_30;
  wire [5:0] out_const_31;
  wire [3:0] out_const_32;
  wire [4:0] out_const_33;
  wire [5:0] out_const_34;
  wire [7:0] out_const_35;
  wire [5:0] out_const_36;
  wire [4:0] out_const_37;
  wire [5:0] out_const_38;
  wire [5:0] out_const_39;
  wire [4:0] out_const_4;
  wire [2:0] out_const_40;
  wire [3:0] out_const_41;
  wire [4:0] out_const_42;
  wire [5:0] out_const_43;
  wire [4:0] out_const_44;
  wire [5:0] out_const_45;
  wire [63:0] out_const_46;
  wire [3:0] out_const_47;
  wire [4:0] out_const_48;
  wire [5:0] out_const_49;
  wire [5:0] out_const_5;
  wire [5:0] out_const_50;
  wire [4:0] out_const_51;
  wire [5:0] out_const_52;
  wire [7:0] out_const_53;
  wire [5:0] out_const_54;
  wire [1:0] out_const_55;
  wire [2:0] out_const_56;
  wire [3:0] out_const_57;
  wire [5:0] out_const_58;
  wire [6:0] out_const_59;
  wire [6:0] out_const_6;
  wire [5:0] out_const_60;
  wire [4:0] out_const_61;
  wire [5:0] out_const_62;
  wire [5:0] out_const_63;
  wire [62:0] out_const_64;
  wire [3:0] out_const_65;
  wire [5:0] out_const_66;
  wire [5:0] out_const_67;
  wire [4:0] out_const_68;
  wire [5:0] out_const_69;
  wire [3:0] out_const_7;
  wire [5:0] out_const_70;
  wire [2:0] out_const_71;
  wire [3:0] out_const_72;
  wire [4:0] out_const_73;
  wire [6:0] out_const_74;
  wire [7:0] out_const_75;
  wire [30:0] out_const_76;
  wire [4:0] out_const_77;
  wire [15:0] out_const_78;
  wire [3:0] out_const_79;
  wire [6:0] out_const_8;
  wire [4:0] out_const_80;
  wire [63:0] out_const_81;
  wire [8:0] out_const_82;
  wire [63:0] out_const_83;
  wire [4:0] out_const_84;
  wire [5:0] out_const_85;
  wire [63:0] out_const_86;
  wire [15:0] out_const_87;
  wire [10:0] out_const_88;
  wire [10:0] out_const_89;
  wire [2:0] out_const_9;
  wire [15:0] out_const_90;
  wire [31:0] out_const_91;
  wire [31:0] out_const_92;
  wire [31:0] out_const_93;
  wire [51:0] out_const_94;
  wire [54:0] out_const_95;
  wire [55:0] out_const_96;
  wire [62:0] out_const_97;
  wire [63:0] out_const_98;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_139_i0_fu___float_adde11m52b_1023nih_43668_44102;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i0_fu___float_adde11m52b_1023nih_43668_45881;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i1_fu___float_adde11m52b_1023nih_43668_45890;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i2_fu___float_adde11m52b_1023nih_43668_45899;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i3_fu___float_adde11m52b_1023nih_43668_45908;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i4_fu___float_adde11m52b_1023nih_43668_45917;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_141_i0_fu___float_adde11m52b_1023nih_43668_43753;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_141_i1_fu___float_adde11m52b_1023nih_43668_43821;
  wire out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_43668_49553;
  wire out_lut_expr_FU_101_i0_fu___float_adde11m52b_1023nih_43668_49556;
  wire out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_43668_49559;
  wire out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_43668_45095;
  wire out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_43668_49565;
  wire out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_43668_49569;
  wire out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_43668_44577;
  wire out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_43668_49574;
  wire out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_43668_49577;
  wire out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_43668_49580;
  wire out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_43668_49583;
  wire out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_43668_49586;
  wire out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_43668_49589;
  wire out_lut_expr_FU_120_i0_fu___float_adde11m52b_1023nih_43668_49592;
  wire out_lut_expr_FU_121_i0_fu___float_adde11m52b_1023nih_43668_49595;
  wire out_lut_expr_FU_122_i0_fu___float_adde11m52b_1023nih_43668_47092;
  wire out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_43668_49601;
  wire out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_43668_49605;
  wire out_lut_expr_FU_126_i0_fu___float_adde11m52b_1023nih_43668_45756;
  wire out_lut_expr_FU_127_i0_fu___float_adde11m52b_1023nih_43668_49609;
  wire out_lut_expr_FU_128_i0_fu___float_adde11m52b_1023nih_43668_45778;
  wire out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_43668_45837;
  wire out_lut_expr_FU_130_i0_fu___float_adde11m52b_1023nih_43668_47177;
  wire out_lut_expr_FU_131_i0_fu___float_adde11m52b_1023nih_43668_45853;
  wire out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_43668_45951;
  wire out_lut_expr_FU_133_i0_fu___float_adde11m52b_1023nih_43668_47166;
  wire out_lut_expr_FU_135_i0_fu___float_adde11m52b_1023nih_43668_47173;
  wire out_lut_expr_FU_18_i0_fu___float_adde11m52b_1023nih_43668_44096;
  wire out_lut_expr_FU_23_i0_fu___float_adde11m52b_1023nih_43668_44184;
  wire out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_43668_49500;
  wire out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_43668_49503;
  wire out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_43668_49506;
  wire out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_43668_49509;
  wire out_lut_expr_FU_63_i0_fu___float_adde11m52b_1023nih_43668_49513;
  wire out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_43668_49516;
  wire out_lut_expr_FU_65_i0_fu___float_adde11m52b_1023nih_43668_49519;
  wire out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_43668_49522;
  wire out_lut_expr_FU_67_i0_fu___float_adde11m52b_1023nih_43668_49525;
  wire out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033;
  wire out_lut_expr_FU_82_i0_fu___float_adde11m52b_1023nih_43668_49530;
  wire out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_43668_49533;
  wire out_lut_expr_FU_84_i0_fu___float_adde11m52b_1023nih_43668_49536;
  wire out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_43668_49539;
  wire out_lut_expr_FU_86_i0_fu___float_adde11m52b_1023nih_43668_49543;
  wire out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037;
  wire out_lut_expr_FU_8_i0_fu___float_adde11m52b_1023nih_43668_43815;
  wire out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_43668_45041;
  wire out_lut_expr_FU_99_i0_fu___float_adde11m52b_1023nih_43668_49549;
  wire [10:0] out_reg_0_reg_0;
  wire [52:0] out_reg_10_reg_10;
  wire out_reg_11_reg_11;
  wire out_reg_12_reg_12;
  wire [10:0] out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire [55:0] out_reg_18_reg_18;
  wire [63:0] out_reg_19_reg_19;
  wire [55:0] out_reg_1_reg_1;
  wire out_reg_20_reg_20;
  wire out_reg_21_reg_21;
  wire out_reg_22_reg_22;
  wire out_reg_23_reg_23;
  wire out_reg_24_reg_24;
  wire out_reg_25_reg_25;
  wire out_reg_26_reg_26;
  wire out_reg_27_reg_27;
  wire out_reg_28_reg_28;
  wire out_reg_29_reg_29;
  wire out_reg_2_reg_2;
  wire out_reg_30_reg_30;
  wire out_reg_31_reg_31;
  wire out_reg_32_reg_32;
  wire out_reg_33_reg_33;
  wire out_reg_34_reg_34;
  wire out_reg_35_reg_35;
  wire out_reg_36_reg_36;
  wire out_reg_37_reg_37;
  wire out_reg_38_reg_38;
  wire out_reg_39_reg_39;
  wire out_reg_3_reg_3;
  wire out_reg_40_reg_40;
  wire out_reg_41_reg_41;
  wire out_reg_42_reg_42;
  wire out_reg_43_reg_43;
  wire out_reg_44_reg_44;
  wire out_reg_45_reg_45;
  wire out_reg_46_reg_46;
  wire out_reg_47_reg_47;
  wire out_reg_48_reg_48;
  wire out_reg_49_reg_49;
  wire [54:0] out_reg_4_reg_4;
  wire out_reg_50_reg_50;
  wire out_reg_51_reg_51;
  wire out_reg_52_reg_52;
  wire out_reg_53_reg_53;
  wire out_reg_54_reg_54;
  wire out_reg_55_reg_55;
  wire out_reg_56_reg_56;
  wire out_reg_57_reg_57;
  wire out_reg_58_reg_58;
  wire out_reg_59_reg_59;
  wire [6:0] out_reg_5_reg_5;
  wire out_reg_60_reg_60;
  wire out_reg_61_reg_61;
  wire out_reg_62_reg_62;
  wire out_reg_63_reg_63;
  wire out_reg_64_reg_64;
  wire out_reg_65_reg_65;
  wire out_reg_66_reg_66;
  wire out_reg_67_reg_67;
  wire out_reg_68_reg_68;
  wire out_reg_69_reg_69;
  wire out_reg_6_reg_6;
  wire out_reg_70_reg_70;
  wire out_reg_71_reg_71;
  wire [51:0] out_reg_72_reg_72;
  wire out_reg_73_reg_73;
  wire [63:0] out_reg_74_reg_74;
  wire out_reg_75_reg_75;
  wire [10:0] out_reg_76_reg_76;
  wire out_reg_77_reg_77;
  wire out_reg_7_reg_7;
  wire [51:0] out_reg_8_reg_8;
  wire out_reg_9_reg_9;
  wire signed [0:0] out_rshift_expr_FU_32_0_32_142_i0_fu___float_adde11m52b_1023nih_43668_44105;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i0_fu___float_adde11m52b_1023nih_43668_45884;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i1_fu___float_adde11m52b_1023nih_43668_45893;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i2_fu___float_adde11m52b_1023nih_43668_45902;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i3_fu___float_adde11m52b_1023nih_43668_45911;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i4_fu___float_adde11m52b_1023nih_43668_45920;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_144_i0_fu___float_adde11m52b_1023nih_43668_43756;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_144_i1_fu___float_adde11m52b_1023nih_43668_43824;
  wire [54:0] out_ui_bit_and_expr_FU_0_64_64_145_i0_fu___float_adde11m52b_1023nih_43668_44200;
  wire [55:0] out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_43668_44233;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_43668_43796;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_43668_43847;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i2_fu___float_adde11m52b_1023nih_43668_44650;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_43668_44732;
  wire [15:0] out_ui_bit_and_expr_FU_16_0_16_148_i0_fu___float_adde11m52b_1023nih_43668_44268;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_149_i0_fu___float_adde11m52b_1023nih_43668_44244;
  wire [62:0] out_ui_bit_and_expr_FU_64_0_64_150_i0_fu___float_adde11m52b_1023nih_43668_43731;
  wire [62:0] out_ui_bit_and_expr_FU_64_0_64_150_i1_fu___float_adde11m52b_1023nih_43668_43738;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_43668_43784;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_43668_43841;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i2_fu___float_adde11m52b_1023nih_43668_44663;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_43668_44737;
  wire [55:0] out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_43668_44219;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_43668_43765;
  wire [52:0] out_ui_bit_and_expr_FU_64_64_64_153_i1_fu___float_adde11m52b_1023nih_43668_44171;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_154_i0_fu___float_adde11m52b_1023nih_43668_43948;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_155_i0_fu___float_adde11m52b_1023nih_43668_44117;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_156_i0_fu___float_adde11m52b_1023nih_43668_45571;
  wire [55:0] out_ui_bit_ior_concat_expr_FU_157_i0_fu___float_adde11m52b_1023nih_43668_44222;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_158_i0_fu___float_adde11m52b_1023nih_43668_43924;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_159_i0_fu___float_adde11m52b_1023nih_43668_43938;
  wire [62:0] out_ui_bit_ior_expr_FU_0_64_64_160_i0_fu___float_adde11m52b_1023nih_43668_44668;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_161_i0_fu___float_adde11m52b_1023nih_43668_44866;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_162_i0_fu___float_adde11m52b_1023nih_43668_44869;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu___float_adde11m52b_1023nih_43668_44430;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu___float_adde11m52b_1023nih_43668_44470;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu___float_adde11m52b_1023nih_43668_44473;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde11m52b_1023nih_43668_44493;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_43668_44496;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_168_i0_fu___float_adde11m52b_1023nih_43668_44838;
  wire [5:0] out_ui_bit_ior_expr_FU_8_8_8_169_i0_fu___float_adde11m52b_1023nih_43668_44114;
  wire [54:0] out_ui_bit_not_expr_FU_64_64_170_i0_fu___float_adde11m52b_1023nih_43668_44168;
  wire [63:0] out_ui_bit_xor_expr_FU_64_64_64_171_i0_fu___float_adde11m52b_1023nih_43668_43762;
  wire [62:0] out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_43668_43768;
  wire [62:0] out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_43668_43773;
  wire [55:0] out_ui_bit_xor_expr_FU_64_64_64_171_i3_fu___float_adde11m52b_1023nih_43668_44205;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i0_fu___float_adde11m52b_1023nih_43668_45786;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i1_fu___float_adde11m52b_1023nih_43668_45840;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i2_fu___float_adde11m52b_1023nih_43668_45848;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_43668_45866;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i4_fu___float_adde11m52b_1023nih_43668_45953;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i5_fu___float_adde11m52b_1023nih_43668_46938;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i0_fu___float_adde11m52b_1023nih_43668_45790;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i10_fu___float_adde11m52b_1023nih_43668_46940;
  wire [54:0] out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_43668_45804;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_43668_45808;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_43668_45818;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_43668_45826;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_43668_45832;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i6_fu___float_adde11m52b_1023nih_43668_45850;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i7_fu___float_adde11m52b_1023nih_43668_45859;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_43668_45868;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i9_fu___float_adde11m52b_1023nih_43668_45955;
  wire out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_43668_44714;
  wire out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_43668_44719;
  wire out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029;
  wire out_ui_eq_expr_FU_16_0_16_177_i0_fu___float_adde11m52b_1023nih_43668_45065;
  wire out_ui_eq_expr_FU_32_0_32_178_i0_fu___float_adde11m52b_1023nih_43668_45025;
  wire out_ui_eq_expr_FU_64_0_64_179_i0_fu___float_adde11m52b_1023nih_43668_44181;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_adde11m52b_1023nih_43668_47420;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_adde11m52b_1023nih_43668_47424;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_adde11m52b_1023nih_43668_47428;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_43668_47432;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_43668_47436;
  wire out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_43668_48783;
  wire out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_43668_48436;
  wire out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_43668_48440;
  wire out_ui_extract_bit_expr_FU_30_i0_fu___float_adde11m52b_1023nih_43668_48117;
  wire out_ui_extract_bit_expr_FU_31_i0_fu___float_adde11m52b_1023nih_43668_48787;
  wire out_ui_extract_bit_expr_FU_32_i0_fu___float_adde11m52b_1023nih_43668_48448;
  wire out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_43668_48452;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_43668_48133;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_43668_48791;
  wire out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_43668_48460;
  wire out_ui_extract_bit_expr_FU_37_i0_fu___float_adde11m52b_1023nih_43668_48464;
  wire out_ui_extract_bit_expr_FU_38_i0_fu___float_adde11m52b_1023nih_43668_48149;
  wire out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_43668_48795;
  wire out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_43668_48472;
  wire out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_43668_48476;
  wire out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_43668_48165;
  wire out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_43668_48799;
  wire out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_43668_48484;
  wire out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_43668_48488;
  wire out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_43668_48181;
  wire out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_43668_48803;
  wire out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_43668_48496;
  wire out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_43668_48500;
  wire out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_43668_48197;
  wire out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_43668_48807;
  wire out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_43668_48508;
  wire out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_43668_48512;
  wire out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_43668_48213;
  wire out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_43668_48811;
  wire out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_43668_48520;
  wire out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_43668_48524;
  wire out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_43668_48229;
  wire out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_43668_47406;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_43668_47409;
  wire out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_43668_49084;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_adde11m52b_1023nih_43668_49088;
  wire out_ui_extract_bit_expr_FU_72_i0_fu___float_adde11m52b_1023nih_43668_48826;
  wire out_ui_extract_bit_expr_FU_73_i0_fu___float_adde11m52b_1023nih_43668_49096;
  wire out_ui_extract_bit_expr_FU_74_i0_fu___float_adde11m52b_1023nih_43668_49100;
  wire out_ui_extract_bit_expr_FU_75_i0_fu___float_adde11m52b_1023nih_43668_48853;
  wire out_ui_extract_bit_expr_FU_76_i0_fu___float_adde11m52b_1023nih_43668_49108;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_adde11m52b_1023nih_43668_49112;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_adde11m52b_1023nih_43668_48880;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_adde11m52b_1023nih_43668_49120;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_43668_47413;
  wire out_ui_extract_bit_expr_FU_80_i0_fu___float_adde11m52b_1023nih_43668_49124;
  wire out_ui_extract_bit_expr_FU_81_i0_fu___float_adde11m52b_1023nih_43668_48908;
  wire out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_43668_47273;
  wire out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_43668_47277;
  wire out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_43668_49484;
  wire out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_43668_49488;
  wire out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_43668_49440;
  wire out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_43668_49468;
  wire out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_43668_49472;
  wire out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_43668_49370;
  wire out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_43668_44502;
  wire [54:0] out_ui_lshift_expr_FU_0_64_64_181_i0_fu___float_adde11m52b_1023nih_43668_44165;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_182_i0_fu___float_adde11m52b_1023nih_43668_43921;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_182_i1_fu___float_adde11m52b_1023nih_43668_43935;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_182_i2_fu___float_adde11m52b_1023nih_43668_44647;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_182_i3_fu___float_adde11m52b_1023nih_43668_44863;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_183_i0_fu___float_adde11m52b_1023nih_43668_43927;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_43668_43941;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_184_i0_fu___float_adde11m52b_1023nih_43668_44256;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_185_i0_fu___float_adde11m52b_1023nih_43668_44280;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_186_i0_fu___float_adde11m52b_1023nih_43668_44306;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_187_i0_fu___float_adde11m52b_1023nih_43668_44334;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_188_i0_fu___float_adde11m52b_1023nih_43668_44362;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_189_i0_fu___float_adde11m52b_1023nih_43668_44369;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_190_i0_fu___float_adde11m52b_1023nih_43668_44835;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_191_i0_fu___float_adde11m52b_1023nih_43668_45547;
  wire [55:0] out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde11m52b_1023nih_43668_45567;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_192_i1_fu___float_adde11m52b_1023nih_43668_48341;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_193_i0_fu___float_adde11m52b_1023nih_43668_45926;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_193_i1_fu___float_adde11m52b_1023nih_43668_46956;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_194_i0_fu___float_adde11m52b_1023nih_43668_45937;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_195_i0_fu___float_adde11m52b_1023nih_43668_48690;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde11m52b_1023nih_43668_44406;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_197_i0_fu___float_adde11m52b_1023nih_43668_44427;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_198_i0_fu___float_adde11m52b_1023nih_43668_44447;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_199_i0_fu___float_adde11m52b_1023nih_43668_44467;
  wire [5:0] out_ui_lshift_expr_FU_8_0_8_200_i0_fu___float_adde11m52b_1023nih_43668_44490;
  wire out_ui_lt_expr_FU_64_64_64_201_i0_fu___float_adde11m52b_1023nih_43668_43745;
  wire [10:0] out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_43668_43885;
  wire out_ui_ne_expr_FU_16_0_16_203_i0_fu___float_adde11m52b_1023nih_43668_43871;
  wire out_ui_ne_expr_FU_16_0_16_203_i1_fu___float_adde11m52b_1023nih_43668_43879;
  wire out_ui_ne_expr_FU_64_0_64_204_i0_fu___float_adde11m52b_1023nih_43668_43855;
  wire out_ui_ne_expr_FU_64_0_64_204_i1_fu___float_adde11m52b_1023nih_43668_43860;
  wire out_ui_ne_expr_FU_64_0_64_205_i0_fu___float_adde11m52b_1023nih_43668_44176;
  wire [55:0] out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228;
  wire [62:0] out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_43668_44705;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_206_i2_fu___float_adde11m52b_1023nih_43668_45564;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_207_i0_fu___float_adde11m52b_1023nih_43668_43787;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_207_i1_fu___float_adde11m52b_1023nih_43668_43844;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_207_i2_fu___float_adde11m52b_1023nih_43668_44729;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_208_i0_fu___float_adde11m52b_1023nih_43668_44241;
  wire [15:0] out_ui_rshift_expr_FU_64_0_64_209_i0_fu___float_adde11m52b_1023nih_43668_44265;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde11m52b_1023nih_43668_44660;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_211_i0_fu___float_adde11m52b_1023nih_43668_45539;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_43668_45550;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i0_fu___float_adde11m52b_1023nih_43668_45543;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i1_fu___float_adde11m52b_1023nih_43668_45558;
  wire [53:0] out_ui_rshift_expr_FU_64_0_64_212_i2_fu___float_adde11m52b_1023nih_43668_45561;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i3_fu___float_adde11m52b_1023nih_43668_48334;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i4_fu___float_adde11m52b_1023nih_43668_48337;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_213_i0_fu___float_adde11m52b_1023nih_43668_45929;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_214_i0_fu___float_adde11m52b_1023nih_43668_45933;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_215_i0_fu___float_adde11m52b_1023nih_43668_48683;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_215_i1_fu___float_adde11m52b_1023nih_43668_48686;
  wire [54:0] out_ui_rshift_expr_FU_64_64_64_216_i0_fu___float_adde11m52b_1023nih_43668_44123;
  wire [1:0] out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_43668_44349;
  wire [10:0] out_ui_ternary_pm_expr_FU_16_0_16_16_217_i0_fu___float_adde11m52b_1023nih_43668_44653;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110011)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110110)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10000)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b10000000000000000)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1000000000000000000000000000000000000000000000000000)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(25),
    .value(25'b1000000010000000111110001)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(57),
    .value(57'b100000001000000011111000100000000000000000000000000000000)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100001)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10001)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100010)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1000101)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100011)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1001)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10010)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100100)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10010000)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100101)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10011)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100110)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100111)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b101)) const_40 (.out1(out_const_40));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1010)) const_41 (.out1(out_const_41));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10100)) const_42 (.out1(out_const_42));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101001)) const_43 (.out1(out_const_43));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10101)) const_44 (.out1(out_const_44));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101011)) const_45 (.out1(out_const_45));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1010110010101100101011001010110011111111000011111111000000000000)) const_46 (.out1(out_const_46));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1011)) const_47 (.out1(out_const_47));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10110)) const_48 (.out1(out_const_48));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101100)) const_49 (.out1(out_const_49));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101101)) const_50 (.out1(out_const_50));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10111)) const_51 (.out1(out_const_51));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101110)) const_52 (.out1(out_const_52));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10111010)) const_53 (.out1(out_const_53));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101111)) const_54 (.out1(out_const_54));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_55 (.out1(out_const_55));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_56 (.out1(out_const_56));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_57 (.out1(out_const_57));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110000)) const_58 (.out1(out_const_58));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1100000)) const_59 (.out1(out_const_59));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110001)) const_60 (.out1(out_const_60));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11001)) const_61 (.out1(out_const_61));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110010)) const_62 (.out1(out_const_62));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110011)) const_63 (.out1(out_const_63));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b110011000100100011001100010010000000000000000000110011000100100)) const_64 (.out1(out_const_64));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1101)) const_65 (.out1(out_const_65));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110100)) const_66 (.out1(out_const_66));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110101)) const_67 (.out1(out_const_67));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11011)) const_68 (.out1(out_const_68));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110110)) const_69 (.out1(out_const_69));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0101)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110111)) const_70 (.out1(out_const_70));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_71 (.out1(out_const_71));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1110)) const_72 (.out1(out_const_72));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11100)) const_73 (.out1(out_const_73));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1110000)) const_74 (.out1(out_const_74));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11100000)) const_75 (.out1(out_const_75));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1110011010100010110001001000000)) const_76 (.out1(out_const_76));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11101)) const_77 (.out1(out_const_77));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1110101011000000)) const_78 (.out1(out_const_78));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_79 (.out1(out_const_79));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0101000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11110)) const_80 (.out1(out_const_80));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111001111000000111100101100000011110011110000001111001010000000)) const_81 (.out1(out_const_81));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b111101111)) const_82 (.out1(out_const_82));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111011110110011110101011001000111100110101000101100010010000000)) const_83 (.out1(out_const_83));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_84 (.out1(out_const_84));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_85 (.out1(out_const_85));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111110011111100111110100000101000001100000011001111101000001010)) const_86 (.out1(out_const_86));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111000010000)) const_87 (.out1(out_const_87));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111110)) const_88 (.out1(out_const_88));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_89 (.out1(out_const_89));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_9 (.out1(out_const_9));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111111111111)) const_90 (.out1(out_const_90));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111110110000000000000)) const_91 (.out1(out_const_91));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111110)) const_92 (.out1(out_const_92));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_93 (.out1(out_const_93));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_94 (.out1(out_const_94));
  constant_value #(.BITSIZE_out1(55),
    .value(55'b1111111111111111111111111111111111111111111111111111111)) const_95 (.out1(out_const_95));
  constant_value #(.BITSIZE_out1(56),
    .value(56'b11111111111111111111111111111111111111111111111111111111)) const_96 (.out1(out_const_96));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_97 (.out1(out_const_97));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_98 (.out1(out_const_98));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_43668_43731 (.out1(out_ui_bit_and_expr_FU_64_0_64_150_i0_fu___float_adde11m52b_1023nih_43668_43731),
    .in1(in_port_a),
    .in2(out_const_97));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_43668_43738 (.out1(out_ui_bit_and_expr_FU_64_0_64_150_i1_fu___float_adde11m52b_1023nih_43668_43738),
    .in1(in_port_b),
    .in2(out_const_97));
  ui_lt_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(63),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_43745 (.out1(out_ui_lt_expr_FU_64_64_64_201_i0_fu___float_adde11m52b_1023nih_43668_43745),
    .in1(out_ui_bit_and_expr_FU_64_0_64_150_i0_fu___float_adde11m52b_1023nih_43668_43731),
    .in2(out_ui_bit_and_expr_FU_64_0_64_150_i1_fu___float_adde11m52b_1023nih_43668_43738));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_43668_43750 (.out1(out_UIdata_converter_FU_2_i0_fu___float_adde11m52b_1023nih_43668_43750),
    .in1(out_ui_lt_expr_FU_64_64_64_201_i0_fu___float_adde11m52b_1023nih_43668_43745));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_43753 (.out1(out_lshift_expr_FU_64_0_64_141_i0_fu___float_adde11m52b_1023nih_43668_43753),
    .in1(out_UIdata_converter_FU_2_i0_fu___float_adde11m52b_1023nih_43668_43750),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_43756 (.out1(out_rshift_expr_FU_64_0_64_144_i0_fu___float_adde11m52b_1023nih_43668_43756),
    .in1(out_lshift_expr_FU_64_0_64_141_i0_fu___float_adde11m52b_1023nih_43668_43753),
    .in2(out_const_16));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_43668_43759 (.out1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_43668_43759),
    .in1(out_rshift_expr_FU_64_0_64_144_i0_fu___float_adde11m52b_1023nih_43668_43756));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_43668_43762 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i0_fu___float_adde11m52b_1023nih_43668_43762),
    .in1(in_port_a),
    .in2(in_port_b));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_43668_43765 (.out1(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_43668_43765),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i0_fu___float_adde11m52b_1023nih_43668_43762),
    .in2(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_43668_43759));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_43668_43768 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_43668_43768),
    .in1(in_port_a),
    .in2(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_43668_43765));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_43668_43773 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_43668_43773),
    .in1(in_port_b),
    .in2(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_43668_43765));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_43784 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_43668_43784),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_43668_43768),
    .in2(out_const_94));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_43787 (.out1(out_ui_rshift_expr_FU_64_0_64_207_i0_fu___float_adde11m52b_1023nih_43668_43787),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_43668_43768),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_43796 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_43668_43796),
    .in1(out_ui_rshift_expr_FU_64_0_64_207_i0_fu___float_adde11m52b_1023nih_43668_43787),
    .in2(out_const_89));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_43815 (.out1(out_lut_expr_FU_8_i0_fu___float_adde11m52b_1023nih_43668_43815),
    .in1(out_const_56),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_43668_47406),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_43668_47413),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_43668_43818 (.out1(out_UIdata_converter_FU_9_i0_fu___float_adde11m52b_1023nih_43668_43818),
    .in1(out_lut_expr_FU_8_i0_fu___float_adde11m52b_1023nih_43668_43815));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_43821 (.out1(out_lshift_expr_FU_64_0_64_141_i1_fu___float_adde11m52b_1023nih_43668_43821),
    .in1(out_UIdata_converter_FU_9_i0_fu___float_adde11m52b_1023nih_43668_43818),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_43824 (.out1(out_rshift_expr_FU_64_0_64_144_i1_fu___float_adde11m52b_1023nih_43668_43824),
    .in1(out_lshift_expr_FU_64_0_64_141_i1_fu___float_adde11m52b_1023nih_43668_43821),
    .in2(out_const_16));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_43668_43827 (.out1(out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_43668_43827),
    .in1(out_rshift_expr_FU_64_0_64_144_i1_fu___float_adde11m52b_1023nih_43668_43824));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_43841 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_43668_43841),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_43668_43773),
    .in2(out_const_94));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_43844 (.out1(out_ui_rshift_expr_FU_64_0_64_207_i1_fu___float_adde11m52b_1023nih_43668_43844),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_43668_43773),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_43847 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_43668_43847),
    .in1(out_ui_rshift_expr_FU_64_0_64_207_i1_fu___float_adde11m52b_1023nih_43668_43844),
    .in2(out_const_89));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_43855 (.out1(out_ui_ne_expr_FU_64_0_64_204_i0_fu___float_adde11m52b_1023nih_43668_43855),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_43668_43784),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_43860 (.out1(out_ui_ne_expr_FU_64_0_64_204_i1_fu___float_adde11m52b_1023nih_43668_43860),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_43668_43841),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_43871 (.out1(out_ui_ne_expr_FU_16_0_16_203_i0_fu___float_adde11m52b_1023nih_43668_43871),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_43668_43796),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_43879 (.out1(out_ui_ne_expr_FU_16_0_16_203_i1_fu___float_adde11m52b_1023nih_43668_43879),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_43668_43847),
    .in2(out_const_0));
  ui_minus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_43885 (.out1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_43668_43885),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_43668_43796),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_43668_43847));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_43918 (.out1(out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_43668_43918),
    .in1(out_ui_ne_expr_FU_16_0_16_203_i0_fu___float_adde11m52b_1023nih_43668_43871));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_43921 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i0_fu___float_adde11m52b_1023nih_43668_43921),
    .in1(out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_43668_43918),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_43668_43924 (.out1(out_ui_bit_ior_expr_FU_0_64_64_158_i0_fu___float_adde11m52b_1023nih_43668_43924),
    .in1(out_ui_lshift_expr_FU_64_0_64_182_i0_fu___float_adde11m52b_1023nih_43668_43921),
    .in2(out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_43668_43784));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_43927 (.out1(out_ui_lshift_expr_FU_64_0_64_183_i0_fu___float_adde11m52b_1023nih_43668_43927),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_158_i0_fu___float_adde11m52b_1023nih_43668_43924),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_43932 (.out1(out_UUdata_converter_FU_12_i0_fu___float_adde11m52b_1023nih_43668_43932),
    .in1(out_ui_ne_expr_FU_16_0_16_203_i1_fu___float_adde11m52b_1023nih_43668_43879));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_43935 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i1_fu___float_adde11m52b_1023nih_43668_43935),
    .in1(out_UUdata_converter_FU_12_i0_fu___float_adde11m52b_1023nih_43668_43932),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_43668_43938 (.out1(out_ui_bit_ior_expr_FU_0_64_64_159_i0_fu___float_adde11m52b_1023nih_43668_43938),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_43668_43841),
    .in2(out_ui_lshift_expr_FU_64_0_64_182_i1_fu___float_adde11m52b_1023nih_43668_43935));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_43941 (.out1(out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_43668_43941),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_159_i0_fu___float_adde11m52b_1023nih_43668_43938),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_43668_43948 (.out1(out_ui_bit_and_expr_FU_8_0_8_154_i0_fu___float_adde11m52b_1023nih_43668_43948),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_43668_43885),
    .in2(out_const_89));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44096 (.out1(out_lut_expr_FU_18_i0_fu___float_adde11m52b_1023nih_43668_44096),
    .in1(out_const_92),
    .in2(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde11m52b_1023nih_43668_47420),
    .in3(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde11m52b_1023nih_43668_47424),
    .in4(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde11m52b_1023nih_43668_47428),
    .in5(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_43668_47432),
    .in6(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_43668_47436),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_43668_44099 (.out1(out_UIdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_43668_44099),
    .in1(out_lut_expr_FU_18_i0_fu___float_adde11m52b_1023nih_43668_44096));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_44102 (.out1(out_lshift_expr_FU_32_0_32_139_i0_fu___float_adde11m52b_1023nih_43668_44102),
    .in1(out_UIdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_43668_44099),
    .in2(out_const_15));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_44105 (.out1(out_rshift_expr_FU_32_0_32_142_i0_fu___float_adde11m52b_1023nih_43668_44105),
    .in1(out_lshift_expr_FU_32_0_32_139_i0_fu___float_adde11m52b_1023nih_43668_44102),
    .in2(out_const_15));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_43668_44108 (.out1(out_IUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_43668_44108),
    .in1(out_rshift_expr_FU_32_0_32_142_i0_fu___float_adde11m52b_1023nih_43668_44105));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_43668_44111 (.out1(out_UUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_43668_44111),
    .in1(out_IUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_43668_44108));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_43668_44114 (.out1(out_ui_bit_ior_expr_FU_8_8_8_169_i0_fu___float_adde11m52b_1023nih_43668_44114),
    .in1(out_ui_bit_and_expr_FU_8_0_8_154_i0_fu___float_adde11m52b_1023nih_43668_43948),
    .in2(out_UUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_43668_44111));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_43668_44117 (.out1(out_ui_bit_and_expr_FU_8_0_8_155_i0_fu___float_adde11m52b_1023nih_43668_44117),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_169_i0_fu___float_adde11m52b_1023nih_43668_44114),
    .in2(out_const_85));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_43668_44120 (.out1(out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_43668_44120),
    .in1(out_ui_bit_and_expr_FU_8_0_8_155_i0_fu___float_adde11m52b_1023nih_43668_44117));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(6),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44123 (.out1(out_ui_rshift_expr_FU_64_64_64_216_i0_fu___float_adde11m52b_1023nih_43668_44123),
    .in1(out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_43668_43941),
    .in2(out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_43668_44120));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44165 (.out1(out_ui_lshift_expr_FU_0_64_64_181_i0_fu___float_adde11m52b_1023nih_43668_44165),
    .in1(out_const_98),
    .in2(out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_43668_44120));
  ui_bit_not_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_43668_44168 (.out1(out_ui_bit_not_expr_FU_64_64_170_i0_fu___float_adde11m52b_1023nih_43668_44168),
    .in1(out_ui_lshift_expr_FU_0_64_64_181_i0_fu___float_adde11m52b_1023nih_43668_44165));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_43668_44171 (.out1(out_ui_bit_and_expr_FU_64_64_64_153_i1_fu___float_adde11m52b_1023nih_43668_44171),
    .in1(out_ui_rshift_expr_FU_64_0_64_211_i0_fu___float_adde11m52b_1023nih_43668_45539),
    .in2(out_ui_rshift_expr_FU_64_0_64_212_i0_fu___float_adde11m52b_1023nih_43668_45543));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44176 (.out1(out_ui_ne_expr_FU_64_0_64_205_i0_fu___float_adde11m52b_1023nih_43668_44176),
    .in1(out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_43668_45550),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44181 (.out1(out_ui_eq_expr_FU_64_0_64_179_i0_fu___float_adde11m52b_1023nih_43668_44181),
    .in1(out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_43668_45550),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44184 (.out1(out_lut_expr_FU_23_i0_fu___float_adde11m52b_1023nih_43668_44184),
    .in1(out_const_59),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_17_reg_17),
    .in4(out_reg_3_reg_3),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(55),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_43668_44200 (.out1(out_ui_bit_and_expr_FU_0_64_64_145_i0_fu___float_adde11m52b_1023nih_43668_44200),
    .in1(out_const_95),
    .in2(out_ui_rshift_expr_FU_64_64_64_216_i0_fu___float_adde11m52b_1023nih_43668_44123));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_43668_44205 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i3_fu___float_adde11m52b_1023nih_43668_44205),
    .in1(out_reg_4_reg_4),
    .in2(out_reg_1_reg_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_43668_44219 (.out1(out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_43668_44219),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i3_fu___float_adde11m52b_1023nih_43668_44205),
    .in2(out_const_96));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(56),
    .OFFSET_PARAMETER(2)) fu___float_adde11m52b_1023nih_43668_44222 (.out1(out_ui_bit_ior_concat_expr_FU_157_i0_fu___float_adde11m52b_1023nih_43668_44222),
    .in1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde11m52b_1023nih_43668_45567),
    .in2(out_ui_bit_and_expr_FU_8_0_8_156_i0_fu___float_adde11m52b_1023nih_43668_45571),
    .in3(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44225 (.out1(out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_43668_44225),
    .in1(out_lut_expr_FU_23_i0_fu___float_adde11m52b_1023nih_43668_44184));
  ui_plus_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_43668_44228 (.out1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in1(out_ui_bit_ior_concat_expr_FU_157_i0_fu___float_adde11m52b_1023nih_43668_44222),
    .in2(out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_43668_44225));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_43668_44233 (.out1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_43668_44233),
    .in1(out_const_96),
    .in2(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44241 (.out1(out_ui_rshift_expr_FU_64_0_64_208_i0_fu___float_adde11m52b_1023nih_43668_44241),
    .in1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_43668_44233),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde11m52b_1023nih_43668_44244 (.out1(out_ui_bit_and_expr_FU_32_0_32_149_i0_fu___float_adde11m52b_1023nih_43668_44244),
    .in1(out_ui_rshift_expr_FU_64_0_64_208_i0_fu___float_adde11m52b_1023nih_43668_44241),
    .in2(out_const_93));
  ui_lshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44256 (.out1(out_ui_lshift_expr_FU_64_0_64_184_i0_fu___float_adde11m52b_1023nih_43668_44256),
    .in1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_43668_44233),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44265 (.out1(out_ui_rshift_expr_FU_64_0_64_209_i0_fu___float_adde11m52b_1023nih_43668_44265),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_43668_45832),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu___float_adde11m52b_1023nih_43668_44268 (.out1(out_ui_bit_and_expr_FU_16_0_16_148_i0_fu___float_adde11m52b_1023nih_43668_44268),
    .in1(out_ui_rshift_expr_FU_64_0_64_209_i0_fu___float_adde11m52b_1023nih_43668_44265),
    .in2(out_const_90));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44280 (.out1(out_ui_lshift_expr_FU_64_0_64_185_i0_fu___float_adde11m52b_1023nih_43668_44280),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_43668_45832),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44306 (.out1(out_ui_lshift_expr_FU_64_0_64_186_i0_fu___float_adde11m52b_1023nih_43668_44306),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_43668_45826),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44334 (.out1(out_ui_lshift_expr_FU_64_0_64_187_i0_fu___float_adde11m52b_1023nih_43668_44334),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_43668_45818),
    .in2(out_const_3));
  bit_and_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_in2(7),
    .BITSIZE_out1(7)) fu___float_adde11m52b_1023nih_43668_44346 (.out1(out_bit_and_expr_FU_0_8_8_138_i0_fu___float_adde11m52b_1023nih_43668_44346),
    .in1(out_const_13),
    .in2(out_const_16));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44349 (.out1(out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_43668_44349),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_43668_45808),
    .in2(out_reg_5_reg_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44362 (.out1(out_ui_lshift_expr_FU_64_0_64_188_i0_fu___float_adde11m52b_1023nih_43668_44362),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_43668_45804),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44369 (.out1(out_ui_lshift_expr_FU_64_0_64_189_i0_fu___float_adde11m52b_1023nih_43668_44369),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_43668_45808),
    .in2(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44403 (.out1(out_IUdata_converter_FU_105_i0_fu___float_adde11m52b_1023nih_43668_44403),
    .in1(out_rshift_expr_FU_32_0_32_143_i4_fu___float_adde11m52b_1023nih_43668_45920));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44406 (.out1(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde11m52b_1023nih_43668_44406),
    .in1(out_IUdata_converter_FU_105_i0_fu___float_adde11m52b_1023nih_43668_44403),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44424 (.out1(out_IUdata_converter_FU_106_i0_fu___float_adde11m52b_1023nih_43668_44424),
    .in1(out_rshift_expr_FU_32_0_32_143_i3_fu___float_adde11m52b_1023nih_43668_45911));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44427 (.out1(out_ui_lshift_expr_FU_8_0_8_197_i0_fu___float_adde11m52b_1023nih_43668_44427),
    .in1(out_IUdata_converter_FU_106_i0_fu___float_adde11m52b_1023nih_43668_44424),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___float_adde11m52b_1023nih_43668_44430 (.out1(out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu___float_adde11m52b_1023nih_43668_44430),
    .in1(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde11m52b_1023nih_43668_44406),
    .in2(out_ui_lshift_expr_FU_8_0_8_197_i0_fu___float_adde11m52b_1023nih_43668_44427));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44444 (.out1(out_IUdata_converter_FU_107_i0_fu___float_adde11m52b_1023nih_43668_44444),
    .in1(out_rshift_expr_FU_32_0_32_143_i2_fu___float_adde11m52b_1023nih_43668_45902));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44447 (.out1(out_ui_lshift_expr_FU_8_0_8_198_i0_fu___float_adde11m52b_1023nih_43668_44447),
    .in1(out_IUdata_converter_FU_107_i0_fu___float_adde11m52b_1023nih_43668_44444),
    .in2(out_const_9));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44464 (.out1(out_IUdata_converter_FU_108_i0_fu___float_adde11m52b_1023nih_43668_44464),
    .in1(out_rshift_expr_FU_32_0_32_143_i1_fu___float_adde11m52b_1023nih_43668_45893));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44467 (.out1(out_ui_lshift_expr_FU_8_0_8_199_i0_fu___float_adde11m52b_1023nih_43668_44467),
    .in1(out_IUdata_converter_FU_108_i0_fu___float_adde11m52b_1023nih_43668_44464),
    .in2(out_const_3));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde11m52b_1023nih_43668_44470 (.out1(out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu___float_adde11m52b_1023nih_43668_44470),
    .in1(out_ui_lshift_expr_FU_8_0_8_198_i0_fu___float_adde11m52b_1023nih_43668_44447),
    .in2(out_ui_lshift_expr_FU_8_0_8_199_i0_fu___float_adde11m52b_1023nih_43668_44467));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde11m52b_1023nih_43668_44473 (.out1(out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu___float_adde11m52b_1023nih_43668_44473),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu___float_adde11m52b_1023nih_43668_44430),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu___float_adde11m52b_1023nih_43668_44470));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44487 (.out1(out_IUdata_converter_FU_109_i0_fu___float_adde11m52b_1023nih_43668_44487),
    .in1(out_rshift_expr_FU_32_0_32_143_i0_fu___float_adde11m52b_1023nih_43668_45884));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(6),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44490 (.out1(out_ui_lshift_expr_FU_8_0_8_200_i0_fu___float_adde11m52b_1023nih_43668_44490),
    .in1(out_IUdata_converter_FU_109_i0_fu___float_adde11m52b_1023nih_43668_44487),
    .in2(out_const_7));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(5),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_43668_44493 (.out1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde11m52b_1023nih_43668_44493),
    .in1(out_ui_lshift_expr_FU_8_0_8_200_i0_fu___float_adde11m52b_1023nih_43668_44490),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu___float_adde11m52b_1023nih_43668_44473));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(1),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_43668_44496 (.out1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_43668_44496),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde11m52b_1023nih_43668_44493),
    .in2(out_ui_rshift_expr_FU_64_0_64_213_i0_fu___float_adde11m52b_1023nih_43668_45929));
  ui_gt_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44502 (.out1(out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_43668_44502),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_43668_44496),
    .in2(out_reg_0_reg_0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44577 (.out1(out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_43668_44577),
    .in1(out_const_53),
    .in2(out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_43668_44502),
    .in3(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_43668_49565),
    .in4(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_43668_49569),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44647 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i2_fu___float_adde11m52b_1023nih_43668_44647),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i2_fu___float_adde11m52b_1023nih_43668_44650),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_44650 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i2_fu___float_adde11m52b_1023nih_43668_44650),
    .in1(out_ui_ternary_pm_expr_FU_16_0_16_16_217_i0_fu___float_adde11m52b_1023nih_43668_44653),
    .in2(out_const_89));
  ui_ternary_pm_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_in3(6),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_44653 (.out1(out_ui_ternary_pm_expr_FU_16_0_16_16_217_i0_fu___float_adde11m52b_1023nih_43668_44653),
    .in1(out_reg_13_reg_13),
    .in2(out_const_17),
    .in3(out_ASSIGN_UNSIGNED_FU_110_i0_fu___float_adde11m52b_1023nih_43668_46946));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(3),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44660 (.out1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde11m52b_1023nih_43668_44660),
    .in1(out_ui_lshift_expr_FU_64_0_64_192_i1_fu___float_adde11m52b_1023nih_43668_48341),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_44663 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i2_fu___float_adde11m52b_1023nih_43668_44663),
    .in1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde11m52b_1023nih_43668_44660),
    .in2(out_const_94));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_43668_44668 (.out1(out_ui_bit_ior_expr_FU_0_64_64_160_i0_fu___float_adde11m52b_1023nih_43668_44668),
    .in1(out_reg_72_reg_72),
    .in2(out_ui_lshift_expr_FU_64_0_64_194_i0_fu___float_adde11m52b_1023nih_43668_45937));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44702 (.out1(out_UUdata_converter_FU_123_i0_fu___float_adde11m52b_1023nih_43668_44702),
    .in1(out_lut_expr_FU_122_i0_fu___float_adde11m52b_1023nih_43668_47092));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_43668_44705 (.out1(out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_43668_44705),
    .in1(out_reg_73_reg_73),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_160_i0_fu___float_adde11m52b_1023nih_43668_44668));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44714 (.out1(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_43668_44714),
    .in1(out_const_89),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_43668_43796));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_44719 (.out1(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_43668_44719),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_43668_43847),
    .in2(out_const_89));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44729 (.out1(out_ui_rshift_expr_FU_64_0_64_207_i2_fu___float_adde11m52b_1023nih_43668_44729),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_43668_44705),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_44732 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_43668_44732),
    .in1(out_ui_rshift_expr_FU_64_0_64_207_i2_fu___float_adde11m52b_1023nih_43668_44729),
    .in2(out_const_89));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_44737 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_43668_44737),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_43668_44705),
    .in2(out_const_94));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44835 (.out1(out_ui_lshift_expr_FU_64_0_64_190_i0_fu___float_adde11m52b_1023nih_43668_44835),
    .in1(out_UUdata_converter_FU_136_i0_fu___float_adde11m52b_1023nih_43668_46936),
    .in2(out_const_11));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_44838 (.out1(out_ui_bit_ior_expr_FU_64_64_64_168_i0_fu___float_adde11m52b_1023nih_43668_44838),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i10_fu___float_adde11m52b_1023nih_43668_46940));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_44863 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i3_fu___float_adde11m52b_1023nih_43668_44863),
    .in1(out_ui_cond_expr_FU_16_16_16_16_172_i5_fu___float_adde11m52b_1023nih_43668_46938),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_43668_44866 (.out1(out_ui_bit_ior_expr_FU_0_64_64_161_i0_fu___float_adde11m52b_1023nih_43668_44866),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_168_i0_fu___float_adde11m52b_1023nih_43668_44838),
    .in2(out_reg_74_reg_74));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_43668_44869 (.out1(out_ui_bit_ior_expr_FU_0_64_64_162_i0_fu___float_adde11m52b_1023nih_43668_44869),
    .in1(out_ui_lshift_expr_FU_64_0_64_182_i3_fu___float_adde11m52b_1023nih_43668_44863),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_161_i0_fu___float_adde11m52b_1023nih_43668_44866));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45025 (.out1(out_ui_eq_expr_FU_32_0_32_178_i0_fu___float_adde11m52b_1023nih_43668_45025),
    .in1(out_ui_bit_and_expr_FU_32_0_32_149_i0_fu___float_adde11m52b_1023nih_43668_44244),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45029 (.out1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in1(out_ui_bit_and_expr_FU_16_0_16_148_i0_fu___float_adde11m52b_1023nih_43668_44268),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45033 (.out1(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in1(out_const_23),
    .in2(out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_43668_49500),
    .in3(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_43668_49503),
    .in4(out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_43668_49506),
    .in5(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_43668_49509),
    .in6(out_lut_expr_FU_67_i0_fu___float_adde11m52b_1023nih_43668_49525),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(57),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45037 (.out1(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037),
    .in1(out_const_26),
    .in2(out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_43668_49500),
    .in3(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_43668_49503),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in5(out_lut_expr_FU_82_i0_fu___float_adde11m52b_1023nih_43668_49530),
    .in6(out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_43668_49533),
    .in7(out_lut_expr_FU_86_i0_fu___float_adde11m52b_1023nih_43668_49543),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45041 (.out1(out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_43668_45041),
    .in1(out_const_17),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_43668_47273),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_43668_47277),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45065 (.out1(out_ui_eq_expr_FU_16_0_16_177_i0_fu___float_adde11m52b_1023nih_43668_45065),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_43668_43796),
    .in2(out_const_88));
  lut_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45095 (.out1(out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_43668_45095),
    .in1(out_const_82),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_43668_47273),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_43668_47277),
    .in4(out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_43668_49553),
    .in5(out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_43668_49559),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45539 (.out1(out_ui_rshift_expr_FU_64_0_64_211_i0_fu___float_adde11m52b_1023nih_43668_45539),
    .in1(out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_43668_43941),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45543 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i0_fu___float_adde11m52b_1023nih_43668_45543),
    .in1(out_ui_bit_not_expr_FU_64_64_170_i0_fu___float_adde11m52b_1023nih_43668_44168),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45547 (.out1(out_ui_lshift_expr_FU_64_0_64_191_i0_fu___float_adde11m52b_1023nih_43668_45547),
    .in1(out_ui_bit_and_expr_FU_64_64_64_153_i1_fu___float_adde11m52b_1023nih_43668_44171),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45550 (.out1(out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_43668_45550),
    .in1(out_ui_lshift_expr_FU_64_0_64_191_i0_fu___float_adde11m52b_1023nih_43668_45547),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45558 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i1_fu___float_adde11m52b_1023nih_43668_45558),
    .in1(out_ui_lshift_expr_FU_64_0_64_183_i0_fu___float_adde11m52b_1023nih_43668_43927),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45561 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i2_fu___float_adde11m52b_1023nih_43668_45561),
    .in1(out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_43668_44219),
    .in2(out_const_18));
  ui_plus_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(54),
    .BITSIZE_out1(54)) fu___float_adde11m52b_1023nih_43668_45564 (.out1(out_ui_plus_expr_FU_64_64_64_206_i2_fu___float_adde11m52b_1023nih_43668_45564),
    .in1(out_reg_10_reg_10),
    .in2(out_ui_rshift_expr_FU_64_0_64_212_i2_fu___float_adde11m52b_1023nih_43668_45561));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(56),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45567 (.out1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde11m52b_1023nih_43668_45567),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i2_fu___float_adde11m52b_1023nih_43668_45564),
    .in2(out_const_18));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_43668_45571 (.out1(out_ui_bit_and_expr_FU_8_0_8_156_i0_fu___float_adde11m52b_1023nih_43668_45571),
    .in1(out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_43668_44219),
    .in2(out_const_55));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45756 (.out1(out_lut_expr_FU_126_i0_fu___float_adde11m52b_1023nih_43668_45756),
    .in1(out_const_56),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_6_reg_6),
    .in5(out_reg_7_reg_7),
    .in6(out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_43668_49605),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45778 (.out1(out_lut_expr_FU_128_i0_fu___float_adde11m52b_1023nih_43668_45778),
    .in1(out_const_35),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_77_reg_77),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_45786 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i0_fu___float_adde11m52b_1023nih_43668_45786),
    .in1(out_reg_71_reg_71),
    .in2(out_const_0),
    .in3(out_reg_76_reg_76));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_45790 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i0_fu___float_adde11m52b_1023nih_43668_45790),
    .in1(out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_43668_45095),
    .in2(out_ui_rshift_expr_FU_64_0_64_215_i0_fu___float_adde11m52b_1023nih_43668_48683),
    .in3(out_ui_rshift_expr_FU_64_0_64_215_i1_fu___float_adde11m52b_1023nih_43668_48686));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(55),
    .BITSIZE_in3(64),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_43668_45804 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_43668_45804),
    .in1(out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_43668_45041),
    .in2(out_ui_lshift_expr_FU_64_0_64_189_i0_fu___float_adde11m52b_1023nih_43668_44369),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_43668_45808));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_43668_45808 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_43668_45808),
    .in1(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037),
    .in2(out_ui_lshift_expr_FU_64_0_64_187_i0_fu___float_adde11m52b_1023nih_43668_44334),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_43668_45818));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_43668_45818 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_43668_45818),
    .in1(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in2(out_ui_lshift_expr_FU_64_0_64_186_i0_fu___float_adde11m52b_1023nih_43668_44306),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_43668_45826));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_43668_45826 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_43668_45826),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in2(out_ui_lshift_expr_FU_64_0_64_185_i0_fu___float_adde11m52b_1023nih_43668_44280),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_43668_45832));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(56),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_43668_45832 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_43668_45832),
    .in1(out_reg_20_reg_20),
    .in2(out_reg_19_reg_19),
    .in3(out_reg_18_reg_18));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45837 (.out1(out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_43668_45837),
    .in1(out_const_56),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_77_reg_77),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_45840 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i1_fu___float_adde11m52b_1023nih_43668_45840),
    .in1(out_reg_75_reg_75),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_43668_44732),
    .in3(out_const_89));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_45848 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i2_fu___float_adde11m52b_1023nih_43668_45848),
    .in1(out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_43668_45837),
    .in2(out_ui_cond_expr_FU_16_16_16_16_172_i1_fu___float_adde11m52b_1023nih_43668_45840),
    .in3(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_43668_44732));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_45850 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i6_fu___float_adde11m52b_1023nih_43668_45850),
    .in1(out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_43668_45837),
    .in2(out_const_0),
    .in3(out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_43668_44737));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45853 (.out1(out_lut_expr_FU_131_i0_fu___float_adde11m52b_1023nih_43668_45853),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_43668_47406),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_43668_47409),
    .in4(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_43668_44714),
    .in5(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_43668_44719),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(1),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_45859 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i7_fu___float_adde11m52b_1023nih_43668_45859),
    .in1(out_lut_expr_FU_128_i0_fu___float_adde11m52b_1023nih_43668_45778),
    .in2(out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_43668_44737),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_45866 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_43668_45866),
    .in1(out_reg_14_reg_14),
    .in2(out_ui_cond_expr_FU_16_16_16_16_172_i2_fu___float_adde11m52b_1023nih_43668_45848),
    .in3(out_const_89));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(1),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_45868 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_43668_45868),
    .in1(out_reg_14_reg_14),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i6_fu___float_adde11m52b_1023nih_43668_45850),
    .in3(out_const_0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_43668_45877 (.out1(out_UIdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_43668_45877),
    .in1(out_reg_20_reg_20));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_45881 (.out1(out_lshift_expr_FU_32_0_32_140_i0_fu___float_adde11m52b_1023nih_43668_45881),
    .in1(out_UIdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_43668_45877),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_45884 (.out1(out_rshift_expr_FU_32_0_32_143_i0_fu___float_adde11m52b_1023nih_43668_45884),
    .in1(out_lshift_expr_FU_32_0_32_140_i0_fu___float_adde11m52b_1023nih_43668_45881),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_43668_45887 (.out1(out_UIdata_converter_FU_26_i0_fu___float_adde11m52b_1023nih_43668_45887),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_45890 (.out1(out_lshift_expr_FU_32_0_32_140_i1_fu___float_adde11m52b_1023nih_43668_45890),
    .in1(out_UIdata_converter_FU_26_i0_fu___float_adde11m52b_1023nih_43668_45887),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_45893 (.out1(out_rshift_expr_FU_32_0_32_143_i1_fu___float_adde11m52b_1023nih_43668_45893),
    .in1(out_lshift_expr_FU_32_0_32_140_i1_fu___float_adde11m52b_1023nih_43668_45890),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_43668_45896 (.out1(out_UIdata_converter_FU_69_i0_fu___float_adde11m52b_1023nih_43668_45896),
    .in1(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_45899 (.out1(out_lshift_expr_FU_32_0_32_140_i2_fu___float_adde11m52b_1023nih_43668_45899),
    .in1(out_UIdata_converter_FU_69_i0_fu___float_adde11m52b_1023nih_43668_45896),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_45902 (.out1(out_rshift_expr_FU_32_0_32_143_i2_fu___float_adde11m52b_1023nih_43668_45902),
    .in1(out_lshift_expr_FU_32_0_32_140_i2_fu___float_adde11m52b_1023nih_43668_45899),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_43668_45905 (.out1(out_UIdata_converter_FU_88_i0_fu___float_adde11m52b_1023nih_43668_45905),
    .in1(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_45908 (.out1(out_lshift_expr_FU_32_0_32_140_i3_fu___float_adde11m52b_1023nih_43668_45908),
    .in1(out_UIdata_converter_FU_88_i0_fu___float_adde11m52b_1023nih_43668_45905),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_45911 (.out1(out_rshift_expr_FU_32_0_32_143_i3_fu___float_adde11m52b_1023nih_43668_45911),
    .in1(out_lshift_expr_FU_32_0_32_140_i3_fu___float_adde11m52b_1023nih_43668_45908),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_43668_45914 (.out1(out_UIdata_converter_FU_92_i0_fu___float_adde11m52b_1023nih_43668_45914),
    .in1(out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_43668_45041));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_45917 (.out1(out_lshift_expr_FU_32_0_32_140_i4_fu___float_adde11m52b_1023nih_43668_45917),
    .in1(out_UIdata_converter_FU_92_i0_fu___float_adde11m52b_1023nih_43668_45914),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_43668_45920 (.out1(out_rshift_expr_FU_32_0_32_143_i4_fu___float_adde11m52b_1023nih_43668_45920),
    .in1(out_lshift_expr_FU_32_0_32_140_i4_fu___float_adde11m52b_1023nih_43668_45917),
    .in2(out_const_14));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45923 (.out1(out_UUdata_converter_FU_104_i0_fu___float_adde11m52b_1023nih_43668_45923),
    .in1(out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_43668_45095));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45926 (.out1(out_ui_lshift_expr_FU_64_0_64_193_i0_fu___float_adde11m52b_1023nih_43668_45926),
    .in1(out_UUdata_converter_FU_104_i0_fu___float_adde11m52b_1023nih_43668_45923),
    .in2(out_const_85));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45929 (.out1(out_ui_rshift_expr_FU_64_0_64_213_i0_fu___float_adde11m52b_1023nih_43668_45929),
    .in1(out_ui_lshift_expr_FU_64_0_64_193_i0_fu___float_adde11m52b_1023nih_43668_45926),
    .in2(out_const_85));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(6),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45933 (.out1(out_ui_rshift_expr_FU_64_0_64_214_i0_fu___float_adde11m52b_1023nih_43668_45933),
    .in1(out_ui_lshift_expr_FU_64_0_64_182_i2_fu___float_adde11m52b_1023nih_43668_44647),
    .in2(out_const_66));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(6),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_45937 (.out1(out_ui_lshift_expr_FU_64_0_64_194_i0_fu___float_adde11m52b_1023nih_43668_45937),
    .in1(out_ui_cond_expr_FU_16_16_16_16_172_i0_fu___float_adde11m52b_1023nih_43668_45786),
    .in2(out_const_66));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_45951 (.out1(out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_43668_45951),
    .in1(out_const_78),
    .in2(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_43668_44714),
    .in3(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_43668_44719),
    .in4(out_ui_ne_expr_FU_64_0_64_204_i1_fu___float_adde11m52b_1023nih_43668_43860),
    .in5(out_ui_ne_expr_FU_64_0_64_204_i0_fu___float_adde11m52b_1023nih_43668_43855),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_45953 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i4_fu___float_adde11m52b_1023nih_43668_45953),
    .in1(out_reg_11_reg_11),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_43668_44732),
    .in3(out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_43668_45866));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_45955 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i9_fu___float_adde11m52b_1023nih_43668_45955),
    .in1(out_reg_11_reg_11),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i7_fu___float_adde11m52b_1023nih_43668_45859),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_43668_45868));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_46936 (.out1(out_UUdata_converter_FU_136_i0_fu___float_adde11m52b_1023nih_43668_46936),
    .in1(out_lut_expr_FU_135_i0_fu___float_adde11m52b_1023nih_43668_47173));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_46938 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i5_fu___float_adde11m52b_1023nih_43668_46938),
    .in1(out_reg_12_reg_12),
    .in2(out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_43668_45866),
    .in3(out_ui_cond_expr_FU_16_16_16_16_172_i4_fu___float_adde11m52b_1023nih_43668_45953));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_43668_46940 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i10_fu___float_adde11m52b_1023nih_43668_46940),
    .in1(out_reg_12_reg_12),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_43668_45868),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i9_fu___float_adde11m52b_1023nih_43668_45955));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_46942 (.out1(out_UUdata_converter_FU_134_i0_fu___float_adde11m52b_1023nih_43668_46942),
    .in1(out_lut_expr_FU_133_i0_fu___float_adde11m52b_1023nih_43668_47166));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_43668_46944 (.out1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_43668_46944),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_43668_43796));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_43668_46946 (.out1(out_ASSIGN_UNSIGNED_FU_110_i0_fu___float_adde11m52b_1023nih_43668_46946),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_43668_44496));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_46956 (.out1(out_ui_lshift_expr_FU_64_0_64_193_i1_fu___float_adde11m52b_1023nih_43668_46956),
    .in1(out_UUdata_converter_FU_134_i0_fu___float_adde11m52b_1023nih_43668_46942),
    .in2(out_const_85));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_47092 (.out1(out_lut_expr_FU_122_i0_fu___float_adde11m52b_1023nih_43668_47092),
    .in1(out_const_81),
    .in2(out_reg_2_reg_2),
    .in3(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_43668_49565),
    .in4(out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_43668_49580),
    .in5(out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_43668_49586),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_43668_49589),
    .in7(out_lut_expr_FU_121_i0_fu___float_adde11m52b_1023nih_43668_49595),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_47166 (.out1(out_lut_expr_FU_133_i0_fu___float_adde11m52b_1023nih_43668_47166),
    .in1(out_const_64),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_17_reg_17),
    .in5(out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_43668_49601),
    .in6(out_reg_11_reg_11),
    .in7(out_reg_12_reg_12),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_47173 (.out1(out_lut_expr_FU_135_i0_fu___float_adde11m52b_1023nih_43668_47173),
    .in1(out_const_91),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_43668_47406),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_43668_47413),
    .in4(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_43668_44714),
    .in5(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_43668_44719),
    .in6(out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_43668_45951),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_47177 (.out1(out_lut_expr_FU_130_i0_fu___float_adde11m52b_1023nih_43668_47177),
    .in1(out_const_56),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_43668_47406),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_43668_47409),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_43668_47273 (.out1(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_43668_47273),
    .in1(out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_43668_44349),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_43668_47277 (.out1(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_43668_47277),
    .in1(out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_43668_44349),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_47406 (.out1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_43668_47406),
    .in1(in_port_a),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_47409 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_43668_47409),
    .in1(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_43668_43765),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_47413 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_43668_47413),
    .in1(in_port_b),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_43668_47420 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde11m52b_1023nih_43668_47420),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_43668_43885),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_43668_47424 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde11m52b_1023nih_43668_47424),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_43668_43885),
    .in2(out_const_71));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_43668_47428 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde11m52b_1023nih_43668_47428),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_43668_43885),
    .in2(out_const_20));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_43668_47432 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_43668_47432),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_43668_43885),
    .in2(out_const_32));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_43668_47436 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_43668_47436),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_43668_43885),
    .in2(out_const_41));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48117 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu___float_adde11m52b_1023nih_43668_48117),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_58));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48133 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_43668_48133),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_60));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48149 (.out1(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde11m52b_1023nih_43668_48149),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_62));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48165 (.out1(out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_43668_48165),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48181 (.out1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_43668_48181),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_66));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48197 (.out1(out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_43668_48197),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_67));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48213 (.out1(out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_43668_48213),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48229 (.out1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_43668_48229),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_70));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_48334 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i3_fu___float_adde11m52b_1023nih_43668_48334),
    .in1(out_ui_lshift_expr_FU_64_0_64_188_i0_fu___float_adde11m52b_1023nih_43668_44362),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_48337 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i4_fu___float_adde11m52b_1023nih_43668_48337),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_43668_45804),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_48341 (.out1(out_ui_lshift_expr_FU_64_0_64_192_i1_fu___float_adde11m52b_1023nih_43668_48341),
    .in1(out_ui_lshift_expr_FU_64_0_64_195_i0_fu___float_adde11m52b_1023nih_43668_48690),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48436 (.out1(out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_43668_48436),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_48440 (.out1(out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_43668_48440),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48448 (.out1(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde11m52b_1023nih_43668_48448),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_27));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_48452 (.out1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_43668_48452),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_28));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48460 (.out1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_43668_48460),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_29));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_48464 (.out1(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde11m52b_1023nih_43668_48464),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48472 (.out1(out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_43668_48472),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_48476 (.out1(out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_43668_48476),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_37));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48484 (.out1(out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_43668_48484),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_48488 (.out1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_43668_48488),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48496 (.out1(out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_43668_48496),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_48500 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_43668_48500),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48508 (.out1(out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_43668_48508),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_48512 (.out1(out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_43668_48512),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_48));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48520 (.out1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_43668_48520),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_39));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_48524 (.out1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_43668_48524),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_51));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_48683 (.out1(out_ui_rshift_expr_FU_64_0_64_215_i0_fu___float_adde11m52b_1023nih_43668_48683),
    .in1(out_ui_rshift_expr_FU_64_0_64_212_i3_fu___float_adde11m52b_1023nih_43668_48334),
    .in2(out_const_17));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_48686 (.out1(out_ui_rshift_expr_FU_64_0_64_215_i1_fu___float_adde11m52b_1023nih_43668_48686),
    .in1(out_ui_rshift_expr_FU_64_0_64_212_i4_fu___float_adde11m52b_1023nih_43668_48337),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_43668_48690 (.out1(out_ui_lshift_expr_FU_64_0_64_195_i0_fu___float_adde11m52b_1023nih_43668_48690),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i0_fu___float_adde11m52b_1023nih_43668_45790),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_43668_48783 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_43668_48783),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_43668_48787 (.out1(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde11m52b_1023nih_43668_48787),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_43668_48791 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_43668_48791),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_43668_48795 (.out1(out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_43668_48795),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_55));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_43668_48799 (.out1(out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_43668_48799),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_43668_48803 (.out1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_43668_48803),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_40));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_43668_48807 (.out1(out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_43668_48807),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_43668_48811 (.out1(out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_43668_48811),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_71));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48826 (.out1(out_ui_extract_bit_expr_FU_72_i0_fu___float_adde11m52b_1023nih_43668_48826),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_49));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48853 (.out1(out_ui_extract_bit_expr_FU_75_i0_fu___float_adde11m52b_1023nih_43668_48853),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48880 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde11m52b_1023nih_43668_48880),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_52));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_48908 (.out1(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde11m52b_1023nih_43668_48908),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_54));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_49084 (.out1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_43668_49084),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_73));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_43668_49088 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde11m52b_1023nih_43668_49088),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_49096 (.out1(out_ui_extract_bit_expr_FU_73_i0_fu___float_adde11m52b_1023nih_43668_49096),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_77));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_43668_49100 (.out1(out_ui_extract_bit_expr_FU_74_i0_fu___float_adde11m52b_1023nih_43668_49100),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_49108 (.out1(out_ui_extract_bit_expr_FU_76_i0_fu___float_adde11m52b_1023nih_43668_49108),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_80));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_43668_49112 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde11m52b_1023nih_43668_49112),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_72));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_49120 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde11m52b_1023nih_43668_49120),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_84));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_43668_49124 (.out1(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde11m52b_1023nih_43668_49124),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_79));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_49370 (.out1(out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_43668_49370),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_43668_49440 (.out1(out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_43668_49440),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_49468 (.out1(out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_43668_49468),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_68));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_43668_49472 (.out1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_43668_49472),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_43668_49484 (.out1(out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_43668_49484),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_43668_49488 (.out1(out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_43668_49488),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_43668_44228),
    .in2(out_const_32));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49500 (.out1(out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_43668_49500),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_49_reg_49),
    .in5(out_reg_37_reg_37),
    .in6(out_reg_38_reg_38),
    .in7(out_reg_25_reg_25),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49503 (.out1(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_43668_49503),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_50_reg_50),
    .in5(out_reg_39_reg_39),
    .in6(out_reg_40_reg_40),
    .in7(out_reg_26_reg_26),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49506 (.out1(out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_43668_49506),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_51_reg_51),
    .in5(out_reg_41_reg_41),
    .in6(out_reg_42_reg_42),
    .in7(out_reg_27_reg_27),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49509 (.out1(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_43668_49509),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_52_reg_52),
    .in5(out_reg_43_reg_43),
    .in6(out_reg_44_reg_44),
    .in7(out_reg_28_reg_28),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49513 (.out1(out_lut_expr_FU_63_i0_fu___float_adde11m52b_1023nih_43668_49513),
    .in1(out_const_46),
    .in2(out_reg_45_reg_45),
    .in3(out_reg_29_reg_29),
    .in4(out_reg_20_reg_20),
    .in5(out_reg_30_reg_30),
    .in6(out_reg_21_reg_21),
    .in7(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49516 (.out1(out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_43668_49516),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_46_reg_46),
    .in5(out_reg_31_reg_31),
    .in6(out_reg_32_reg_32),
    .in7(out_reg_22_reg_22),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49519 (.out1(out_lut_expr_FU_65_i0_fu___float_adde11m52b_1023nih_43668_49519),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_47_reg_47),
    .in5(out_reg_33_reg_33),
    .in6(out_reg_34_reg_34),
    .in7(out_reg_23_reg_23),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49522 (.out1(out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_43668_49522),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_48_reg_48),
    .in5(out_reg_35_reg_35),
    .in6(out_reg_36_reg_36),
    .in7(out_reg_24_reg_24),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49525 (.out1(out_lut_expr_FU_67_i0_fu___float_adde11m52b_1023nih_43668_49525),
    .in1(out_const_17),
    .in2(out_lut_expr_FU_63_i0_fu___float_adde11m52b_1023nih_43668_49513),
    .in3(out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_43668_49516),
    .in4(out_lut_expr_FU_65_i0_fu___float_adde11m52b_1023nih_43668_49519),
    .in5(out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_43668_49522),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49530 (.out1(out_lut_expr_FU_82_i0_fu___float_adde11m52b_1023nih_43668_49530),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_57_reg_57),
    .in5(out_reg_58_reg_58),
    .in6(out_reg_53_reg_53),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49533 (.out1(out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_43668_49533),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_59_reg_59),
    .in5(out_reg_60_reg_60),
    .in6(out_reg_54_reg_54),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49536 (.out1(out_lut_expr_FU_84_i0_fu___float_adde11m52b_1023nih_43668_49536),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_61_reg_61),
    .in5(out_reg_62_reg_62),
    .in6(out_reg_55_reg_55),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49539 (.out1(out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_43668_49539),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_63_reg_63),
    .in5(out_reg_64_reg_64),
    .in6(out_reg_56_reg_56),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49543 (.out1(out_lut_expr_FU_86_i0_fu___float_adde11m52b_1023nih_43668_49543),
    .in1(out_const_25),
    .in2(out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_43668_49506),
    .in3(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_43668_49509),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in5(out_lut_expr_FU_84_i0_fu___float_adde11m52b_1023nih_43668_49536),
    .in6(out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_43668_49539),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49549 (.out1(out_lut_expr_FU_99_i0_fu___float_adde11m52b_1023nih_43668_49549),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_69_reg_69),
    .in5(out_reg_70_reg_70),
    .in6(out_reg_66_reg_66),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49553 (.out1(out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_43668_49553),
    .in1(out_const_86),
    .in2(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_43668_49503),
    .in3(out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_43668_49516),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in5(out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_43668_49533),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037),
    .in7(out_lut_expr_FU_99_i0_fu___float_adde11m52b_1023nih_43668_49549),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49556 (.out1(out_lut_expr_FU_101_i0_fu___float_adde11m52b_1023nih_43668_49556),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_67_reg_67),
    .in5(out_reg_68_reg_68),
    .in6(out_reg_65_reg_65),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49559 (.out1(out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_43668_49559),
    .in1(out_const_86),
    .in2(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_43668_49509),
    .in3(out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_43668_49522),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in5(out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_43668_49539),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037),
    .in7(out_lut_expr_FU_101_i0_fu___float_adde11m52b_1023nih_43668_49556),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49565 (.out1(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_43668_49565),
    .in1(out_const_87),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_43668_47273),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_43668_47277),
    .in4(out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_43668_49553),
    .in5(out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_43668_49559),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49569 (.out1(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_43668_49569),
    .in1(out_const_24),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_43668_47273),
    .in5(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_43668_47277),
    .in6(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in7(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49574 (.out1(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_43668_49574),
    .in1(out_const_18),
    .in2(out_reg_45_reg_45),
    .in3(out_reg_20_reg_20),
    .in4(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49577 (.out1(out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_43668_49577),
    .in1(out_const_21),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_47_reg_47),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49580 (.out1(out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_43668_49580),
    .in1(out_const_87),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_43668_47273),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_43668_47277),
    .in4(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_43668_49574),
    .in5(out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_43668_49577),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49583 (.out1(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_43668_49583),
    .in1(out_const_21),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_46_reg_46),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49586 (.out1(out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_43668_49586),
    .in1(out_const_75),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_43668_47273),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_43668_47277),
    .in4(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_43668_49583),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49589 (.out1(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_43668_49589),
    .in1(out_const_75),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_43668_47273),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_43668_47277),
    .in4(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_43668_49574),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49592 (.out1(out_lut_expr_FU_120_i0_fu___float_adde11m52b_1023nih_43668_49592),
    .in1(out_const_21),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_43668_45029),
    .in4(out_reg_48_reg_48),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_43668_45033),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_43668_45037),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49595 (.out1(out_lut_expr_FU_121_i0_fu___float_adde11m52b_1023nih_43668_49595),
    .in1(out_const_87),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_43668_47273),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_43668_47277),
    .in4(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_43668_49583),
    .in5(out_lut_expr_FU_120_i0_fu___float_adde11m52b_1023nih_43668_49592),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49601 (.out1(out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_43668_49601),
    .in1(out_const_30),
    .in2(out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_43668_44502),
    .in3(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_43668_49565),
    .in4(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_43668_49569),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49605 (.out1(out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_43668_49605),
    .in1(out_const_74),
    .in2(out_reg_28_reg_28),
    .in3(out_reg_9_reg_9),
    .in4(out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_43668_49601),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_43668_49609 (.out1(out_lut_expr_FU_127_i0_fu___float_adde11m52b_1023nih_43668_49609),
    .in1(out_const_21),
    .in2(out_reg_6_reg_6),
    .in3(out_reg_7_reg_7),
    .in4(out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_43668_49605),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_43668_43796),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(56),
    .BITSIZE_out1(56)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_43668_43827),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_212_i1_fu___float_adde11m52b_1023nih_43668_45558),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_131_i0_fu___float_adde11m52b_1023nih_43668_45853),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_43668_45951),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_43668_46944),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_130_i0_fu___float_adde11m52b_1023nih_43668_47177),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_43668_47406),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_43668_47409),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_43668_47413),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(56),
    .BITSIZE_out1(56)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_43668_44233),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_184_i0_fu___float_adde11m52b_1023nih_43668_44256),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_64_0_64_205_i0_fu___float_adde11m52b_1023nih_43668_44176),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_32_0_32_178_i0_fu___float_adde11m52b_1023nih_43668_45025),
    .wenable(wrenable_reg_20));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_30_i0_fu___float_adde11m52b_1023nih_43668_48117),
    .wenable(wrenable_reg_21));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_43668_48133),
    .wenable(wrenable_reg_22));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde11m52b_1023nih_43668_48149),
    .wenable(wrenable_reg_23));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_43668_48165),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_43668_48181),
    .wenable(wrenable_reg_25));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_43668_48197),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_43668_48213),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_43668_48229),
    .wenable(wrenable_reg_28));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_43668_48436),
    .wenable(wrenable_reg_29));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_64_0_64_179_i0_fu___float_adde11m52b_1023nih_43668_44181),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_43668_48440),
    .wenable(wrenable_reg_30));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde11m52b_1023nih_43668_48448),
    .wenable(wrenable_reg_31));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_43668_48452),
    .wenable(wrenable_reg_32));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_43668_48460),
    .wenable(wrenable_reg_33));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde11m52b_1023nih_43668_48464),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_43668_48472),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_43668_48476),
    .wenable(wrenable_reg_36));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_43668_48484),
    .wenable(wrenable_reg_37));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_43668_48488),
    .wenable(wrenable_reg_38));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_43668_48496),
    .wenable(wrenable_reg_39));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_0_64_64_145_i0_fu___float_adde11m52b_1023nih_43668_44200),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_43668_48500),
    .wenable(wrenable_reg_40));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_43668_48508),
    .wenable(wrenable_reg_41));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_43668_48512),
    .wenable(wrenable_reg_42));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_43668_48520),
    .wenable(wrenable_reg_43));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_43668_48524),
    .wenable(wrenable_reg_44));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_43668_48783),
    .wenable(wrenable_reg_45));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde11m52b_1023nih_43668_48787),
    .wenable(wrenable_reg_46));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_43668_48791),
    .wenable(wrenable_reg_47));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_43668_48795),
    .wenable(wrenable_reg_48));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_49 (.out1(out_reg_49_reg_49),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_43668_48799),
    .wenable(wrenable_reg_49));
  register_SE #(.BITSIZE_in1(7),
    .BITSIZE_out1(7)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_bit_and_expr_FU_0_8_8_138_i0_fu___float_adde11m52b_1023nih_43668_44346),
    .wenable(wrenable_reg_5));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_50 (.out1(out_reg_50_reg_50),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_43668_48803),
    .wenable(wrenable_reg_50));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_51 (.out1(out_reg_51_reg_51),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_43668_48807),
    .wenable(wrenable_reg_51));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_52 (.out1(out_reg_52_reg_52),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_43668_48811),
    .wenable(wrenable_reg_52));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_53 (.out1(out_reg_53_reg_53),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_72_i0_fu___float_adde11m52b_1023nih_43668_48826),
    .wenable(wrenable_reg_53));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_54 (.out1(out_reg_54_reg_54),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_75_i0_fu___float_adde11m52b_1023nih_43668_48853),
    .wenable(wrenable_reg_54));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_55 (.out1(out_reg_55_reg_55),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde11m52b_1023nih_43668_48880),
    .wenable(wrenable_reg_55));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_56 (.out1(out_reg_56_reg_56),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde11m52b_1023nih_43668_48908),
    .wenable(wrenable_reg_56));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_57 (.out1(out_reg_57_reg_57),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_43668_49084),
    .wenable(wrenable_reg_57));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_58 (.out1(out_reg_58_reg_58),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde11m52b_1023nih_43668_49088),
    .wenable(wrenable_reg_58));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_59 (.out1(out_reg_59_reg_59),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_73_i0_fu___float_adde11m52b_1023nih_43668_49096),
    .wenable(wrenable_reg_59));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_43668_44714),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_60 (.out1(out_reg_60_reg_60),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_74_i0_fu___float_adde11m52b_1023nih_43668_49100),
    .wenable(wrenable_reg_60));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_61 (.out1(out_reg_61_reg_61),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_76_i0_fu___float_adde11m52b_1023nih_43668_49108),
    .wenable(wrenable_reg_61));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_62 (.out1(out_reg_62_reg_62),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde11m52b_1023nih_43668_49112),
    .wenable(wrenable_reg_62));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_63 (.out1(out_reg_63_reg_63),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde11m52b_1023nih_43668_49120),
    .wenable(wrenable_reg_63));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_64 (.out1(out_reg_64_reg_64),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde11m52b_1023nih_43668_49124),
    .wenable(wrenable_reg_64));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_65 (.out1(out_reg_65_reg_65),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_43668_49370),
    .wenable(wrenable_reg_65));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_66 (.out1(out_reg_66_reg_66),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_43668_49440),
    .wenable(wrenable_reg_66));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_67 (.out1(out_reg_67_reg_67),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_43668_49468),
    .wenable(wrenable_reg_67));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_68 (.out1(out_reg_68_reg_68),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_43668_49472),
    .wenable(wrenable_reg_68));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_69 (.out1(out_reg_69_reg_69),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_43668_49484),
    .wenable(wrenable_reg_69));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_43668_44719),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_70 (.out1(out_reg_70_reg_70),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_43668_49488),
    .wenable(wrenable_reg_70));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_71 (.out1(out_reg_71_reg_71),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_43668_44577),
    .wenable(wrenable_reg_71));
  register_STD #(.BITSIZE_in1(52),
    .BITSIZE_out1(52)) reg_72 (.out1(out_reg_72_reg_72),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i2_fu___float_adde11m52b_1023nih_43668_44663),
    .wenable(wrenable_reg_72));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_73 (.out1(out_reg_73_reg_73),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_123_i0_fu___float_adde11m52b_1023nih_43668_44702),
    .wenable(wrenable_reg_73));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_74 (.out1(out_reg_74_reg_74),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_193_i1_fu___float_adde11m52b_1023nih_43668_46956),
    .wenable(wrenable_reg_74));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_75 (.out1(out_reg_75_reg_75),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_126_i0_fu___float_adde11m52b_1023nih_43668_45756),
    .wenable(wrenable_reg_75));
  register_STD #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_76 (.out1(out_reg_76_reg_76),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_214_i0_fu___float_adde11m52b_1023nih_43668_45933),
    .wenable(wrenable_reg_76));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_77 (.out1(out_reg_77_reg_77),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_127_i0_fu___float_adde11m52b_1023nih_43668_49609),
    .wenable(wrenable_reg_77));
  register_SE #(.BITSIZE_in1(52),
    .BITSIZE_out1(52)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_190_i0_fu___float_adde11m52b_1023nih_43668_44835),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_177_i0_fu___float_adde11m52b_1023nih_43668_45065),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_ui_bit_ior_expr_FU_0_64_64_162_i0_fu___float_adde11m52b_1023nih_43668_44869;

endmodule

// FSM based controller description for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_adde11m52b_1023nih(done_port,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_51,
  wrenable_reg_52,
  wrenable_reg_53,
  wrenable_reg_54,
  wrenable_reg_55,
  wrenable_reg_56,
  wrenable_reg_57,
  wrenable_reg_58,
  wrenable_reg_59,
  wrenable_reg_6,
  wrenable_reg_60,
  wrenable_reg_61,
  wrenable_reg_62,
  wrenable_reg_63,
  wrenable_reg_64,
  wrenable_reg_65,
  wrenable_reg_66,
  wrenable_reg_67,
  wrenable_reg_68,
  wrenable_reg_69,
  wrenable_reg_7,
  wrenable_reg_70,
  wrenable_reg_71,
  wrenable_reg_72,
  wrenable_reg_73,
  wrenable_reg_74,
  wrenable_reg_75,
  wrenable_reg_76,
  wrenable_reg_77,
  wrenable_reg_8,
  wrenable_reg_9,
  clock,
  reset,
  start_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_27;
  output wrenable_reg_28;
  output wrenable_reg_29;
  output wrenable_reg_3;
  output wrenable_reg_30;
  output wrenable_reg_31;
  output wrenable_reg_32;
  output wrenable_reg_33;
  output wrenable_reg_34;
  output wrenable_reg_35;
  output wrenable_reg_36;
  output wrenable_reg_37;
  output wrenable_reg_38;
  output wrenable_reg_39;
  output wrenable_reg_4;
  output wrenable_reg_40;
  output wrenable_reg_41;
  output wrenable_reg_42;
  output wrenable_reg_43;
  output wrenable_reg_44;
  output wrenable_reg_45;
  output wrenable_reg_46;
  output wrenable_reg_47;
  output wrenable_reg_48;
  output wrenable_reg_49;
  output wrenable_reg_5;
  output wrenable_reg_50;
  output wrenable_reg_51;
  output wrenable_reg_52;
  output wrenable_reg_53;
  output wrenable_reg_54;
  output wrenable_reg_55;
  output wrenable_reg_56;
  output wrenable_reg_57;
  output wrenable_reg_58;
  output wrenable_reg_59;
  output wrenable_reg_6;
  output wrenable_reg_60;
  output wrenable_reg_61;
  output wrenable_reg_62;
  output wrenable_reg_63;
  output wrenable_reg_64;
  output wrenable_reg_65;
  output wrenable_reg_66;
  output wrenable_reg_67;
  output wrenable_reg_68;
  output wrenable_reg_69;
  output wrenable_reg_7;
  output wrenable_reg_70;
  output wrenable_reg_71;
  output wrenable_reg_72;
  output wrenable_reg_73;
  output wrenable_reg_74;
  output wrenable_reg_75;
  output wrenable_reg_76;
  output wrenable_reg_77;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [3:0] S_0 = 4'b0001,
    S_1 = 4'b0010,
    S_2 = 4'b0100,
    S_3 = 4'b1000;
  reg [3:0] _present_state=S_0, _next_state;
  reg done_port;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_27;
  reg wrenable_reg_28;
  reg wrenable_reg_29;
  reg wrenable_reg_3;
  reg wrenable_reg_30;
  reg wrenable_reg_31;
  reg wrenable_reg_32;
  reg wrenable_reg_33;
  reg wrenable_reg_34;
  reg wrenable_reg_35;
  reg wrenable_reg_36;
  reg wrenable_reg_37;
  reg wrenable_reg_38;
  reg wrenable_reg_39;
  reg wrenable_reg_4;
  reg wrenable_reg_40;
  reg wrenable_reg_41;
  reg wrenable_reg_42;
  reg wrenable_reg_43;
  reg wrenable_reg_44;
  reg wrenable_reg_45;
  reg wrenable_reg_46;
  reg wrenable_reg_47;
  reg wrenable_reg_48;
  reg wrenable_reg_49;
  reg wrenable_reg_5;
  reg wrenable_reg_50;
  reg wrenable_reg_51;
  reg wrenable_reg_52;
  reg wrenable_reg_53;
  reg wrenable_reg_54;
  reg wrenable_reg_55;
  reg wrenable_reg_56;
  reg wrenable_reg_57;
  reg wrenable_reg_58;
  reg wrenable_reg_59;
  reg wrenable_reg_6;
  reg wrenable_reg_60;
  reg wrenable_reg_61;
  reg wrenable_reg_62;
  reg wrenable_reg_63;
  reg wrenable_reg_64;
  reg wrenable_reg_65;
  reg wrenable_reg_66;
  reg wrenable_reg_67;
  reg wrenable_reg_68;
  reg wrenable_reg_69;
  reg wrenable_reg_7;
  reg wrenable_reg_70;
  reg wrenable_reg_71;
  reg wrenable_reg_72;
  reg wrenable_reg_73;
  reg wrenable_reg_74;
  reg wrenable_reg_75;
  reg wrenable_reg_76;
  reg wrenable_reg_77;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_27 = 1'b0;
    wrenable_reg_28 = 1'b0;
    wrenable_reg_29 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_30 = 1'b0;
    wrenable_reg_31 = 1'b0;
    wrenable_reg_32 = 1'b0;
    wrenable_reg_33 = 1'b0;
    wrenable_reg_34 = 1'b0;
    wrenable_reg_35 = 1'b0;
    wrenable_reg_36 = 1'b0;
    wrenable_reg_37 = 1'b0;
    wrenable_reg_38 = 1'b0;
    wrenable_reg_39 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_40 = 1'b0;
    wrenable_reg_41 = 1'b0;
    wrenable_reg_42 = 1'b0;
    wrenable_reg_43 = 1'b0;
    wrenable_reg_44 = 1'b0;
    wrenable_reg_45 = 1'b0;
    wrenable_reg_46 = 1'b0;
    wrenable_reg_47 = 1'b0;
    wrenable_reg_48 = 1'b0;
    wrenable_reg_49 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_50 = 1'b0;
    wrenable_reg_51 = 1'b0;
    wrenable_reg_52 = 1'b0;
    wrenable_reg_53 = 1'b0;
    wrenable_reg_54 = 1'b0;
    wrenable_reg_55 = 1'b0;
    wrenable_reg_56 = 1'b0;
    wrenable_reg_57 = 1'b0;
    wrenable_reg_58 = 1'b0;
    wrenable_reg_59 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_60 = 1'b0;
    wrenable_reg_61 = 1'b0;
    wrenable_reg_62 = 1'b0;
    wrenable_reg_63 = 1'b0;
    wrenable_reg_64 = 1'b0;
    wrenable_reg_65 = 1'b0;
    wrenable_reg_66 = 1'b0;
    wrenable_reg_67 = 1'b0;
    wrenable_reg_68 = 1'b0;
    wrenable_reg_69 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_70 = 1'b0;
    wrenable_reg_71 = 1'b0;
    wrenable_reg_72 = 1'b0;
    wrenable_reg_73 = 1'b0;
    wrenable_reg_74 = 1'b0;
    wrenable_reg_75 = 1'b0;
    wrenable_reg_76 = 1'b0;
    wrenable_reg_77 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          wrenable_reg_40 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          wrenable_reg_48 = 1'b1;
          wrenable_reg_49 = 1'b1;
          wrenable_reg_50 = 1'b1;
          wrenable_reg_51 = 1'b1;
          wrenable_reg_52 = 1'b1;
          wrenable_reg_53 = 1'b1;
          wrenable_reg_54 = 1'b1;
          wrenable_reg_55 = 1'b1;
          wrenable_reg_56 = 1'b1;
          wrenable_reg_57 = 1'b1;
          wrenable_reg_58 = 1'b1;
          wrenable_reg_59 = 1'b1;
          wrenable_reg_60 = 1'b1;
          wrenable_reg_61 = 1'b1;
          wrenable_reg_62 = 1'b1;
          wrenable_reg_63 = 1'b1;
          wrenable_reg_64 = 1'b1;
          wrenable_reg_65 = 1'b1;
          wrenable_reg_66 = 1'b1;
          wrenable_reg_67 = 1'b1;
          wrenable_reg_68 = 1'b1;
          wrenable_reg_69 = 1'b1;
          wrenable_reg_70 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          wrenable_reg_71 = 1'b1;
          wrenable_reg_72 = 1'b1;
          wrenable_reg_73 = 1'b1;
          wrenable_reg_74 = 1'b1;
          wrenable_reg_75 = 1'b1;
          wrenable_reg_76 = 1'b1;
          wrenable_reg_77 = 1'b1;
          _next_state = S_3;
          done_port = 1'b1;
        end
      S_3 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock,
  reset,
  in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock or negedge reset)
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_adde11m52b_1023nih(clock,
  reset,
  start_port,
  done_port,
  a,
  b,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [63:0] a;
  input [63:0] b;
  // OUT
  output done_port;
  output [63:0] return_port;
  // Component and signal declarations
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_27;
  wire wrenable_reg_28;
  wire wrenable_reg_29;
  wire wrenable_reg_3;
  wire wrenable_reg_30;
  wire wrenable_reg_31;
  wire wrenable_reg_32;
  wire wrenable_reg_33;
  wire wrenable_reg_34;
  wire wrenable_reg_35;
  wire wrenable_reg_36;
  wire wrenable_reg_37;
  wire wrenable_reg_38;
  wire wrenable_reg_39;
  wire wrenable_reg_4;
  wire wrenable_reg_40;
  wire wrenable_reg_41;
  wire wrenable_reg_42;
  wire wrenable_reg_43;
  wire wrenable_reg_44;
  wire wrenable_reg_45;
  wire wrenable_reg_46;
  wire wrenable_reg_47;
  wire wrenable_reg_48;
  wire wrenable_reg_49;
  wire wrenable_reg_5;
  wire wrenable_reg_50;
  wire wrenable_reg_51;
  wire wrenable_reg_52;
  wire wrenable_reg_53;
  wire wrenable_reg_54;
  wire wrenable_reg_55;
  wire wrenable_reg_56;
  wire wrenable_reg_57;
  wire wrenable_reg_58;
  wire wrenable_reg_59;
  wire wrenable_reg_6;
  wire wrenable_reg_60;
  wire wrenable_reg_61;
  wire wrenable_reg_62;
  wire wrenable_reg_63;
  wire wrenable_reg_64;
  wire wrenable_reg_65;
  wire wrenable_reg_66;
  wire wrenable_reg_67;
  wire wrenable_reg_68;
  wire wrenable_reg_69;
  wire wrenable_reg_7;
  wire wrenable_reg_70;
  wire wrenable_reg_71;
  wire wrenable_reg_72;
  wire wrenable_reg_73;
  wire wrenable_reg_74;
  wire wrenable_reg_75;
  wire wrenable_reg_76;
  wire wrenable_reg_77;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___float_adde11m52b_1023nih Controller_i (.done_port(done_delayed_REG_signal_in),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_51(wrenable_reg_51),
    .wrenable_reg_52(wrenable_reg_52),
    .wrenable_reg_53(wrenable_reg_53),
    .wrenable_reg_54(wrenable_reg_54),
    .wrenable_reg_55(wrenable_reg_55),
    .wrenable_reg_56(wrenable_reg_56),
    .wrenable_reg_57(wrenable_reg_57),
    .wrenable_reg_58(wrenable_reg_58),
    .wrenable_reg_59(wrenable_reg_59),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_60(wrenable_reg_60),
    .wrenable_reg_61(wrenable_reg_61),
    .wrenable_reg_62(wrenable_reg_62),
    .wrenable_reg_63(wrenable_reg_63),
    .wrenable_reg_64(wrenable_reg_64),
    .wrenable_reg_65(wrenable_reg_65),
    .wrenable_reg_66(wrenable_reg_66),
    .wrenable_reg_67(wrenable_reg_67),
    .wrenable_reg_68(wrenable_reg_68),
    .wrenable_reg_69(wrenable_reg_69),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_70(wrenable_reg_70),
    .wrenable_reg_71(wrenable_reg_71),
    .wrenable_reg_72(wrenable_reg_72),
    .wrenable_reg_73(wrenable_reg_73),
    .wrenable_reg_74(wrenable_reg_74),
    .wrenable_reg_75(wrenable_reg_75),
    .wrenable_reg_76(wrenable_reg_76),
    .wrenable_reg_77(wrenable_reg_77),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___float_adde11m52b_1023nih Datapath_i (.return_port(return_port),
    .clock(clock),
    .reset(reset),
    .in_port_a(a),
    .in_port_b(b),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_51(wrenable_reg_51),
    .wrenable_reg_52(wrenable_reg_52),
    .wrenable_reg_53(wrenable_reg_53),
    .wrenable_reg_54(wrenable_reg_54),
    .wrenable_reg_55(wrenable_reg_55),
    .wrenable_reg_56(wrenable_reg_56),
    .wrenable_reg_57(wrenable_reg_57),
    .wrenable_reg_58(wrenable_reg_58),
    .wrenable_reg_59(wrenable_reg_59),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_60(wrenable_reg_60),
    .wrenable_reg_61(wrenable_reg_61),
    .wrenable_reg_62(wrenable_reg_62),
    .wrenable_reg_63(wrenable_reg_63),
    .wrenable_reg_64(wrenable_reg_64),
    .wrenable_reg_65(wrenable_reg_65),
    .wrenable_reg_66(wrenable_reg_66),
    .wrenable_reg_67(wrenable_reg_67),
    .wrenable_reg_68(wrenable_reg_68),
    .wrenable_reg_69(wrenable_reg_69),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_70(wrenable_reg_70),
    .wrenable_reg_71(wrenable_reg_71),
    .wrenable_reg_72(wrenable_reg_72),
    .wrenable_reg_73(wrenable_reg_73),
    .wrenable_reg_74(wrenable_reg_74),
    .wrenable_reg_75(wrenable_reg_75),
    .wrenable_reg_76(wrenable_reg_76),
    .wrenable_reg_77(wrenable_reg_77),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2020-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module extract_bit_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output out1;
  assign out1 = (in1 >>> in2)&1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_ior_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 | in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ternary_plus_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2 + in3;
endmodule

// Datapath RTL description for __float_mule11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_mule11m52b_1023nih(clock,
  reset,
  in_port_a,
  in_port_b,
  return_port,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9);
  // IN
  input clock;
  input reset;
  input [63:0] in_port_a;
  input [63:0] in_port_b;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [63:0] return_port;
  // Component and signal declarations
  wire [31:0] out_ASSIGN_UNSIGNED_FU_14_i0_fu___float_mule11m52b_1023nih_42628_45975;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_15_i0_fu___float_mule11m52b_1023nih_42628_45977;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_16_i0_fu___float_mule11m52b_1023nih_42628_45979;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_17_i0_fu___float_mule11m52b_1023nih_42628_45981;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_42628_45971;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_42628_45973;
  wire signed [2:0] out_UIdata_converter_FU_21_i0_fu___float_mule11m52b_1023nih_42628_42978;
  wire signed [1:0] out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_42628_42981;
  wire signed [1:0] out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_42628_43011;
  wire signed [2:0] out_UIdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_42628_42984;
  wire signed [1:0] out_UIdata_converter_FU_30_i0_fu___float_mule11m52b_1023nih_42628_43014;
  wire signed [1:0] out_UIdata_converter_FU_33_i0_fu___float_mule11m52b_1023nih_42628_43029;
  wire signed [1:0] out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_42628_43247;
  wire signed [1:0] out_UIdata_converter_FU_40_i0_fu___float_mule11m52b_1023nih_42628_43269;
  wire out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_42628_45719;
  wire out_UUdata_converter_FU_20_i0_fu___float_mule11m52b_1023nih_42628_42866;
  wire out_UUdata_converter_FU_24_i0_fu___float_mule11m52b_1023nih_42628_43008;
  wire out_UUdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_42628_45729;
  wire out_UUdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_42628_42944;
  wire [10:0] out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_42628_42738;
  wire out_UUdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_42628_43026;
  wire out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_42628_43228;
  wire out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_42628_43231;
  wire out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_42628_43244;
  wire [11:0] out_UUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_42628_43288;
  wire out_UUdata_converter_FU_46_i0_fu___float_mule11m52b_1023nih_42628_43425;
  wire [10:0] out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_42628_42753;
  wire out_UUdata_converter_FU_9_i0_fu___float_mule11m52b_1023nih_42628_42776;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_61_i0_fu___float_mule11m52b_1023nih_42628_42990;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_61_i1_fu___float_mule11m52b_1023nih_42628_43017;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_61_i2_fu___float_mule11m52b_1023nih_42628_43032;
  wire signed [2:0] out_bit_ior_expr_FU_8_8_8_62_i0_fu___float_mule11m52b_1023nih_42628_42987;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [5:0] out_const_10;
  wire [16:0] out_const_11;
  wire [24:0] out_const_12;
  wire [52:0] out_const_13;
  wire [5:0] out_const_14;
  wire [1:0] out_const_15;
  wire [2:0] out_const_16;
  wire [3:0] out_const_17;
  wire [5:0] out_const_18;
  wire [5:0] out_const_19;
  wire [6:0] out_const_2;
  wire [29:0] out_const_20;
  wire [45:0] out_const_21;
  wire [2:0] out_const_22;
  wire [7:0] out_const_23;
  wire [27:0] out_const_24;
  wire [31:0] out_const_25;
  wire [5:0] out_const_26;
  wire [9:0] out_const_27;
  wire [10:0] out_const_28;
  wire [62:0] out_const_29;
  wire [4:0] out_const_3;
  wire [12:0] out_const_30;
  wire [16:0] out_const_31;
  wire [16:0] out_const_32;
  wire [31:0] out_const_33;
  wire [31:0] out_const_34;
  wire [51:0] out_const_35;
  wire [52:0] out_const_36;
  wire [53:0] out_const_37;
  wire [62:0] out_const_38;
  wire [63:0] out_const_39;
  wire [6:0] out_const_4;
  wire [6:0] out_const_5;
  wire [6:0] out_const_6;
  wire out_const_7;
  wire [2:0] out_const_8;
  wire [3:0] out_const_9;
  wire out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_42628_46479;
  wire out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_42628_46482;
  wire out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_42628_46763;
  wire out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_42628_42820;
  wire out_lut_expr_FU_11_i0_fu___float_mule11m52b_1023nih_42628_43642;
  wire out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_42628_42898;
  wire out_lut_expr_FU_13_i0_fu___float_mule11m52b_1023nih_42628_43634;
  wire out_lut_expr_FU_19_i0_fu___float_mule11m52b_1023nih_42628_46099;
  wire out_lut_expr_FU_23_i0_fu___float_mule11m52b_1023nih_42628_46002;
  wire out_lut_expr_FU_27_i0_fu___float_mule11m52b_1023nih_42628_46103;
  wire out_lut_expr_FU_31_i0_fu___float_mule11m52b_1023nih_42628_46021;
  wire out_lut_expr_FU_37_i0_fu___float_mule11m52b_1023nih_42628_46028;
  wire out_lut_expr_FU_45_i0_fu___float_mule11m52b_1023nih_42628_46042;
  wire out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_42628_46917;
  wire out_lut_expr_FU_52_i0_fu___float_mule11m52b_1023nih_42628_44993;
  wire out_lut_expr_FU_54_i0_fu___float_mule11m52b_1023nih_42628_45661;
  wire out_lut_expr_FU_55_i0_fu___float_mule11m52b_1023nih_42628_46924;
  wire out_lut_expr_FU_56_i0_fu___float_mule11m52b_1023nih_42628_46928;
  wire out_lut_expr_FU_57_i0_fu___float_mule11m52b_1023nih_42628_45664;
  wire out_lut_expr_FU_58_i0_fu___float_mule11m52b_1023nih_42628_45677;
  wire out_lut_expr_FU_59_i0_fu___float_mule11m52b_1023nih_42628_45636;
  wire out_lut_expr_FU_8_i0_fu___float_mule11m52b_1023nih_42628_42773;
  wire [63:0] out_reg_0_reg_0;
  wire out_reg_10_reg_10;
  wire out_reg_11_reg_11;
  wire [21:0] out_reg_12_reg_12;
  wire [20:0] out_reg_13_reg_13;
  wire [9:0] out_reg_14_reg_14;
  wire [54:0] out_reg_15_reg_15;
  wire [1:0] out_reg_16_reg_16;
  wire [63:0] out_reg_17_reg_17;
  wire out_reg_18_reg_18;
  wire out_reg_19_reg_19;
  wire [12:0] out_reg_1_reg_1;
  wire [31:0] out_reg_2_reg_2;
  wire [52:0] out_reg_3_reg_3;
  wire [52:0] out_reg_4_reg_4;
  wire [41:0] out_reg_5_reg_5;
  wire [63:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire out_reg_8_reg_8;
  wire [63:0] out_reg_9_reg_9;
  wire [10:0] out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_42628_42750;
  wire [53:0] out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_42628_43196;
  wire [62:0] out_ui_bit_and_expr_FU_0_64_64_65_i0_fu___float_mule11m52b_1023nih_42628_43553;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_42628_42735;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_66_i1_fu___float_mule11m52b_1023nih_42628_43512;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_42628_42784;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_42628_42876;
  wire [9:0] out_ui_bit_and_expr_FU_16_0_16_68_i0_fu___float_mule11m52b_1023nih_42628_43212;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_69_i0_fu___float_mule11m52b_1023nih_42628_42972;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_42628_43098;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_42628_43104;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i2_fu___float_mule11m52b_1023nih_42628_43133;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i3_fu___float_mule11m52b_1023nih_42628_43148;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_71_i0_fu___float_mule11m52b_1023nih_42628_45228;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_42628_42718;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_42628_42756;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i2_fu___float_mule11m52b_1023nih_42628_43218;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i3_fu___float_mule11m52b_1023nih_42628_43284;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_73_i0_fu___float_mule11m52b_1023nih_42628_43259;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_74_i0_fu___float_mule11m52b_1023nih_42628_43409;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_75_i0_fu___float_mule11m52b_1023nih_42628_43266;
  wire [63:0] out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_42628_43180;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_42628_43078;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_42628_43094;
  wire [51:0] out_ui_bit_ior_expr_FU_0_64_64_78_i0_fu___float_mule11m52b_1023nih_42628_43215;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_42628_43294;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_80_i0_fu___float_mule11m52b_1023nih_42628_43556;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_42628_43609;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_82_i0_fu___float_mule11m52b_1023nih_42628_43281;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i0_fu___float_mule11m52b_1023nih_42628_42869;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_42628_42872;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i2_fu___float_mule11m52b_1023nih_42628_42947;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_42628_42950;
  wire [12:0] out_ui_cond_expr_FU_16_16_16_16_84_i0_fu___float_mule11m52b_1023nih_42628_45631;
  wire [12:0] out_ui_cond_expr_FU_16_16_16_16_84_i1_fu___float_mule11m52b_1023nih_42628_45695;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_85_i0_fu___float_mule11m52b_1023nih_42628_45680;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_85_i1_fu___float_mule11m52b_1023nih_42628_45698;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_85_i2_fu___float_mule11m52b_1023nih_42628_45749;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i0_fu___float_mule11m52b_1023nih_42628_45483;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i1_fu___float_mule11m52b_1023nih_42628_45492;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i2_fu___float_mule11m52b_1023nih_42628_45686;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i3_fu___float_mule11m52b_1023nih_42628_45692;
  wire out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_42628_42879;
  wire out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_42628_43515;
  wire out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_42628_42793;
  wire out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_42628_42797;
  wire out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_42628_42883;
  wire out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_42628_42800;
  wire out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_42628_42886;
  wire out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_42628_43466;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_42628_46645;
  wire out_ui_extract_bit_expr_FU_42_i0_fu___float_mule11m52b_1023nih_42628_45301;
  wire out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_42628_46475;
  wire out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_42628_46308;
  wire out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_42628_46847;
  wire out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_42628_46182;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_mule11m52b_1023nih_42628_46116;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_mule11m52b_1023nih_42628_46120;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_42628_42779;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule11m52b_1023nih_42628_43177;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_mule11m52b_1023nih_42628_43200;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_mule11m52b_1023nih_42628_43238;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_95_i1_fu___float_mule11m52b_1023nih_42628_43278;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_mule11m52b_1023nih_42628_43291;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_mule11m52b_1023nih_42628_45225;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_42628_45657;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_98_i1_fu___float_mule11m52b_1023nih_42628_45716;
  wire [53:0] out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_42628_43250;
  wire [50:0] out_ui_lshift_expr_FU_64_64_64_99_i1_fu___float_mule11m52b_1023nih_42628_43275;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_mule11m52b_1023nih_42628_45702;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_100_i1_fu___float_mule11m52b_1023nih_42628_45706;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_mule11m52b_1023nih_42628_45723;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_101_i1_fu___float_mule11m52b_1023nih_42628_45732;
  wire [63:0] out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_42628_43107;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_102_i1_fu___float_mule11m52b_1023nih_42628_43141;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_102_i2_fu___float_mule11m52b_1023nih_42628_43156;
  wire [41:0] out_ui_mult_expr_FU_32_32_32_0_102_i3_fu___float_mule11m52b_1023nih_42628_43167;
  wire out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_42628_42920;
  wire out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_42628_42842;
  wire out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_42628_43412;
  wire out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_42628_43631;
  wire out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_42628_43639;
  wire [12:0] out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_42628_43234;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_42628_43144;
  wire [52:0] out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_42628_43159;
  wire [63:0] out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_42628_43460;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule11m52b_1023nih_42628_42726;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_109_i1_fu___float_mule11m52b_1023nih_42628_42745;
  wire [1:0] out_ui_rshift_expr_FU_64_0_64_109_i2_fu___float_mule11m52b_1023nih_42628_43263;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_109_i3_fu___float_mule11m52b_1023nih_42628_43509;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_42628_43125;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_42628_43129;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_110_i2_fu___float_mule11m52b_1023nih_42628_43137;
  wire [21:0] out_ui_rshift_expr_FU_64_0_64_110_i3_fu___float_mule11m52b_1023nih_42628_43152;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_110_i4_fu___float_mule11m52b_1023nih_42628_43163;
  wire [9:0] out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_42628_43203;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule11m52b_1023nih_42628_45216;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule11m52b_1023nih_42628_45650;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_113_i1_fu___float_mule11m52b_1023nih_42628_45712;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_42628_45709;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule11m52b_1023nih_42628_42954;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_42628_42957;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule11m52b_1023nih_42628_45726;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule11m52b_1023nih_42628_45735;
  wire [1:0] out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_42628_43272;
  wire [12:0] out_ui_ternary_plus_expr_FU_0_16_16_16_118_i0_fu___float_mule11m52b_1023nih_42628_43060;
  wire [41:0] out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_42628_43173;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b10000000000000000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(25),
    .value(25'b1000000000000000000000000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(53),
    .value(53'b10000000000000000000000000000000000000000000000000000)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101001)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110011)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110101)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(30),
    .value(30'b110111000000000011011100110111)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(46),
    .value(46'b1101110011011100000000001101110011011100110111)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11100000)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(28),
    .value(28'b1110000000000000000000000000)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11100000000111110000000011111111)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1111111111)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111110000000000000000000000000000000000000000000000000000)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01010)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b1111111111111)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b11111111111111110)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b11111111111111111)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111110000000001)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(53),
    .value(53'b11111111111111111111111111111111111111111111111111111)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(54),
    .value(54'b111111111111111111111111111111111111111111111111111111)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110110)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_9 (.out1(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_42628_42718 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_42628_42718),
    .in1(in_port_a),
    .in2(out_const_35));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_42726 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule11m52b_1023nih_42628_42726),
    .in1(in_port_a),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_42628_42735 (.out1(out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_42628_42735),
    .in1(out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule11m52b_1023nih_42628_42726),
    .in2(out_const_28));
  UUdata_converter_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_42628_42738 (.out1(out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_42628_42738),
    .in1(out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_42628_42735));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_42745 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i1_fu___float_mule11m52b_1023nih_42628_42745),
    .in1(in_port_b),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_42628_42750 (.out1(out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_42628_42750),
    .in1(out_const_28),
    .in2(out_ui_rshift_expr_FU_64_0_64_109_i1_fu___float_mule11m52b_1023nih_42628_42745));
  UUdata_converter_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_42628_42753 (.out1(out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_42628_42753),
    .in1(out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_42628_42750));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_42628_42756 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_42628_42756),
    .in1(in_port_b),
    .in2(out_const_35));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42773 (.out1(out_lut_expr_FU_8_i0_fu___float_mule11m52b_1023nih_42628_42773),
    .in1(out_const_16),
    .in2(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule11m52b_1023nih_42628_46116),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule11m52b_1023nih_42628_46120),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42776 (.out1(out_UUdata_converter_FU_9_i0_fu___float_mule11m52b_1023nih_42628_42776),
    .in1(out_lut_expr_FU_8_i0_fu___float_mule11m52b_1023nih_42628_42773));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_42779 (.out1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_42628_42779),
    .in1(out_UUdata_converter_FU_9_i0_fu___float_mule11m52b_1023nih_42628_42776),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_42628_42784 (.out1(out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_42628_42784),
    .in1(out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_42628_42735),
    .in2(out_const_34));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42793 (.out1(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_42628_42793),
    .in1(out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_42628_42784),
    .in2(out_const_28));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42797 (.out1(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_42628_42797),
    .in1(out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_42628_42738),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42800 (.out1(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_42628_42800),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_42628_42718),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42820 (.out1(out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_42628_42820),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_42628_42800),
    .in3(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_42628_42793),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42842 (.out1(out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_42628_42842),
    .in1(out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_42628_42784),
    .in2(out_const_28));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42866 (.out1(out_UUdata_converter_FU_20_i0_fu___float_mule11m52b_1023nih_42628_42866),
    .in1(out_lut_expr_FU_19_i0_fu___float_mule11m52b_1023nih_42628_46099));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_42869 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i0_fu___float_mule11m52b_1023nih_42628_42869),
    .in1(out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_mule11m52b_1023nih_42628_45702),
    .in2(out_ui_cond_expr_FU_8_8_8_8_86_i3_fu___float_mule11m52b_1023nih_42628_45692));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_42872 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_42628_42872),
    .in1(out_UUdata_converter_FU_20_i0_fu___float_mule11m52b_1023nih_42628_42866),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_83_i0_fu___float_mule11m52b_1023nih_42628_42869));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_42628_42876 (.out1(out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_42628_42876),
    .in1(out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_42628_42750),
    .in2(out_const_34));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42879 (.out1(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_42628_42879),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_42628_42876));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42883 (.out1(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_42628_42883),
    .in1(out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_42628_42753),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42886 (.out1(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_42628_42886),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_42628_42756),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42898 (.out1(out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_42628_42898),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_42628_42886),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_42628_42879),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42920 (.out1(out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_42628_42920),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_42628_42876));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42944 (.out1(out_UUdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_42628_42944),
    .in1(out_lut_expr_FU_27_i0_fu___float_mule11m52b_1023nih_42628_46103));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_42947 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i2_fu___float_mule11m52b_1023nih_42628_42947),
    .in1(out_ui_lshift_expr_FU_8_0_8_100_i1_fu___float_mule11m52b_1023nih_42628_45706),
    .in2(out_ui_cond_expr_FU_8_8_8_8_86_i2_fu___float_mule11m52b_1023nih_42628_45686));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_42950 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_42628_42950),
    .in1(out_UUdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_42628_42944),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_83_i2_fu___float_mule11m52b_1023nih_42628_42947));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_42628_42954 (.out1(out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule11m52b_1023nih_42628_42954),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_42628_42872),
    .in2(out_const_1));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_42628_42957 (.out1(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_42628_42957),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_42628_42950),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_42972 (.out1(out_ui_bit_and_expr_FU_1_1_1_69_i0_fu___float_mule11m52b_1023nih_42628_42972),
    .in1(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_42628_42957),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_42628_42950));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_42628_42978 (.out1(out_UIdata_converter_FU_21_i0_fu___float_mule11m52b_1023nih_42628_42978),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_42628_42872));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_42981 (.out1(out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_42628_42981),
    .in1(out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule11m52b_1023nih_42628_42954));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_42628_42984 (.out1(out_UIdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_42628_42984),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_42628_42950));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_42628_42987 (.out1(out_bit_ior_expr_FU_8_8_8_62_i0_fu___float_mule11m52b_1023nih_42628_42987),
    .in1(out_UIdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_42628_42984),
    .in2(out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_42628_42981));
  bit_and_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(3),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_42990 (.out1(out_bit_and_expr_FU_8_8_8_61_i0_fu___float_mule11m52b_1023nih_42628_42990),
    .in1(out_bit_ior_expr_FU_8_8_8_62_i0_fu___float_mule11m52b_1023nih_42628_42987),
    .in2(out_UIdata_converter_FU_21_i0_fu___float_mule11m52b_1023nih_42628_42978));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43008 (.out1(out_UUdata_converter_FU_24_i0_fu___float_mule11m52b_1023nih_42628_43008),
    .in1(out_lut_expr_FU_23_i0_fu___float_mule11m52b_1023nih_42628_46002));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_43011 (.out1(out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_42628_43011),
    .in1(out_UUdata_converter_FU_24_i0_fu___float_mule11m52b_1023nih_42628_43008));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_43014 (.out1(out_UIdata_converter_FU_30_i0_fu___float_mule11m52b_1023nih_42628_43014),
    .in1(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_42628_42957));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_43017 (.out1(out_bit_and_expr_FU_8_8_8_61_i1_fu___float_mule11m52b_1023nih_42628_43017),
    .in1(out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_42628_43011),
    .in2(out_UIdata_converter_FU_30_i0_fu___float_mule11m52b_1023nih_42628_43014));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43026 (.out1(out_UUdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_42628_43026),
    .in1(out_lut_expr_FU_31_i0_fu___float_mule11m52b_1023nih_42628_46021));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_43029 (.out1(out_UIdata_converter_FU_33_i0_fu___float_mule11m52b_1023nih_42628_43029),
    .in1(out_UUdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_42628_43026));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_43032 (.out1(out_bit_and_expr_FU_8_8_8_61_i2_fu___float_mule11m52b_1023nih_42628_43032),
    .in1(out_UIdata_converter_FU_33_i0_fu___float_mule11m52b_1023nih_42628_43029),
    .in2(out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_42628_42981));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_42628_43060 (.out1(out_ui_ternary_plus_expr_FU_0_16_16_16_118_i0_fu___float_mule11m52b_1023nih_42628_43060),
    .in1(out_const_33),
    .in2(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_42628_45971),
    .in3(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_42628_45973));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_42628_43078 (.out1(out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_42628_43078),
    .in1(out_const_13),
    .in2(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_42628_42718));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_42628_43094 (.out1(out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_42628_43094),
    .in1(out_const_13),
    .in2(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_42628_42756));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_42628_43098 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_42628_43098),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_42628_43078),
    .in2(out_const_34));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_42628_43104 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_42628_43104),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_42628_43094),
    .in2(out_const_34));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(64),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_42628_43107 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_42628_43107),
    .clock(clock),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_42628_43098),
    .in2(out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_42628_43104));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43125 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_42628_43125),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_42628_43078),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43129 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_42628_43129),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_42628_43094),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_42628_43133 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i2_fu___float_mule11m52b_1023nih_42628_43133),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_42628_43107),
    .in2(out_const_34));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43137 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i2_fu___float_mule11m52b_1023nih_42628_43137),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_42628_43107),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_42628_43141 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i1_fu___float_mule11m52b_1023nih_42628_43141),
    .clock(clock),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_42628_43125),
    .in2(out_ASSIGN_UNSIGNED_FU_15_i0_fu___float_mule11m52b_1023nih_42628_45977));
  ui_plus_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(54)) fu___float_mule11m52b_1023nih_42628_43144 (.out1(out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_42628_43144),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_2_reg_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_42628_43148 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i3_fu___float_mule11m52b_1023nih_42628_43148),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_42628_43144),
    .in2(out_const_34));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(22),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43152 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i3_fu___float_mule11m52b_1023nih_42628_43152),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_42628_43144),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_42628_43156 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i2_fu___float_mule11m52b_1023nih_42628_43156),
    .clock(clock),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_42628_43129),
    .in2(out_ASSIGN_UNSIGNED_FU_14_i0_fu___float_mule11m52b_1023nih_42628_45975));
  ui_plus_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_42628_43159 (.out1(out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_42628_43159),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_bit_and_expr_FU_32_0_32_70_i3_fu___float_mule11m52b_1023nih_42628_43148));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43163 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i4_fu___float_mule11m52b_1023nih_42628_43163),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_42628_43159),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(42),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_42628_43167 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i3_fu___float_mule11m52b_1023nih_42628_43167),
    .clock(clock),
    .in1(out_ASSIGN_UNSIGNED_FU_16_i0_fu___float_mule11m52b_1023nih_42628_45979),
    .in2(out_ASSIGN_UNSIGNED_FU_17_i0_fu___float_mule11m52b_1023nih_42628_45981));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(22),
    .BITSIZE_in3(21),
    .BITSIZE_out1(42)) fu___float_mule11m52b_1023nih_42628_43173 (.out1(out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_42628_43173),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43177 (.out1(out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule11m52b_1023nih_42628_43177),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_42628_43159),
    .in2(out_const_2));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_in3(6),
    .BITSIZE_out1(64),
    .OFFSET_PARAMETER(32)) fu___float_mule11m52b_1023nih_42628_43180 (.out1(out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_42628_43180),
    .in1(out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_mule11m52b_1023nih_42628_45225),
    .in2(out_reg_7_reg_7),
    .in3(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(64),
    .BITSIZE_out1(54)) fu___float_mule11m52b_1023nih_42628_43196 (.out1(out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_42628_43196),
    .in1(out_const_37),
    .in2(out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_42628_43180));
  ui_lshift_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(5),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43200 (.out1(out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_mule11m52b_1023nih_42628_43200),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_42628_43173),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43203 (.out1(out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_42628_43203),
    .in1(out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_42628_43180),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu___float_mule11m52b_1023nih_42628_43212 (.out1(out_ui_bit_and_expr_FU_16_0_16_68_i0_fu___float_mule11m52b_1023nih_42628_43212),
    .in1(out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_42628_43203),
    .in2(out_const_27));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(10),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_42628_43215 (.out1(out_ui_bit_ior_expr_FU_0_64_64_78_i0_fu___float_mule11m52b_1023nih_42628_43215),
    .in1(out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_mule11m52b_1023nih_42628_43200),
    .in2(out_reg_14_reg_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_42628_43218 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i2_fu___float_mule11m52b_1023nih_42628_43218),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_78_i0_fu___float_mule11m52b_1023nih_42628_43215),
    .in2(out_const_35));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43228 (.out1(out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_42628_43228),
    .in1(out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_42628_46645));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43231 (.out1(out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_42628_43231),
    .in1(out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_42628_43228));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_42628_43234 (.out1(out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_42628_43234),
    .in1(out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_42628_43231),
    .in2(out_reg_1_reg_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43238 (.out1(out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_mule11m52b_1023nih_42628_43238),
    .in1(out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_42628_43196),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43244 (.out1(out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_42628_43244),
    .in1(out_lut_expr_FU_37_i0_fu___float_mule11m52b_1023nih_42628_46028));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_43247 (.out1(out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_42628_43247),
    .in1(out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_42628_43244));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43250 (.out1(out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_42628_43250),
    .in1(out_reg_15_reg_15),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_42628_43247));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(54),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_42628_43259 (.out1(out_ui_bit_and_expr_FU_64_0_64_73_i0_fu___float_mule11m52b_1023nih_42628_43259),
    .in1(out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_42628_43250),
    .in2(out_const_37));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43263 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i2_fu___float_mule11m52b_1023nih_42628_43263),
    .in1(out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_42628_43196),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_43266 (.out1(out_ui_bit_and_expr_FU_8_0_8_75_i0_fu___float_mule11m52b_1023nih_42628_43266),
    .in1(out_ui_rshift_expr_FU_64_0_64_109_i2_fu___float_mule11m52b_1023nih_42628_43263),
    .in2(out_const_15));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_43269 (.out1(out_UIdata_converter_FU_40_i0_fu___float_mule11m52b_1023nih_42628_43269),
    .in1(out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_42628_43228));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43272 (.out1(out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_42628_43272),
    .in1(out_reg_16_reg_16),
    .in2(out_UIdata_converter_FU_40_i0_fu___float_mule11m52b_1023nih_42628_43269));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(51),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43275 (.out1(out_ui_lshift_expr_FU_64_64_64_99_i1_fu___float_mule11m52b_1023nih_42628_43275),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i2_fu___float_mule11m52b_1023nih_42628_43218),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_42628_43247));
  ui_lshift_expr_FU #(.BITSIZE_in1(51),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43278 (.out1(out_ui_lshift_expr_FU_64_0_64_95_i1_fu___float_mule11m52b_1023nih_42628_43278),
    .in1(out_ui_lshift_expr_FU_64_64_64_99_i1_fu___float_mule11m52b_1023nih_42628_43275),
    .in2(out_const_1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_42628_43281 (.out1(out_ui_bit_ior_expr_FU_64_64_64_82_i0_fu___float_mule11m52b_1023nih_42628_43281),
    .in1(out_ui_lshift_expr_FU_64_0_64_95_i1_fu___float_mule11m52b_1023nih_42628_43278),
    .in2(out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_42628_43272));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_42628_43284 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i3_fu___float_mule11m52b_1023nih_42628_43284),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_82_i0_fu___float_mule11m52b_1023nih_42628_43281),
    .in2(out_const_35));
  UUdata_converter_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(12)) fu___float_mule11m52b_1023nih_42628_43288 (.out1(out_UUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_42628_43288),
    .in1(out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_42628_43234));
  ui_lshift_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43291 (.out1(out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_mule11m52b_1023nih_42628_43291),
    .in1(out_UUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_42628_43288),
    .in2(out_const_4));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_42628_43294 (.out1(out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_42628_43294),
    .in1(out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_mule11m52b_1023nih_42628_43291),
    .in2(out_ui_bit_and_expr_FU_64_0_64_72_i3_fu___float_mule11m52b_1023nih_42628_43284));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_42628_43409 (.out1(out_ui_bit_and_expr_FU_64_0_64_74_i0_fu___float_mule11m52b_1023nih_42628_43409),
    .in1(out_ui_bit_and_expr_FU_64_0_64_73_i0_fu___float_mule11m52b_1023nih_42628_43259),
    .in2(out_const_36));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43412 (.out1(out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_42628_43412),
    .in1(out_ui_bit_and_expr_FU_64_0_64_74_i0_fu___float_mule11m52b_1023nih_42628_43409),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43425 (.out1(out_UUdata_converter_FU_46_i0_fu___float_mule11m52b_1023nih_42628_43425),
    .in1(out_lut_expr_FU_45_i0_fu___float_mule11m52b_1023nih_42628_46042));
  ui_plus_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(1),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_42628_43460 (.out1(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_42628_43460),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_18_reg_18));
  ui_eq_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43466 (.out1(out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_42628_43466),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_42628_43294),
    .in2(out_const_39));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_43509 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i3_fu___float_mule11m52b_1023nih_42628_43509),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_42628_43460),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_42628_43512 (.out1(out_ui_bit_and_expr_FU_16_0_16_66_i1_fu___float_mule11m52b_1023nih_42628_43512),
    .in1(out_ui_rshift_expr_FU_64_0_64_109_i3_fu___float_mule11m52b_1023nih_42628_43509),
    .in2(out_const_28));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43515 (.out1(out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_42628_43515),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_16_0_16_66_i1_fu___float_mule11m52b_1023nih_42628_43512));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_mule11m52b_1023nih_42628_43553 (.out1(out_ui_bit_and_expr_FU_0_64_64_65_i0_fu___float_mule11m52b_1023nih_42628_43553),
    .in1(out_const_38),
    .in2(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_42628_43460));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_42628_43556 (.out1(out_ui_bit_ior_expr_FU_0_64_64_80_i0_fu___float_mule11m52b_1023nih_42628_43556),
    .in1(out_ui_bit_and_expr_FU_0_64_64_65_i0_fu___float_mule11m52b_1023nih_42628_43553),
    .in2(out_reg_0_reg_0));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_42628_43609 (.out1(out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_42628_43609),
    .in1(out_const_29),
    .in2(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_42628_42779));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43631 (.out1(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_42628_43631),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_42628_42756),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43634 (.out1(out_lut_expr_FU_13_i0_fu___float_mule11m52b_1023nih_42628_43634),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_42628_42879),
    .in3(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_42628_43631),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43639 (.out1(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_42628_43639),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_42628_42718),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_43642 (.out1(out_lut_expr_FU_11_i0_fu___float_mule11m52b_1023nih_42628_43642),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_42628_42793),
    .in3(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_42628_43639),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_44993 (.out1(out_lut_expr_FU_52_i0_fu___float_mule11m52b_1023nih_42628_44993),
    .in1(out_const_11),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_42628_46479),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_42628_46482),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_42628_46847),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_42628_46763),
    .in6(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_42628_46917),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_45216 (.out1(out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule11m52b_1023nih_42628_45216),
    .in1(out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule11m52b_1023nih_42628_43177),
    .in2(out_const_10));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_45225 (.out1(out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_mule11m52b_1023nih_42628_45225),
    .in1(out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule11m52b_1023nih_42628_45216),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_42628_45228 (.out1(out_ui_bit_and_expr_FU_32_0_32_71_i0_fu___float_mule11m52b_1023nih_42628_45228),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i2_fu___float_mule11m52b_1023nih_42628_43133),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(4)) fu___float_mule11m52b_1023nih_42628_45301 (.out1(out_ui_extract_bit_expr_FU_42_i0_fu___float_mule11m52b_1023nih_42628_45301),
    .in1(out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_42628_43234),
    .in2(out_const_17));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_45483 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i0_fu___float_mule11m52b_1023nih_42628_45483),
    .in1(out_lut_expr_FU_13_i0_fu___float_mule11m52b_1023nih_42628_43634),
    .in2(out_const_15),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_45492 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i1_fu___float_mule11m52b_1023nih_42628_45492),
    .in1(out_lut_expr_FU_11_i0_fu___float_mule11m52b_1023nih_42628_43642),
    .in2(out_const_15),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_in3(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_42628_45631 (.out1(out_ui_cond_expr_FU_16_16_16_16_84_i0_fu___float_mule11m52b_1023nih_42628_45631),
    .in1(out_lut_expr_FU_52_i0_fu___float_mule11m52b_1023nih_42628_44993),
    .in2(out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule11m52b_1023nih_42628_45650),
    .in3(out_const_30));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_45636 (.out1(out_lut_expr_FU_59_i0_fu___float_mule11m52b_1023nih_42628_45636),
    .in1(out_const_31),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_42628_46479),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_42628_46482),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_42628_46847),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_42628_46763),
    .in6(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_42628_46917),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_45650 (.out1(out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule11m52b_1023nih_42628_45650),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_42628_42779),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_45657 (.out1(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_42628_45657),
    .in1(out_ui_cond_expr_FU_16_16_16_16_84_i0_fu___float_mule11m52b_1023nih_42628_45631),
    .in2(out_const_18));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_45661 (.out1(out_lut_expr_FU_54_i0_fu___float_mule11m52b_1023nih_42628_45661),
    .in1(out_const_32),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_42628_46479),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_42628_46482),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_42628_46847),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_42628_46763),
    .in6(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_42628_46917),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_45664 (.out1(out_lut_expr_FU_57_i0_fu___float_mule11m52b_1023nih_42628_45664),
    .in1(out_const_24),
    .in2(out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_42628_46182),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_42628_43515),
    .in4(out_reg_11_reg_11),
    .in5(out_reg_10_reg_10),
    .in6(out_reg_19_reg_19),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_45677 (.out1(out_lut_expr_FU_58_i0_fu___float_mule11m52b_1023nih_42628_45677),
    .in1(out_const_12),
    .in2(out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_42628_46182),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_42628_43515),
    .in4(out_reg_11_reg_11),
    .in5(out_reg_10_reg_10),
    .in6(out_reg_19_reg_19),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_42628_45680 (.out1(out_ui_cond_expr_FU_64_64_64_64_85_i0_fu___float_mule11m52b_1023nih_42628_45680),
    .in1(out_lut_expr_FU_58_i0_fu___float_mule11m52b_1023nih_42628_45677),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_80_i0_fu___float_mule11m52b_1023nih_42628_43556),
    .in3(out_reg_0_reg_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_45686 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i2_fu___float_mule11m52b_1023nih_42628_45686),
    .in1(out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_42628_42898),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_86_i0_fu___float_mule11m52b_1023nih_42628_45483));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_42628_45692 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i3_fu___float_mule11m52b_1023nih_42628_45692),
    .in1(out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_42628_42820),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_86_i1_fu___float_mule11m52b_1023nih_42628_45492));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_in3(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_42628_45695 (.out1(out_ui_cond_expr_FU_16_16_16_16_84_i1_fu___float_mule11m52b_1023nih_42628_45695),
    .in1(out_lut_expr_FU_59_i0_fu___float_mule11m52b_1023nih_42628_45636),
    .in2(out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_42628_45709),
    .in3(out_ui_rshift_expr_FU_64_0_64_113_i1_fu___float_mule11m52b_1023nih_42628_45712));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_42628_45698 (.out1(out_ui_cond_expr_FU_64_64_64_64_85_i1_fu___float_mule11m52b_1023nih_42628_45698),
    .in1(out_lut_expr_FU_57_i0_fu___float_mule11m52b_1023nih_42628_45664),
    .in2(out_reg_6_reg_6),
    .in3(out_ui_cond_expr_FU_64_64_64_64_85_i0_fu___float_mule11m52b_1023nih_42628_45680));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_42628_45702 (.out1(out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_mule11m52b_1023nih_42628_45702),
    .in1(out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule11m52b_1023nih_42628_45726),
    .in2(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_42628_45706 (.out1(out_ui_lshift_expr_FU_8_0_8_100_i1_fu___float_mule11m52b_1023nih_42628_45706),
    .in1(out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule11m52b_1023nih_42628_45735),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_45709 (.out1(out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_42628_45709),
    .in1(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_42628_45657),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_45712 (.out1(out_ui_rshift_expr_FU_64_0_64_113_i1_fu___float_mule11m52b_1023nih_42628_45712),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_42628_43609),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_42628_45716 (.out1(out_ui_lshift_expr_FU_64_0_64_98_i1_fu___float_mule11m52b_1023nih_42628_45716),
    .in1(out_ui_cond_expr_FU_16_16_16_16_84_i1_fu___float_mule11m52b_1023nih_42628_45695),
    .in2(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_45719 (.out1(out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_42628_45719),
    .in1(out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_42628_42820));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_42628_45723 (.out1(out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_mule11m52b_1023nih_42628_45723),
    .in1(out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_42628_45719),
    .in2(out_const_22));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_42628_45726 (.out1(out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule11m52b_1023nih_42628_45726),
    .in1(out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_mule11m52b_1023nih_42628_45723),
    .in2(out_const_22));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_45729 (.out1(out_UUdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_42628_45729),
    .in1(out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_42628_42898));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_42628_45732 (.out1(out_ui_lshift_expr_FU_8_0_8_101_i1_fu___float_mule11m52b_1023nih_42628_45732),
    .in1(out_UUdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_42628_45729),
    .in2(out_const_22));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_42628_45735 (.out1(out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule11m52b_1023nih_42628_45735),
    .in1(out_ui_lshift_expr_FU_8_0_8_101_i1_fu___float_mule11m52b_1023nih_42628_45732),
    .in2(out_const_22));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_42628_45749 (.out1(out_ui_cond_expr_FU_64_64_64_64_85_i2_fu___float_mule11m52b_1023nih_42628_45749),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_9_reg_9),
    .in3(out_ui_cond_expr_FU_64_64_64_64_85_i1_fu___float_mule11m52b_1023nih_42628_45698));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_42628_45971 (.out1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_42628_45971),
    .in1(out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_42628_42738));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_42628_45973 (.out1(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_42628_45973),
    .in1(out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_42628_42753));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_42628_45975 (.out1(out_ASSIGN_UNSIGNED_FU_14_i0_fu___float_mule11m52b_1023nih_42628_45975),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_42628_43098));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_42628_45977 (.out1(out_ASSIGN_UNSIGNED_FU_15_i0_fu___float_mule11m52b_1023nih_42628_45977),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_42628_43104));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___float_mule11m52b_1023nih_42628_45979 (.out1(out_ASSIGN_UNSIGNED_FU_16_i0_fu___float_mule11m52b_1023nih_42628_45979),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_42628_43125));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___float_mule11m52b_1023nih_42628_45981 (.out1(out_ASSIGN_UNSIGNED_FU_17_i0_fu___float_mule11m52b_1023nih_42628_45981),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_42628_43129));
  lut_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_46002 (.out1(out_lut_expr_FU_23_i0_fu___float_mule11m52b_1023nih_42628_46002),
    .in1(out_const_20),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_42628_42800),
    .in3(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_42628_42793),
    .in4(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_42628_43639),
    .in5(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_42628_42797),
    .in6(out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_42628_42842),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_46021 (.out1(out_lut_expr_FU_31_i0_fu___float_mule11m52b_1023nih_42628_46021),
    .in1(out_const_20),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_42628_42886),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_42628_42879),
    .in4(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_42628_43631),
    .in5(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_42628_42883),
    .in6(out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_42628_42920),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_46028 (.out1(out_lut_expr_FU_37_i0_fu___float_mule11m52b_1023nih_42628_46028),
    .in1(out_const_7),
    .in2(out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_42628_46645),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_46042 (.out1(out_lut_expr_FU_45_i0_fu___float_mule11m52b_1023nih_42628_46042),
    .in1(out_const_23),
    .in2(out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_42628_43412),
    .in3(out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_42628_46475),
    .in4(out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_42628_46308),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_46099 (.out1(out_lut_expr_FU_19_i0_fu___float_mule11m52b_1023nih_42628_46099),
    .in1(out_const_8),
    .in2(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_42628_42797),
    .in3(out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_42628_42842),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_46103 (.out1(out_lut_expr_FU_27_i0_fu___float_mule11m52b_1023nih_42628_46103),
    .in1(out_const_8),
    .in2(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_42628_42883),
    .in3(out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_42628_42920),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_42628_46116 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule11m52b_1023nih_42628_46116),
    .in1(in_port_a),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_42628_46120 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule11m52b_1023nih_42628_46120),
    .in1(in_port_b),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_42628_46182 (.out1(out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_42628_46182),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_42628_43460),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_42628_46308 (.out1(out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_42628_46308),
    .in1(out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_42628_43250),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_42628_46475 (.out1(out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_42628_46475),
    .in1(out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_42628_43272),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_42628_46479 (.out1(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_42628_46479),
    .in1(out_bit_and_expr_FU_8_8_8_61_i1_fu___float_mule11m52b_1023nih_42628_43017),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_42628_46482 (.out1(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_42628_46482),
    .in1(out_bit_and_expr_FU_8_8_8_61_i2_fu___float_mule11m52b_1023nih_42628_43032),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_42628_46645 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_42628_46645),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_42628_43173),
    .in2(out_const_14));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_42628_46763 (.out1(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_42628_46763),
    .in1(out_bit_and_expr_FU_8_8_8_61_i0_fu___float_mule11m52b_1023nih_42628_42990),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_42628_46847 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_42628_46847),
    .in1(out_ui_bit_and_expr_FU_1_1_1_69_i0_fu___float_mule11m52b_1023nih_42628_42972),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(46),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_46917 (.out1(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_42628_46917),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_42628_42800),
    .in3(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_42628_42793),
    .in4(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_42628_43639),
    .in5(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_42628_42886),
    .in6(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_42628_42879),
    .in7(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_42628_43631),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_46924 (.out1(out_lut_expr_FU_55_i0_fu___float_mule11m52b_1023nih_42628_46924),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_42628_46479),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_42628_46482),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_42628_46847),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_42628_46763),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_42628_46928 (.out1(out_lut_expr_FU_56_i0_fu___float_mule11m52b_1023nih_42628_46928),
    .in1(out_const_25),
    .in2(out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_42628_43412),
    .in3(out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_42628_46475),
    .in4(out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_42628_46308),
    .in5(out_ui_extract_bit_expr_FU_42_i0_fu___float_mule11m52b_1023nih_42628_45301),
    .in6(out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_42628_43466),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_42628_42779),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(13),
    .BITSIZE_out1(13)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_plus_expr_FU_0_16_16_16_118_i0_fu___float_mule11m52b_1023nih_42628_43060),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_42628_46917),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_55_i0_fu___float_mule11m52b_1023nih_42628_46924),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(22),
    .BITSIZE_out1(22)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i3_fu___float_mule11m52b_1023nih_42628_43152),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i4_fu___float_mule11m52b_1023nih_42628_43163),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_16_0_16_68_i0_fu___float_mule11m52b_1023nih_42628_43212),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_mule11m52b_1023nih_42628_43238),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_8_0_8_75_i0_fu___float_mule11m52b_1023nih_42628_43266),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_42628_43294),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_46_i0_fu___float_mule11m52b_1023nih_42628_43425),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_56_i0_fu___float_mule11m52b_1023nih_42628_46928),
    .wenable(wrenable_reg_19));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i2_fu___float_mule11m52b_1023nih_42628_43137),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i1_fu___float_mule11m52b_1023nih_42628_43141),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i2_fu___float_mule11m52b_1023nih_42628_43156),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(42),
    .BITSIZE_out1(42)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i3_fu___float_mule11m52b_1023nih_42628_43167),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_42628_43609),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_71_i0_fu___float_mule11m52b_1023nih_42628_45228),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_54_i0_fu___float_mule11m52b_1023nih_42628_45661),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_98_i1_fu___float_mule11m52b_1023nih_42628_45716),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_ui_cond_expr_FU_64_64_64_64_85_i2_fu___float_mule11m52b_1023nih_42628_45749;

endmodule

// FSM based controller description for __float_mule11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_mule11m52b_1023nih(done_port,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  clock,
  reset,
  start_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [3:0] S_0 = 4'b0001,
    S_1 = 4'b0010,
    S_2 = 4'b0100,
    S_3 = 4'b1000;
  reg [3:0] _present_state=S_0, _next_state;
  reg done_port;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          _next_state = S_3;
          done_port = 1'b1;
        end
      S_3 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for __float_mule11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_mule11m52b_1023nih(clock,
  reset,
  start_port,
  done_port,
  a,
  b,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [63:0] a;
  input [63:0] b;
  // OUT
  output done_port;
  output [63:0] return_port;
  // Component and signal declarations
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___float_mule11m52b_1023nih Controller_i (.done_port(done_delayed_REG_signal_in),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___float_mule11m52b_1023nih Datapath_i (.return_port(return_port),
    .clock(clock),
    .reset(reset),
    .in_port_a(a),
    .in_port_b(b),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// Datapath RTL description for _Z21matrix_multiplicationPKdS0_Pdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath__Z21matrix_multiplicationPKdS0_Pdjjj(clock,
  reset,
  in_port_A,
  in_port_B,
  in_port_C,
  in_port_n,
  in_port_m,
  in_port_w,
  M_Rdata_ram,
  M_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  fuselector_BMEMORY_CTRLN_15_i0_LOAD,
  fuselector_BMEMORY_CTRLN_15_i0_STORE,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0,
  selector_MUX_20_reg_0_0_0_0,
  selector_MUX_25_reg_2_0_0_0,
  selector_MUX_28_reg_5_0_0_0,
  selector_MUX_29_reg_6_0_0_0,
  selector_MUX_30_reg_7_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_B;
  input [31:0] in_port_C;
  input [31:0] in_port_n;
  input [31:0] in_port_m;
  input [31:0] in_port_w;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_15_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_15_i0_STORE;
  input selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663;
  input selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667;
  input selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0;
  input selector_MUX_20_reg_0_0_0_0;
  input selector_MUX_25_reg_2_0_0_0;
  input selector_MUX_28_reg_5_0_0_0;
  input selector_MUX_29_reg_6_0_0_0;
  input selector_MUX_30_reg_7_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715;
  output OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719;
  output OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721;
  output OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723;
  output OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663;
  output OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667;
  // Component and signal declarations
  wire [63:0] null_out_signal_BMEMORY_CTRLN_15_i0_out1_1;
  wire [63:0] out_BMEMORY_CTRLN_15_i0_BMEMORY_CTRLN_15_i0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0;
  wire [31:0] out_MUX_20_reg_0_0_0_0;
  wire [31:0] out_MUX_25_reg_2_0_0_0;
  wire [63:0] out_MUX_28_reg_5_0_0_0;
  wire [31:0] out_MUX_29_reg_6_0_0_0;
  wire [28:0] out_MUX_30_reg_7_0_0_0;
  wire [63:0] out___float_adde11m52b_1023nih_23_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663;
  wire [63:0] out___float_mule11m52b_1023nih_24_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667;
  wire out_const_0;
  wire [7:0] out_const_1;
  wire out_const_2;
  wire [1:0] out_const_3;
  wire [7:0] out_const_4;
  wire [28:0] out_conv_out_const_0_1_29;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [6:0] out_conv_out_const_1_8_7;
  wire [28:0] out_conv_out_reg_6_reg_6_32_29;
  wire out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_45747;
  wire out_read_cond_FU_13_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721;
  wire out_read_cond_FU_14_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723;
  wire out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715;
  wire out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719;
  wire [31:0] out_reg_0_reg_0;
  wire [63:0] out_reg_10_reg_10;
  wire [63:0] out_reg_11_reg_11;
  wire [63:0] out_reg_12_reg_12;
  wire [28:0] out_reg_1_reg_1;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [63:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [28:0] out_reg_7_reg_7;
  wire [28:0] out_reg_8_reg_8;
  wire out_reg_9_reg_9;
  wire out_ui_eq_expr_FU_32_0_32_16_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42604;
  wire out_ui_eq_expr_FU_32_0_32_16_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42606;
  wire out_ui_eq_expr_FU_32_0_32_16_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42608;
  wire out_ui_le_expr_FU_32_32_32_17_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42610;
  wire out_ui_le_expr_FU_32_32_32_17_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42612;
  wire out_ui_le_expr_FU_32_32_32_17_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42614;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_18_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36637;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_18_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36680;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_18_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36699;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_19_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36645;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_19_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36705;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_20_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36652;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_20_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36660;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_20_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36689;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_21_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36641;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_21_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36683;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_21_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36702;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_22_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36632;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_22_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36675;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_22_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36694;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [28:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [28:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire [63:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3;
  wire s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663;
  wire s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667;
  
  BMEMORY_CTRLN #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(32),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(32),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_15_i0 (.out1({null_out_signal_BMEMORY_CTRLN_15_i0_out1_1,
      out_BMEMORY_CTRLN_15_i0_BMEMORY_CTRLN_15_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0}),
    .in3({7'b0000000,
      out_conv_out_const_1_8_7}),
    .in4({1'b0,
      out_const_2}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_15_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_15_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_15_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0),
    .in1(out_reg_3_reg_3),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_22_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36632));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_15_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_22_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36675),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_22_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36694));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_15_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_20_reg_0_0_0_0 (.out1(out_MUX_20_reg_0_0_0_0),
    .sel(selector_MUX_20_reg_0_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_20_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36652),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_25_reg_2_0_0_0 (.out1(out_MUX_25_reg_2_0_0_0),
    .sel(selector_MUX_25_reg_2_0_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_28_reg_5_0_0_0 (.out1(out_MUX_28_reg_5_0_0_0),
    .sel(selector_MUX_28_reg_5_0_0_0),
    .in1(out_BMEMORY_CTRLN_15_i0_BMEMORY_CTRLN_15_i0),
    .in2(out___float_adde11m52b_1023nih_23_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_29_reg_6_0_0_0 (.out1(out_MUX_29_reg_6_0_0_0),
    .sel(selector_MUX_29_reg_6_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_20_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36689),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) MUX_30_reg_7_0_0_0 (.out1(out_MUX_30_reg_7_0_0_0),
    .sel(selector_MUX_30_reg_7_0_0_0),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in2(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_29));
  UUdata_converter_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_conv_out_reg_6_reg_6_32_29));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_3 (.out1(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3),
    .in1(out_reg_5_reg_5));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111110)) const_4 (.out1(out_const_4));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(29)) conv_out_const_0_1_29 (.out1(out_conv_out_const_0_1_29),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_1_8_7 (.out1(out_conv_out_const_1_8_7),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) conv_out_reg_6_reg_6_32_29 (.out1(out_conv_out_reg_6_reg_6_32_29),
    .in1(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36632 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_22_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36632),
    .in1(in_port_C),
    .in2(out_ui_lshift_expr_FU_32_0_32_18_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36637));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36637 (.out1(out_ui_lshift_expr_FU_32_0_32_18_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36637),
    .in1(out_ui_plus_expr_FU_32_32_32_21_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36641),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36641 (.out1(out_ui_plus_expr_FU_32_32_32_21_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36641),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_2_reg_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36645 (.out1(out_ui_mult_expr_FU_32_32_32_0_19_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36645),
    .clock(clock),
    .in1(in_port_n),
    .in2(out_reg_0_reg_0));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36652 (.out1(out_ui_plus_expr_FU_32_0_32_20_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36652),
    .in1(out_reg_0_reg_0),
    .in2(out_const_2));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36660 (.out1(out_ui_plus_expr_FU_32_0_32_20_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36660),
    .in1(out_reg_2_reg_2),
    .in2(out_const_2));
  __float_adde11m52b_1023nih fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663 (.done_port(s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663),
    .return_port(out___float_adde11m52b_1023nih_23_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663),
    .a(out_reg_12_reg_12),
    .b(out_reg_5_reg_5));
  __float_mule11m52b_1023nih fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667 (.done_port(s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667),
    .return_port(out___float_mule11m52b_1023nih_24_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667),
    .a(out_reg_10_reg_10),
    .b(out_reg_11_reg_11));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36675 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_22_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36675),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_18_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36680));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36680 (.out1(out_ui_lshift_expr_FU_32_0_32_18_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36680),
    .in1(out_ui_plus_expr_FU_32_32_32_21_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36683),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36683 (.out1(out_ui_plus_expr_FU_32_32_32_21_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36683),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_6_reg_6));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36689 (.out1(out_ui_plus_expr_FU_32_0_32_20_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36689),
    .in1(out_reg_6_reg_6),
    .in2(out_const_2));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36694 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_22_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36694),
    .in1(in_port_B),
    .in2(out_ui_lshift_expr_FU_32_0_32_18_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36699));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36699 (.out1(out_ui_lshift_expr_FU_32_0_32_18_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36699),
    .in1(out_ui_plus_expr_FU_32_32_32_21_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36702),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36702 (.out1(out_ui_plus_expr_FU_32_32_32_21_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36702),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_2_reg_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36705 (.out1(out_ui_mult_expr_FU_32_32_32_0_19_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36705),
    .clock(clock),
    .in1(in_port_w),
    .in2(out_reg_7_reg_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715 (.out1(out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715),
    .in1(out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_45747));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719 (.out1(out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719),
    .in1(out_ui_le_expr_FU_32_32_32_17_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42610));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721 (.out1(out_read_cond_FU_13_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721),
    .in1(out_reg_9_reg_9));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723 (.out1(out_read_cond_FU_14_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723),
    .in1(out_ui_le_expr_FU_32_32_32_17_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42614));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42604 (.out1(out_ui_eq_expr_FU_32_0_32_16_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42604),
    .in1(in_port_n),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42606 (.out1(out_ui_eq_expr_FU_32_0_32_16_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42606),
    .in1(in_port_w),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42608 (.out1(out_ui_eq_expr_FU_32_0_32_16_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42608),
    .in1(in_port_m),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42610 (.out1(out_ui_le_expr_FU_32_32_32_17_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42610),
    .in1(in_port_n),
    .in2(out_reg_0_reg_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42612 (.out1(out_ui_le_expr_FU_32_32_32_17_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42612),
    .in1(in_port_m),
    .in2(out_ui_plus_expr_FU_32_0_32_20_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36689));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42614 (.out1(out_ui_le_expr_FU_32_32_32_17_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42614),
    .in1(in_port_w),
    .in2(out_reg_4_reg_4));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_45747 (.out1(out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_45747),
    .in1(out_const_4),
    .in2(out_ui_eq_expr_FU_32_0_32_16_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42604),
    .in3(out_ui_eq_expr_FU_32_0_32_16_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42606),
    .in4(out_ui_eq_expr_FU_32_0_32_16_i2_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42608),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_20_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_19_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36645),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_15_i0_BMEMORY_CTRLN_15_i0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_15_i0_BMEMORY_CTRLN_15_i0),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out___float_mule11m52b_1023nih_24_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_25_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_22_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36632),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_20_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36660),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_28_reg_5_0_0_0),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_29_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_30_reg_7_0_0_0),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_19_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36705),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_le_expr_FU_32_32_32_17_i1_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_42612),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715 = out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715;
  assign OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719 = out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719;
  assign OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721 = out_read_cond_FU_13_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721;
  assign OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723 = out_read_cond_FU_14_i0_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723;
  assign OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663 = s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663;
  assign OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667 = s_done_fu__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667;

endmodule

// FSM based controller description for _Z21matrix_multiplicationPKdS0_Pdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z21matrix_multiplicationPKdS0_Pdjjj(done_port,
  fuselector_BMEMORY_CTRLN_15_i0_LOAD,
  fuselector_BMEMORY_CTRLN_15_i0_STORE,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0,
  selector_MUX_20_reg_0_0_0_0,
  selector_MUX_25_reg_2_0_0_0,
  selector_MUX_28_reg_5_0_0_0,
  selector_MUX_29_reg_6_0_0_0,
  selector_MUX_30_reg_7_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721,
  OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715;
  input OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719;
  input OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721;
  input OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723;
  input OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663;
  input OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_15_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_15_i0_STORE;
  output selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663;
  output selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667;
  output selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0;
  output selector_MUX_20_reg_0_0_0_0;
  output selector_MUX_25_reg_2_0_0_0;
  output selector_MUX_28_reg_5_0_0_0;
  output selector_MUX_29_reg_6_0_0_0;
  output selector_MUX_30_reg_7_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [19:0] S_0 = 20'b00000000000000000001,
    S_18 = 20'b01000000000000000000,
    S_1 = 20'b00000000000000000010,
    S_2 = 20'b00000000000000000100,
    S_3 = 20'b00000000000000001000,
    S_5 = 20'b00000000000000100000,
    S_6 = 20'b00000000000001000000,
    S_7 = 20'b00000000000010000000,
    S_8 = 20'b00000000000100000000,
    S_9 = 20'b00000000001000000000,
    S_10 = 20'b00000000010000000000,
    S_11 = 20'b00000000100000000000,
    S_12 = 20'b00000001000000000000,
    S_13 = 20'b00000010000000000000,
    S_14 = 20'b00000100000000000000,
    S_15 = 20'b00001000000000000000,
    S_16 = 20'b00010000000000000000,
    S_17 = 20'b00100000000000000000,
    S_4 = 20'b00000000000000010000,
    S_19 = 20'b10000000000000000000;
  reg [19:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_15_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_15_i0_STORE;
  reg selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663;
  reg selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667;
  reg selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0;
  reg selector_MUX_20_reg_0_0_0_0;
  reg selector_MUX_25_reg_2_0_0_0;
  reg selector_MUX_28_reg_5_0_0_0;
  reg selector_MUX_29_reg_6_0_0_0;
  reg selector_MUX_30_reg_7_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_15_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_15_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663 = 1'b0;
    selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0 = 1'b0;
    selector_MUX_20_reg_0_0_0_0 = 1'b0;
    selector_MUX_25_reg_2_0_0_0 = 1'b0;
    selector_MUX_28_reg_5_0_0_0 = 1'b0;
    selector_MUX_29_reg_6_0_0_0 = 1'b0;
    selector_MUX_30_reg_7_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          if (OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_18;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_18 :
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_MUX_20_reg_0_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          fuselector_BMEMORY_CTRLN_15_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          selector_MUX_28_reg_5_0_0_0 = 1'b1;
          selector_MUX_30_reg_7_0_0_0 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          fuselector_BMEMORY_CTRLN_15_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1 = 1'b1;
          selector_MUX_29_reg_6_0_0_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          fuselector_BMEMORY_CTRLN_15_i0_LOAD = 1'b1;
          wrenable_reg_10 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          wrenable_reg_11 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          _next_state = S_10;
        end
      S_10 :
        begin
          _next_state = S_11;
        end
      S_11 :
        begin
          wrenable_reg_12 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          _next_state = S_14;
        end
      S_14 :
        begin
          _next_state = S_15;
        end
      S_15 :
        begin
          wrenable_reg_5 = 1'b1;
          _next_state = S_16;
        end
      S_16 :
        begin
          fuselector_BMEMORY_CTRLN_15_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0 = 1'b1;
          wrenable_reg_7 = 1'b1;
          if (OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721 == 1'b1)
            begin
              _next_state = S_17;
              wrenable_reg_7 = 1'b0;
            end
          else
            begin
              _next_state = S_5;
            end
        end
      S_17 :
        begin
          selector_MUX_25_reg_2_0_0_0 = 1'b1;
          wrenable_reg_2 = 1'b1;
          if (OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723 == 1'b1)
            begin
              _next_state = S_4;
              selector_MUX_25_reg_2_0_0_0 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
          else
            begin
              _next_state = S_2;
            end
        end
      S_4 :
        begin
          if (OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_19;
              done_port = 1'b1;
            end
        end
      S_19 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for _Z21matrix_multiplicationPKdS0_Pdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __Z21matrix_multiplicationPKdS0_Pdjjj(clock,
  reset,
  start_port,
  done_port,
  A,
  B,
  C,
  n,
  m,
  w,
  M_Rdata_ram,
  M_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] A;
  input [31:0] B;
  input [31:0] C;
  input [31:0] n;
  input [31:0] m;
  input [31:0] w;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715;
  wire OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719;
  wire OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721;
  wire OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723;
  wire OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663;
  wire OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_15_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_15_i0_STORE;
  wire selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663;
  wire selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667;
  wire selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0;
  wire selector_MUX_20_reg_0_0_0_0;
  wire selector_MUX_25_reg_2_0_0_0;
  wire selector_MUX_28_reg_5_0_0_0;
  wire selector_MUX_29_reg_6_0_0_0;
  wire selector_MUX_30_reg_7_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller__Z21matrix_multiplicationPKdS0_Pdjjj Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_15_i0_LOAD(fuselector_BMEMORY_CTRLN_15_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_15_i0_STORE(fuselector_BMEMORY_CTRLN_15_i0_STORE),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0),
    .selector_MUX_20_reg_0_0_0_0(selector_MUX_20_reg_0_0_0_0),
    .selector_MUX_25_reg_2_0_0_0(selector_MUX_25_reg_2_0_0_0),
    .selector_MUX_28_reg_5_0_0_0(selector_MUX_28_reg_5_0_0_0),
    .selector_MUX_29_reg_6_0_0_0(selector_MUX_29_reg_6_0_0_0),
    .selector_MUX_30_reg_7_0_0_0(selector_MUX_30_reg_7_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663(OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667(OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z21matrix_multiplicationPKdS0_Pdjjj Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36715),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36719),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36721),
    .OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723(OUT_CONDITION__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36723),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663(OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667(OUT_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667),
    .clock(clock),
    .reset(reset),
    .in_port_A(A),
    .in_port_B(B),
    .in_port_C(C),
    .in_port_n(n),
    .in_port_m(m),
    .in_port_w(w),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_15_i0_LOAD(fuselector_BMEMORY_CTRLN_15_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_15_i0_STORE(fuselector_BMEMORY_CTRLN_15_i0_STORE),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36663),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKdS0_Pdjjj_35433_36667),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_15_i0_1_1_0),
    .selector_MUX_20_reg_0_0_0_0(selector_MUX_20_reg_0_0_0_0),
    .selector_MUX_25_reg_2_0_0_0(selector_MUX_25_reg_2_0_0_0),
    .selector_MUX_28_reg_5_0_0_0(selector_MUX_28_reg_5_0_0_0),
    .selector_MUX_29_reg_6_0_0_0(selector_MUX_29_reg_6_0_0_0),
    .selector_MUX_30_reg_7_0_0_0(selector_MUX_30_reg_7_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Minimal interface for function: _Z21matrix_multiplicationPKdS0_Pdjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _Z21matrix_multiplicationPKdS0_Pdjjj(clock,
  reset,
  start_port,
  A,
  B,
  C,
  n,
  m,
  w,
  M_Rdata_ram,
  M_DataRdy,
  done_port,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] A;
  input [31:0] B;
  input [31:0] C;
  input [31:0] n;
  input [31:0] m;
  input [31:0] w;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  // Component and signal declarations
  
  __Z21matrix_multiplicationPKdS0_Pdjjj __Z21matrix_multiplicationPKdS0_Pdjjj_i0 (.done_port(done_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .A(A),
    .B(B),
    .C(C),
    .n(n),
    .m(m),
    .w(w),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram({1'b0,
      1'b0}),
    .Min_we_ram({1'b0,
      1'b0}),
    .Min_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Min_data_ram_size({7'b0000000,
      7'b0000000}));

endmodule


