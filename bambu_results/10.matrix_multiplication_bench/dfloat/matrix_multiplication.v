// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-04-09T09:49:20
// Bambu executed with: bambu --top-fname=matrix_multiplication -DFLOAT cpu_functions.cpp 
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
  wire [4:0] out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_44073_47967;
  wire [7:0] out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_44073_47965;
  wire [0:0] out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_44073_44808;
  wire [0:0] out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_44073_44829;
  wire [0:0] out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_44073_44849;
  wire [0:0] out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_44073_44869;
  wire [26:0] out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_44073_44232;
  wire [31:0] out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_44073_44164;
  wire [4:0] out_IUdata_converter_FU_50_i0_fu___float_adde8m23b_127nih_44073_44546;
  wire signed [1:0] out_UIdata_converter_FU_2_i0_fu___float_adde8m23b_127nih_44073_44155;
  wire signed [1:0] out_UIdata_converter_FU_49_i0_fu___float_adde8m23b_127nih_44073_44537;
  wire signed [1:0] out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_44073_46270;
  wire signed [1:0] out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_44073_46280;
  wire signed [1:0] out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_44073_46289;
  wire signed [1:0] out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_44073_46298;
  wire signed [1:0] out_UIdata_converter_FU_9_i0_fu___float_adde8m23b_127nih_44073_44223;
  wire out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_44073_46307;
  wire out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_44073_45107;
  wire out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_44073_47963;
  wire out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_44073_47957;
  wire out_UUdata_converter_FU_43_i0_fu___float_adde8m23b_127nih_44073_44323;
  wire out_UUdata_converter_FU_44_i0_fu___float_adde8m23b_127nih_44073_44337;
  wire [4:0] out_UUdata_converter_FU_51_i0_fu___float_adde8m23b_127nih_44073_44549;
  wire [4:0] out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_44073_44558;
  wire out_UUdata_converter_FU_54_i0_fu___float_adde8m23b_127nih_44073_44630;
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
  wire [63:0] out_conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_44073_45274_32_64;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_144_i0_fu___float_adde8m23b_127nih_44073_44540;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_44073_46274;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_44073_46283;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_44073_46292;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_44073_46301;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_146_i0_fu___float_adde8m23b_127nih_44073_44158;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_146_i1_fu___float_adde8m23b_127nih_44073_44226;
  wire out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_44073_51117;
  wire out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_44073_51121;
  wire out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_44073_51124;
  wire out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_44073_51128;
  wire out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_44073_51132;
  wire out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_44073_51136;
  wire out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_44073_51139;
  wire out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_44073_44982;
  wire out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_44073_51145;
  wire out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_44073_51148;
  wire out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_44073_51151;
  wire out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_44073_51155;
  wire out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_44073_48266;
  wire out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_44073_51160;
  wire out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_44073_51164;
  wire out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_44073_51168;
  wire out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_44073_51171;
  wire out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_44073_51175;
  wire out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_44073_51179;
  wire out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_44073_51183;
  wire out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_44073_51186;
  wire out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_44073_51190;
  wire out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_44073_51194;
  wire out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_44073_51198;
  wire out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_44073_46162;
  wire out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_44073_51202;
  wire out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_44073_46184;
  wire out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_44073_46231;
  wire out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_44073_48383;
  wire out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_44073_46247;
  wire out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_44073_46335;
  wire out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_44073_48372;
  wire out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_44073_51213;
  wire out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_44073_48379;
  wire out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_44073_51045;
  wire out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_44073_51049;
  wire out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_44073_51053;
  wire out_lut_expr_FU_30_i0_fu___float_adde8m23b_127nih_44073_44279;
  wire out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_44073_51058;
  wire out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_44073_51062;
  wire out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_44073_51066;
  wire out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_44073_44287;
  wire out_lut_expr_FU_48_i0_fu___float_adde8m23b_127nih_44073_44534;
  wire out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_44073_44589;
  wire out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_44073_51074;
  wire out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_44073_51078;
  wire out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_44073_51082;
  wire out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458;
  wire out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_44073_51087;
  wire out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_44073_51091;
  wire out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_44073_51094;
  wire out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_44073_51097;
  wire out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462;
  wire out_lut_expr_FU_8_i0_fu___float_adde8m23b_127nih_44073_44220;
  wire out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_44073_51101;
  wire out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_44073_51104;
  wire out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_44073_51108;
  wire out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466;
  wire out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_44073_51112;
  wire out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_44073_45520;
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
  wire signed [0:0] out_rshift_expr_FU_32_0_32_147_i0_fu___float_adde8m23b_127nih_44073_44543;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_44073_46277;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_44073_46286;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_44073_46295;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_44073_46304;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_149_i0_fu___float_adde8m23b_127nih_44073_44161;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_149_i1_fu___float_adde8m23b_127nih_44073_44229;
  wire [25:0] out_ui_bit_and_expr_FU_0_32_32_150_i0_fu___float_adde8m23b_127nih_44073_44605;
  wire [26:0] out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_44073_44638;
  wire [15:0] out_ui_bit_and_expr_FU_16_0_16_152_i0_fu___float_adde8m23b_127nih_44073_44673;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_153_i0_fu___float_adde8m23b_127nih_44073_44136;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_153_i1_fu___float_adde8m23b_127nih_44073_44143;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_44073_44189;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_44073_44246;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i2_fu___float_adde8m23b_127nih_44073_45068;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_44073_45142;
  wire [26:0] out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_44073_44624;
  wire [31:0] out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170;
  wire [23:0] out_ui_bit_and_expr_FU_32_32_32_156_i1_fu___float_adde8m23b_127nih_44073_44576;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_44073_44201;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i1_fu___float_adde8m23b_127nih_44073_44252;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_157_i2_fu___float_adde8m23b_127nih_44073_44353;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i3_fu___float_adde8m23b_127nih_44073_45055;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_44073_45137;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_158_i0_fu___float_adde8m23b_127nih_44073_44555;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_44073_45975;
  wire [26:0] out_ui_bit_ior_concat_expr_FU_160_i0_fu___float_adde8m23b_127nih_44073_44627;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_161_i0_fu___float_adde8m23b_127nih_44073_44329;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_162_i0_fu___float_adde8m23b_127nih_44073_44343;
  wire [30:0] out_ui_bit_ior_expr_FU_0_32_32_163_i0_fu___float_adde8m23b_127nih_44073_45073;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_44073_45271;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_44073_45274;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde8m23b_127nih_44073_44835;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde8m23b_127nih_44073_44875;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu___float_adde8m23b_127nih_44073_44878;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu___float_adde8m23b_127nih_44073_44883;
  wire [22:0] out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_44073_45243;
  wire [4:0] out_ui_bit_ior_expr_FU_8_8_8_171_i0_fu___float_adde8m23b_127nih_44073_44552;
  wire [25:0] out_ui_bit_not_expr_FU_32_32_172_i0_fu___float_adde8m23b_127nih_44073_44573;
  wire [31:0] out_ui_bit_xor_expr_FU_32_32_32_173_i0_fu___float_adde8m23b_127nih_44073_44167;
  wire [30:0] out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_44073_44173;
  wire [30:0] out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_44073_44178;
  wire [26:0] out_ui_bit_xor_expr_FU_32_32_32_173_i3_fu___float_adde8m23b_127nih_44073_44610;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_44073_46196;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_44073_46208;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_44073_46212;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_44073_46220;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_44073_46226;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_44073_46244;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_44073_46253;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_44073_46262;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_44073_46339;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_44073_47961;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_44073_46192;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_44073_46234;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_44073_46242;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_44073_46260;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_44073_46337;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_44073_47959;
  wire out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454;
  wire out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_44073_44586;
  wire out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_44073_49331;
  wire out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49334;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_44073_49338;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49341;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49345;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49348;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_44073_49352;
  wire out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49355;
  wire out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_44073_49359;
  wire out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49362;
  wire out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_44073_49366;
  wire out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49369;
  wire out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_44073_49373;
  wire out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49376;
  wire out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_44073_49380;
  wire out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49383;
  wire out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_44073_49387;
  wire out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_44073_49394;
  wire out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_44073_49401;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_44073_49408;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_44073_49415;
  wire out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_44073_49422;
  wire out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_44073_49429;
  wire out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_44073_49436;
  wire out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_44073_48911;
  wire out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_44073_48915;
  wire out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_44073_48919;
  wire out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_44073_50149;
  wire out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_44073_49892;
  wire out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_44073_50153;
  wire out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_44073_49900;
  wire out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48833;
  wire out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_44073_50157;
  wire out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_44073_49908;
  wire out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_44073_50161;
  wire out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_44073_49916;
  wire out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_44073_50165;
  wire out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_44073_49924;
  wire out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_44073_50169;
  wire out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_44073_49932;
  wire out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_44073_50173;
  wire out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_44073_49940;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_44073_48836;
  wire out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_44073_50177;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_44073_49949;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_44073_50431;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_44073_50699;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_44073_50443;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48840;
  wire out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_44073_50703;
  wire out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_44073_50455;
  wire out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_44073_50707;
  wire out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_44073_50467;
  wire out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_44073_50925;
  wire out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_44073_50937;
  wire out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_44073_51027;
  wire [25:0] out_ui_lshift_expr_FU_0_64_64_178_i0_fu___float_adde8m23b_127nih_44073_44570;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_179_i0_fu___float_adde8m23b_127nih_44073_44326;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_179_i1_fu___float_adde8m23b_127nih_44073_44340;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_179_i2_fu___float_adde8m23b_127nih_44073_45052;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_44073_45268;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_180_i0_fu___float_adde8m23b_127nih_44073_44332;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_44073_44346;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_181_i0_fu___float_adde8m23b_127nih_44073_44685;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_182_i0_fu___float_adde8m23b_127nih_44073_44711;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_44073_44739;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_44073_44767;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_44073_44774;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_186_i0_fu___float_adde8m23b_127nih_44073_45240;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_44073_45950;
  wire [26:0] out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_44073_45971;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_44073_50313;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_44073_46321;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_44073_47977;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_44073_50578;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_44073_46310;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_193_i0_fu___float_adde8m23b_127nih_44073_44811;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_194_i0_fu___float_adde8m23b_127nih_44073_44832;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_195_i0_fu___float_adde8m23b_127nih_44073_44852;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde8m23b_127nih_44073_44872;
  wire out_ui_lt_expr_FU_32_32_32_197_i0_fu___float_adde8m23b_127nih_44073_44150;
  wire [7:0] out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_44073_44290;
  wire out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_44073_44260;
  wire out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_44073_44265;
  wire out_ui_ne_expr_FU_32_0_32_200_i0_fu___float_adde8m23b_127nih_44073_44581;
  wire [26:0] out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633;
  wire [30:0] out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_44073_45110;
  wire [24:0] out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_44073_45968;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i0_fu___float_adde8m23b_127nih_44073_44192;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i1_fu___float_adde8m23b_127nih_44073_44249;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i2_fu___float_adde8m23b_127nih_44073_45134;
  wire [15:0] out_ui_rshift_expr_FU_32_0_32_203_i0_fu___float_adde8m23b_127nih_44073_44670;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_44073_45065;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_44073_45941;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_44073_45953;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_44073_45946;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_44073_45962;
  wire [24:0] out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_44073_45965;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_44073_50306;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_44073_50309;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_44073_46317;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_44073_50571;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_44073_50574;
  wire [25:0] out_ui_rshift_expr_FU_32_32_32_209_i0_fu___float_adde8m23b_127nih_44073_44561;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_44073_46313;
  wire [7:0] out_ui_ternary_pm_expr_FU_8_0_8_8_211_i0_fu___float_adde8m23b_127nih_44073_45058;
  
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
    .BITSIZE_out1(64)) conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_44073_45274_32_64 (.out1(out_conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_44073_45274_32_64),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_44073_45274));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_44073_44136 (.out1(out_ui_bit_and_expr_FU_32_0_32_153_i0_fu___float_adde8m23b_127nih_44073_44136),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_84));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_44073_44143 (.out1(out_ui_bit_and_expr_FU_32_0_32_153_i1_fu___float_adde8m23b_127nih_44073_44143),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_84));
  ui_lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44150 (.out1(out_ui_lt_expr_FU_32_32_32_197_i0_fu___float_adde8m23b_127nih_44073_44150),
    .in1(out_ui_bit_and_expr_FU_32_0_32_153_i0_fu___float_adde8m23b_127nih_44073_44136),
    .in2(out_ui_bit_and_expr_FU_32_0_32_153_i1_fu___float_adde8m23b_127nih_44073_44143));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_44155 (.out1(out_UIdata_converter_FU_2_i0_fu___float_adde8m23b_127nih_44073_44155),
    .in1(out_ui_lt_expr_FU_32_32_32_197_i0_fu___float_adde8m23b_127nih_44073_44150));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44158 (.out1(out_lshift_expr_FU_64_0_64_146_i0_fu___float_adde8m23b_127nih_44073_44158),
    .in1(out_UIdata_converter_FU_2_i0_fu___float_adde8m23b_127nih_44073_44155),
    .in2(out_const_12));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44161 (.out1(out_rshift_expr_FU_64_0_64_149_i0_fu___float_adde8m23b_127nih_44073_44161),
    .in1(out_lshift_expr_FU_64_0_64_146_i0_fu___float_adde8m23b_127nih_44073_44158),
    .in2(out_const_12));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_44073_44164 (.out1(out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_44073_44164),
    .in1(out_rshift_expr_FU_64_0_64_149_i0_fu___float_adde8m23b_127nih_44073_44161));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_44073_44167 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i0_fu___float_adde8m23b_127nih_44073_44167),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_conv_in_port_b_64_32));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_44073_44170 (.out1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i0_fu___float_adde8m23b_127nih_44073_44167),
    .in2(out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_44073_44164));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_44073_44173 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_44073_44173),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_44073_44178 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_44073_44178),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_44189 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_44073_44189),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_44073_44173),
    .in2(out_const_81));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44192 (.out1(out_ui_rshift_expr_FU_32_0_32_202_i0_fu___float_adde8m23b_127nih_44073_44192),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_44073_44173),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_44201 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_44073_44201),
    .in1(out_ui_rshift_expr_FU_32_0_32_202_i0_fu___float_adde8m23b_127nih_44073_44192),
    .in2(out_const_78));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44220 (.out1(out_lut_expr_FU_8_i0_fu___float_adde8m23b_127nih_44073_44220),
    .in1(out_const_45),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48833),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48840),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_44223 (.out1(out_UIdata_converter_FU_9_i0_fu___float_adde8m23b_127nih_44073_44223),
    .in1(out_lut_expr_FU_8_i0_fu___float_adde8m23b_127nih_44073_44220));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44226 (.out1(out_lshift_expr_FU_64_0_64_146_i1_fu___float_adde8m23b_127nih_44073_44226),
    .in1(out_UIdata_converter_FU_9_i0_fu___float_adde8m23b_127nih_44073_44223),
    .in2(out_const_12));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44229 (.out1(out_rshift_expr_FU_64_0_64_149_i1_fu___float_adde8m23b_127nih_44073_44229),
    .in1(out_lshift_expr_FU_64_0_64_146_i1_fu___float_adde8m23b_127nih_44073_44226),
    .in2(out_const_12));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_44073_44232 (.out1(out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_44073_44232),
    .in1(out_rshift_expr_FU_64_0_64_149_i1_fu___float_adde8m23b_127nih_44073_44229));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_44246 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_44073_44246),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_44073_44178),
    .in2(out_const_81));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44249 (.out1(out_ui_rshift_expr_FU_32_0_32_202_i1_fu___float_adde8m23b_127nih_44073_44249),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_44073_44178),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_44252 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i1_fu___float_adde8m23b_127nih_44073_44252),
    .in1(out_ui_rshift_expr_FU_32_0_32_202_i1_fu___float_adde8m23b_127nih_44073_44249),
    .in2(out_const_78));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44260 (.out1(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_44073_44260),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_44073_44189),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44265 (.out1(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_44073_44265),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_44073_44246),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44279 (.out1(out_lut_expr_FU_30_i0_fu___float_adde8m23b_127nih_44073_44279),
    .in1(out_const_60),
    .in2(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_44073_49366),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49369),
    .in4(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_44073_49373),
    .in5(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49376),
    .in6(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_44073_51045),
    .in7(out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_44073_51053),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44287 (.out1(out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_44073_44287),
    .in1(out_const_74),
    .in2(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49362),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49369),
    .in4(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_44073_49415),
    .in5(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_44073_49422),
    .in6(out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_44073_51066),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_minus_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_44290 (.out1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_44073_44290),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_44073_44201),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i1_fu___float_adde8m23b_127nih_44073_44252));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44323 (.out1(out_UUdata_converter_FU_43_i0_fu___float_adde8m23b_127nih_44073_44323),
    .in1(out_lut_expr_FU_30_i0_fu___float_adde8m23b_127nih_44073_44279));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44326 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i0_fu___float_adde8m23b_127nih_44073_44326),
    .in1(out_UUdata_converter_FU_43_i0_fu___float_adde8m23b_127nih_44073_44323),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_44073_44329 (.out1(out_ui_bit_ior_expr_FU_0_32_32_161_i0_fu___float_adde8m23b_127nih_44073_44329),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i0_fu___float_adde8m23b_127nih_44073_44326),
    .in2(out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_44073_44189));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44332 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i0_fu___float_adde8m23b_127nih_44073_44332),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_161_i0_fu___float_adde8m23b_127nih_44073_44329),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44337 (.out1(out_UUdata_converter_FU_44_i0_fu___float_adde8m23b_127nih_44073_44337),
    .in1(out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_44073_44287));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44340 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i1_fu___float_adde8m23b_127nih_44073_44340),
    .in1(out_UUdata_converter_FU_44_i0_fu___float_adde8m23b_127nih_44073_44337),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(24),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_44073_44343 (.out1(out_ui_bit_ior_expr_FU_0_32_32_162_i0_fu___float_adde8m23b_127nih_44073_44343),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_44073_44246),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i1_fu___float_adde8m23b_127nih_44073_44340));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44346 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_44073_44346),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_162_i0_fu___float_adde8m23b_127nih_44073_44343),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_44353 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i2_fu___float_adde8m23b_127nih_44073_44353),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_44073_44290),
    .in2(out_const_78));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44534 (.out1(out_lut_expr_FU_48_i0_fu___float_adde8m23b_127nih_44073_44534),
    .in1(out_const_77),
    .in2(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_44073_48911),
    .in3(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_44073_48915),
    .in4(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_44073_48919),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_44537 (.out1(out_UIdata_converter_FU_49_i0_fu___float_adde8m23b_127nih_44073_44537),
    .in1(out_lut_expr_FU_48_i0_fu___float_adde8m23b_127nih_44073_44534));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_44540 (.out1(out_lshift_expr_FU_32_0_32_144_i0_fu___float_adde8m23b_127nih_44073_44540),
    .in1(out_UIdata_converter_FU_49_i0_fu___float_adde8m23b_127nih_44073_44537),
    .in2(out_const_11));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_44543 (.out1(out_rshift_expr_FU_32_0_32_147_i0_fu___float_adde8m23b_127nih_44073_44543),
    .in1(out_lshift_expr_FU_32_0_32_144_i0_fu___float_adde8m23b_127nih_44073_44540),
    .in2(out_const_11));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_44546 (.out1(out_IUdata_converter_FU_50_i0_fu___float_adde8m23b_127nih_44073_44546),
    .in1(out_rshift_expr_FU_32_0_32_147_i0_fu___float_adde8m23b_127nih_44073_44543));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_44549 (.out1(out_UUdata_converter_FU_51_i0_fu___float_adde8m23b_127nih_44073_44549),
    .in1(out_IUdata_converter_FU_50_i0_fu___float_adde8m23b_127nih_44073_44546));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_44552 (.out1(out_ui_bit_ior_expr_FU_8_8_8_171_i0_fu___float_adde8m23b_127nih_44073_44552),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i2_fu___float_adde8m23b_127nih_44073_44353),
    .in2(out_UUdata_converter_FU_51_i0_fu___float_adde8m23b_127nih_44073_44549));
  ui_bit_and_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_44555 (.out1(out_ui_bit_and_expr_FU_8_0_8_158_i0_fu___float_adde8m23b_127nih_44073_44555),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_171_i0_fu___float_adde8m23b_127nih_44073_44552),
    .in2(out_const_75));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_44558 (.out1(out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_44073_44558),
    .in1(out_ui_bit_and_expr_FU_8_0_8_158_i0_fu___float_adde8m23b_127nih_44073_44555));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(5),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44561 (.out1(out_ui_rshift_expr_FU_32_32_32_209_i0_fu___float_adde8m23b_127nih_44073_44561),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_44073_44346),
    .in2(out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_44073_44558));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44570 (.out1(out_ui_lshift_expr_FU_0_64_64_178_i0_fu___float_adde8m23b_127nih_44073_44570),
    .in1(out_const_86),
    .in2(out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_44073_44558));
  ui_bit_not_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_44073_44573 (.out1(out_ui_bit_not_expr_FU_32_32_172_i0_fu___float_adde8m23b_127nih_44073_44573),
    .in1(out_ui_lshift_expr_FU_0_64_64_178_i0_fu___float_adde8m23b_127nih_44073_44570));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_44073_44576 (.out1(out_ui_bit_and_expr_FU_32_32_32_156_i1_fu___float_adde8m23b_127nih_44073_44576),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_44073_45941),
    .in2(out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_44073_45946));
  ui_ne_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44581 (.out1(out_ui_ne_expr_FU_32_0_32_200_i0_fu___float_adde8m23b_127nih_44073_44581),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_44073_45953),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44586 (.out1(out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_44073_44586),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_44073_45953),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44589 (.out1(out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_44073_44589),
    .in1(out_const_48),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48833),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48840),
    .in4(out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_44073_44586),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_44073_44605 (.out1(out_ui_bit_and_expr_FU_0_32_32_150_i0_fu___float_adde8m23b_127nih_44073_44605),
    .in1(out_const_82),
    .in2(out_ui_rshift_expr_FU_32_32_32_209_i0_fu___float_adde8m23b_127nih_44073_44561));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_44073_44610 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i3_fu___float_adde8m23b_127nih_44073_44610),
    .in1(out_ui_bit_and_expr_FU_0_32_32_150_i0_fu___float_adde8m23b_127nih_44073_44605),
    .in2(out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_44073_44232));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_44073_44624 (.out1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_44073_44624),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i3_fu___float_adde8m23b_127nih_44073_44610),
    .in2(out_const_83));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(27),
    .OFFSET_PARAMETER(2)) fu___float_adde8m23b_127nih_44073_44627 (.out1(out_ui_bit_ior_concat_expr_FU_160_i0_fu___float_adde8m23b_127nih_44073_44627),
    .in1(out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_44073_45971),
    .in2(out_reg_4_reg_4),
    .in3(out_const_14));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44630 (.out1(out_UUdata_converter_FU_54_i0_fu___float_adde8m23b_127nih_44073_44630),
    .in1(out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_44073_44589));
  ui_plus_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_44073_44633 (.out1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in1(out_ui_bit_ior_concat_expr_FU_160_i0_fu___float_adde8m23b_127nih_44073_44627),
    .in2(out_reg_1_reg_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_44073_44638 (.out1(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_44073_44638),
    .in1(out_const_83),
    .in2(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44670 (.out1(out_ui_rshift_expr_FU_32_0_32_203_i0_fu___float_adde8m23b_127nih_44073_44670),
    .in1(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_44073_44638),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu___float_adde8m23b_127nih_44073_44673 (.out1(out_ui_bit_and_expr_FU_16_0_16_152_i0_fu___float_adde8m23b_127nih_44073_44673),
    .in1(out_ui_rshift_expr_FU_32_0_32_203_i0_fu___float_adde8m23b_127nih_44073_44670),
    .in2(out_const_80));
  ui_lshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(6),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44685 (.out1(out_ui_lshift_expr_FU_32_0_32_181_i0_fu___float_adde8m23b_127nih_44073_44685),
    .in1(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_44073_44638),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(5),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44711 (.out1(out_ui_lshift_expr_FU_32_0_32_182_i0_fu___float_adde8m23b_127nih_44073_44711),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_44073_46226),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(4),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44739 (.out1(out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_44073_44739),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_44073_46220),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44767 (.out1(out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_44073_44767),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_44073_46208),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44774 (.out1(out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_44073_44774),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_44073_46212),
    .in2(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44808 (.out1(out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_44073_44808),
    .in1(out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_44073_46304));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44811 (.out1(out_ui_lshift_expr_FU_8_0_8_193_i0_fu___float_adde8m23b_127nih_44073_44811),
    .in1(out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_44073_44808),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44829 (.out1(out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_44073_44829),
    .in1(out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_44073_46295));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44832 (.out1(out_ui_lshift_expr_FU_8_0_8_194_i0_fu___float_adde8m23b_127nih_44073_44832),
    .in1(out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_44073_44829),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___float_adde8m23b_127nih_44073_44835 (.out1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde8m23b_127nih_44073_44835),
    .in1(out_ui_lshift_expr_FU_8_0_8_193_i0_fu___float_adde8m23b_127nih_44073_44811),
    .in2(out_ui_lshift_expr_FU_8_0_8_194_i0_fu___float_adde8m23b_127nih_44073_44832));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44849 (.out1(out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_44073_44849),
    .in1(out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_44073_46286));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44852 (.out1(out_ui_lshift_expr_FU_8_0_8_195_i0_fu___float_adde8m23b_127nih_44073_44852),
    .in1(out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_44073_44849),
    .in2(out_const_9));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44869 (.out1(out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_44073_44869),
    .in1(out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_44073_46277));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44872 (.out1(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde8m23b_127nih_44073_44872),
    .in1(out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_44073_44869),
    .in2(out_const_3));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_44875 (.out1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde8m23b_127nih_44073_44875),
    .in1(out_ui_lshift_expr_FU_8_0_8_195_i0_fu___float_adde8m23b_127nih_44073_44852),
    .in2(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde8m23b_127nih_44073_44872));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_44878 (.out1(out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu___float_adde8m23b_127nih_44073_44878),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde8m23b_127nih_44073_44835),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde8m23b_127nih_44073_44875));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_44883 (.out1(out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu___float_adde8m23b_127nih_44073_44883),
    .in1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_44073_46313),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu___float_adde8m23b_127nih_44073_44878));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44982 (.out1(out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_44073_44982),
    .in1(out_const_85),
    .in2(out_reg_22_reg_22),
    .in3(out_reg_23_reg_23),
    .in4(out_reg_24_reg_24),
    .in5(out_reg_25_reg_25),
    .in6(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_44073_51136),
    .in7(out_reg_36_reg_36),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(6),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45052 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i2_fu___float_adde8m23b_127nih_44073_45052),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i3_fu___float_adde8m23b_127nih_44073_45055),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_45055 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i3_fu___float_adde8m23b_127nih_44073_45055),
    .in1(out_reg_31_reg_31),
    .in2(out_const_78));
  ui_ternary_pm_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_in3(5),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_45058 (.out1(out_ui_ternary_pm_expr_FU_8_0_8_8_211_i0_fu___float_adde8m23b_127nih_44073_45058),
    .in1(out_reg_7_reg_7),
    .in2(out_const_13),
    .in3(out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_44073_47967));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45065 (.out1(out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_44073_45065),
    .in1(out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_44073_50313),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_45068 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i2_fu___float_adde8m23b_127nih_44073_45068),
    .in1(out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_44073_45065),
    .in2(out_const_81));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_44073_45073 (.out1(out_ui_bit_ior_expr_FU_0_32_32_163_i0_fu___float_adde8m23b_127nih_44073_45073),
    .in1(out_reg_32_reg_32),
    .in2(out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_44073_46321));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45107 (.out1(out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_44073_45107),
    .in1(out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_44073_48266));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_44073_45110 (.out1(out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_44073_45110),
    .in1(out_reg_33_reg_33),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_163_i0_fu___float_adde8m23b_127nih_44073_45073));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45134 (.out1(out_ui_rshift_expr_FU_32_0_32_202_i2_fu___float_adde8m23b_127nih_44073_45134),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_44073_45110),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_45137 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_44073_45137),
    .in1(out_ui_rshift_expr_FU_32_0_32_202_i2_fu___float_adde8m23b_127nih_44073_45134),
    .in2(out_const_78));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_45142 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_44073_45142),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_44073_45110),
    .in2(out_const_81));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45240 (.out1(out_ui_lshift_expr_FU_32_0_32_186_i0_fu___float_adde8m23b_127nih_44073_45240),
    .in1(out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_44073_47957),
    .in2(out_const_7));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_45243 (.out1(out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_44073_45243),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_44073_47961));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(6),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45268 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_44073_45268),
    .in1(out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_44073_47959),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_44073_45271 (.out1(out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_44073_45271),
    .in1(out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_44073_45243),
    .in2(out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_44073_47977));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_44073_45274 (.out1(out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_44073_45274),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_44073_45268),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_44073_45271));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45454 (.out1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in1(out_ui_bit_and_expr_FU_16_0_16_152_i0_fu___float_adde8m23b_127nih_44073_44673),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45458 (.out1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_44073_50165),
    .in4(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_44073_49924),
    .in5(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_44073_50169),
    .in6(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_44073_49932),
    .in7(out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_44073_51082),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45462 (.out1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in1(out_const_13),
    .in2(out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_44073_51087),
    .in3(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_44073_51091),
    .in4(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_44073_51094),
    .in5(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_44073_51097),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45466 (.out1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466),
    .in1(out_const_65),
    .in2(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_44073_51094),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in4(out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_44073_51101),
    .in5(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_44073_51108),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45520 (.out1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in1(out_const_26),
    .in2(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_44073_51091),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in4(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_44073_51108),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466),
    .in6(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_44073_51112),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45941 (.out1(out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_44073_45941),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_44073_44346),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45946 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_44073_45946),
    .in1(out_ui_bit_not_expr_FU_32_32_172_i0_fu___float_adde8m23b_127nih_44073_44573),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45950 (.out1(out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_44073_45950),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i1_fu___float_adde8m23b_127nih_44073_44576),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45953 (.out1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_44073_45953),
    .in1(out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_44073_45950),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45962 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_44073_45962),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i0_fu___float_adde8m23b_127nih_44073_44332),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(25),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45965 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_44073_45965),
    .in1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_44073_44624),
    .in2(out_const_14));
  ui_plus_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(25),
    .BITSIZE_out1(25)) fu___float_adde8m23b_127nih_44073_45968 (.out1(out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_44073_45968),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_44073_45962),
    .in2(out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_44073_45965));
  ui_lshift_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_in2(2),
    .BITSIZE_out1(27),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45971 (.out1(out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_44073_45971),
    .in1(out_reg_3_reg_3),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_45975 (.out1(out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_44073_45975),
    .in1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_44073_44624),
    .in2(out_const_44));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46162 (.out1(out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_44073_46162),
    .in1(out_const_48),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_reg_30_reg_30),
    .in5(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_44073_51198),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46184 (.out1(out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_44073_46184),
    .in1(out_const_29),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_44073_51202),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_46192 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_44073_46192),
    .in1(out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_44073_44982),
    .in2(out_const_0),
    .in3(out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_44073_46317));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_46196 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_44073_46196),
    .in1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in2(out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_44073_50571),
    .in3(out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_44073_50574));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_44073_46208 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_44073_46208),
    .in1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466),
    .in2(out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_44073_44774),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_44073_46212));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_44073_46212 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_44073_46212),
    .in1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in2(out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_44073_44739),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_44073_46220));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_44073_46220 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_44073_46220),
    .in1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in2(out_ui_lshift_expr_FU_32_0_32_182_i0_fu___float_adde8m23b_127nih_44073_44711),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_44073_46226));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(27),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_44073_46226 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_44073_46226),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in2(out_ui_lshift_expr_FU_32_0_32_181_i0_fu___float_adde8m23b_127nih_44073_44685),
    .in3(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_44073_44638));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46231 (.out1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_44073_46231),
    .in1(out_const_45),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_44073_51202),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_46234 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_44073_46234),
    .in1(out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_44073_46162),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_44073_45137),
    .in3(out_const_78));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_46242 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_44073_46242),
    .in1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_44073_46231),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_44073_46234),
    .in3(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_44073_45137));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_46244 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_44073_46244),
    .in1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_44073_46231),
    .in2(out_const_0),
    .in3(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_44073_45142));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46247 (.out1(out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_44073_46247),
    .in1(out_const_29),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48833),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_44073_48836),
    .in4(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_44073_51186),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(1),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_46253 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_44073_46253),
    .in1(out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_44073_46184),
    .in2(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_44073_45142),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_46260 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_44073_46260),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_44073_46242),
    .in3(out_const_78));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(1),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_46262 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_44073_46262),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_44073_46244),
    .in3(out_const_0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_46270 (.out1(out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_44073_46270),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46274 (.out1(out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_44073_46274),
    .in1(out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_44073_46270),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46277 (.out1(out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_44073_46277),
    .in1(out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_44073_46274),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_46280 (.out1(out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_44073_46280),
    .in1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46283 (.out1(out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_44073_46283),
    .in1(out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_44073_46280),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46286 (.out1(out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_44073_46286),
    .in1(out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_44073_46283),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_46289 (.out1(out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_44073_46289),
    .in1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46292 (.out1(out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_44073_46292),
    .in1(out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_44073_46289),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46295 (.out1(out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_44073_46295),
    .in1(out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_44073_46292),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_46298 (.out1(out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_44073_46298),
    .in1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46301 (.out1(out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_44073_46301),
    .in1(out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_44073_46298),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46304 (.out1(out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_44073_46304),
    .in1(out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_44073_46301),
    .in2(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46307 (.out1(out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_44073_46307),
    .in1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_44073_45520));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46310 (.out1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_44073_46310),
    .in1(out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_44073_46307),
    .in2(out_const_76));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46313 (.out1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_44073_46313),
    .in1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_44073_46310),
    .in2(out_const_76));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46317 (.out1(out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_44073_46317),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i2_fu___float_adde8m23b_127nih_44073_45052),
    .in2(out_const_43));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(5),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46321 (.out1(out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_44073_46321),
    .in1(out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_44073_46192),
    .in2(out_const_43));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46335 (.out1(out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_44073_46335),
    .in1(out_const_66),
    .in2(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_44073_44265),
    .in3(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_44073_44260),
    .in4(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_44073_51171),
    .in5(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_44073_51183),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_46337 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_44073_46337),
    .in1(out_reg_5_reg_5),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_44073_45137),
    .in3(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_44073_46260));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_46339 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_44073_46339),
    .in1(out_reg_5_reg_5),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_44073_46253),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_44073_46262));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_47957 (.out1(out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_44073_47957),
    .in1(out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_44073_48379));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_47959 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_44073_47959),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_44073_46260),
    .in3(out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_44073_46337));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_47961 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_44073_47961),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_44073_46262),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_44073_46339));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_47963 (.out1(out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_44073_47963),
    .in1(out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_44073_48372));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_47965 (.out1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_44073_47965),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_44073_44201));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_47967 (.out1(out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_44073_47967),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu___float_adde8m23b_127nih_44073_44883));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_47977 (.out1(out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_44073_47977),
    .in1(out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_44073_47963),
    .in2(out_const_75));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_48266 (.out1(out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_44073_48266),
    .in1(out_const_72),
    .in2(out_reg_0_reg_0),
    .in3(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_44073_51121),
    .in4(out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_44073_51145),
    .in5(out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_44073_51148),
    .in6(out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_44073_51151),
    .in7(out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_44073_51155),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_48372 (.out1(out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_44073_48372),
    .in1(out_const_54),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_reg_11_reg_11),
    .in5(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_44073_51190),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_48379 (.out1(out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_44073_48379),
    .in1(out_const_68),
    .in2(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_44073_44265),
    .in3(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_44073_44260),
    .in4(out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_44073_51213),
    .in5(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_44073_51171),
    .in6(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_44073_51183),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_48383 (.out1(out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_44073_48383),
    .in1(out_const_45),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48833),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_44073_48836),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_48833 (.out1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48833),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_48836 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_44073_48836),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_48840 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48840),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_48911 (.out1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_44073_48911),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_44073_44290),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_48915 (.out1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_44073_48915),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_44073_44290),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_48919 (.out1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_44073_48919),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_44073_44290),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49331 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_44073_49331),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49334 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49334),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49338 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_44073_49338),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49341 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49341),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49345 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49345),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49348 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49348),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49352 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_44073_49352),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49355 (.out1(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49355),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49359 (.out1(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_44073_49359),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49362 (.out1(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49362),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49366 (.out1(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_44073_49366),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49369 (.out1(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49369),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49373 (.out1(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_44073_49373),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49376 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49376),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49380 (.out1(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_44073_49380),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49383 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49383),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49387 (.out1(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_44073_49387),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49394 (.out1(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_44073_49394),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49401 (.out1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_44073_49401),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49408 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_44073_49408),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49415 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_44073_49415),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49422 (.out1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_44073_49422),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49429 (.out1(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_44073_49429),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49436 (.out1(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_44073_49436),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49892 (.out1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_44073_49892),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_35));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49900 (.out1(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_44073_49900),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49908 (.out1(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_44073_49908),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_40));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49916 (.out1(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_44073_49916),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49924 (.out1(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_44073_49924),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49932 (.out1(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_44073_49932),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49940 (.out1(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_44073_49940),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49949 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_44073_49949),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2)) fu___float_adde8m23b_127nih_44073_50149 (.out1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_44073_50149),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_50153 (.out1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_44073_50153),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_15));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_50157 (.out1(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_44073_50157),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_50161 (.out1(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_44073_50161),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_50165 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_44073_50165),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_50169 (.out1(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_44073_50169),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_16));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_50173 (.out1(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_44073_50173),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_27));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_50177 (.out1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_44073_50177),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_37));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50306 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_44073_50306),
    .in1(out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_44073_44767),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50309 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_44073_50309),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_44073_46208),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50313 (.out1(out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_44073_50313),
    .in1(out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_44073_50578),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_50431 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_44073_50431),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_50443 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_44073_50443),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_50455 (.out1(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_44073_50455),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_50467 (.out1(out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_44073_50467),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_28));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50571 (.out1(out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_44073_50571),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_44073_50306),
    .in2(out_const_13));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50574 (.out1(out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_44073_50574),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_44073_50309),
    .in2(out_const_13));
  ui_lshift_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50578 (.out1(out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_44073_50578),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_44073_46196),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1)) fu___float_adde8m23b_127nih_44073_50699 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_44073_50699),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1)) fu___float_adde8m23b_127nih_44073_50703 (.out1(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_44073_50703),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2)) fu___float_adde8m23b_127nih_44073_50707 (.out1(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_44073_50707),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_50925 (.out1(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_44073_50925),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_55));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_50937 (.out1(out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_44073_50937),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_62));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_51027 (.out1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_44073_51027),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_46));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51045 (.out1(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_44073_51045),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_44073_49359),
    .in3(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49362),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51049 (.out1(out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_44073_51049),
    .in1(out_const_31),
    .in2(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_44073_49338),
    .in3(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49341),
    .in4(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49345),
    .in5(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49348),
    .in6(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_44073_49352),
    .in7(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49355),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51053 (.out1(out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_44073_51053),
    .in1(out_const_30),
    .in2(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_44073_49331),
    .in3(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49334),
    .in4(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_44073_49380),
    .in5(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49383),
    .in6(out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_44073_51049),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51058 (.out1(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_44073_51058),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49376),
    .in3(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_44073_49429),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51062 (.out1(out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_44073_51062),
    .in1(out_const_19),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49341),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49348),
    .in4(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49355),
    .in5(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_44073_49394),
    .in6(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_44073_49401),
    .in7(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_44073_49408),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51066 (.out1(out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_44073_51066),
    .in1(out_const_21),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49334),
    .in3(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49383),
    .in4(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_44073_49387),
    .in5(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_44073_49436),
    .in6(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_44073_51058),
    .in7(out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_44073_51062),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(22),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51074 (.out1(out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_44073_51074),
    .in1(out_const_24),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_44073_50157),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_44073_49908),
    .in5(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_44073_50161),
    .in6(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_44073_49916),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51078 (.out1(out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_44073_51078),
    .in1(out_const_39),
    .in2(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_44073_50149),
    .in3(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_44073_49892),
    .in4(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in5(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_44073_50153),
    .in6(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_44073_49900),
    .in7(out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_44073_51074),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51082 (.out1(out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_44073_51082),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_44073_50173),
    .in4(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_44073_49940),
    .in5(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_44073_50177),
    .in6(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_44073_49949),
    .in7(out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_44073_51078),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51087 (.out1(out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_44073_51087),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_44073_50165),
    .in4(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_44073_49924),
    .in5(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_44073_50431),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51091 (.out1(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_44073_51091),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_44073_50169),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_44073_49932),
    .in5(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_44073_50699),
    .in6(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_44073_50443),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51094 (.out1(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_44073_51094),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_44073_50173),
    .in4(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_44073_49940),
    .in5(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_44073_50703),
    .in6(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_44073_50455),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51097 (.out1(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_44073_51097),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_44073_50177),
    .in4(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_44073_49949),
    .in5(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_44073_50707),
    .in6(out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_44073_50467),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51101 (.out1(out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_44073_51101),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_44073_50157),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_44073_49908),
    .in5(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_44073_50925),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51104 (.out1(out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_44073_51104),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_44073_50161),
    .in4(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_44073_49916),
    .in5(out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_44073_50937),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51108 (.out1(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_44073_51108),
    .in1(out_const_64),
    .in2(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_44073_51097),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in4(out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_44073_51104),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51112 (.out1(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_44073_51112),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_44073_50153),
    .in4(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_44073_49900),
    .in5(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_44073_51027),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51117 (.out1(out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_44073_51117),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49345),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49348),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51121 (.out1(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_44073_51121),
    .in1(out_const_67),
    .in2(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_44073_51091),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in4(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_44073_51108),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466),
    .in6(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_44073_51112),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51124 (.out1(out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_44073_51124),
    .in1(out_const_27),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13),
    .in4(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_44073_51121),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51128 (.out1(out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_44073_51128),
    .in1(out_const_71),
    .in2(out_reg_14_reg_14),
    .in3(out_reg_15_reg_15),
    .in4(out_reg_28_reg_28),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466),
    .in7(out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_44073_51124),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51132 (.out1(out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_44073_51132),
    .in1(out_const_58),
    .in2(out_reg_18_reg_18),
    .in3(out_reg_19_reg_19),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in5(out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_44073_51128),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51136 (.out1(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_44073_51136),
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
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51139 (.out1(out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_44073_51139),
    .in1(out_const_18),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in4(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466),
    .in6(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_44073_51121),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(39),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51145 (.out1(out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_44073_51145),
    .in1(out_const_23),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_44073_50699),
    .in4(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_44073_50707),
    .in5(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in6(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in7(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51148 (.out1(out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_44073_51148),
    .in1(out_const_15),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_44073_50703),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51151 (.out1(out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_44073_51151),
    .in1(out_const_15),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in3(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_44073_50699),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(38),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51155 (.out1(out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_44073_51155),
    .in1(out_const_49),
    .in2(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_44073_50149),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .in4(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_44073_50703),
    .in5(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45458),
    .in6(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45462),
    .in7(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45466),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51160 (.out1(out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_44073_51160),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_44073_49373),
    .in3(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49376),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51164 (.out1(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_44073_51164),
    .in1(out_const_51),
    .in2(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_44073_49366),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49369),
    .in4(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_44073_49380),
    .in5(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49383),
    .in6(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_44073_51045),
    .in7(out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_44073_51160),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51168 (.out1(out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_44073_51168),
    .in1(out_const_52),
    .in2(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49345),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49348),
    .in4(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_44073_49352),
    .in5(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49355),
    .in6(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_44073_51164),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51171 (.out1(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_44073_51171),
    .in1(out_const_52),
    .in2(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_44073_49331),
    .in3(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49334),
    .in4(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_44073_49338),
    .in5(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49341),
    .in6(out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_44073_51168),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(57),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51175 (.out1(out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_44073_51175),
    .in1(out_const_20),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49341),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49348),
    .in4(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49355),
    .in5(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_44073_49394),
    .in6(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_44073_49401),
    .in7(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_44073_49408),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(45),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51179 (.out1(out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_44073_51179),
    .in1(out_const_34),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49334),
    .in3(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49383),
    .in4(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_44073_49387),
    .in5(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_44073_49436),
    .in6(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_44073_51058),
    .in7(out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_44073_51175),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51183 (.out1(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_44073_51183),
    .in1(out_const_33),
    .in2(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49362),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49369),
    .in4(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_44073_49415),
    .in5(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_44073_49422),
    .in6(out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_44073_51179),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51186 (.out1(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_44073_51186),
    .in1(out_const_13),
    .in2(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_44073_51171),
    .in3(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_44073_51183),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51190 (.out1(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_44073_51190),
    .in1(out_const_59),
    .in2(out_reg_22_reg_22),
    .in3(out_reg_23_reg_23),
    .in4(out_reg_24_reg_24),
    .in5(out_reg_25_reg_25),
    .in6(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_44073_51136),
    .in7(out_reg_36_reg_36),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(59),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51194 (.out1(out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_44073_51194),
    .in1(out_const_53),
    .in2(out_reg_16_reg_16),
    .in3(out_reg_17_reg_17),
    .in4(out_reg_18_reg_18),
    .in5(out_reg_19_reg_19),
    .in6(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_44073_49949),
    .in7(out_reg_29_reg_29),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51198 (.out1(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_44073_51198),
    .in1(out_const_73),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13),
    .in4(out_reg_14_reg_14),
    .in5(out_reg_15_reg_15),
    .in6(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_44073_51190),
    .in7(out_reg_37_reg_37),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51202 (.out1(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_44073_51202),
    .in1(out_const_16),
    .in2(out_reg_30_reg_30),
    .in3(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_44073_51198),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51213 (.out1(out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_44073_51213),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48833),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48840),
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
    .in1(out_ui_ne_expr_FU_32_0_32_200_i0_fu___float_adde8m23b_127nih_44073_44581),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_54_i0_fu___float_adde8m23b_127nih_44073_44630),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_44073_48836),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48840),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_44073_49331),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49334),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_44073_49338),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49341),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49345),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49348),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_44073_49352),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49355),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_186_i0_fu___float_adde8m23b_127nih_44073_45240),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_44073_49359),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49362),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_44073_49366),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49369),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_44073_49373),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49376),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_44073_49380),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49383),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_44073_51117),
    .wenable(wrenable_reg_28));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_44073_51164),
    .wenable(wrenable_reg_29));
  register_STD #(.BITSIZE_in1(25),
    .BITSIZE_out1(25)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_44073_45968),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_44073_51186),
    .wenable(wrenable_reg_30));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_pm_expr_FU_8_0_8_8_211_i0_fu___float_adde8m23b_127nih_44073_45058),
    .wenable(wrenable_reg_31));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i2_fu___float_adde8m23b_127nih_44073_45068),
    .wenable(wrenable_reg_32));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_44073_45107),
    .wenable(wrenable_reg_33));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45454),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_44073_51132),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_44073_51139),
    .wenable(wrenable_reg_36));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_44073_51194),
    .wenable(wrenable_reg_37));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_44073_45975),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_44073_46247),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_44073_46335),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_44073_47965),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_44073_48383),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48833),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_44073_45274_32_64;

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
  wire [7:0] out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_43033_46355;
  wire [7:0] out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_43033_46357;
  wire signed [2:0] out_UIdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_43033_43383;
  wire signed [1:0] out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_43033_43386;
  wire signed [1:0] out_UIdata_converter_FU_42_i0_fu___float_mule8m23b_127nih_43033_43416;
  wire signed [2:0] out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_43033_43389;
  wire signed [1:0] out_UIdata_converter_FU_48_i0_fu___float_mule8m23b_127nih_43033_43419;
  wire signed [1:0] out_UIdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_43033_43434;
  wire signed [1:0] out_UIdata_converter_FU_57_i0_fu___float_mule8m23b_127nih_43033_43724;
  wire [7:0] out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_43033_43143;
  wire out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_43033_46125;
  wire out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_43033_43271;
  wire out_UUdata_converter_FU_41_i0_fu___float_mule8m23b_127nih_43033_43413;
  wire out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_43033_46135;
  wire out_UUdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_43033_43349;
  wire [7:0] out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_43033_43158;
  wire out_UUdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_43033_43431;
  wire out_UUdata_converter_FU_53_i0_fu___float_mule8m23b_127nih_43033_43709;
  wire out_UUdata_converter_FU_54_i0_fu___float_mule8m23b_127nih_43033_43712;
  wire out_UUdata_converter_FU_56_i0_fu___float_mule8m23b_127nih_43033_43721;
  wire [9:0] out_UUdata_converter_FU_58_i0_fu___float_mule8m23b_127nih_43033_43743;
  wire out_UUdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_43033_43855;
  wire out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_43033_43181;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_89_i0_fu___float_mule8m23b_127nih_43033_43395;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_89_i1_fu___float_mule8m23b_127nih_43033_43422;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_89_i2_fu___float_mule8m23b_127nih_43033_43437;
  wire signed [2:0] out_bit_ior_expr_FU_8_8_8_90_i0_fu___float_mule8m23b_127nih_43033_43392;
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
  wire [63:0] out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46155_32_64;
  wire out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47470;
  wire out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47473;
  wire out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47756;
  wire out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_43033_47899;
  wire out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47903;
  wire out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_43033_43225;
  wire out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_43033_44047;
  wire out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_43033_47908;
  wire out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47911;
  wire out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_43033_43303;
  wire out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_43033_44039;
  wire out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_43033_47916;
  wire out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_43033_46635;
  wire out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_43033_46472;
  wire out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_43033_47923;
  wire out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_43033_46639;
  wire out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_43033_46518;
  wire out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_43033_46525;
  wire out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_43033_46539;
  wire out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_47931;
  wire out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_43033_45418;
  wire out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_43033_46067;
  wire out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_43033_47938;
  wire out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_43033_47941;
  wire out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_43033_47945;
  wire out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_43033_47949;
  wire out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_43033_46070;
  wire out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_43033_46083;
  wire out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_43033_46042;
  wire out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_43033_43178;
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
  wire [30:0] out_ui_bit_and_expr_FU_0_32_32_91_i0_fu___float_mule8m23b_127nih_43033_43958;
  wire [46:0] out_ui_bit_and_expr_FU_0_64_64_92_i0_fu___float_mule8m23b_127nih_43033_43737;
  wire [32:0] out_ui_bit_and_expr_FU_0_64_64_93_i0_fu___float_mule8m23b_127nih_43033_43781;
  wire [7:0] out_ui_bit_and_expr_FU_0_8_8_94_i0_fu___float_mule8m23b_127nih_43033_43155;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_95_i0_fu___float_mule8m23b_127nih_43033_43377;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_43033_43123;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_43033_43161;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i2_fu___float_mule8m23b_127nih_43033_43752;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i3_fu___float_mule8m23b_127nih_43033_43840;
  wire [23:0] out_ui_bit_and_expr_FU_32_0_32_97_i0_fu___float_mule8m23b_127nih_43033_43503;
  wire [23:0] out_ui_bit_and_expr_FU_32_0_32_97_i1_fu___float_mule8m23b_127nih_43033_43509;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_98_i0_fu___float_mule8m23b_127nih_43033_43140;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_100_i0_fu___float_mule8m23b_127nih_43033_43961;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_43033_44014;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_99_i0_fu___float_mule8m23b_127nih_43033_43483;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_99_i1_fu___float_mule8m23b_127nih_43033_43499;
  wire [32:0] out_ui_bit_ior_expr_FU_0_64_64_102_i0_fu___float_mule8m23b_127nih_43033_43755;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i0_fu___float_mule8m23b_127nih_43033_43274;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_43033_43277;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i2_fu___float_mule8m23b_127nih_43033_43352;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_43033_43355;
  wire [9:0] out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_43033_46037;
  wire [9:0] out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_43033_46101;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_43033_46086;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_43033_46104;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46155;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_43033_45892;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_43033_45901;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_43033_46092;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_43033_46098;
  wire out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_43033_43205;
  wire out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_43033_43291;
  wire out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_43033_47281;
  wire out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_43033_47285;
  wire out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_43033_47289;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_43033_47293;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_43033_47297;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_43033_47301;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_43033_47305;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_43033_47309;
  wire out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_43033_47313;
  wire out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_43033_47317;
  wire out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_43033_47321;
  wire out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_43033_47325;
  wire out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_43033_47329;
  wire out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_43033_47333;
  wire out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_43033_47337;
  wire out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_43033_47341;
  wire out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_43033_46819;
  wire out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_43033_45733;
  wire out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_43033_47635;
  wire out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_43033_47459;
  wire out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_43033_46842;
  wire out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47840;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_43033_46652;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_43033_47158;
  wire out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_43033_47162;
  wire out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_43033_47166;
  wire out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_43033_47171;
  wire out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_43033_47176;
  wire out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_43033_47181;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_43033_47186;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_43033_47191;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_43033_46888;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_43033_46656;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_43033_43184;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_43033_45692;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_43033_46063;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_43033_46122;
  wire [47:0] out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_43033_43740;
  wire [32:0] out_ui_lshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_43033_43746;
  wire [46:0] out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_43033_43727;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_43033_46108;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_43033_46112;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_43033_46129;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_43033_46138;
  wire [47:0] out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_43033_43512;
  wire out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_43033_43843;
  wire out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_43033_44036;
  wire out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_43033_44044;
  wire [9:0] out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_43033_43715;
  wire [32:0] out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_121_i0_fu___float_mule8m23b_127nih_43033_43131;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_121_i1_fu___float_mule8m23b_127nih_43033_43150;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_43033_45695;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_43033_46056;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_43033_46118;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_43033_46115;
  wire [22:0] out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_mule8m23b_127nih_43033_43749;
  wire [22:0] out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_43033_45682;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_127_i0_fu___float_mule8m23b_127nih_43033_43359;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_43033_43362;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_43033_46132;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_43033_46141;
  wire [9:0] out_ui_ternary_plus_expr_FU_0_16_16_16_129_i0_fu___float_mule8m23b_127nih_43033_43465;
  
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
    .BITSIZE_out1(64)) conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46155_32_64 (.out1(out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46155_32_64),
    .in1(out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46155));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_43033_43123 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_43033_43123),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_40));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_43131 (.out1(out_ui_rshift_expr_FU_32_0_32_121_i0_fu___float_mule8m23b_127nih_43033_43131),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_43033_43140 (.out1(out_ui_bit_and_expr_FU_8_0_8_98_i0_fu___float_mule8m23b_127nih_43033_43140),
    .in1(out_ui_rshift_expr_FU_32_0_32_121_i0_fu___float_mule8m23b_127nih_43033_43131),
    .in2(out_const_35));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_43033_43143 (.out1(out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_43033_43143),
    .in1(out_ui_bit_and_expr_FU_8_0_8_98_i0_fu___float_mule8m23b_127nih_43033_43140));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_43150 (.out1(out_ui_rshift_expr_FU_32_0_32_121_i1_fu___float_mule8m23b_127nih_43033_43150),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_43033_43155 (.out1(out_ui_bit_and_expr_FU_0_8_8_94_i0_fu___float_mule8m23b_127nih_43033_43155),
    .in1(out_const_35),
    .in2(out_ui_rshift_expr_FU_32_0_32_121_i1_fu___float_mule8m23b_127nih_43033_43150));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_43033_43158 (.out1(out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_43033_43158),
    .in1(out_ui_bit_and_expr_FU_0_8_8_94_i0_fu___float_mule8m23b_127nih_43033_43155));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_43033_43161 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_43033_43161),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_40));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43178 (.out1(out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_43033_43178),
    .in1(out_const_20),
    .in2(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_43033_46652),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_43033_46656),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43181 (.out1(out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_43033_43181),
    .in1(out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_43033_43178));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_43184 (.out1(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_43033_43184),
    .in1(out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_43033_43181),
    .in2(out_const_4));
  ui_eq_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43205 (.out1(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_43033_43205),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_43033_43123),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43225 (.out1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_43033_43225),
    .in1(out_const_6),
    .in2(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_43033_43205),
    .in3(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47903),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43271 (.out1(out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_43033_43271),
    .in1(out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_43033_46635));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43274 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i0_fu___float_mule8m23b_127nih_43033_43274),
    .in1(out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_43033_46108),
    .in2(out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_43033_46098));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43277 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_43033_43277),
    .in1(out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_43033_43271),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_103_i0_fu___float_mule8m23b_127nih_43033_43274));
  ui_eq_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43291 (.out1(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_43033_43291),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_43033_43161),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43303 (.out1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_43033_43303),
    .in1(out_const_6),
    .in2(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_43033_43291),
    .in3(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47911),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43349 (.out1(out_UUdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_43033_43349),
    .in1(out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_43033_46639));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43352 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i2_fu___float_mule8m23b_127nih_43033_43352),
    .in1(out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_43033_46112),
    .in2(out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_43033_46092));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43355 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_43033_43355),
    .in1(out_UUdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_43033_43349),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_103_i2_fu___float_mule8m23b_127nih_43033_43352));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_43359 (.out1(out_ui_rshift_expr_FU_8_0_8_127_i0_fu___float_mule8m23b_127nih_43033_43359),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_43033_43277),
    .in2(out_const_1));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_43362 (.out1(out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_43033_43362),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_43033_43355),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43377 (.out1(out_ui_bit_and_expr_FU_1_1_1_95_i0_fu___float_mule8m23b_127nih_43033_43377),
    .in1(out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_43033_43362),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_43033_43355));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_43033_43383 (.out1(out_UIdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_43033_43383),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_43033_43277));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43386 (.out1(out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_43033_43386),
    .in1(out_ui_rshift_expr_FU_8_0_8_127_i0_fu___float_mule8m23b_127nih_43033_43359));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_43033_43389 (.out1(out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_43033_43389),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_43033_43355));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_43033_43392 (.out1(out_bit_ior_expr_FU_8_8_8_90_i0_fu___float_mule8m23b_127nih_43033_43392),
    .in1(out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_43033_43389),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_43033_43386));
  bit_and_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(3),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43395 (.out1(out_bit_and_expr_FU_8_8_8_89_i0_fu___float_mule8m23b_127nih_43033_43395),
    .in1(out_bit_ior_expr_FU_8_8_8_90_i0_fu___float_mule8m23b_127nih_43033_43392),
    .in2(out_UIdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_43033_43383));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43413 (.out1(out_UUdata_converter_FU_41_i0_fu___float_mule8m23b_127nih_43033_43413),
    .in1(out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_43033_46472));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43416 (.out1(out_UIdata_converter_FU_42_i0_fu___float_mule8m23b_127nih_43033_43416),
    .in1(out_UUdata_converter_FU_41_i0_fu___float_mule8m23b_127nih_43033_43413));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43419 (.out1(out_UIdata_converter_FU_48_i0_fu___float_mule8m23b_127nih_43033_43419),
    .in1(out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_43033_43362));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43422 (.out1(out_bit_and_expr_FU_8_8_8_89_i1_fu___float_mule8m23b_127nih_43033_43422),
    .in1(out_UIdata_converter_FU_42_i0_fu___float_mule8m23b_127nih_43033_43416),
    .in2(out_UIdata_converter_FU_48_i0_fu___float_mule8m23b_127nih_43033_43419));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43431 (.out1(out_UUdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_43033_43431),
    .in1(out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_43033_46518));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43434 (.out1(out_UIdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_43033_43434),
    .in1(out_UUdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_43033_43431));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43437 (.out1(out_bit_and_expr_FU_8_8_8_89_i2_fu___float_mule8m23b_127nih_43033_43437),
    .in1(out_UIdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_43033_43434),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_43033_43386));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_43033_43465 (.out1(out_ui_ternary_plus_expr_FU_0_16_16_16_129_i0_fu___float_mule8m23b_127nih_43033_43465),
    .in1(out_const_41),
    .in2(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_43033_46355),
    .in3(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_43033_46357));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_43033_43483 (.out1(out_ui_bit_ior_expr_FU_0_32_32_99_i0_fu___float_mule8m23b_127nih_43033_43483),
    .in1(out_const_12),
    .in2(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_43033_43123));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_43033_43499 (.out1(out_ui_bit_ior_expr_FU_0_32_32_99_i1_fu___float_mule8m23b_127nih_43033_43499),
    .in1(out_const_12),
    .in2(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_43033_43161));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(32),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_43033_43503 (.out1(out_ui_bit_and_expr_FU_32_0_32_97_i0_fu___float_mule8m23b_127nih_43033_43503),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_99_i0_fu___float_mule8m23b_127nih_43033_43483),
    .in2(out_const_43));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(32),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_43033_43509 (.out1(out_ui_bit_and_expr_FU_32_0_32_97_i1_fu___float_mule8m23b_127nih_43033_43509),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_99_i1_fu___float_mule8m23b_127nih_43033_43499),
    .in2(out_const_43));
  ui_mult_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_out1(48),
    .PIPE_PARAMETER(0)) fu___float_mule8m23b_127nih_43033_43512 (.out1(out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_43033_43512),
    .clock(clock),
    .in1(out_ui_bit_and_expr_FU_32_0_32_97_i0_fu___float_mule8m23b_127nih_43033_43503),
    .in2(out_ui_bit_and_expr_FU_32_0_32_97_i1_fu___float_mule8m23b_127nih_43033_43509));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43709 (.out1(out_UUdata_converter_FU_53_i0_fu___float_mule8m23b_127nih_43033_43709),
    .in1(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_43033_46819));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43712 (.out1(out_UUdata_converter_FU_54_i0_fu___float_mule8m23b_127nih_43033_43712),
    .in1(out_UUdata_converter_FU_53_i0_fu___float_mule8m23b_127nih_43033_43709));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_43033_43715 (.out1(out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_43033_43715),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_1_reg_1));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43721 (.out1(out_UUdata_converter_FU_56_i0_fu___float_mule8m23b_127nih_43033_43721),
    .in1(out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_43033_46525));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43724 (.out1(out_UIdata_converter_FU_57_i0_fu___float_mule8m23b_127nih_43033_43724),
    .in1(out_UUdata_converter_FU_56_i0_fu___float_mule8m23b_127nih_43033_43721));
  ui_lshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(2),
    .BITSIZE_out1(47),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_43727 (.out1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_43033_43727),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_4_reg_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(47),
    .BITSIZE_out1(47)) fu___float_mule8m23b_127nih_43033_43737 (.out1(out_ui_bit_and_expr_FU_0_64_64_92_i0_fu___float_mule8m23b_127nih_43033_43737),
    .in1(out_const_45),
    .in2(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_43033_43727));
  ui_lshift_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(2),
    .BITSIZE_out1(48),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_43740 (.out1(out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_43033_43740),
    .in1(out_ui_bit_and_expr_FU_0_64_64_92_i0_fu___float_mule8m23b_127nih_43033_43737),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_43033_43743 (.out1(out_UUdata_converter_FU_58_i0_fu___float_mule8m23b_127nih_43033_43743),
    .in1(out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_43033_43715));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(6),
    .BITSIZE_out1(33),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_43746 (.out1(out_ui_lshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_43033_43746),
    .in1(out_UUdata_converter_FU_58_i0_fu___float_mule8m23b_127nih_43033_43743),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(6),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_43749 (.out1(out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_mule8m23b_127nih_43033_43749),
    .in1(out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_43033_43740),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_43033_43752 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i2_fu___float_mule8m23b_127nih_43033_43752),
    .in1(out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_mule8m23b_127nih_43033_43749),
    .in2(out_const_40));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(23),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_43033_43755 (.out1(out_ui_bit_ior_expr_FU_0_64_64_102_i0_fu___float_mule8m23b_127nih_43033_43755),
    .in1(out_ui_lshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_43033_43746),
    .in2(out_ui_bit_and_expr_FU_32_0_32_96_i2_fu___float_mule8m23b_127nih_43033_43752));
  ui_bit_and_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(33),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_43033_43781 (.out1(out_ui_bit_and_expr_FU_0_64_64_93_i0_fu___float_mule8m23b_127nih_43033_43781),
    .in1(out_const_44),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_102_i0_fu___float_mule8m23b_127nih_43033_43755));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_43033_43840 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i3_fu___float_mule8m23b_127nih_43033_43840),
    .in1(out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_43033_45682),
    .in2(out_const_40));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43843 (.out1(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_43033_43843),
    .in1(out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_43033_45695),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43855 (.out1(out_UUdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_43033_43855),
    .in1(out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_43033_46539));
  ui_plus_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(1),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_43033_43865 (.out1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in1(out_ui_bit_and_expr_FU_0_64_64_93_i0_fu___float_mule8m23b_127nih_43033_43781),
    .in2(out_UUdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_43033_43855));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(33),
    .BITSIZE_out1(31)) fu___float_mule8m23b_127nih_43033_43958 (.out1(out_ui_bit_and_expr_FU_0_32_32_91_i0_fu___float_mule8m23b_127nih_43033_43958),
    .in1(out_const_42),
    .in2(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_43033_43961 (.out1(out_ui_bit_ior_expr_FU_0_32_32_100_i0_fu___float_mule8m23b_127nih_43033_43961),
    .in1(out_ui_bit_and_expr_FU_0_32_32_91_i0_fu___float_mule8m23b_127nih_43033_43958),
    .in2(out_reg_0_reg_0));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_43033_44014 (.out1(out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_43033_44014),
    .in1(out_const_36),
    .in2(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_43033_43184));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_44036 (.out1(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_43033_44036),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_43033_43161),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_44039 (.out1(out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_43033_44039),
    .in1(out_const_6),
    .in2(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_43033_44036),
    .in3(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47911),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_44044 (.out1(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_43033_44044),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_43033_43123),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_44047 (.out1(out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_43033_44047),
    .in1(out_const_6),
    .in2(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_43033_44044),
    .in3(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47903),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_45418 (.out1(out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_43033_45418),
    .in1(out_const_11),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47470),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47473),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47840),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47756),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_47931),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_45682 (.out1(out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_43033_45682),
    .in1(out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_43033_43740),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_45692 (.out1(out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_43033_45692),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i3_fu___float_mule8m23b_127nih_43033_43840),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_45695 (.out1(out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_43033_45695),
    .in1(out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_43033_45692),
    .in2(out_const_5));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(4)) fu___float_mule8m23b_127nih_43033_45733 (.out1(out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_43033_45733),
    .in1(out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_43033_43715),
    .in2(out_const_15));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_45892 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_43033_45892),
    .in1(out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_43033_44039),
    .in2(out_const_19),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_45901 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_43033_45901),
    .in1(out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_43033_44047),
    .in2(out_const_19),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_in3(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_43033_46037 (.out1(out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_43033_46037),
    .in1(out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_43033_45418),
    .in2(out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_43033_46056),
    .in3(out_const_37));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46042 (.out1(out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_43033_46042),
    .in1(out_const_38),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47470),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47473),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47840),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47756),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_47931),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_46056 (.out1(out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_43033_46056),
    .in1(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_43033_43184),
    .in2(out_const_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_46063 (.out1(out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_43033_46063),
    .in1(out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_43033_46037),
    .in2(out_const_16));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46067 (.out1(out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_43033_46067),
    .in1(out_const_39),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47470),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47473),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47840),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47756),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_47931),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46070 (.out1(out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_43033_46070),
    .in1(out_const_9),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_8_reg_8),
    .in4(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_43033_47945),
    .in5(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_43033_47949),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46083 (.out1(out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_43033_46083),
    .in1(out_const_10),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_8_reg_8),
    .in4(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_43033_47945),
    .in5(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_43033_47949),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_43033_46086 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_43033_46086),
    .in1(out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_43033_46083),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_100_i0_fu___float_mule8m23b_127nih_43033_43961),
    .in3(out_reg_0_reg_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_46092 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_43033_46092),
    .in1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_43033_43303),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_43033_45892));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_46098 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_43033_46098),
    .in1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_43033_43225),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_43033_45901));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_in3(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_43033_46101 (.out1(out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_43033_46101),
    .in1(out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_43033_46042),
    .in2(out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_43033_46115),
    .in3(out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_43033_46118));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_43033_46104 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_43033_46104),
    .in1(out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_43033_46070),
    .in2(out_reg_5_reg_5),
    .in3(out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_43033_46086));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46108 (.out1(out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_43033_46108),
    .in1(out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_43033_46132),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46112 (.out1(out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_43033_46112),
    .in1(out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_43033_46141),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_46115 (.out1(out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_43033_46115),
    .in1(out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_43033_46063),
    .in2(out_const_16));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_46118 (.out1(out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_43033_46118),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_43033_44014),
    .in2(out_const_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_46122 (.out1(out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_43033_46122),
    .in1(out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_43033_46101),
    .in2(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46125 (.out1(out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_43033_46125),
    .in1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_43033_43225));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46129 (.out1(out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_43033_46129),
    .in1(out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_43033_46125),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46132 (.out1(out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_43033_46132),
    .in1(out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_43033_46129),
    .in2(out_const_25));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46135 (.out1(out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_43033_46135),
    .in1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_43033_43303));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46138 (.out1(out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_43033_46138),
    .in1(out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_43033_46135),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46141 (.out1(out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_43033_46141),
    .in1(out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_43033_46138),
    .in2(out_const_25));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_43033_46155 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46155),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_7_reg_7),
    .in3(out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_43033_46104));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_43033_46355 (.out1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_43033_46355),
    .in1(out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_43033_43143));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_43033_46357 (.out1(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_43033_46357),
    .in1(out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_43033_43158));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46472 (.out1(out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_43033_46472),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_43033_47281),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_43033_47285),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_43033_43205),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_43033_44044),
    .in6(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47903),
    .in7(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_43033_47916),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46518 (.out1(out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_43033_46518),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_43033_47313),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_43033_47317),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_43033_43291),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_43033_44036),
    .in6(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47911),
    .in7(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_43033_47923),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46525 (.out1(out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_43033_46525),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_43033_46819),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46539 (.out1(out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_43033_46539),
    .in1(out_const_27),
    .in2(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_43033_43843),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_43033_47635),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_43033_47459),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46635 (.out1(out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_43033_46635),
    .in1(out_const_28),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_43033_47281),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_43033_47285),
    .in4(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47903),
    .in5(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_43033_47916),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46639 (.out1(out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_43033_46639),
    .in1(out_const_28),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_43033_47313),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_43033_47317),
    .in4(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47911),
    .in5(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_43033_47923),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_46652 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_43033_46652),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_46656 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_43033_46656),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(6)) fu___float_mule8m23b_127nih_43033_46819 (.out1(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_43033_46819),
    .in1(out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_43033_43512),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(6)) fu___float_mule8m23b_127nih_43033_46842 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_43033_46842),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_7));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_46888 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_43033_46888),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47158 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_43033_47158),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47162 (.out1(out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_43033_47162),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47166 (.out1(out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_43033_47166),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47171 (.out1(out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_43033_47171),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47176 (.out1(out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_43033_47176),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47181 (.out1(out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_43033_47181),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47186 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_43033_47186),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47191 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_43033_47191),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47281 (.out1(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_43033_47281),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47285 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_43033_47285),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47289 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_43033_47289),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47293 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_43033_47293),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47297 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_43033_47297),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47301 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_43033_47301),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47305 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_43033_47305),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47309 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_43033_47309),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47313 (.out1(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_43033_47313),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47317 (.out1(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_43033_47317),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47321 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_43033_47321),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47325 (.out1(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_43033_47325),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47329 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_43033_47329),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47333 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_43033_47333),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47337 (.out1(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_43033_47337),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47341 (.out1(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_43033_47341),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47459 (.out1(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_43033_47459),
    .in1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_43033_43727),
    .in2(out_const_17));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_43033_47470 (.out1(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47470),
    .in1(out_bit_and_expr_FU_8_8_8_89_i1_fu___float_mule8m23b_127nih_43033_43422),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_43033_47473 (.out1(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47473),
    .in1(out_bit_and_expr_FU_8_8_8_89_i2_fu___float_mule8m23b_127nih_43033_43437),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47635 (.out1(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_43033_47635),
    .in1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_43033_43727),
    .in2(out_const_21));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_43033_47756 (.out1(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47756),
    .in1(out_bit_and_expr_FU_8_8_8_89_i0_fu___float_mule8m23b_127nih_43033_43395),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_43033_47840 (.out1(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47840),
    .in1(out_ui_bit_and_expr_FU_1_1_1_95_i0_fu___float_mule8m23b_127nih_43033_43377),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47899 (.out1(out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_43033_47899),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_43033_47281),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_43033_47285),
    .in4(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_43033_47289),
    .in5(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_43033_47293),
    .in6(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_43033_47305),
    .in7(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_43033_47309),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47903 (.out1(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47903),
    .in1(out_const_8),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_43033_47297),
    .in3(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_43033_47301),
    .in4(out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_43033_47899),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47908 (.out1(out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_43033_47908),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_43033_47313),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_43033_47317),
    .in4(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_43033_47321),
    .in5(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_43033_47325),
    .in6(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_43033_47337),
    .in7(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_43033_47341),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47911 (.out1(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47911),
    .in1(out_const_8),
    .in2(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_43033_47329),
    .in3(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_43033_47333),
    .in4(out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_43033_47908),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47916 (.out1(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_43033_47916),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_43033_47289),
    .in3(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_43033_47293),
    .in4(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_43033_47297),
    .in5(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_43033_47301),
    .in6(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_43033_47305),
    .in7(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_43033_47309),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47923 (.out1(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_43033_47923),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_43033_47321),
    .in3(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_43033_47325),
    .in4(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_43033_47329),
    .in5(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_43033_47333),
    .in6(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_43033_47337),
    .in7(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_43033_47341),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(49),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47931 (.out1(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_47931),
    .in1(out_const_14),
    .in2(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_43033_43205),
    .in3(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_43033_44044),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_43033_43291),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_43033_44036),
    .in6(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47903),
    .in7(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47911),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47938 (.out1(out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_43033_47938),
    .in1(out_const_5),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47470),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47473),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47840),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47756),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47941 (.out1(out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_43033_47941),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_43033_47158),
    .in3(out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_43033_47162),
    .in4(out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_43033_47166),
    .in5(out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_43033_47171),
    .in6(out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_43033_47186),
    .in7(out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_43033_47191),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47945 (.out1(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_43033_47945),
    .in1(out_const_29),
    .in2(out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_43033_47176),
    .in3(out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_43033_47181),
    .in4(out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_43033_46888),
    .in5(out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_43033_47941),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47949 (.out1(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_43033_47949),
    .in1(out_const_34),
    .in2(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_43033_43843),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_43033_47635),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_43033_47459),
    .in5(out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_43033_45733),
    .in6(out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_43033_46842),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_43033_43184),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_plus_expr_FU_0_16_16_16_129_i0_fu___float_mule8m23b_127nih_43033_43465),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(48),
    .BITSIZE_out1(48)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_43033_43512),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_54_i0_fu___float_mule8m23b_127nih_43033_43712),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_57_i0_fu___float_mule8m23b_127nih_43033_43724),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_43033_44014),
    .wenable(wrenable_reg_5));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_43033_46067),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_43033_46122),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_47931),
    .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_43033_47938),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46155_32_64;

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
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803,
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
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803);
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
  input selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799;
  input selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803;
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
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851;
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855;
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857;
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859;
  output OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799;
  output OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803;
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
  wire [31:0] out_UUdata_converter_FU_13_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45339;
  wire [31:0] out_UUdata_converter_FU_14_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45342;
  wire [31:0] out_UUdata_converter_FU_15_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45336;
  wire [31:0] out_UUdata_converter_FU_16_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45364;
  wire [31:0] out_UUdata_converter_FU_17_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45367;
  wire [31:0] out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45361;
  wire [63:0] out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799;
  wire [63:0] out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803;
  wire out_const_0;
  wire [6:0] out_const_1;
  wire out_const_2;
  wire [1:0] out_const_3;
  wire [7:0] out_const_4;
  wire [31:0] out_conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799_64_32;
  wire [31:0] out_conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803_64_32;
  wire [29:0] out_conv_out_const_0_1_30;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [5:0] out_conv_out_const_1_7_6;
  wire [63:0] out_conv_out_reg_10_reg_10_32_64;
  wire [63:0] out_conv_out_reg_11_reg_11_32_64;
  wire [63:0] out_conv_out_reg_12_reg_12_32_64;
  wire [63:0] out_conv_out_reg_13_reg_13_32_64;
  wire [29:0] out_conv_out_reg_6_reg_6_32_30;
  wire out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_46153;
  wire out_read_cond_FU_19_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857;
  wire out_read_cond_FU_20_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859;
  wire out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851;
  wire out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855;
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
  wire out_ui_eq_expr_FU_32_0_32_22_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43009;
  wire out_ui_eq_expr_FU_32_0_32_22_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43011;
  wire out_ui_eq_expr_FU_32_0_32_22_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43013;
  wire out_ui_le_expr_FU_32_32_32_23_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43015;
  wire out_ui_le_expr_FU_32_32_32_23_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43017;
  wire out_ui_le_expr_FU_32_32_32_23_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43019;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_24_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36773;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_24_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36816;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_24_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36835;
  wire [29:0] out_ui_mult_expr_FU_32_32_32_0_25_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36781;
  wire [29:0] out_ui_mult_expr_FU_32_32_32_0_25_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36841;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_26_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36788;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_26_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36796;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36825;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_27_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36777;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_27_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36819;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_27_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36838;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36768;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_28_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36811;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_28_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36830;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [29:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [29:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire [31:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3;
  wire s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799;
  wire s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803;
  
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
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36768));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_21_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_28_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36811),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_28_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36830));
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
    .in1(out_ui_plus_expr_FU_32_0_32_26_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36788),
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
    .in2(out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45361));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_37_reg_6_0_0_0 (.out1(out_MUX_37_reg_6_0_0_0),
    .sel(selector_MUX_37_reg_6_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36825),
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
    .in1(out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45361));
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
    .BITSIZE_out1(32)) conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799_64_32 (.out1(out_conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799_64_32),
    .in1(out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803_64_32 (.out1(out_conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803_64_32),
    .in1(out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803));
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
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36768 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36768),
    .in1(in_port_C),
    .in2(out_ui_lshift_expr_FU_32_0_32_24_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36773));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36773 (.out1(out_ui_lshift_expr_FU_32_0_32_24_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36773),
    .in1(out_ui_plus_expr_FU_32_32_32_27_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36777),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36777 (.out1(out_ui_plus_expr_FU_32_32_32_27_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36777),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_2_reg_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30),
    .PIPE_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36781 (.out1(out_ui_mult_expr_FU_32_32_32_0_25_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36781),
    .clock(clock),
    .in1(in_port_n),
    .in2(out_reg_0_reg_0));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36788 (.out1(out_ui_plus_expr_FU_32_0_32_26_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36788),
    .in1(out_reg_0_reg_0),
    .in2(out_const_2));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36796 (.out1(out_ui_plus_expr_FU_32_0_32_26_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36796),
    .in1(out_reg_2_reg_2),
    .in2(out_const_2));
  __float_adde8m23b_127nih fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799 (.done_port(s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799),
    .return_port(out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799),
    .a(out_conv_out_reg_13_reg_13_32_64),
    .b(out_conv_out_reg_10_reg_10_32_64));
  __float_mule8m23b_127nih fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803 (.done_port(s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803),
    .return_port(out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803),
    .a(out_conv_out_reg_11_reg_11_32_64),
    .b(out_conv_out_reg_12_reg_12_32_64));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36811 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_28_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36811),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_24_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36816));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36816 (.out1(out_ui_lshift_expr_FU_32_0_32_24_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36816),
    .in1(out_ui_plus_expr_FU_32_32_32_27_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36819),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36819 (.out1(out_ui_plus_expr_FU_32_32_32_27_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36819),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_6_reg_6));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36825 (.out1(out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36825),
    .in1(out_reg_6_reg_6),
    .in2(out_const_2));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36830 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_28_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36830),
    .in1(in_port_B),
    .in2(out_ui_lshift_expr_FU_32_0_32_24_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36835));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36835 (.out1(out_ui_lshift_expr_FU_32_0_32_24_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36835),
    .in1(out_ui_plus_expr_FU_32_32_32_27_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36838),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36838 (.out1(out_ui_plus_expr_FU_32_32_32_27_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36838),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_2_reg_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30),
    .PIPE_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36841 (.out1(out_ui_mult_expr_FU_32_32_32_0_25_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36841),
    .clock(clock),
    .in1(in_port_w),
    .in2(out_reg_7_reg_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851 (.out1(out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851),
    .in1(out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_46153));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855 (.out1(out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855),
    .in1(out_ui_le_expr_FU_32_32_32_23_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43015));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857 (.out1(out_read_cond_FU_19_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857),
    .in1(out_reg_9_reg_9));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859 (.out1(out_read_cond_FU_20_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859),
    .in1(out_ui_le_expr_FU_32_32_32_23_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43019));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43009 (.out1(out_ui_eq_expr_FU_32_0_32_22_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43009),
    .in1(in_port_n),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43011 (.out1(out_ui_eq_expr_FU_32_0_32_22_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43011),
    .in1(in_port_w),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43013 (.out1(out_ui_eq_expr_FU_32_0_32_22_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43013),
    .in1(in_port_m),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43015 (.out1(out_ui_le_expr_FU_32_32_32_23_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43015),
    .in1(in_port_n),
    .in2(out_reg_0_reg_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43017 (.out1(out_ui_le_expr_FU_32_32_32_23_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43017),
    .in1(in_port_m),
    .in2(out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36825));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43019 (.out1(out_ui_le_expr_FU_32_32_32_23_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43019),
    .in1(in_port_w),
    .in2(out_reg_4_reg_4));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45336 (.out1(out_UUdata_converter_FU_15_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45336),
    .in1(out_conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803_64_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45339 (.out1(out_UUdata_converter_FU_13_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45339),
    .in1(out_BMEMORY_CTRLN_21_i0_BMEMORY_CTRLN_21_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45342 (.out1(out_UUdata_converter_FU_14_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45342),
    .in1(out_BMEMORY_CTRLN_21_i0_BMEMORY_CTRLN_21_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45361 (.out1(out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45361),
    .in1(out_reg_14_reg_14));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45364 (.out1(out_UUdata_converter_FU_16_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45364),
    .in1(out_UUdata_converter_FU_15_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45336));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45367 (.out1(out_UUdata_converter_FU_17_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45367),
    .in1(out_reg_5_reg_5));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_46153 (.out1(out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_46153),
    .in1(out_const_4),
    .in2(out_ui_eq_expr_FU_32_0_32_22_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43009),
    .in3(out_ui_eq_expr_FU_32_0_32_22_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43011),
    .in4(out_ui_eq_expr_FU_32_0_32_22_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43013),
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
    .in1(out_ui_mult_expr_FU_32_32_32_0_25_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36781),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_17_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45367),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_13_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45339),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_14_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45342),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_16_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_45364),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799_64_32),
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
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36768),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_26_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36796),
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
    .in1(out_ui_mult_expr_FU_32_32_32_0_25_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36841),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_le_expr_FU_32_32_32_23_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_43017),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851 = out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851;
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855 = out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855;
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857 = out_read_cond_FU_19_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857;
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859 = out_read_cond_FU_20_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859;
  assign OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799 = s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799;
  assign OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803 = s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803;

endmodule

// FSM based controller description for _Z21matrix_multiplicationPKfS0_Pfjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z21matrix_multiplicationPKfS0_Pfjjj(done_port,
  fuselector_BMEMORY_CTRLN_21_i0_LOAD,
  fuselector_BMEMORY_CTRLN_21_i0_STORE,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803,
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
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851;
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855;
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857;
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859;
  input OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799;
  input OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_21_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_21_i0_STORE;
  output selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799;
  output selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803;
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
  reg selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799;
  reg selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803;
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
    selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799 = 1'b0;
    selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803 = 1'b0;
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
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851 == 1'b0)
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
          selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          wrenable_reg_13 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799 = 1'b1;
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
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857 == 1'b1)
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
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859 == 1'b1)
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
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855 == 1'b0)
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
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851;
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855;
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857;
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859;
  wire OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799;
  wire OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_21_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_21_i0_STORE;
  wire selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799;
  wire selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803;
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
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803),
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
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z21matrix_multiplicationPKfS0_Pfjjj Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36851),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36855),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36857),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36859),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803),
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
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36799),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35841_36803),
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


