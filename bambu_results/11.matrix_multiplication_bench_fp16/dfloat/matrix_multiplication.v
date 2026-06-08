// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-04-16T21:42:15
// Bambu executed with: bambu --top-fname=matrix_multiplication -DFLOAT lib_cpu.cpp 
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

// Datapath RTL description for __float_adde8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_adde8m23b_127nih(clock,
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
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [63:0] return_port;
  // Component and signal declarations
  wire [4:0] out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_43704_47598;
  wire [7:0] out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_43704_47596;
  wire [0:0] out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_43704_44439;
  wire [0:0] out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_43704_44460;
  wire [0:0] out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_43704_44480;
  wire [0:0] out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_43704_44500;
  wire [26:0] out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_43704_43863;
  wire [31:0] out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_43704_43795;
  wire [4:0] out_IUdata_converter_FU_50_i0_fu___float_adde8m23b_127nih_43704_44177;
  wire signed [1:0] out_UIdata_converter_FU_2_i0_fu___float_adde8m23b_127nih_43704_43786;
  wire signed [1:0] out_UIdata_converter_FU_49_i0_fu___float_adde8m23b_127nih_43704_44168;
  wire signed [1:0] out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_43704_45901;
  wire signed [1:0] out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_43704_45911;
  wire signed [1:0] out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_43704_45920;
  wire signed [1:0] out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_43704_45929;
  wire signed [1:0] out_UIdata_converter_FU_9_i0_fu___float_adde8m23b_127nih_43704_43854;
  wire out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_43704_45938;
  wire out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_43704_44738;
  wire out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_43704_47594;
  wire out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_43704_47588;
  wire out_UUdata_converter_FU_43_i0_fu___float_adde8m23b_127nih_43704_43954;
  wire out_UUdata_converter_FU_44_i0_fu___float_adde8m23b_127nih_43704_43968;
  wire [4:0] out_UUdata_converter_FU_51_i0_fu___float_adde8m23b_127nih_43704_44180;
  wire [4:0] out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_43704_44189;
  wire out_UUdata_converter_FU_54_i0_fu___float_adde8m23b_127nih_43704_44261;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [5:0] out_const_10;
  wire [5:0] out_const_11;
  wire [6:0] out_const_12;
  wire out_const_13;
  wire [1:0] out_const_14;
  wire [2:0] out_const_15;
  wire [3:0] out_const_16;
  wire [4:0] out_const_17;
  wire [15:0] out_const_18;
  wire [63:0] out_const_19;
  wire [2:0] out_const_2;
  wire [56:0] out_const_20;
  wire [63:0] out_const_21;
  wire [4:0] out_const_22;
  wire [38:0] out_const_23;
  wire [21:0] out_const_24;
  wire [53:0] out_const_25;
  wire [28:0] out_const_26;
  wire [3:0] out_const_27;
  wire [4:0] out_const_28;
  wire [7:0] out_const_29;
  wire [3:0] out_const_3;
  wire [31:0] out_const_30;
  wire [63:0] out_const_31;
  wire [63:0] out_const_32;
  wire [28:0] out_const_33;
  wire [44:0] out_const_34;
  wire [4:0] out_const_35;
  wire [2:0] out_const_36;
  wire [3:0] out_const_37;
  wire [4:0] out_const_38;
  wire [54:0] out_const_39;
  wire [4:0] out_const_4;
  wire [4:0] out_const_40;
  wire [30:0] out_const_41;
  wire [4:0] out_const_42;
  wire [4:0] out_const_43;
  wire [1:0] out_const_44;
  wire [2:0] out_const_45;
  wire [3:0] out_const_46;
  wire [4:0] out_const_47;
  wire [6:0] out_const_48;
  wire [37:0] out_const_49;
  wire [5:0] out_const_5;
  wire [4:0] out_const_50;
  wire [10:0] out_const_51;
  wire [26:0] out_const_52;
  wire [58:0] out_const_53;
  wire [14:0] out_const_54;
  wire [3:0] out_const_55;
  wire [4:0] out_const_56;
  wire [4:0] out_const_57;
  wire [14:0] out_const_58;
  wire [30:0] out_const_59;
  wire [4:0] out_const_6;
  wire [62:0] out_const_60;
  wire [2:0] out_const_61;
  wire [3:0] out_const_62;
  wire [4:0] out_const_63;
  wire [7:0] out_const_64;
  wire [4:0] out_const_65;
  wire [15:0] out_const_66;
  wire [31:0] out_const_67;
  wire [31:0] out_const_68;
  wire [3:0] out_const_69;
  wire [5:0] out_const_7;
  wire [4:0] out_const_70;
  wire [51:0] out_const_71;
  wire [63:0] out_const_72;
  wire [63:0] out_const_73;
  wire [30:0] out_const_74;
  wire [4:0] out_const_75;
  wire [5:0] out_const_76;
  wire [7:0] out_const_77;
  wire [7:0] out_const_78;
  wire [63:0] out_const_79;
  wire [5:0] out_const_8;
  wire [15:0] out_const_80;
  wire [22:0] out_const_81;
  wire [25:0] out_const_82;
  wire [26:0] out_const_83;
  wire [30:0] out_const_84;
  wire [63:0] out_const_85;
  wire [63:0] out_const_86;
  wire [2:0] out_const_9;
  wire [31:0] out_conv_in_port_a_64_32;
  wire [31:0] out_conv_in_port_b_64_32;
  wire [63:0] out_conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43704_44905_32_64;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_144_i0_fu___float_adde8m23b_127nih_43704_44171;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_43704_45905;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_43704_45914;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_43704_45923;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_43704_45932;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_146_i0_fu___float_adde8m23b_127nih_43704_43789;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_146_i1_fu___float_adde8m23b_127nih_43704_43857;
  wire out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_43704_50748;
  wire out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_43704_50752;
  wire out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_43704_50755;
  wire out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_43704_50759;
  wire out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_43704_50763;
  wire out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_43704_50767;
  wire out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_43704_50770;
  wire out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_43704_44613;
  wire out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_43704_50776;
  wire out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_43704_50779;
  wire out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_43704_50782;
  wire out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_43704_50786;
  wire out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_43704_47897;
  wire out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_43704_50791;
  wire out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_43704_50795;
  wire out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_43704_50799;
  wire out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_43704_50802;
  wire out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_43704_50806;
  wire out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_43704_50810;
  wire out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_43704_50814;
  wire out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_43704_50817;
  wire out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_43704_50821;
  wire out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_43704_50825;
  wire out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_43704_50829;
  wire out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_43704_45793;
  wire out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_43704_50833;
  wire out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_43704_45815;
  wire out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_43704_45862;
  wire out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_43704_48014;
  wire out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_43704_45878;
  wire out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_43704_45966;
  wire out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_43704_48003;
  wire out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_43704_50844;
  wire out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_43704_48010;
  wire out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_43704_50676;
  wire out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_43704_50680;
  wire out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_43704_50684;
  wire out_lut_expr_FU_30_i0_fu___float_adde8m23b_127nih_43704_43910;
  wire out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_43704_50689;
  wire out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_43704_50693;
  wire out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_43704_50697;
  wire out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_43704_43918;
  wire out_lut_expr_FU_48_i0_fu___float_adde8m23b_127nih_43704_44165;
  wire out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_43704_44220;
  wire out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_43704_50705;
  wire out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_43704_50709;
  wire out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_43704_50713;
  wire out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089;
  wire out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_43704_50718;
  wire out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_43704_50722;
  wire out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_43704_50725;
  wire out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_43704_50728;
  wire out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093;
  wire out_lut_expr_FU_8_i0_fu___float_adde8m23b_127nih_43704_43851;
  wire out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_43704_50732;
  wire out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_43704_50735;
  wire out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_43704_50739;
  wire out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097;
  wire out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_43704_50743;
  wire out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_43704_45151;
  wire out_reg_0_reg_0;
  wire out_reg_10_reg_10;
  wire out_reg_11_reg_11;
  wire out_reg_12_reg_12;
  wire out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire out_reg_18_reg_18;
  wire out_reg_19_reg_19;
  wire out_reg_1_reg_1;
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
  wire [22:0] out_reg_2_reg_2;
  wire out_reg_30_reg_30;
  wire [7:0] out_reg_31_reg_31;
  wire [22:0] out_reg_32_reg_32;
  wire out_reg_33_reg_33;
  wire out_reg_34_reg_34;
  wire out_reg_35_reg_35;
  wire out_reg_36_reg_36;
  wire out_reg_37_reg_37;
  wire [24:0] out_reg_3_reg_3;
  wire [1:0] out_reg_4_reg_4;
  wire out_reg_5_reg_5;
  wire out_reg_6_reg_6;
  wire [7:0] out_reg_7_reg_7;
  wire out_reg_8_reg_8;
  wire out_reg_9_reg_9;
  wire signed [0:0] out_rshift_expr_FU_32_0_32_147_i0_fu___float_adde8m23b_127nih_43704_44174;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_43704_45908;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_43704_45917;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_43704_45926;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_43704_45935;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_149_i0_fu___float_adde8m23b_127nih_43704_43792;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_149_i1_fu___float_adde8m23b_127nih_43704_43860;
  wire [25:0] out_ui_bit_and_expr_FU_0_32_32_150_i0_fu___float_adde8m23b_127nih_43704_44236;
  wire [26:0] out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_43704_44269;
  wire [15:0] out_ui_bit_and_expr_FU_16_0_16_152_i0_fu___float_adde8m23b_127nih_43704_44304;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_153_i0_fu___float_adde8m23b_127nih_43704_43767;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_153_i1_fu___float_adde8m23b_127nih_43704_43774;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_43704_43820;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_43704_43877;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i2_fu___float_adde8m23b_127nih_43704_44699;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_43704_44773;
  wire [26:0] out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_43704_44255;
  wire [31:0] out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801;
  wire [23:0] out_ui_bit_and_expr_FU_32_32_32_156_i1_fu___float_adde8m23b_127nih_43704_44207;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_43704_43832;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i1_fu___float_adde8m23b_127nih_43704_43883;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_157_i2_fu___float_adde8m23b_127nih_43704_43984;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i3_fu___float_adde8m23b_127nih_43704_44686;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_43704_44768;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_158_i0_fu___float_adde8m23b_127nih_43704_44186;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_43704_45606;
  wire [26:0] out_ui_bit_ior_concat_expr_FU_160_i0_fu___float_adde8m23b_127nih_43704_44258;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_161_i0_fu___float_adde8m23b_127nih_43704_43960;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_162_i0_fu___float_adde8m23b_127nih_43704_43974;
  wire [30:0] out_ui_bit_ior_expr_FU_0_32_32_163_i0_fu___float_adde8m23b_127nih_43704_44704;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_43704_44902;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43704_44905;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde8m23b_127nih_43704_44466;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde8m23b_127nih_43704_44506;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu___float_adde8m23b_127nih_43704_44509;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu___float_adde8m23b_127nih_43704_44514;
  wire [22:0] out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_43704_44874;
  wire [4:0] out_ui_bit_ior_expr_FU_8_8_8_171_i0_fu___float_adde8m23b_127nih_43704_44183;
  wire [25:0] out_ui_bit_not_expr_FU_32_32_172_i0_fu___float_adde8m23b_127nih_43704_44204;
  wire [31:0] out_ui_bit_xor_expr_FU_32_32_32_173_i0_fu___float_adde8m23b_127nih_43704_43798;
  wire [30:0] out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_43704_43804;
  wire [30:0] out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_43704_43809;
  wire [26:0] out_ui_bit_xor_expr_FU_32_32_32_173_i3_fu___float_adde8m23b_127nih_43704_44241;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_43704_45827;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_43704_45839;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_43704_45843;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_43704_45851;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_43704_45857;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_43704_45875;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_43704_45884;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_43704_45893;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_43704_45970;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_43704_47592;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_43704_45823;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_43704_45865;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_43704_45873;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_43704_45891;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_43704_45968;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_43704_47590;
  wire out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085;
  wire out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_43704_44217;
  wire out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_43704_48962;
  wire out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43704_48965;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_43704_48969;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43704_48972;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43704_48976;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43704_48979;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_43704_48983;
  wire out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43704_48986;
  wire out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_43704_48990;
  wire out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43704_48993;
  wire out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_43704_48997;
  wire out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43704_49000;
  wire out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_43704_49004;
  wire out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43704_49007;
  wire out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_43704_49011;
  wire out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43704_49014;
  wire out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_43704_49018;
  wire out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_43704_49025;
  wire out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_43704_49032;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_43704_49039;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_43704_49046;
  wire out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_43704_49053;
  wire out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_43704_49060;
  wire out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_43704_49067;
  wire out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_43704_48542;
  wire out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_43704_48546;
  wire out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_43704_48550;
  wire out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_43704_49780;
  wire out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_43704_49523;
  wire out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_43704_49784;
  wire out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_43704_49531;
  wire out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43704_48464;
  wire out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_43704_49788;
  wire out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_43704_49539;
  wire out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_43704_49792;
  wire out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_43704_49547;
  wire out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_43704_49796;
  wire out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_43704_49555;
  wire out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_43704_49800;
  wire out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_43704_49563;
  wire out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_43704_49804;
  wire out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_43704_49571;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_43704_48467;
  wire out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_43704_49808;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_43704_49580;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_43704_50062;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_43704_50330;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_43704_50074;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43704_48471;
  wire out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_43704_50334;
  wire out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_43704_50086;
  wire out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_43704_50338;
  wire out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_43704_50098;
  wire out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_43704_50556;
  wire out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_43704_50568;
  wire out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_43704_50658;
  wire [25:0] out_ui_lshift_expr_FU_0_64_64_178_i0_fu___float_adde8m23b_127nih_43704_44201;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_179_i0_fu___float_adde8m23b_127nih_43704_43957;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_179_i1_fu___float_adde8m23b_127nih_43704_43971;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_179_i2_fu___float_adde8m23b_127nih_43704_44683;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_43704_44899;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_180_i0_fu___float_adde8m23b_127nih_43704_43963;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_43704_43977;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_181_i0_fu___float_adde8m23b_127nih_43704_44316;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_182_i0_fu___float_adde8m23b_127nih_43704_44342;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_43704_44370;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_43704_44398;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_43704_44405;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_186_i0_fu___float_adde8m23b_127nih_43704_44871;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_43704_45581;
  wire [26:0] out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_43704_45602;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_43704_49944;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_43704_45952;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_43704_47608;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_43704_50209;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_43704_45941;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_193_i0_fu___float_adde8m23b_127nih_43704_44442;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_194_i0_fu___float_adde8m23b_127nih_43704_44463;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_195_i0_fu___float_adde8m23b_127nih_43704_44483;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde8m23b_127nih_43704_44503;
  wire out_ui_lt_expr_FU_32_32_32_197_i0_fu___float_adde8m23b_127nih_43704_43781;
  wire [7:0] out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43704_43921;
  wire out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_43704_43891;
  wire out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_43704_43896;
  wire out_ui_ne_expr_FU_32_0_32_200_i0_fu___float_adde8m23b_127nih_43704_44212;
  wire [26:0] out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264;
  wire [30:0] out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_43704_44741;
  wire [24:0] out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_43704_45599;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i0_fu___float_adde8m23b_127nih_43704_43823;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i1_fu___float_adde8m23b_127nih_43704_43880;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i2_fu___float_adde8m23b_127nih_43704_44765;
  wire [15:0] out_ui_rshift_expr_FU_32_0_32_203_i0_fu___float_adde8m23b_127nih_43704_44301;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_43704_44696;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_43704_45572;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_43704_45584;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_43704_45577;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_43704_45593;
  wire [24:0] out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_43704_45596;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_43704_49937;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_43704_49940;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_43704_45948;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_43704_50202;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_43704_50205;
  wire [25:0] out_ui_rshift_expr_FU_32_32_32_209_i0_fu___float_adde8m23b_127nih_43704_44192;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_43704_45944;
  wire [7:0] out_ui_ternary_pm_expr_FU_8_0_8_8_211_i0_fu___float_adde8m23b_127nih_43704_44689;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10000)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1000000000000000)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1000000001000000001000000001000000001000000001000000001000000001)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(57),
    .value(57'b100000010000001000000100000010000001000000100000010000000)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1000010000100001000000000000000000000000000000000000000000000000)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10001)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(39),
    .value(39'b100010000000000000000000000000001010000)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(22),
    .value(22'b1000100000010100100111)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(54),
    .value(54'b100010000001010010011100000000000000000000000000000000)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(29),
    .value(29'b10001000011111101110100001111)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1001)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10010)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10010000)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b10010000000010010000000000000000)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1001000000001001000000000000000000000000000000001001000000001001)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1001000000001001000000000000000011110000000011111001000000001001)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(29),
    .value(29'b10010010010000000000000000000)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(45),
    .value(45'b100100100100000000000000000000000000000000000)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10011)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b101)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1010)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10100)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(55),
    .value(55'b1010000000000110101001100000000000000000000000000000000)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10101)) const_40 (.out1(out_const_40));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1010101000000001101100011011000)) const_41 (.out1(out_const_41));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10110)) const_42 (.out1(out_const_42));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10111)) const_43 (.out1(out_const_43));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_44 (.out1(out_const_44));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_45 (.out1(out_const_45));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_46 (.out1(out_const_46));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11000)) const_47 (.out1(out_const_47));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1100000)) const_48 (.out1(out_const_48));
  constant_value #(.BITSIZE_out1(38),
    .value(38'b11000000000000000000000000000000100010)) const_49 (.out1(out_const_49));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11001)) const_50 (.out1(out_const_50));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11001100000)) const_51 (.out1(out_const_51));
  constant_value #(.BITSIZE_out1(27),
    .value(27'b110011000000000000000000000)) const_52 (.out1(out_const_52));
  constant_value #(.BITSIZE_out1(59),
    .value(59'b11001100000000000000000000000000000000000000000000000000000)) const_53 (.out1(out_const_53));
  constant_value #(.BITSIZE_out1(15),
    .value(15'b110011000100100)) const_54 (.out1(out_const_54));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1101)) const_55 (.out1(out_const_55));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11010)) const_56 (.out1(out_const_56));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11011)) const_57 (.out1(out_const_57));
  constant_value #(.BITSIZE_out1(15),
    .value(15'b110111100000110)) const_58 (.out1(out_const_58));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1101111111101101111111111111111)) const_59 (.out1(out_const_59));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01011)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b110111111110110111111111111111111111111111111111111111111111111)) const_60 (.out1(out_const_60));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_61 (.out1(out_const_61));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1110)) const_62 (.out1(out_const_62));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11100)) const_63 (.out1(out_const_63));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11100010)) const_64 (.out1(out_const_64));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11101)) const_65 (.out1(out_const_65));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1110101011000000)) const_66 (.out1(out_const_66));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11101110111100000010001011110000)) const_67 (.out1(out_const_67));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11101111101010101100110000000000)) const_68 (.out1(out_const_68));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_69 (.out1(out_const_69));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010110)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11110)) const_70 (.out1(out_const_70));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111000001100110111100000110011011110000111111111111)) const_71 (.out1(out_const_71));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111001111000000111100101100000011110011110000001111001010000000)) const_72 (.out1(out_const_72));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111011001101111000000000000000011111111111111110000000000000000)) const_73 (.out1(out_const_73));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1111011110111101111111111111111)) const_74 (.out1(out_const_74));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_75 (.out1(out_const_75));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_76 (.out1(out_const_76));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111110)) const_77 (.out1(out_const_77));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111111)) const_78 (.out1(out_const_78));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111101010101101010100000000011011000110110001101100011011000)) const_79 (.out1(out_const_79));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010111)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111111111111)) const_80 (.out1(out_const_80));
  constant_value #(.BITSIZE_out1(23),
    .value(23'b11111111111111111111111)) const_81 (.out1(out_const_81));
  constant_value #(.BITSIZE_out1(26),
    .value(26'b11111111111111111111111111)) const_82 (.out1(out_const_82));
  constant_value #(.BITSIZE_out1(27),
    .value(27'b111111111111111111111111111)) const_83 (.out1(out_const_83));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1111111111111111111111111111111)) const_84 (.out1(out_const_84));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111110010000000010010000000000000000)) const_85 (.out1(out_const_85));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_86 (.out1(out_const_86));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_in_port_a_64_32 (.out1(out_conv_in_port_a_64_32),
    .in1(in_port_a));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_in_port_b_64_32 (.out1(out_conv_in_port_b_64_32),
    .in1(in_port_b));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43704_44905_32_64 (.out1(out_conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43704_44905_32_64),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43704_44905));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43704_43767 (.out1(out_ui_bit_and_expr_FU_32_0_32_153_i0_fu___float_adde8m23b_127nih_43704_43767),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_84));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43704_43774 (.out1(out_ui_bit_and_expr_FU_32_0_32_153_i1_fu___float_adde8m23b_127nih_43704_43774),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_84));
  ui_lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_43781 (.out1(out_ui_lt_expr_FU_32_32_32_197_i0_fu___float_adde8m23b_127nih_43704_43781),
    .in1(out_ui_bit_and_expr_FU_32_0_32_153_i0_fu___float_adde8m23b_127nih_43704_43767),
    .in2(out_ui_bit_and_expr_FU_32_0_32_153_i1_fu___float_adde8m23b_127nih_43704_43774));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43704_43786 (.out1(out_UIdata_converter_FU_2_i0_fu___float_adde8m23b_127nih_43704_43786),
    .in1(out_ui_lt_expr_FU_32_32_32_197_i0_fu___float_adde8m23b_127nih_43704_43781));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_43789 (.out1(out_lshift_expr_FU_64_0_64_146_i0_fu___float_adde8m23b_127nih_43704_43789),
    .in1(out_UIdata_converter_FU_2_i0_fu___float_adde8m23b_127nih_43704_43786),
    .in2(out_const_12));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_43792 (.out1(out_rshift_expr_FU_64_0_64_149_i0_fu___float_adde8m23b_127nih_43704_43792),
    .in1(out_lshift_expr_FU_64_0_64_146_i0_fu___float_adde8m23b_127nih_43704_43789),
    .in2(out_const_12));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_43704_43795 (.out1(out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_43704_43795),
    .in1(out_rshift_expr_FU_64_0_64_149_i0_fu___float_adde8m23b_127nih_43704_43792));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_43704_43798 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i0_fu___float_adde8m23b_127nih_43704_43798),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_conv_in_port_b_64_32));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_43704_43801 (.out1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i0_fu___float_adde8m23b_127nih_43704_43798),
    .in2(out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_43704_43795));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43704_43804 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_43704_43804),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43704_43809 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_43704_43809),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_43820 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_43704_43820),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_43704_43804),
    .in2(out_const_81));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_43823 (.out1(out_ui_rshift_expr_FU_32_0_32_202_i0_fu___float_adde8m23b_127nih_43704_43823),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_43704_43804),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_43832 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_43704_43832),
    .in1(out_ui_rshift_expr_FU_32_0_32_202_i0_fu___float_adde8m23b_127nih_43704_43823),
    .in2(out_const_78));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_43851 (.out1(out_lut_expr_FU_8_i0_fu___float_adde8m23b_127nih_43704_43851),
    .in1(out_const_45),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43704_48464),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43704_48471),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43704_43854 (.out1(out_UIdata_converter_FU_9_i0_fu___float_adde8m23b_127nih_43704_43854),
    .in1(out_lut_expr_FU_8_i0_fu___float_adde8m23b_127nih_43704_43851));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_43857 (.out1(out_lshift_expr_FU_64_0_64_146_i1_fu___float_adde8m23b_127nih_43704_43857),
    .in1(out_UIdata_converter_FU_9_i0_fu___float_adde8m23b_127nih_43704_43854),
    .in2(out_const_12));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_43860 (.out1(out_rshift_expr_FU_64_0_64_149_i1_fu___float_adde8m23b_127nih_43704_43860),
    .in1(out_lshift_expr_FU_64_0_64_146_i1_fu___float_adde8m23b_127nih_43704_43857),
    .in2(out_const_12));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_43704_43863 (.out1(out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_43704_43863),
    .in1(out_rshift_expr_FU_64_0_64_149_i1_fu___float_adde8m23b_127nih_43704_43860));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_43877 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_43704_43877),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_43704_43809),
    .in2(out_const_81));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_43880 (.out1(out_ui_rshift_expr_FU_32_0_32_202_i1_fu___float_adde8m23b_127nih_43704_43880),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_43704_43809),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_43883 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i1_fu___float_adde8m23b_127nih_43704_43883),
    .in1(out_ui_rshift_expr_FU_32_0_32_202_i1_fu___float_adde8m23b_127nih_43704_43880),
    .in2(out_const_78));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_43891 (.out1(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_43704_43891),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_43704_43820),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_43896 (.out1(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_43704_43896),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_43704_43877),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_43910 (.out1(out_lut_expr_FU_30_i0_fu___float_adde8m23b_127nih_43704_43910),
    .in1(out_const_60),
    .in2(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_43704_48997),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43704_49000),
    .in4(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_43704_49004),
    .in5(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43704_49007),
    .in6(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_43704_50676),
    .in7(out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_43704_50684),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_43918 (.out1(out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_43704_43918),
    .in1(out_const_74),
    .in2(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43704_48993),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43704_49000),
    .in4(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_43704_49046),
    .in5(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_43704_49053),
    .in6(out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_43704_50697),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_minus_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_43921 (.out1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43704_43921),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_43704_43832),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i1_fu___float_adde8m23b_127nih_43704_43883));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_43954 (.out1(out_UUdata_converter_FU_43_i0_fu___float_adde8m23b_127nih_43704_43954),
    .in1(out_lut_expr_FU_30_i0_fu___float_adde8m23b_127nih_43704_43910));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_43957 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i0_fu___float_adde8m23b_127nih_43704_43957),
    .in1(out_UUdata_converter_FU_43_i0_fu___float_adde8m23b_127nih_43704_43954),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_43704_43960 (.out1(out_ui_bit_ior_expr_FU_0_32_32_161_i0_fu___float_adde8m23b_127nih_43704_43960),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i0_fu___float_adde8m23b_127nih_43704_43957),
    .in2(out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_43704_43820));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_43963 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i0_fu___float_adde8m23b_127nih_43704_43963),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_161_i0_fu___float_adde8m23b_127nih_43704_43960),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_43968 (.out1(out_UUdata_converter_FU_44_i0_fu___float_adde8m23b_127nih_43704_43968),
    .in1(out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_43704_43918));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_43971 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i1_fu___float_adde8m23b_127nih_43704_43971),
    .in1(out_UUdata_converter_FU_44_i0_fu___float_adde8m23b_127nih_43704_43968),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(24),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_43704_43974 (.out1(out_ui_bit_ior_expr_FU_0_32_32_162_i0_fu___float_adde8m23b_127nih_43704_43974),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_43704_43877),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i1_fu___float_adde8m23b_127nih_43704_43971));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_43977 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_43704_43977),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_162_i0_fu___float_adde8m23b_127nih_43704_43974),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43704_43984 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i2_fu___float_adde8m23b_127nih_43704_43984),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43704_43921),
    .in2(out_const_78));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44165 (.out1(out_lut_expr_FU_48_i0_fu___float_adde8m23b_127nih_43704_44165),
    .in1(out_const_77),
    .in2(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_43704_48542),
    .in3(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_43704_48546),
    .in4(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_43704_48550),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43704_44168 (.out1(out_UIdata_converter_FU_49_i0_fu___float_adde8m23b_127nih_43704_44168),
    .in1(out_lut_expr_FU_48_i0_fu___float_adde8m23b_127nih_43704_44165));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43704_44171 (.out1(out_lshift_expr_FU_32_0_32_144_i0_fu___float_adde8m23b_127nih_43704_44171),
    .in1(out_UIdata_converter_FU_49_i0_fu___float_adde8m23b_127nih_43704_44168),
    .in2(out_const_11));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43704_44174 (.out1(out_rshift_expr_FU_32_0_32_147_i0_fu___float_adde8m23b_127nih_43704_44174),
    .in1(out_lshift_expr_FU_32_0_32_144_i0_fu___float_adde8m23b_127nih_43704_44171),
    .in2(out_const_11));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43704_44177 (.out1(out_IUdata_converter_FU_50_i0_fu___float_adde8m23b_127nih_43704_44177),
    .in1(out_rshift_expr_FU_32_0_32_147_i0_fu___float_adde8m23b_127nih_43704_44174));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43704_44180 (.out1(out_UUdata_converter_FU_51_i0_fu___float_adde8m23b_127nih_43704_44180),
    .in1(out_IUdata_converter_FU_50_i0_fu___float_adde8m23b_127nih_43704_44177));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43704_44183 (.out1(out_ui_bit_ior_expr_FU_8_8_8_171_i0_fu___float_adde8m23b_127nih_43704_44183),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i2_fu___float_adde8m23b_127nih_43704_43984),
    .in2(out_UUdata_converter_FU_51_i0_fu___float_adde8m23b_127nih_43704_44180));
  ui_bit_and_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43704_44186 (.out1(out_ui_bit_and_expr_FU_8_0_8_158_i0_fu___float_adde8m23b_127nih_43704_44186),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_171_i0_fu___float_adde8m23b_127nih_43704_44183),
    .in2(out_const_75));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43704_44189 (.out1(out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_43704_44189),
    .in1(out_ui_bit_and_expr_FU_8_0_8_158_i0_fu___float_adde8m23b_127nih_43704_44186));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(5),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44192 (.out1(out_ui_rshift_expr_FU_32_32_32_209_i0_fu___float_adde8m23b_127nih_43704_44192),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_43704_43977),
    .in2(out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_43704_44189));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44201 (.out1(out_ui_lshift_expr_FU_0_64_64_178_i0_fu___float_adde8m23b_127nih_43704_44201),
    .in1(out_const_86),
    .in2(out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_43704_44189));
  ui_bit_not_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43704_44204 (.out1(out_ui_bit_not_expr_FU_32_32_172_i0_fu___float_adde8m23b_127nih_43704_44204),
    .in1(out_ui_lshift_expr_FU_0_64_64_178_i0_fu___float_adde8m23b_127nih_43704_44201));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_43704_44207 (.out1(out_ui_bit_and_expr_FU_32_32_32_156_i1_fu___float_adde8m23b_127nih_43704_44207),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_43704_45572),
    .in2(out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_43704_45577));
  ui_ne_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44212 (.out1(out_ui_ne_expr_FU_32_0_32_200_i0_fu___float_adde8m23b_127nih_43704_44212),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_43704_45584),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44217 (.out1(out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_43704_44217),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_43704_45584),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44220 (.out1(out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_43704_44220),
    .in1(out_const_48),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43704_48464),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43704_48471),
    .in4(out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_43704_44217),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43704_44236 (.out1(out_ui_bit_and_expr_FU_0_32_32_150_i0_fu___float_adde8m23b_127nih_43704_44236),
    .in1(out_const_82),
    .in2(out_ui_rshift_expr_FU_32_32_32_209_i0_fu___float_adde8m23b_127nih_43704_44192));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_43704_44241 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i3_fu___float_adde8m23b_127nih_43704_44241),
    .in1(out_ui_bit_and_expr_FU_0_32_32_150_i0_fu___float_adde8m23b_127nih_43704_44236),
    .in2(out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_43704_43863));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_43704_44255 (.out1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_43704_44255),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i3_fu___float_adde8m23b_127nih_43704_44241),
    .in2(out_const_83));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(27),
    .OFFSET_PARAMETER(2)) fu___float_adde8m23b_127nih_43704_44258 (.out1(out_ui_bit_ior_concat_expr_FU_160_i0_fu___float_adde8m23b_127nih_43704_44258),
    .in1(out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_43704_45602),
    .in2(out_reg_4_reg_4),
    .in3(out_const_14));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44261 (.out1(out_UUdata_converter_FU_54_i0_fu___float_adde8m23b_127nih_43704_44261),
    .in1(out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_43704_44220));
  ui_plus_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_43704_44264 (.out1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in1(out_ui_bit_ior_concat_expr_FU_160_i0_fu___float_adde8m23b_127nih_43704_44258),
    .in2(out_reg_1_reg_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_43704_44269 (.out1(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_43704_44269),
    .in1(out_const_83),
    .in2(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44301 (.out1(out_ui_rshift_expr_FU_32_0_32_203_i0_fu___float_adde8m23b_127nih_43704_44301),
    .in1(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_43704_44269),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu___float_adde8m23b_127nih_43704_44304 (.out1(out_ui_bit_and_expr_FU_16_0_16_152_i0_fu___float_adde8m23b_127nih_43704_44304),
    .in1(out_ui_rshift_expr_FU_32_0_32_203_i0_fu___float_adde8m23b_127nih_43704_44301),
    .in2(out_const_80));
  ui_lshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(6),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44316 (.out1(out_ui_lshift_expr_FU_32_0_32_181_i0_fu___float_adde8m23b_127nih_43704_44316),
    .in1(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_43704_44269),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(5),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44342 (.out1(out_ui_lshift_expr_FU_32_0_32_182_i0_fu___float_adde8m23b_127nih_43704_44342),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_43704_45857),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(4),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44370 (.out1(out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_43704_44370),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_43704_45851),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44398 (.out1(out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_43704_44398),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_43704_45839),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44405 (.out1(out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_43704_44405),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_43704_45843),
    .in2(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44439 (.out1(out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_43704_44439),
    .in1(out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_43704_45935));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44442 (.out1(out_ui_lshift_expr_FU_8_0_8_193_i0_fu___float_adde8m23b_127nih_43704_44442),
    .in1(out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_43704_44439),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44460 (.out1(out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_43704_44460),
    .in1(out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_43704_45926));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44463 (.out1(out_ui_lshift_expr_FU_8_0_8_194_i0_fu___float_adde8m23b_127nih_43704_44463),
    .in1(out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_43704_44460),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___float_adde8m23b_127nih_43704_44466 (.out1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde8m23b_127nih_43704_44466),
    .in1(out_ui_lshift_expr_FU_8_0_8_193_i0_fu___float_adde8m23b_127nih_43704_44442),
    .in2(out_ui_lshift_expr_FU_8_0_8_194_i0_fu___float_adde8m23b_127nih_43704_44463));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44480 (.out1(out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_43704_44480),
    .in1(out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_43704_45917));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44483 (.out1(out_ui_lshift_expr_FU_8_0_8_195_i0_fu___float_adde8m23b_127nih_43704_44483),
    .in1(out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_43704_44480),
    .in2(out_const_9));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44500 (.out1(out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_43704_44500),
    .in1(out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_43704_45908));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44503 (.out1(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde8m23b_127nih_43704_44503),
    .in1(out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_43704_44500),
    .in2(out_const_3));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43704_44506 (.out1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde8m23b_127nih_43704_44506),
    .in1(out_ui_lshift_expr_FU_8_0_8_195_i0_fu___float_adde8m23b_127nih_43704_44483),
    .in2(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde8m23b_127nih_43704_44503));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43704_44509 (.out1(out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu___float_adde8m23b_127nih_43704_44509),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde8m23b_127nih_43704_44466),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde8m23b_127nih_43704_44506));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43704_44514 (.out1(out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu___float_adde8m23b_127nih_43704_44514),
    .in1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_43704_45944),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu___float_adde8m23b_127nih_43704_44509));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44613 (.out1(out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_43704_44613),
    .in1(out_const_85),
    .in2(out_reg_22_reg_22),
    .in3(out_reg_23_reg_23),
    .in4(out_reg_24_reg_24),
    .in5(out_reg_25_reg_25),
    .in6(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_43704_50767),
    .in7(out_reg_36_reg_36),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(6),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44683 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i2_fu___float_adde8m23b_127nih_43704_44683),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i3_fu___float_adde8m23b_127nih_43704_44686),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_44686 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i3_fu___float_adde8m23b_127nih_43704_44686),
    .in1(out_reg_31_reg_31),
    .in2(out_const_78));
  ui_ternary_pm_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_in3(5),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_44689 (.out1(out_ui_ternary_pm_expr_FU_8_0_8_8_211_i0_fu___float_adde8m23b_127nih_43704_44689),
    .in1(out_reg_7_reg_7),
    .in2(out_const_13),
    .in3(out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_43704_47598));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44696 (.out1(out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_43704_44696),
    .in1(out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_43704_49944),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_44699 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i2_fu___float_adde8m23b_127nih_43704_44699),
    .in1(out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_43704_44696),
    .in2(out_const_81));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43704_44704 (.out1(out_ui_bit_ior_expr_FU_0_32_32_163_i0_fu___float_adde8m23b_127nih_43704_44704),
    .in1(out_reg_32_reg_32),
    .in2(out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_43704_45952));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_44738 (.out1(out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_43704_44738),
    .in1(out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_43704_47897));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43704_44741 (.out1(out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_43704_44741),
    .in1(out_reg_33_reg_33),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_163_i0_fu___float_adde8m23b_127nih_43704_44704));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44765 (.out1(out_ui_rshift_expr_FU_32_0_32_202_i2_fu___float_adde8m23b_127nih_43704_44765),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_43704_44741),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_44768 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_43704_44768),
    .in1(out_ui_rshift_expr_FU_32_0_32_202_i2_fu___float_adde8m23b_127nih_43704_44765),
    .in2(out_const_78));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_44773 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_43704_44773),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_43704_44741),
    .in2(out_const_81));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44871 (.out1(out_ui_lshift_expr_FU_32_0_32_186_i0_fu___float_adde8m23b_127nih_43704_44871),
    .in1(out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_43704_47588),
    .in2(out_const_7));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_44874 (.out1(out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_43704_44874),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_43704_47592));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(6),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_44899 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_43704_44899),
    .in1(out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_43704_47590),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_43704_44902 (.out1(out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_43704_44902),
    .in1(out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_43704_44874),
    .in2(out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_43704_47608));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_43704_44905 (.out1(out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43704_44905),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_43704_44899),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_43704_44902));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45085 (.out1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in1(out_ui_bit_and_expr_FU_16_0_16_152_i0_fu___float_adde8m23b_127nih_43704_44304),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45089 (.out1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_43704_49796),
    .in4(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_43704_49555),
    .in5(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_43704_49800),
    .in6(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_43704_49563),
    .in7(out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_43704_50713),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45093 (.out1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in1(out_const_13),
    .in2(out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_43704_50718),
    .in3(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_43704_50722),
    .in4(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_43704_50725),
    .in5(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_43704_50728),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45097 (.out1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097),
    .in1(out_const_65),
    .in2(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_43704_50725),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in4(out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_43704_50732),
    .in5(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_43704_50739),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45151 (.out1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_43704_45151),
    .in1(out_const_26),
    .in2(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_43704_50722),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in4(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_43704_50739),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097),
    .in6(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_43704_50743),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45572 (.out1(out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_43704_45572),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_43704_43977),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45577 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_43704_45577),
    .in1(out_ui_bit_not_expr_FU_32_32_172_i0_fu___float_adde8m23b_127nih_43704_44204),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45581 (.out1(out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_43704_45581),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i1_fu___float_adde8m23b_127nih_43704_44207),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45584 (.out1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_43704_45584),
    .in1(out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_43704_45581),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45593 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_43704_45593),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i0_fu___float_adde8m23b_127nih_43704_43963),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(25),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45596 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_43704_45596),
    .in1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_43704_44255),
    .in2(out_const_14));
  ui_plus_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(25),
    .BITSIZE_out1(25)) fu___float_adde8m23b_127nih_43704_45599 (.out1(out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_43704_45599),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_43704_45593),
    .in2(out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_43704_45596));
  ui_lshift_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_in2(2),
    .BITSIZE_out1(27),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45602 (.out1(out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_43704_45602),
    .in1(out_reg_3_reg_3),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43704_45606 (.out1(out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_43704_45606),
    .in1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_43704_44255),
    .in2(out_const_44));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45793 (.out1(out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_43704_45793),
    .in1(out_const_48),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_reg_30_reg_30),
    .in5(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_43704_50829),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45815 (.out1(out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_43704_45815),
    .in1(out_const_29),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_43704_50833),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_45823 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_43704_45823),
    .in1(out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_43704_44613),
    .in2(out_const_0),
    .in3(out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_43704_45948));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_45827 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_43704_45827),
    .in1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_43704_45151),
    .in2(out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_43704_50202),
    .in3(out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_43704_50205));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43704_45839 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_43704_45839),
    .in1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097),
    .in2(out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_43704_44405),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_43704_45843));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43704_45843 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_43704_45843),
    .in1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in2(out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_43704_44370),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_43704_45851));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43704_45851 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_43704_45851),
    .in1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in2(out_ui_lshift_expr_FU_32_0_32_182_i0_fu___float_adde8m23b_127nih_43704_44342),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_43704_45857));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(27),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43704_45857 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_43704_45857),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in2(out_ui_lshift_expr_FU_32_0_32_181_i0_fu___float_adde8m23b_127nih_43704_44316),
    .in3(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_43704_44269));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45862 (.out1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_43704_45862),
    .in1(out_const_45),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_43704_50833),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_45865 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_43704_45865),
    .in1(out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_43704_45793),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_43704_44768),
    .in3(out_const_78));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_45873 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_43704_45873),
    .in1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_43704_45862),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_43704_45865),
    .in3(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_43704_44768));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_45875 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_43704_45875),
    .in1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_43704_45862),
    .in2(out_const_0),
    .in3(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_43704_44773));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45878 (.out1(out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_43704_45878),
    .in1(out_const_29),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43704_48464),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_43704_48467),
    .in4(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_43704_50817),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(1),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_45884 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_43704_45884),
    .in1(out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_43704_45815),
    .in2(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_43704_44773),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_45891 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_43704_45891),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_43704_45873),
    .in3(out_const_78));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(1),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_45893 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_43704_45893),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_43704_45875),
    .in3(out_const_0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43704_45901 (.out1(out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_43704_45901),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43704_45905 (.out1(out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_43704_45905),
    .in1(out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_43704_45901),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43704_45908 (.out1(out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_43704_45908),
    .in1(out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_43704_45905),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43704_45911 (.out1(out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_43704_45911),
    .in1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43704_45914 (.out1(out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_43704_45914),
    .in1(out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_43704_45911),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43704_45917 (.out1(out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_43704_45917),
    .in1(out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_43704_45914),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43704_45920 (.out1(out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_43704_45920),
    .in1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43704_45923 (.out1(out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_43704_45923),
    .in1(out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_43704_45920),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43704_45926 (.out1(out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_43704_45926),
    .in1(out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_43704_45923),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43704_45929 (.out1(out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_43704_45929),
    .in1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43704_45932 (.out1(out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_43704_45932),
    .in1(out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_43704_45929),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43704_45935 (.out1(out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_43704_45935),
    .in1(out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_43704_45932),
    .in2(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45938 (.out1(out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_43704_45938),
    .in1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_43704_45151));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45941 (.out1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_43704_45941),
    .in1(out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_43704_45938),
    .in2(out_const_76));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45944 (.out1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_43704_45944),
    .in1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_43704_45941),
    .in2(out_const_76));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45948 (.out1(out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_43704_45948),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i2_fu___float_adde8m23b_127nih_43704_44683),
    .in2(out_const_43));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(5),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_45952 (.out1(out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_43704_45952),
    .in1(out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_43704_45823),
    .in2(out_const_43));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_45966 (.out1(out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_43704_45966),
    .in1(out_const_66),
    .in2(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_43704_43896),
    .in3(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_43704_43891),
    .in4(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_43704_50802),
    .in5(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_43704_50814),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_45968 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_43704_45968),
    .in1(out_reg_5_reg_5),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_43704_44768),
    .in3(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_43704_45891));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_45970 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_43704_45970),
    .in1(out_reg_5_reg_5),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_43704_45884),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_43704_45893));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_47588 (.out1(out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_43704_47588),
    .in1(out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_43704_48010));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_47590 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_43704_47590),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_43704_45891),
    .in3(out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_43704_45968));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43704_47592 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_43704_47592),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_43704_45893),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_43704_45970));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_47594 (.out1(out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_43704_47594),
    .in1(out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_43704_48003));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43704_47596 (.out1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_43704_47596),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_43704_43832));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43704_47598 (.out1(out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_43704_47598),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu___float_adde8m23b_127nih_43704_44514));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_47608 (.out1(out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_43704_47608),
    .in1(out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_43704_47594),
    .in2(out_const_75));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_47897 (.out1(out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_43704_47897),
    .in1(out_const_72),
    .in2(out_reg_0_reg_0),
    .in3(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_43704_50752),
    .in4(out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_43704_50776),
    .in5(out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_43704_50779),
    .in6(out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_43704_50782),
    .in7(out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_43704_50786),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_48003 (.out1(out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_43704_48003),
    .in1(out_const_54),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_reg_11_reg_11),
    .in5(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_43704_50821),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_48010 (.out1(out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_43704_48010),
    .in1(out_const_68),
    .in2(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_43704_43896),
    .in3(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_43704_43891),
    .in4(out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_43704_50844),
    .in5(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_43704_50802),
    .in6(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_43704_50814),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_48014 (.out1(out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_43704_48014),
    .in1(out_const_45),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43704_48464),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_43704_48467),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48464 (.out1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43704_48464),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48467 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_43704_48467),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48471 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43704_48471),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43704_48542 (.out1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_43704_48542),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43704_43921),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43704_48546 (.out1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_43704_48546),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43704_43921),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43704_48550 (.out1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_43704_48550),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43704_43921),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48962 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_43704_48962),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48965 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43704_48965),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48969 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_43704_48969),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48972 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43704_48972),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48976 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43704_48976),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48979 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43704_48979),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48983 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_43704_48983),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48986 (.out1(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43704_48986),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48990 (.out1(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_43704_48990),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48993 (.out1(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43704_48993),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_48997 (.out1(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_43704_48997),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49000 (.out1(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43704_49000),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49004 (.out1(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_43704_49004),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49007 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43704_49007),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49011 (.out1(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_43704_49011),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49014 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43704_49014),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43704_43801),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49018 (.out1(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_43704_49018),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49025 (.out1(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_43704_49025),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49032 (.out1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_43704_49032),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49039 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_43704_49039),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49046 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_43704_49046),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49053 (.out1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_43704_49053),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49060 (.out1(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_43704_49060),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49067 (.out1(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_43704_49067),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49523 (.out1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_43704_49523),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_35));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49531 (.out1(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_43704_49531),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49539 (.out1(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_43704_49539),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_40));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49547 (.out1(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_43704_49547),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49555 (.out1(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_43704_49555),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49563 (.out1(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_43704_49563),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49571 (.out1(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_43704_49571),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_49580 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_43704_49580),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2)) fu___float_adde8m23b_127nih_43704_49780 (.out1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_43704_49780),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43704_49784 (.out1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_43704_49784),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_15));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43704_49788 (.out1(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_43704_49788),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43704_49792 (.out1(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_43704_49792),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43704_49796 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_43704_49796),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43704_49800 (.out1(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_43704_49800),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_16));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43704_49804 (.out1(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_43704_49804),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_27));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43704_49808 (.out1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_43704_49808),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_37));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_49937 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_43704_49937),
    .in1(out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_43704_44398),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_49940 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_43704_49940),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_43704_45839),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_49944 (.out1(out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_43704_49944),
    .in1(out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_43704_50209),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43704_50062 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_43704_50062),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_50074 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_43704_50074),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_50086 (.out1(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_43704_50086),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43704_50098 (.out1(out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_43704_50098),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_28));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_50202 (.out1(out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_43704_50202),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_43704_49937),
    .in2(out_const_13));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_50205 (.out1(out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_43704_50205),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_43704_49940),
    .in2(out_const_13));
  ui_lshift_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43704_50209 (.out1(out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_43704_50209),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_43704_45827),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1)) fu___float_adde8m23b_127nih_43704_50330 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_43704_50330),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1)) fu___float_adde8m23b_127nih_43704_50334 (.out1(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_43704_50334),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2)) fu___float_adde8m23b_127nih_43704_50338 (.out1(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_43704_50338),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43704_50556 (.out1(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_43704_50556),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_55));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43704_50568 (.out1(out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_43704_50568),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_62));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43704_50658 (.out1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_43704_50658),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43704_44264),
    .in2(out_const_46));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50676 (.out1(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_43704_50676),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_43704_48990),
    .in3(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43704_48993),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50680 (.out1(out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_43704_50680),
    .in1(out_const_31),
    .in2(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_43704_48969),
    .in3(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43704_48972),
    .in4(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43704_48976),
    .in5(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43704_48979),
    .in6(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_43704_48983),
    .in7(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43704_48986),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50684 (.out1(out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_43704_50684),
    .in1(out_const_30),
    .in2(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_43704_48962),
    .in3(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43704_48965),
    .in4(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_43704_49011),
    .in5(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43704_49014),
    .in6(out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_43704_50680),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50689 (.out1(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_43704_50689),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43704_49007),
    .in3(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_43704_49060),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50693 (.out1(out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_43704_50693),
    .in1(out_const_19),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43704_48972),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43704_48979),
    .in4(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43704_48986),
    .in5(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_43704_49025),
    .in6(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_43704_49032),
    .in7(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_43704_49039),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50697 (.out1(out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_43704_50697),
    .in1(out_const_21),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43704_48965),
    .in3(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43704_49014),
    .in4(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_43704_49018),
    .in5(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_43704_49067),
    .in6(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_43704_50689),
    .in7(out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_43704_50693),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(22),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50705 (.out1(out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_43704_50705),
    .in1(out_const_24),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_43704_49788),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_43704_49539),
    .in5(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_43704_49792),
    .in6(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_43704_49547),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50709 (.out1(out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_43704_50709),
    .in1(out_const_39),
    .in2(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_43704_49780),
    .in3(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_43704_49523),
    .in4(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in5(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_43704_49784),
    .in6(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_43704_49531),
    .in7(out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_43704_50705),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50713 (.out1(out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_43704_50713),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_43704_49804),
    .in4(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_43704_49571),
    .in5(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_43704_49808),
    .in6(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_43704_49580),
    .in7(out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_43704_50709),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50718 (.out1(out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_43704_50718),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_43704_49796),
    .in4(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_43704_49555),
    .in5(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_43704_50062),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50722 (.out1(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_43704_50722),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_43704_49800),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_43704_49563),
    .in5(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_43704_50330),
    .in6(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_43704_50074),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50725 (.out1(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_43704_50725),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_43704_49804),
    .in4(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_43704_49571),
    .in5(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_43704_50334),
    .in6(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_43704_50086),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50728 (.out1(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_43704_50728),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_43704_49808),
    .in4(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_43704_49580),
    .in5(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_43704_50338),
    .in6(out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_43704_50098),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50732 (.out1(out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_43704_50732),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_43704_49788),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_43704_49539),
    .in5(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_43704_50556),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50735 (.out1(out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_43704_50735),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_43704_49792),
    .in4(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_43704_49547),
    .in5(out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_43704_50568),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50739 (.out1(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_43704_50739),
    .in1(out_const_64),
    .in2(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_43704_50728),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in4(out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_43704_50735),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50743 (.out1(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_43704_50743),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_43704_49784),
    .in4(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_43704_49531),
    .in5(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_43704_50658),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50748 (.out1(out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_43704_50748),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43704_48976),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43704_48979),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50752 (.out1(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_43704_50752),
    .in1(out_const_67),
    .in2(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_43704_50722),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in4(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_43704_50739),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097),
    .in6(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_43704_50743),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50755 (.out1(out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_43704_50755),
    .in1(out_const_27),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13),
    .in4(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_43704_50752),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50759 (.out1(out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_43704_50759),
    .in1(out_const_71),
    .in2(out_reg_14_reg_14),
    .in3(out_reg_15_reg_15),
    .in4(out_reg_28_reg_28),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097),
    .in7(out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_43704_50755),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50763 (.out1(out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_43704_50763),
    .in1(out_const_58),
    .in2(out_reg_18_reg_18),
    .in3(out_reg_19_reg_19),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in5(out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_43704_50759),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50767 (.out1(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_43704_50767),
    .in1(out_const_32),
    .in2(out_reg_20_reg_20),
    .in3(out_reg_21_reg_21),
    .in4(out_reg_26_reg_26),
    .in5(out_reg_27_reg_27),
    .in6(out_reg_34_reg_34),
    .in7(out_reg_35_reg_35),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50770 (.out1(out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_43704_50770),
    .in1(out_const_18),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in4(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097),
    .in6(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_43704_50752),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(39),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50776 (.out1(out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_43704_50776),
    .in1(out_const_23),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_43704_50330),
    .in4(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_43704_50338),
    .in5(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in6(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in7(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50779 (.out1(out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_43704_50779),
    .in1(out_const_15),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_43704_50334),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50782 (.out1(out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_43704_50782),
    .in1(out_const_15),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in3(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_43704_50330),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(38),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50786 (.out1(out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_43704_50786),
    .in1(out_const_49),
    .in2(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_43704_49780),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .in4(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_43704_50334),
    .in5(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43704_45089),
    .in6(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43704_45093),
    .in7(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43704_45097),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50791 (.out1(out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_43704_50791),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_43704_49004),
    .in3(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43704_49007),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50795 (.out1(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_43704_50795),
    .in1(out_const_51),
    .in2(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_43704_48997),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43704_49000),
    .in4(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_43704_49011),
    .in5(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43704_49014),
    .in6(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_43704_50676),
    .in7(out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_43704_50791),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50799 (.out1(out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_43704_50799),
    .in1(out_const_52),
    .in2(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43704_48976),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43704_48979),
    .in4(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_43704_48983),
    .in5(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43704_48986),
    .in6(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_43704_50795),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50802 (.out1(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_43704_50802),
    .in1(out_const_52),
    .in2(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_43704_48962),
    .in3(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43704_48965),
    .in4(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_43704_48969),
    .in5(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43704_48972),
    .in6(out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_43704_50799),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(57),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50806 (.out1(out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_43704_50806),
    .in1(out_const_20),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43704_48972),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43704_48979),
    .in4(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43704_48986),
    .in5(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_43704_49025),
    .in6(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_43704_49032),
    .in7(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_43704_49039),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(45),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50810 (.out1(out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_43704_50810),
    .in1(out_const_34),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43704_48965),
    .in3(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43704_49014),
    .in4(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_43704_49018),
    .in5(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_43704_49067),
    .in6(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_43704_50689),
    .in7(out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_43704_50806),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50814 (.out1(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_43704_50814),
    .in1(out_const_33),
    .in2(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43704_48993),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43704_49000),
    .in4(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_43704_49046),
    .in5(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_43704_49053),
    .in6(out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_43704_50810),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50817 (.out1(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_43704_50817),
    .in1(out_const_13),
    .in2(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_43704_50802),
    .in3(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_43704_50814),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50821 (.out1(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_43704_50821),
    .in1(out_const_59),
    .in2(out_reg_22_reg_22),
    .in3(out_reg_23_reg_23),
    .in4(out_reg_24_reg_24),
    .in5(out_reg_25_reg_25),
    .in6(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_43704_50767),
    .in7(out_reg_36_reg_36),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(59),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50825 (.out1(out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_43704_50825),
    .in1(out_const_53),
    .in2(out_reg_16_reg_16),
    .in3(out_reg_17_reg_17),
    .in4(out_reg_18_reg_18),
    .in5(out_reg_19_reg_19),
    .in6(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_43704_49580),
    .in7(out_reg_29_reg_29),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50829 (.out1(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_43704_50829),
    .in1(out_const_73),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13),
    .in4(out_reg_14_reg_14),
    .in5(out_reg_15_reg_15),
    .in6(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_43704_50821),
    .in7(out_reg_37_reg_37),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50833 (.out1(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_43704_50833),
    .in1(out_const_16),
    .in2(out_reg_30_reg_30),
    .in3(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_43704_50829),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43704_50844 (.out1(out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_43704_50844),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43704_48464),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43704_48471),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_200_i0_fu___float_adde8m23b_127nih_43704_44212),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_54_i0_fu___float_adde8m23b_127nih_43704_44261),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_43704_48467),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43704_48471),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_43704_48962),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43704_48965),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_43704_48969),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43704_48972),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43704_48976),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43704_48979),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_43704_48983),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43704_48986),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_186_i0_fu___float_adde8m23b_127nih_43704_44871),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_43704_48990),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43704_48993),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_43704_48997),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43704_49000),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_43704_49004),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43704_49007),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_43704_49011),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43704_49014),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_43704_50748),
    .wenable(wrenable_reg_28));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_43704_50795),
    .wenable(wrenable_reg_29));
  register_STD #(.BITSIZE_in1(25),
    .BITSIZE_out1(25)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_43704_45599),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_43704_50817),
    .wenable(wrenable_reg_30));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_pm_expr_FU_8_0_8_8_211_i0_fu___float_adde8m23b_127nih_43704_44689),
    .wenable(wrenable_reg_31));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i2_fu___float_adde8m23b_127nih_43704_44699),
    .wenable(wrenable_reg_32));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_43704_44738),
    .wenable(wrenable_reg_33));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43704_45085),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_43704_50763),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_43704_50770),
    .wenable(wrenable_reg_36));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_43704_50825),
    .wenable(wrenable_reg_37));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_43704_45606),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_43704_45878),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_43704_45966),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_43704_47596),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_43704_48014),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43704_48464),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43704_44905_32_64;

