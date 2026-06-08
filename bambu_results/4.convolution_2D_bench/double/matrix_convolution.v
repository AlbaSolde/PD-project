// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-04-17T10:47:30
// Bambu executed with: bambu --top-fname=matrix_convolution -DDOUBLE cpu_functions.cpp 
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
  wire [5:0] out_ASSIGN_UNSIGNED_FU_110_i0_fu___float_adde11m52b_1023nih_44097_47442;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_44097_47440;
  wire [0:0] out_IUdata_converter_FU_105_i0_fu___float_adde11m52b_1023nih_44097_44832;
  wire [0:0] out_IUdata_converter_FU_106_i0_fu___float_adde11m52b_1023nih_44097_44853;
  wire [0:0] out_IUdata_converter_FU_107_i0_fu___float_adde11m52b_1023nih_44097_44873;
  wire [0:0] out_IUdata_converter_FU_108_i0_fu___float_adde11m52b_1023nih_44097_44893;
  wire [0:0] out_IUdata_converter_FU_109_i0_fu___float_adde11m52b_1023nih_44097_44916;
  wire [55:0] out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_44097_44256;
  wire [5:0] out_IUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_44097_44537;
  wire [63:0] out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_44097_44188;
  wire signed [1:0] out_UIdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_44097_44528;
  wire signed [1:0] out_UIdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_44097_46376;
  wire signed [1:0] out_UIdata_converter_FU_26_i0_fu___float_adde11m52b_1023nih_44097_46386;
  wire signed [1:0] out_UIdata_converter_FU_2_i0_fu___float_adde11m52b_1023nih_44097_44179;
  wire signed [1:0] out_UIdata_converter_FU_69_i0_fu___float_adde11m52b_1023nih_44097_46395;
  wire signed [1:0] out_UIdata_converter_FU_88_i0_fu___float_adde11m52b_1023nih_44097_46404;
  wire signed [1:0] out_UIdata_converter_FU_92_i0_fu___float_adde11m52b_1023nih_44097_46413;
  wire signed [1:0] out_UIdata_converter_FU_9_i0_fu___float_adde11m52b_1023nih_44097_44247;
  wire out_UUdata_converter_FU_104_i0_fu___float_adde11m52b_1023nih_44097_46422;
  wire out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_44097_44347;
  wire out_UUdata_converter_FU_123_i0_fu___float_adde11m52b_1023nih_44097_45131;
  wire out_UUdata_converter_FU_12_i0_fu___float_adde11m52b_1023nih_44097_44361;
  wire out_UUdata_converter_FU_134_i0_fu___float_adde11m52b_1023nih_44097_47438;
  wire out_UUdata_converter_FU_136_i0_fu___float_adde11m52b_1023nih_44097_47432;
  wire [5:0] out_UUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_44097_44540;
  wire [5:0] out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_44097_44549;
  wire out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_44097_44654;
  wire signed [6:0] out_bit_and_expr_FU_0_8_8_138_i0_fu___float_adde11m52b_1023nih_44097_44775;
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
  wire signed [31:0] out_lshift_expr_FU_32_0_32_139_i0_fu___float_adde11m52b_1023nih_44097_44531;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i0_fu___float_adde11m52b_1023nih_44097_46380;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i1_fu___float_adde11m52b_1023nih_44097_46389;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i2_fu___float_adde11m52b_1023nih_44097_46398;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i3_fu___float_adde11m52b_1023nih_44097_46407;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_140_i4_fu___float_adde11m52b_1023nih_44097_46416;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_141_i0_fu___float_adde11m52b_1023nih_44097_44182;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_141_i1_fu___float_adde11m52b_1023nih_44097_44250;
  wire out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_44097_50049;
  wire out_lut_expr_FU_101_i0_fu___float_adde11m52b_1023nih_44097_50052;
  wire out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_44097_50055;
  wire out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_44097_45558;
  wire out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_44097_50061;
  wire out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_44097_50065;
  wire out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_44097_45006;
  wire out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_44097_50070;
  wire out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_44097_50073;
  wire out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_44097_50076;
  wire out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_44097_50079;
  wire out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_44097_50082;
  wire out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_44097_50085;
  wire out_lut_expr_FU_120_i0_fu___float_adde11m52b_1023nih_44097_50088;
  wire out_lut_expr_FU_121_i0_fu___float_adde11m52b_1023nih_44097_50091;
  wire out_lut_expr_FU_122_i0_fu___float_adde11m52b_1023nih_44097_47588;
  wire out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_44097_50097;
  wire out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_44097_50101;
  wire out_lut_expr_FU_126_i0_fu___float_adde11m52b_1023nih_44097_46246;
  wire out_lut_expr_FU_127_i0_fu___float_adde11m52b_1023nih_44097_50105;
  wire out_lut_expr_FU_128_i0_fu___float_adde11m52b_1023nih_44097_46268;
  wire out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_44097_46327;
  wire out_lut_expr_FU_130_i0_fu___float_adde11m52b_1023nih_44097_47674;
  wire out_lut_expr_FU_131_i0_fu___float_adde11m52b_1023nih_44097_46343;
  wire out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_44097_46450;
  wire out_lut_expr_FU_133_i0_fu___float_adde11m52b_1023nih_44097_47663;
  wire out_lut_expr_FU_135_i0_fu___float_adde11m52b_1023nih_44097_47670;
  wire out_lut_expr_FU_18_i0_fu___float_adde11m52b_1023nih_44097_44525;
  wire out_lut_expr_FU_23_i0_fu___float_adde11m52b_1023nih_44097_44613;
  wire out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_44097_49996;
  wire out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_44097_49999;
  wire out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_44097_50002;
  wire out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_44097_50005;
  wire out_lut_expr_FU_63_i0_fu___float_adde11m52b_1023nih_44097_50009;
  wire out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_44097_50012;
  wire out_lut_expr_FU_65_i0_fu___float_adde11m52b_1023nih_44097_50015;
  wire out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_44097_50018;
  wire out_lut_expr_FU_67_i0_fu___float_adde11m52b_1023nih_44097_50021;
  wire out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496;
  wire out_lut_expr_FU_82_i0_fu___float_adde11m52b_1023nih_44097_50026;
  wire out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_44097_50029;
  wire out_lut_expr_FU_84_i0_fu___float_adde11m52b_1023nih_44097_50032;
  wire out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_44097_50035;
  wire out_lut_expr_FU_86_i0_fu___float_adde11m52b_1023nih_44097_50039;
  wire out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500;
  wire out_lut_expr_FU_8_i0_fu___float_adde11m52b_1023nih_44097_44244;
  wire out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_44097_45504;
  wire out_lut_expr_FU_99_i0_fu___float_adde11m52b_1023nih_44097_50045;
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
  wire signed [0:0] out_rshift_expr_FU_32_0_32_142_i0_fu___float_adde11m52b_1023nih_44097_44534;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i0_fu___float_adde11m52b_1023nih_44097_46383;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i1_fu___float_adde11m52b_1023nih_44097_46392;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i2_fu___float_adde11m52b_1023nih_44097_46401;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i3_fu___float_adde11m52b_1023nih_44097_46410;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_143_i4_fu___float_adde11m52b_1023nih_44097_46419;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_144_i0_fu___float_adde11m52b_1023nih_44097_44185;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_144_i1_fu___float_adde11m52b_1023nih_44097_44253;
  wire [54:0] out_ui_bit_and_expr_FU_0_64_64_145_i0_fu___float_adde11m52b_1023nih_44097_44629;
  wire [55:0] out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_44097_44662;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44097_44225;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_44097_44276;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i2_fu___float_adde11m52b_1023nih_44097_45079;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_44097_45161;
  wire [15:0] out_ui_bit_and_expr_FU_16_0_16_148_i0_fu___float_adde11m52b_1023nih_44097_44697;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_149_i0_fu___float_adde11m52b_1023nih_44097_44673;
  wire [62:0] out_ui_bit_and_expr_FU_64_0_64_150_i0_fu___float_adde11m52b_1023nih_44097_44160;
  wire [62:0] out_ui_bit_and_expr_FU_64_0_64_150_i1_fu___float_adde11m52b_1023nih_44097_44167;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_44097_44213;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_44097_44270;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i2_fu___float_adde11m52b_1023nih_44097_45092;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_44097_45166;
  wire [55:0] out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_44097_44648;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_44097_44194;
  wire [52:0] out_ui_bit_and_expr_FU_64_64_64_153_i1_fu___float_adde11m52b_1023nih_44097_44600;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_154_i0_fu___float_adde11m52b_1023nih_44097_44377;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_155_i0_fu___float_adde11m52b_1023nih_44097_44546;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_156_i0_fu___float_adde11m52b_1023nih_44097_46057;
  wire [55:0] out_ui_bit_ior_concat_expr_FU_157_i0_fu___float_adde11m52b_1023nih_44097_44651;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_158_i0_fu___float_adde11m52b_1023nih_44097_44353;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_159_i0_fu___float_adde11m52b_1023nih_44097_44367;
  wire [62:0] out_ui_bit_ior_expr_FU_0_64_64_160_i0_fu___float_adde11m52b_1023nih_44097_45097;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_161_i0_fu___float_adde11m52b_1023nih_44097_45295;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_162_i0_fu___float_adde11m52b_1023nih_44097_45298;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu___float_adde11m52b_1023nih_44097_44859;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu___float_adde11m52b_1023nih_44097_44899;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu___float_adde11m52b_1023nih_44097_44902;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde11m52b_1023nih_44097_44922;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_44097_44925;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_168_i0_fu___float_adde11m52b_1023nih_44097_45267;
  wire [5:0] out_ui_bit_ior_expr_FU_8_8_8_169_i0_fu___float_adde11m52b_1023nih_44097_44543;
  wire [54:0] out_ui_bit_not_expr_FU_64_64_170_i0_fu___float_adde11m52b_1023nih_44097_44597;
  wire [63:0] out_ui_bit_xor_expr_FU_64_64_64_171_i0_fu___float_adde11m52b_1023nih_44097_44191;
  wire [62:0] out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_44097_44197;
  wire [62:0] out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_44097_44202;
  wire [55:0] out_ui_bit_xor_expr_FU_64_64_64_171_i3_fu___float_adde11m52b_1023nih_44097_44634;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i0_fu___float_adde11m52b_1023nih_44097_46276;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i1_fu___float_adde11m52b_1023nih_44097_46330;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i2_fu___float_adde11m52b_1023nih_44097_46338;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_44097_46356;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i4_fu___float_adde11m52b_1023nih_44097_46452;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_172_i5_fu___float_adde11m52b_1023nih_44097_47434;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i0_fu___float_adde11m52b_1023nih_44097_46280;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i10_fu___float_adde11m52b_1023nih_44097_47436;
  wire [54:0] out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_44097_46294;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_44097_46298;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_44097_46308;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_44097_46316;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_44097_46322;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i6_fu___float_adde11m52b_1023nih_44097_46340;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i7_fu___float_adde11m52b_1023nih_44097_46349;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_44097_46358;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_173_i9_fu___float_adde11m52b_1023nih_44097_46454;
  wire out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44097_45143;
  wire out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44097_45148;
  wire out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492;
  wire out_ui_eq_expr_FU_16_0_16_177_i0_fu___float_adde11m52b_1023nih_44097_45528;
  wire out_ui_eq_expr_FU_32_0_32_178_i0_fu___float_adde11m52b_1023nih_44097_45488;
  wire out_ui_eq_expr_FU_64_0_64_179_i0_fu___float_adde11m52b_1023nih_44097_44610;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_adde11m52b_1023nih_44097_47917;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_adde11m52b_1023nih_44097_47921;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_adde11m52b_1023nih_44097_47925;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_44097_47929;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_44097_47933;
  wire out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_44097_49279;
  wire out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_44097_48933;
  wire out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_44097_48937;
  wire out_ui_extract_bit_expr_FU_30_i0_fu___float_adde11m52b_1023nih_44097_48614;
  wire out_ui_extract_bit_expr_FU_31_i0_fu___float_adde11m52b_1023nih_44097_49283;
  wire out_ui_extract_bit_expr_FU_32_i0_fu___float_adde11m52b_1023nih_44097_48945;
  wire out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_44097_48949;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_44097_48630;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_44097_49287;
  wire out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_44097_48957;
  wire out_ui_extract_bit_expr_FU_37_i0_fu___float_adde11m52b_1023nih_44097_48961;
  wire out_ui_extract_bit_expr_FU_38_i0_fu___float_adde11m52b_1023nih_44097_48646;
  wire out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_44097_49291;
  wire out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_44097_48969;
  wire out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_44097_48973;
  wire out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_44097_48662;
  wire out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_44097_49295;
  wire out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_44097_48981;
  wire out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_44097_48985;
  wire out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_44097_48678;
  wire out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_44097_49299;
  wire out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_44097_48993;
  wire out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_44097_48997;
  wire out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_44097_48694;
  wire out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_44097_49303;
  wire out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_44097_49005;
  wire out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_44097_49009;
  wire out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_44097_48710;
  wire out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_44097_49307;
  wire out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_44097_49017;
  wire out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_44097_49021;
  wire out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_44097_48726;
  wire out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44097_47903;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_44097_47906;
  wire out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_44097_49580;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_adde11m52b_1023nih_44097_49584;
  wire out_ui_extract_bit_expr_FU_72_i0_fu___float_adde11m52b_1023nih_44097_49322;
  wire out_ui_extract_bit_expr_FU_73_i0_fu___float_adde11m52b_1023nih_44097_49592;
  wire out_ui_extract_bit_expr_FU_74_i0_fu___float_adde11m52b_1023nih_44097_49596;
  wire out_ui_extract_bit_expr_FU_75_i0_fu___float_adde11m52b_1023nih_44097_49349;
  wire out_ui_extract_bit_expr_FU_76_i0_fu___float_adde11m52b_1023nih_44097_49604;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_adde11m52b_1023nih_44097_49608;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_adde11m52b_1023nih_44097_49376;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_adde11m52b_1023nih_44097_49616;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_44097_47910;
  wire out_ui_extract_bit_expr_FU_80_i0_fu___float_adde11m52b_1023nih_44097_49620;
  wire out_ui_extract_bit_expr_FU_81_i0_fu___float_adde11m52b_1023nih_44097_49404;
  wire out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44097_47770;
  wire out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44097_47774;
  wire out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_44097_49980;
  wire out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_44097_49984;
  wire out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_44097_49936;
  wire out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_44097_49964;
  wire out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_44097_49968;
  wire out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_44097_49866;
  wire out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_44097_44931;
  wire [54:0] out_ui_lshift_expr_FU_0_64_64_181_i0_fu___float_adde11m52b_1023nih_44097_44594;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_182_i0_fu___float_adde11m52b_1023nih_44097_44350;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_182_i1_fu___float_adde11m52b_1023nih_44097_44364;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_182_i2_fu___float_adde11m52b_1023nih_44097_45076;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_182_i3_fu___float_adde11m52b_1023nih_44097_45292;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_183_i0_fu___float_adde11m52b_1023nih_44097_44356;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_44097_44370;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_184_i0_fu___float_adde11m52b_1023nih_44097_44685;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_185_i0_fu___float_adde11m52b_1023nih_44097_44709;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_186_i0_fu___float_adde11m52b_1023nih_44097_44735;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_187_i0_fu___float_adde11m52b_1023nih_44097_44763;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_188_i0_fu___float_adde11m52b_1023nih_44097_44791;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_189_i0_fu___float_adde11m52b_1023nih_44097_44798;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_190_i0_fu___float_adde11m52b_1023nih_44097_45264;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_191_i0_fu___float_adde11m52b_1023nih_44097_46033;
  wire [55:0] out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde11m52b_1023nih_44097_46053;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_192_i1_fu___float_adde11m52b_1023nih_44097_48838;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_193_i0_fu___float_adde11m52b_1023nih_44097_46425;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_193_i1_fu___float_adde11m52b_1023nih_44097_47452;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_194_i0_fu___float_adde11m52b_1023nih_44097_46436;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_195_i0_fu___float_adde11m52b_1023nih_44097_49186;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde11m52b_1023nih_44097_44835;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_197_i0_fu___float_adde11m52b_1023nih_44097_44856;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_198_i0_fu___float_adde11m52b_1023nih_44097_44876;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_199_i0_fu___float_adde11m52b_1023nih_44097_44896;
  wire [5:0] out_ui_lshift_expr_FU_8_0_8_200_i0_fu___float_adde11m52b_1023nih_44097_44919;
  wire out_ui_lt_expr_FU_64_64_64_201_i0_fu___float_adde11m52b_1023nih_44097_44174;
  wire [10:0] out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44097_44314;
  wire out_ui_ne_expr_FU_16_0_16_203_i0_fu___float_adde11m52b_1023nih_44097_44300;
  wire out_ui_ne_expr_FU_16_0_16_203_i1_fu___float_adde11m52b_1023nih_44097_44308;
  wire out_ui_ne_expr_FU_64_0_64_204_i0_fu___float_adde11m52b_1023nih_44097_44284;
  wire out_ui_ne_expr_FU_64_0_64_204_i1_fu___float_adde11m52b_1023nih_44097_44289;
  wire out_ui_ne_expr_FU_64_0_64_205_i0_fu___float_adde11m52b_1023nih_44097_44605;
  wire [55:0] out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657;
  wire [62:0] out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_44097_45134;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_206_i2_fu___float_adde11m52b_1023nih_44097_46050;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_207_i0_fu___float_adde11m52b_1023nih_44097_44216;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_207_i1_fu___float_adde11m52b_1023nih_44097_44273;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_207_i2_fu___float_adde11m52b_1023nih_44097_45158;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_208_i0_fu___float_adde11m52b_1023nih_44097_44670;
  wire [15:0] out_ui_rshift_expr_FU_64_0_64_209_i0_fu___float_adde11m52b_1023nih_44097_44694;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde11m52b_1023nih_44097_45089;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_211_i0_fu___float_adde11m52b_1023nih_44097_46025;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_44097_46036;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i0_fu___float_adde11m52b_1023nih_44097_46029;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i1_fu___float_adde11m52b_1023nih_44097_46044;
  wire [53:0] out_ui_rshift_expr_FU_64_0_64_212_i2_fu___float_adde11m52b_1023nih_44097_46047;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i3_fu___float_adde11m52b_1023nih_44097_48831;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_212_i4_fu___float_adde11m52b_1023nih_44097_48834;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_213_i0_fu___float_adde11m52b_1023nih_44097_46428;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_214_i0_fu___float_adde11m52b_1023nih_44097_46432;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_215_i0_fu___float_adde11m52b_1023nih_44097_49179;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_215_i1_fu___float_adde11m52b_1023nih_44097_49182;
  wire [54:0] out_ui_rshift_expr_FU_64_64_64_216_i0_fu___float_adde11m52b_1023nih_44097_44552;
  wire [1:0] out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_44097_44778;
  wire [10:0] out_ui_ternary_pm_expr_FU_16_0_16_16_217_i0_fu___float_adde11m52b_1023nih_44097_45082;
  
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
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44097_44160 (.out1(out_ui_bit_and_expr_FU_64_0_64_150_i0_fu___float_adde11m52b_1023nih_44097_44160),
    .in1(in_port_a),
    .in2(out_const_97));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44097_44167 (.out1(out_ui_bit_and_expr_FU_64_0_64_150_i1_fu___float_adde11m52b_1023nih_44097_44167),
    .in1(in_port_b),
    .in2(out_const_97));
  ui_lt_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(63),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44174 (.out1(out_ui_lt_expr_FU_64_64_64_201_i0_fu___float_adde11m52b_1023nih_44097_44174),
    .in1(out_ui_bit_and_expr_FU_64_0_64_150_i0_fu___float_adde11m52b_1023nih_44097_44160),
    .in2(out_ui_bit_and_expr_FU_64_0_64_150_i1_fu___float_adde11m52b_1023nih_44097_44167));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44097_44179 (.out1(out_UIdata_converter_FU_2_i0_fu___float_adde11m52b_1023nih_44097_44179),
    .in1(out_ui_lt_expr_FU_64_64_64_201_i0_fu___float_adde11m52b_1023nih_44097_44174));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44182 (.out1(out_lshift_expr_FU_64_0_64_141_i0_fu___float_adde11m52b_1023nih_44097_44182),
    .in1(out_UIdata_converter_FU_2_i0_fu___float_adde11m52b_1023nih_44097_44179),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44185 (.out1(out_rshift_expr_FU_64_0_64_144_i0_fu___float_adde11m52b_1023nih_44097_44185),
    .in1(out_lshift_expr_FU_64_0_64_141_i0_fu___float_adde11m52b_1023nih_44097_44182),
    .in2(out_const_16));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44097_44188 (.out1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_44097_44188),
    .in1(out_rshift_expr_FU_64_0_64_144_i0_fu___float_adde11m52b_1023nih_44097_44185));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44097_44191 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i0_fu___float_adde11m52b_1023nih_44097_44191),
    .in1(in_port_a),
    .in2(in_port_b));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44097_44194 (.out1(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_44097_44194),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i0_fu___float_adde11m52b_1023nih_44097_44191),
    .in2(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_44097_44188));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44097_44197 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_44097_44197),
    .in1(in_port_a),
    .in2(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_44097_44194));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44097_44202 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_44097_44202),
    .in1(in_port_b),
    .in2(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_44097_44194));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_44213 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_44097_44213),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_44097_44197),
    .in2(out_const_94));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44216 (.out1(out_ui_rshift_expr_FU_64_0_64_207_i0_fu___float_adde11m52b_1023nih_44097_44216),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i1_fu___float_adde11m52b_1023nih_44097_44197),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_44225 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44097_44225),
    .in1(out_ui_rshift_expr_FU_64_0_64_207_i0_fu___float_adde11m52b_1023nih_44097_44216),
    .in2(out_const_89));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44244 (.out1(out_lut_expr_FU_8_i0_fu___float_adde11m52b_1023nih_44097_44244),
    .in1(out_const_56),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44097_47903),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_44097_47910),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44097_44247 (.out1(out_UIdata_converter_FU_9_i0_fu___float_adde11m52b_1023nih_44097_44247),
    .in1(out_lut_expr_FU_8_i0_fu___float_adde11m52b_1023nih_44097_44244));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44250 (.out1(out_lshift_expr_FU_64_0_64_141_i1_fu___float_adde11m52b_1023nih_44097_44250),
    .in1(out_UIdata_converter_FU_9_i0_fu___float_adde11m52b_1023nih_44097_44247),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44253 (.out1(out_rshift_expr_FU_64_0_64_144_i1_fu___float_adde11m52b_1023nih_44097_44253),
    .in1(out_lshift_expr_FU_64_0_64_141_i1_fu___float_adde11m52b_1023nih_44097_44250),
    .in2(out_const_16));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_44097_44256 (.out1(out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_44097_44256),
    .in1(out_rshift_expr_FU_64_0_64_144_i1_fu___float_adde11m52b_1023nih_44097_44253));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_44270 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_44097_44270),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_44097_44202),
    .in2(out_const_94));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44273 (.out1(out_ui_rshift_expr_FU_64_0_64_207_i1_fu___float_adde11m52b_1023nih_44097_44273),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i2_fu___float_adde11m52b_1023nih_44097_44202),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_44276 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_44097_44276),
    .in1(out_ui_rshift_expr_FU_64_0_64_207_i1_fu___float_adde11m52b_1023nih_44097_44273),
    .in2(out_const_89));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44284 (.out1(out_ui_ne_expr_FU_64_0_64_204_i0_fu___float_adde11m52b_1023nih_44097_44284),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_44097_44213),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44289 (.out1(out_ui_ne_expr_FU_64_0_64_204_i1_fu___float_adde11m52b_1023nih_44097_44289),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_44097_44270),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44300 (.out1(out_ui_ne_expr_FU_16_0_16_203_i0_fu___float_adde11m52b_1023nih_44097_44300),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44097_44225),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44308 (.out1(out_ui_ne_expr_FU_16_0_16_203_i1_fu___float_adde11m52b_1023nih_44097_44308),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_44097_44276),
    .in2(out_const_0));
  ui_minus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_44314 (.out1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44097_44314),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44097_44225),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_44097_44276));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44347 (.out1(out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_44097_44347),
    .in1(out_ui_ne_expr_FU_16_0_16_203_i0_fu___float_adde11m52b_1023nih_44097_44300));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44350 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i0_fu___float_adde11m52b_1023nih_44097_44350),
    .in1(out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_44097_44347),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_44097_44353 (.out1(out_ui_bit_ior_expr_FU_0_64_64_158_i0_fu___float_adde11m52b_1023nih_44097_44353),
    .in1(out_ui_lshift_expr_FU_64_0_64_182_i0_fu___float_adde11m52b_1023nih_44097_44350),
    .in2(out_ui_bit_and_expr_FU_64_0_64_151_i0_fu___float_adde11m52b_1023nih_44097_44213));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44356 (.out1(out_ui_lshift_expr_FU_64_0_64_183_i0_fu___float_adde11m52b_1023nih_44097_44356),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_158_i0_fu___float_adde11m52b_1023nih_44097_44353),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44361 (.out1(out_UUdata_converter_FU_12_i0_fu___float_adde11m52b_1023nih_44097_44361),
    .in1(out_ui_ne_expr_FU_16_0_16_203_i1_fu___float_adde11m52b_1023nih_44097_44308));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44364 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i1_fu___float_adde11m52b_1023nih_44097_44364),
    .in1(out_UUdata_converter_FU_12_i0_fu___float_adde11m52b_1023nih_44097_44361),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_44097_44367 (.out1(out_ui_bit_ior_expr_FU_0_64_64_159_i0_fu___float_adde11m52b_1023nih_44097_44367),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i1_fu___float_adde11m52b_1023nih_44097_44270),
    .in2(out_ui_lshift_expr_FU_64_0_64_182_i1_fu___float_adde11m52b_1023nih_44097_44364));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44370 (.out1(out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_44097_44370),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_159_i0_fu___float_adde11m52b_1023nih_44097_44367),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44097_44377 (.out1(out_ui_bit_and_expr_FU_8_0_8_154_i0_fu___float_adde11m52b_1023nih_44097_44377),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44097_44314),
    .in2(out_const_89));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44525 (.out1(out_lut_expr_FU_18_i0_fu___float_adde11m52b_1023nih_44097_44525),
    .in1(out_const_92),
    .in2(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde11m52b_1023nih_44097_47917),
    .in3(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde11m52b_1023nih_44097_47921),
    .in4(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde11m52b_1023nih_44097_47925),
    .in5(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_44097_47929),
    .in6(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_44097_47933),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44097_44528 (.out1(out_UIdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_44097_44528),
    .in1(out_lut_expr_FU_18_i0_fu___float_adde11m52b_1023nih_44097_44525));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_44531 (.out1(out_lshift_expr_FU_32_0_32_139_i0_fu___float_adde11m52b_1023nih_44097_44531),
    .in1(out_UIdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_44097_44528),
    .in2(out_const_15));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_44534 (.out1(out_rshift_expr_FU_32_0_32_142_i0_fu___float_adde11m52b_1023nih_44097_44534),
    .in1(out_lshift_expr_FU_32_0_32_139_i0_fu___float_adde11m52b_1023nih_44097_44531),
    .in2(out_const_15));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44097_44537 (.out1(out_IUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_44097_44537),
    .in1(out_rshift_expr_FU_32_0_32_142_i0_fu___float_adde11m52b_1023nih_44097_44534));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44097_44540 (.out1(out_UUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_44097_44540),
    .in1(out_IUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_44097_44537));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44097_44543 (.out1(out_ui_bit_ior_expr_FU_8_8_8_169_i0_fu___float_adde11m52b_1023nih_44097_44543),
    .in1(out_ui_bit_and_expr_FU_8_0_8_154_i0_fu___float_adde11m52b_1023nih_44097_44377),
    .in2(out_UUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_44097_44540));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44097_44546 (.out1(out_ui_bit_and_expr_FU_8_0_8_155_i0_fu___float_adde11m52b_1023nih_44097_44546),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_169_i0_fu___float_adde11m52b_1023nih_44097_44543),
    .in2(out_const_85));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44097_44549 (.out1(out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_44097_44549),
    .in1(out_ui_bit_and_expr_FU_8_0_8_155_i0_fu___float_adde11m52b_1023nih_44097_44546));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(6),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44552 (.out1(out_ui_rshift_expr_FU_64_64_64_216_i0_fu___float_adde11m52b_1023nih_44097_44552),
    .in1(out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_44097_44370),
    .in2(out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_44097_44549));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44594 (.out1(out_ui_lshift_expr_FU_0_64_64_181_i0_fu___float_adde11m52b_1023nih_44097_44594),
    .in1(out_const_98),
    .in2(out_UUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_44097_44549));
  ui_bit_not_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_44097_44597 (.out1(out_ui_bit_not_expr_FU_64_64_170_i0_fu___float_adde11m52b_1023nih_44097_44597),
    .in1(out_ui_lshift_expr_FU_0_64_64_181_i0_fu___float_adde11m52b_1023nih_44097_44594));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_44097_44600 (.out1(out_ui_bit_and_expr_FU_64_64_64_153_i1_fu___float_adde11m52b_1023nih_44097_44600),
    .in1(out_ui_rshift_expr_FU_64_0_64_211_i0_fu___float_adde11m52b_1023nih_44097_46025),
    .in2(out_ui_rshift_expr_FU_64_0_64_212_i0_fu___float_adde11m52b_1023nih_44097_46029));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44605 (.out1(out_ui_ne_expr_FU_64_0_64_205_i0_fu___float_adde11m52b_1023nih_44097_44605),
    .in1(out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_44097_46036),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44610 (.out1(out_ui_eq_expr_FU_64_0_64_179_i0_fu___float_adde11m52b_1023nih_44097_44610),
    .in1(out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_44097_46036),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44613 (.out1(out_lut_expr_FU_23_i0_fu___float_adde11m52b_1023nih_44097_44613),
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
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_44097_44629 (.out1(out_ui_bit_and_expr_FU_0_64_64_145_i0_fu___float_adde11m52b_1023nih_44097_44629),
    .in1(out_const_95),
    .in2(out_ui_rshift_expr_FU_64_64_64_216_i0_fu___float_adde11m52b_1023nih_44097_44552));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_44097_44634 (.out1(out_ui_bit_xor_expr_FU_64_64_64_171_i3_fu___float_adde11m52b_1023nih_44097_44634),
    .in1(out_reg_4_reg_4),
    .in2(out_reg_1_reg_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_44097_44648 (.out1(out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_44097_44648),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_171_i3_fu___float_adde11m52b_1023nih_44097_44634),
    .in2(out_const_96));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(56),
    .OFFSET_PARAMETER(2)) fu___float_adde11m52b_1023nih_44097_44651 (.out1(out_ui_bit_ior_concat_expr_FU_157_i0_fu___float_adde11m52b_1023nih_44097_44651),
    .in1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde11m52b_1023nih_44097_46053),
    .in2(out_ui_bit_and_expr_FU_8_0_8_156_i0_fu___float_adde11m52b_1023nih_44097_46057),
    .in3(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44654 (.out1(out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_44097_44654),
    .in1(out_lut_expr_FU_23_i0_fu___float_adde11m52b_1023nih_44097_44613));
  ui_plus_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_44097_44657 (.out1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in1(out_ui_bit_ior_concat_expr_FU_157_i0_fu___float_adde11m52b_1023nih_44097_44651),
    .in2(out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_44097_44654));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_44097_44662 (.out1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_44097_44662),
    .in1(out_const_96),
    .in2(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44670 (.out1(out_ui_rshift_expr_FU_64_0_64_208_i0_fu___float_adde11m52b_1023nih_44097_44670),
    .in1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_44097_44662),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde11m52b_1023nih_44097_44673 (.out1(out_ui_bit_and_expr_FU_32_0_32_149_i0_fu___float_adde11m52b_1023nih_44097_44673),
    .in1(out_ui_rshift_expr_FU_64_0_64_208_i0_fu___float_adde11m52b_1023nih_44097_44670),
    .in2(out_const_93));
  ui_lshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44685 (.out1(out_ui_lshift_expr_FU_64_0_64_184_i0_fu___float_adde11m52b_1023nih_44097_44685),
    .in1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_44097_44662),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44694 (.out1(out_ui_rshift_expr_FU_64_0_64_209_i0_fu___float_adde11m52b_1023nih_44097_44694),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_44097_46322),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu___float_adde11m52b_1023nih_44097_44697 (.out1(out_ui_bit_and_expr_FU_16_0_16_148_i0_fu___float_adde11m52b_1023nih_44097_44697),
    .in1(out_ui_rshift_expr_FU_64_0_64_209_i0_fu___float_adde11m52b_1023nih_44097_44694),
    .in2(out_const_90));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44709 (.out1(out_ui_lshift_expr_FU_64_0_64_185_i0_fu___float_adde11m52b_1023nih_44097_44709),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_44097_46322),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44735 (.out1(out_ui_lshift_expr_FU_64_0_64_186_i0_fu___float_adde11m52b_1023nih_44097_44735),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_44097_46316),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44763 (.out1(out_ui_lshift_expr_FU_64_0_64_187_i0_fu___float_adde11m52b_1023nih_44097_44763),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_44097_46308),
    .in2(out_const_3));
  bit_and_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_in2(7),
    .BITSIZE_out1(7)) fu___float_adde11m52b_1023nih_44097_44775 (.out1(out_bit_and_expr_FU_0_8_8_138_i0_fu___float_adde11m52b_1023nih_44097_44775),
    .in1(out_const_13),
    .in2(out_const_16));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44778 (.out1(out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_44097_44778),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_44097_46298),
    .in2(out_reg_5_reg_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44791 (.out1(out_ui_lshift_expr_FU_64_0_64_188_i0_fu___float_adde11m52b_1023nih_44097_44791),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_44097_46294),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44798 (.out1(out_ui_lshift_expr_FU_64_0_64_189_i0_fu___float_adde11m52b_1023nih_44097_44798),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_44097_46298),
    .in2(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44832 (.out1(out_IUdata_converter_FU_105_i0_fu___float_adde11m52b_1023nih_44097_44832),
    .in1(out_rshift_expr_FU_32_0_32_143_i4_fu___float_adde11m52b_1023nih_44097_46419));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44835 (.out1(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde11m52b_1023nih_44097_44835),
    .in1(out_IUdata_converter_FU_105_i0_fu___float_adde11m52b_1023nih_44097_44832),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44853 (.out1(out_IUdata_converter_FU_106_i0_fu___float_adde11m52b_1023nih_44097_44853),
    .in1(out_rshift_expr_FU_32_0_32_143_i3_fu___float_adde11m52b_1023nih_44097_46410));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44856 (.out1(out_ui_lshift_expr_FU_8_0_8_197_i0_fu___float_adde11m52b_1023nih_44097_44856),
    .in1(out_IUdata_converter_FU_106_i0_fu___float_adde11m52b_1023nih_44097_44853),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___float_adde11m52b_1023nih_44097_44859 (.out1(out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu___float_adde11m52b_1023nih_44097_44859),
    .in1(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde11m52b_1023nih_44097_44835),
    .in2(out_ui_lshift_expr_FU_8_0_8_197_i0_fu___float_adde11m52b_1023nih_44097_44856));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44873 (.out1(out_IUdata_converter_FU_107_i0_fu___float_adde11m52b_1023nih_44097_44873),
    .in1(out_rshift_expr_FU_32_0_32_143_i2_fu___float_adde11m52b_1023nih_44097_46401));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44876 (.out1(out_ui_lshift_expr_FU_8_0_8_198_i0_fu___float_adde11m52b_1023nih_44097_44876),
    .in1(out_IUdata_converter_FU_107_i0_fu___float_adde11m52b_1023nih_44097_44873),
    .in2(out_const_9));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44893 (.out1(out_IUdata_converter_FU_108_i0_fu___float_adde11m52b_1023nih_44097_44893),
    .in1(out_rshift_expr_FU_32_0_32_143_i1_fu___float_adde11m52b_1023nih_44097_46392));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44896 (.out1(out_ui_lshift_expr_FU_8_0_8_199_i0_fu___float_adde11m52b_1023nih_44097_44896),
    .in1(out_IUdata_converter_FU_108_i0_fu___float_adde11m52b_1023nih_44097_44893),
    .in2(out_const_3));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde11m52b_1023nih_44097_44899 (.out1(out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu___float_adde11m52b_1023nih_44097_44899),
    .in1(out_ui_lshift_expr_FU_8_0_8_198_i0_fu___float_adde11m52b_1023nih_44097_44876),
    .in2(out_ui_lshift_expr_FU_8_0_8_199_i0_fu___float_adde11m52b_1023nih_44097_44896));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde11m52b_1023nih_44097_44902 (.out1(out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu___float_adde11m52b_1023nih_44097_44902),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu___float_adde11m52b_1023nih_44097_44859),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu___float_adde11m52b_1023nih_44097_44899));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44916 (.out1(out_IUdata_converter_FU_109_i0_fu___float_adde11m52b_1023nih_44097_44916),
    .in1(out_rshift_expr_FU_32_0_32_143_i0_fu___float_adde11m52b_1023nih_44097_46383));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(6),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_44919 (.out1(out_ui_lshift_expr_FU_8_0_8_200_i0_fu___float_adde11m52b_1023nih_44097_44919),
    .in1(out_IUdata_converter_FU_109_i0_fu___float_adde11m52b_1023nih_44097_44916),
    .in2(out_const_7));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(5),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44097_44922 (.out1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde11m52b_1023nih_44097_44922),
    .in1(out_ui_lshift_expr_FU_8_0_8_200_i0_fu___float_adde11m52b_1023nih_44097_44919),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu___float_adde11m52b_1023nih_44097_44902));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(1),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44097_44925 (.out1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_44097_44925),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde11m52b_1023nih_44097_44922),
    .in2(out_ui_rshift_expr_FU_64_0_64_213_i0_fu___float_adde11m52b_1023nih_44097_46428));
  ui_gt_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_44931 (.out1(out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_44097_44931),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_44097_44925),
    .in2(out_reg_0_reg_0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45006 (.out1(out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_44097_45006),
    .in1(out_const_53),
    .in2(out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_44097_44931),
    .in3(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_44097_50061),
    .in4(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_44097_50065),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_45076 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i2_fu___float_adde11m52b_1023nih_44097_45076),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i2_fu___float_adde11m52b_1023nih_44097_45079),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_45079 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i2_fu___float_adde11m52b_1023nih_44097_45079),
    .in1(out_ui_ternary_pm_expr_FU_16_0_16_16_217_i0_fu___float_adde11m52b_1023nih_44097_45082),
    .in2(out_const_89));
  ui_ternary_pm_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_in3(6),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_45082 (.out1(out_ui_ternary_pm_expr_FU_16_0_16_16_217_i0_fu___float_adde11m52b_1023nih_44097_45082),
    .in1(out_reg_13_reg_13),
    .in2(out_const_17),
    .in3(out_ASSIGN_UNSIGNED_FU_110_i0_fu___float_adde11m52b_1023nih_44097_47442));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(3),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_45089 (.out1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde11m52b_1023nih_44097_45089),
    .in1(out_ui_lshift_expr_FU_64_0_64_192_i1_fu___float_adde11m52b_1023nih_44097_48838),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_45092 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i2_fu___float_adde11m52b_1023nih_44097_45092),
    .in1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde11m52b_1023nih_44097_45089),
    .in2(out_const_94));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44097_45097 (.out1(out_ui_bit_ior_expr_FU_0_64_64_160_i0_fu___float_adde11m52b_1023nih_44097_45097),
    .in1(out_reg_72_reg_72),
    .in2(out_ui_lshift_expr_FU_64_0_64_194_i0_fu___float_adde11m52b_1023nih_44097_46436));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45131 (.out1(out_UUdata_converter_FU_123_i0_fu___float_adde11m52b_1023nih_44097_45131),
    .in1(out_lut_expr_FU_122_i0_fu___float_adde11m52b_1023nih_44097_47588));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_44097_45134 (.out1(out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_44097_45134),
    .in1(out_reg_73_reg_73),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_160_i0_fu___float_adde11m52b_1023nih_44097_45097));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45143 (.out1(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44097_45143),
    .in1(out_const_89),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44097_44225));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45148 (.out1(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44097_45148),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i1_fu___float_adde11m52b_1023nih_44097_44276),
    .in2(out_const_89));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_45158 (.out1(out_ui_rshift_expr_FU_64_0_64_207_i2_fu___float_adde11m52b_1023nih_44097_45158),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_44097_45134),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_45161 (.out1(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_44097_45161),
    .in1(out_ui_rshift_expr_FU_64_0_64_207_i2_fu___float_adde11m52b_1023nih_44097_45158),
    .in2(out_const_89));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_45166 (.out1(out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_44097_45166),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i1_fu___float_adde11m52b_1023nih_44097_45134),
    .in2(out_const_94));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_45264 (.out1(out_ui_lshift_expr_FU_64_0_64_190_i0_fu___float_adde11m52b_1023nih_44097_45264),
    .in1(out_UUdata_converter_FU_136_i0_fu___float_adde11m52b_1023nih_44097_47432),
    .in2(out_const_11));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_45267 (.out1(out_ui_bit_ior_expr_FU_64_64_64_168_i0_fu___float_adde11m52b_1023nih_44097_45267),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i10_fu___float_adde11m52b_1023nih_44097_47436));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_45292 (.out1(out_ui_lshift_expr_FU_64_0_64_182_i3_fu___float_adde11m52b_1023nih_44097_45292),
    .in1(out_ui_cond_expr_FU_16_16_16_16_172_i5_fu___float_adde11m52b_1023nih_44097_47434),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44097_45295 (.out1(out_ui_bit_ior_expr_FU_0_64_64_161_i0_fu___float_adde11m52b_1023nih_44097_45295),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_168_i0_fu___float_adde11m52b_1023nih_44097_45267),
    .in2(out_reg_74_reg_74));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44097_45298 (.out1(out_ui_bit_ior_expr_FU_0_64_64_162_i0_fu___float_adde11m52b_1023nih_44097_45298),
    .in1(out_ui_lshift_expr_FU_64_0_64_182_i3_fu___float_adde11m52b_1023nih_44097_45292),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_161_i0_fu___float_adde11m52b_1023nih_44097_45295));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45488 (.out1(out_ui_eq_expr_FU_32_0_32_178_i0_fu___float_adde11m52b_1023nih_44097_45488),
    .in1(out_ui_bit_and_expr_FU_32_0_32_149_i0_fu___float_adde11m52b_1023nih_44097_44673),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45492 (.out1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in1(out_ui_bit_and_expr_FU_16_0_16_148_i0_fu___float_adde11m52b_1023nih_44097_44697),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45496 (.out1(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in1(out_const_23),
    .in2(out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_44097_49996),
    .in3(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_44097_49999),
    .in4(out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_44097_50002),
    .in5(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_44097_50005),
    .in6(out_lut_expr_FU_67_i0_fu___float_adde11m52b_1023nih_44097_50021),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(57),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45500 (.out1(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500),
    .in1(out_const_26),
    .in2(out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_44097_49996),
    .in3(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_44097_49999),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in5(out_lut_expr_FU_82_i0_fu___float_adde11m52b_1023nih_44097_50026),
    .in6(out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_44097_50029),
    .in7(out_lut_expr_FU_86_i0_fu___float_adde11m52b_1023nih_44097_50039),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45504 (.out1(out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_44097_45504),
    .in1(out_const_17),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44097_47770),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44097_47774),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45528 (.out1(out_ui_eq_expr_FU_16_0_16_177_i0_fu___float_adde11m52b_1023nih_44097_45528),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44097_44225),
    .in2(out_const_88));
  lut_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_45558 (.out1(out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_44097_45558),
    .in1(out_const_82),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44097_47770),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44097_47774),
    .in4(out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_44097_50049),
    .in5(out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_44097_50055),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46025 (.out1(out_ui_rshift_expr_FU_64_0_64_211_i0_fu___float_adde11m52b_1023nih_44097_46025),
    .in1(out_ui_lshift_expr_FU_64_0_64_183_i1_fu___float_adde11m52b_1023nih_44097_44370),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46029 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i0_fu___float_adde11m52b_1023nih_44097_46029),
    .in1(out_ui_bit_not_expr_FU_64_64_170_i0_fu___float_adde11m52b_1023nih_44097_44597),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46033 (.out1(out_ui_lshift_expr_FU_64_0_64_191_i0_fu___float_adde11m52b_1023nih_44097_46033),
    .in1(out_ui_bit_and_expr_FU_64_64_64_153_i1_fu___float_adde11m52b_1023nih_44097_44600),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46036 (.out1(out_ui_rshift_expr_FU_64_0_64_211_i1_fu___float_adde11m52b_1023nih_44097_46036),
    .in1(out_ui_lshift_expr_FU_64_0_64_191_i0_fu___float_adde11m52b_1023nih_44097_46033),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46044 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i1_fu___float_adde11m52b_1023nih_44097_46044),
    .in1(out_ui_lshift_expr_FU_64_0_64_183_i0_fu___float_adde11m52b_1023nih_44097_44356),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46047 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i2_fu___float_adde11m52b_1023nih_44097_46047),
    .in1(out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_44097_44648),
    .in2(out_const_18));
  ui_plus_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(54),
    .BITSIZE_out1(54)) fu___float_adde11m52b_1023nih_44097_46050 (.out1(out_ui_plus_expr_FU_64_64_64_206_i2_fu___float_adde11m52b_1023nih_44097_46050),
    .in1(out_reg_10_reg_10),
    .in2(out_ui_rshift_expr_FU_64_0_64_212_i2_fu___float_adde11m52b_1023nih_44097_46047));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(56),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46053 (.out1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde11m52b_1023nih_44097_46053),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i2_fu___float_adde11m52b_1023nih_44097_46050),
    .in2(out_const_18));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44097_46057 (.out1(out_ui_bit_and_expr_FU_8_0_8_156_i0_fu___float_adde11m52b_1023nih_44097_46057),
    .in1(out_ui_bit_and_expr_FU_64_0_64_152_i0_fu___float_adde11m52b_1023nih_44097_44648),
    .in2(out_const_55));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_46246 (.out1(out_lut_expr_FU_126_i0_fu___float_adde11m52b_1023nih_44097_46246),
    .in1(out_const_56),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_6_reg_6),
    .in5(out_reg_7_reg_7),
    .in6(out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_44097_50101),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_46268 (.out1(out_lut_expr_FU_128_i0_fu___float_adde11m52b_1023nih_44097_46268),
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
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_46276 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i0_fu___float_adde11m52b_1023nih_44097_46276),
    .in1(out_reg_71_reg_71),
    .in2(out_const_0),
    .in3(out_reg_76_reg_76));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_46280 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i0_fu___float_adde11m52b_1023nih_44097_46280),
    .in1(out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_44097_45558),
    .in2(out_ui_rshift_expr_FU_64_0_64_215_i0_fu___float_adde11m52b_1023nih_44097_49179),
    .in3(out_ui_rshift_expr_FU_64_0_64_215_i1_fu___float_adde11m52b_1023nih_44097_49182));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(55),
    .BITSIZE_in3(64),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_44097_46294 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_44097_46294),
    .in1(out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_44097_45504),
    .in2(out_ui_lshift_expr_FU_64_0_64_189_i0_fu___float_adde11m52b_1023nih_44097_44798),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_44097_46298));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44097_46298 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i2_fu___float_adde11m52b_1023nih_44097_46298),
    .in1(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500),
    .in2(out_ui_lshift_expr_FU_64_0_64_187_i0_fu___float_adde11m52b_1023nih_44097_44763),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_44097_46308));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44097_46308 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i3_fu___float_adde11m52b_1023nih_44097_46308),
    .in1(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in2(out_ui_lshift_expr_FU_64_0_64_186_i0_fu___float_adde11m52b_1023nih_44097_44735),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_44097_46316));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44097_46316 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i4_fu___float_adde11m52b_1023nih_44097_46316),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in2(out_ui_lshift_expr_FU_64_0_64_185_i0_fu___float_adde11m52b_1023nih_44097_44709),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_44097_46322));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(56),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_44097_46322 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i5_fu___float_adde11m52b_1023nih_44097_46322),
    .in1(out_reg_20_reg_20),
    .in2(out_reg_19_reg_19),
    .in3(out_reg_18_reg_18));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_46327 (.out1(out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_44097_46327),
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
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_46330 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i1_fu___float_adde11m52b_1023nih_44097_46330),
    .in1(out_reg_75_reg_75),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_44097_45161),
    .in3(out_const_89));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_46338 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i2_fu___float_adde11m52b_1023nih_44097_46338),
    .in1(out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_44097_46327),
    .in2(out_ui_cond_expr_FU_16_16_16_16_172_i1_fu___float_adde11m52b_1023nih_44097_46330),
    .in3(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_44097_45161));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_46340 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i6_fu___float_adde11m52b_1023nih_44097_46340),
    .in1(out_lut_expr_FU_129_i0_fu___float_adde11m52b_1023nih_44097_46327),
    .in2(out_const_0),
    .in3(out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_44097_45166));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_46343 (.out1(out_lut_expr_FU_131_i0_fu___float_adde11m52b_1023nih_44097_46343),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44097_47903),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_44097_47906),
    .in4(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44097_45143),
    .in5(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44097_45148),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(1),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_46349 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i7_fu___float_adde11m52b_1023nih_44097_46349),
    .in1(out_lut_expr_FU_128_i0_fu___float_adde11m52b_1023nih_44097_46268),
    .in2(out_ui_bit_and_expr_FU_64_0_64_151_i3_fu___float_adde11m52b_1023nih_44097_45166),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_46356 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_44097_46356),
    .in1(out_reg_14_reg_14),
    .in2(out_ui_cond_expr_FU_16_16_16_16_172_i2_fu___float_adde11m52b_1023nih_44097_46338),
    .in3(out_const_89));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(1),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_46358 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_44097_46358),
    .in1(out_reg_14_reg_14),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i6_fu___float_adde11m52b_1023nih_44097_46340),
    .in3(out_const_0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44097_46376 (.out1(out_UIdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_44097_46376),
    .in1(out_reg_20_reg_20));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_46380 (.out1(out_lshift_expr_FU_32_0_32_140_i0_fu___float_adde11m52b_1023nih_44097_46380),
    .in1(out_UIdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_44097_46376),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_46383 (.out1(out_rshift_expr_FU_32_0_32_143_i0_fu___float_adde11m52b_1023nih_44097_46383),
    .in1(out_lshift_expr_FU_32_0_32_140_i0_fu___float_adde11m52b_1023nih_44097_46380),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44097_46386 (.out1(out_UIdata_converter_FU_26_i0_fu___float_adde11m52b_1023nih_44097_46386),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_46389 (.out1(out_lshift_expr_FU_32_0_32_140_i1_fu___float_adde11m52b_1023nih_44097_46389),
    .in1(out_UIdata_converter_FU_26_i0_fu___float_adde11m52b_1023nih_44097_46386),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_46392 (.out1(out_rshift_expr_FU_32_0_32_143_i1_fu___float_adde11m52b_1023nih_44097_46392),
    .in1(out_lshift_expr_FU_32_0_32_140_i1_fu___float_adde11m52b_1023nih_44097_46389),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44097_46395 (.out1(out_UIdata_converter_FU_69_i0_fu___float_adde11m52b_1023nih_44097_46395),
    .in1(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_46398 (.out1(out_lshift_expr_FU_32_0_32_140_i2_fu___float_adde11m52b_1023nih_44097_46398),
    .in1(out_UIdata_converter_FU_69_i0_fu___float_adde11m52b_1023nih_44097_46395),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_46401 (.out1(out_rshift_expr_FU_32_0_32_143_i2_fu___float_adde11m52b_1023nih_44097_46401),
    .in1(out_lshift_expr_FU_32_0_32_140_i2_fu___float_adde11m52b_1023nih_44097_46398),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44097_46404 (.out1(out_UIdata_converter_FU_88_i0_fu___float_adde11m52b_1023nih_44097_46404),
    .in1(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_46407 (.out1(out_lshift_expr_FU_32_0_32_140_i3_fu___float_adde11m52b_1023nih_44097_46407),
    .in1(out_UIdata_converter_FU_88_i0_fu___float_adde11m52b_1023nih_44097_46404),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_46410 (.out1(out_rshift_expr_FU_32_0_32_143_i3_fu___float_adde11m52b_1023nih_44097_46410),
    .in1(out_lshift_expr_FU_32_0_32_140_i3_fu___float_adde11m52b_1023nih_44097_46407),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_44097_46413 (.out1(out_UIdata_converter_FU_92_i0_fu___float_adde11m52b_1023nih_44097_46413),
    .in1(out_lut_expr_FU_91_i0_fu___float_adde11m52b_1023nih_44097_45504));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_46416 (.out1(out_lshift_expr_FU_32_0_32_140_i4_fu___float_adde11m52b_1023nih_44097_46416),
    .in1(out_UIdata_converter_FU_92_i0_fu___float_adde11m52b_1023nih_44097_46413),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_44097_46419 (.out1(out_rshift_expr_FU_32_0_32_143_i4_fu___float_adde11m52b_1023nih_44097_46419),
    .in1(out_lshift_expr_FU_32_0_32_140_i4_fu___float_adde11m52b_1023nih_44097_46416),
    .in2(out_const_14));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_46422 (.out1(out_UUdata_converter_FU_104_i0_fu___float_adde11m52b_1023nih_44097_46422),
    .in1(out_lut_expr_FU_103_i0_fu___float_adde11m52b_1023nih_44097_45558));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46425 (.out1(out_ui_lshift_expr_FU_64_0_64_193_i0_fu___float_adde11m52b_1023nih_44097_46425),
    .in1(out_UUdata_converter_FU_104_i0_fu___float_adde11m52b_1023nih_44097_46422),
    .in2(out_const_85));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46428 (.out1(out_ui_rshift_expr_FU_64_0_64_213_i0_fu___float_adde11m52b_1023nih_44097_46428),
    .in1(out_ui_lshift_expr_FU_64_0_64_193_i0_fu___float_adde11m52b_1023nih_44097_46425),
    .in2(out_const_85));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(6),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46432 (.out1(out_ui_rshift_expr_FU_64_0_64_214_i0_fu___float_adde11m52b_1023nih_44097_46432),
    .in1(out_ui_lshift_expr_FU_64_0_64_182_i2_fu___float_adde11m52b_1023nih_44097_45076),
    .in2(out_const_66));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(6),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_46436 (.out1(out_ui_lshift_expr_FU_64_0_64_194_i0_fu___float_adde11m52b_1023nih_44097_46436),
    .in1(out_ui_cond_expr_FU_16_16_16_16_172_i0_fu___float_adde11m52b_1023nih_44097_46276),
    .in2(out_const_66));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_46450 (.out1(out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_44097_46450),
    .in1(out_const_78),
    .in2(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44097_45143),
    .in3(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44097_45148),
    .in4(out_ui_ne_expr_FU_64_0_64_204_i1_fu___float_adde11m52b_1023nih_44097_44289),
    .in5(out_ui_ne_expr_FU_64_0_64_204_i0_fu___float_adde11m52b_1023nih_44097_44284),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_46452 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i4_fu___float_adde11m52b_1023nih_44097_46452),
    .in1(out_reg_11_reg_11),
    .in2(out_ui_bit_and_expr_FU_16_0_16_147_i3_fu___float_adde11m52b_1023nih_44097_45161),
    .in3(out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_44097_46356));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_46454 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i9_fu___float_adde11m52b_1023nih_44097_46454),
    .in1(out_reg_11_reg_11),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i7_fu___float_adde11m52b_1023nih_44097_46349),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_44097_46358));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_47432 (.out1(out_UUdata_converter_FU_136_i0_fu___float_adde11m52b_1023nih_44097_47432),
    .in1(out_lut_expr_FU_135_i0_fu___float_adde11m52b_1023nih_44097_47670));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_47434 (.out1(out_ui_cond_expr_FU_16_16_16_16_172_i5_fu___float_adde11m52b_1023nih_44097_47434),
    .in1(out_reg_12_reg_12),
    .in2(out_ui_cond_expr_FU_16_16_16_16_172_i3_fu___float_adde11m52b_1023nih_44097_46356),
    .in3(out_ui_cond_expr_FU_16_16_16_16_172_i4_fu___float_adde11m52b_1023nih_44097_46452));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_44097_47436 (.out1(out_ui_cond_expr_FU_64_64_64_64_173_i10_fu___float_adde11m52b_1023nih_44097_47436),
    .in1(out_reg_12_reg_12),
    .in2(out_ui_cond_expr_FU_64_64_64_64_173_i8_fu___float_adde11m52b_1023nih_44097_46358),
    .in3(out_ui_cond_expr_FU_64_64_64_64_173_i9_fu___float_adde11m52b_1023nih_44097_46454));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_47438 (.out1(out_UUdata_converter_FU_134_i0_fu___float_adde11m52b_1023nih_44097_47438),
    .in1(out_lut_expr_FU_133_i0_fu___float_adde11m52b_1023nih_44097_47663));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_44097_47440 (.out1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_44097_47440),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44097_44225));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_44097_47442 (.out1(out_ASSIGN_UNSIGNED_FU_110_i0_fu___float_adde11m52b_1023nih_44097_47442),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde11m52b_1023nih_44097_44925));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_47452 (.out1(out_ui_lshift_expr_FU_64_0_64_193_i1_fu___float_adde11m52b_1023nih_44097_47452),
    .in1(out_UUdata_converter_FU_134_i0_fu___float_adde11m52b_1023nih_44097_47438),
    .in2(out_const_85));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_47588 (.out1(out_lut_expr_FU_122_i0_fu___float_adde11m52b_1023nih_44097_47588),
    .in1(out_const_81),
    .in2(out_reg_2_reg_2),
    .in3(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_44097_50061),
    .in4(out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_44097_50076),
    .in5(out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_44097_50082),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_44097_50085),
    .in7(out_lut_expr_FU_121_i0_fu___float_adde11m52b_1023nih_44097_50091),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_47663 (.out1(out_lut_expr_FU_133_i0_fu___float_adde11m52b_1023nih_44097_47663),
    .in1(out_const_64),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_17_reg_17),
    .in5(out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_44097_50097),
    .in6(out_reg_11_reg_11),
    .in7(out_reg_12_reg_12),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_47670 (.out1(out_lut_expr_FU_135_i0_fu___float_adde11m52b_1023nih_44097_47670),
    .in1(out_const_91),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44097_47903),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_44097_47910),
    .in4(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44097_45143),
    .in5(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44097_45148),
    .in6(out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_44097_46450),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_47674 (.out1(out_lut_expr_FU_130_i0_fu___float_adde11m52b_1023nih_44097_47674),
    .in1(out_const_56),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44097_47903),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_44097_47906),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_44097_47770 (.out1(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44097_47770),
    .in1(out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_44097_44778),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_44097_47774 (.out1(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44097_47774),
    .in1(out_ui_rshift_expr_FU_64_64_64_216_i1_fu___float_adde11m52b_1023nih_44097_44778),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_47903 (.out1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44097_47903),
    .in1(in_port_a),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_47906 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_44097_47906),
    .in1(out_ui_bit_and_expr_FU_64_64_64_153_i0_fu___float_adde11m52b_1023nih_44097_44194),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_47910 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_44097_47910),
    .in1(in_port_b),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44097_47917 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde11m52b_1023nih_44097_47917),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44097_44314),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44097_47921 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde11m52b_1023nih_44097_47921),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44097_44314),
    .in2(out_const_71));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44097_47925 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde11m52b_1023nih_44097_47925),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44097_44314),
    .in2(out_const_20));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44097_47929 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_44097_47929),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44097_44314),
    .in2(out_const_32));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44097_47933 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_44097_47933),
    .in1(out_ui_minus_expr_FU_16_16_16_202_i0_fu___float_adde11m52b_1023nih_44097_44314),
    .in2(out_const_41));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48614 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu___float_adde11m52b_1023nih_44097_48614),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_58));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48630 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_44097_48630),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_60));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48646 (.out1(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde11m52b_1023nih_44097_48646),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_62));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48662 (.out1(out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_44097_48662),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48678 (.out1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_44097_48678),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_66));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48694 (.out1(out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_44097_48694),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_67));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48710 (.out1(out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_44097_48710),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48726 (.out1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_44097_48726),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_70));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_48831 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i3_fu___float_adde11m52b_1023nih_44097_48831),
    .in1(out_ui_lshift_expr_FU_64_0_64_188_i0_fu___float_adde11m52b_1023nih_44097_44791),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_48834 (.out1(out_ui_rshift_expr_FU_64_0_64_212_i4_fu___float_adde11m52b_1023nih_44097_48834),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i1_fu___float_adde11m52b_1023nih_44097_46294),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_48838 (.out1(out_ui_lshift_expr_FU_64_0_64_192_i1_fu___float_adde11m52b_1023nih_44097_48838),
    .in1(out_ui_lshift_expr_FU_64_0_64_195_i0_fu___float_adde11m52b_1023nih_44097_49186),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48933 (.out1(out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_44097_48933),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_48937 (.out1(out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_44097_48937),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48945 (.out1(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde11m52b_1023nih_44097_48945),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_27));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_48949 (.out1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_44097_48949),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_28));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48957 (.out1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_44097_48957),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_29));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_48961 (.out1(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde11m52b_1023nih_44097_48961),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48969 (.out1(out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_44097_48969),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_48973 (.out1(out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_44097_48973),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_37));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48981 (.out1(out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_44097_48981),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_48985 (.out1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_44097_48985),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_48993 (.out1(out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_44097_48993),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_48997 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_44097_48997),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_49005 (.out1(out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_44097_49005),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_49009 (.out1(out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_44097_49009),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_48));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_49017 (.out1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_44097_49017),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_39));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_49021 (.out1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_44097_49021),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_51));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_49179 (.out1(out_ui_rshift_expr_FU_64_0_64_215_i0_fu___float_adde11m52b_1023nih_44097_49179),
    .in1(out_ui_rshift_expr_FU_64_0_64_212_i3_fu___float_adde11m52b_1023nih_44097_48831),
    .in2(out_const_17));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_49182 (.out1(out_ui_rshift_expr_FU_64_0_64_215_i1_fu___float_adde11m52b_1023nih_44097_49182),
    .in1(out_ui_rshift_expr_FU_64_0_64_212_i4_fu___float_adde11m52b_1023nih_44097_48834),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_44097_49186 (.out1(out_ui_lshift_expr_FU_64_0_64_195_i0_fu___float_adde11m52b_1023nih_44097_49186),
    .in1(out_ui_cond_expr_FU_64_64_64_64_173_i0_fu___float_adde11m52b_1023nih_44097_46280),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_44097_49279 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_44097_49279),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_44097_49283 (.out1(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde11m52b_1023nih_44097_49283),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_44097_49287 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_44097_49287),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_44097_49291 (.out1(out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_44097_49291),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_55));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44097_49295 (.out1(out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_44097_49295),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44097_49299 (.out1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_44097_49299),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_40));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44097_49303 (.out1(out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_44097_49303),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_44097_49307 (.out1(out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_44097_49307),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_71));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_49322 (.out1(out_ui_extract_bit_expr_FU_72_i0_fu___float_adde11m52b_1023nih_44097_49322),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_49));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_49349 (.out1(out_ui_extract_bit_expr_FU_75_i0_fu___float_adde11m52b_1023nih_44097_49349),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_49376 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde11m52b_1023nih_44097_49376),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_52));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_49404 (.out1(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde11m52b_1023nih_44097_49404),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_54));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_49580 (.out1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_44097_49580),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_73));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44097_49584 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde11m52b_1023nih_44097_49584),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_49592 (.out1(out_ui_extract_bit_expr_FU_73_i0_fu___float_adde11m52b_1023nih_44097_49592),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_77));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44097_49596 (.out1(out_ui_extract_bit_expr_FU_74_i0_fu___float_adde11m52b_1023nih_44097_49596),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_49604 (.out1(out_ui_extract_bit_expr_FU_76_i0_fu___float_adde11m52b_1023nih_44097_49604),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_80));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44097_49608 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde11m52b_1023nih_44097_49608),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_72));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_49616 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde11m52b_1023nih_44097_49616),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_84));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44097_49620 (.out1(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde11m52b_1023nih_44097_49620),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_79));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_49866 (.out1(out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_44097_49866),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_44097_49936 (.out1(out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_44097_49936),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_49964 (.out1(out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_44097_49964),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_68));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44097_49968 (.out1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_44097_49968),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_44097_49980 (.out1(out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_44097_49980),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_44097_49984 (.out1(out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_44097_49984),
    .in1(out_ui_plus_expr_FU_64_64_64_206_i0_fu___float_adde11m52b_1023nih_44097_44657),
    .in2(out_const_32));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_49996 (.out1(out_lut_expr_FU_59_i0_fu___float_adde11m52b_1023nih_44097_49996),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_49_reg_49),
    .in5(out_reg_37_reg_37),
    .in6(out_reg_38_reg_38),
    .in7(out_reg_25_reg_25),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_49999 (.out1(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_44097_49999),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_50_reg_50),
    .in5(out_reg_39_reg_39),
    .in6(out_reg_40_reg_40),
    .in7(out_reg_26_reg_26),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50002 (.out1(out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_44097_50002),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_51_reg_51),
    .in5(out_reg_41_reg_41),
    .in6(out_reg_42_reg_42),
    .in7(out_reg_27_reg_27),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50005 (.out1(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_44097_50005),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_52_reg_52),
    .in5(out_reg_43_reg_43),
    .in6(out_reg_44_reg_44),
    .in7(out_reg_28_reg_28),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50009 (.out1(out_lut_expr_FU_63_i0_fu___float_adde11m52b_1023nih_44097_50009),
    .in1(out_const_46),
    .in2(out_reg_45_reg_45),
    .in3(out_reg_29_reg_29),
    .in4(out_reg_20_reg_20),
    .in5(out_reg_30_reg_30),
    .in6(out_reg_21_reg_21),
    .in7(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50012 (.out1(out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_44097_50012),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_46_reg_46),
    .in5(out_reg_31_reg_31),
    .in6(out_reg_32_reg_32),
    .in7(out_reg_22_reg_22),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50015 (.out1(out_lut_expr_FU_65_i0_fu___float_adde11m52b_1023nih_44097_50015),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_47_reg_47),
    .in5(out_reg_33_reg_33),
    .in6(out_reg_34_reg_34),
    .in7(out_reg_23_reg_23),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50018 (.out1(out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_44097_50018),
    .in1(out_const_83),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_48_reg_48),
    .in5(out_reg_35_reg_35),
    .in6(out_reg_36_reg_36),
    .in7(out_reg_24_reg_24),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50021 (.out1(out_lut_expr_FU_67_i0_fu___float_adde11m52b_1023nih_44097_50021),
    .in1(out_const_17),
    .in2(out_lut_expr_FU_63_i0_fu___float_adde11m52b_1023nih_44097_50009),
    .in3(out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_44097_50012),
    .in4(out_lut_expr_FU_65_i0_fu___float_adde11m52b_1023nih_44097_50015),
    .in5(out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_44097_50018),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50026 (.out1(out_lut_expr_FU_82_i0_fu___float_adde11m52b_1023nih_44097_50026),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_57_reg_57),
    .in5(out_reg_58_reg_58),
    .in6(out_reg_53_reg_53),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50029 (.out1(out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_44097_50029),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_59_reg_59),
    .in5(out_reg_60_reg_60),
    .in6(out_reg_54_reg_54),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50032 (.out1(out_lut_expr_FU_84_i0_fu___float_adde11m52b_1023nih_44097_50032),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_61_reg_61),
    .in5(out_reg_62_reg_62),
    .in6(out_reg_55_reg_55),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50035 (.out1(out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_44097_50035),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_63_reg_63),
    .in5(out_reg_64_reg_64),
    .in6(out_reg_56_reg_56),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50039 (.out1(out_lut_expr_FU_86_i0_fu___float_adde11m52b_1023nih_44097_50039),
    .in1(out_const_25),
    .in2(out_lut_expr_FU_61_i0_fu___float_adde11m52b_1023nih_44097_50002),
    .in3(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_44097_50005),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in5(out_lut_expr_FU_84_i0_fu___float_adde11m52b_1023nih_44097_50032),
    .in6(out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_44097_50035),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50045 (.out1(out_lut_expr_FU_99_i0_fu___float_adde11m52b_1023nih_44097_50045),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_69_reg_69),
    .in5(out_reg_70_reg_70),
    .in6(out_reg_66_reg_66),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50049 (.out1(out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_44097_50049),
    .in1(out_const_86),
    .in2(out_lut_expr_FU_60_i0_fu___float_adde11m52b_1023nih_44097_49999),
    .in3(out_lut_expr_FU_64_i0_fu___float_adde11m52b_1023nih_44097_50012),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in5(out_lut_expr_FU_83_i0_fu___float_adde11m52b_1023nih_44097_50029),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500),
    .in7(out_lut_expr_FU_99_i0_fu___float_adde11m52b_1023nih_44097_50045),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50052 (.out1(out_lut_expr_FU_101_i0_fu___float_adde11m52b_1023nih_44097_50052),
    .in1(out_const_76),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_67_reg_67),
    .in5(out_reg_68_reg_68),
    .in6(out_reg_65_reg_65),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50055 (.out1(out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_44097_50055),
    .in1(out_const_86),
    .in2(out_lut_expr_FU_62_i0_fu___float_adde11m52b_1023nih_44097_50005),
    .in3(out_lut_expr_FU_66_i0_fu___float_adde11m52b_1023nih_44097_50018),
    .in4(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in5(out_lut_expr_FU_85_i0_fu___float_adde11m52b_1023nih_44097_50035),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500),
    .in7(out_lut_expr_FU_101_i0_fu___float_adde11m52b_1023nih_44097_50052),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50061 (.out1(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_44097_50061),
    .in1(out_const_87),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44097_47770),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44097_47774),
    .in4(out_lut_expr_FU_100_i0_fu___float_adde11m52b_1023nih_44097_50049),
    .in5(out_lut_expr_FU_102_i0_fu___float_adde11m52b_1023nih_44097_50055),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50065 (.out1(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_44097_50065),
    .in1(out_const_24),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44097_47770),
    .in5(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44097_47774),
    .in6(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in7(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50070 (.out1(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_44097_50070),
    .in1(out_const_18),
    .in2(out_reg_45_reg_45),
    .in3(out_reg_20_reg_20),
    .in4(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50073 (.out1(out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_44097_50073),
    .in1(out_const_21),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_47_reg_47),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50076 (.out1(out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_44097_50076),
    .in1(out_const_87),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44097_47770),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44097_47774),
    .in4(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_44097_50070),
    .in5(out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_44097_50073),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50079 (.out1(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_44097_50079),
    .in1(out_const_21),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_46_reg_46),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50082 (.out1(out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_44097_50082),
    .in1(out_const_75),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44097_47770),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44097_47774),
    .in4(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_44097_50079),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50085 (.out1(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_44097_50085),
    .in1(out_const_75),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44097_47770),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44097_47774),
    .in4(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_44097_50070),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50088 (.out1(out_lut_expr_FU_120_i0_fu___float_adde11m52b_1023nih_44097_50088),
    .in1(out_const_21),
    .in2(out_reg_20_reg_20),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde11m52b_1023nih_44097_45492),
    .in4(out_reg_48_reg_48),
    .in5(out_lut_expr_FU_68_i0_fu___float_adde11m52b_1023nih_44097_45496),
    .in6(out_lut_expr_FU_87_i0_fu___float_adde11m52b_1023nih_44097_45500),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50091 (.out1(out_lut_expr_FU_121_i0_fu___float_adde11m52b_1023nih_44097_50091),
    .in1(out_const_87),
    .in2(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_44097_47770),
    .in3(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_44097_47774),
    .in4(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_44097_50079),
    .in5(out_lut_expr_FU_120_i0_fu___float_adde11m52b_1023nih_44097_50088),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50097 (.out1(out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_44097_50097),
    .in1(out_const_30),
    .in2(out_ui_gt_expr_FU_16_16_16_180_i0_fu___float_adde11m52b_1023nih_44097_44931),
    .in3(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_44097_50061),
    .in4(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_44097_50065),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50101 (.out1(out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_44097_50101),
    .in1(out_const_74),
    .in2(out_reg_28_reg_28),
    .in3(out_reg_9_reg_9),
    .in4(out_lut_expr_FU_124_i0_fu___float_adde11m52b_1023nih_44097_50097),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_44097_50105 (.out1(out_lut_expr_FU_127_i0_fu___float_adde11m52b_1023nih_44097_50105),
    .in1(out_const_21),
    .in2(out_reg_6_reg_6),
    .in3(out_reg_7_reg_7),
    .in4(out_lut_expr_FU_125_i0_fu___float_adde11m52b_1023nih_44097_50101),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_16_0_16_147_i0_fu___float_adde11m52b_1023nih_44097_44225),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(56),
    .BITSIZE_out1(56)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_44097_44256),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_212_i1_fu___float_adde11m52b_1023nih_44097_46044),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_131_i0_fu___float_adde11m52b_1023nih_44097_46343),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_132_i0_fu___float_adde11m52b_1023nih_44097_46450),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_44097_47440),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_130_i0_fu___float_adde11m52b_1023nih_44097_47674),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_44097_47903),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_44097_47906),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_44097_47910),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(56),
    .BITSIZE_out1(56)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_0_64_64_146_i0_fu___float_adde11m52b_1023nih_44097_44662),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_184_i0_fu___float_adde11m52b_1023nih_44097_44685),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_64_0_64_205_i0_fu___float_adde11m52b_1023nih_44097_44605),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_32_0_32_178_i0_fu___float_adde11m52b_1023nih_44097_45488),
    .wenable(wrenable_reg_20));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_30_i0_fu___float_adde11m52b_1023nih_44097_48614),
    .wenable(wrenable_reg_21));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_44097_48630),
    .wenable(wrenable_reg_22));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde11m52b_1023nih_44097_48646),
    .wenable(wrenable_reg_23));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_44097_48662),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_44097_48678),
    .wenable(wrenable_reg_25));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_44097_48694),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_44097_48710),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_44097_48726),
    .wenable(wrenable_reg_28));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_44097_48933),
    .wenable(wrenable_reg_29));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_64_0_64_179_i0_fu___float_adde11m52b_1023nih_44097_44610),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_44097_48937),
    .wenable(wrenable_reg_30));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde11m52b_1023nih_44097_48945),
    .wenable(wrenable_reg_31));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_44097_48949),
    .wenable(wrenable_reg_32));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_44097_48957),
    .wenable(wrenable_reg_33));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde11m52b_1023nih_44097_48961),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_44097_48969),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_44097_48973),
    .wenable(wrenable_reg_36));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_44097_48981),
    .wenable(wrenable_reg_37));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_44097_48985),
    .wenable(wrenable_reg_38));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_44097_48993),
    .wenable(wrenable_reg_39));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_0_64_64_145_i0_fu___float_adde11m52b_1023nih_44097_44629),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_44097_48997),
    .wenable(wrenable_reg_40));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_44097_49005),
    .wenable(wrenable_reg_41));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_44097_49009),
    .wenable(wrenable_reg_42));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_44097_49017),
    .wenable(wrenable_reg_43));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_44097_49021),
    .wenable(wrenable_reg_44));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_44097_49279),
    .wenable(wrenable_reg_45));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde11m52b_1023nih_44097_49283),
    .wenable(wrenable_reg_46));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_44097_49287),
    .wenable(wrenable_reg_47));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_44097_49291),
    .wenable(wrenable_reg_48));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_49 (.out1(out_reg_49_reg_49),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_44097_49295),
    .wenable(wrenable_reg_49));
  register_SE #(.BITSIZE_in1(7),
    .BITSIZE_out1(7)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_bit_and_expr_FU_0_8_8_138_i0_fu___float_adde11m52b_1023nih_44097_44775),
    .wenable(wrenable_reg_5));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_50 (.out1(out_reg_50_reg_50),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_44097_49299),
    .wenable(wrenable_reg_50));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_51 (.out1(out_reg_51_reg_51),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_44097_49303),
    .wenable(wrenable_reg_51));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_52 (.out1(out_reg_52_reg_52),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_44097_49307),
    .wenable(wrenable_reg_52));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_53 (.out1(out_reg_53_reg_53),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_72_i0_fu___float_adde11m52b_1023nih_44097_49322),
    .wenable(wrenable_reg_53));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_54 (.out1(out_reg_54_reg_54),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_75_i0_fu___float_adde11m52b_1023nih_44097_49349),
    .wenable(wrenable_reg_54));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_55 (.out1(out_reg_55_reg_55),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde11m52b_1023nih_44097_49376),
    .wenable(wrenable_reg_55));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_56 (.out1(out_reg_56_reg_56),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde11m52b_1023nih_44097_49404),
    .wenable(wrenable_reg_56));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_57 (.out1(out_reg_57_reg_57),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_44097_49580),
    .wenable(wrenable_reg_57));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_58 (.out1(out_reg_58_reg_58),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde11m52b_1023nih_44097_49584),
    .wenable(wrenable_reg_58));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_59 (.out1(out_reg_59_reg_59),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_73_i0_fu___float_adde11m52b_1023nih_44097_49592),
    .wenable(wrenable_reg_59));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_0_16_16_174_i0_fu___float_adde11m52b_1023nih_44097_45143),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_60 (.out1(out_reg_60_reg_60),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_74_i0_fu___float_adde11m52b_1023nih_44097_49596),
    .wenable(wrenable_reg_60));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_61 (.out1(out_reg_61_reg_61),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_76_i0_fu___float_adde11m52b_1023nih_44097_49604),
    .wenable(wrenable_reg_61));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_62 (.out1(out_reg_62_reg_62),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde11m52b_1023nih_44097_49608),
    .wenable(wrenable_reg_62));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_63 (.out1(out_reg_63_reg_63),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde11m52b_1023nih_44097_49616),
    .wenable(wrenable_reg_63));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_64 (.out1(out_reg_64_reg_64),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde11m52b_1023nih_44097_49620),
    .wenable(wrenable_reg_64));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_65 (.out1(out_reg_65_reg_65),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_44097_49866),
    .wenable(wrenable_reg_65));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_66 (.out1(out_reg_66_reg_66),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_44097_49936),
    .wenable(wrenable_reg_66));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_67 (.out1(out_reg_67_reg_67),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_44097_49964),
    .wenable(wrenable_reg_67));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_68 (.out1(out_reg_68_reg_68),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_44097_49968),
    .wenable(wrenable_reg_68));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_69 (.out1(out_reg_69_reg_69),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_44097_49980),
    .wenable(wrenable_reg_69));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_175_i0_fu___float_adde11m52b_1023nih_44097_45148),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_70 (.out1(out_reg_70_reg_70),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_44097_49984),
    .wenable(wrenable_reg_70));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_71 (.out1(out_reg_71_reg_71),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_44097_45006),
    .wenable(wrenable_reg_71));
  register_STD #(.BITSIZE_in1(52),
    .BITSIZE_out1(52)) reg_72 (.out1(out_reg_72_reg_72),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_64_0_64_151_i2_fu___float_adde11m52b_1023nih_44097_45092),
    .wenable(wrenable_reg_72));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_73 (.out1(out_reg_73_reg_73),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_123_i0_fu___float_adde11m52b_1023nih_44097_45131),
    .wenable(wrenable_reg_73));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_74 (.out1(out_reg_74_reg_74),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_193_i1_fu___float_adde11m52b_1023nih_44097_47452),
    .wenable(wrenable_reg_74));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_75 (.out1(out_reg_75_reg_75),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_126_i0_fu___float_adde11m52b_1023nih_44097_46246),
    .wenable(wrenable_reg_75));
  register_STD #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_76 (.out1(out_reg_76_reg_76),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_214_i0_fu___float_adde11m52b_1023nih_44097_46432),
    .wenable(wrenable_reg_76));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_77 (.out1(out_reg_77_reg_77),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_127_i0_fu___float_adde11m52b_1023nih_44097_50105),
    .wenable(wrenable_reg_77));
  register_SE #(.BITSIZE_in1(52),
    .BITSIZE_out1(52)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_190_i0_fu___float_adde11m52b_1023nih_44097_45264),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_177_i0_fu___float_adde11m52b_1023nih_44097_45528),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_ui_bit_ior_expr_FU_0_64_64_162_i0_fu___float_adde11m52b_1023nih_44097_45298;

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
  parameter [4:0] S_0 = 5'b00001,
    S_1 = 5'b00010,
    S_2 = 5'b00100,
    S_3 = 5'b01000,
    S_4 = 5'b10000;
  reg [4:0] _present_state=S_0, _next_state;
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
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
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
          _next_state = S_3;
        end
      S_3 :
        begin
          wrenable_reg_71 = 1'b1;
          wrenable_reg_72 = 1'b1;
          wrenable_reg_73 = 1'b1;
          wrenable_reg_74 = 1'b1;
          wrenable_reg_75 = 1'b1;
          wrenable_reg_76 = 1'b1;
          wrenable_reg_77 = 1'b1;
          _next_state = S_4;
          done_port = 1'b1;
        end
      S_4 :
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
  wire [31:0] out_ASSIGN_UNSIGNED_FU_14_i0_fu___float_mule11m52b_1023nih_43057_46367;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_15_i0_fu___float_mule11m52b_1023nih_43057_46369;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_16_i0_fu___float_mule11m52b_1023nih_43057_46371;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_17_i0_fu___float_mule11m52b_1023nih_43057_46373;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_43057_46363;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_43057_46365;
  wire signed [2:0] out_UIdata_converter_FU_21_i0_fu___float_mule11m52b_1023nih_43057_43407;
  wire signed [1:0] out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_43057_43410;
  wire signed [1:0] out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_43057_43440;
  wire signed [2:0] out_UIdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_43057_43413;
  wire signed [1:0] out_UIdata_converter_FU_30_i0_fu___float_mule11m52b_1023nih_43057_43443;
  wire signed [1:0] out_UIdata_converter_FU_33_i0_fu___float_mule11m52b_1023nih_43057_43458;
  wire signed [1:0] out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_43057_43676;
  wire signed [1:0] out_UIdata_converter_FU_40_i0_fu___float_mule11m52b_1023nih_43057_43698;
  wire out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_43057_46221;
  wire out_UUdata_converter_FU_20_i0_fu___float_mule11m52b_1023nih_43057_43295;
  wire out_UUdata_converter_FU_24_i0_fu___float_mule11m52b_1023nih_43057_43437;
  wire out_UUdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_43057_46231;
  wire out_UUdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_43057_43373;
  wire [10:0] out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_43057_43167;
  wire out_UUdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_43057_43455;
  wire out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_43057_43657;
  wire out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_43057_43660;
  wire out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_43057_43673;
  wire [11:0] out_UUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_43057_43717;
  wire out_UUdata_converter_FU_46_i0_fu___float_mule11m52b_1023nih_43057_43854;
  wire [10:0] out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_43057_43182;
  wire out_UUdata_converter_FU_9_i0_fu___float_mule11m52b_1023nih_43057_43205;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_61_i0_fu___float_mule11m52b_1023nih_43057_43419;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_61_i1_fu___float_mule11m52b_1023nih_43057_43446;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_61_i2_fu___float_mule11m52b_1023nih_43057_43461;
  wire signed [2:0] out_bit_ior_expr_FU_8_8_8_62_i0_fu___float_mule11m52b_1023nih_43057_43416;
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
  wire out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43057_46975;
  wire out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43057_46978;
  wire out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43057_47259;
  wire out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_43057_43249;
  wire out_lut_expr_FU_11_i0_fu___float_mule11m52b_1023nih_43057_44071;
  wire out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_43057_43327;
  wire out_lut_expr_FU_13_i0_fu___float_mule11m52b_1023nih_43057_44063;
  wire out_lut_expr_FU_19_i0_fu___float_mule11m52b_1023nih_43057_46595;
  wire out_lut_expr_FU_23_i0_fu___float_mule11m52b_1023nih_43057_46500;
  wire out_lut_expr_FU_27_i0_fu___float_mule11m52b_1023nih_43057_46599;
  wire out_lut_expr_FU_31_i0_fu___float_mule11m52b_1023nih_43057_46518;
  wire out_lut_expr_FU_37_i0_fu___float_mule11m52b_1023nih_43057_46525;
  wire out_lut_expr_FU_45_i0_fu___float_mule11m52b_1023nih_43057_46539;
  wire out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43057_47413;
  wire out_lut_expr_FU_52_i0_fu___float_mule11m52b_1023nih_43057_45456;
  wire out_lut_expr_FU_54_i0_fu___float_mule11m52b_1023nih_43057_46163;
  wire out_lut_expr_FU_55_i0_fu___float_mule11m52b_1023nih_43057_47420;
  wire out_lut_expr_FU_56_i0_fu___float_mule11m52b_1023nih_43057_47424;
  wire out_lut_expr_FU_57_i0_fu___float_mule11m52b_1023nih_43057_46166;
  wire out_lut_expr_FU_58_i0_fu___float_mule11m52b_1023nih_43057_46179;
  wire out_lut_expr_FU_59_i0_fu___float_mule11m52b_1023nih_43057_46133;
  wire out_lut_expr_FU_8_i0_fu___float_mule11m52b_1023nih_43057_43202;
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
  wire [10:0] out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_43057_43179;
  wire [53:0] out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_43057_43625;
  wire [62:0] out_ui_bit_and_expr_FU_0_64_64_65_i0_fu___float_mule11m52b_1023nih_43057_43982;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_43057_43164;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_66_i1_fu___float_mule11m52b_1023nih_43057_43941;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_43057_43213;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_43057_43305;
  wire [9:0] out_ui_bit_and_expr_FU_16_0_16_68_i0_fu___float_mule11m52b_1023nih_43057_43641;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_69_i0_fu___float_mule11m52b_1023nih_43057_43401;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_43057_43527;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_43057_43533;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i2_fu___float_mule11m52b_1023nih_43057_43562;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_70_i3_fu___float_mule11m52b_1023nih_43057_43577;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_71_i0_fu___float_mule11m52b_1023nih_43057_45700;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_43057_43147;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_43057_43185;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i2_fu___float_mule11m52b_1023nih_43057_43647;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_72_i3_fu___float_mule11m52b_1023nih_43057_43713;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_73_i0_fu___float_mule11m52b_1023nih_43057_43688;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_74_i0_fu___float_mule11m52b_1023nih_43057_43838;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_75_i0_fu___float_mule11m52b_1023nih_43057_43695;
  wire [63:0] out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_43057_43609;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_43057_43507;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_43057_43523;
  wire [51:0] out_ui_bit_ior_expr_FU_0_64_64_78_i0_fu___float_mule11m52b_1023nih_43057_43644;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_43057_43723;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_80_i0_fu___float_mule11m52b_1023nih_43057_43985;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_43057_44038;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_82_i0_fu___float_mule11m52b_1023nih_43057_43710;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i0_fu___float_mule11m52b_1023nih_43057_43298;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_43057_43301;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i2_fu___float_mule11m52b_1023nih_43057_43376;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_43057_43379;
  wire [12:0] out_ui_cond_expr_FU_16_16_16_16_84_i0_fu___float_mule11m52b_1023nih_43057_46128;
  wire [12:0] out_ui_cond_expr_FU_16_16_16_16_84_i1_fu___float_mule11m52b_1023nih_43057_46197;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_85_i0_fu___float_mule11m52b_1023nih_43057_46182;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_85_i1_fu___float_mule11m52b_1023nih_43057_46200;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_85_i2_fu___float_mule11m52b_1023nih_43057_46239;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i0_fu___float_mule11m52b_1023nih_43057_45969;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i1_fu___float_mule11m52b_1023nih_43057_45978;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i2_fu___float_mule11m52b_1023nih_43057_46188;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_86_i3_fu___float_mule11m52b_1023nih_43057_46194;
  wire out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43057_43308;
  wire out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_43057_43944;
  wire out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43057_43222;
  wire out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_43057_43226;
  wire out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_43057_43312;
  wire out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_43057_43229;
  wire out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_43057_43315;
  wire out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_43057_43895;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_43057_47141;
  wire out_ui_extract_bit_expr_FU_42_i0_fu___float_mule11m52b_1023nih_43057_45775;
  wire out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_43057_46971;
  wire out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_43057_46804;
  wire out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43057_47343;
  wire out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_43057_46678;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_mule11m52b_1023nih_43057_46612;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_mule11m52b_1023nih_43057_46616;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_43057_43208;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule11m52b_1023nih_43057_43606;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_mule11m52b_1023nih_43057_43629;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_mule11m52b_1023nih_43057_43667;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_95_i1_fu___float_mule11m52b_1023nih_43057_43707;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_mule11m52b_1023nih_43057_43720;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_mule11m52b_1023nih_43057_45697;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_43057_46159;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_98_i1_fu___float_mule11m52b_1023nih_43057_46218;
  wire [53:0] out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_43057_43679;
  wire [50:0] out_ui_lshift_expr_FU_64_64_64_99_i1_fu___float_mule11m52b_1023nih_43057_43704;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_mule11m52b_1023nih_43057_46204;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_100_i1_fu___float_mule11m52b_1023nih_43057_46208;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_mule11m52b_1023nih_43057_46225;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_101_i1_fu___float_mule11m52b_1023nih_43057_46234;
  wire [63:0] out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_43057_43536;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_102_i1_fu___float_mule11m52b_1023nih_43057_43570;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_102_i2_fu___float_mule11m52b_1023nih_43057_43585;
  wire [41:0] out_ui_mult_expr_FU_32_32_32_0_102_i3_fu___float_mule11m52b_1023nih_43057_43596;
  wire out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_43057_43349;
  wire out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_43057_43271;
  wire out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_43057_43841;
  wire out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_43057_44060;
  wire out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_43057_44068;
  wire [12:0] out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_43057_43663;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_43057_43573;
  wire [52:0] out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_43057_43588;
  wire [63:0] out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_43057_43889;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule11m52b_1023nih_43057_43155;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_109_i1_fu___float_mule11m52b_1023nih_43057_43174;
  wire [1:0] out_ui_rshift_expr_FU_64_0_64_109_i2_fu___float_mule11m52b_1023nih_43057_43692;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_109_i3_fu___float_mule11m52b_1023nih_43057_43938;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_43057_43554;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_43057_43558;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_110_i2_fu___float_mule11m52b_1023nih_43057_43566;
  wire [21:0] out_ui_rshift_expr_FU_64_0_64_110_i3_fu___float_mule11m52b_1023nih_43057_43581;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_110_i4_fu___float_mule11m52b_1023nih_43057_43592;
  wire [9:0] out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_43057_43632;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule11m52b_1023nih_43057_45688;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule11m52b_1023nih_43057_46152;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_113_i1_fu___float_mule11m52b_1023nih_43057_46214;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_43057_46211;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule11m52b_1023nih_43057_43383;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_43057_43386;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule11m52b_1023nih_43057_46228;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule11m52b_1023nih_43057_46237;
  wire [1:0] out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_43057_43701;
  wire [12:0] out_ui_ternary_plus_expr_FU_0_16_16_16_118_i0_fu___float_mule11m52b_1023nih_43057_43489;
  wire [41:0] out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_43057_43602;
  
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
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43057_43147 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_43057_43147),
    .in1(in_port_a),
    .in2(out_const_35));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43155 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule11m52b_1023nih_43057_43155),
    .in1(in_port_a),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43057_43164 (.out1(out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_43057_43164),
    .in1(out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule11m52b_1023nih_43057_43155),
    .in2(out_const_28));
  UUdata_converter_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43057_43167 (.out1(out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_43057_43167),
    .in1(out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_43057_43164));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43174 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i1_fu___float_mule11m52b_1023nih_43057_43174),
    .in1(in_port_b),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43057_43179 (.out1(out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_43057_43179),
    .in1(out_const_28),
    .in2(out_ui_rshift_expr_FU_64_0_64_109_i1_fu___float_mule11m52b_1023nih_43057_43174));
  UUdata_converter_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43057_43182 (.out1(out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_43057_43182),
    .in1(out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_43057_43179));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43057_43185 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_43057_43185),
    .in1(in_port_b),
    .in2(out_const_35));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43202 (.out1(out_lut_expr_FU_8_i0_fu___float_mule11m52b_1023nih_43057_43202),
    .in1(out_const_16),
    .in2(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule11m52b_1023nih_43057_46612),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule11m52b_1023nih_43057_46616),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43205 (.out1(out_UUdata_converter_FU_9_i0_fu___float_mule11m52b_1023nih_43057_43205),
    .in1(out_lut_expr_FU_8_i0_fu___float_mule11m52b_1023nih_43057_43202));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43208 (.out1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_43057_43208),
    .in1(out_UUdata_converter_FU_9_i0_fu___float_mule11m52b_1023nih_43057_43205),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43057_43213 (.out1(out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_43057_43213),
    .in1(out_ui_bit_and_expr_FU_16_0_16_66_i0_fu___float_mule11m52b_1023nih_43057_43164),
    .in2(out_const_34));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43222 (.out1(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43057_43222),
    .in1(out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_43057_43213),
    .in2(out_const_28));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43226 (.out1(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_43057_43226),
    .in1(out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_43057_43167),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43229 (.out1(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_43057_43229),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_43057_43147),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43249 (.out1(out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_43057_43249),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_43057_43229),
    .in3(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43057_43222),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43271 (.out1(out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_43057_43271),
    .in1(out_ui_bit_and_expr_FU_16_0_16_67_i0_fu___float_mule11m52b_1023nih_43057_43213),
    .in2(out_const_28));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43295 (.out1(out_UUdata_converter_FU_20_i0_fu___float_mule11m52b_1023nih_43057_43295),
    .in1(out_lut_expr_FU_19_i0_fu___float_mule11m52b_1023nih_43057_46595));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43298 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i0_fu___float_mule11m52b_1023nih_43057_43298),
    .in1(out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_mule11m52b_1023nih_43057_46204),
    .in2(out_ui_cond_expr_FU_8_8_8_8_86_i3_fu___float_mule11m52b_1023nih_43057_46194));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43301 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_43057_43301),
    .in1(out_UUdata_converter_FU_20_i0_fu___float_mule11m52b_1023nih_43057_43295),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_83_i0_fu___float_mule11m52b_1023nih_43057_43298));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43057_43305 (.out1(out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_43057_43305),
    .in1(out_ui_bit_and_expr_FU_0_16_16_63_i0_fu___float_mule11m52b_1023nih_43057_43179),
    .in2(out_const_34));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43308 (.out1(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43057_43308),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_43057_43305));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43312 (.out1(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_43057_43312),
    .in1(out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_43057_43182),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43315 (.out1(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_43057_43315),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_43057_43185),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43327 (.out1(out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_43057_43327),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_43057_43315),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43057_43308),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43349 (.out1(out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_43057_43349),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_16_0_16_67_i1_fu___float_mule11m52b_1023nih_43057_43305));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43373 (.out1(out_UUdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_43057_43373),
    .in1(out_lut_expr_FU_27_i0_fu___float_mule11m52b_1023nih_43057_46599));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43376 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i2_fu___float_mule11m52b_1023nih_43057_43376),
    .in1(out_ui_lshift_expr_FU_8_0_8_100_i1_fu___float_mule11m52b_1023nih_43057_46208),
    .in2(out_ui_cond_expr_FU_8_8_8_8_86_i2_fu___float_mule11m52b_1023nih_43057_46188));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43379 (.out1(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_43057_43379),
    .in1(out_UUdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_43057_43373),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_83_i2_fu___float_mule11m52b_1023nih_43057_43376));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43057_43383 (.out1(out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule11m52b_1023nih_43057_43383),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_43057_43301),
    .in2(out_const_1));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43057_43386 (.out1(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_43057_43386),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_43057_43379),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43401 (.out1(out_ui_bit_and_expr_FU_1_1_1_69_i0_fu___float_mule11m52b_1023nih_43057_43401),
    .in1(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_43057_43386),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_43057_43379));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_43057_43407 (.out1(out_UIdata_converter_FU_21_i0_fu___float_mule11m52b_1023nih_43057_43407),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i1_fu___float_mule11m52b_1023nih_43057_43301));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43410 (.out1(out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_43057_43410),
    .in1(out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule11m52b_1023nih_43057_43383));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_43057_43413 (.out1(out_UIdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_43057_43413),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_83_i3_fu___float_mule11m52b_1023nih_43057_43379));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_43057_43416 (.out1(out_bit_ior_expr_FU_8_8_8_62_i0_fu___float_mule11m52b_1023nih_43057_43416),
    .in1(out_UIdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_43057_43413),
    .in2(out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_43057_43410));
  bit_and_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(3),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43419 (.out1(out_bit_and_expr_FU_8_8_8_61_i0_fu___float_mule11m52b_1023nih_43057_43419),
    .in1(out_bit_ior_expr_FU_8_8_8_62_i0_fu___float_mule11m52b_1023nih_43057_43416),
    .in2(out_UIdata_converter_FU_21_i0_fu___float_mule11m52b_1023nih_43057_43407));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43437 (.out1(out_UUdata_converter_FU_24_i0_fu___float_mule11m52b_1023nih_43057_43437),
    .in1(out_lut_expr_FU_23_i0_fu___float_mule11m52b_1023nih_43057_46500));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43440 (.out1(out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_43057_43440),
    .in1(out_UUdata_converter_FU_24_i0_fu___float_mule11m52b_1023nih_43057_43437));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43443 (.out1(out_UIdata_converter_FU_30_i0_fu___float_mule11m52b_1023nih_43057_43443),
    .in1(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule11m52b_1023nih_43057_43386));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43446 (.out1(out_bit_and_expr_FU_8_8_8_61_i1_fu___float_mule11m52b_1023nih_43057_43446),
    .in1(out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_43057_43440),
    .in2(out_UIdata_converter_FU_30_i0_fu___float_mule11m52b_1023nih_43057_43443));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43455 (.out1(out_UUdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_43057_43455),
    .in1(out_lut_expr_FU_31_i0_fu___float_mule11m52b_1023nih_43057_46518));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43458 (.out1(out_UIdata_converter_FU_33_i0_fu___float_mule11m52b_1023nih_43057_43458),
    .in1(out_UUdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_43057_43455));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43461 (.out1(out_bit_and_expr_FU_8_8_8_61_i2_fu___float_mule11m52b_1023nih_43057_43461),
    .in1(out_UIdata_converter_FU_33_i0_fu___float_mule11m52b_1023nih_43057_43458),
    .in2(out_UIdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_43057_43410));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_43057_43489 (.out1(out_ui_ternary_plus_expr_FU_0_16_16_16_118_i0_fu___float_mule11m52b_1023nih_43057_43489),
    .in1(out_const_33),
    .in2(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_43057_46363),
    .in3(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_43057_46365));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_43057_43507 (.out1(out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_43057_43507),
    .in1(out_const_13),
    .in2(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_43057_43147));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_43057_43523 (.out1(out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_43057_43523),
    .in1(out_const_13),
    .in2(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_43057_43185));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43057_43527 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_43057_43527),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_43057_43507),
    .in2(out_const_34));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43057_43533 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_43057_43533),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_43057_43523),
    .in2(out_const_34));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(64),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_43057_43536 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_43057_43536),
    .clock(clock),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_43057_43527),
    .in2(out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_43057_43533));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43554 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_43057_43554),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i0_fu___float_mule11m52b_1023nih_43057_43507),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43558 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_43057_43558),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_77_i1_fu___float_mule11m52b_1023nih_43057_43523),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43057_43562 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i2_fu___float_mule11m52b_1023nih_43057_43562),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_43057_43536),
    .in2(out_const_34));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43566 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i2_fu___float_mule11m52b_1023nih_43057_43566),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i0_fu___float_mule11m52b_1023nih_43057_43536),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_43057_43570 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i1_fu___float_mule11m52b_1023nih_43057_43570),
    .clock(clock),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_43057_43554),
    .in2(out_ASSIGN_UNSIGNED_FU_15_i0_fu___float_mule11m52b_1023nih_43057_46369));
  ui_plus_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(54)) fu___float_mule11m52b_1023nih_43057_43573 (.out1(out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_43057_43573),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_2_reg_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43057_43577 (.out1(out_ui_bit_and_expr_FU_32_0_32_70_i3_fu___float_mule11m52b_1023nih_43057_43577),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_43057_43573),
    .in2(out_const_34));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(22),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43581 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i3_fu___float_mule11m52b_1023nih_43057_43581),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i0_fu___float_mule11m52b_1023nih_43057_43573),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_43057_43585 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i2_fu___float_mule11m52b_1023nih_43057_43585),
    .clock(clock),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_43057_43558),
    .in2(out_ASSIGN_UNSIGNED_FU_14_i0_fu___float_mule11m52b_1023nih_43057_46367));
  ui_plus_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_43057_43588 (.out1(out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_43057_43588),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_bit_and_expr_FU_32_0_32_70_i3_fu___float_mule11m52b_1023nih_43057_43577));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43592 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i4_fu___float_mule11m52b_1023nih_43057_43592),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_43057_43588),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(42),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_43057_43596 (.out1(out_ui_mult_expr_FU_32_32_32_0_102_i3_fu___float_mule11m52b_1023nih_43057_43596),
    .clock(clock),
    .in1(out_ASSIGN_UNSIGNED_FU_16_i0_fu___float_mule11m52b_1023nih_43057_46371),
    .in2(out_ASSIGN_UNSIGNED_FU_17_i0_fu___float_mule11m52b_1023nih_43057_46373));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(22),
    .BITSIZE_in3(21),
    .BITSIZE_out1(42)) fu___float_mule11m52b_1023nih_43057_43602 (.out1(out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_43057_43602),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43606 (.out1(out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule11m52b_1023nih_43057_43606),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i1_fu___float_mule11m52b_1023nih_43057_43588),
    .in2(out_const_2));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_in3(6),
    .BITSIZE_out1(64),
    .OFFSET_PARAMETER(32)) fu___float_mule11m52b_1023nih_43057_43609 (.out1(out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_43057_43609),
    .in1(out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_mule11m52b_1023nih_43057_45697),
    .in2(out_reg_7_reg_7),
    .in3(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(64),
    .BITSIZE_out1(54)) fu___float_mule11m52b_1023nih_43057_43625 (.out1(out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_43057_43625),
    .in1(out_const_37),
    .in2(out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_43057_43609));
  ui_lshift_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(5),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43629 (.out1(out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_mule11m52b_1023nih_43057_43629),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_43057_43602),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43632 (.out1(out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_43057_43632),
    .in1(out_ui_bit_ior_concat_expr_FU_76_i0_fu___float_mule11m52b_1023nih_43057_43609),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu___float_mule11m52b_1023nih_43057_43641 (.out1(out_ui_bit_and_expr_FU_16_0_16_68_i0_fu___float_mule11m52b_1023nih_43057_43641),
    .in1(out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_43057_43632),
    .in2(out_const_27));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(10),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43057_43644 (.out1(out_ui_bit_ior_expr_FU_0_64_64_78_i0_fu___float_mule11m52b_1023nih_43057_43644),
    .in1(out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_mule11m52b_1023nih_43057_43629),
    .in2(out_reg_14_reg_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43057_43647 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i2_fu___float_mule11m52b_1023nih_43057_43647),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_78_i0_fu___float_mule11m52b_1023nih_43057_43644),
    .in2(out_const_35));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43657 (.out1(out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_43057_43657),
    .in1(out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_43057_47141));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43660 (.out1(out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_43057_43660),
    .in1(out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_43057_43657));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_43057_43663 (.out1(out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_43057_43663),
    .in1(out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_43057_43660),
    .in2(out_reg_1_reg_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43667 (.out1(out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_mule11m52b_1023nih_43057_43667),
    .in1(out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_43057_43625),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43673 (.out1(out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_43057_43673),
    .in1(out_lut_expr_FU_37_i0_fu___float_mule11m52b_1023nih_43057_46525));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43676 (.out1(out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_43057_43676),
    .in1(out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_43057_43673));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43679 (.out1(out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_43057_43679),
    .in1(out_reg_15_reg_15),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_43057_43676));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(54),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_43057_43688 (.out1(out_ui_bit_and_expr_FU_64_0_64_73_i0_fu___float_mule11m52b_1023nih_43057_43688),
    .in1(out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_43057_43679),
    .in2(out_const_37));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43692 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i2_fu___float_mule11m52b_1023nih_43057_43692),
    .in1(out_ui_bit_and_expr_FU_0_64_64_64_i0_fu___float_mule11m52b_1023nih_43057_43625),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43695 (.out1(out_ui_bit_and_expr_FU_8_0_8_75_i0_fu___float_mule11m52b_1023nih_43057_43695),
    .in1(out_ui_rshift_expr_FU_64_0_64_109_i2_fu___float_mule11m52b_1023nih_43057_43692),
    .in2(out_const_15));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_43698 (.out1(out_UIdata_converter_FU_40_i0_fu___float_mule11m52b_1023nih_43057_43698),
    .in1(out_UUdata_converter_FU_35_i0_fu___float_mule11m52b_1023nih_43057_43657));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43701 (.out1(out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_43057_43701),
    .in1(out_reg_16_reg_16),
    .in2(out_UIdata_converter_FU_40_i0_fu___float_mule11m52b_1023nih_43057_43698));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(51),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43704 (.out1(out_ui_lshift_expr_FU_64_64_64_99_i1_fu___float_mule11m52b_1023nih_43057_43704),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i2_fu___float_mule11m52b_1023nih_43057_43647),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_43057_43676));
  ui_lshift_expr_FU #(.BITSIZE_in1(51),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43707 (.out1(out_ui_lshift_expr_FU_64_0_64_95_i1_fu___float_mule11m52b_1023nih_43057_43707),
    .in1(out_ui_lshift_expr_FU_64_64_64_99_i1_fu___float_mule11m52b_1023nih_43057_43704),
    .in2(out_const_1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43057_43710 (.out1(out_ui_bit_ior_expr_FU_64_64_64_82_i0_fu___float_mule11m52b_1023nih_43057_43710),
    .in1(out_ui_lshift_expr_FU_64_0_64_95_i1_fu___float_mule11m52b_1023nih_43057_43707),
    .in2(out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_43057_43701));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_43057_43713 (.out1(out_ui_bit_and_expr_FU_64_0_64_72_i3_fu___float_mule11m52b_1023nih_43057_43713),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_82_i0_fu___float_mule11m52b_1023nih_43057_43710),
    .in2(out_const_35));
  UUdata_converter_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(12)) fu___float_mule11m52b_1023nih_43057_43717 (.out1(out_UUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_43057_43717),
    .in1(out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_43057_43663));
  ui_lshift_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43720 (.out1(out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_mule11m52b_1023nih_43057_43720),
    .in1(out_UUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_43057_43717),
    .in2(out_const_4));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43057_43723 (.out1(out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_43057_43723),
    .in1(out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_mule11m52b_1023nih_43057_43720),
    .in2(out_ui_bit_and_expr_FU_64_0_64_72_i3_fu___float_mule11m52b_1023nih_43057_43713));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_43057_43838 (.out1(out_ui_bit_and_expr_FU_64_0_64_74_i0_fu___float_mule11m52b_1023nih_43057_43838),
    .in1(out_ui_bit_and_expr_FU_64_0_64_73_i0_fu___float_mule11m52b_1023nih_43057_43688),
    .in2(out_const_36));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43841 (.out1(out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_43057_43841),
    .in1(out_ui_bit_and_expr_FU_64_0_64_74_i0_fu___float_mule11m52b_1023nih_43057_43838),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43854 (.out1(out_UUdata_converter_FU_46_i0_fu___float_mule11m52b_1023nih_43057_43854),
    .in1(out_lut_expr_FU_45_i0_fu___float_mule11m52b_1023nih_43057_46539));
  ui_plus_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(1),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43057_43889 (.out1(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_43057_43889),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_18_reg_18));
  ui_eq_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43895 (.out1(out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_43057_43895),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_43057_43723),
    .in2(out_const_39));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_43938 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i3_fu___float_mule11m52b_1023nih_43057_43938),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_43057_43889),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43057_43941 (.out1(out_ui_bit_and_expr_FU_16_0_16_66_i1_fu___float_mule11m52b_1023nih_43057_43941),
    .in1(out_ui_rshift_expr_FU_64_0_64_109_i3_fu___float_mule11m52b_1023nih_43057_43938),
    .in2(out_const_28));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_43944 (.out1(out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_43057_43944),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_16_0_16_66_i1_fu___float_mule11m52b_1023nih_43057_43941));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_mule11m52b_1023nih_43057_43982 (.out1(out_ui_bit_and_expr_FU_0_64_64_65_i0_fu___float_mule11m52b_1023nih_43057_43982),
    .in1(out_const_38),
    .in2(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_43057_43889));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43057_43985 (.out1(out_ui_bit_ior_expr_FU_0_64_64_80_i0_fu___float_mule11m52b_1023nih_43057_43985),
    .in1(out_ui_bit_and_expr_FU_0_64_64_65_i0_fu___float_mule11m52b_1023nih_43057_43982),
    .in2(out_reg_0_reg_0));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43057_44038 (.out1(out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_43057_44038),
    .in1(out_const_29),
    .in2(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_43057_43208));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_44060 (.out1(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_43057_44060),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i1_fu___float_mule11m52b_1023nih_43057_43185),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_44063 (.out1(out_lut_expr_FU_13_i0_fu___float_mule11m52b_1023nih_43057_44063),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43057_43308),
    .in3(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_43057_44060),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_44068 (.out1(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_43057_44068),
    .in1(out_ui_bit_and_expr_FU_64_0_64_72_i0_fu___float_mule11m52b_1023nih_43057_43147),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_44071 (.out1(out_lut_expr_FU_11_i0_fu___float_mule11m52b_1023nih_43057_44071),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43057_43222),
    .in3(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_43057_44068),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_45456 (.out1(out_lut_expr_FU_52_i0_fu___float_mule11m52b_1023nih_43057_45456),
    .in1(out_const_11),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43057_46975),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43057_46978),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43057_47343),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43057_47259),
    .in6(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43057_47413),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_45688 (.out1(out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule11m52b_1023nih_43057_45688),
    .in1(out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule11m52b_1023nih_43057_43606),
    .in2(out_const_10));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_45697 (.out1(out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_mule11m52b_1023nih_43057_45697),
    .in1(out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule11m52b_1023nih_43057_45688),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43057_45700 (.out1(out_ui_bit_and_expr_FU_32_0_32_71_i0_fu___float_mule11m52b_1023nih_43057_45700),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i2_fu___float_mule11m52b_1023nih_43057_43562),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(4)) fu___float_mule11m52b_1023nih_43057_45775 (.out1(out_ui_extract_bit_expr_FU_42_i0_fu___float_mule11m52b_1023nih_43057_45775),
    .in1(out_ui_plus_expr_FU_16_16_16_107_i0_fu___float_mule11m52b_1023nih_43057_43663),
    .in2(out_const_17));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_45969 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i0_fu___float_mule11m52b_1023nih_43057_45969),
    .in1(out_lut_expr_FU_13_i0_fu___float_mule11m52b_1023nih_43057_44063),
    .in2(out_const_15),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_45978 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i1_fu___float_mule11m52b_1023nih_43057_45978),
    .in1(out_lut_expr_FU_11_i0_fu___float_mule11m52b_1023nih_43057_44071),
    .in2(out_const_15),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_in3(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_43057_46128 (.out1(out_ui_cond_expr_FU_16_16_16_16_84_i0_fu___float_mule11m52b_1023nih_43057_46128),
    .in1(out_lut_expr_FU_52_i0_fu___float_mule11m52b_1023nih_43057_45456),
    .in2(out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule11m52b_1023nih_43057_46152),
    .in3(out_const_30));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46133 (.out1(out_lut_expr_FU_59_i0_fu___float_mule11m52b_1023nih_43057_46133),
    .in1(out_const_31),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43057_46975),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43057_46978),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43057_47343),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43057_47259),
    .in6(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43057_47413),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_46152 (.out1(out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule11m52b_1023nih_43057_46152),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_43057_43208),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_46159 (.out1(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_43057_46159),
    .in1(out_ui_cond_expr_FU_16_16_16_16_84_i0_fu___float_mule11m52b_1023nih_43057_46128),
    .in2(out_const_18));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46163 (.out1(out_lut_expr_FU_54_i0_fu___float_mule11m52b_1023nih_43057_46163),
    .in1(out_const_32),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43057_46975),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43057_46978),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43057_47343),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43057_47259),
    .in6(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43057_47413),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46166 (.out1(out_lut_expr_FU_57_i0_fu___float_mule11m52b_1023nih_43057_46166),
    .in1(out_const_24),
    .in2(out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_43057_46678),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_43057_43944),
    .in4(out_reg_11_reg_11),
    .in5(out_reg_10_reg_10),
    .in6(out_reg_19_reg_19),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46179 (.out1(out_lut_expr_FU_58_i0_fu___float_mule11m52b_1023nih_43057_46179),
    .in1(out_const_12),
    .in2(out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_43057_46678),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i1_fu___float_mule11m52b_1023nih_43057_43944),
    .in4(out_reg_11_reg_11),
    .in5(out_reg_10_reg_10),
    .in6(out_reg_19_reg_19),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43057_46182 (.out1(out_ui_cond_expr_FU_64_64_64_64_85_i0_fu___float_mule11m52b_1023nih_43057_46182),
    .in1(out_lut_expr_FU_58_i0_fu___float_mule11m52b_1023nih_43057_46179),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_80_i0_fu___float_mule11m52b_1023nih_43057_43985),
    .in3(out_reg_0_reg_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_46188 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i2_fu___float_mule11m52b_1023nih_43057_46188),
    .in1(out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_43057_43327),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_86_i0_fu___float_mule11m52b_1023nih_43057_45969));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_43057_46194 (.out1(out_ui_cond_expr_FU_8_8_8_8_86_i3_fu___float_mule11m52b_1023nih_43057_46194),
    .in1(out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_43057_43249),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_86_i1_fu___float_mule11m52b_1023nih_43057_45978));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_in3(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_43057_46197 (.out1(out_ui_cond_expr_FU_16_16_16_16_84_i1_fu___float_mule11m52b_1023nih_43057_46197),
    .in1(out_lut_expr_FU_59_i0_fu___float_mule11m52b_1023nih_43057_46133),
    .in2(out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_43057_46211),
    .in3(out_ui_rshift_expr_FU_64_0_64_113_i1_fu___float_mule11m52b_1023nih_43057_46214));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43057_46200 (.out1(out_ui_cond_expr_FU_64_64_64_64_85_i1_fu___float_mule11m52b_1023nih_43057_46200),
    .in1(out_lut_expr_FU_57_i0_fu___float_mule11m52b_1023nih_43057_46166),
    .in2(out_reg_6_reg_6),
    .in3(out_ui_cond_expr_FU_64_64_64_64_85_i0_fu___float_mule11m52b_1023nih_43057_46182));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43057_46204 (.out1(out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_mule11m52b_1023nih_43057_46204),
    .in1(out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule11m52b_1023nih_43057_46228),
    .in2(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43057_46208 (.out1(out_ui_lshift_expr_FU_8_0_8_100_i1_fu___float_mule11m52b_1023nih_43057_46208),
    .in1(out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule11m52b_1023nih_43057_46237),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_46211 (.out1(out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_43057_46211),
    .in1(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_43057_46159),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_46214 (.out1(out_ui_rshift_expr_FU_64_0_64_113_i1_fu___float_mule11m52b_1023nih_43057_46214),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_43057_44038),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_43057_46218 (.out1(out_ui_lshift_expr_FU_64_0_64_98_i1_fu___float_mule11m52b_1023nih_43057_46218),
    .in1(out_ui_cond_expr_FU_16_16_16_16_84_i1_fu___float_mule11m52b_1023nih_43057_46197),
    .in2(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46221 (.out1(out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_43057_46221),
    .in1(out_lut_expr_FU_10_i0_fu___float_mule11m52b_1023nih_43057_43249));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43057_46225 (.out1(out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_mule11m52b_1023nih_43057_46225),
    .in1(out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_43057_46221),
    .in2(out_const_22));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43057_46228 (.out1(out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule11m52b_1023nih_43057_46228),
    .in1(out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_mule11m52b_1023nih_43057_46225),
    .in2(out_const_22));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46231 (.out1(out_UUdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_43057_46231),
    .in1(out_lut_expr_FU_12_i0_fu___float_mule11m52b_1023nih_43057_43327));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43057_46234 (.out1(out_ui_lshift_expr_FU_8_0_8_101_i1_fu___float_mule11m52b_1023nih_43057_46234),
    .in1(out_UUdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_43057_46231),
    .in2(out_const_22));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_43057_46237 (.out1(out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule11m52b_1023nih_43057_46237),
    .in1(out_ui_lshift_expr_FU_8_0_8_101_i1_fu___float_mule11m52b_1023nih_43057_46234),
    .in2(out_const_22));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_43057_46239 (.out1(out_ui_cond_expr_FU_64_64_64_64_85_i2_fu___float_mule11m52b_1023nih_43057_46239),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_9_reg_9),
    .in3(out_ui_cond_expr_FU_64_64_64_64_85_i1_fu___float_mule11m52b_1023nih_43057_46200));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43057_46363 (.out1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_43057_46363),
    .in1(out_UUdata_converter_FU_2_i0_fu___float_mule11m52b_1023nih_43057_43167));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_43057_46365 (.out1(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_43057_46365),
    .in1(out_UUdata_converter_FU_4_i0_fu___float_mule11m52b_1023nih_43057_43182));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43057_46367 (.out1(out_ASSIGN_UNSIGNED_FU_14_i0_fu___float_mule11m52b_1023nih_43057_46367),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i0_fu___float_mule11m52b_1023nih_43057_43527));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_43057_46369 (.out1(out_ASSIGN_UNSIGNED_FU_15_i0_fu___float_mule11m52b_1023nih_43057_46369),
    .in1(out_ui_bit_and_expr_FU_32_0_32_70_i1_fu___float_mule11m52b_1023nih_43057_43533));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___float_mule11m52b_1023nih_43057_46371 (.out1(out_ASSIGN_UNSIGNED_FU_16_i0_fu___float_mule11m52b_1023nih_43057_46371),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_43057_43554));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___float_mule11m52b_1023nih_43057_46373 (.out1(out_ASSIGN_UNSIGNED_FU_17_i0_fu___float_mule11m52b_1023nih_43057_46373),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule11m52b_1023nih_43057_43558));
  lut_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46500 (.out1(out_lut_expr_FU_23_i0_fu___float_mule11m52b_1023nih_43057_46500),
    .in1(out_const_20),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_43057_43229),
    .in3(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43057_43222),
    .in4(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_43057_44068),
    .in5(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_43057_43226),
    .in6(out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_43057_43271),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46518 (.out1(out_lut_expr_FU_31_i0_fu___float_mule11m52b_1023nih_43057_46518),
    .in1(out_const_20),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_43057_43315),
    .in3(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43057_43308),
    .in4(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_43057_44060),
    .in5(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_43057_43312),
    .in6(out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_43057_43349),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46525 (.out1(out_lut_expr_FU_37_i0_fu___float_mule11m52b_1023nih_43057_46525),
    .in1(out_const_7),
    .in2(out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_43057_47141),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46539 (.out1(out_lut_expr_FU_45_i0_fu___float_mule11m52b_1023nih_43057_46539),
    .in1(out_const_23),
    .in2(out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_43057_43841),
    .in3(out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_43057_46971),
    .in4(out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_43057_46804),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46595 (.out1(out_lut_expr_FU_19_i0_fu___float_mule11m52b_1023nih_43057_46595),
    .in1(out_const_8),
    .in2(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_43057_43226),
    .in3(out_ui_ne_expr_FU_16_0_16_104_i0_fu___float_mule11m52b_1023nih_43057_43271),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_46599 (.out1(out_lut_expr_FU_27_i0_fu___float_mule11m52b_1023nih_43057_46599),
    .in1(out_const_8),
    .in2(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_43057_43312),
    .in3(out_ui_ne_expr_FU_0_16_16_103_i0_fu___float_mule11m52b_1023nih_43057_43349),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_43057_46612 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule11m52b_1023nih_43057_46612),
    .in1(in_port_a),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_43057_46616 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule11m52b_1023nih_43057_46616),
    .in1(in_port_b),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_43057_46678 (.out1(out_ui_extract_bit_expr_FU_53_i0_fu___float_mule11m52b_1023nih_43057_46678),
    .in1(out_ui_plus_expr_FU_64_64_64_108_i2_fu___float_mule11m52b_1023nih_43057_43889),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_43057_46804 (.out1(out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_43057_46804),
    .in1(out_ui_lshift_expr_FU_64_64_64_99_i0_fu___float_mule11m52b_1023nih_43057_43679),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_43057_46971 (.out1(out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_43057_46971),
    .in1(out_ui_rshift_expr_FU_8_8_8_117_i0_fu___float_mule11m52b_1023nih_43057_43701),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_43057_46975 (.out1(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43057_46975),
    .in1(out_bit_and_expr_FU_8_8_8_61_i1_fu___float_mule11m52b_1023nih_43057_43446),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_43057_46978 (.out1(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43057_46978),
    .in1(out_bit_and_expr_FU_8_8_8_61_i2_fu___float_mule11m52b_1023nih_43057_43461),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_43057_47141 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_mule11m52b_1023nih_43057_47141),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_119_i0_fu___float_mule11m52b_1023nih_43057_43602),
    .in2(out_const_14));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_43057_47259 (.out1(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43057_47259),
    .in1(out_bit_and_expr_FU_8_8_8_61_i0_fu___float_mule11m52b_1023nih_43057_43419),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_43057_47343 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43057_47343),
    .in1(out_ui_bit_and_expr_FU_1_1_1_69_i0_fu___float_mule11m52b_1023nih_43057_43401),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(46),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_47413 (.out1(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43057_47413),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_64_0_64_90_i0_fu___float_mule11m52b_1023nih_43057_43229),
    .in3(out_ui_eq_expr_FU_16_0_16_88_i0_fu___float_mule11m52b_1023nih_43057_43222),
    .in4(out_ui_ne_expr_FU_64_0_64_106_i1_fu___float_mule11m52b_1023nih_43057_44068),
    .in5(out_ui_eq_expr_FU_64_0_64_90_i1_fu___float_mule11m52b_1023nih_43057_43315),
    .in6(out_ui_eq_expr_FU_0_16_16_87_i0_fu___float_mule11m52b_1023nih_43057_43308),
    .in7(out_ui_ne_expr_FU_64_0_64_106_i0_fu___float_mule11m52b_1023nih_43057_44060),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_47420 (.out1(out_lut_expr_FU_55_i0_fu___float_mule11m52b_1023nih_43057_47420),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_47_i0_fu___float_mule11m52b_1023nih_43057_46975),
    .in3(out_extract_bit_expr_FU_48_i0_fu___float_mule11m52b_1023nih_43057_46978),
    .in4(out_ui_extract_bit_expr_FU_49_i0_fu___float_mule11m52b_1023nih_43057_47343),
    .in5(out_extract_bit_expr_FU_50_i0_fu___float_mule11m52b_1023nih_43057_47259),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_43057_47424 (.out1(out_lut_expr_FU_56_i0_fu___float_mule11m52b_1023nih_43057_47424),
    .in1(out_const_25),
    .in2(out_ui_ne_expr_FU_64_0_64_105_i0_fu___float_mule11m52b_1023nih_43057_43841),
    .in3(out_ui_extract_bit_expr_FU_43_i0_fu___float_mule11m52b_1023nih_43057_46971),
    .in4(out_ui_extract_bit_expr_FU_44_i0_fu___float_mule11m52b_1023nih_43057_46804),
    .in5(out_ui_extract_bit_expr_FU_42_i0_fu___float_mule11m52b_1023nih_43057_45775),
    .in6(out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_43057_43895),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_43057_43208),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(13),
    .BITSIZE_out1(13)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_plus_expr_FU_0_16_16_16_118_i0_fu___float_mule11m52b_1023nih_43057_43489),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_51_i0_fu___float_mule11m52b_1023nih_43057_47413),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_55_i0_fu___float_mule11m52b_1023nih_43057_47420),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(22),
    .BITSIZE_out1(22)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i3_fu___float_mule11m52b_1023nih_43057_43581),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i4_fu___float_mule11m52b_1023nih_43057_43592),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_16_0_16_68_i0_fu___float_mule11m52b_1023nih_43057_43641),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_mule11m52b_1023nih_43057_43667),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_8_0_8_75_i0_fu___float_mule11m52b_1023nih_43057_43695),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_79_i0_fu___float_mule11m52b_1023nih_43057_43723),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_46_i0_fu___float_mule11m52b_1023nih_43057_43854),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_56_i0_fu___float_mule11m52b_1023nih_43057_47424),
    .wenable(wrenable_reg_19));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i2_fu___float_mule11m52b_1023nih_43057_43566),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i1_fu___float_mule11m52b_1023nih_43057_43570),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i2_fu___float_mule11m52b_1023nih_43057_43585),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(42),
    .BITSIZE_out1(42)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_102_i3_fu___float_mule11m52b_1023nih_43057_43596),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_81_i0_fu___float_mule11m52b_1023nih_43057_44038),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_71_i0_fu___float_mule11m52b_1023nih_43057_45700),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_54_i0_fu___float_mule11m52b_1023nih_43057_46163),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_98_i1_fu___float_mule11m52b_1023nih_43057_46218),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_ui_cond_expr_FU_64_64_64_64_85_i2_fu___float_mule11m52b_1023nih_43057_46239;

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
  parameter [4:0] S_0 = 5'b00001,
    S_1 = 5'b00010,
    S_2 = 5'b00100,
    S_3 = 5'b01000,
    S_4 = 5'b10000;
  reg [4:0] _present_state=S_0, _next_state;
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
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
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
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          _next_state = S_4;
          done_port = 1'b1;
        end
      S_4 :
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

