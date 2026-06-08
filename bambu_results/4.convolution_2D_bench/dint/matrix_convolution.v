// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-04-16T20:25:04
// Bambu executed with: bambu --top-fname=matrix_convolution -DINT cpu_functions.cpp 
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

// Datapath RTL description for _Z18matrix_convolutionPKiPiS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath__Z18matrix_convolutionPKiPiS1_ii(clock,
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
  fuselector_BMEMORY_CTRLN_34_i0_LOAD,
  fuselector_BMEMORY_CTRLN_34_i0_STORE,
  selector_MUX_102_reg_18_0_0_0,
  selector_MUX_108_reg_23_0_0_0,
  selector_MUX_112_reg_27_0_0_0,
  selector_MUX_112_reg_27_0_0_1,
  selector_MUX_113_reg_3_0_0_0,
  selector_MUX_116_reg_6_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1,
  selector_MUX_94_reg_10_0_0_0,
  selector_MUX_94_reg_10_0_0_1,
  selector_MUX_95_reg_11_0_0_0,
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
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065);
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
  input fuselector_BMEMORY_CTRLN_34_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_34_i0_STORE;
  input selector_MUX_102_reg_18_0_0_0;
  input selector_MUX_108_reg_23_0_0_0;
  input selector_MUX_112_reg_27_0_0_0;
  input selector_MUX_112_reg_27_0_0_1;
  input selector_MUX_113_reg_3_0_0_0;
  input selector_MUX_116_reg_6_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1;
  input selector_MUX_94_reg_10_0_0_0;
  input selector_MUX_94_reg_10_0_0_1;
  input selector_MUX_95_reg_11_0_0_0;
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
  output OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890;
  output OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037;
  output OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039;
  output OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041;
  output OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047;
  output OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059;
  output OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061;
  output OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063;
  output OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065;
  // Component and signal declarations
  wire [31:0] null_out_signal_BMEMORY_CTRLN_34_i0_out1_1;
  wire [31:0] out_BMEMORY_CTRLN_34_i0_BMEMORY_CTRLN_34_i0;
  wire [29:0] out_IUdata_converter_FU_22_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36978;
  wire [29:0] out_IUdata_converter_FU_26_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37020;
  wire [29:0] out_IUdata_converter_FU_9_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36938;
  wire [31:0] out_MUX_102_reg_18_0_0_0;
  wire [31:0] out_MUX_108_reg_23_0_0_0;
  wire [31:0] out_MUX_112_reg_27_0_0_0;
  wire [31:0] out_MUX_112_reg_27_0_0_1;
  wire [31:0] out_MUX_113_reg_3_0_0_0;
  wire [31:0] out_MUX_116_reg_6_0_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1;
  wire [31:0] out_MUX_94_reg_10_0_0_0;
  wire [31:0] out_MUX_94_reg_10_0_0_1;
  wire [31:0] out_MUX_95_reg_11_0_0_0;
  wire signed [1:0] out_UIdata_converter_FU_3_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43018;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [6:0] out_const_2;
  wire [5:0] out_const_3;
  wire out_const_4;
  wire [1:0] out_const_5;
  wire [3:0] out_const_6;
  wire [4:0] out_const_7;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire [5:0] out_conv_out_const_2_7_6;
  wire out_extract_bit_expr_FU_15_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43041;
  wire out_extract_bit_expr_FU_21_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43044;
  wire out_extract_bit_expr_FU_2_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43038;
  wire out_gt_expr_FU_32_32_32_35_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37045;
  wire signed [31:0] out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0;
  wire [31:0] out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_1;
  wire out_le_expr_FU_32_0_32_36_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42980;
  wire out_le_expr_FU_32_32_32_37_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42990;
  wire out_le_expr_FU_32_32_32_37_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42992;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_38_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43022;
  wire out_lt_expr_FU_32_32_32_39_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37044;
  wire out_lt_expr_FU_32_32_32_39_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42982;
  wire out_lt_expr_FU_32_32_32_39_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42986;
  wire out_lt_expr_FU_32_32_32_39_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42988;
  wire out_lut_expr_FU_25_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37046;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_40_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36912;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_40_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36963;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_40_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36988;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_40_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37027;
  wire signed [31:0] out_negate_expr_FU_32_32_41_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36904;
  wire signed [31:0] out_plus_expr_FU_32_0_32_42_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36917;
  wire signed [31:0] out_plus_expr_FU_32_0_32_42_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36949;
  wire signed [31:0] out_plus_expr_FU_32_0_32_42_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36997;
  wire signed [31:0] out_plus_expr_FU_32_0_32_42_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37003;
  wire signed [31:0] out_plus_expr_FU_32_0_32_43_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37043;
  wire signed [31:0] out_plus_expr_FU_32_32_32_44_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36941;
  wire signed [31:0] out_plus_expr_FU_32_32_32_44_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36959;
  wire signed [31:0] out_plus_expr_FU_32_32_32_44_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36981;
  wire signed [31:0] out_plus_expr_FU_32_32_32_44_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36985;
  wire signed [31:0] out_plus_expr_FU_32_32_32_44_i4_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36991;
  wire signed [31:0] out_plus_expr_FU_32_32_32_44_i5_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37023;
  wire signed [31:0] out_plus_expr_FU_32_32_32_44_i6_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37030;
  wire signed [31:0] out_plus_expr_FU_32_32_32_44_i7_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37032;
  wire signed [31:0] out_plus_expr_FU_32_32_32_44_i8_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42969;
  wire out_read_cond_FU_10_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37037;
  wire out_read_cond_FU_16_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37039;
  wire out_read_cond_FU_23_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37041;
  wire out_read_cond_FU_27_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37047;
  wire out_read_cond_FU_28_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37059;
  wire out_read_cond_FU_30_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37061;
  wire out_read_cond_FU_32_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37063;
  wire out_read_cond_FU_33_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37065;
  wire out_read_cond_FU_4_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36890;
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
  wire [31:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire out_reg_21_reg_21;
  wire [31:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire out_reg_24_reg_24;
  wire [31:0] out_reg_25_reg_25;
  wire [31:0] out_reg_26_reg_26;
  wire [31:0] out_reg_27_reg_27;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_45_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36889;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_46_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43025;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_47_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36935;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_47_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36975;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_47_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37017;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_48_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36930;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_48_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36970;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_48_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37012;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_34_i0 (.out1({null_out_signal_BMEMORY_CTRLN_34_i0_out1_1,
      out_BMEMORY_CTRLN_34_i0_BMEMORY_CTRLN_34_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_1}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1}),
    .in3({6'b000000,
      out_conv_out_const_2_7_6}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_34_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_34_i0_STORE}),
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
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_1 (.out1(out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_1),
    .in1(out_reg_27_reg_27));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_102_reg_18_0_0_0 (.out1(out_MUX_102_reg_18_0_0_0),
    .sel(selector_MUX_102_reg_18_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_plus_expr_FU_32_0_32_42_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37003));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_108_reg_23_0_0_0 (.out1(out_MUX_108_reg_23_0_0_0),
    .sel(selector_MUX_108_reg_23_0_0_0),
    .in1(out_BMEMORY_CTRLN_34_i0_BMEMORY_CTRLN_34_i0),
    .in2(out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_112_reg_27_0_0_0 (.out1(out_MUX_112_reg_27_0_0_0),
    .sel(selector_MUX_112_reg_27_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_112_reg_27_0_0_1 (.out1(out_MUX_112_reg_27_0_0_1),
    .sel(selector_MUX_112_reg_27_0_0_1),
    .in1(out_plus_expr_FU_32_32_32_44_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36959),
    .in2(out_MUX_112_reg_27_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_113_reg_3_0_0_0 (.out1(out_MUX_113_reg_3_0_0_0),
    .sel(selector_MUX_113_reg_3_0_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_116_reg_6_0_0_0 (.out1(out_MUX_116_reg_6_0_0_0),
    .sel(selector_MUX_116_reg_6_0_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_34_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_48_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36930),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_48_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36970));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_34_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_48_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37012),
    .in2(out_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_94_reg_10_0_0_0 (.out1(out_MUX_94_reg_10_0_0_0),
    .sel(selector_MUX_94_reg_10_0_0_0),
    .in1(out_reg_27_reg_27),
    .in2(out_ii_conv_conn_obj_0_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_94_reg_10_0_0_1 (.out1(out_MUX_94_reg_10_0_0_1),
    .sel(selector_MUX_94_reg_10_0_0_1),
    .in1(out_plus_expr_FU_32_32_32_44_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36959),
    .in2(out_MUX_94_reg_10_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_95_reg_11_0_0_0 (.out1(out_MUX_95_reg_11_0_0_0),
    .sel(selector_MUX_95_reg_11_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_plus_expr_FU_32_0_32_42_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36997));
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
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_2_7_6 (.out1(out_conv_out_const_2_7_6),
    .in1(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36889 (.out1(out_rshift_expr_FU_32_0_32_45_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36889),
    .in1(out_plus_expr_FU_32_32_32_44_i8_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42969),
    .in2(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36890 (.out1(out_read_cond_FU_4_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36890),
    .in1(out_le_expr_FU_32_0_32_36_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42980));
  negate_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36904 (.out1(out_negate_expr_FU_32_32_41_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36904),
    .in1(out_reg_0_reg_0));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36912 (.out1(out_mult_expr_FU_32_32_32_0_40_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36912),
    .clock(clock),
    .in1(in_port_size),
    .in2(out_reg_3_reg_3));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36917 (.out1(out_plus_expr_FU_32_0_32_42_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36917),
    .in1(out_reg_3_reg_3),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36930 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_48_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36930),
    .in1(in_port_B),
    .in2(out_reg_8_reg_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36935 (.out1(out_ui_lshift_expr_FU_32_0_32_47_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36935),
    .in1(out_IUdata_converter_FU_9_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36938),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36938 (.out1(out_IUdata_converter_FU_9_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36938),
    .in1(out_plus_expr_FU_32_32_32_44_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36941));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36941 (.out1(out_plus_expr_FU_32_32_32_44_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36941),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_6_reg_6));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36949 (.out1(out_plus_expr_FU_32_0_32_42_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36949),
    .in1(out_reg_6_reg_6),
    .in2(out_const_1));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36959 (.out1(out_plus_expr_FU_32_32_32_44_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36959),
    .in1(out_reg_26_reg_26),
    .in2(out_reg_10_reg_10));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36963 (.out1(out_mult_expr_FU_32_32_32_0_40_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36963),
    .clock(clock),
    .in1(out_reg_25_reg_25),
    .in2(out_reg_23_reg_23));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36970 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_48_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36970),
    .in1(in_port_kernel),
    .in2(out_reg_19_reg_19));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36975 (.out1(out_ui_lshift_expr_FU_32_0_32_47_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36975),
    .in1(out_IUdata_converter_FU_22_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36978),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36978 (.out1(out_IUdata_converter_FU_22_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36978),
    .in1(out_plus_expr_FU_32_32_32_44_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36981));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36981 (.out1(out_plus_expr_FU_32_32_32_44_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36981),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_18_reg_18));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36985 (.out1(out_plus_expr_FU_32_32_32_44_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36985),
    .in1(out_reg_15_reg_15),
    .in2(out_reg_0_reg_0));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36988 (.out1(out_mult_expr_FU_32_32_32_0_40_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36988),
    .clock(clock),
    .in1(out_reg_12_reg_12),
    .in2(in_port_kernel_size));
  plus_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36991 (.out1(out_plus_expr_FU_32_32_32_44_i4_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36991),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_11_reg_11));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_36997 (.out1(out_plus_expr_FU_32_0_32_42_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36997),
    .in1(out_reg_11_reg_11),
    .in2(out_const_1));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37003 (.out1(out_plus_expr_FU_32_0_32_42_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37003),
    .in1(out_reg_18_reg_18),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37012 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_48_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37012),
    .in1(in_port_A),
    .in2(out_reg_22_reg_22));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37017 (.out1(out_ui_lshift_expr_FU_32_0_32_47_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37017),
    .in1(out_IUdata_converter_FU_26_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37020),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37020 (.out1(out_IUdata_converter_FU_26_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37020),
    .in1(out_plus_expr_FU_32_32_32_44_i5_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37023));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37023 (.out1(out_plus_expr_FU_32_32_32_44_i5_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37023),
    .in1(out_reg_16_reg_16),
    .in2(out_reg_20_reg_20));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37027 (.out1(out_mult_expr_FU_32_32_32_0_40_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37027),
    .clock(clock),
    .in1(out_reg_13_reg_13),
    .in2(in_port_size));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37030 (.out1(out_plus_expr_FU_32_32_32_44_i6_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37030),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_11_reg_11));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37032 (.out1(out_plus_expr_FU_32_32_32_44_i7_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37032),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_18_reg_18));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37037 (.out1(out_read_cond_FU_10_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37037),
    .in1(out_reg_7_reg_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37039 (.out1(out_read_cond_FU_16_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37039),
    .in1(out_reg_14_reg_14));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37041 (.out1(out_read_cond_FU_23_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37041),
    .in1(out_extract_bit_expr_FU_21_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43044));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37043 (.out1(out_plus_expr_FU_32_0_32_43_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37043),
    .in1(in_port_size),
    .in2(out_const_4));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37044 (.out1(out_lt_expr_FU_32_32_32_39_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37044),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_20_reg_20));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37045 (.out1(out_gt_expr_FU_32_32_32_35_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37045),
    .in1(out_reg_13_reg_13),
    .in2(out_reg_1_reg_1));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37046 (.out1(out_lut_expr_FU_25_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37046),
    .in1(out_const_6),
    .in2(out_reg_21_reg_21),
    .in3(out_lt_expr_FU_32_32_32_39_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37044),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37047 (.out1(out_read_cond_FU_27_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37047),
    .in1(out_lut_expr_FU_25_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37046));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37059 (.out1(out_read_cond_FU_28_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37059),
    .in1(out_reg_24_reg_24));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37061 (.out1(out_read_cond_FU_30_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37061),
    .in1(out_lt_expr_FU_32_32_32_39_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42988));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37063 (.out1(out_read_cond_FU_32_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37063),
    .in1(out_le_expr_FU_32_32_32_37_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42990));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_37065 (.out1(out_read_cond_FU_33_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37065),
    .in1(out_le_expr_FU_32_32_32_37_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42992));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_42969 (.out1(out_plus_expr_FU_32_32_32_44_i8_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42969),
    .in1(in_port_kernel_size),
    .in2(out_rshift_expr_FU_32_0_32_46_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43025));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_42980 (.out1(out_le_expr_FU_32_0_32_36_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42980),
    .in1(in_port_size),
    .in2(out_const_0));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_42982 (.out1(out_lt_expr_FU_32_32_32_39_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42982),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_2_reg_2));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_42986 (.out1(out_lt_expr_FU_32_32_32_39_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42986),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_18_reg_18));
  lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_42988 (.out1(out_lt_expr_FU_32_32_32_39_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42988),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_11_reg_11));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_42990 (.out1(out_le_expr_FU_32_32_32_37_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42990),
    .in1(in_port_size),
    .in2(out_reg_9_reg_9));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_42992 (.out1(out_le_expr_FU_32_32_32_37_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42992),
    .in1(in_port_size),
    .in2(out_reg_4_reg_4));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_43018 (.out1(out_UIdata_converter_FU_3_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43018),
    .in1(out_extract_bit_expr_FU_2_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43038));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_43022 (.out1(out_lshift_expr_FU_32_0_32_38_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43022),
    .in1(out_UIdata_converter_FU_3_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43018),
    .in2(out_const_3));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_43025 (.out1(out_rshift_expr_FU_32_0_32_46_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43025),
    .in1(out_lshift_expr_FU_32_0_32_38_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43022),
    .in2(out_const_3));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_43038 (.out1(out_extract_bit_expr_FU_2_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43038),
    .in1(in_port_kernel_size),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_43041 (.out1(out_extract_bit_expr_FU_15_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43041),
    .in1(out_plus_expr_FU_32_32_32_44_i6_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37030),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu__Z18matrix_convolutionPKiPiS1_ii_35461_43044 (.out1(out_extract_bit_expr_FU_21_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43044),
    .in1(out_plus_expr_FU_32_32_32_44_i7_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37032),
    .in2(out_const_7));
  register_SE #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_rshift_expr_FU_32_0_32_45_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36889),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_43_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37043),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_94_reg_10_0_0_1),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_95_reg_11_0_0_0),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_44_i4_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36991),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_44_i6_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37030),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_15_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_43041),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_40_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36988),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_40_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37027),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_44_i3_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36985),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_102_reg_18_0_0_0),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_47_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36975),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_negate_expr_FU_32_32_41_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36904),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_44_i7_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37032),
    .wenable(wrenable_reg_20));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_gt_expr_FU_32_32_32_35_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37045),
    .wenable(wrenable_reg_21));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_47_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37017),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_108_reg_23_0_0_0),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_lt_expr_FU_32_32_32_39_i2_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42986),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_34_i0_BMEMORY_CTRLN_34_i0),
    .wenable(wrenable_reg_25));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_40_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36963),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_112_reg_27_0_0_1),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_113_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_42_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36917),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_40_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36912),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_116_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_lt_expr_FU_32_32_32_39_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_42982),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_47_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36935),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_42_i1_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36949),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890 = out_read_cond_FU_4_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_36890;
  assign OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037 = out_read_cond_FU_10_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37037;
  assign OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039 = out_read_cond_FU_16_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37039;
  assign OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041 = out_read_cond_FU_23_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37041;
  assign OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047 = out_read_cond_FU_27_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37047;
  assign OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059 = out_read_cond_FU_28_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37059;
  assign OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061 = out_read_cond_FU_30_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37061;
  assign OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063 = out_read_cond_FU_32_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37063;
  assign OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065 = out_read_cond_FU_33_i0_fu__Z18matrix_convolutionPKiPiS1_ii_35461_37065;

