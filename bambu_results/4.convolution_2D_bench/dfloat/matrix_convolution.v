// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-04-07T15:00:42
// Bambu executed with: bambu --top-fname=matrix_convolution -DFLOAT cpu_functions.cpp 
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
module gt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 > in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module le_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 <= in2;
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
module lt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 < in2;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module mult_expr_FU(clock,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PIPE_PARAMETER=0;
  // IN
  input clock;
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  
  generate
    if(PIPE_PARAMETER==1)
    begin
      reg signed [BITSIZE_out1-1:0] out1_reg;
      assign out1 = out1_reg;
      always @(posedge clock)
      begin
        out1_reg <= in1 * in2;
      end
    end
    else if(PIPE_PARAMETER>1)
    begin
      reg signed [BITSIZE_in1-1:0] in1_in;
      reg signed [BITSIZE_in2-1:0] in2_in;
      wire signed [BITSIZE_out1-1:0] mult_res;
      reg signed [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
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
module negate_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = -in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module plus_expr_FU(in1,
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
  assign out1 = in1 + in2;
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
  wire [4:0] out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_44073_48047;
  wire [7:0] out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_44073_48045;
  wire [0:0] out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_44073_44808;
  wire [0:0] out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_44073_44829;
  wire [0:0] out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_44073_44849;
  wire [0:0] out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_44073_44869;
  wire [26:0] out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_44073_44232;
  wire [31:0] out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_44073_44164;
  wire [4:0] out_IUdata_converter_FU_50_i0_fu___float_adde8m23b_127nih_44073_44546;
  wire signed [1:0] out_UIdata_converter_FU_2_i0_fu___float_adde8m23b_127nih_44073_44155;
  wire signed [1:0] out_UIdata_converter_FU_49_i0_fu___float_adde8m23b_127nih_44073_44537;
  wire signed [1:0] out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_44073_46346;
  wire signed [1:0] out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_44073_46356;
  wire signed [1:0] out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_44073_46365;
  wire signed [1:0] out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_44073_46374;
  wire signed [1:0] out_UIdata_converter_FU_9_i0_fu___float_adde8m23b_127nih_44073_44223;
  wire out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_44073_46383;
  wire out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_44073_45107;
  wire out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_44073_48043;
  wire out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_44073_48037;
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
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_44073_46350;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_44073_46359;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_44073_46368;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_44073_46377;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_146_i0_fu___float_adde8m23b_127nih_44073_44158;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_146_i1_fu___float_adde8m23b_127nih_44073_44226;
  wire out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_44073_51198;
  wire out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_44073_51202;
  wire out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_44073_51205;
  wire out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_44073_51209;
  wire out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_44073_51213;
  wire out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_44073_51217;
  wire out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_44073_51220;
  wire out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_44073_44982;
  wire out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_44073_51226;
  wire out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_44073_51229;
  wire out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_44073_51232;
  wire out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_44073_51236;
  wire out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_44073_48347;
  wire out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_44073_51241;
  wire out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_44073_51245;
  wire out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_44073_51249;
  wire out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_44073_51252;
  wire out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_44073_51256;
  wire out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_44073_51260;
  wire out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_44073_51264;
  wire out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_44073_51267;
  wire out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_44073_51271;
  wire out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_44073_51275;
  wire out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_44073_51279;
  wire out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_44073_46237;
  wire out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_44073_51283;
  wire out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_44073_46259;
  wire out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_44073_46306;
  wire out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_44073_48464;
  wire out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_44073_46322;
  wire out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_44073_46411;
  wire out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_44073_48453;
  wire out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_44073_51294;
  wire out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_44073_48460;
  wire out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_44073_51126;
  wire out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_44073_51130;
  wire out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_44073_51134;
  wire out_lut_expr_FU_30_i0_fu___float_adde8m23b_127nih_44073_44279;
  wire out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_44073_51139;
  wire out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_44073_51143;
  wire out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_44073_51147;
  wire out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_44073_44287;
  wire out_lut_expr_FU_48_i0_fu___float_adde8m23b_127nih_44073_44534;
  wire out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_44073_44589;
  wire out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_44073_51155;
  wire out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_44073_51159;
  wire out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_44073_51163;
  wire out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512;
  wire out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_44073_51168;
  wire out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_44073_51172;
  wire out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_44073_51175;
  wire out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_44073_51178;
  wire out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516;
  wire out_lut_expr_FU_8_i0_fu___float_adde8m23b_127nih_44073_44220;
  wire out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_44073_51182;
  wire out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_44073_51185;
  wire out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_44073_51189;
  wire out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520;
  wire out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_44073_51193;
  wire out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_44073_45574;
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
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_44073_46353;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_44073_46362;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_44073_46371;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_44073_46380;
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
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_44073_46046;
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
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_44073_46271;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_44073_46283;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_44073_46287;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_44073_46295;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_44073_46301;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_44073_46319;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_44073_46328;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_44073_46337;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_44073_46415;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_44073_48041;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_44073_46267;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_44073_46309;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_44073_46317;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_44073_46335;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_44073_46413;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_44073_48039;
  wire out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508;
  wire out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_44073_44586;
  wire out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_44073_49412;
  wire out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49415;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_44073_49419;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49422;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49426;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49429;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_44073_49433;
  wire out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49436;
  wire out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_44073_49440;
  wire out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49443;
  wire out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_44073_49447;
  wire out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49450;
  wire out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_44073_49454;
  wire out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49457;
  wire out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_44073_49461;
  wire out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49464;
  wire out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_44073_49468;
  wire out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_44073_49475;
  wire out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_44073_49482;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_44073_49489;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_44073_49496;
  wire out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_44073_49503;
  wire out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_44073_49510;
  wire out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_44073_49517;
  wire out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_44073_48992;
  wire out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_44073_48996;
  wire out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_44073_49000;
  wire out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_44073_50230;
  wire out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_44073_49973;
  wire out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_44073_50234;
  wire out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_44073_49981;
  wire out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48914;
  wire out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_44073_50238;
  wire out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_44073_49989;
  wire out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_44073_50242;
  wire out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_44073_49997;
  wire out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_44073_50246;
  wire out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_44073_50005;
  wire out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_44073_50250;
  wire out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_44073_50013;
  wire out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_44073_50254;
  wire out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_44073_50021;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_44073_48917;
  wire out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_44073_50258;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_44073_50030;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_44073_50512;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_44073_50780;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_44073_50524;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48921;
  wire out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_44073_50784;
  wire out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_44073_50536;
  wire out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_44073_50788;
  wire out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_44073_50548;
  wire out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_44073_51006;
  wire out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_44073_51018;
  wire out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_44073_51108;
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
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_44073_46021;
  wire [26:0] out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_44073_46042;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_44073_50394;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_44073_46397;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_44073_48057;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_44073_50659;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_44073_46386;
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
  wire [24:0] out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_44073_46039;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i0_fu___float_adde8m23b_127nih_44073_44192;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i1_fu___float_adde8m23b_127nih_44073_44249;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i2_fu___float_adde8m23b_127nih_44073_45134;
  wire [15:0] out_ui_rshift_expr_FU_32_0_32_203_i0_fu___float_adde8m23b_127nih_44073_44670;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_44073_45065;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_44073_46012;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_44073_46024;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_44073_46017;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_44073_46033;
  wire [24:0] out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_44073_46036;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_44073_50387;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_44073_50390;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_44073_46393;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_44073_50652;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_44073_50655;
  wire [25:0] out_ui_rshift_expr_FU_32_32_32_209_i0_fu___float_adde8m23b_127nih_44073_44561;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_44073_46389;
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
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48914),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48921),
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
    .in2(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_44073_49447),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49450),
    .in4(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_44073_49454),
    .in5(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49457),
    .in6(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_44073_51126),
    .in7(out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_44073_51134),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44287 (.out1(out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_44073_44287),
    .in1(out_const_74),
    .in2(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49443),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49450),
    .in4(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_44073_49496),
    .in5(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_44073_49503),
    .in6(out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_44073_51147),
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
    .in2(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_44073_48992),
    .in3(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_44073_48996),
    .in4(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_44073_49000),
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
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_44073_46012),
    .in2(out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_44073_46017));
  ui_ne_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44581 (.out1(out_ui_ne_expr_FU_32_0_32_200_i0_fu___float_adde8m23b_127nih_44073_44581),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_44073_46024),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44586 (.out1(out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_44073_44586),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_44073_46024),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44589 (.out1(out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_44073_44589),
    .in1(out_const_48),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48914),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48921),
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
    .in1(out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_44073_46042),
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
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_44073_46301),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(4),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44739 (.out1(out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_44073_44739),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_44073_46295),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44767 (.out1(out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_44073_44767),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_44073_46283),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44774 (.out1(out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_44073_44774),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_44073_46287),
    .in2(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44808 (.out1(out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_44073_44808),
    .in1(out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_44073_46380));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44811 (.out1(out_ui_lshift_expr_FU_8_0_8_193_i0_fu___float_adde8m23b_127nih_44073_44811),
    .in1(out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_44073_44808),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44829 (.out1(out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_44073_44829),
    .in1(out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_44073_46371));
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
    .in1(out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_44073_46362));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_44852 (.out1(out_ui_lshift_expr_FU_8_0_8_195_i0_fu___float_adde8m23b_127nih_44073_44852),
    .in1(out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_44073_44849),
    .in2(out_const_9));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44869 (.out1(out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_44073_44869),
    .in1(out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_44073_46353));
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
    .in1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_44073_46389),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu___float_adde8m23b_127nih_44073_44878));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_44982 (.out1(out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_44073_44982),
    .in1(out_const_85),
    .in2(out_reg_22_reg_22),
    .in3(out_reg_23_reg_23),
    .in4(out_reg_24_reg_24),
    .in5(out_reg_25_reg_25),
    .in6(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_44073_51217),
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
    .in3(out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_44073_48047));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45065 (.out1(out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_44073_45065),
    .in1(out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_44073_50394),
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
    .in2(out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_44073_46397));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45107 (.out1(out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_44073_45107),
    .in1(out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_44073_48347));
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
    .in1(out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_44073_48037),
    .in2(out_const_7));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_45243 (.out1(out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_44073_45243),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_44073_48041));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(6),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_45268 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_44073_45268),
    .in1(out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_44073_48039),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_44073_45271 (.out1(out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_44073_45271),
    .in1(out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_44073_45243),
    .in2(out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_44073_48057));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_44073_45274 (.out1(out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_44073_45274),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_44073_45268),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_44073_45271));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45508 (.out1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in1(out_ui_bit_and_expr_FU_16_0_16_152_i0_fu___float_adde8m23b_127nih_44073_44673),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45512 (.out1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_44073_50246),
    .in4(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_44073_50005),
    .in5(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_44073_50250),
    .in6(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_44073_50013),
    .in7(out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_44073_51163),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45516 (.out1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in1(out_const_13),
    .in2(out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_44073_51168),
    .in3(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_44073_51172),
    .in4(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_44073_51175),
    .in5(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_44073_51178),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45520 (.out1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in1(out_const_65),
    .in2(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_44073_51175),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in4(out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_44073_51182),
    .in5(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_44073_51189),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_45574 (.out1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_44073_45574),
    .in1(out_const_26),
    .in2(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_44073_51172),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in4(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_44073_51189),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in6(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_44073_51193),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46012 (.out1(out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_44073_46012),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_44073_44346),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46017 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_44073_46017),
    .in1(out_ui_bit_not_expr_FU_32_32_172_i0_fu___float_adde8m23b_127nih_44073_44573),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46021 (.out1(out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_44073_46021),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i1_fu___float_adde8m23b_127nih_44073_44576),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46024 (.out1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_44073_46024),
    .in1(out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_44073_46021),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46033 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_44073_46033),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i0_fu___float_adde8m23b_127nih_44073_44332),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(25),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46036 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_44073_46036),
    .in1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_44073_44624),
    .in2(out_const_14));
  ui_plus_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(25),
    .BITSIZE_out1(25)) fu___float_adde8m23b_127nih_44073_46039 (.out1(out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_44073_46039),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_44073_46033),
    .in2(out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_44073_46036));
  ui_lshift_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_in2(2),
    .BITSIZE_out1(27),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46042 (.out1(out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_44073_46042),
    .in1(out_reg_3_reg_3),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_46046 (.out1(out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_44073_46046),
    .in1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_44073_44624),
    .in2(out_const_44));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46237 (.out1(out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_44073_46237),
    .in1(out_const_48),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_reg_30_reg_30),
    .in5(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_44073_51279),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46259 (.out1(out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_44073_46259),
    .in1(out_const_29),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_44073_51283),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_46267 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_44073_46267),
    .in1(out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_44073_44982),
    .in2(out_const_0),
    .in3(out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_44073_46393));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_46271 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_44073_46271),
    .in1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_44073_45574),
    .in2(out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_44073_50652),
    .in3(out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_44073_50655));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_44073_46283 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_44073_46283),
    .in1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in2(out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_44073_44774),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_44073_46287));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_44073_46287 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_44073_46287),
    .in1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in2(out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_44073_44739),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_44073_46295));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_44073_46295 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_44073_46295),
    .in1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in2(out_ui_lshift_expr_FU_32_0_32_182_i0_fu___float_adde8m23b_127nih_44073_44711),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_44073_46301));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(27),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_44073_46301 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_44073_46301),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in2(out_ui_lshift_expr_FU_32_0_32_181_i0_fu___float_adde8m23b_127nih_44073_44685),
    .in3(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_44073_44638));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46306 (.out1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_44073_46306),
    .in1(out_const_45),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_44073_51283),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_46309 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_44073_46309),
    .in1(out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_44073_46237),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_44073_45137),
    .in3(out_const_78));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_46317 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_44073_46317),
    .in1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_44073_46306),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_44073_46309),
    .in3(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_44073_45137));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_46319 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_44073_46319),
    .in1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_44073_46306),
    .in2(out_const_0),
    .in3(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_44073_45142));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46322 (.out1(out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_44073_46322),
    .in1(out_const_29),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48914),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_44073_48917),
    .in4(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_44073_51267),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(1),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_46328 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_44073_46328),
    .in1(out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_44073_46259),
    .in2(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_44073_45142),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_46335 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_44073_46335),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_44073_46317),
    .in3(out_const_78));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(1),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_46337 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_44073_46337),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_44073_46319),
    .in3(out_const_0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_46346 (.out1(out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_44073_46346),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46350 (.out1(out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_44073_46350),
    .in1(out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_44073_46346),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46353 (.out1(out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_44073_46353),
    .in1(out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_44073_46350),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_46356 (.out1(out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_44073_46356),
    .in1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46359 (.out1(out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_44073_46359),
    .in1(out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_44073_46356),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46362 (.out1(out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_44073_46362),
    .in1(out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_44073_46359),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_46365 (.out1(out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_44073_46365),
    .in1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46368 (.out1(out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_44073_46368),
    .in1(out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_44073_46365),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46371 (.out1(out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_44073_46371),
    .in1(out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_44073_46368),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_44073_46374 (.out1(out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_44073_46374),
    .in1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46377 (.out1(out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_44073_46377),
    .in1(out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_44073_46374),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_44073_46380 (.out1(out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_44073_46380),
    .in1(out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_44073_46377),
    .in2(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46383 (.out1(out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_44073_46383),
    .in1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_44073_45574));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46386 (.out1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_44073_46386),
    .in1(out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_44073_46383),
    .in2(out_const_76));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46389 (.out1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_44073_46389),
    .in1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_44073_46386),
    .in2(out_const_76));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46393 (.out1(out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_44073_46393),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i2_fu___float_adde8m23b_127nih_44073_45052),
    .in2(out_const_43));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(5),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_46397 (.out1(out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_44073_46397),
    .in1(out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_44073_46267),
    .in2(out_const_43));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_46411 (.out1(out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_44073_46411),
    .in1(out_const_66),
    .in2(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_44073_44265),
    .in3(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_44073_44260),
    .in4(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_44073_51252),
    .in5(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_44073_51264),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_46413 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_44073_46413),
    .in1(out_reg_5_reg_5),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_44073_45137),
    .in3(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_44073_46335));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_46415 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_44073_46415),
    .in1(out_reg_5_reg_5),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_44073_46328),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_44073_46337));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_48037 (.out1(out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_44073_48037),
    .in1(out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_44073_48460));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_48039 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_44073_48039),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_44073_46335),
    .in3(out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_44073_46413));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_44073_48041 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_44073_48041),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_44073_46337),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_44073_46415));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_48043 (.out1(out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_44073_48043),
    .in1(out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_44073_48453));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_44073_48045 (.out1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_44073_48045),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_44073_44201));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_44073_48047 (.out1(out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_44073_48047),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu___float_adde8m23b_127nih_44073_44883));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_48057 (.out1(out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_44073_48057),
    .in1(out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_44073_48043),
    .in2(out_const_75));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_48347 (.out1(out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_44073_48347),
    .in1(out_const_72),
    .in2(out_reg_0_reg_0),
    .in3(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_44073_51202),
    .in4(out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_44073_51226),
    .in5(out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_44073_51229),
    .in6(out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_44073_51232),
    .in7(out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_44073_51236),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_48453 (.out1(out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_44073_48453),
    .in1(out_const_54),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_reg_11_reg_11),
    .in5(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_44073_51271),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_48460 (.out1(out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_44073_48460),
    .in1(out_const_68),
    .in2(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_44073_44265),
    .in3(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_44073_44260),
    .in4(out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_44073_51294),
    .in5(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_44073_51252),
    .in6(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_44073_51264),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_48464 (.out1(out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_44073_48464),
    .in1(out_const_45),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48914),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_44073_48917),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_48914 (.out1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48914),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_48917 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_44073_48917),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_48921 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48921),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_48992 (.out1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_44073_48992),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_44073_44290),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_48996 (.out1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_44073_48996),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_44073_44290),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_49000 (.out1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_44073_49000),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_44073_44290),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49412 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_44073_49412),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49415 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49415),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49419 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_44073_49419),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49422 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49422),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49426 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49426),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49429 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49429),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49433 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_44073_49433),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49436 (.out1(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49436),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49440 (.out1(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_44073_49440),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49443 (.out1(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49443),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49447 (.out1(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_44073_49447),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49450 (.out1(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49450),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49454 (.out1(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_44073_49454),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49457 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49457),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49461 (.out1(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_44073_49461),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49464 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49464),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_44073_44170),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49468 (.out1(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_44073_49468),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49475 (.out1(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_44073_49475),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49482 (.out1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_44073_49482),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49489 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_44073_49489),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49496 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_44073_49496),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49503 (.out1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_44073_49503),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49510 (.out1(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_44073_49510),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49517 (.out1(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_44073_49517),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49973 (.out1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_44073_49973),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_35));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49981 (.out1(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_44073_49981),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49989 (.out1(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_44073_49989),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_40));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_49997 (.out1(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_44073_49997),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_50005 (.out1(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_44073_50005),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_50013 (.out1(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_44073_50013),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_50021 (.out1(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_44073_50021),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_50030 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_44073_50030),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2)) fu___float_adde8m23b_127nih_44073_50230 (.out1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_44073_50230),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_50234 (.out1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_44073_50234),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_15));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_50238 (.out1(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_44073_50238),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_50242 (.out1(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_44073_50242),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_44073_50246 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_44073_50246),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_50250 (.out1(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_44073_50250),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_16));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_50254 (.out1(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_44073_50254),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_27));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_50258 (.out1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_44073_50258),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_37));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50387 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_44073_50387),
    .in1(out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_44073_44767),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50390 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_44073_50390),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_44073_46283),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50394 (.out1(out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_44073_50394),
    .in1(out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_44073_50659),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_50512 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_44073_50512),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_50524 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_44073_50524),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_50536 (.out1(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_44073_50536),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_44073_50548 (.out1(out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_44073_50548),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_28));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50652 (.out1(out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_44073_50652),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_44073_50387),
    .in2(out_const_13));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50655 (.out1(out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_44073_50655),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_44073_50390),
    .in2(out_const_13));
  ui_lshift_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_44073_50659 (.out1(out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_44073_50659),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_44073_46271),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1)) fu___float_adde8m23b_127nih_44073_50780 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_44073_50780),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1)) fu___float_adde8m23b_127nih_44073_50784 (.out1(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_44073_50784),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2)) fu___float_adde8m23b_127nih_44073_50788 (.out1(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_44073_50788),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_51006 (.out1(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_44073_51006),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_55));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_51018 (.out1(out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_44073_51018),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_62));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_44073_51108 (.out1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_44073_51108),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_44073_44633),
    .in2(out_const_46));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51126 (.out1(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_44073_51126),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_44073_49440),
    .in3(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49443),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51130 (.out1(out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_44073_51130),
    .in1(out_const_31),
    .in2(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_44073_49419),
    .in3(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49422),
    .in4(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49426),
    .in5(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49429),
    .in6(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_44073_49433),
    .in7(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49436),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51134 (.out1(out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_44073_51134),
    .in1(out_const_30),
    .in2(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_44073_49412),
    .in3(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49415),
    .in4(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_44073_49461),
    .in5(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49464),
    .in6(out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_44073_51130),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51139 (.out1(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_44073_51139),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49457),
    .in3(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_44073_49510),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51143 (.out1(out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_44073_51143),
    .in1(out_const_19),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49422),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49429),
    .in4(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49436),
    .in5(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_44073_49475),
    .in6(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_44073_49482),
    .in7(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_44073_49489),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51147 (.out1(out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_44073_51147),
    .in1(out_const_21),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49415),
    .in3(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49464),
    .in4(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_44073_49468),
    .in5(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_44073_49517),
    .in6(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_44073_51139),
    .in7(out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_44073_51143),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(22),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51155 (.out1(out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_44073_51155),
    .in1(out_const_24),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_44073_50238),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_44073_49989),
    .in5(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_44073_50242),
    .in6(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_44073_49997),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51159 (.out1(out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_44073_51159),
    .in1(out_const_39),
    .in2(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_44073_50230),
    .in3(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_44073_49973),
    .in4(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in5(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_44073_50234),
    .in6(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_44073_49981),
    .in7(out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_44073_51155),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51163 (.out1(out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_44073_51163),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_44073_50254),
    .in4(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_44073_50021),
    .in5(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_44073_50258),
    .in6(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_44073_50030),
    .in7(out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_44073_51159),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51168 (.out1(out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_44073_51168),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_44073_50246),
    .in4(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_44073_50005),
    .in5(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_44073_50512),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51172 (.out1(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_44073_51172),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_44073_50250),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_44073_50013),
    .in5(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_44073_50780),
    .in6(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_44073_50524),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51175 (.out1(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_44073_51175),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_44073_50254),
    .in4(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_44073_50021),
    .in5(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_44073_50784),
    .in6(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_44073_50536),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51178 (.out1(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_44073_51178),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_44073_50258),
    .in4(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_44073_50030),
    .in5(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_44073_50788),
    .in6(out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_44073_50548),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51182 (.out1(out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_44073_51182),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_44073_50238),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_44073_49989),
    .in5(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_44073_51006),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51185 (.out1(out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_44073_51185),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_44073_50242),
    .in4(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_44073_49997),
    .in5(out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_44073_51018),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51189 (.out1(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_44073_51189),
    .in1(out_const_64),
    .in2(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_44073_51178),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in4(out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_44073_51185),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51193 (.out1(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_44073_51193),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_44073_50234),
    .in4(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_44073_49981),
    .in5(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_44073_51108),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51198 (.out1(out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_44073_51198),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49426),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49429),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51202 (.out1(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_44073_51202),
    .in1(out_const_67),
    .in2(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_44073_51172),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in4(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_44073_51189),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in6(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_44073_51193),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51205 (.out1(out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_44073_51205),
    .in1(out_const_27),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13),
    .in4(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_44073_51202),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51209 (.out1(out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_44073_51209),
    .in1(out_const_71),
    .in2(out_reg_14_reg_14),
    .in3(out_reg_15_reg_15),
    .in4(out_reg_28_reg_28),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in7(out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_44073_51205),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51213 (.out1(out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_44073_51213),
    .in1(out_const_58),
    .in2(out_reg_18_reg_18),
    .in3(out_reg_19_reg_19),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in5(out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_44073_51209),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51217 (.out1(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_44073_51217),
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
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51220 (.out1(out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_44073_51220),
    .in1(out_const_18),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in4(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in6(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_44073_51202),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(39),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51226 (.out1(out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_44073_51226),
    .in1(out_const_23),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_44073_50780),
    .in4(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_44073_50788),
    .in5(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in6(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in7(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51229 (.out1(out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_44073_51229),
    .in1(out_const_15),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_44073_50784),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51232 (.out1(out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_44073_51232),
    .in1(out_const_15),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in3(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_44073_50780),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(38),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51236 (.out1(out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_44073_51236),
    .in1(out_const_49),
    .in2(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_44073_50230),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .in4(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_44073_50784),
    .in5(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_44073_45512),
    .in6(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_44073_45516),
    .in7(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_44073_45520),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51241 (.out1(out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_44073_51241),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_44073_49454),
    .in3(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49457),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51245 (.out1(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_44073_51245),
    .in1(out_const_51),
    .in2(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_44073_49447),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49450),
    .in4(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_44073_49461),
    .in5(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49464),
    .in6(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_44073_51126),
    .in7(out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_44073_51241),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51249 (.out1(out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_44073_51249),
    .in1(out_const_52),
    .in2(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49426),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49429),
    .in4(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_44073_49433),
    .in5(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49436),
    .in6(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_44073_51245),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51252 (.out1(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_44073_51252),
    .in1(out_const_52),
    .in2(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_44073_49412),
    .in3(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49415),
    .in4(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_44073_49419),
    .in5(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49422),
    .in6(out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_44073_51249),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(57),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51256 (.out1(out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_44073_51256),
    .in1(out_const_20),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49422),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49429),
    .in4(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49436),
    .in5(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_44073_49475),
    .in6(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_44073_49482),
    .in7(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_44073_49489),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(45),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51260 (.out1(out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_44073_51260),
    .in1(out_const_34),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49415),
    .in3(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49464),
    .in4(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_44073_49468),
    .in5(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_44073_49517),
    .in6(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_44073_51139),
    .in7(out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_44073_51256),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51264 (.out1(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_44073_51264),
    .in1(out_const_33),
    .in2(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49443),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49450),
    .in4(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_44073_49496),
    .in5(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_44073_49503),
    .in6(out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_44073_51260),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51267 (.out1(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_44073_51267),
    .in1(out_const_13),
    .in2(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_44073_51252),
    .in3(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_44073_51264),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51271 (.out1(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_44073_51271),
    .in1(out_const_59),
    .in2(out_reg_22_reg_22),
    .in3(out_reg_23_reg_23),
    .in4(out_reg_24_reg_24),
    .in5(out_reg_25_reg_25),
    .in6(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_44073_51217),
    .in7(out_reg_36_reg_36),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(59),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51275 (.out1(out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_44073_51275),
    .in1(out_const_53),
    .in2(out_reg_16_reg_16),
    .in3(out_reg_17_reg_17),
    .in4(out_reg_18_reg_18),
    .in5(out_reg_19_reg_19),
    .in6(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_44073_50030),
    .in7(out_reg_29_reg_29),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51279 (.out1(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_44073_51279),
    .in1(out_const_73),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13),
    .in4(out_reg_14_reg_14),
    .in5(out_reg_15_reg_15),
    .in6(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_44073_51271),
    .in7(out_reg_37_reg_37),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51283 (.out1(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_44073_51283),
    .in1(out_const_16),
    .in2(out_reg_30_reg_30),
    .in3(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_44073_51279),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_44073_51294 (.out1(out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_44073_51294),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48914),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48921),
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
    .in1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_44073_48917),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_44073_48921),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_44073_49412),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_44073_49415),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_44073_49419),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_44073_49422),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_44073_49426),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_44073_49429),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_44073_49433),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_44073_49436),
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
    .in1(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_44073_49440),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_44073_49443),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_44073_49447),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_44073_49450),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_44073_49454),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_44073_49457),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_44073_49461),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_44073_49464),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_44073_51198),
    .wenable(wrenable_reg_28));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_44073_51245),
    .wenable(wrenable_reg_29));
  register_STD #(.BITSIZE_in1(25),
    .BITSIZE_out1(25)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_44073_46039),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_44073_51267),
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
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_44073_45508),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_44073_51213),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_44073_51220),
    .wenable(wrenable_reg_36));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_44073_51275),
    .wenable(wrenable_reg_37));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_44073_46046),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_44073_46322),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_44073_46411),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_44073_48045),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_44073_48464),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_44073_48914),
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
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
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
          _next_state = S_2;
        end
      S_2 :
        begin
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
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
  wire [63:0] in_port_a_SIGI1;
  wire [63:0] in_port_a_SIGI2;
  wire [63:0] in_port_b_SIGI1;
  wire [63:0] in_port_b_SIGI2;
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
    .in_port_a(in_port_a_SIGI2),
    .in_port_b(in_port_b_SIGI2),
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
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) in_port_a_REG (.out1(in_port_a_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_a_SIGI1));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) in_port_b_REG (.out1(in_port_b_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_b_SIGI1));
  // io-signal post fix
  assign in_port_a_SIGI1 = a;
  assign in_port_b_SIGI1 = b;
  assign done_port = done_delayed_REG_signal_out;

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
  wire [7:0] out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_43033_46341;
  wire [7:0] out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_43033_46343;
  wire signed [2:0] out_UIdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_43033_43383;
  wire signed [1:0] out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_43033_43386;
  wire signed [1:0] out_UIdata_converter_FU_42_i0_fu___float_mule8m23b_127nih_43033_43416;
  wire signed [2:0] out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_43033_43389;
  wire signed [1:0] out_UIdata_converter_FU_48_i0_fu___float_mule8m23b_127nih_43033_43419;
  wire signed [1:0] out_UIdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_43033_43434;
  wire signed [1:0] out_UIdata_converter_FU_57_i0_fu___float_mule8m23b_127nih_43033_43724;
  wire [7:0] out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_43033_43143;
  wire out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_43033_46212;
  wire out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_43033_43271;
  wire out_UUdata_converter_FU_41_i0_fu___float_mule8m23b_127nih_43033_43413;
  wire out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_43033_46222;
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
  wire [63:0] out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46230_32_64;
  wire out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47550;
  wire out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47553;
  wire out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47836;
  wire out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_43033_47979;
  wire out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47983;
  wire out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_43033_43225;
  wire out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_43033_44047;
  wire out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_43033_47988;
  wire out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47991;
  wire out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_43033_43303;
  wire out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_43033_44039;
  wire out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_43033_47996;
  wire out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_43033_46716;
  wire out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_43033_46554;
  wire out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_43033_48003;
  wire out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_43033_46720;
  wire out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_43033_46599;
  wire out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_43033_46606;
  wire out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_43033_46620;
  wire out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_48011;
  wire out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_43033_45472;
  wire out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_43033_46154;
  wire out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_43033_48018;
  wire out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_43033_48021;
  wire out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_43033_48025;
  wire out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_43033_48029;
  wire out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_43033_46157;
  wire out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_43033_46170;
  wire out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_43033_46124;
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
  wire [9:0] out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_43033_46119;
  wire [9:0] out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_43033_46188;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_43033_46173;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_43033_46191;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46230;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_43033_45963;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_43033_45972;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_43033_46179;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_43033_46185;
  wire out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_43033_43205;
  wire out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_43033_43291;
  wire out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_43033_47361;
  wire out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_43033_47365;
  wire out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_43033_47369;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_43033_47373;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_43033_47377;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_43033_47381;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_43033_47385;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_43033_47389;
  wire out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_43033_47393;
  wire out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_43033_47397;
  wire out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_43033_47401;
  wire out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_43033_47405;
  wire out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_43033_47409;
  wire out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_43033_47413;
  wire out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_43033_47417;
  wire out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_43033_47421;
  wire out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_43033_46899;
  wire out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_43033_45793;
  wire out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_43033_47715;
  wire out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_43033_47539;
  wire out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_43033_46922;
  wire out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47920;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_43033_46732;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_43033_47238;
  wire out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_43033_47242;
  wire out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_43033_47246;
  wire out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_43033_47251;
  wire out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_43033_47256;
  wire out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_43033_47261;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_43033_47266;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_43033_47271;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_43033_46968;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_43033_46736;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_43033_43184;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_43033_45752;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_43033_46150;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_43033_46209;
  wire [47:0] out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_43033_43740;
  wire [32:0] out_ui_lshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_43033_43746;
  wire [46:0] out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_43033_43727;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_43033_46195;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_43033_46199;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_43033_46216;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_43033_46225;
  wire [47:0] out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_43033_43512;
  wire out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_43033_43843;
  wire out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_43033_44036;
  wire out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_43033_44044;
  wire [9:0] out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_43033_43715;
  wire [32:0] out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_121_i0_fu___float_mule8m23b_127nih_43033_43131;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_121_i1_fu___float_mule8m23b_127nih_43033_43150;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_43033_45755;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_43033_46143;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_43033_46205;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_43033_46202;
  wire [22:0] out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_mule8m23b_127nih_43033_43749;
  wire [22:0] out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_43033_45742;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_127_i0_fu___float_mule8m23b_127nih_43033_43359;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_43033_43362;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_43033_46219;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_43033_46228;
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
    .BITSIZE_out1(64)) conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46230_32_64 (.out1(out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46230_32_64),
    .in1(out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46230));
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
    .in2(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_43033_46732),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_43033_46736),
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
    .in3(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47983),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43271 (.out1(out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_43033_43271),
    .in1(out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_43033_46716));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43274 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i0_fu___float_mule8m23b_127nih_43033_43274),
    .in1(out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_43033_46195),
    .in2(out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_43033_46185));
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
    .in3(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47991),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43349 (.out1(out_UUdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_43033_43349),
    .in1(out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_43033_46720));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_43352 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i2_fu___float_mule8m23b_127nih_43033_43352),
    .in1(out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_43033_46199),
    .in2(out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_43033_46179));
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
    .in1(out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_43033_46554));
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
    .in1(out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_43033_46599));
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
    .in2(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_43033_46341),
    .in3(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_43033_46343));
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
    .in1(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_43033_46899));
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
    .in1(out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_43033_46606));
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
    .in1(out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_43033_45742),
    .in2(out_const_40));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43843 (.out1(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_43033_43843),
    .in1(out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_43033_45755),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_43855 (.out1(out_UUdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_43033_43855),
    .in1(out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_43033_46620));
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
    .in3(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47991),
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
    .in3(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47983),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_45472 (.out1(out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_43033_45472),
    .in1(out_const_11),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47550),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47553),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47920),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47836),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_48011),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_45742 (.out1(out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_43033_45742),
    .in1(out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_43033_43740),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_45752 (.out1(out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_43033_45752),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i3_fu___float_mule8m23b_127nih_43033_43840),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_45755 (.out1(out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_43033_45755),
    .in1(out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_43033_45752),
    .in2(out_const_5));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(4)) fu___float_mule8m23b_127nih_43033_45793 (.out1(out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_43033_45793),
    .in1(out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_43033_43715),
    .in2(out_const_15));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_45963 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_43033_45963),
    .in1(out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_43033_44039),
    .in2(out_const_19),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_45972 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_43033_45972),
    .in1(out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_43033_44047),
    .in2(out_const_19),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_in3(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_43033_46119 (.out1(out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_43033_46119),
    .in1(out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_43033_45472),
    .in2(out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_43033_46143),
    .in3(out_const_37));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46124 (.out1(out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_43033_46124),
    .in1(out_const_38),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47550),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47553),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47920),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47836),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_48011),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_46143 (.out1(out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_43033_46143),
    .in1(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_43033_43184),
    .in2(out_const_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_46150 (.out1(out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_43033_46150),
    .in1(out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_43033_46119),
    .in2(out_const_16));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46154 (.out1(out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_43033_46154),
    .in1(out_const_39),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47550),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47553),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47920),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47836),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_48011),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46157 (.out1(out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_43033_46157),
    .in1(out_const_9),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_8_reg_8),
    .in4(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_43033_48025),
    .in5(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_43033_48029),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46170 (.out1(out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_43033_46170),
    .in1(out_const_10),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_8_reg_8),
    .in4(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_43033_48025),
    .in5(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_43033_48029),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_43033_46173 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_43033_46173),
    .in1(out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_43033_46170),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_100_i0_fu___float_mule8m23b_127nih_43033_43961),
    .in3(out_reg_0_reg_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_46179 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_43033_46179),
    .in1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_43033_43303),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_43033_45963));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_43033_46185 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_43033_46185),
    .in1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_43033_43225),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_43033_45972));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_in3(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_43033_46188 (.out1(out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_43033_46188),
    .in1(out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_43033_46124),
    .in2(out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_43033_46202),
    .in3(out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_43033_46205));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_43033_46191 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_43033_46191),
    .in1(out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_43033_46157),
    .in2(out_reg_5_reg_5),
    .in3(out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_43033_46173));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46195 (.out1(out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_43033_46195),
    .in1(out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_43033_46219),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46199 (.out1(out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_43033_46199),
    .in1(out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_43033_46228),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_46202 (.out1(out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_43033_46202),
    .in1(out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_43033_46150),
    .in2(out_const_16));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_46205 (.out1(out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_43033_46205),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_43033_44014),
    .in2(out_const_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_43033_46209 (.out1(out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_43033_46209),
    .in1(out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_43033_46188),
    .in2(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46212 (.out1(out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_43033_46212),
    .in1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_43033_43225));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46216 (.out1(out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_43033_46216),
    .in1(out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_43033_46212),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46219 (.out1(out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_43033_46219),
    .in1(out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_43033_46216),
    .in2(out_const_25));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46222 (.out1(out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_43033_46222),
    .in1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_43033_43303));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46225 (.out1(out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_43033_46225),
    .in1(out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_43033_46222),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_43033_46228 (.out1(out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_43033_46228),
    .in1(out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_43033_46225),
    .in2(out_const_25));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_43033_46230 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46230),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_7_reg_7),
    .in3(out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_43033_46191));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_43033_46341 (.out1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_43033_46341),
    .in1(out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_43033_43143));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_43033_46343 (.out1(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_43033_46343),
    .in1(out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_43033_43158));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46554 (.out1(out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_43033_46554),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_43033_47361),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_43033_47365),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_43033_43205),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_43033_44044),
    .in6(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47983),
    .in7(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_43033_47996),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46599 (.out1(out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_43033_46599),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_43033_47393),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_43033_47397),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_43033_43291),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_43033_44036),
    .in6(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47991),
    .in7(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_43033_48003),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46606 (.out1(out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_43033_46606),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_43033_46899),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46620 (.out1(out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_43033_46620),
    .in1(out_const_27),
    .in2(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_43033_43843),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_43033_47715),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_43033_47539),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46716 (.out1(out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_43033_46716),
    .in1(out_const_28),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_43033_47361),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_43033_47365),
    .in4(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47983),
    .in5(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_43033_47996),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_46720 (.out1(out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_43033_46720),
    .in1(out_const_28),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_43033_47393),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_43033_47397),
    .in4(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47991),
    .in5(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_43033_48003),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_46732 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_43033_46732),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_46736 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_43033_46736),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(6)) fu___float_mule8m23b_127nih_43033_46899 (.out1(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_43033_46899),
    .in1(out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_43033_43512),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(6)) fu___float_mule8m23b_127nih_43033_46922 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_43033_46922),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_7));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_46968 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_43033_46968),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47238 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_43033_47238),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47242 (.out1(out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_43033_47242),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47246 (.out1(out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_43033_47246),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47251 (.out1(out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_43033_47251),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47256 (.out1(out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_43033_47256),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47261 (.out1(out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_43033_47261),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47266 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_43033_47266),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47271 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_43033_47271),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_43033_43865),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47361 (.out1(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_43033_47361),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47365 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_43033_47365),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47369 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_43033_47369),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47373 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_43033_47373),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47377 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_43033_47377),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47381 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_43033_47381),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47385 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_43033_47385),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47389 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_43033_47389),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47393 (.out1(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_43033_47393),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47397 (.out1(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_43033_47397),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47401 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_43033_47401),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47405 (.out1(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_43033_47405),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47409 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_43033_47409),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47413 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_43033_47413),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47417 (.out1(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_43033_47417),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47421 (.out1(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_43033_47421),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47539 (.out1(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_43033_47539),
    .in1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_43033_43727),
    .in2(out_const_17));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_43033_47550 (.out1(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47550),
    .in1(out_bit_and_expr_FU_8_8_8_89_i1_fu___float_mule8m23b_127nih_43033_43422),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_43033_47553 (.out1(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47553),
    .in1(out_bit_and_expr_FU_8_8_8_89_i2_fu___float_mule8m23b_127nih_43033_43437),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_43033_47715 (.out1(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_43033_47715),
    .in1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_43033_43727),
    .in2(out_const_21));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_43033_47836 (.out1(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47836),
    .in1(out_bit_and_expr_FU_8_8_8_89_i0_fu___float_mule8m23b_127nih_43033_43395),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_43033_47920 (.out1(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47920),
    .in1(out_ui_bit_and_expr_FU_1_1_1_95_i0_fu___float_mule8m23b_127nih_43033_43377),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47979 (.out1(out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_43033_47979),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_43033_47361),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_43033_47365),
    .in4(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_43033_47369),
    .in5(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_43033_47373),
    .in6(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_43033_47385),
    .in7(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_43033_47389),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47983 (.out1(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47983),
    .in1(out_const_8),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_43033_47377),
    .in3(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_43033_47381),
    .in4(out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_43033_47979),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47988 (.out1(out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_43033_47988),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_43033_47393),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_43033_47397),
    .in4(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_43033_47401),
    .in5(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_43033_47405),
    .in6(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_43033_47417),
    .in7(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_43033_47421),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47991 (.out1(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47991),
    .in1(out_const_8),
    .in2(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_43033_47409),
    .in3(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_43033_47413),
    .in4(out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_43033_47988),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_47996 (.out1(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_43033_47996),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_43033_47369),
    .in3(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_43033_47373),
    .in4(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_43033_47377),
    .in5(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_43033_47381),
    .in6(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_43033_47385),
    .in7(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_43033_47389),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_48003 (.out1(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_43033_48003),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_43033_47401),
    .in3(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_43033_47405),
    .in4(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_43033_47409),
    .in5(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_43033_47413),
    .in6(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_43033_47417),
    .in7(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_43033_47421),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(49),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_48011 (.out1(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_48011),
    .in1(out_const_14),
    .in2(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_43033_43205),
    .in3(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_43033_44044),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_43033_43291),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_43033_44036),
    .in6(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_43033_47983),
    .in7(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_43033_47991),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_48018 (.out1(out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_43033_48018),
    .in1(out_const_5),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_43033_47550),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_43033_47553),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_43033_47920),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_43033_47836),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_48021 (.out1(out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_43033_48021),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_43033_47238),
    .in3(out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_43033_47242),
    .in4(out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_43033_47246),
    .in5(out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_43033_47251),
    .in6(out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_43033_47266),
    .in7(out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_43033_47271),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_48025 (.out1(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_43033_48025),
    .in1(out_const_29),
    .in2(out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_43033_47256),
    .in3(out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_43033_47261),
    .in4(out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_43033_46968),
    .in5(out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_43033_48021),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_43033_48029 (.out1(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_43033_48029),
    .in1(out_const_34),
    .in2(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_43033_43843),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_43033_47715),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_43033_47539),
    .in5(out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_43033_45793),
    .in6(out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_43033_46922),
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
    .in1(out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_43033_46154),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_43033_46209),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_43033_48011),
    .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_43033_48018),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_43033_46230_32_64;

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
  parameter [2:0] S_0 = 3'b001,
    S_1 = 3'b010,
    S_2 = 3'b100;
  reg [2:0] _present_state=S_0, _next_state;
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
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
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
  wire [63:0] in_port_a_SIGI1;
  wire [63:0] in_port_a_SIGI2;
  wire [63:0] in_port_b_SIGI1;
  wire [63:0] in_port_b_SIGI2;
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
    .in_port_a(in_port_a_SIGI2),
    .in_port_b(in_port_b_SIGI2),
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
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) in_port_a_REG (.out1(in_port_a_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_a_SIGI1));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) in_port_b_REG (.out1(in_port_b_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_b_SIGI1));
  // io-signal post fix
  assign in_port_a_SIGI1 = a;
  assign in_port_b_SIGI1 = b;
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
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