// Datapath RTL description for _Z18matrix_convolutionPKdPdS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath__Z18matrix_convolutionPKdPdS1_ii(clock,
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
  fuselector_BMEMORY_CTRLN_39_i0_LOAD,
  fuselector_BMEMORY_CTRLN_39_i0_STORE,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042,
  selector_MUX_102_reg_10_0_0_0,
  selector_MUX_103_reg_11_0_0_0,
  selector_MUX_103_reg_11_0_0_1,
  selector_MUX_110_reg_18_0_0_0,
  selector_MUX_115_reg_22_0_0_0,
  selector_MUX_116_reg_23_0_0_0,
  selector_MUX_121_reg_28_0_0_0,
  selector_MUX_123_reg_3_0_0_0,
  selector_MUX_124_reg_30_0_0_0,
  selector_MUX_127_reg_6_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0,
  selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0,
  selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0,
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
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096,
  OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958,
  OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962,
  OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038,
  OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_kernel;
  input [31:0] in_port_B;
  input signed [31:0] in_port_size;
  input signed [31:0] in_port_kernel_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_39_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_39_i0_STORE;
  input selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958;
  input selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962;
  input selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038;
  input selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042;
  input selector_MUX_102_reg_10_0_0_0;
  input selector_MUX_103_reg_11_0_0_0;
  input selector_MUX_103_reg_11_0_0_1;
  input selector_MUX_110_reg_18_0_0_0;
  input selector_MUX_115_reg_22_0_0_0;
  input selector_MUX_116_reg_23_0_0_0;
  input selector_MUX_121_reg_28_0_0_0;
  input selector_MUX_123_reg_3_0_0_0;
  input selector_MUX_124_reg_30_0_0_0;
  input selector_MUX_127_reg_6_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0;
  input selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0;
  input selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0;
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
  output OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888;
  output OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066;
  output OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068;
  output OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070;
  output OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076;
  output OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088;
  output OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090;
  output OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092;
  output OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094;
  output OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096;
  output OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958;
  output OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962;
  output OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038;
  output OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042;
  // Component and signal declarations
  wire [63:0] null_out_signal_BMEMORY_CTRLN_39_i0_out1_1;
  wire [63:0] out_BMEMORY_CTRLN_39_i0_BMEMORY_CTRLN_39_i0;
  wire [28:0] out_IUdata_converter_FU_22_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36977;
  wire [28:0] out_IUdata_converter_FU_26_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37020;
  wire [28:0] out_IUdata_converter_FU_32_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37054;
  wire [28:0] out_IUdata_converter_FU_9_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36936;
  wire [31:0] out_MUX_102_reg_10_0_0_0;
  wire [63:0] out_MUX_103_reg_11_0_0_0;
  wire [63:0] out_MUX_103_reg_11_0_0_1;
  wire [31:0] out_MUX_110_reg_18_0_0_0;
  wire [63:0] out_MUX_115_reg_22_0_0_0;
  wire [31:0] out_MUX_116_reg_23_0_0_0;
  wire [63:0] out_MUX_121_reg_28_0_0_0;
  wire [31:0] out_MUX_123_reg_3_0_0_0;
  wire [63:0] out_MUX_124_reg_30_0_0_0;
  wire [31:0] out_MUX_127_reg_6_0_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0;
  wire [63:0] out_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0;
  wire [63:0] out_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0;
  wire signed [1:0] out_UIdata_converter_FU_3_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_45941;
  wire [63:0] out___float_adde11m52b_1023nih_54_i0___float_adde11m52b_1023nih_54_i0;
  wire [63:0] out___float_mule11m52b_1023nih_55_i0___float_mule11m52b_1023nih_55_i0;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [7:0] out_const_2;
  wire [5:0] out_const_3;
  wire out_const_4;
  wire [1:0] out_const_5;
  wire [3:0] out_const_6;
  wire [4:0] out_const_7;
  wire [63:0] out_conv_out_const_0_1_64;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire [6:0] out_conv_out_const_2_8_7;
  wire out_extract_bit_expr_FU_15_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_46472;
  wire out_extract_bit_expr_FU_21_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_46475;
  wire out_extract_bit_expr_FU_2_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_46469;
  wire out_gt_expr_FU_32_32_32_40_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37074;
  wire signed [31:0] out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0;
  wire out_le_expr_FU_32_0_32_41_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43017;
  wire out_le_expr_FU_32_32_32_42_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43029;
  wire out_le_expr_FU_32_32_32_42_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43031;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_43_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_45945;
  wire out_lt_expr_FU_32_32_32_44_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37073;
  wire out_lt_expr_FU_32_32_32_44_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43019;
  wire out_lt_expr_FU_32_32_32_44_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43023;
  wire out_lt_expr_FU_32_32_32_44_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43025;
  wire out_lt_expr_FU_32_32_32_44_i4_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43027;
  wire out_lut_expr_FU_25_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37075;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_45_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36910;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_45_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36987;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_45_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37027;
  wire signed [31:0] out_negate_expr_FU_32_32_46_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36902;
  wire signed [31:0] out_plus_expr_FU_32_0_32_47_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36915;
  wire signed [31:0] out_plus_expr_FU_32_0_32_47_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36947;
  wire signed [31:0] out_plus_expr_FU_32_0_32_47_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36996;
  wire signed [31:0] out_plus_expr_FU_32_0_32_47_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37002;
  wire signed [31:0] out_plus_expr_FU_32_0_32_47_i4_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37062;
  wire signed [31:0] out_plus_expr_FU_32_0_32_48_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37072;
  wire signed [31:0] out_plus_expr_FU_32_32_32_49_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36939;
  wire signed [31:0] out_plus_expr_FU_32_32_32_49_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36980;
  wire signed [31:0] out_plus_expr_FU_32_32_32_49_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36984;
  wire signed [31:0] out_plus_expr_FU_32_32_32_49_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36990;
  wire signed [31:0] out_plus_expr_FU_32_32_32_49_i4_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37023;
  wire signed [31:0] out_plus_expr_FU_32_32_32_49_i5_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37030;
  wire signed [31:0] out_plus_expr_FU_32_32_32_49_i6_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37032;
  wire signed [31:0] out_plus_expr_FU_32_32_32_49_i7_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37057;
  wire signed [31:0] out_plus_expr_FU_32_32_32_49_i8_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43005;
  wire out_read_cond_FU_10_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37066;
  wire out_read_cond_FU_16_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37068;
  wire out_read_cond_FU_23_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37070;
  wire out_read_cond_FU_27_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37076;
  wire out_read_cond_FU_28_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37088;
  wire out_read_cond_FU_33_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37090;
  wire out_read_cond_FU_35_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37092;
  wire out_read_cond_FU_37_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37094;
  wire out_read_cond_FU_38_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37096;
  wire out_read_cond_FU_4_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36888;
  wire [30:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [63:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [31:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [31:0] out_reg_18_reg_18;
  wire out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [63:0] out_reg_20_reg_20;
  wire [63:0] out_reg_21_reg_21;
  wire [63:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire [31:0] out_reg_25_reg_25;
  wire out_reg_26_reg_26;
  wire [31:0] out_reg_27_reg_27;
  wire [63:0] out_reg_28_reg_28;
  wire out_reg_29_reg_29;
  wire [31:0] out_reg_2_reg_2;
  wire [63:0] out_reg_30_reg_30;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_50_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36887;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_51_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_45948;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_52_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36933;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_52_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36974;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_52_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37017;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_52_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37051;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_53_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36928;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_53_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36969;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_53_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37012;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_53_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37048;
  wire [63:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [63:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire s___float_adde11m52b_1023nih_54_i00;
  wire s___float_mule11m52b_1023nih_55_i01;
  wire s_done___float_adde11m52b_1023nih_54_i0;
  wire s_done___float_mule11m52b_1023nih_55_i0;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_39_i0 (.out1({null_out_signal_BMEMORY_CTRLN_39_i0_out1_1,
      out_BMEMORY_CTRLN_39_i0_BMEMORY_CTRLN_39_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0}),
    .in3({7'b0000000,
      out_conv_out_const_2_8_7}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_39_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_39_i0_STORE}),
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
    .BITSIZE_out1(32)) MUX_102_reg_10_0_0_0 (.out1(out_MUX_102_reg_10_0_0_0),
    .sel(selector_MUX_102_reg_10_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_plus_expr_FU_32_0_32_47_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36996));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_103_reg_11_0_0_0 (.out1(out_MUX_103_reg_11_0_0_0),
    .sel(selector_MUX_103_reg_11_0_0_0),
    .in1(out_reg_30_reg_30),
    .in2(out___float_adde11m52b_1023nih_54_i0___float_adde11m52b_1023nih_54_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_103_reg_11_0_0_1 (.out1(out_MUX_103_reg_11_0_0_1),
    .sel(selector_MUX_103_reg_11_0_0_1),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in2(out_MUX_103_reg_11_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_110_reg_18_0_0_0 (.out1(out_MUX_110_reg_18_0_0_0),
    .sel(selector_MUX_110_reg_18_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_plus_expr_FU_32_0_32_47_i4_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37062));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_115_reg_22_0_0_0 (.out1(out_MUX_115_reg_22_0_0_0),
    .sel(selector_MUX_115_reg_22_0_0_0),
    .in1(out_reg_11_reg_11),
    .in2(out___float_adde11m52b_1023nih_54_i0___float_adde11m52b_1023nih_54_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_116_reg_23_0_0_0 (.out1(out_MUX_116_reg_23_0_0_0),
    .sel(selector_MUX_116_reg_23_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_plus_expr_FU_32_0_32_47_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37002));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_121_reg_28_0_0_0 (.out1(out_MUX_121_reg_28_0_0_0),
    .sel(selector_MUX_121_reg_28_0_0_0),
    .in1(out_BMEMORY_CTRLN_39_i0_BMEMORY_CTRLN_39_i0),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_123_reg_3_0_0_0 (.out1(out_MUX_123_reg_3_0_0_0),
    .sel(selector_MUX_123_reg_3_0_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_124_reg_30_0_0_0 (.out1(out_MUX_124_reg_30_0_0_0),
    .sel(selector_MUX_124_reg_30_0_0_0),
    .in1(out___float_adde11m52b_1023nih_54_i0___float_adde11m52b_1023nih_54_i0),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_127_reg_6_0_0_0 (.out1(out_MUX_127_reg_6_0_0_0),
    .sel(selector_MUX_127_reg_6_0_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_39_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_53_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36928),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_53_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36969));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_39_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_53_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37012),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_53_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37048));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_39_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0 (.out1(out_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0),
    .sel(selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0),
    .in1(out_reg_22_reg_22),
    .in2(out_reg_11_reg_11));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0 (.out1(out_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0),
    .sel(selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0),
    .in1(out_reg_28_reg_28),
    .in2(out_conv_out_const_0_1_64));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_64));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_reg_30_reg_30));
  __float_adde11m52b_1023nih __float_adde11m52b_1023nih_54_i0 (.done_port(s_done___float_adde11m52b_1023nih_54_i0),
    .return_port(out___float_adde11m52b_1023nih_54_i0___float_adde11m52b_1023nih_54_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___float_adde11m52b_1023nih_54_i00),
    .a(out_reg_21_reg_21),
    .b(out_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0));
  __float_mule11m52b_1023nih __float_mule11m52b_1023nih_55_i0 (.done_port(s_done___float_mule11m52b_1023nih_55_i0),
    .return_port(out___float_mule11m52b_1023nih_55_i0___float_mule11m52b_1023nih_55_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___float_mule11m52b_1023nih_55_i01),
    .a(out_reg_20_reg_20),
    .b(out_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1110)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_7 (.out1(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) conv_out_const_0_1_64 (.out1(out_conv_out_const_0_1_64),
    .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_2_8_7 (.out1(out_conv_out_const_2_8_7),
    .in1(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36887 (.out1(out_rshift_expr_FU_32_0_32_50_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36887),
    .in1(out_plus_expr_FU_32_32_32_49_i8_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43005),
    .in2(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36888 (.out1(out_read_cond_FU_4_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36888),
    .in1(out_le_expr_FU_32_0_32_41_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43017));
  negate_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36902 (.out1(out_negate_expr_FU_32_32_46_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36902),
    .in1(out_reg_0_reg_0));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36910 (.out1(out_mult_expr_FU_32_32_32_0_45_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36910),
    .clock(clock),
    .in1(in_port_size),
    .in2(out_reg_3_reg_3));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36915 (.out1(out_plus_expr_FU_32_0_32_47_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36915),
    .in1(out_reg_3_reg_3),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36928 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_53_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36928),
    .in1(in_port_B),
    .in2(out_reg_8_reg_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36933 (.out1(out_ui_lshift_expr_FU_32_0_32_52_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36933),
    .in1(out_IUdata_converter_FU_9_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36936),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36936 (.out1(out_IUdata_converter_FU_9_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36936),
    .in1(out_plus_expr_FU_32_32_32_49_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36939));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36939 (.out1(out_plus_expr_FU_32_32_32_49_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36939),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_6_reg_6));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36947 (.out1(out_plus_expr_FU_32_0_32_47_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36947),
    .in1(out_reg_6_reg_6),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36969 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_53_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36969),
    .in1(in_port_kernel),
    .in2(out_reg_24_reg_24));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36974 (.out1(out_ui_lshift_expr_FU_32_0_32_52_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36974),
    .in1(out_IUdata_converter_FU_22_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36977),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36977 (.out1(out_IUdata_converter_FU_22_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36977),
    .in1(out_plus_expr_FU_32_32_32_49_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36980));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36980 (.out1(out_plus_expr_FU_32_32_32_49_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36980),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_23_reg_23));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36984 (.out1(out_plus_expr_FU_32_32_32_49_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36984),
    .in1(out_reg_15_reg_15),
    .in2(out_reg_0_reg_0));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36987 (.out1(out_mult_expr_FU_32_32_32_0_45_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36987),
    .clock(clock),
    .in1(out_reg_12_reg_12),
    .in2(in_port_kernel_size));
  plus_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36990 (.out1(out_plus_expr_FU_32_32_32_49_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36990),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_10_reg_10));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_36996 (.out1(out_plus_expr_FU_32_0_32_47_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36996),
    .in1(out_reg_10_reg_10),
    .in2(out_const_1));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37002 (.out1(out_plus_expr_FU_32_0_32_47_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37002),
    .in1(out_reg_23_reg_23),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37012 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_53_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37012),
    .in1(in_port_A),
    .in2(out_reg_27_reg_27));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37017 (.out1(out_ui_lshift_expr_FU_32_0_32_52_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37017),
    .in1(out_IUdata_converter_FU_26_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37020),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37020 (.out1(out_IUdata_converter_FU_26_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37020),
    .in1(out_plus_expr_FU_32_32_32_49_i4_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37023));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37023 (.out1(out_plus_expr_FU_32_32_32_49_i4_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37023),
    .in1(out_reg_16_reg_16),
    .in2(out_reg_25_reg_25));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37027 (.out1(out_mult_expr_FU_32_32_32_0_45_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37027),
    .clock(clock),
    .in1(out_reg_13_reg_13),
    .in2(in_port_size));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37030 (.out1(out_plus_expr_FU_32_32_32_49_i5_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37030),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_10_reg_10));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37032 (.out1(out_plus_expr_FU_32_32_32_49_i6_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37032),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_23_reg_23));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37048 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_53_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37048),
    .in1(in_port_kernel),
    .in2(out_ui_lshift_expr_FU_32_0_32_52_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37051));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37051 (.out1(out_ui_lshift_expr_FU_32_0_32_52_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37051),
    .in1(out_IUdata_converter_FU_32_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37054),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37054 (.out1(out_IUdata_converter_FU_32_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37054),
    .in1(out_plus_expr_FU_32_32_32_49_i7_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37057));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37057 (.out1(out_plus_expr_FU_32_32_32_49_i7_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37057),
    .in1(out_reg_18_reg_18),
    .in2(out_reg_17_reg_17));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37062 (.out1(out_plus_expr_FU_32_0_32_47_i4_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37062),
    .in1(out_reg_18_reg_18),
    .in2(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37066 (.out1(out_read_cond_FU_10_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37066),
    .in1(out_reg_7_reg_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37068 (.out1(out_read_cond_FU_16_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37068),
    .in1(out_reg_14_reg_14));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37070 (.out1(out_read_cond_FU_23_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37070),
    .in1(out_extract_bit_expr_FU_21_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_46475));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37072 (.out1(out_plus_expr_FU_32_0_32_48_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37072),
    .in1(in_port_size),
    .in2(out_const_4));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37073 (.out1(out_lt_expr_FU_32_32_32_44_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37073),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_25_reg_25));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37074 (.out1(out_gt_expr_FU_32_32_32_40_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37074),
    .in1(out_reg_13_reg_13),
    .in2(out_reg_1_reg_1));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37075 (.out1(out_lut_expr_FU_25_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37075),
    .in1(out_const_6),
    .in2(out_reg_26_reg_26),
    .in3(out_lt_expr_FU_32_32_32_44_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37073),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37076 (.out1(out_read_cond_FU_27_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37076),
    .in1(out_lut_expr_FU_25_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37075));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37088 (.out1(out_read_cond_FU_28_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37088),
    .in1(out_reg_29_reg_29));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37090 (.out1(out_read_cond_FU_33_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37090),
    .in1(out_reg_19_reg_19));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37092 (.out1(out_read_cond_FU_35_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37092),
    .in1(out_lt_expr_FU_32_32_32_44_i4_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43027));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37094 (.out1(out_read_cond_FU_37_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37094),
    .in1(out_le_expr_FU_32_32_32_42_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43029));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_37096 (.out1(out_read_cond_FU_38_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37096),
    .in1(out_le_expr_FU_32_32_32_42_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43031));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_43005 (.out1(out_plus_expr_FU_32_32_32_49_i8_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43005),
    .in1(in_port_kernel_size),
    .in2(out_rshift_expr_FU_32_0_32_51_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_45948));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_43017 (.out1(out_le_expr_FU_32_0_32_41_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43017),
    .in1(in_port_size),
    .in2(out_const_0));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_43019 (.out1(out_lt_expr_FU_32_32_32_44_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43019),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_2_reg_2));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_43023 (.out1(out_lt_expr_FU_32_32_32_44_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43023),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_23_reg_23));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_43025 (.out1(out_lt_expr_FU_32_32_32_44_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43025),
    .in1(out_reg_0_reg_0),
    .in2(out_plus_expr_FU_32_0_32_47_i4_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37062));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_43027 (.out1(out_lt_expr_FU_32_32_32_44_i4_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43027),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_10_reg_10));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_43029 (.out1(out_le_expr_FU_32_32_32_42_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43029),
    .in1(in_port_size),
    .in2(out_reg_9_reg_9));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_43031 (.out1(out_le_expr_FU_32_32_32_42_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43031),
    .in1(in_port_size),
    .in2(out_reg_4_reg_4));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_45941 (.out1(out_UIdata_converter_FU_3_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_45941),
    .in1(out_extract_bit_expr_FU_2_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_46469));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_45945 (.out1(out_lshift_expr_FU_32_0_32_43_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_45945),
    .in1(out_UIdata_converter_FU_3_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_45941),
    .in2(out_const_3));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_45948 (.out1(out_rshift_expr_FU_32_0_32_51_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_45948),
    .in1(out_lshift_expr_FU_32_0_32_43_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_45945),
    .in2(out_const_3));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_46469 (.out1(out_extract_bit_expr_FU_2_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_46469),
    .in1(in_port_kernel_size),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_46472 (.out1(out_extract_bit_expr_FU_15_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_46472),
    .in1(out_plus_expr_FU_32_32_32_49_i5_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37030),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu__Z18matrix_convolutionPKdPdS1_ii_36193_46475 (.out1(out_extract_bit_expr_FU_21_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_46475),
    .in1(out_plus_expr_FU_32_32_32_49_i6_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37032),
    .in2(out_const_7));
  or or_or___float_adde11m52b_1023nih_54_i00( s___float_adde11m52b_1023nih_54_i00, selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958, selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038);
  or or_or___float_mule11m52b_1023nih_55_i01( s___float_mule11m52b_1023nih_55_i01, selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962, selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042);
  register_SE #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_rshift_expr_FU_32_0_32_50_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36887),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_48_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37072),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_102_reg_10_0_0_0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_103_reg_11_0_0_1),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_49_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36990),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_49_i5_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37030),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_15_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_46472),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_45_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36987),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_45_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37027),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_49_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36984),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_110_reg_18_0_0_0),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_lt_expr_FU_32_32_32_44_i3_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43025),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_negate_expr_FU_32_32_46_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36902),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_39_i0_BMEMORY_CTRLN_39_i0),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out___float_mule11m52b_1023nih_55_i0___float_mule11m52b_1023nih_55_i0),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_115_reg_22_0_0_0),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_116_reg_23_0_0_0),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_52_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36974),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_49_i6_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37032),
    .wenable(wrenable_reg_25));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_gt_expr_FU_32_32_32_40_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37074),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_52_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37017),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_121_reg_28_0_0_0),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_lt_expr_FU_32_32_32_44_i2_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43023),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_123_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_124_reg_30_0_0_0),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_47_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36915),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_45_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36910),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_127_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_lt_expr_FU_32_32_32_44_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_43019),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_52_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36933),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_47_i1_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36947),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888 = out_read_cond_FU_4_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_36888;
  assign OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066 = out_read_cond_FU_10_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37066;
  assign OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068 = out_read_cond_FU_16_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37068;
  assign OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070 = out_read_cond_FU_23_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37070;
  assign OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076 = out_read_cond_FU_27_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37076;
  assign OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088 = out_read_cond_FU_28_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37088;
  assign OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090 = out_read_cond_FU_33_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37090;
  assign OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092 = out_read_cond_FU_35_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37092;
  assign OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094 = out_read_cond_FU_37_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37094;
  assign OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096 = out_read_cond_FU_38_i0_fu__Z18matrix_convolutionPKdPdS1_ii_36193_37096;
  assign OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958 = s_done___float_adde11m52b_1023nih_54_i0;
  assign OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962 = s_done___float_mule11m52b_1023nih_55_i0;
  assign OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038 = s_done___float_adde11m52b_1023nih_54_i0;
  assign OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042 = s_done___float_mule11m52b_1023nih_55_i0;

endmodule

// FSM based controller description for _Z18matrix_convolutionPKdPdS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z18matrix_convolutionPKdPdS1_ii(done_port,
  fuselector_BMEMORY_CTRLN_39_i0_LOAD,
  fuselector_BMEMORY_CTRLN_39_i0_STORE,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038,
  selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042,
  selector_MUX_102_reg_10_0_0_0,
  selector_MUX_103_reg_11_0_0_0,
  selector_MUX_103_reg_11_0_0_1,
  selector_MUX_110_reg_18_0_0_0,
  selector_MUX_115_reg_22_0_0_0,
  selector_MUX_116_reg_23_0_0_0,
  selector_MUX_121_reg_28_0_0_0,
  selector_MUX_123_reg_3_0_0_0,
  selector_MUX_124_reg_30_0_0_0,
  selector_MUX_127_reg_6_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0,
  selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0,
  selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0,
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
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094,
  OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096,
  OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958,
  OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962,
  OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038,
  OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888;
  input OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066;
  input OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068;
  input OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070;
  input OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076;
  input OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088;
  input OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090;
  input OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092;
  input OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094;
  input OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096;
  input OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958;
  input OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962;
  input OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038;
  input OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_39_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_39_i0_STORE;
  output selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958;
  output selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962;
  output selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038;
  output selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042;
  output selector_MUX_102_reg_10_0_0_0;
  output selector_MUX_103_reg_11_0_0_0;
  output selector_MUX_103_reg_11_0_0_1;
  output selector_MUX_110_reg_18_0_0_0;
  output selector_MUX_115_reg_22_0_0_0;
  output selector_MUX_116_reg_23_0_0_0;
  output selector_MUX_121_reg_28_0_0_0;
  output selector_MUX_123_reg_3_0_0_0;
  output selector_MUX_124_reg_30_0_0_0;
  output selector_MUX_127_reg_6_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0;
  output selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0;
  output selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0;
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
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [39:0] S_0 = 40'b0000000000000000000000000000000000000001,
    S_38 = 40'b0100000000000000000000000000000000000000,
    S_1 = 40'b0000000000000000000000000000000000000010,
    S_2 = 40'b0000000000000000000000000000000000000100,
    S_3 = 40'b0000000000000000000000000000000000001000,
    S_4 = 40'b0000000000000000000000000000000000010000,
    S_5 = 40'b0000000000000000000000000000000000100000,
    S_6 = 40'b0000000000000000000000000000000001000000,
    S_23 = 40'b0000000000000000100000000000000000000000,
    S_24 = 40'b0000000000000001000000000000000000000000,
    S_25 = 40'b0000000000000010000000000000000000000000,
    S_26 = 40'b0000000000000100000000000000000000000000,
    S_27 = 40'b0000000000001000000000000000000000000000,
    S_28 = 40'b0000000000010000000000000000000000000000,
    S_29 = 40'b0000000000100000000000000000000000000000,
    S_30 = 40'b0000000001000000000000000000000000000000,
    S_31 = 40'b0000000010000000000000000000000000000000,
    S_32 = 40'b0000000100000000000000000000000000000000,
    S_33 = 40'b0000001000000000000000000000000000000000,
    S_34 = 40'b0000010000000000000000000000000000000000,
    S_7 = 40'b0000000000000000000000000000000010000000,
    S_8 = 40'b0000000000000000000000000000000100000000,
    S_9 = 40'b0000000000000000000000000000001000000000,
    S_10 = 40'b0000000000000000000000000000010000000000,
    S_11 = 40'b0000000000000000000000000000100000000000,
    S_12 = 40'b0000000000000000000000000001000000000000,
    S_13 = 40'b0000000000000000000000000010000000000000,
    S_14 = 40'b0000000000000000000000000100000000000000,
    S_15 = 40'b0000000000000000000000001000000000000000,
    S_16 = 40'b0000000000000000000000010000000000000000,
    S_17 = 40'b0000000000000000000000100000000000000000,
    S_18 = 40'b0000000000000000000001000000000000000000,
    S_19 = 40'b0000000000000000000010000000000000000000,
    S_20 = 40'b0000000000000000000100000000000000000000,
    S_21 = 40'b0000000000000000001000000000000000000000,
    S_22 = 40'b0000000000000000010000000000000000000000,
    S_35 = 40'b0000100000000000000000000000000000000000,
    S_36 = 40'b0001000000000000000000000000000000000000,
    S_37 = 40'b0010000000000000000000000000000000000000,
    S_39 = 40'b1000000000000000000000000000000000000000;
  reg [39:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_39_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_39_i0_STORE;
  reg selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958;
  reg selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962;
  reg selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038;
  reg selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042;
  reg selector_MUX_102_reg_10_0_0_0;
  reg selector_MUX_103_reg_11_0_0_0;
  reg selector_MUX_103_reg_11_0_0_1;
  reg selector_MUX_110_reg_18_0_0_0;
  reg selector_MUX_115_reg_22_0_0_0;
  reg selector_MUX_116_reg_23_0_0_0;
  reg selector_MUX_121_reg_28_0_0_0;
  reg selector_MUX_123_reg_3_0_0_0;
  reg selector_MUX_124_reg_30_0_0_0;
  reg selector_MUX_127_reg_6_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0;
  reg selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0;
  reg selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0;
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
    fuselector_BMEMORY_CTRLN_39_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_39_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958 = 1'b0;
    selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962 = 1'b0;
    selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038 = 1'b0;
    selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042 = 1'b0;
    selector_MUX_102_reg_10_0_0_0 = 1'b0;
    selector_MUX_103_reg_11_0_0_0 = 1'b0;
    selector_MUX_103_reg_11_0_0_1 = 1'b0;
    selector_MUX_110_reg_18_0_0_0 = 1'b0;
    selector_MUX_115_reg_22_0_0_0 = 1'b0;
    selector_MUX_116_reg_23_0_0_0 = 1'b0;
    selector_MUX_121_reg_28_0_0_0 = 1'b0;
    selector_MUX_123_reg_3_0_0_0 = 1'b0;
    selector_MUX_124_reg_30_0_0_0 = 1'b0;
    selector_MUX_127_reg_6_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0 = 1'b0;
    selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0 = 1'b0;
    selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0 = 1'b0;
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
          if (OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_38;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_38 :
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
          selector_MUX_102_reg_10_0_0_0 = 1'b1;
          selector_MUX_103_reg_11_0_0_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066 == 1'b1)
            begin
              _next_state = S_36;
              selector_MUX_102_reg_10_0_0_0 = 1'b0;
              selector_MUX_103_reg_11_0_0_1 = 1'b0;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_11 = 1'b0;
            end
          else
            begin
              _next_state = S_4;
              wrenable_reg_30 = 1'b0;
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
          selector_MUX_110_reg_18_0_0_0 = 1'b1;
          selector_MUX_115_reg_22_0_0_0 = 1'b1;
          selector_MUX_116_reg_23_0_0_0 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068 == 1'b0)
            begin
              _next_state = S_7;
              selector_MUX_110_reg_18_0_0_0 = 1'b0;
              wrenable_reg_18 = 1'b0;
            end
          else
            begin
              _next_state = S_23;
              selector_MUX_115_reg_22_0_0_0 = 1'b0;
              selector_MUX_116_reg_23_0_0_0 = 1'b0;
              wrenable_reg_22 = 1'b0;
              wrenable_reg_23 = 1'b0;
            end
        end
      S_23 :
        begin
          fuselector_BMEMORY_CTRLN_39_i0_LOAD = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          _next_state = S_24;
        end
      S_24 :
        begin
          wrenable_reg_20 = 1'b1;
          _next_state = S_25;
        end
      S_25 :
        begin
          selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042 = 1'b1;
          _next_state = S_26;
        end
      S_26 :
        begin
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
          wrenable_reg_21 = 1'b1;
          _next_state = S_30;
        end
      S_30 :
        begin
          selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038 = 1'b1;
          _next_state = S_31;
        end
      S_31 :
        begin
          _next_state = S_32;
        end
      S_32 :
        begin
          _next_state = S_33;
        end
      S_33 :
        begin
          _next_state = S_34;
        end
      S_34 :
        begin
          selector_MUX_124_reg_30_0_0_0 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_30 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090 == 1'b1)
            begin
              _next_state = S_35;
              wrenable_reg_11 = 1'b0;
            end
          else
            begin
              _next_state = S_23;
              selector_MUX_124_reg_30_0_0_0 = 1'b0;
              wrenable_reg_30 = 1'b0;
            end
        end
      S_7 :
        begin
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_28 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070 == 1'b1)
            begin
              _next_state = S_11;
              wrenable_reg_25 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else
            begin
              _next_state = S_8;
              wrenable_reg_28 = 1'b0;
            end
        end
      S_8 :
        begin
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076 == 1'b1)
            begin
              _next_state = S_11;
              wrenable_reg_27 = 1'b0;
            end
          else
            begin
              _next_state = S_9;
              wrenable_reg_28 = 1'b0;
            end
        end
      S_9 :
        begin
          fuselector_BMEMORY_CTRLN_39_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          selector_MUX_121_reg_28_0_0_0 = 1'b1;
          wrenable_reg_28 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          fuselector_BMEMORY_CTRLN_39_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0 = 1'b1;
          wrenable_reg_29 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          wrenable_reg_20 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962 = 1'b1;
          selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0 = 1'b1;
          _next_state = S_14;
        end
      S_14 :
        begin
          selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0 = 1'b1;
          _next_state = S_16;
        end
      S_16 :
        begin
          selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0 = 1'b1;
          _next_state = S_17;
        end
      S_17 :
        begin
          selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0 = 1'b1;
          wrenable_reg_21 = 1'b1;
          _next_state = S_18;
        end
      S_18 :
        begin
          selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958 = 1'b1;
          selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0 = 1'b1;
          _next_state = S_19;
        end
      S_19 :
        begin
          selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0 = 1'b1;
          _next_state = S_20;
        end
      S_20 :
        begin
          selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0 = 1'b1;
          _next_state = S_21;
        end
      S_21 :
        begin
          selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0 = 1'b1;
          _next_state = S_22;
        end
      S_22 :
        begin
          selector_MUX_124_reg_30_0_0_0 = 1'b1;
          selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_30 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088 == 1'b1)
            begin
              _next_state = S_35;
              wrenable_reg_22 = 1'b0;
            end
          else
            begin
              _next_state = S_7;
              selector_MUX_124_reg_30_0_0_0 = 1'b0;
              wrenable_reg_30 = 1'b0;
            end
        end
      S_35 :
        begin
          selector_MUX_103_reg_11_0_0_0 = 1'b1;
          wrenable_reg_11 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092 == 1'b1)
            begin
              _next_state = S_36;
              selector_MUX_103_reg_11_0_0_0 = 1'b0;
              wrenable_reg_11 = 1'b0;
            end
          else
            begin
              _next_state = S_4;
            end
        end
      S_36 :
        begin
          fuselector_BMEMORY_CTRLN_39_i0_STORE = 1'b1;
          selector_MUX_127_reg_6_0_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094 == 1'b1)
            begin
              _next_state = S_37;
              selector_MUX_127_reg_6_0_0_0 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_37 :
        begin
          selector_MUX_123_reg_3_0_0_0 = 1'b1;
          wrenable_reg_3 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_39;
              done_port = 1'b1;
              selector_MUX_123_reg_3_0_0_0 = 1'b0;
              wrenable_reg_3 = 1'b0;
            end
        end
      S_39 :
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

// Top component for _Z18matrix_convolutionPKdPdS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __Z18matrix_convolutionPKdPdS1_ii(clock,
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
  wire OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888;
  wire OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066;
  wire OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068;
  wire OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070;
  wire OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076;
  wire OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088;
  wire OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090;
  wire OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092;
  wire OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094;
  wire OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096;
  wire OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958;
  wire OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962;
  wire OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038;
  wire OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_39_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_39_i0_STORE;
  wire selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958;
  wire selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962;
  wire selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038;
  wire selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042;
  wire selector_MUX_102_reg_10_0_0_0;
  wire selector_MUX_103_reg_11_0_0_0;
  wire selector_MUX_103_reg_11_0_0_1;
  wire selector_MUX_110_reg_18_0_0_0;
  wire selector_MUX_115_reg_22_0_0_0;
  wire selector_MUX_116_reg_23_0_0_0;
  wire selector_MUX_121_reg_28_0_0_0;
  wire selector_MUX_123_reg_3_0_0_0;
  wire selector_MUX_124_reg_30_0_0_0;
  wire selector_MUX_127_reg_6_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0;
  wire selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0;
  wire selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0;
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
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller__Z18matrix_convolutionPKdPdS1_ii Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_39_i0_LOAD(fuselector_BMEMORY_CTRLN_39_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_39_i0_STORE(fuselector_BMEMORY_CTRLN_39_i0_STORE),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958(selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962(selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038(selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042(selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042),
    .selector_MUX_102_reg_10_0_0_0(selector_MUX_102_reg_10_0_0_0),
    .selector_MUX_103_reg_11_0_0_0(selector_MUX_103_reg_11_0_0_0),
    .selector_MUX_103_reg_11_0_0_1(selector_MUX_103_reg_11_0_0_1),
    .selector_MUX_110_reg_18_0_0_0(selector_MUX_110_reg_18_0_0_0),
    .selector_MUX_115_reg_22_0_0_0(selector_MUX_115_reg_22_0_0_0),
    .selector_MUX_116_reg_23_0_0_0(selector_MUX_116_reg_23_0_0_0),
    .selector_MUX_121_reg_28_0_0_0(selector_MUX_121_reg_28_0_0_0),
    .selector_MUX_123_reg_3_0_0_0(selector_MUX_123_reg_3_0_0_0),
    .selector_MUX_124_reg_30_0_0_0(selector_MUX_124_reg_30_0_0_0),
    .selector_MUX_127_reg_6_0_0_0(selector_MUX_127_reg_6_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0),
    .selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0(selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0),
    .selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0(selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0),
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
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958(OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962(OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038(OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042(OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z18matrix_convolutionPKdPdS1_ii Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_36888),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37066),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37068),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37070),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37076),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37088),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37090),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37092),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37094),
    .OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096(OUT_CONDITION__Z18matrix_convolutionPKdPdS1_ii_36193_37096),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958(OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962(OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038(OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038),
    .OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042(OUT_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042),
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
    .fuselector_BMEMORY_CTRLN_39_i0_LOAD(fuselector_BMEMORY_CTRLN_39_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_39_i0_STORE(fuselector_BMEMORY_CTRLN_39_i0_STORE),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958(selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36958),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962(selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_36962),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038(selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37038),
    .selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042(selector_IN_UNBOUNDED__Z18matrix_convolutionPKdPdS1_ii_36193_37042),
    .selector_MUX_102_reg_10_0_0_0(selector_MUX_102_reg_10_0_0_0),
    .selector_MUX_103_reg_11_0_0_0(selector_MUX_103_reg_11_0_0_0),
    .selector_MUX_103_reg_11_0_0_1(selector_MUX_103_reg_11_0_0_1),
    .selector_MUX_110_reg_18_0_0_0(selector_MUX_110_reg_18_0_0_0),
    .selector_MUX_115_reg_22_0_0_0(selector_MUX_115_reg_22_0_0_0),
    .selector_MUX_116_reg_23_0_0_0(selector_MUX_116_reg_23_0_0_0),
    .selector_MUX_121_reg_28_0_0_0(selector_MUX_121_reg_28_0_0_0),
    .selector_MUX_123_reg_3_0_0_0(selector_MUX_123_reg_3_0_0_0),
    .selector_MUX_124_reg_30_0_0_0(selector_MUX_124_reg_30_0_0_0),
    .selector_MUX_127_reg_6_0_0_0(selector_MUX_127_reg_6_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_39_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_39_i0_1_1_0),
    .selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0(selector_MUX_20___float_adde11m52b_1023nih_54_i0_1_0_0),
    .selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0(selector_MUX_22___float_mule11m52b_1023nih_55_i0_1_0_0),
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

// Minimal interface for function: _Z18matrix_convolutionPKdPdS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _Z18matrix_convolutionPKdPdS1_ii(clock,
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
  
  __Z18matrix_convolutionPKdPdS1_ii __Z18matrix_convolutionPKdPdS1_ii_i0 (.done_port(done_port),
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
    .Min_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Min_data_ram_size({7'b0000000,
      7'b0000000}));

endmodule