endmodule

// FSM based controller description for _Z18matrix_convolutionPKiPiS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z18matrix_convolutionPKiPiS1_ii(done_port,
  fuselector_BMEMORY_CTRLN_34_i0_LOAD,
  fuselector_BMEMORY_CTRLN_34_i0_STORE,
  selector_MUX_102_reg_18_0_0_0,
  selector_MUX_108_reg_23_0_0_0,
  selector_MUX_112_reg_27_0_0_0,
  selector_MUX_112_reg_27_0_0_1,
  selector_MUX_113_reg_3_0_0_0,
  selector_MUX_116_reg_6_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1,
  selector_MUX_94_reg_10_0_0_0,
  selector_MUX_94_reg_10_0_0_1,
  selector_MUX_95_reg_11_0_0_0,
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
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063,
  OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890;
  input OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037;
  input OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039;
  input OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041;
  input OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047;
  input OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059;
  input OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061;
  input OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063;
  input OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_34_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_34_i0_STORE;
  output selector_MUX_102_reg_18_0_0_0;
  output selector_MUX_108_reg_23_0_0_0;
  output selector_MUX_112_reg_27_0_0_0;
  output selector_MUX_112_reg_27_0_0_1;
  output selector_MUX_113_reg_3_0_0_0;
  output selector_MUX_116_reg_6_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1;
  output selector_MUX_94_reg_10_0_0_0;
  output selector_MUX_94_reg_10_0_0_1;
  output selector_MUX_95_reg_11_0_0_0;
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
    S_4 = 20'b00000000000000010000,
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
    S_19 = 20'b10000000000000000000;
  reg [19:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_34_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_34_i0_STORE;
  reg selector_MUX_102_reg_18_0_0_0;
  reg selector_MUX_108_reg_23_0_0_0;
  reg selector_MUX_112_reg_27_0_0_0;
  reg selector_MUX_112_reg_27_0_0_1;
  reg selector_MUX_113_reg_3_0_0_0;
  reg selector_MUX_116_reg_6_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1;
  reg selector_MUX_94_reg_10_0_0_0;
  reg selector_MUX_94_reg_10_0_0_1;
  reg selector_MUX_95_reg_11_0_0_0;
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
    fuselector_BMEMORY_CTRLN_34_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_34_i0_STORE = 1'b0;
    selector_MUX_102_reg_18_0_0_0 = 1'b0;
    selector_MUX_108_reg_23_0_0_0 = 1'b0;
    selector_MUX_112_reg_27_0_0_0 = 1'b0;
    selector_MUX_112_reg_27_0_0_1 = 1'b0;
    selector_MUX_113_reg_3_0_0_0 = 1'b0;
    selector_MUX_116_reg_6_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1 = 1'b0;
    selector_MUX_94_reg_10_0_0_0 = 1'b0;
    selector_MUX_94_reg_10_0_0_1 = 1'b0;
    selector_MUX_95_reg_11_0_0_0 = 1'b0;
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
          if (OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_18;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
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
          selector_MUX_95_reg_11_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037 == 1'b1)
            begin
              _next_state = S_16;
              selector_MUX_95_reg_11_0_0_0 = 1'b0;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_11 = 1'b0;
            end
          else
            begin
              _next_state = S_4;
              wrenable_reg_27 = 1'b0;
            end
        end
      S_4 :
        begin
          wrenable_reg_11 = 1'b1;
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
          selector_MUX_102_reg_18_0_0_0 = 1'b1;
          selector_MUX_112_reg_27_0_0_0 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_27 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039 == 1'b0)
            begin
              _next_state = S_7;
              selector_MUX_112_reg_27_0_0_0 = 1'b0;
              wrenable_reg_27 = 1'b0;
            end
          else
            begin
              _next_state = S_15;
              selector_MUX_102_reg_18_0_0_0 = 1'b0;
              wrenable_reg_17 = 1'b0;
              wrenable_reg_18 = 1'b0;
            end
        end
      S_7 :
        begin
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_23 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041 == 1'b1)
            begin
              _next_state = S_11;
              wrenable_reg_20 = 1'b0;
              wrenable_reg_21 = 1'b0;
            end
          else
            begin
              _next_state = S_8;
              wrenable_reg_23 = 1'b0;
            end
        end
      S_8 :
        begin
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047 == 1'b1)
            begin
              _next_state = S_11;
              wrenable_reg_22 = 1'b0;
            end
          else
            begin
              _next_state = S_9;
              wrenable_reg_23 = 1'b0;
            end
        end
      S_9 :
        begin
          fuselector_BMEMORY_CTRLN_34_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          selector_MUX_108_reg_23_0_0_0 = 1'b1;
          wrenable_reg_23 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          fuselector_BMEMORY_CTRLN_34_i0_LOAD = 1'b1;
          wrenable_reg_24 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          wrenable_reg_25 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          wrenable_reg_26 = 1'b1;
          _next_state = S_14;
        end
      S_14 :
        begin
          selector_MUX_112_reg_27_0_0_1 = 1'b1;
          selector_MUX_94_reg_10_0_0_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_27 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059 == 1'b1)
            begin
              _next_state = S_15;
              selector_MUX_94_reg_10_0_0_1 = 1'b0;
              wrenable_reg_10 = 1'b0;
            end
          else
            begin
              _next_state = S_7;
              selector_MUX_112_reg_27_0_0_1 = 1'b0;
              wrenable_reg_27 = 1'b0;
            end
        end
      S_15 :
        begin
          selector_MUX_94_reg_10_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061 == 1'b1)
            begin
              _next_state = S_16;
              selector_MUX_94_reg_10_0_0_0 = 1'b0;
              wrenable_reg_10 = 1'b0;
            end
          else
            begin
              _next_state = S_4;
            end
        end
      S_16 :
        begin
          fuselector_BMEMORY_CTRLN_34_i0_STORE = 1'b1;
          selector_MUX_116_reg_6_0_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063 == 1'b1)
            begin
              _next_state = S_17;
              selector_MUX_116_reg_6_0_0_0 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_17 :
        begin
          selector_MUX_113_reg_3_0_0_0 = 1'b1;
          wrenable_reg_3 = 1'b1;
          if (OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_19;
              done_port = 1'b1;
              selector_MUX_113_reg_3_0_0_0 = 1'b0;
              wrenable_reg_3 = 1'b0;
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

// Top component for _Z18matrix_convolutionPKiPiS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __Z18matrix_convolutionPKiPiS1_ii(clock,
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
  wire OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890;
  wire OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037;
  wire OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039;
  wire OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041;
  wire OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047;
  wire OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059;
  wire OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061;
  wire OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063;
  wire OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_34_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_34_i0_STORE;
  wire selector_MUX_102_reg_18_0_0_0;
  wire selector_MUX_108_reg_23_0_0_0;
  wire selector_MUX_112_reg_27_0_0_0;
  wire selector_MUX_112_reg_27_0_0_1;
  wire selector_MUX_113_reg_3_0_0_0;
  wire selector_MUX_116_reg_6_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1;
  wire selector_MUX_94_reg_10_0_0_0;
  wire selector_MUX_94_reg_10_0_0_1;
  wire selector_MUX_95_reg_11_0_0_0;
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
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller__Z18matrix_convolutionPKiPiS1_ii Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_34_i0_LOAD(fuselector_BMEMORY_CTRLN_34_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_34_i0_STORE(fuselector_BMEMORY_CTRLN_34_i0_STORE),
    .selector_MUX_102_reg_18_0_0_0(selector_MUX_102_reg_18_0_0_0),
    .selector_MUX_108_reg_23_0_0_0(selector_MUX_108_reg_23_0_0_0),
    .selector_MUX_112_reg_27_0_0_0(selector_MUX_112_reg_27_0_0_0),
    .selector_MUX_112_reg_27_0_0_1(selector_MUX_112_reg_27_0_0_1),
    .selector_MUX_113_reg_3_0_0_0(selector_MUX_113_reg_3_0_0_0),
    .selector_MUX_116_reg_6_0_0_0(selector_MUX_116_reg_6_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1),
    .selector_MUX_94_reg_10_0_0_0(selector_MUX_94_reg_10_0_0_0),
    .selector_MUX_94_reg_10_0_0_1(selector_MUX_94_reg_10_0_0_1),
    .selector_MUX_95_reg_11_0_0_0(selector_MUX_95_reg_11_0_0_0),
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
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z18matrix_convolutionPKiPiS1_ii Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_36890),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37037),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37039),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37041),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37047),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37059),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37061),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37063),
    .OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065(OUT_CONDITION__Z18matrix_convolutionPKiPiS1_ii_35461_37065),
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
    .fuselector_BMEMORY_CTRLN_34_i0_LOAD(fuselector_BMEMORY_CTRLN_34_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_34_i0_STORE(fuselector_BMEMORY_CTRLN_34_i0_STORE),
    .selector_MUX_102_reg_18_0_0_0(selector_MUX_102_reg_18_0_0_0),
    .selector_MUX_108_reg_23_0_0_0(selector_MUX_108_reg_23_0_0_0),
    .selector_MUX_112_reg_27_0_0_0(selector_MUX_112_reg_27_0_0_0),
    .selector_MUX_112_reg_27_0_0_1(selector_MUX_112_reg_27_0_0_1),
    .selector_MUX_113_reg_3_0_0_0(selector_MUX_113_reg_3_0_0_0),
    .selector_MUX_116_reg_6_0_0_0(selector_MUX_116_reg_6_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_34_i0_1_0_1),
    .selector_MUX_94_reg_10_0_0_0(selector_MUX_94_reg_10_0_0_0),
    .selector_MUX_94_reg_10_0_0_1(selector_MUX_94_reg_10_0_0_1),
    .selector_MUX_95_reg_11_0_0_0(selector_MUX_95_reg_11_0_0_0),
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

// Minimal interface for function: _Z18matrix_convolutionPKiPiS1_ii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _Z18matrix_convolutionPKiPiS1_ii(clock,
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
  
  __Z18matrix_convolutionPKiPiS1_ii __Z18matrix_convolutionPKiPiS1_ii_i0 (.done_port(done_port),
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