endmodule

// FSM based controller description for __float_adde8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_adde8m23b_127nih(done_port,
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
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [2:0] S_0 = 3'b001,
    S_1 = 3'b010,
    S_2 = 3'b100;
  reg [2:0] _present_state=S_0, _next_state;
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
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_2 = 1'b1;
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
          wrenable_reg_3 = 1'b1;
          wrenable_reg_30 = 1'b1;
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
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          _next_state = S_2;
          done_port = 1'b1;
        end
      S_2 :
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

// Top component for __float_adde8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_adde8m23b_127nih(clock,
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
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___float_adde8m23b_127nih Controller_i (.done_port(done_delayed_REG_signal_in),
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
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___float_adde8m23b_127nih Datapath_i (.return_port(return_port),
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

// Datapath RTL description for __float_mule8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_mule8m23b_127nih(clock,
  reset,
  in_port_a,
  in_port_b,
  return_port,
  wrenable_reg_0,
  wrenable_reg_1,
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
  wire [7:0] out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_42664_45986;
  wire [7:0] out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_42664_45988;
  wire signed [2:0] out_UIdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_42664_43014;
  wire signed [1:0] out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_42664_43017;
  wire signed [1:0] out_UIdata_converter_FU_42_i0_fu___float_mule8m23b_127nih_42664_43047;
  wire signed [2:0] out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_42664_43020;
  wire signed [1:0] out_UIdata_converter_FU_48_i0_fu___float_mule8m23b_127nih_42664_43050;
  wire signed [1:0] out_UIdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_42664_43065;
  wire signed [1:0] out_UIdata_converter_FU_57_i0_fu___float_mule8m23b_127nih_42664_43355;
  wire [7:0] out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_42664_42774;
  wire out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_42664_45756;
  wire out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_42664_42902;
  wire out_UUdata_converter_FU_41_i0_fu___float_mule8m23b_127nih_42664_43044;
  wire out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_42664_45766;
  wire out_UUdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_42664_42980;
  wire [7:0] out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_42664_42789;
  wire out_UUdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_42664_43062;
  wire out_UUdata_converter_FU_53_i0_fu___float_mule8m23b_127nih_42664_43340;
  wire out_UUdata_converter_FU_54_i0_fu___float_mule8m23b_127nih_42664_43343;
  wire out_UUdata_converter_FU_56_i0_fu___float_mule8m23b_127nih_42664_43352;
  wire [9:0] out_UUdata_converter_FU_58_i0_fu___float_mule8m23b_127nih_42664_43374;
  wire out_UUdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_42664_43486;
  wire out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_42664_42812;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_89_i0_fu___float_mule8m23b_127nih_42664_43026;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_89_i1_fu___float_mule8m23b_127nih_42664_43053;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_89_i2_fu___float_mule8m23b_127nih_42664_43068;
  wire signed [2:0] out_bit_ior_expr_FU_8_8_8_90_i0_fu___float_mule8m23b_127nih_42664_43023;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [14:0] out_const_10;
  wire [16:0] out_const_11;
  wire [23:0] out_const_12;
  wire [63:0] out_const_13;
  wire [48:0] out_const_14;
  wire [3:0] out_const_15;
  wire [4:0] out_const_16;
  wire [4:0] out_const_17;
  wire [5:0] out_const_18;
  wire [1:0] out_const_19;
  wire [5:0] out_const_2;
  wire [2:0] out_const_20;
  wire [4:0] out_const_21;
  wire [4:0] out_const_22;
  wire [4:0] out_const_23;
  wire [4:0] out_const_24;
  wire [2:0] out_const_25;
  wire [4:0] out_const_26;
  wire [7:0] out_const_27;
  wire [11:0] out_const_28;
  wire [10:0] out_const_29;
  wire [5:0] out_const_3;
  wire [4:0] out_const_30;
  wire [4:0] out_const_31;
  wire [51:0] out_const_32;
  wire [4:0] out_const_33;
  wire [20:0] out_const_34;
  wire [7:0] out_const_35;
  wire [30:0] out_const_36;
  wire [9:0] out_const_37;
  wire [16:0] out_const_38;
  wire [16:0] out_const_39;
  wire [5:0] out_const_4;
  wire [22:0] out_const_40;
  wire [31:0] out_const_41;
  wire [30:0] out_const_42;
  wire [31:0] out_const_43;
  wire [32:0] out_const_44;
  wire [46:0] out_const_45;
  wire out_const_5;
  wire [3:0] out_const_6;
  wire [5:0] out_const_7;
  wire [7:0] out_const_8;
  wire [10:0] out_const_9;
  wire [31:0] out_conv_in_port_a_64_32;
  wire [31:0] out_conv_in_port_b_64_32;
  wire [63:0] out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42664_45786_32_64;
  wire out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42664_47101;
  wire out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42664_47104;
  wire out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42664_47387;
  wire out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_42664_47530;
  wire out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42664_47534;
  wire out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_42664_42856;
  wire out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_42664_43678;
  wire out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_42664_47539;
  wire out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42664_47542;
  wire out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_42664_42934;
  wire out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_42664_43670;
  wire out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_42664_47547;
  wire out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_42664_46266;
  wire out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_42664_46103;
  wire out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_42664_47554;
  wire out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_42664_46270;
  wire out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_42664_46149;
  wire out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_42664_46156;
  wire out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_42664_46170;
  wire out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42664_47562;
  wire out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_42664_45049;
  wire out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_42664_45698;
  wire out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_42664_47569;
  wire out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_42664_47572;
  wire out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_42664_47576;
  wire out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_42664_47580;
  wire out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_42664_45701;
  wire out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_42664_45714;
  wire out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_42664_45673;
  wire out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_42664_42809;
  wire [31:0] out_reg_0_reg_0;
  wire [9:0] out_reg_1_reg_1;
  wire [47:0] out_reg_2_reg_2;
  wire out_reg_3_reg_3;
  wire [1:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire out_reg_8_reg_8;
  wire out_reg_9_reg_9;
  wire [30:0] out_ui_bit_and_expr_FU_0_32_32_91_i0_fu___float_mule8m23b_127nih_42664_43589;
  wire [46:0] out_ui_bit_and_expr_FU_0_64_64_92_i0_fu___float_mule8m23b_127nih_42664_43368;
  wire [32:0] out_ui_bit_and_expr_FU_0_64_64_93_i0_fu___float_mule8m23b_127nih_42664_43412;
  wire [7:0] out_ui_bit_and_expr_FU_0_8_8_94_i0_fu___float_mule8m23b_127nih_42664_42786;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_95_i0_fu___float_mule8m23b_127nih_42664_43008;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_42664_42754;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_42664_42792;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i2_fu___float_mule8m23b_127nih_42664_43383;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i3_fu___float_mule8m23b_127nih_42664_43471;
  wire [23:0] out_ui_bit_and_expr_FU_32_0_32_97_i0_fu___float_mule8m23b_127nih_42664_43134;
  wire [23:0] out_ui_bit_and_expr_FU_32_0_32_97_i1_fu___float_mule8m23b_127nih_42664_43140;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_98_i0_fu___float_mule8m23b_127nih_42664_42771;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_100_i0_fu___float_mule8m23b_127nih_42664_43592;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_42664_43645;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_99_i0_fu___float_mule8m23b_127nih_42664_43114;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_99_i1_fu___float_mule8m23b_127nih_42664_43130;
  wire [32:0] out_ui_bit_ior_expr_FU_0_64_64_102_i0_fu___float_mule8m23b_127nih_42664_43386;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i0_fu___float_mule8m23b_127nih_42664_42905;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_42664_42908;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i2_fu___float_mule8m23b_127nih_42664_42983;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_42664_42986;
  wire [9:0] out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_42664_45668;
  wire [9:0] out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_42664_45732;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_42664_45717;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_42664_45735;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42664_45786;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_42664_45523;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_42664_45532;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_42664_45723;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_42664_45729;
  wire out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_42664_42836;
  wire out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_42664_42922;
  wire out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_42664_46912;
  wire out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_42664_46916;
  wire out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_42664_46920;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_42664_46924;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_42664_46928;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_42664_46932;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_42664_46936;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_42664_46940;
  wire out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_42664_46944;
  wire out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_42664_46948;
  wire out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_42664_46952;
  wire out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_42664_46956;
  wire out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_42664_46960;
  wire out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_42664_46964;
  wire out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_42664_46968;
  wire out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_42664_46972;
  wire out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_42664_46450;
  wire out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_42664_45364;
  wire out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_42664_47266;
  wire out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_42664_47090;
  wire out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_42664_46473;
  wire out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42664_47471;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_42664_46283;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_42664_46789;
  wire out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_42664_46793;
  wire out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_42664_46797;
  wire out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_42664_46802;
  wire out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_42664_46807;
  wire out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_42664_46812;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_42664_46817;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_42664_46822;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_42664_46519;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_42664_46287;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_42664_42815;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_42664_45323;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_42664_45694;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_42664_45753;
  wire [47:0] out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_42664_43371;
  wire [32:0] out_ui_lshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_42664_43377;
  wire [46:0] out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_42664_43358;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_42664_45739;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_42664_45743;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_42664_45760;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_42664_45769;
  wire [47:0] out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_42664_43143;
  wire out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_42664_43474;
  wire out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_42664_43667;
  wire out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_42664_43675;
  wire [9:0] out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_42664_43346;
  wire [32:0] out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_121_i0_fu___float_mule8m23b_127nih_42664_42762;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_121_i1_fu___float_mule8m23b_127nih_42664_42781;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_42664_45326;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_42664_45687;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_42664_45749;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_42664_45746;
  wire [22:0] out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_mule8m23b_127nih_42664_43380;
  wire [22:0] out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_42664_45313;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_127_i0_fu___float_mule8m23b_127nih_42664_42990;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_42664_42993;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_42664_45763;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_42664_45772;
  wire [9:0] out_ui_ternary_plus_expr_FU_0_16_16_16_129_i0_fu___float_mule8m23b_127nih_42664_43096;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(15),
    .value(15'b100000000000000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b10000000000000000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(24),
    .value(24'b100000000000000000000000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1000000000000000000000000000000000000000000000000000000000000000)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(49),
    .value(49'b1000000000000111100010001000100011111111111111111)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1001)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10110)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10111)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101111)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010111)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11000)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11001)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11010)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11011)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11100)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11100000)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(12),
    .value(12'b111000001111)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11100001111)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011001)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11101)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11110)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111000100010001000100000000000011110000000000000000)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(21),
    .value(21'b111110000000011111111)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111111)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1111111100000000000000000000000)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1111111111)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b11111111111111110)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b11111111111111111)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(23),
    .value(23'b11111111111111111111111)) const_40 (.out1(out_const_40));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111110000001)) const_41 (.out1(out_const_41));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1111111111111111111111111111111)) const_42 (.out1(out_const_42));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_43 (.out1(out_const_43));
  constant_value #(.BITSIZE_out1(33),
    .value(33'b111111111111111111111111111111111)) const_44 (.out1(out_const_44));
  constant_value #(.BITSIZE_out1(47),
    .value(47'b11111111111111111111111111111111111111111111111)) const_45 (.out1(out_const_45));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10000000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b10000000000)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_in_port_a_64_32 (.out1(out_conv_in_port_a_64_32),
    .in1(in_port_a));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_in_port_b_64_32 (.out1(out_conv_in_port_b_64_32),
    .in1(in_port_b));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42664_45786_32_64 (.out1(out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42664_45786_32_64),
    .in1(out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42664_45786));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_42664_42754 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_42664_42754),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_40));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_42762 (.out1(out_ui_rshift_expr_FU_32_0_32_121_i0_fu___float_mule8m23b_127nih_42664_42762),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42664_42771 (.out1(out_ui_bit_and_expr_FU_8_0_8_98_i0_fu___float_mule8m23b_127nih_42664_42771),
    .in1(out_ui_rshift_expr_FU_32_0_32_121_i0_fu___float_mule8m23b_127nih_42664_42762),
    .in2(out_const_35));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42664_42774 (.out1(out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_42664_42774),
    .in1(out_ui_bit_and_expr_FU_8_0_8_98_i0_fu___float_mule8m23b_127nih_42664_42771));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_42781 (.out1(out_ui_rshift_expr_FU_32_0_32_121_i1_fu___float_mule8m23b_127nih_42664_42781),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42664_42786 (.out1(out_ui_bit_and_expr_FU_0_8_8_94_i0_fu___float_mule8m23b_127nih_42664_42786),
    .in1(out_const_35),
    .in2(out_ui_rshift_expr_FU_32_0_32_121_i1_fu___float_mule8m23b_127nih_42664_42781));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42664_42789 (.out1(out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_42664_42789),
    .in1(out_ui_bit_and_expr_FU_0_8_8_94_i0_fu___float_mule8m23b_127nih_42664_42786));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_42664_42792 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_42664_42792),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_40));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_42809 (.out1(out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_42664_42809),
    .in1(out_const_20),
    .in2(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_42664_46283),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_42664_46287),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_42812 (.out1(out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_42664_42812),
    .in1(out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_42664_42809));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_42815 (.out1(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_42664_42815),
    .in1(out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_42664_42812),
    .in2(out_const_4));
  ui_eq_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_42836 (.out1(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_42664_42836),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_42664_42754),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_42856 (.out1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_42664_42856),
    .in1(out_const_6),
    .in2(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_42664_42836),
    .in3(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42664_47534),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_42902 (.out1(out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_42664_42902),
    .in1(out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_42664_46266));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_42905 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i0_fu___float_mule8m23b_127nih_42664_42905),
    .in1(out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_42664_45739),
    .in2(out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_42664_45729));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_42908 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_42664_42908),
    .in1(out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_42664_42902),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_103_i0_fu___float_mule8m23b_127nih_42664_42905));
  ui_eq_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_42922 (.out1(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_42664_42922),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_42664_42792),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_42934 (.out1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_42664_42934),
    .in1(out_const_6),
    .in2(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_42664_42922),
    .in3(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42664_47542),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_42980 (.out1(out_UUdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_42664_42980),
    .in1(out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_42664_46270));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_42983 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i2_fu___float_mule8m23b_127nih_42664_42983),
    .in1(out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_42664_45743),
    .in2(out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_42664_45723));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_42986 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_42664_42986),
    .in1(out_UUdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_42664_42980),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_103_i2_fu___float_mule8m23b_127nih_42664_42983));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42664_42990 (.out1(out_ui_rshift_expr_FU_8_0_8_127_i0_fu___float_mule8m23b_127nih_42664_42990),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_42664_42908),
    .in2(out_const_1));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42664_42993 (.out1(out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_42664_42993),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_42664_42986),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43008 (.out1(out_ui_bit_and_expr_FU_1_1_1_95_i0_fu___float_mule8m23b_127nih_42664_43008),
    .in1(out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_42664_42993),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_42664_42986));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_42664_43014 (.out1(out_UIdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_42664_43014),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_42664_42908));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_43017 (.out1(out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_42664_43017),
    .in1(out_ui_rshift_expr_FU_8_0_8_127_i0_fu___float_mule8m23b_127nih_42664_42990));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_42664_43020 (.out1(out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_42664_43020),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_42664_42986));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_42664_43023 (.out1(out_bit_ior_expr_FU_8_8_8_90_i0_fu___float_mule8m23b_127nih_42664_43023),
    .in1(out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_42664_43020),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_42664_43017));
  bit_and_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(3),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_43026 (.out1(out_bit_and_expr_FU_8_8_8_89_i0_fu___float_mule8m23b_127nih_42664_43026),
    .in1(out_bit_ior_expr_FU_8_8_8_90_i0_fu___float_mule8m23b_127nih_42664_43023),
    .in2(out_UIdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_42664_43014));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43044 (.out1(out_UUdata_converter_FU_41_i0_fu___float_mule8m23b_127nih_42664_43044),
    .in1(out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_42664_46103));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_43047 (.out1(out_UIdata_converter_FU_42_i0_fu___float_mule8m23b_127nih_42664_43047),
    .in1(out_UUdata_converter_FU_41_i0_fu___float_mule8m23b_127nih_42664_43044));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_43050 (.out1(out_UIdata_converter_FU_48_i0_fu___float_mule8m23b_127nih_42664_43050),
    .in1(out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_42664_42993));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_43053 (.out1(out_bit_and_expr_FU_8_8_8_89_i1_fu___float_mule8m23b_127nih_42664_43053),
    .in1(out_UIdata_converter_FU_42_i0_fu___float_mule8m23b_127nih_42664_43047),
    .in2(out_UIdata_converter_FU_48_i0_fu___float_mule8m23b_127nih_42664_43050));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43062 (.out1(out_UUdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_42664_43062),
    .in1(out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_42664_46149));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_43065 (.out1(out_UIdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_42664_43065),
    .in1(out_UUdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_42664_43062));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_43068 (.out1(out_bit_and_expr_FU_8_8_8_89_i2_fu___float_mule8m23b_127nih_42664_43068),
    .in1(out_UIdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_42664_43065),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_42664_43017));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_42664_43096 (.out1(out_ui_ternary_plus_expr_FU_0_16_16_16_129_i0_fu___float_mule8m23b_127nih_42664_43096),
    .in1(out_const_41),
    .in2(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_42664_45986),
    .in3(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_42664_45988));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_42664_43114 (.out1(out_ui_bit_ior_expr_FU_0_32_32_99_i0_fu___float_mule8m23b_127nih_42664_43114),
    .in1(out_const_12),
    .in2(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_42664_42754));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_42664_43130 (.out1(out_ui_bit_ior_expr_FU_0_32_32_99_i1_fu___float_mule8m23b_127nih_42664_43130),
    .in1(out_const_12),
    .in2(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_42664_42792));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(32),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_42664_43134 (.out1(out_ui_bit_and_expr_FU_32_0_32_97_i0_fu___float_mule8m23b_127nih_42664_43134),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_99_i0_fu___float_mule8m23b_127nih_42664_43114),
    .in2(out_const_43));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(32),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_42664_43140 (.out1(out_ui_bit_and_expr_FU_32_0_32_97_i1_fu___float_mule8m23b_127nih_42664_43140),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_99_i1_fu___float_mule8m23b_127nih_42664_43130),
    .in2(out_const_43));
  ui_mult_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_out1(48),
    .PIPE_PARAMETER(0)) fu___float_mule8m23b_127nih_42664_43143 (.out1(out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_42664_43143),
    .clock(clock),
    .in1(out_ui_bit_and_expr_FU_32_0_32_97_i0_fu___float_mule8m23b_127nih_42664_43134),
    .in2(out_ui_bit_and_expr_FU_32_0_32_97_i1_fu___float_mule8m23b_127nih_42664_43140));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43340 (.out1(out_UUdata_converter_FU_53_i0_fu___float_mule8m23b_127nih_42664_43340),
    .in1(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_42664_46450));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43343 (.out1(out_UUdata_converter_FU_54_i0_fu___float_mule8m23b_127nih_42664_43343),
    .in1(out_UUdata_converter_FU_53_i0_fu___float_mule8m23b_127nih_42664_43340));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_42664_43346 (.out1(out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_42664_43346),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_1_reg_1));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43352 (.out1(out_UUdata_converter_FU_56_i0_fu___float_mule8m23b_127nih_42664_43352),
    .in1(out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_42664_46156));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_43355 (.out1(out_UIdata_converter_FU_57_i0_fu___float_mule8m23b_127nih_42664_43355),
    .in1(out_UUdata_converter_FU_56_i0_fu___float_mule8m23b_127nih_42664_43352));
  ui_lshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(2),
    .BITSIZE_out1(47),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_43358 (.out1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_42664_43358),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_4_reg_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(47),
    .BITSIZE_out1(47)) fu___float_mule8m23b_127nih_42664_43368 (.out1(out_ui_bit_and_expr_FU_0_64_64_92_i0_fu___float_mule8m23b_127nih_42664_43368),
    .in1(out_const_45),
    .in2(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_42664_43358));
  ui_lshift_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(2),
    .BITSIZE_out1(48),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_43371 (.out1(out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_42664_43371),
    .in1(out_ui_bit_and_expr_FU_0_64_64_92_i0_fu___float_mule8m23b_127nih_42664_43368),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_42664_43374 (.out1(out_UUdata_converter_FU_58_i0_fu___float_mule8m23b_127nih_42664_43374),
    .in1(out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_42664_43346));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(6),
    .BITSIZE_out1(33),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_43377 (.out1(out_ui_lshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_42664_43377),
    .in1(out_UUdata_converter_FU_58_i0_fu___float_mule8m23b_127nih_42664_43374),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(6),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_43380 (.out1(out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_mule8m23b_127nih_42664_43380),
    .in1(out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_42664_43371),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_42664_43383 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i2_fu___float_mule8m23b_127nih_42664_43383),
    .in1(out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_mule8m23b_127nih_42664_43380),
    .in2(out_const_40));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(23),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_42664_43386 (.out1(out_ui_bit_ior_expr_FU_0_64_64_102_i0_fu___float_mule8m23b_127nih_42664_43386),
    .in1(out_ui_lshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_42664_43377),
    .in2(out_ui_bit_and_expr_FU_32_0_32_96_i2_fu___float_mule8m23b_127nih_42664_43383));
  ui_bit_and_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(33),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_42664_43412 (.out1(out_ui_bit_and_expr_FU_0_64_64_93_i0_fu___float_mule8m23b_127nih_42664_43412),
    .in1(out_const_44),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_102_i0_fu___float_mule8m23b_127nih_42664_43386));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_42664_43471 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i3_fu___float_mule8m23b_127nih_42664_43471),
    .in1(out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_42664_45313),
    .in2(out_const_40));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43474 (.out1(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_42664_43474),
    .in1(out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_42664_45326),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43486 (.out1(out_UUdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_42664_43486),
    .in1(out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_42664_46170));
  ui_plus_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(1),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_42664_43496 (.out1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in1(out_ui_bit_and_expr_FU_0_64_64_93_i0_fu___float_mule8m23b_127nih_42664_43412),
    .in2(out_UUdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_42664_43486));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(33),
    .BITSIZE_out1(31)) fu___float_mule8m23b_127nih_42664_43589 (.out1(out_ui_bit_and_expr_FU_0_32_32_91_i0_fu___float_mule8m23b_127nih_42664_43589),
    .in1(out_const_42),
    .in2(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_42664_43592 (.out1(out_ui_bit_ior_expr_FU_0_32_32_100_i0_fu___float_mule8m23b_127nih_42664_43592),
    .in1(out_ui_bit_and_expr_FU_0_32_32_91_i0_fu___float_mule8m23b_127nih_42664_43589),
    .in2(out_reg_0_reg_0));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_42664_43645 (.out1(out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_42664_43645),
    .in1(out_const_36),
    .in2(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_42664_42815));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43667 (.out1(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_42664_43667),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_42664_42792),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43670 (.out1(out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_42664_43670),
    .in1(out_const_6),
    .in2(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_42664_43667),
    .in3(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42664_47542),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43675 (.out1(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_42664_43675),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_42664_42754),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_43678 (.out1(out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_42664_43678),
    .in1(out_const_6),
    .in2(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_42664_43675),
    .in3(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42664_47534),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_45049 (.out1(out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_42664_45049),
    .in1(out_const_11),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42664_47101),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42664_47104),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42664_47471),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42664_47387),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42664_47562),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_45313 (.out1(out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_42664_45313),
    .in1(out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_42664_43371),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_45323 (.out1(out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_42664_45323),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i3_fu___float_mule8m23b_127nih_42664_43471),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_45326 (.out1(out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_42664_45326),
    .in1(out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_42664_45323),
    .in2(out_const_5));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(4)) fu___float_mule8m23b_127nih_42664_45364 (.out1(out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_42664_45364),
    .in1(out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_42664_43346),
    .in2(out_const_15));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_45523 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_42664_45523),
    .in1(out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_42664_43670),
    .in2(out_const_19),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_45532 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_42664_45532),
    .in1(out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_42664_43678),
    .in2(out_const_19),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_in3(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_42664_45668 (.out1(out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_42664_45668),
    .in1(out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_42664_45049),
    .in2(out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_42664_45687),
    .in3(out_const_37));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_45673 (.out1(out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_42664_45673),
    .in1(out_const_38),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42664_47101),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42664_47104),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42664_47471),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42664_47387),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42664_47562),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_45687 (.out1(out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_42664_45687),
    .in1(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_42664_42815),
    .in2(out_const_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_45694 (.out1(out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_42664_45694),
    .in1(out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_42664_45668),
    .in2(out_const_16));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_45698 (.out1(out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_42664_45698),
    .in1(out_const_39),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42664_47101),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42664_47104),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42664_47471),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42664_47387),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42664_47562),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_45701 (.out1(out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_42664_45701),
    .in1(out_const_9),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_8_reg_8),
    .in4(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_42664_47576),
    .in5(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_42664_47580),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_45714 (.out1(out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_42664_45714),
    .in1(out_const_10),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_8_reg_8),
    .in4(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_42664_47576),
    .in5(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_42664_47580),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_42664_45717 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_42664_45717),
    .in1(out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_42664_45714),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_100_i0_fu___float_mule8m23b_127nih_42664_43592),
    .in3(out_reg_0_reg_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_45723 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_42664_45723),
    .in1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_42664_42934),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_42664_45523));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42664_45729 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_42664_45729),
    .in1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_42664_42856),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_42664_45532));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_in3(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_42664_45732 (.out1(out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_42664_45732),
    .in1(out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_42664_45673),
    .in2(out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_42664_45746),
    .in3(out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_42664_45749));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_42664_45735 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_42664_45735),
    .in1(out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_42664_45701),
    .in2(out_reg_5_reg_5),
    .in3(out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_42664_45717));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42664_45739 (.out1(out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_42664_45739),
    .in1(out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_42664_45763),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42664_45743 (.out1(out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_42664_45743),
    .in1(out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_42664_45772),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_45746 (.out1(out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_42664_45746),
    .in1(out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_42664_45694),
    .in2(out_const_16));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_45749 (.out1(out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_42664_45749),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_42664_43645),
    .in2(out_const_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42664_45753 (.out1(out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_42664_45753),
    .in1(out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_42664_45732),
    .in2(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_45756 (.out1(out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_42664_45756),
    .in1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_42664_42856));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42664_45760 (.out1(out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_42664_45760),
    .in1(out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_42664_45756),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42664_45763 (.out1(out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_42664_45763),
    .in1(out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_42664_45760),
    .in2(out_const_25));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_45766 (.out1(out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_42664_45766),
    .in1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_42664_42934));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42664_45769 (.out1(out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_42664_45769),
    .in1(out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_42664_45766),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42664_45772 (.out1(out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_42664_45772),
    .in1(out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_42664_45769),
    .in2(out_const_25));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_42664_45786 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42664_45786),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_7_reg_7),
    .in3(out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_42664_45735));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42664_45986 (.out1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_42664_45986),
    .in1(out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_42664_42774));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42664_45988 (.out1(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_42664_45988),
    .in1(out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_42664_42789));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_46103 (.out1(out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_42664_46103),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_42664_46912),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_42664_46916),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_42664_42836),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_42664_43675),
    .in6(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42664_47534),
    .in7(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_42664_47547),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_46149 (.out1(out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_42664_46149),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_42664_46944),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_42664_46948),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_42664_42922),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_42664_43667),
    .in6(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42664_47542),
    .in7(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_42664_47554),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_46156 (.out1(out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_42664_46156),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_42664_46450),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_46170 (.out1(out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_42664_46170),
    .in1(out_const_27),
    .in2(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_42664_43474),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_42664_47266),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_42664_47090),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_46266 (.out1(out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_42664_46266),
    .in1(out_const_28),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_42664_46912),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_42664_46916),
    .in4(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42664_47534),
    .in5(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_42664_47547),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_46270 (.out1(out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_42664_46270),
    .in1(out_const_28),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_42664_46944),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_42664_46948),
    .in4(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42664_47542),
    .in5(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_42664_47554),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46283 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_42664_46283),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46287 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_42664_46287),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(6)) fu___float_mule8m23b_127nih_42664_46450 (.out1(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_42664_46450),
    .in1(out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_42664_43143),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(6)) fu___float_mule8m23b_127nih_42664_46473 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_42664_46473),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in2(out_const_7));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46519 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_42664_46519),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46789 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_42664_46789),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46793 (.out1(out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_42664_46793),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46797 (.out1(out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_42664_46797),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46802 (.out1(out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_42664_46802),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46807 (.out1(out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_42664_46807),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46812 (.out1(out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_42664_46812),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46817 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_42664_46817),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46822 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_42664_46822),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42664_43496),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46912 (.out1(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_42664_46912),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46916 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_42664_46916),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46920 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_42664_46920),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46924 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_42664_46924),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46928 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_42664_46928),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46932 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_42664_46932),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46936 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_42664_46936),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46940 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_42664_46940),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46944 (.out1(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_42664_46944),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46948 (.out1(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_42664_46948),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46952 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_42664_46952),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46956 (.out1(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_42664_46956),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46960 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_42664_46960),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46964 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_42664_46964),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46968 (.out1(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_42664_46968),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_46972 (.out1(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_42664_46972),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_47090 (.out1(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_42664_47090),
    .in1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_42664_43358),
    .in2(out_const_17));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_42664_47101 (.out1(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42664_47101),
    .in1(out_bit_and_expr_FU_8_8_8_89_i1_fu___float_mule8m23b_127nih_42664_43053),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_42664_47104 (.out1(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42664_47104),
    .in1(out_bit_and_expr_FU_8_8_8_89_i2_fu___float_mule8m23b_127nih_42664_43068),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42664_47266 (.out1(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_42664_47266),
    .in1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_42664_43358),
    .in2(out_const_21));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_42664_47387 (.out1(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42664_47387),
    .in1(out_bit_and_expr_FU_8_8_8_89_i0_fu___float_mule8m23b_127nih_42664_43026),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_42664_47471 (.out1(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42664_47471),
    .in1(out_ui_bit_and_expr_FU_1_1_1_95_i0_fu___float_mule8m23b_127nih_42664_43008),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47530 (.out1(out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_42664_47530),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_42664_46912),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_42664_46916),
    .in4(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_42664_46920),
    .in5(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_42664_46924),
    .in6(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_42664_46936),
    .in7(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_42664_46940),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47534 (.out1(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42664_47534),
    .in1(out_const_8),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_42664_46928),
    .in3(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_42664_46932),
    .in4(out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_42664_47530),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47539 (.out1(out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_42664_47539),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_42664_46944),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_42664_46948),
    .in4(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_42664_46952),
    .in5(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_42664_46956),
    .in6(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_42664_46968),
    .in7(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_42664_46972),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47542 (.out1(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42664_47542),
    .in1(out_const_8),
    .in2(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_42664_46960),
    .in3(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_42664_46964),
    .in4(out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_42664_47539),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47547 (.out1(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_42664_47547),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_42664_46920),
    .in3(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_42664_46924),
    .in4(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_42664_46928),
    .in5(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_42664_46932),
    .in6(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_42664_46936),
    .in7(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_42664_46940),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47554 (.out1(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_42664_47554),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_42664_46952),
    .in3(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_42664_46956),
    .in4(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_42664_46960),
    .in5(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_42664_46964),
    .in6(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_42664_46968),
    .in7(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_42664_46972),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(49),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47562 (.out1(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42664_47562),
    .in1(out_const_14),
    .in2(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_42664_42836),
    .in3(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_42664_43675),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_42664_42922),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_42664_43667),
    .in6(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42664_47534),
    .in7(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42664_47542),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47569 (.out1(out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_42664_47569),
    .in1(out_const_5),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42664_47101),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42664_47104),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42664_47471),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42664_47387),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47572 (.out1(out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_42664_47572),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_42664_46789),
    .in3(out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_42664_46793),
    .in4(out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_42664_46797),
    .in5(out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_42664_46802),
    .in6(out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_42664_46817),
    .in7(out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_42664_46822),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47576 (.out1(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_42664_47576),
    .in1(out_const_29),
    .in2(out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_42664_46807),
    .in3(out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_42664_46812),
    .in4(out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_42664_46519),
    .in5(out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_42664_47572),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42664_47580 (.out1(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_42664_47580),
    .in1(out_const_34),
    .in2(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_42664_43474),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_42664_47266),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_42664_47090),
    .in5(out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_42664_45364),
    .in6(out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_42664_46473),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_42664_42815),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_plus_expr_FU_0_16_16_16_129_i0_fu___float_mule8m23b_127nih_42664_43096),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(48),
    .BITSIZE_out1(48)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_42664_43143),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_54_i0_fu___float_mule8m23b_127nih_42664_43343),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_57_i0_fu___float_mule8m23b_127nih_42664_43355),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_42664_43645),
    .wenable(wrenable_reg_5));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_42664_45698),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_42664_45753),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42664_47562),
    .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_42664_47569),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42664_45786_32_64;