// Datapath RTL description for _Z18matrix_convolutionPKfPfS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath__Z18matrix_convolutionPKfPfS1_ii(clock,
  reset,
  in_port_A,
  in_port_kernel,
  in_port_B,
  in_port_size,
  in_port_kernel_size,
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
  fuselector_BMEMORY_CTRLN_50_i0_LOAD,
  fuselector_BMEMORY_CTRLN_50_i0_STORE,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046,
  selector_MUX_113_reg_10_0_0_0,
  selector_MUX_114_reg_11_0_0_0,
  selector_MUX_114_reg_11_0_0_1,
  selector_MUX_121_reg_18_0_0_0,
  selector_MUX_128_reg_24_0_0_0,
  selector_MUX_129_reg_25_0_0_0,
  selector_MUX_134_reg_3_0_0_0,
  selector_MUX_136_reg_31_0_0_0,
  selector_MUX_141_reg_36_0_0_0,
  selector_MUX_141_reg_36_0_0_1,
  selector_MUX_144_reg_6_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0,
  selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0,
  selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0,
  selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0,
  selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0,
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
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100,
  OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962,
  OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966,
  OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042,
  OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_kernel;
  input [31:0] in_port_B;
  input signed [31:0] in_port_size;
  input signed [31:0] in_port_kernel_size;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_50_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_50_i0_STORE;
  input selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962;
  input selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966;
  input selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042;
  input selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046;
  input selector_MUX_113_reg_10_0_0_0;
  input selector_MUX_114_reg_11_0_0_0;
  input selector_MUX_114_reg_11_0_0_1;
  input selector_MUX_121_reg_18_0_0_0;
  input selector_MUX_128_reg_24_0_0_0;
  input selector_MUX_129_reg_25_0_0_0;
  input selector_MUX_134_reg_3_0_0_0;
  input selector_MUX_136_reg_31_0_0_0;
  input selector_MUX_141_reg_36_0_0_0;
  input selector_MUX_141_reg_36_0_0_1;
  input selector_MUX_144_reg_6_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0;
  input selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0;
  input selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0;
  input selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0;
  input selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0;
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
  output OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893;
  output OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070;
  output OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072;
  output OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074;
  output OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080;
  output OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092;
  output OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094;
  output OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096;
  output OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098;
  output OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100;
  output OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962;
  output OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966;
  output OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042;
  output OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046;
  // Component and signal declarations
  wire [31:0] null_out_signal_BMEMORY_CTRLN_50_i0_out1_1;
  wire [31:0] out_BMEMORY_CTRLN_50_i0_BMEMORY_CTRLN_50_i0;
  wire [29:0] out_IUdata_converter_FU_22_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36981;
  wire [29:0] out_IUdata_converter_FU_27_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37024;
  wire [29:0] out_IUdata_converter_FU_38_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37058;
  wire [29:0] out_IUdata_converter_FU_9_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36941;
  wire [31:0] out_MUX_113_reg_10_0_0_0;
  wire [31:0] out_MUX_114_reg_11_0_0_0;
  wire [31:0] out_MUX_114_reg_11_0_0_1;
  wire [31:0] out_MUX_121_reg_18_0_0_0;
  wire [31:0] out_MUX_128_reg_24_0_0_0;
  wire [31:0] out_MUX_129_reg_25_0_0_0;
  wire [31:0] out_MUX_134_reg_3_0_0_0;
  wire [31:0] out_MUX_136_reg_31_0_0_0;
  wire [31:0] out_MUX_141_reg_36_0_0_0;
  wire [31:0] out_MUX_141_reg_36_0_0_1;
  wire [31:0] out_MUX_144_reg_6_0_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0;
  wire [63:0] out_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0;
  wire [63:0] out_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0;
  wire [63:0] out_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0;
  wire [63:0] out_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0;
  wire signed [1:0] out_UIdata_converter_FU_3_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45937;
  wire [31:0] out_UUdata_converter_FU_23_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45371;
  wire [31:0] out_UUdata_converter_FU_29_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45343;
  wire [31:0] out_UUdata_converter_FU_30_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45346;
  wire [31:0] out_UUdata_converter_FU_31_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45340;
  wire [31:0] out_UUdata_converter_FU_32_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45368;
  wire [31:0] out_UUdata_converter_FU_33_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45365;
  wire [31:0] out_UUdata_converter_FU_39_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45393;
  wire [31:0] out_UUdata_converter_FU_40_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45390;
  wire [31:0] out_UUdata_converter_FU_41_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45418;
  wire [31:0] out_UUdata_converter_FU_42_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45421;
  wire [31:0] out_UUdata_converter_FU_43_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45415;
  wire [63:0] out___float_adde8m23b_127nih_65_i0___float_adde8m23b_127nih_65_i0;
  wire [63:0] out___float_mule8m23b_127nih_66_i0___float_mule8m23b_127nih_66_i0;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [6:0] out_const_2;
  wire [5:0] out_const_3;
  wire out_const_4;
  wire [1:0] out_const_5;
  wire [3:0] out_const_6;
  wire [4:0] out_const_7;
  wire [31:0] out_conv_out___float_adde8m23b_127nih_65_i0___float_adde8m23b_127nih_65_i0_64_32;
  wire [31:0] out_conv_out___float_mule8m23b_127nih_66_i0___float_mule8m23b_127nih_66_i0_64_32;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [63:0] out_conv_out_const_0_1_64;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire [5:0] out_conv_out_const_2_7_6;
  wire [63:0] out_conv_out_reg_20_reg_20_32_64;
  wire [63:0] out_conv_out_reg_21_reg_21_32_64;
  wire [63:0] out_conv_out_reg_22_reg_22_32_64;
  wire [63:0] out_conv_out_reg_29_reg_29_32_64;
  wire [63:0] out_conv_out_reg_33_reg_33_32_64;
  wire [63:0] out_conv_out_reg_34_reg_34_32_64;
  wire [63:0] out_conv_out_reg_35_reg_35_32_64;
  wire out_extract_bit_expr_FU_15_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_46433;
  wire out_extract_bit_expr_FU_21_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_46436;
  wire out_extract_bit_expr_FU_2_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_46430;
  wire out_gt_expr_FU_32_32_32_51_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37078;
  wire signed [31:0] out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0;
  wire out_le_expr_FU_32_0_32_52_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42993;
  wire out_le_expr_FU_32_32_32_53_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43005;
  wire out_le_expr_FU_32_32_32_53_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43007;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_54_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45941;
  wire out_lt_expr_FU_32_32_32_55_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37077;
  wire out_lt_expr_FU_32_32_32_55_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42995;
  wire out_lt_expr_FU_32_32_32_55_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42999;
  wire out_lt_expr_FU_32_32_32_55_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43001;
  wire out_lt_expr_FU_32_32_32_55_i4_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43003;
  wire out_lut_expr_FU_26_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37079;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_56_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36915;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_56_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36991;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_56_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37031;
  wire signed [31:0] out_negate_expr_FU_32_32_57_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36907;
  wire signed [31:0] out_plus_expr_FU_32_0_32_58_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36920;
  wire signed [31:0] out_plus_expr_FU_32_0_32_58_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36952;
  wire signed [31:0] out_plus_expr_FU_32_0_32_58_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37000;
  wire signed [31:0] out_plus_expr_FU_32_0_32_58_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37006;
  wire signed [31:0] out_plus_expr_FU_32_0_32_58_i4_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37066;
  wire signed [31:0] out_plus_expr_FU_32_0_32_59_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37076;
  wire signed [31:0] out_plus_expr_FU_32_32_32_60_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36944;
  wire signed [31:0] out_plus_expr_FU_32_32_32_60_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36984;
  wire signed [31:0] out_plus_expr_FU_32_32_32_60_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36988;
  wire signed [31:0] out_plus_expr_FU_32_32_32_60_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36994;
  wire signed [31:0] out_plus_expr_FU_32_32_32_60_i4_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37027;
  wire signed [31:0] out_plus_expr_FU_32_32_32_60_i5_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37034;
  wire signed [31:0] out_plus_expr_FU_32_32_32_60_i6_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37036;
  wire signed [31:0] out_plus_expr_FU_32_32_32_60_i7_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37061;
  wire signed [31:0] out_plus_expr_FU_32_32_32_60_i8_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42981;
  wire out_read_cond_FU_10_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37070;
  wire out_read_cond_FU_16_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37072;
  wire out_read_cond_FU_24_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37074;
  wire out_read_cond_FU_28_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37080;
  wire out_read_cond_FU_34_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37092;
  wire out_read_cond_FU_44_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37094;
  wire out_read_cond_FU_46_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37096;
  wire out_read_cond_FU_48_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37098;
  wire out_read_cond_FU_49_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37100;
  wire out_read_cond_FU_4_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36893;
  wire [30:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [31:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [31:0] out_reg_18_reg_18;
  wire out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [31:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire [31:0] out_reg_25_reg_25;
  wire [31:0] out_reg_26_reg_26;
  wire [31:0] out_reg_27_reg_27;
  wire out_reg_28_reg_28;
  wire [31:0] out_reg_29_reg_29;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_30_reg_30;
  wire [31:0] out_reg_31_reg_31;
  wire out_reg_32_reg_32;
  wire [31:0] out_reg_33_reg_33;
  wire [31:0] out_reg_34_reg_34;
  wire [31:0] out_reg_35_reg_35;
  wire [31:0] out_reg_36_reg_36;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_61_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36892;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_62_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45944;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_63_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36938;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_63_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36978;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_63_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37021;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_63_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37055;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_64_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36933;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_64_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36973;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_64_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37016;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_64_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37052;
  wire [31:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [31:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire s___float_adde8m23b_127nih_65_i00;
  wire s___float_mule8m23b_127nih_66_i01;
  wire s_done___float_adde8m23b_127nih_65_i0;
  wire s_done___float_mule8m23b_127nih_66_i0;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_50_i0 (.out1({null_out_signal_BMEMORY_CTRLN_50_i0_out1_1,
      out_BMEMORY_CTRLN_50_i0_BMEMORY_CTRLN_50_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0}),
    .in3({6'b000000,
      out_conv_out_const_2_7_6}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_50_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_50_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IIdata_converter_FU_ii_conv_0 (.out1(out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0),
    .in1(out_conv_out_const_0_I_1_I_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_113_reg_10_0_0_0 (.out1(out_MUX_113_reg_10_0_0_0),
    .sel(selector_MUX_113_reg_10_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_plus_expr_FU_32_0_32_58_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37000));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_114_reg_11_0_0_0 (.out1(out_MUX_114_reg_11_0_0_0),
    .sel(selector_MUX_114_reg_11_0_0_0),
    .in1(out_reg_36_reg_36),
    .in2(out_UUdata_converter_FU_43_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45415));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_114_reg_11_0_0_1 (.out1(out_MUX_114_reg_11_0_0_1),
    .sel(selector_MUX_114_reg_11_0_0_1),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in2(out_MUX_114_reg_11_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_121_reg_18_0_0_0 (.out1(out_MUX_121_reg_18_0_0_0),
    .sel(selector_MUX_121_reg_18_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_plus_expr_FU_32_0_32_58_i4_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37066));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_128_reg_24_0_0_0 (.out1(out_MUX_128_reg_24_0_0_0),
    .sel(selector_MUX_128_reg_24_0_0_0),
    .in1(out_reg_11_reg_11),
    .in2(out_UUdata_converter_FU_33_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45365));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_129_reg_25_0_0_0 (.out1(out_MUX_129_reg_25_0_0_0),
    .sel(selector_MUX_129_reg_25_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_plus_expr_FU_32_0_32_58_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37006));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_134_reg_3_0_0_0 (.out1(out_MUX_134_reg_3_0_0_0),
    .sel(selector_MUX_134_reg_3_0_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_136_reg_31_0_0_0 (.out1(out_MUX_136_reg_31_0_0_0),
    .sel(selector_MUX_136_reg_31_0_0_0),
    .in1(out_BMEMORY_CTRLN_50_i0_BMEMORY_CTRLN_50_i0),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_141_reg_36_0_0_0 (.out1(out_MUX_141_reg_36_0_0_0),
    .sel(selector_MUX_141_reg_36_0_0_0),
    .in1(out_UUdata_converter_FU_33_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45365),
    .in2(out_UUdata_converter_FU_43_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45415));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_141_reg_36_0_0_1 (.out1(out_MUX_141_reg_36_0_0_1),
    .sel(selector_MUX_141_reg_36_0_0_1),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in2(out_MUX_141_reg_36_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_144_reg_6_0_0_0 (.out1(out_MUX_144_reg_6_0_0_0),
    .sel(selector_MUX_144_reg_6_0_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_50_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_64_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36933),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_64_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36973));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_50_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_64_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37016),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_64_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37052));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_50_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_30___float_adde8m23b_127nih_65_i0_0_0_0 (.out1(out_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0),
    .sel(selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0),
    .in1(out_conv_out_reg_35_reg_35_32_64),
    .in2(out_conv_out_reg_22_reg_22_32_64));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_31___float_adde8m23b_127nih_65_i0_1_0_0 (.out1(out_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0),
    .sel(selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0),
    .in1(out_conv_out_reg_29_reg_29_32_64),
    .in2(out_conv_out_reg_20_reg_20_32_64));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_32___float_mule8m23b_127nih_66_i0_0_0_0 (.out1(out_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0),
    .sel(selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0),
    .in1(out_conv_out_reg_34_reg_34_32_64),
    .in2(out_conv_out_reg_21_reg_21_32_64));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_33___float_mule8m23b_127nih_66_i0_1_0_0 (.out1(out_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0),
    .sel(selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0),
    .in1(out_conv_out_reg_33_reg_33_32_64),
    .in2(out_conv_out_const_0_1_64));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_reg_36_reg_36));
  __float_adde8m23b_127nih __float_adde8m23b_127nih_65_i0 (.done_port(s_done___float_adde8m23b_127nih_65_i0),
    .return_port(out___float_adde8m23b_127nih_65_i0___float_adde8m23b_127nih_65_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___float_adde8m23b_127nih_65_i00),
    .a(out_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0),
    .b(out_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0));
  __float_mule8m23b_127nih __float_mule8m23b_127nih_66_i0 (.done_port(s_done___float_mule8m23b_127nih_66_i0),
    .return_port(out___float_mule8m23b_127nih_66_i0___float_mule8m23b_127nih_66_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___float_mule8m23b_127nih_66_i01),
    .a(out_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0),
    .b(out_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1110)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_7 (.out1(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_out___float_adde8m23b_127nih_65_i0___float_adde8m23b_127nih_65_i0_64_32 (.out1(out_conv_out___float_adde8m23b_127nih_65_i0___float_adde8m23b_127nih_65_i0_64_32),
    .in1(out___float_adde8m23b_127nih_65_i0___float_adde8m23b_127nih_65_i0));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_out___float_mule8m23b_127nih_66_i0___float_mule8m23b_127nih_66_i0_64_32 (.out1(out_conv_out___float_mule8m23b_127nih_66_i0___float_mule8m23b_127nih_66_i0_64_32),
    .in1(out___float_mule8m23b_127nih_66_i0___float_mule8m23b_127nih_66_i0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) conv_out_const_0_1_64 (.out1(out_conv_out_const_0_1_64),
    .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_2_7_6 (.out1(out_conv_out_const_2_7_6),
    .in1(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_20_reg_20_32_64 (.out1(out_conv_out_reg_20_reg_20_32_64),
    .in1(out_reg_20_reg_20));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_21_reg_21_32_64 (.out1(out_conv_out_reg_21_reg_21_32_64),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_22_reg_22_32_64 (.out1(out_conv_out_reg_22_reg_22_32_64),
    .in1(out_reg_22_reg_22));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_29_reg_29_32_64 (.out1(out_conv_out_reg_29_reg_29_32_64),
    .in1(out_reg_29_reg_29));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_33_reg_33_32_64 (.out1(out_conv_out_reg_33_reg_33_32_64),
    .in1(out_reg_33_reg_33));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_34_reg_34_32_64 (.out1(out_conv_out_reg_34_reg_34_32_64),
    .in1(out_reg_34_reg_34));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_35_reg_35_32_64 (.out1(out_conv_out_reg_35_reg_35_32_64),
    .in1(out_reg_35_reg_35));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36892 (.out1(out_rshift_expr_FU_32_0_32_61_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36892),
    .in1(out_plus_expr_FU_32_32_32_60_i8_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42981),
    .in2(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36893 (.out1(out_read_cond_FU_4_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36893),
    .in1(out_le_expr_FU_32_0_32_52_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42993));
  negate_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36907 (.out1(out_negate_expr_FU_32_32_57_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36907),
    .in1(out_reg_0_reg_0));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36915 (.out1(out_mult_expr_FU_32_32_32_0_56_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36915),
    .clock(clock),
    .in1(in_port_size),
    .in2(out_reg_3_reg_3));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36920 (.out1(out_plus_expr_FU_32_0_32_58_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36920),
    .in1(out_reg_3_reg_3),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36933 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_64_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36933),
    .in1(in_port_B),
    .in2(out_reg_8_reg_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36938 (.out1(out_ui_lshift_expr_FU_32_0_32_63_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36938),
    .in1(out_IUdata_converter_FU_9_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36941),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36941 (.out1(out_IUdata_converter_FU_9_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36941),
    .in1(out_plus_expr_FU_32_32_32_60_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36944));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36944 (.out1(out_plus_expr_FU_32_32_32_60_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36944),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_6_reg_6));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36952 (.out1(out_plus_expr_FU_32_0_32_58_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36952),
    .in1(out_reg_6_reg_6),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36973 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_64_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36973),
    .in1(in_port_kernel),
    .in2(out_reg_26_reg_26));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36978 (.out1(out_ui_lshift_expr_FU_32_0_32_63_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36978),
    .in1(out_IUdata_converter_FU_22_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36981),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36981 (.out1(out_IUdata_converter_FU_22_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36981),
    .in1(out_plus_expr_FU_32_32_32_60_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36984));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36984 (.out1(out_plus_expr_FU_32_32_32_60_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36984),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_25_reg_25));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36988 (.out1(out_plus_expr_FU_32_32_32_60_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36988),
    .in1(out_reg_15_reg_15),
    .in2(out_reg_0_reg_0));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36991 (.out1(out_mult_expr_FU_32_32_32_0_56_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36991),
    .clock(clock),
    .in1(out_reg_12_reg_12),
    .in2(in_port_kernel_size));
  plus_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_36994 (.out1(out_plus_expr_FU_32_32_32_60_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36994),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_10_reg_10));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37000 (.out1(out_plus_expr_FU_32_0_32_58_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37000),
    .in1(out_reg_10_reg_10),
    .in2(out_const_1));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37006 (.out1(out_plus_expr_FU_32_0_32_58_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37006),
    .in1(out_reg_25_reg_25),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37016 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_64_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37016),
    .in1(in_port_A),
    .in2(out_reg_30_reg_30));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37021 (.out1(out_ui_lshift_expr_FU_32_0_32_63_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37021),
    .in1(out_IUdata_converter_FU_27_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37024),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37024 (.out1(out_IUdata_converter_FU_27_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37024),
    .in1(out_plus_expr_FU_32_32_32_60_i4_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37027));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37027 (.out1(out_plus_expr_FU_32_32_32_60_i4_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37027),
    .in1(out_reg_16_reg_16),
    .in2(out_reg_27_reg_27));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37031 (.out1(out_mult_expr_FU_32_32_32_0_56_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37031),
    .clock(clock),
    .in1(out_reg_13_reg_13),
    .in2(in_port_size));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37034 (.out1(out_plus_expr_FU_32_32_32_60_i5_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37034),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_10_reg_10));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37036 (.out1(out_plus_expr_FU_32_32_32_60_i6_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37036),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_25_reg_25));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37052 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_64_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37052),
    .in1(in_port_kernel),
    .in2(out_ui_lshift_expr_FU_32_0_32_63_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37055));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37055 (.out1(out_ui_lshift_expr_FU_32_0_32_63_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37055),
    .in1(out_IUdata_converter_FU_38_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37058),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37058 (.out1(out_IUdata_converter_FU_38_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37058),
    .in1(out_plus_expr_FU_32_32_32_60_i7_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37061));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37061 (.out1(out_plus_expr_FU_32_32_32_60_i7_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37061),
    .in1(out_reg_18_reg_18),
    .in2(out_reg_17_reg_17));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37066 (.out1(out_plus_expr_FU_32_0_32_58_i4_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37066),
    .in1(out_reg_18_reg_18),
    .in2(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37070 (.out1(out_read_cond_FU_10_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37070),
    .in1(out_reg_7_reg_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37072 (.out1(out_read_cond_FU_16_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37072),
    .in1(out_reg_14_reg_14));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37074 (.out1(out_read_cond_FU_24_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37074),
    .in1(out_extract_bit_expr_FU_21_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_46436));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37076 (.out1(out_plus_expr_FU_32_0_32_59_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37076),
    .in1(in_port_size),
    .in2(out_const_4));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37077 (.out1(out_lt_expr_FU_32_32_32_55_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37077),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_27_reg_27));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37078 (.out1(out_gt_expr_FU_32_32_32_51_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37078),
    .in1(out_reg_13_reg_13),
    .in2(out_reg_1_reg_1));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37079 (.out1(out_lut_expr_FU_26_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37079),
    .in1(out_const_6),
    .in2(out_reg_28_reg_28),
    .in3(out_lt_expr_FU_32_32_32_55_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37077),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37080 (.out1(out_read_cond_FU_28_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37080),
    .in1(out_lut_expr_FU_26_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37079));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37092 (.out1(out_read_cond_FU_34_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37092),
    .in1(out_reg_32_reg_32));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37094 (.out1(out_read_cond_FU_44_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37094),
    .in1(out_reg_19_reg_19));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37096 (.out1(out_read_cond_FU_46_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37096),
    .in1(out_lt_expr_FU_32_32_32_55_i4_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43003));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37098 (.out1(out_read_cond_FU_48_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37098),
    .in1(out_le_expr_FU_32_32_32_53_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43005));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_37100 (.out1(out_read_cond_FU_49_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37100),
    .in1(out_le_expr_FU_32_32_32_53_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43007));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_42981 (.out1(out_plus_expr_FU_32_32_32_60_i8_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42981),
    .in1(in_port_kernel_size),
    .in2(out_rshift_expr_FU_32_0_32_62_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45944));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_42993 (.out1(out_le_expr_FU_32_0_32_52_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42993),
    .in1(in_port_size),
    .in2(out_const_0));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_42995 (.out1(out_lt_expr_FU_32_32_32_55_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42995),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_2_reg_2));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_42999 (.out1(out_lt_expr_FU_32_32_32_55_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42999),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_25_reg_25));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_43001 (.out1(out_lt_expr_FU_32_32_32_55_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43001),
    .in1(out_reg_0_reg_0),
    .in2(out_plus_expr_FU_32_0_32_58_i4_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37066));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_43003 (.out1(out_lt_expr_FU_32_32_32_55_i4_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43003),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_10_reg_10));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_43005 (.out1(out_le_expr_FU_32_32_32_53_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43005),
    .in1(in_port_size),
    .in2(out_reg_9_reg_9));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_43007 (.out1(out_le_expr_FU_32_32_32_53_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43007),
    .in1(in_port_size),
    .in2(out_reg_4_reg_4));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45340 (.out1(out_UUdata_converter_FU_31_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45340),
    .in1(out_conv_out___float_mule8m23b_127nih_66_i0___float_mule8m23b_127nih_66_i0_64_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45343 (.out1(out_UUdata_converter_FU_29_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45343),
    .in1(out_BMEMORY_CTRLN_50_i0_BMEMORY_CTRLN_50_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45346 (.out1(out_UUdata_converter_FU_30_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45346),
    .in1(out_reg_31_reg_31));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45365 (.out1(out_UUdata_converter_FU_33_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45365),
    .in1(out_reg_23_reg_23));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45368 (.out1(out_UUdata_converter_FU_32_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45368),
    .in1(out_UUdata_converter_FU_31_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45340));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45371 (.out1(out_UUdata_converter_FU_23_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45371),
    .in1(out_reg_24_reg_24));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45390 (.out1(out_UUdata_converter_FU_40_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45390),
    .in1(out_conv_out___float_mule8m23b_127nih_66_i0___float_mule8m23b_127nih_66_i0_64_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45393 (.out1(out_UUdata_converter_FU_39_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45393),
    .in1(out_BMEMORY_CTRLN_50_i0_BMEMORY_CTRLN_50_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45415 (.out1(out_UUdata_converter_FU_43_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45415),
    .in1(out_reg_23_reg_23));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45418 (.out1(out_UUdata_converter_FU_41_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45418),
    .in1(out_UUdata_converter_FU_40_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45390));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45421 (.out1(out_UUdata_converter_FU_42_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45421),
    .in1(out_reg_11_reg_11));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45937 (.out1(out_UIdata_converter_FU_3_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45937),
    .in1(out_extract_bit_expr_FU_2_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_46430));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45941 (.out1(out_lshift_expr_FU_32_0_32_54_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45941),
    .in1(out_UIdata_converter_FU_3_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45937),
    .in2(out_const_3));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_45944 (.out1(out_rshift_expr_FU_32_0_32_62_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45944),
    .in1(out_lshift_expr_FU_32_0_32_54_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45941),
    .in2(out_const_3));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_46430 (.out1(out_extract_bit_expr_FU_2_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_46430),
    .in1(in_port_kernel_size),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_46433 (.out1(out_extract_bit_expr_FU_15_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_46433),
    .in1(out_plus_expr_FU_32_32_32_60_i5_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37034),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu__Z18matrix_convolutionPKfPfS1_ii_36525_46436 (.out1(out_extract_bit_expr_FU_21_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_46436),
    .in1(out_plus_expr_FU_32_32_32_60_i6_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37036),
    .in2(out_const_7));
  or or_or___float_adde8m23b_127nih_65_i00( s___float_adde8m23b_127nih_65_i00, selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962, selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042);
  or or_or___float_mule8m23b_127nih_66_i01( s___float_mule8m23b_127nih_66_i01, selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966, selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046);
  register_SE #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_rshift_expr_FU_32_0_32_61_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36892),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_59_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37076),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_113_reg_10_0_0_0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_114_reg_11_0_0_1),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_60_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36994),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_60_i5_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37034),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_15_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_46433),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_56_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36991),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_56_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37031),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_60_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36988),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_121_reg_18_0_0_0),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_lt_expr_FU_32_32_32_55_i3_fu__Z18matrix_convolutionPKfPfS1_ii_36525_43001),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_negate_expr_FU_32_32_57_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36907),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_42_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45421),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_39_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45393),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_41_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45418),
    .wenable(wrenable_reg_22));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_conv_out___float_adde8m23b_127nih_65_i0___float_adde8m23b_127nih_65_i0_64_32),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_128_reg_24_0_0_0),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_129_reg_25_0_0_0),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_63_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36978),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_60_i6_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37036),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_gt_expr_FU_32_32_32_51_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37078),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_23_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45371),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_134_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_63_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37021),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_136_reg_31_0_0_0),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_lt_expr_FU_32_32_32_55_i2_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42999),
    .wenable(wrenable_reg_32));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_30_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45346),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_29_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45343),
    .wenable(wrenable_reg_34));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_32_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_45368),
    .wenable(wrenable_reg_35));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_141_reg_36_0_0_1),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_58_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36920),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_56_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36915),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_144_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_lt_expr_FU_32_32_32_55_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_42995),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_63_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36938),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_58_i1_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36952),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893 = out_read_cond_FU_4_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_36893;
  assign OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070 = out_read_cond_FU_10_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37070;
  assign OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072 = out_read_cond_FU_16_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37072;
  assign OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074 = out_read_cond_FU_24_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37074;
  assign OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080 = out_read_cond_FU_28_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37080;
  assign OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092 = out_read_cond_FU_34_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37092;
  assign OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094 = out_read_cond_FU_44_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37094;
  assign OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096 = out_read_cond_FU_46_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37096;
  assign OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098 = out_read_cond_FU_48_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37098;
  assign OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100 = out_read_cond_FU_49_i0_fu__Z18matrix_convolutionPKfPfS1_ii_36525_37100;
  assign OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962 = s_done___float_adde8m23b_127nih_65_i0;
  assign OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966 = s_done___float_mule8m23b_127nih_66_i0;
  assign OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042 = s_done___float_adde8m23b_127nih_65_i0;
  assign OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046 = s_done___float_mule8m23b_127nih_66_i0;

endmodule

// FSM based controller description for _Z18matrix_convolutionPKfPfS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z18matrix_convolutionPKfPfS1_ii(done_port,
  fuselector_BMEMORY_CTRLN_50_i0_LOAD,
  fuselector_BMEMORY_CTRLN_50_i0_STORE,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046,
  selector_MUX_113_reg_10_0_0_0,
  selector_MUX_114_reg_11_0_0_0,
  selector_MUX_114_reg_11_0_0_1,
  selector_MUX_121_reg_18_0_0_0,
  selector_MUX_128_reg_24_0_0_0,
  selector_MUX_129_reg_25_0_0_0,
  selector_MUX_134_reg_3_0_0_0,
  selector_MUX_136_reg_31_0_0_0,
  selector_MUX_141_reg_36_0_0_0,
  selector_MUX_141_reg_36_0_0_1,
  selector_MUX_144_reg_6_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0,
  selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0,
  selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0,
  selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0,
  selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0,
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
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098,
  OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100,
  OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962,
  OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966,
  OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042,
  OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893;
  input OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070;
  input OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072;
  input OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074;
  input OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080;
  input OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092;
  input OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094;
  input OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096;
  input OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098;
  input OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100;
  input OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962;
  input OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966;
  input OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042;
  input OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_50_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_50_i0_STORE;
  output selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962;
  output selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966;
  output selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042;
  output selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046;
  output selector_MUX_113_reg_10_0_0_0;
  output selector_MUX_114_reg_11_0_0_0;
  output selector_MUX_114_reg_11_0_0_1;
  output selector_MUX_121_reg_18_0_0_0;
  output selector_MUX_128_reg_24_0_0_0;
  output selector_MUX_129_reg_25_0_0_0;
  output selector_MUX_134_reg_3_0_0_0;
  output selector_MUX_136_reg_31_0_0_0;
  output selector_MUX_141_reg_36_0_0_0;
  output selector_MUX_141_reg_36_0_0_1;
  output selector_MUX_144_reg_6_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0;
  output selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0;
  output selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0;
  output selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0;
  output selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0;
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
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [35:0] S_0 = 36'b000000000000000000000000000000000001,
    S_34 = 36'b010000000000000000000000000000000000,
    S_1 = 36'b000000000000000000000000000000000010,
    S_2 = 36'b000000000000000000000000000000000100,
    S_3 = 36'b000000000000000000000000000000001000,
    S_4 = 36'b000000000000000000000000000000010000,
    S_5 = 36'b000000000000000000000000000000100000,
    S_6 = 36'b000000000000000000000000000001000000,
    S_21 = 36'b000000000000001000000000000000000000,
    S_22 = 36'b000000000000010000000000000000000000,
    S_23 = 36'b000000000000100000000000000000000000,
    S_24 = 36'b000000000001000000000000000000000000,
    S_25 = 36'b000000000010000000000000000000000000,
    S_26 = 36'b000000000100000000000000000000000000,
    S_27 = 36'b000000001000000000000000000000000000,
    S_28 = 36'b000000010000000000000000000000000000,
    S_29 = 36'b000000100000000000000000000000000000,
    S_30 = 36'b000001000000000000000000000000000000,
    S_7 = 36'b000000000000000000000000000010000000,
    S_8 = 36'b000000000000000000000000000100000000,
    S_9 = 36'b000000000000000000000000001000000000,
    S_10 = 36'b000000000000000000000000010000000000,
    S_11 = 36'b000000000000000000000000100000000000,
    S_12 = 36'b000000000000000000000001000000000000,
    S_13 = 36'b000000000000000000000010000000000000,
    S_14 = 36'b000000000000000000000100000000000000,
    S_15 = 36'b000000000000000000001000000000000000,
    S_16 = 36'b000000000000000000010000000000000000,
    S_17 = 36'b000000000000000000100000000000000000,
    S_18 = 36'b000000000000000001000000000000000000,
    S_19 = 36'b000000000000000010000000000000000000,
    S_20 = 36'b000000000000000100000000000000000000,
    S_31 = 36'b000010000000000000000000000000000000,
    S_32 = 36'b000100000000000000000000000000000000,
    S_33 = 36'b001000000000000000000000000000000000,
    S_35 = 36'b100000000000000000000000000000000000;
  reg [35:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_50_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_50_i0_STORE;
  reg selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962;
  reg selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966;
  reg selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042;
  reg selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046;
  reg selector_MUX_113_reg_10_0_0_0;
  reg selector_MUX_114_reg_11_0_0_0;
  reg selector_MUX_114_reg_11_0_0_1;
  reg selector_MUX_121_reg_18_0_0_0;
  reg selector_MUX_128_reg_24_0_0_0;
  reg selector_MUX_129_reg_25_0_0_0;
  reg selector_MUX_134_reg_3_0_0_0;
  reg selector_MUX_136_reg_31_0_0_0;
  reg selector_MUX_141_reg_36_0_0_0;
  reg selector_MUX_141_reg_36_0_0_1;
  reg selector_MUX_144_reg_6_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0;
  reg selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0;
  reg selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0;
  reg selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0;
  reg selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0;
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
    fuselector_BMEMORY_CTRLN_50_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_50_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962 = 1'b0;
    selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966 = 1'b0;
    selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042 = 1'b0;
    selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046 = 1'b0;
    selector_MUX_113_reg_10_0_0_0 = 1'b0;
    selector_MUX_114_reg_11_0_0_0 = 1'b0;
    selector_MUX_114_reg_11_0_0_1 = 1'b0;
    selector_MUX_121_reg_18_0_0_0 = 1'b0;
    selector_MUX_128_reg_24_0_0_0 = 1'b0;
    selector_MUX_129_reg_25_0_0_0 = 1'b0;
    selector_MUX_134_reg_3_0_0_0 = 1'b0;
    selector_MUX_136_reg_31_0_0_0 = 1'b0;
    selector_MUX_141_reg_36_0_0_0 = 1'b0;
    selector_MUX_141_reg_36_0_0_1 = 1'b0;
    selector_MUX_144_reg_6_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0 = 1'b0;
    selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0 = 1'b0;
    selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0 = 1'b0;
    selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0 = 1'b0;
    selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0 = 1'b0;
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
          if (OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_34;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_34 :
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          selector_MUX_113_reg_10_0_0_0 = 1'b1;
          selector_MUX_114_reg_11_0_0_1 = 1'b1;
          selector_MUX_141_reg_36_0_0_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070 == 1'b1)
            begin
              _next_state = S_32;
              selector_MUX_113_reg_10_0_0_0 = 1'b0;
              selector_MUX_114_reg_11_0_0_1 = 1'b0;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_11 = 1'b0;
            end
          else
            begin
              _next_state = S_4;
              selector_MUX_141_reg_36_0_0_1 = 1'b0;
              wrenable_reg_36 = 1'b0;
            end
        end
      S_4 :
        begin
          wrenable_reg_10 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          selector_MUX_121_reg_18_0_0_0 = 1'b1;
          selector_MUX_128_reg_24_0_0_0 = 1'b1;
          selector_MUX_129_reg_25_0_0_0 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072 == 1'b0)
            begin
              _next_state = S_7;
              selector_MUX_121_reg_18_0_0_0 = 1'b0;
              wrenable_reg_18 = 1'b0;
            end
          else
            begin
              _next_state = S_21;
              selector_MUX_128_reg_24_0_0_0 = 1'b0;
              selector_MUX_129_reg_25_0_0_0 = 1'b0;
              wrenable_reg_24 = 1'b0;
              wrenable_reg_25 = 1'b0;
            end
        end
      S_21 :
        begin
          fuselector_BMEMORY_CTRLN_50_i0_LOAD = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          _next_state = S_22;
        end
      S_22 :
        begin
          wrenable_reg_21 = 1'b1;
          _next_state = S_23;
        end
      S_23 :
        begin
          selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046 = 1'b1;
          _next_state = S_24;
        end
      S_24 :
        begin
          _next_state = S_25;
        end
      S_25 :
        begin
          wrenable_reg_22 = 1'b1;
          _next_state = S_26;
        end
      S_26 :
        begin
          selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042 = 1'b1;
          _next_state = S_27;
        end
      S_27 :
        begin
          _next_state = S_28;
        end
      S_28 :
        begin
          _next_state = S_29;
        end
      S_29 :
        begin
          wrenable_reg_23 = 1'b1;
          _next_state = S_30;
        end
      S_30 :
        begin
          wrenable_reg_11 = 1'b1;
          wrenable_reg_36 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094 == 1'b1)
            begin
              _next_state = S_31;
              wrenable_reg_11 = 1'b0;
            end
          else
            begin
              _next_state = S_21;
              wrenable_reg_36 = 1'b0;
            end
        end
      S_7 :
        begin
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_31 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074 == 1'b1)
            begin
              _next_state = S_11;
              wrenable_reg_27 = 1'b0;
              wrenable_reg_28 = 1'b0;
            end
          else
            begin
              _next_state = S_8;
              wrenable_reg_31 = 1'b0;
            end
        end
      S_8 :
        begin
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080 == 1'b1)
            begin
              _next_state = S_11;
              wrenable_reg_30 = 1'b0;
            end
          else
            begin
              _next_state = S_9;
              wrenable_reg_31 = 1'b0;
            end
        end
      S_9 :
        begin
          fuselector_BMEMORY_CTRLN_50_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          selector_MUX_136_reg_31_0_0_0 = 1'b1;
          wrenable_reg_31 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          fuselector_BMEMORY_CTRLN_50_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          wrenable_reg_34 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966 = 1'b1;
          selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0 = 1'b1;
          selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0 = 1'b1;
          _next_state = S_14;
        end
      S_14 :
        begin
          selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0 = 1'b1;
          selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0 = 1'b1;
          selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0 = 1'b1;
          wrenable_reg_35 = 1'b1;
          _next_state = S_16;
        end
      S_16 :
        begin
          selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962 = 1'b1;
          selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0 = 1'b1;
          selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0 = 1'b1;
          _next_state = S_17;
        end
      S_17 :
        begin
          selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0 = 1'b1;
          selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0 = 1'b1;
          _next_state = S_18;
        end
      S_18 :
        begin
          selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0 = 1'b1;
          selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0 = 1'b1;
          _next_state = S_19;
        end
      S_19 :
        begin
          selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0 = 1'b1;
          selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0 = 1'b1;
          wrenable_reg_23 = 1'b1;
          _next_state = S_20;
        end
      S_20 :
        begin
          selector_MUX_141_reg_36_0_0_0 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_36 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092 == 1'b1)
            begin
              _next_state = S_31;
              wrenable_reg_24 = 1'b0;
            end
          else
            begin
              _next_state = S_7;
              selector_MUX_141_reg_36_0_0_0 = 1'b0;
              wrenable_reg_36 = 1'b0;
            end
        end
      S_31 :
        begin
          selector_MUX_114_reg_11_0_0_0 = 1'b1;
          wrenable_reg_11 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096 == 1'b1)
            begin
              _next_state = S_32;
              selector_MUX_114_reg_11_0_0_0 = 1'b0;
              wrenable_reg_11 = 1'b0;
            end
          else
            begin
              _next_state = S_4;
            end
        end
      S_32 :
        begin
          fuselector_BMEMORY_CTRLN_50_i0_STORE = 1'b1;
          selector_MUX_144_reg_6_0_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098 == 1'b1)
            begin
              _next_state = S_33;
              selector_MUX_144_reg_6_0_0_0 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_33 :
        begin
          selector_MUX_134_reg_3_0_0_0 = 1'b1;
          wrenable_reg_3 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_35;
              done_port = 1'b1;
              selector_MUX_134_reg_3_0_0_0 = 1'b0;
              wrenable_reg_3 = 1'b0;
            end
        end
      S_35 :
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

// Top component for _Z18matrix_convolutionPKfPfS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __Z18matrix_convolutionPKfPfS1_ii(clock,
  reset,
  start_port,
  done_port,
  A,
  kernel,
  B,
  size,
  kernel_size,
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
  input [31:0] kernel;
  input [31:0] B;
  input signed [31:0] size;
  input signed [31:0] kernel_size;
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
  wire OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893;
  wire OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070;
  wire OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072;
  wire OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074;
  wire OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080;
  wire OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092;
  wire OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094;
  wire OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096;
  wire OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098;
  wire OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100;
  wire OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962;
  wire OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966;
  wire OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042;
  wire OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_50_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_50_i0_STORE;
  wire selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962;
  wire selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966;
  wire selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042;
  wire selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046;
  wire selector_MUX_113_reg_10_0_0_0;
  wire selector_MUX_114_reg_11_0_0_0;
  wire selector_MUX_114_reg_11_0_0_1;
  wire selector_MUX_121_reg_18_0_0_0;
  wire selector_MUX_128_reg_24_0_0_0;
  wire selector_MUX_129_reg_25_0_0_0;
  wire selector_MUX_134_reg_3_0_0_0;
  wire selector_MUX_136_reg_31_0_0_0;
  wire selector_MUX_141_reg_36_0_0_0;
  wire selector_MUX_141_reg_36_0_0_1;
  wire selector_MUX_144_reg_6_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0;
  wire selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0;
  wire selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0;
  wire selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0;
  wire selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0;
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
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller__Z18matrix_convolutionPKfPfS1_ii Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_50_i0_LOAD(fuselector_BMEMORY_CTRLN_50_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_50_i0_STORE(fuselector_BMEMORY_CTRLN_50_i0_STORE),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962(selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966(selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042(selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046(selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046),
    .selector_MUX_113_reg_10_0_0_0(selector_MUX_113_reg_10_0_0_0),
    .selector_MUX_114_reg_11_0_0_0(selector_MUX_114_reg_11_0_0_0),
    .selector_MUX_114_reg_11_0_0_1(selector_MUX_114_reg_11_0_0_1),
    .selector_MUX_121_reg_18_0_0_0(selector_MUX_121_reg_18_0_0_0),
    .selector_MUX_128_reg_24_0_0_0(selector_MUX_128_reg_24_0_0_0),
    .selector_MUX_129_reg_25_0_0_0(selector_MUX_129_reg_25_0_0_0),
    .selector_MUX_134_reg_3_0_0_0(selector_MUX_134_reg_3_0_0_0),
    .selector_MUX_136_reg_31_0_0_0(selector_MUX_136_reg_31_0_0_0),
    .selector_MUX_141_reg_36_0_0_0(selector_MUX_141_reg_36_0_0_0),
    .selector_MUX_141_reg_36_0_0_1(selector_MUX_141_reg_36_0_0_1),
    .selector_MUX_144_reg_6_0_0_0(selector_MUX_144_reg_6_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0),
    .selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0(selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0),
    .selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0(selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0),
    .selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0(selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0),
    .selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0(selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0),
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
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962(OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966(OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042(OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046(OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z18matrix_convolutionPKfPfS1_ii Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_36893),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37070),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37072),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37074),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37080),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37092),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37094),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37096),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37098),
    .OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100(OUT_CONDITION__Z18matrix_convolutionPKfPfS1_ii_36525_37100),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962(OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966(OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042(OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046(OUT_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046),
    .clock(clock),
    .reset(reset),
    .in_port_A(A),
    .in_port_kernel(kernel),
    .in_port_B(B),
    .in_port_size(size),
    .in_port_kernel_size(kernel_size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_50_i0_LOAD(fuselector_BMEMORY_CTRLN_50_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_50_i0_STORE(fuselector_BMEMORY_CTRLN_50_i0_STORE),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962(selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36962),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966(selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_36966),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042(selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37042),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046(selector_IN_UNBOUNDED__Z18matrix_convolutionPKfPfS1_ii_36525_37046),
    .selector_MUX_113_reg_10_0_0_0(selector_MUX_113_reg_10_0_0_0),
    .selector_MUX_114_reg_11_0_0_0(selector_MUX_114_reg_11_0_0_0),
    .selector_MUX_114_reg_11_0_0_1(selector_MUX_114_reg_11_0_0_1),
    .selector_MUX_121_reg_18_0_0_0(selector_MUX_121_reg_18_0_0_0),
    .selector_MUX_128_reg_24_0_0_0(selector_MUX_128_reg_24_0_0_0),
    .selector_MUX_129_reg_25_0_0_0(selector_MUX_129_reg_25_0_0_0),
    .selector_MUX_134_reg_3_0_0_0(selector_MUX_134_reg_3_0_0_0),
    .selector_MUX_136_reg_31_0_0_0(selector_MUX_136_reg_31_0_0_0),
    .selector_MUX_141_reg_36_0_0_0(selector_MUX_141_reg_36_0_0_0),
    .selector_MUX_141_reg_36_0_0_1(selector_MUX_141_reg_36_0_0_1),
    .selector_MUX_144_reg_6_0_0_0(selector_MUX_144_reg_6_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_50_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_50_i0_1_1_0),
    .selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0(selector_MUX_30___float_adde8m23b_127nih_65_i0_0_0_0),
    .selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0(selector_MUX_31___float_adde8m23b_127nih_65_i0_1_0_0),
    .selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0(selector_MUX_32___float_mule8m23b_127nih_66_i0_0_0_0),
    .selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0(selector_MUX_33___float_mule8m23b_127nih_66_i0_1_0_0),
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

// Minimal interface for function: _Z18matrix_convolutionPKfPfS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _Z18matrix_convolutionPKfPfS1_ii(clock,
  reset,
  start_port,
  A,
  kernel,
  B,
  size,
  kernel_size,
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
  input [31:0] kernel;
  input [31:0] B;
  input [31:0] size;
  input [31:0] kernel_size;
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
  
  __Z18matrix_convolutionPKfPfS1_ii __Z18matrix_convolutionPKfPfS1_ii_i0 (.done_port(done_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .A(A),
    .kernel(kernel),
    .B(B),
    .size(size),
    .kernel_size(kernel_size),
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