endmodule

// FSM based controller description for __float_mule8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_mule8m23b_127nih(done_port,
  wrenable_reg_0,
  wrenable_reg_1,
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
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [1:0] S_0 = 2'b01,
    S_1 = 2'b10;
  reg [1:0] _present_state=S_0, _next_state;
  reg done_port;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
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
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_1;
          done_port = 1'b1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
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

// Top component for __float_mule8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_mule8m23b_127nih(clock,
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
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___float_mule8m23b_127nih Controller_i (.done_port(done_delayed_REG_signal_in),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
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
  datapath___float_mule8m23b_127nih Datapath_i (.return_port(return_port),
    .clock(clock),
    .reset(reset),
    .in_port_a(a),
    .in_port_b(b),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
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

// Datapath RTL description for _Z21matrix_multiplicationPKfS0_Pfjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath__Z21matrix_multiplicationPKfS0_Pfjjj(clock,
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
  fuselector_BMEMORY_CTRLN_21_i0_LOAD,
  fuselector_BMEMORY_CTRLN_21_i0_STORE,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664,
  selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0,
  selector_MUX_26_reg_0_0_0_0,
  selector_MUX_33_reg_2_0_0_0,
  selector_MUX_36_reg_5_0_0_0,
  selector_MUX_37_reg_6_0_0_0,
  selector_MUX_38_reg_7_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_B;
  input [31:0] in_port_C;
  input [31:0] in_port_n;
  input [31:0] in_port_m;
  input [31:0] in_port_w;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_21_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_21_i0_STORE;
  input selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660;
  input selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664;
  input selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0;
  input selector_MUX_26_reg_0_0_0_0;
  input selector_MUX_33_reg_2_0_0_0;
  input selector_MUX_36_reg_5_0_0_0;
  input selector_MUX_37_reg_6_0_0_0;
  input selector_MUX_38_reg_7_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
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
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712;
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716;
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718;
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720;
  output OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660;
  output OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664;
  // Component and signal declarations
  wire [31:0] null_out_signal_BMEMORY_CTRLN_21_i0_out1_1;
  wire [31:0] out_BMEMORY_CTRLN_21_i0_BMEMORY_CTRLN_21_i0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0;
  wire [31:0] out_MUX_26_reg_0_0_0_0;
  wire [31:0] out_MUX_33_reg_2_0_0_0;
  wire [31:0] out_MUX_36_reg_5_0_0_0;
  wire [31:0] out_MUX_37_reg_6_0_0_0;
  wire [29:0] out_MUX_38_reg_7_0_0_0;
  wire [31:0] out_UUdata_converter_FU_13_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44970;
  wire [31:0] out_UUdata_converter_FU_14_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44973;
  wire [31:0] out_UUdata_converter_FU_15_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44967;
  wire [31:0] out_UUdata_converter_FU_16_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44995;
  wire [31:0] out_UUdata_converter_FU_17_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44998;
  wire [31:0] out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44992;
  wire [63:0] out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660;
  wire [63:0] out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664;
  wire out_const_0;
  wire [6:0] out_const_1;
  wire out_const_2;
  wire [1:0] out_const_3;
  wire [7:0] out_const_4;
  wire [31:0] out_conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660_64_32;
  wire [31:0] out_conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664_64_32;
  wire [29:0] out_conv_out_const_0_1_30;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [5:0] out_conv_out_const_1_7_6;
  wire [63:0] out_conv_out_reg_10_reg_10_32_64;
  wire [63:0] out_conv_out_reg_11_reg_11_32_64;
  wire [63:0] out_conv_out_reg_12_reg_12_32_64;
  wire [63:0] out_conv_out_reg_13_reg_13_32_64;
  wire [29:0] out_conv_out_reg_6_reg_6_32_30;
  wire out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_45784;
  wire out_read_cond_FU_19_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718;
  wire out_read_cond_FU_20_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720;
  wire out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712;
  wire out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire [29:0] out_reg_1_reg_1;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [29:0] out_reg_7_reg_7;
  wire [29:0] out_reg_8_reg_8;
  wire out_reg_9_reg_9;
  wire out_ui_eq_expr_FU_32_0_32_22_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42640;
  wire out_ui_eq_expr_FU_32_0_32_22_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42642;
  wire out_ui_eq_expr_FU_32_0_32_22_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42644;
  wire out_ui_le_expr_FU_32_32_32_23_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42646;
  wire out_ui_le_expr_FU_32_32_32_23_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42648;
  wire out_ui_le_expr_FU_32_32_32_23_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42650;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_24_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36633;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_24_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36677;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_24_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36696;
  wire [29:0] out_ui_mult_expr_FU_32_32_32_0_25_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36641;
  wire [29:0] out_ui_mult_expr_FU_32_32_32_0_25_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36702;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_26_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36648;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_26_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36656;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36686;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_27_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36637;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_27_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36680;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_27_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36699;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36628;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_28_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36672;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_28_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36691;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [29:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [29:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire [31:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3;
  wire s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660;
  wire s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664;
  
  BMEMORY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
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
    .BITSIZE_M_Rdata_ram(32),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(32),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(32),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(6),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(6),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_21_i0 (.out1({null_out_signal_BMEMORY_CTRLN_21_i0_out1_1,
      out_BMEMORY_CTRLN_21_i0_BMEMORY_CTRLN_21_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0}),
    .in3({6'b000000,
      out_conv_out_const_1_7_6}),
    .in4({1'b0,
      out_const_2}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_21_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_21_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_21_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0),
    .in1(out_reg_3_reg_3),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36628));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_21_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_28_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36672),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_28_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36691));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_21_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_26_reg_0_0_0_0 (.out1(out_MUX_26_reg_0_0_0_0),
    .sel(selector_MUX_26_reg_0_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_26_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36648),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_33_reg_2_0_0_0 (.out1(out_MUX_33_reg_2_0_0_0),
    .sel(selector_MUX_33_reg_2_0_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_36_reg_5_0_0_0 (.out1(out_MUX_36_reg_5_0_0_0),
    .sel(selector_MUX_36_reg_5_0_0_0),
    .in1(out_BMEMORY_CTRLN_21_i0_BMEMORY_CTRLN_21_i0),
    .in2(out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44992));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_37_reg_6_0_0_0 (.out1(out_MUX_37_reg_6_0_0_0),
    .sel(selector_MUX_37_reg_6_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36686),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) MUX_38_reg_7_0_0_0 (.out1(out_MUX_38_reg_7_0_0_0),
    .sel(selector_MUX_38_reg_7_0_0_0),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in2(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_30));
  UUdata_converter_FU #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_conv_out_reg_6_reg_6_32_30));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_3 (.out1(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3),
    .in1(out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44992));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111110)) const_4 (.out1(out_const_4));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660_64_32 (.out1(out_conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660_64_32),
    .in1(out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664_64_32 (.out1(out_conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664_64_32),
    .in1(out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(30)) conv_out_const_0_1_30 (.out1(out_conv_out_const_0_1_30),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_1_7_6 (.out1(out_conv_out_const_1_7_6),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_10_reg_10_32_64 (.out1(out_conv_out_reg_10_reg_10_32_64),
    .in1(out_reg_10_reg_10));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_11_reg_11_32_64 (.out1(out_conv_out_reg_11_reg_11_32_64),
    .in1(out_reg_11_reg_11));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_12_reg_12_32_64 (.out1(out_conv_out_reg_12_reg_12_32_64),
    .in1(out_reg_12_reg_12));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_13_reg_13_32_64 (.out1(out_conv_out_reg_13_reg_13_32_64),
    .in1(out_reg_13_reg_13));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) conv_out_reg_6_reg_6_32_30 (.out1(out_conv_out_reg_6_reg_6_32_30),
    .in1(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36628 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36628),
    .in1(in_port_C),
    .in2(out_ui_lshift_expr_FU_32_0_32_24_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36633));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36633 (.out1(out_ui_lshift_expr_FU_32_0_32_24_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36633),
    .in1(out_ui_plus_expr_FU_32_32_32_27_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36637),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36637 (.out1(out_ui_plus_expr_FU_32_32_32_27_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36637),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_2_reg_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30),
    .PIPE_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36641 (.out1(out_ui_mult_expr_FU_32_32_32_0_25_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36641),
    .clock(clock),
    .in1(in_port_n),
    .in2(out_reg_0_reg_0));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36648 (.out1(out_ui_plus_expr_FU_32_0_32_26_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36648),
    .in1(out_reg_0_reg_0),
    .in2(out_const_2));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36656 (.out1(out_ui_plus_expr_FU_32_0_32_26_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36656),
    .in1(out_reg_2_reg_2),
    .in2(out_const_2));
  __float_adde8m23b_127nih fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660 (.done_port(s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660),
    .return_port(out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660),
    .a(out_conv_out_reg_13_reg_13_32_64),
    .b(out_conv_out_reg_10_reg_10_32_64));
  __float_mule8m23b_127nih fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664 (.done_port(s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664),
    .return_port(out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664),
    .a(out_conv_out_reg_11_reg_11_32_64),
    .b(out_conv_out_reg_12_reg_12_32_64));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36672 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_28_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36672),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_24_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36677));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36677 (.out1(out_ui_lshift_expr_FU_32_0_32_24_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36677),
    .in1(out_ui_plus_expr_FU_32_32_32_27_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36680),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36680 (.out1(out_ui_plus_expr_FU_32_32_32_27_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36680),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_6_reg_6));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36686 (.out1(out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36686),
    .in1(out_reg_6_reg_6),
    .in2(out_const_2));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36691 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_28_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36691),
    .in1(in_port_B),
    .in2(out_ui_lshift_expr_FU_32_0_32_24_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36696));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36696 (.out1(out_ui_lshift_expr_FU_32_0_32_24_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36696),
    .in1(out_ui_plus_expr_FU_32_32_32_27_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36699),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36699 (.out1(out_ui_plus_expr_FU_32_32_32_27_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36699),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_2_reg_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30),
    .PIPE_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36702 (.out1(out_ui_mult_expr_FU_32_32_32_0_25_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36702),
    .clock(clock),
    .in1(in_port_w),
    .in2(out_reg_7_reg_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712 (.out1(out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712),
    .in1(out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_45784));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716 (.out1(out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716),
    .in1(out_ui_le_expr_FU_32_32_32_23_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42646));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718 (.out1(out_read_cond_FU_19_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718),
    .in1(out_reg_9_reg_9));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720 (.out1(out_read_cond_FU_20_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720),
    .in1(out_ui_le_expr_FU_32_32_32_23_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42650));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42640 (.out1(out_ui_eq_expr_FU_32_0_32_22_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42640),
    .in1(in_port_n),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42642 (.out1(out_ui_eq_expr_FU_32_0_32_22_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42642),
    .in1(in_port_w),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42644 (.out1(out_ui_eq_expr_FU_32_0_32_22_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42644),
    .in1(in_port_m),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42646 (.out1(out_ui_le_expr_FU_32_32_32_23_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42646),
    .in1(in_port_n),
    .in2(out_reg_0_reg_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42648 (.out1(out_ui_le_expr_FU_32_32_32_23_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42648),
    .in1(in_port_m),
    .in2(out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36686));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42650 (.out1(out_ui_le_expr_FU_32_32_32_23_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42650),
    .in1(in_port_w),
    .in2(out_reg_4_reg_4));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44967 (.out1(out_UUdata_converter_FU_15_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44967),
    .in1(out_conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664_64_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44970 (.out1(out_UUdata_converter_FU_13_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44970),
    .in1(out_BMEMORY_CTRLN_21_i0_BMEMORY_CTRLN_21_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44973 (.out1(out_UUdata_converter_FU_14_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44973),
    .in1(out_BMEMORY_CTRLN_21_i0_BMEMORY_CTRLN_21_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44992 (.out1(out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44992),
    .in1(out_reg_14_reg_14));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44995 (.out1(out_UUdata_converter_FU_16_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44995),
    .in1(out_UUdata_converter_FU_15_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44967));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44998 (.out1(out_UUdata_converter_FU_17_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44998),
    .in1(out_reg_5_reg_5));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_45784 (.out1(out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_45784),
    .in1(out_const_4),
    .in2(out_ui_eq_expr_FU_32_0_32_22_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42640),
    .in3(out_ui_eq_expr_FU_32_0_32_22_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42642),
    .in4(out_ui_eq_expr_FU_32_0_32_22_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42644),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_26_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_25_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36641),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_17_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44998),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_13_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44970),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_14_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44973),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_16_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_44995),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660_64_32),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_33_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36628),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_26_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36656),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_36_reg_5_0_0_0),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_37_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_38_reg_7_0_0_0),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_25_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36702),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_le_expr_FU_32_32_32_23_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_42648),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712 = out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712;
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716 = out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716;
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718 = out_read_cond_FU_19_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718;
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720 = out_read_cond_FU_20_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720;
  assign OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660 = s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660;
  assign OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664 = s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664;

endmodule

// FSM based controller description for _Z21matrix_multiplicationPKfS0_Pfjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z21matrix_multiplicationPKfS0_Pfjjj(done_port,
  fuselector_BMEMORY_CTRLN_21_i0_LOAD,
  fuselector_BMEMORY_CTRLN_21_i0_STORE,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664,
  selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0,
  selector_MUX_26_reg_0_0_0_0,
  selector_MUX_33_reg_2_0_0_0,
  selector_MUX_36_reg_5_0_0_0,
  selector_MUX_37_reg_6_0_0_0,
  selector_MUX_38_reg_7_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712;
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716;
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718;
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720;
  input OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660;
  input OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_21_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_21_i0_STORE;
  output selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660;
  output selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664;
  output selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0;
  output selector_MUX_26_reg_0_0_0_0;
  output selector_MUX_33_reg_2_0_0_0;
  output selector_MUX_36_reg_5_0_0_0;
  output selector_MUX_37_reg_6_0_0_0;
  output selector_MUX_38_reg_7_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [16:0] S_0 = 17'b00000000000000001,
    S_15 = 17'b01000000000000000,
    S_1 = 17'b00000000000000010,
    S_2 = 17'b00000000000000100,
    S_3 = 17'b00000000000001000,
    S_5 = 17'b00000000000100000,
    S_6 = 17'b00000000001000000,
    S_7 = 17'b00000000010000000,
    S_8 = 17'b00000000100000000,
    S_9 = 17'b00000001000000000,
    S_10 = 17'b00000010000000000,
    S_11 = 17'b00000100000000000,
    S_12 = 17'b00001000000000000,
    S_13 = 17'b00010000000000000,
    S_14 = 17'b00100000000000000,
    S_4 = 17'b00000000000010000,
    S_16 = 17'b10000000000000000;
  reg [16:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_21_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_21_i0_STORE;
  reg selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660;
  reg selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664;
  reg selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0;
  reg selector_MUX_26_reg_0_0_0_0;
  reg selector_MUX_33_reg_2_0_0_0;
  reg selector_MUX_36_reg_5_0_0_0;
  reg selector_MUX_37_reg_6_0_0_0;
  reg selector_MUX_38_reg_7_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
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
    fuselector_BMEMORY_CTRLN_21_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_21_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660 = 1'b0;
    selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0 = 1'b0;
    selector_MUX_26_reg_0_0_0_0 = 1'b0;
    selector_MUX_33_reg_2_0_0_0 = 1'b0;
    selector_MUX_36_reg_5_0_0_0 = 1'b0;
    selector_MUX_37_reg_6_0_0_0 = 1'b0;
    selector_MUX_38_reg_7_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
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
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_15;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_15 :
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_MUX_26_reg_0_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          fuselector_BMEMORY_CTRLN_21_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          selector_MUX_36_reg_5_0_0_0 = 1'b1;
          selector_MUX_38_reg_7_0_0_0 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          fuselector_BMEMORY_CTRLN_21_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1 = 1'b1;
          selector_MUX_37_reg_6_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          fuselector_BMEMORY_CTRLN_21_i0_LOAD = 1'b1;
          wrenable_reg_11 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          wrenable_reg_12 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          wrenable_reg_13 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          _next_state = S_12;
        end
      S_12 :
        begin
          wrenable_reg_14 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          fuselector_BMEMORY_CTRLN_21_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_7 = 1'b1;
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718 == 1'b1)
            begin
              _next_state = S_14;
              wrenable_reg_5 = 1'b0;
              wrenable_reg_7 = 1'b0;
            end
          else
            begin
              _next_state = S_5;
            end
        end
      S_14 :
        begin
          selector_MUX_33_reg_2_0_0_0 = 1'b1;
          wrenable_reg_2 = 1'b1;
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720 == 1'b1)
            begin
              _next_state = S_4;
              selector_MUX_33_reg_2_0_0_0 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
          else
            begin
              _next_state = S_2;
            end
        end
      S_4 :
        begin
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_16;
              done_port = 1'b1;
            end
        end
      S_16 :
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

// Top component for _Z21matrix_multiplicationPKfS0_Pfjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __Z21matrix_multiplicationPKfS0_Pfjjj(clock,
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
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712;
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716;
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718;
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720;
  wire OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660;
  wire OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_21_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_21_i0_STORE;
  wire selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660;
  wire selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664;
  wire selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0;
  wire selector_MUX_26_reg_0_0_0_0;
  wire selector_MUX_33_reg_2_0_0_0;
  wire selector_MUX_36_reg_5_0_0_0;
  wire selector_MUX_37_reg_6_0_0_0;
  wire selector_MUX_38_reg_7_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller__Z21matrix_multiplicationPKfS0_Pfjjj Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_21_i0_LOAD(fuselector_BMEMORY_CTRLN_21_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_21_i0_STORE(fuselector_BMEMORY_CTRLN_21_i0_STORE),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664),
    .selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0),
    .selector_MUX_26_reg_0_0_0_0(selector_MUX_26_reg_0_0_0_0),
    .selector_MUX_33_reg_2_0_0_0(selector_MUX_33_reg_2_0_0_0),
    .selector_MUX_36_reg_5_0_0_0(selector_MUX_36_reg_5_0_0_0),
    .selector_MUX_37_reg_6_0_0_0(selector_MUX_37_reg_6_0_0_0),
    .selector_MUX_38_reg_7_0_0_0(selector_MUX_38_reg_7_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z21matrix_multiplicationPKfS0_Pfjjj Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36712),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36716),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36718),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36720),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664),
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
    .fuselector_BMEMORY_CTRLN_21_i0_LOAD(fuselector_BMEMORY_CTRLN_21_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_21_i0_STORE(fuselector_BMEMORY_CTRLN_21_i0_STORE),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36660),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35606_36664),
    .selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_1_0),
    .selector_MUX_26_reg_0_0_0_0(selector_MUX_26_reg_0_0_0_0),
    .selector_MUX_33_reg_2_0_0_0(selector_MUX_33_reg_2_0_0_0),
    .selector_MUX_36_reg_5_0_0_0(selector_MUX_36_reg_5_0_0_0),
    .selector_MUX_37_reg_6_0_0_0(selector_MUX_37_reg_6_0_0_0),
    .selector_MUX_38_reg_7_0_0_0(selector_MUX_38_reg_7_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
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

// Minimal interface for function: _Z21matrix_multiplicationPKfS0_Pfjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _Z21matrix_multiplicationPKfS0_Pfjjj(clock,
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
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  
  __Z21matrix_multiplicationPKfS0_Pfjjj __Z21matrix_multiplicationPKfS0_Pfjjj_i0 (.done_port(done_port),
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
    .Min_Wdata_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_data_ram_size({6'b000000,
      6'b000000}));

endmodule


