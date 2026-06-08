// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-04-17T09:45:33
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
  wire [4:0] out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_43697_47591;
  wire [7:0] out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_43697_47589;
  wire [0:0] out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_43697_44432;
  wire [0:0] out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_43697_44453;
  wire [0:0] out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_43697_44473;
  wire [0:0] out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_43697_44493;
  wire [26:0] out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_43697_43856;
  wire [31:0] out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_43697_43788;
  wire [4:0] out_IUdata_converter_FU_50_i0_fu___float_adde8m23b_127nih_43697_44170;
  wire signed [1:0] out_UIdata_converter_FU_2_i0_fu___float_adde8m23b_127nih_43697_43779;
  wire signed [1:0] out_UIdata_converter_FU_49_i0_fu___float_adde8m23b_127nih_43697_44161;
  wire signed [1:0] out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_43697_45894;
  wire signed [1:0] out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_43697_45904;
  wire signed [1:0] out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_43697_45913;
  wire signed [1:0] out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_43697_45922;
  wire signed [1:0] out_UIdata_converter_FU_9_i0_fu___float_adde8m23b_127nih_43697_43847;
  wire out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_43697_45931;
  wire out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_43697_44731;
  wire out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_43697_47587;
  wire out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_43697_47581;
  wire out_UUdata_converter_FU_43_i0_fu___float_adde8m23b_127nih_43697_43947;
  wire out_UUdata_converter_FU_44_i0_fu___float_adde8m23b_127nih_43697_43961;
  wire [4:0] out_UUdata_converter_FU_51_i0_fu___float_adde8m23b_127nih_43697_44173;
  wire [4:0] out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_43697_44182;
  wire out_UUdata_converter_FU_54_i0_fu___float_adde8m23b_127nih_43697_44254;
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
  wire [63:0] out_conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43697_44898_32_64;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_144_i0_fu___float_adde8m23b_127nih_43697_44164;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_43697_45898;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_43697_45907;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_43697_45916;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_43697_45925;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_146_i0_fu___float_adde8m23b_127nih_43697_43782;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_146_i1_fu___float_adde8m23b_127nih_43697_43850;
  wire out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_43697_50741;
  wire out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_43697_50745;
  wire out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_43697_50748;
  wire out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_43697_50752;
  wire out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_43697_50756;
  wire out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_43697_50760;
  wire out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_43697_50763;
  wire out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_43697_44606;
  wire out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_43697_50769;
  wire out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_43697_50772;
  wire out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_43697_50775;
  wire out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_43697_50779;
  wire out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_43697_47890;
  wire out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_43697_50784;
  wire out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_43697_50788;
  wire out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_43697_50792;
  wire out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_43697_50795;
  wire out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_43697_50799;
  wire out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_43697_50803;
  wire out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_43697_50807;
  wire out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_43697_50810;
  wire out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_43697_50814;
  wire out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_43697_50818;
  wire out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_43697_50822;
  wire out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_43697_45786;
  wire out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_43697_50826;
  wire out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_43697_45808;
  wire out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_43697_45855;
  wire out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_43697_48007;
  wire out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_43697_45871;
  wire out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_43697_45959;
  wire out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_43697_47996;
  wire out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_43697_50837;
  wire out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_43697_48003;
  wire out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_43697_50669;
  wire out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_43697_50673;
  wire out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_43697_50677;
  wire out_lut_expr_FU_30_i0_fu___float_adde8m23b_127nih_43697_43903;
  wire out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_43697_50682;
  wire out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_43697_50686;
  wire out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_43697_50690;
  wire out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_43697_43911;
  wire out_lut_expr_FU_48_i0_fu___float_adde8m23b_127nih_43697_44158;
  wire out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_43697_44213;
  wire out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_43697_50698;
  wire out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_43697_50702;
  wire out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_43697_50706;
  wire out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082;
  wire out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_43697_50711;
  wire out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_43697_50715;
  wire out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_43697_50718;
  wire out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_43697_50721;
  wire out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086;
  wire out_lut_expr_FU_8_i0_fu___float_adde8m23b_127nih_43697_43844;
  wire out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_43697_50725;
  wire out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_43697_50728;
  wire out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_43697_50732;
  wire out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090;
  wire out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_43697_50736;
  wire out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_43697_45144;
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
  wire signed [0:0] out_rshift_expr_FU_32_0_32_147_i0_fu___float_adde8m23b_127nih_43697_44167;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_43697_45901;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_43697_45910;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_43697_45919;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_43697_45928;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_149_i0_fu___float_adde8m23b_127nih_43697_43785;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_149_i1_fu___float_adde8m23b_127nih_43697_43853;
  wire [25:0] out_ui_bit_and_expr_FU_0_32_32_150_i0_fu___float_adde8m23b_127nih_43697_44229;
  wire [26:0] out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_43697_44262;
  wire [15:0] out_ui_bit_and_expr_FU_16_0_16_152_i0_fu___float_adde8m23b_127nih_43697_44297;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_153_i0_fu___float_adde8m23b_127nih_43697_43760;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_153_i1_fu___float_adde8m23b_127nih_43697_43767;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_43697_43813;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_43697_43870;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i2_fu___float_adde8m23b_127nih_43697_44692;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_43697_44766;
  wire [26:0] out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_43697_44248;
  wire [31:0] out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794;
  wire [23:0] out_ui_bit_and_expr_FU_32_32_32_156_i1_fu___float_adde8m23b_127nih_43697_44200;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_43697_43825;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i1_fu___float_adde8m23b_127nih_43697_43876;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_157_i2_fu___float_adde8m23b_127nih_43697_43977;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i3_fu___float_adde8m23b_127nih_43697_44679;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_43697_44761;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_158_i0_fu___float_adde8m23b_127nih_43697_44179;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_43697_45599;
  wire [26:0] out_ui_bit_ior_concat_expr_FU_160_i0_fu___float_adde8m23b_127nih_43697_44251;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_161_i0_fu___float_adde8m23b_127nih_43697_43953;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_162_i0_fu___float_adde8m23b_127nih_43697_43967;
  wire [30:0] out_ui_bit_ior_expr_FU_0_32_32_163_i0_fu___float_adde8m23b_127nih_43697_44697;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_43697_44895;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43697_44898;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde8m23b_127nih_43697_44459;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde8m23b_127nih_43697_44499;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu___float_adde8m23b_127nih_43697_44502;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu___float_adde8m23b_127nih_43697_44507;
  wire [22:0] out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_43697_44867;
  wire [4:0] out_ui_bit_ior_expr_FU_8_8_8_171_i0_fu___float_adde8m23b_127nih_43697_44176;
  wire [25:0] out_ui_bit_not_expr_FU_32_32_172_i0_fu___float_adde8m23b_127nih_43697_44197;
  wire [31:0] out_ui_bit_xor_expr_FU_32_32_32_173_i0_fu___float_adde8m23b_127nih_43697_43791;
  wire [30:0] out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_43697_43797;
  wire [30:0] out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_43697_43802;
  wire [26:0] out_ui_bit_xor_expr_FU_32_32_32_173_i3_fu___float_adde8m23b_127nih_43697_44234;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_43697_45820;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_43697_45832;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_43697_45836;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_43697_45844;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_43697_45850;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_43697_45868;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_43697_45877;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_43697_45886;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_43697_45963;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_43697_47585;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_43697_45816;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_43697_45858;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_43697_45866;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_43697_45884;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_43697_45961;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_43697_47583;
  wire out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078;
  wire out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_43697_44210;
  wire out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_43697_48955;
  wire out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43697_48958;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_43697_48962;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43697_48965;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43697_48969;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43697_48972;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_43697_48976;
  wire out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43697_48979;
  wire out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_43697_48983;
  wire out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43697_48986;
  wire out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_43697_48990;
  wire out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43697_48993;
  wire out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_43697_48997;
  wire out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43697_49000;
  wire out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_43697_49004;
  wire out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43697_49007;
  wire out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_43697_49011;
  wire out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_43697_49018;
  wire out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_43697_49025;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_43697_49032;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_43697_49039;
  wire out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_43697_49046;
  wire out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_43697_49053;
  wire out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_43697_49060;
  wire out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_43697_48535;
  wire out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_43697_48539;
  wire out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_43697_48543;
  wire out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_43697_49773;
  wire out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_43697_49516;
  wire out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_43697_49777;
  wire out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_43697_49524;
  wire out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43697_48457;
  wire out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_43697_49781;
  wire out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_43697_49532;
  wire out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_43697_49785;
  wire out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_43697_49540;
  wire out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_43697_49789;
  wire out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_43697_49548;
  wire out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_43697_49793;
  wire out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_43697_49556;
  wire out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_43697_49797;
  wire out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_43697_49564;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_43697_48460;
  wire out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_43697_49801;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_43697_49573;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_43697_50055;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_43697_50323;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_43697_50067;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43697_48464;
  wire out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_43697_50327;
  wire out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_43697_50079;
  wire out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_43697_50331;
  wire out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_43697_50091;
  wire out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_43697_50549;
  wire out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_43697_50561;
  wire out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_43697_50651;
  wire [25:0] out_ui_lshift_expr_FU_0_64_64_178_i0_fu___float_adde8m23b_127nih_43697_44194;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_179_i0_fu___float_adde8m23b_127nih_43697_43950;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_179_i1_fu___float_adde8m23b_127nih_43697_43964;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_179_i2_fu___float_adde8m23b_127nih_43697_44676;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_43697_44892;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_180_i0_fu___float_adde8m23b_127nih_43697_43956;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_43697_43970;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_181_i0_fu___float_adde8m23b_127nih_43697_44309;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_182_i0_fu___float_adde8m23b_127nih_43697_44335;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_43697_44363;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_43697_44391;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_43697_44398;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_186_i0_fu___float_adde8m23b_127nih_43697_44864;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_43697_45574;
  wire [26:0] out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_43697_45595;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_43697_49937;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_43697_45945;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_43697_47601;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_43697_50202;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_43697_45934;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_193_i0_fu___float_adde8m23b_127nih_43697_44435;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_194_i0_fu___float_adde8m23b_127nih_43697_44456;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_195_i0_fu___float_adde8m23b_127nih_43697_44476;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde8m23b_127nih_43697_44496;
  wire out_ui_lt_expr_FU_32_32_32_197_i0_fu___float_adde8m23b_127nih_43697_43774;
  wire [7:0] out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43697_43914;
  wire out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_43697_43884;
  wire out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_43697_43889;
  wire out_ui_ne_expr_FU_32_0_32_200_i0_fu___float_adde8m23b_127nih_43697_44205;
  wire [26:0] out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257;
  wire [30:0] out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_43697_44734;
  wire [24:0] out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_43697_45592;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i0_fu___float_adde8m23b_127nih_43697_43816;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i1_fu___float_adde8m23b_127nih_43697_43873;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_202_i2_fu___float_adde8m23b_127nih_43697_44758;
  wire [15:0] out_ui_rshift_expr_FU_32_0_32_203_i0_fu___float_adde8m23b_127nih_43697_44294;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_43697_44689;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_43697_45565;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_43697_45577;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_43697_45570;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_43697_45586;
  wire [24:0] out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_43697_45589;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_43697_49930;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_43697_49933;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_43697_45941;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_43697_50195;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_43697_50198;
  wire [25:0] out_ui_rshift_expr_FU_32_32_32_209_i0_fu___float_adde8m23b_127nih_43697_44185;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_43697_45937;
  wire [7:0] out_ui_ternary_pm_expr_FU_8_0_8_8_211_i0_fu___float_adde8m23b_127nih_43697_44682;
  
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
    .BITSIZE_out1(64)) conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43697_44898_32_64 (.out1(out_conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43697_44898_32_64),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43697_44898));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43697_43760 (.out1(out_ui_bit_and_expr_FU_32_0_32_153_i0_fu___float_adde8m23b_127nih_43697_43760),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_84));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43697_43767 (.out1(out_ui_bit_and_expr_FU_32_0_32_153_i1_fu___float_adde8m23b_127nih_43697_43767),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_84));
  ui_lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_43774 (.out1(out_ui_lt_expr_FU_32_32_32_197_i0_fu___float_adde8m23b_127nih_43697_43774),
    .in1(out_ui_bit_and_expr_FU_32_0_32_153_i0_fu___float_adde8m23b_127nih_43697_43760),
    .in2(out_ui_bit_and_expr_FU_32_0_32_153_i1_fu___float_adde8m23b_127nih_43697_43767));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43697_43779 (.out1(out_UIdata_converter_FU_2_i0_fu___float_adde8m23b_127nih_43697_43779),
    .in1(out_ui_lt_expr_FU_32_32_32_197_i0_fu___float_adde8m23b_127nih_43697_43774));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_43782 (.out1(out_lshift_expr_FU_64_0_64_146_i0_fu___float_adde8m23b_127nih_43697_43782),
    .in1(out_UIdata_converter_FU_2_i0_fu___float_adde8m23b_127nih_43697_43779),
    .in2(out_const_12));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_43785 (.out1(out_rshift_expr_FU_64_0_64_149_i0_fu___float_adde8m23b_127nih_43697_43785),
    .in1(out_lshift_expr_FU_64_0_64_146_i0_fu___float_adde8m23b_127nih_43697_43782),
    .in2(out_const_12));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_43697_43788 (.out1(out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_43697_43788),
    .in1(out_rshift_expr_FU_64_0_64_149_i0_fu___float_adde8m23b_127nih_43697_43785));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_43697_43791 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i0_fu___float_adde8m23b_127nih_43697_43791),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_conv_in_port_b_64_32));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_43697_43794 (.out1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i0_fu___float_adde8m23b_127nih_43697_43791),
    .in2(out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_43697_43788));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43697_43797 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_43697_43797),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43697_43802 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_43697_43802),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_43813 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_43697_43813),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_43697_43797),
    .in2(out_const_81));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_43816 (.out1(out_ui_rshift_expr_FU_32_0_32_202_i0_fu___float_adde8m23b_127nih_43697_43816),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i1_fu___float_adde8m23b_127nih_43697_43797),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_43825 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_43697_43825),
    .in1(out_ui_rshift_expr_FU_32_0_32_202_i0_fu___float_adde8m23b_127nih_43697_43816),
    .in2(out_const_78));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_43844 (.out1(out_lut_expr_FU_8_i0_fu___float_adde8m23b_127nih_43697_43844),
    .in1(out_const_45),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43697_48457),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43697_48464),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43697_43847 (.out1(out_UIdata_converter_FU_9_i0_fu___float_adde8m23b_127nih_43697_43847),
    .in1(out_lut_expr_FU_8_i0_fu___float_adde8m23b_127nih_43697_43844));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_43850 (.out1(out_lshift_expr_FU_64_0_64_146_i1_fu___float_adde8m23b_127nih_43697_43850),
    .in1(out_UIdata_converter_FU_9_i0_fu___float_adde8m23b_127nih_43697_43847),
    .in2(out_const_12));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_43853 (.out1(out_rshift_expr_FU_64_0_64_149_i1_fu___float_adde8m23b_127nih_43697_43853),
    .in1(out_lshift_expr_FU_64_0_64_146_i1_fu___float_adde8m23b_127nih_43697_43850),
    .in2(out_const_12));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_43697_43856 (.out1(out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_43697_43856),
    .in1(out_rshift_expr_FU_64_0_64_149_i1_fu___float_adde8m23b_127nih_43697_43853));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_43870 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_43697_43870),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_43697_43802),
    .in2(out_const_81));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_43873 (.out1(out_ui_rshift_expr_FU_32_0_32_202_i1_fu___float_adde8m23b_127nih_43697_43873),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i2_fu___float_adde8m23b_127nih_43697_43802),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_43876 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i1_fu___float_adde8m23b_127nih_43697_43876),
    .in1(out_ui_rshift_expr_FU_32_0_32_202_i1_fu___float_adde8m23b_127nih_43697_43873),
    .in2(out_const_78));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_43884 (.out1(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_43697_43884),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_43697_43813),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_43889 (.out1(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_43697_43889),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_43697_43870),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_43903 (.out1(out_lut_expr_FU_30_i0_fu___float_adde8m23b_127nih_43697_43903),
    .in1(out_const_60),
    .in2(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_43697_48990),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43697_48993),
    .in4(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_43697_48997),
    .in5(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43697_49000),
    .in6(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_43697_50669),
    .in7(out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_43697_50677),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_43911 (.out1(out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_43697_43911),
    .in1(out_const_74),
    .in2(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43697_48986),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43697_48993),
    .in4(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_43697_49039),
    .in5(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_43697_49046),
    .in6(out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_43697_50690),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_minus_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_43914 (.out1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43697_43914),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_43697_43825),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i1_fu___float_adde8m23b_127nih_43697_43876));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_43947 (.out1(out_UUdata_converter_FU_43_i0_fu___float_adde8m23b_127nih_43697_43947),
    .in1(out_lut_expr_FU_30_i0_fu___float_adde8m23b_127nih_43697_43903));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_43950 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i0_fu___float_adde8m23b_127nih_43697_43950),
    .in1(out_UUdata_converter_FU_43_i0_fu___float_adde8m23b_127nih_43697_43947),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_43697_43953 (.out1(out_ui_bit_ior_expr_FU_0_32_32_161_i0_fu___float_adde8m23b_127nih_43697_43953),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i0_fu___float_adde8m23b_127nih_43697_43950),
    .in2(out_ui_bit_and_expr_FU_32_0_32_154_i0_fu___float_adde8m23b_127nih_43697_43813));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_43956 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i0_fu___float_adde8m23b_127nih_43697_43956),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_161_i0_fu___float_adde8m23b_127nih_43697_43953),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_43961 (.out1(out_UUdata_converter_FU_44_i0_fu___float_adde8m23b_127nih_43697_43961),
    .in1(out_lut_expr_FU_42_i0_fu___float_adde8m23b_127nih_43697_43911));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_43964 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i1_fu___float_adde8m23b_127nih_43697_43964),
    .in1(out_UUdata_converter_FU_44_i0_fu___float_adde8m23b_127nih_43697_43961),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(24),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_43697_43967 (.out1(out_ui_bit_ior_expr_FU_0_32_32_162_i0_fu___float_adde8m23b_127nih_43697_43967),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i1_fu___float_adde8m23b_127nih_43697_43870),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i1_fu___float_adde8m23b_127nih_43697_43964));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_43970 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_43697_43970),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_162_i0_fu___float_adde8m23b_127nih_43697_43967),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43697_43977 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i2_fu___float_adde8m23b_127nih_43697_43977),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43697_43914),
    .in2(out_const_78));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44158 (.out1(out_lut_expr_FU_48_i0_fu___float_adde8m23b_127nih_43697_44158),
    .in1(out_const_77),
    .in2(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_43697_48535),
    .in3(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_43697_48539),
    .in4(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_43697_48543),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43697_44161 (.out1(out_UIdata_converter_FU_49_i0_fu___float_adde8m23b_127nih_43697_44161),
    .in1(out_lut_expr_FU_48_i0_fu___float_adde8m23b_127nih_43697_44158));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43697_44164 (.out1(out_lshift_expr_FU_32_0_32_144_i0_fu___float_adde8m23b_127nih_43697_44164),
    .in1(out_UIdata_converter_FU_49_i0_fu___float_adde8m23b_127nih_43697_44161),
    .in2(out_const_11));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43697_44167 (.out1(out_rshift_expr_FU_32_0_32_147_i0_fu___float_adde8m23b_127nih_43697_44167),
    .in1(out_lshift_expr_FU_32_0_32_144_i0_fu___float_adde8m23b_127nih_43697_44164),
    .in2(out_const_11));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43697_44170 (.out1(out_IUdata_converter_FU_50_i0_fu___float_adde8m23b_127nih_43697_44170),
    .in1(out_rshift_expr_FU_32_0_32_147_i0_fu___float_adde8m23b_127nih_43697_44167));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43697_44173 (.out1(out_UUdata_converter_FU_51_i0_fu___float_adde8m23b_127nih_43697_44173),
    .in1(out_IUdata_converter_FU_50_i0_fu___float_adde8m23b_127nih_43697_44170));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43697_44176 (.out1(out_ui_bit_ior_expr_FU_8_8_8_171_i0_fu___float_adde8m23b_127nih_43697_44176),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i2_fu___float_adde8m23b_127nih_43697_43977),
    .in2(out_UUdata_converter_FU_51_i0_fu___float_adde8m23b_127nih_43697_44173));
  ui_bit_and_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43697_44179 (.out1(out_ui_bit_and_expr_FU_8_0_8_158_i0_fu___float_adde8m23b_127nih_43697_44179),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_171_i0_fu___float_adde8m23b_127nih_43697_44176),
    .in2(out_const_75));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43697_44182 (.out1(out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_43697_44182),
    .in1(out_ui_bit_and_expr_FU_8_0_8_158_i0_fu___float_adde8m23b_127nih_43697_44179));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(5),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44185 (.out1(out_ui_rshift_expr_FU_32_32_32_209_i0_fu___float_adde8m23b_127nih_43697_44185),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_43697_43970),
    .in2(out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_43697_44182));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44194 (.out1(out_ui_lshift_expr_FU_0_64_64_178_i0_fu___float_adde8m23b_127nih_43697_44194),
    .in1(out_const_86),
    .in2(out_UUdata_converter_FU_52_i0_fu___float_adde8m23b_127nih_43697_44182));
  ui_bit_not_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43697_44197 (.out1(out_ui_bit_not_expr_FU_32_32_172_i0_fu___float_adde8m23b_127nih_43697_44197),
    .in1(out_ui_lshift_expr_FU_0_64_64_178_i0_fu___float_adde8m23b_127nih_43697_44194));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_43697_44200 (.out1(out_ui_bit_and_expr_FU_32_32_32_156_i1_fu___float_adde8m23b_127nih_43697_44200),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_43697_45565),
    .in2(out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_43697_45570));
  ui_ne_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44205 (.out1(out_ui_ne_expr_FU_32_0_32_200_i0_fu___float_adde8m23b_127nih_43697_44205),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_43697_45577),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44210 (.out1(out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_43697_44210),
    .in1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_43697_45577),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44213 (.out1(out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_43697_44213),
    .in1(out_const_48),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43697_48457),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43697_48464),
    .in4(out_ui_eq_expr_FU_32_0_32_177_i0_fu___float_adde8m23b_127nih_43697_44210),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43697_44229 (.out1(out_ui_bit_and_expr_FU_0_32_32_150_i0_fu___float_adde8m23b_127nih_43697_44229),
    .in1(out_const_82),
    .in2(out_ui_rshift_expr_FU_32_32_32_209_i0_fu___float_adde8m23b_127nih_43697_44185));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_43697_44234 (.out1(out_ui_bit_xor_expr_FU_32_32_32_173_i3_fu___float_adde8m23b_127nih_43697_44234),
    .in1(out_ui_bit_and_expr_FU_0_32_32_150_i0_fu___float_adde8m23b_127nih_43697_44229),
    .in2(out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_43697_43856));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_43697_44248 (.out1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_43697_44248),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_173_i3_fu___float_adde8m23b_127nih_43697_44234),
    .in2(out_const_83));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(27),
    .OFFSET_PARAMETER(2)) fu___float_adde8m23b_127nih_43697_44251 (.out1(out_ui_bit_ior_concat_expr_FU_160_i0_fu___float_adde8m23b_127nih_43697_44251),
    .in1(out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_43697_45595),
    .in2(out_reg_4_reg_4),
    .in3(out_const_14));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44254 (.out1(out_UUdata_converter_FU_54_i0_fu___float_adde8m23b_127nih_43697_44254),
    .in1(out_lut_expr_FU_53_i0_fu___float_adde8m23b_127nih_43697_44213));
  ui_plus_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_43697_44257 (.out1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in1(out_ui_bit_ior_concat_expr_FU_160_i0_fu___float_adde8m23b_127nih_43697_44251),
    .in2(out_reg_1_reg_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_43697_44262 (.out1(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_43697_44262),
    .in1(out_const_83),
    .in2(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44294 (.out1(out_ui_rshift_expr_FU_32_0_32_203_i0_fu___float_adde8m23b_127nih_43697_44294),
    .in1(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_43697_44262),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu___float_adde8m23b_127nih_43697_44297 (.out1(out_ui_bit_and_expr_FU_16_0_16_152_i0_fu___float_adde8m23b_127nih_43697_44297),
    .in1(out_ui_rshift_expr_FU_32_0_32_203_i0_fu___float_adde8m23b_127nih_43697_44294),
    .in2(out_const_80));
  ui_lshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(6),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44309 (.out1(out_ui_lshift_expr_FU_32_0_32_181_i0_fu___float_adde8m23b_127nih_43697_44309),
    .in1(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_43697_44262),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(5),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44335 (.out1(out_ui_lshift_expr_FU_32_0_32_182_i0_fu___float_adde8m23b_127nih_43697_44335),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_43697_45850),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(4),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44363 (.out1(out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_43697_44363),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_43697_45844),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44391 (.out1(out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_43697_44391),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_43697_45832),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44398 (.out1(out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_43697_44398),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_43697_45836),
    .in2(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44432 (.out1(out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_43697_44432),
    .in1(out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_43697_45928));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44435 (.out1(out_ui_lshift_expr_FU_8_0_8_193_i0_fu___float_adde8m23b_127nih_43697_44435),
    .in1(out_IUdata_converter_FU_101_i0_fu___float_adde8m23b_127nih_43697_44432),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44453 (.out1(out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_43697_44453),
    .in1(out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_43697_45919));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44456 (.out1(out_ui_lshift_expr_FU_8_0_8_194_i0_fu___float_adde8m23b_127nih_43697_44456),
    .in1(out_IUdata_converter_FU_102_i0_fu___float_adde8m23b_127nih_43697_44453),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___float_adde8m23b_127nih_43697_44459 (.out1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde8m23b_127nih_43697_44459),
    .in1(out_ui_lshift_expr_FU_8_0_8_193_i0_fu___float_adde8m23b_127nih_43697_44435),
    .in2(out_ui_lshift_expr_FU_8_0_8_194_i0_fu___float_adde8m23b_127nih_43697_44456));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44473 (.out1(out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_43697_44473),
    .in1(out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_43697_45910));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44476 (.out1(out_ui_lshift_expr_FU_8_0_8_195_i0_fu___float_adde8m23b_127nih_43697_44476),
    .in1(out_IUdata_converter_FU_103_i0_fu___float_adde8m23b_127nih_43697_44473),
    .in2(out_const_9));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44493 (.out1(out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_43697_44493),
    .in1(out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_43697_45901));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44496 (.out1(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde8m23b_127nih_43697_44496),
    .in1(out_IUdata_converter_FU_104_i0_fu___float_adde8m23b_127nih_43697_44493),
    .in2(out_const_3));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43697_44499 (.out1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde8m23b_127nih_43697_44499),
    .in1(out_ui_lshift_expr_FU_8_0_8_195_i0_fu___float_adde8m23b_127nih_43697_44476),
    .in2(out_ui_lshift_expr_FU_8_0_8_196_i0_fu___float_adde8m23b_127nih_43697_44496));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43697_44502 (.out1(out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu___float_adde8m23b_127nih_43697_44502),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu___float_adde8m23b_127nih_43697_44459),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu___float_adde8m23b_127nih_43697_44499));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43697_44507 (.out1(out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu___float_adde8m23b_127nih_43697_44507),
    .in1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_43697_45937),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu___float_adde8m23b_127nih_43697_44502));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44606 (.out1(out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_43697_44606),
    .in1(out_const_85),
    .in2(out_reg_22_reg_22),
    .in3(out_reg_23_reg_23),
    .in4(out_reg_24_reg_24),
    .in5(out_reg_25_reg_25),
    .in6(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_43697_50760),
    .in7(out_reg_36_reg_36),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(6),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44676 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i2_fu___float_adde8m23b_127nih_43697_44676),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i3_fu___float_adde8m23b_127nih_43697_44679),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_44679 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i3_fu___float_adde8m23b_127nih_43697_44679),
    .in1(out_reg_31_reg_31),
    .in2(out_const_78));
  ui_ternary_pm_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_in3(5),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_44682 (.out1(out_ui_ternary_pm_expr_FU_8_0_8_8_211_i0_fu___float_adde8m23b_127nih_43697_44682),
    .in1(out_reg_7_reg_7),
    .in2(out_const_13),
    .in3(out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_43697_47591));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44689 (.out1(out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_43697_44689),
    .in1(out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_43697_49937),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_44692 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i2_fu___float_adde8m23b_127nih_43697_44692),
    .in1(out_ui_rshift_expr_FU_32_0_32_204_i0_fu___float_adde8m23b_127nih_43697_44689),
    .in2(out_const_81));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43697_44697 (.out1(out_ui_bit_ior_expr_FU_0_32_32_163_i0_fu___float_adde8m23b_127nih_43697_44697),
    .in1(out_reg_32_reg_32),
    .in2(out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_43697_45945));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_44731 (.out1(out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_43697_44731),
    .in1(out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_43697_47890));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_43697_44734 (.out1(out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_43697_44734),
    .in1(out_reg_33_reg_33),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_163_i0_fu___float_adde8m23b_127nih_43697_44697));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44758 (.out1(out_ui_rshift_expr_FU_32_0_32_202_i2_fu___float_adde8m23b_127nih_43697_44758),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_43697_44734),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_44761 (.out1(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_43697_44761),
    .in1(out_ui_rshift_expr_FU_32_0_32_202_i2_fu___float_adde8m23b_127nih_43697_44758),
    .in2(out_const_78));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_44766 (.out1(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_43697_44766),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i1_fu___float_adde8m23b_127nih_43697_44734),
    .in2(out_const_81));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44864 (.out1(out_ui_lshift_expr_FU_32_0_32_186_i0_fu___float_adde8m23b_127nih_43697_44864),
    .in1(out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_43697_47581),
    .in2(out_const_7));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_44867 (.out1(out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_43697_44867),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_43697_47585));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(6),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_44892 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_43697_44892),
    .in1(out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_43697_47583),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_43697_44895 (.out1(out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_43697_44895),
    .in1(out_ui_bit_ior_expr_FU_32_32_32_170_i0_fu___float_adde8m23b_127nih_43697_44867),
    .in2(out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_43697_47601));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_43697_44898 (.out1(out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43697_44898),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i3_fu___float_adde8m23b_127nih_43697_44892),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_164_i0_fu___float_adde8m23b_127nih_43697_44895));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45078 (.out1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in1(out_ui_bit_and_expr_FU_16_0_16_152_i0_fu___float_adde8m23b_127nih_43697_44297),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45082 (.out1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_43697_49789),
    .in4(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_43697_49548),
    .in5(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_43697_49793),
    .in6(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_43697_49556),
    .in7(out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_43697_50706),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45086 (.out1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in1(out_const_13),
    .in2(out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_43697_50711),
    .in3(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_43697_50715),
    .in4(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_43697_50718),
    .in5(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_43697_50721),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45090 (.out1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090),
    .in1(out_const_65),
    .in2(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_43697_50718),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in4(out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_43697_50725),
    .in5(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_43697_50732),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45144 (.out1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_43697_45144),
    .in1(out_const_26),
    .in2(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_43697_50715),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in4(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_43697_50732),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090),
    .in6(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_43697_50736),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45565 (.out1(out_ui_rshift_expr_FU_32_0_32_205_i0_fu___float_adde8m23b_127nih_43697_45565),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu___float_adde8m23b_127nih_43697_43970),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45570 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i0_fu___float_adde8m23b_127nih_43697_45570),
    .in1(out_ui_bit_not_expr_FU_32_32_172_i0_fu___float_adde8m23b_127nih_43697_44197),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45574 (.out1(out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_43697_45574),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i1_fu___float_adde8m23b_127nih_43697_44200),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45577 (.out1(out_ui_rshift_expr_FU_32_0_32_205_i1_fu___float_adde8m23b_127nih_43697_45577),
    .in1(out_ui_lshift_expr_FU_32_0_32_187_i0_fu___float_adde8m23b_127nih_43697_45574),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45586 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_43697_45586),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i0_fu___float_adde8m23b_127nih_43697_43956),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(25),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45589 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_43697_45589),
    .in1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_43697_44248),
    .in2(out_const_14));
  ui_plus_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(25),
    .BITSIZE_out1(25)) fu___float_adde8m23b_127nih_43697_45592 (.out1(out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_43697_45592),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i1_fu___float_adde8m23b_127nih_43697_45586),
    .in2(out_ui_rshift_expr_FU_32_0_32_206_i2_fu___float_adde8m23b_127nih_43697_45589));
  ui_lshift_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_in2(2),
    .BITSIZE_out1(27),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45595 (.out1(out_ui_lshift_expr_FU_32_0_32_188_i0_fu___float_adde8m23b_127nih_43697_45595),
    .in1(out_reg_3_reg_3),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43697_45599 (.out1(out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_43697_45599),
    .in1(out_ui_bit_and_expr_FU_32_0_32_155_i0_fu___float_adde8m23b_127nih_43697_44248),
    .in2(out_const_44));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45786 (.out1(out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_43697_45786),
    .in1(out_const_48),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_reg_30_reg_30),
    .in5(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_43697_50822),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45808 (.out1(out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_43697_45808),
    .in1(out_const_29),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_43697_50826),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_45816 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_43697_45816),
    .in1(out_lut_expr_FU_113_i0_fu___float_adde8m23b_127nih_43697_44606),
    .in2(out_const_0),
    .in3(out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_43697_45941));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_45820 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_43697_45820),
    .in1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_43697_45144),
    .in2(out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_43697_50195),
    .in3(out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_43697_50198));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43697_45832 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_43697_45832),
    .in1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090),
    .in2(out_ui_lshift_expr_FU_32_0_32_185_i0_fu___float_adde8m23b_127nih_43697_44398),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_43697_45836));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43697_45836 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i2_fu___float_adde8m23b_127nih_43697_45836),
    .in1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in2(out_ui_lshift_expr_FU_32_0_32_183_i0_fu___float_adde8m23b_127nih_43697_44363),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_43697_45844));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43697_45844 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i3_fu___float_adde8m23b_127nih_43697_45844),
    .in1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in2(out_ui_lshift_expr_FU_32_0_32_182_i0_fu___float_adde8m23b_127nih_43697_44335),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_43697_45850));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(27),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_43697_45850 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i4_fu___float_adde8m23b_127nih_43697_45850),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in2(out_ui_lshift_expr_FU_32_0_32_181_i0_fu___float_adde8m23b_127nih_43697_44309),
    .in3(out_ui_bit_and_expr_FU_0_32_32_151_i0_fu___float_adde8m23b_127nih_43697_44262));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45855 (.out1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_43697_45855),
    .in1(out_const_45),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_43697_50826),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_45858 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_43697_45858),
    .in1(out_lut_expr_FU_131_i0_fu___float_adde8m23b_127nih_43697_45786),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_43697_44761),
    .in3(out_const_78));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_45866 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_43697_45866),
    .in1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_43697_45855),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i1_fu___float_adde8m23b_127nih_43697_45858),
    .in3(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_43697_44761));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_45868 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_43697_45868),
    .in1(out_lut_expr_FU_134_i0_fu___float_adde8m23b_127nih_43697_45855),
    .in2(out_const_0),
    .in3(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_43697_44766));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45871 (.out1(out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_43697_45871),
    .in1(out_const_29),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43697_48457),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_43697_48460),
    .in4(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_43697_50810),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(1),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_45877 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_43697_45877),
    .in1(out_lut_expr_FU_133_i0_fu___float_adde8m23b_127nih_43697_45808),
    .in2(out_ui_bit_and_expr_FU_32_0_32_154_i3_fu___float_adde8m23b_127nih_43697_44766),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_45884 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_43697_45884),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i2_fu___float_adde8m23b_127nih_43697_45866),
    .in3(out_const_78));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(1),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_45886 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_43697_45886),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i5_fu___float_adde8m23b_127nih_43697_45868),
    .in3(out_const_0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43697_45894 (.out1(out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_43697_45894),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43697_45898 (.out1(out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_43697_45898),
    .in1(out_UIdata_converter_FU_55_i0_fu___float_adde8m23b_127nih_43697_45894),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43697_45901 (.out1(out_rshift_expr_FU_32_0_32_148_i0_fu___float_adde8m23b_127nih_43697_45901),
    .in1(out_lshift_expr_FU_32_0_32_145_i0_fu___float_adde8m23b_127nih_43697_45898),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43697_45904 (.out1(out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_43697_45904),
    .in1(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43697_45907 (.out1(out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_43697_45907),
    .in1(out_UIdata_converter_FU_76_i0_fu___float_adde8m23b_127nih_43697_45904),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43697_45910 (.out1(out_rshift_expr_FU_32_0_32_148_i1_fu___float_adde8m23b_127nih_43697_45910),
    .in1(out_lshift_expr_FU_32_0_32_145_i1_fu___float_adde8m23b_127nih_43697_45907),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43697_45913 (.out1(out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_43697_45913),
    .in1(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43697_45916 (.out1(out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_43697_45916),
    .in1(out_UIdata_converter_FU_89_i0_fu___float_adde8m23b_127nih_43697_45913),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43697_45919 (.out1(out_rshift_expr_FU_32_0_32_148_i2_fu___float_adde8m23b_127nih_43697_45919),
    .in1(out_lshift_expr_FU_32_0_32_145_i2_fu___float_adde8m23b_127nih_43697_45916),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_43697_45922 (.out1(out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_43697_45922),
    .in1(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43697_45925 (.out1(out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_43697_45925),
    .in1(out_UIdata_converter_FU_96_i0_fu___float_adde8m23b_127nih_43697_45922),
    .in2(out_const_10));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_43697_45928 (.out1(out_rshift_expr_FU_32_0_32_148_i3_fu___float_adde8m23b_127nih_43697_45928),
    .in1(out_lshift_expr_FU_32_0_32_145_i3_fu___float_adde8m23b_127nih_43697_45925),
    .in2(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45931 (.out1(out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_43697_45931),
    .in1(out_lut_expr_FU_99_i0_fu___float_adde8m23b_127nih_43697_45144));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45934 (.out1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_43697_45934),
    .in1(out_UUdata_converter_FU_100_i0_fu___float_adde8m23b_127nih_43697_45931),
    .in2(out_const_76));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45937 (.out1(out_ui_rshift_expr_FU_64_0_64_210_i0_fu___float_adde8m23b_127nih_43697_45937),
    .in1(out_ui_lshift_expr_FU_64_0_64_192_i0_fu___float_adde8m23b_127nih_43697_45934),
    .in2(out_const_76));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45941 (.out1(out_ui_rshift_expr_FU_32_0_32_207_i0_fu___float_adde8m23b_127nih_43697_45941),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i2_fu___float_adde8m23b_127nih_43697_44676),
    .in2(out_const_43));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(5),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_45945 (.out1(out_ui_lshift_expr_FU_32_0_32_189_i0_fu___float_adde8m23b_127nih_43697_45945),
    .in1(out_ui_cond_expr_FU_8_8_8_8_175_i0_fu___float_adde8m23b_127nih_43697_45816),
    .in2(out_const_43));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_45959 (.out1(out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_43697_45959),
    .in1(out_const_66),
    .in2(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_43697_43889),
    .in3(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_43697_43884),
    .in4(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_43697_50795),
    .in5(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_43697_50807),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_45961 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_43697_45961),
    .in1(out_reg_5_reg_5),
    .in2(out_ui_bit_and_expr_FU_8_0_8_157_i4_fu___float_adde8m23b_127nih_43697_44761),
    .in3(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_43697_45884));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_45963 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_43697_45963),
    .in1(out_reg_5_reg_5),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i6_fu___float_adde8m23b_127nih_43697_45877),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_43697_45886));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_47581 (.out1(out_UUdata_converter_FU_142_i0_fu___float_adde8m23b_127nih_43697_47581),
    .in1(out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_43697_48003));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_47583 (.out1(out_ui_cond_expr_FU_8_8_8_8_175_i5_fu___float_adde8m23b_127nih_43697_47583),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_cond_expr_FU_8_8_8_8_175_i3_fu___float_adde8m23b_127nih_43697_45884),
    .in3(out_ui_cond_expr_FU_8_8_8_8_175_i4_fu___float_adde8m23b_127nih_43697_45961));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_43697_47585 (.out1(out_ui_cond_expr_FU_32_32_32_32_174_i9_fu___float_adde8m23b_127nih_43697_47585),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_cond_expr_FU_32_32_32_32_174_i7_fu___float_adde8m23b_127nih_43697_45886),
    .in3(out_ui_cond_expr_FU_32_32_32_32_174_i8_fu___float_adde8m23b_127nih_43697_45963));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_47587 (.out1(out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_43697_47587),
    .in1(out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_43697_47996));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_43697_47589 (.out1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_43697_47589),
    .in1(out_ui_bit_and_expr_FU_8_0_8_157_i0_fu___float_adde8m23b_127nih_43697_43825));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_43697_47591 (.out1(out_ASSIGN_UNSIGNED_FU_105_i0_fu___float_adde8m23b_127nih_43697_47591),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu___float_adde8m23b_127nih_43697_44507));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_47601 (.out1(out_ui_lshift_expr_FU_32_0_32_190_i0_fu___float_adde8m23b_127nih_43697_47601),
    .in1(out_UUdata_converter_FU_139_i0_fu___float_adde8m23b_127nih_43697_47587),
    .in2(out_const_75));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_47890 (.out1(out_lut_expr_FU_118_i0_fu___float_adde8m23b_127nih_43697_47890),
    .in1(out_const_72),
    .in2(out_reg_0_reg_0),
    .in3(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_43697_50745),
    .in4(out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_43697_50769),
    .in5(out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_43697_50772),
    .in6(out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_43697_50775),
    .in7(out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_43697_50779),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_47996 (.out1(out_lut_expr_FU_138_i0_fu___float_adde8m23b_127nih_43697_47996),
    .in1(out_const_54),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_10_reg_10),
    .in4(out_reg_11_reg_11),
    .in5(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_43697_50814),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_48003 (.out1(out_lut_expr_FU_141_i0_fu___float_adde8m23b_127nih_43697_48003),
    .in1(out_const_68),
    .in2(out_ui_ne_expr_FU_32_0_32_199_i1_fu___float_adde8m23b_127nih_43697_43889),
    .in3(out_ui_ne_expr_FU_32_0_32_199_i0_fu___float_adde8m23b_127nih_43697_43884),
    .in4(out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_43697_50837),
    .in5(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_43697_50795),
    .in6(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_43697_50807),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_48007 (.out1(out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_43697_48007),
    .in1(out_const_45),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43697_48457),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_43697_48460),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48457 (.out1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43697_48457),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48460 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_43697_48460),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48464 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43697_48464),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43697_48535 (.out1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde8m23b_127nih_43697_48535),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43697_43914),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43697_48539 (.out1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde8m23b_127nih_43697_48539),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43697_43914),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43697_48543 (.out1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde8m23b_127nih_43697_48543),
    .in1(out_ui_minus_expr_FU_8_8_8_198_i0_fu___float_adde8m23b_127nih_43697_43914),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48955 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_43697_48955),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48958 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43697_48958),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48962 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_43697_48962),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48965 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43697_48965),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48969 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43697_48969),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48972 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43697_48972),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48976 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_43697_48976),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48979 (.out1(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43697_48979),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48983 (.out1(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_43697_48983),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48986 (.out1(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43697_48986),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48990 (.out1(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_43697_48990),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48993 (.out1(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43697_48993),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_48997 (.out1(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_43697_48997),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49000 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43697_49000),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49004 (.out1(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_43697_49004),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49007 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43697_49007),
    .in1(out_ui_bit_and_expr_FU_32_32_32_156_i0_fu___float_adde8m23b_127nih_43697_43794),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49011 (.out1(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_43697_49011),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49018 (.out1(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_43697_49018),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49025 (.out1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_43697_49025),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49032 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_43697_49032),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49039 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_43697_49039),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49046 (.out1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_43697_49046),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49053 (.out1(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_43697_49053),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49060 (.out1(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_43697_49060),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49516 (.out1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_43697_49516),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_35));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49524 (.out1(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_43697_49524),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49532 (.out1(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_43697_49532),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_40));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49540 (.out1(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_43697_49540),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49548 (.out1(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_43697_49548),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49556 (.out1(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_43697_49556),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49564 (.out1(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_43697_49564),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_49573 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_43697_49573),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2)) fu___float_adde8m23b_127nih_43697_49773 (.out1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_43697_49773),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43697_49777 (.out1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_43697_49777),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_15));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43697_49781 (.out1(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_43697_49781),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43697_49785 (.out1(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_43697_49785),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3)) fu___float_adde8m23b_127nih_43697_49789 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_43697_49789),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43697_49793 (.out1(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_43697_49793),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_16));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43697_49797 (.out1(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_43697_49797),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_27));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43697_49801 (.out1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_43697_49801),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_37));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_49930 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_43697_49930),
    .in1(out_ui_lshift_expr_FU_32_0_32_184_i0_fu___float_adde8m23b_127nih_43697_44391),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_49933 (.out1(out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_43697_49933),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i1_fu___float_adde8m23b_127nih_43697_45832),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_49937 (.out1(out_ui_lshift_expr_FU_32_0_32_188_i1_fu___float_adde8m23b_127nih_43697_49937),
    .in1(out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_43697_50202),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43697_50055 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_43697_50055),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_50067 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_43697_50067),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_50079 (.out1(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_43697_50079),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5)) fu___float_adde8m23b_127nih_43697_50091 (.out1(out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_43697_50091),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_28));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_50195 (.out1(out_ui_rshift_expr_FU_32_0_32_208_i0_fu___float_adde8m23b_127nih_43697_50195),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i3_fu___float_adde8m23b_127nih_43697_49930),
    .in2(out_const_13));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_50198 (.out1(out_ui_rshift_expr_FU_32_0_32_208_i1_fu___float_adde8m23b_127nih_43697_50198),
    .in1(out_ui_rshift_expr_FU_32_0_32_206_i4_fu___float_adde8m23b_127nih_43697_49933),
    .in2(out_const_13));
  ui_lshift_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_43697_50202 (.out1(out_ui_lshift_expr_FU_32_0_32_191_i0_fu___float_adde8m23b_127nih_43697_50202),
    .in1(out_ui_cond_expr_FU_32_32_32_32_174_i0_fu___float_adde8m23b_127nih_43697_45820),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1)) fu___float_adde8m23b_127nih_43697_50323 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_43697_50323),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1)) fu___float_adde8m23b_127nih_43697_50327 (.out1(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_43697_50327),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2)) fu___float_adde8m23b_127nih_43697_50331 (.out1(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_43697_50331),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43697_50549 (.out1(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_43697_50549),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_55));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43697_50561 (.out1(out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_43697_50561),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_62));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4)) fu___float_adde8m23b_127nih_43697_50651 (.out1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_43697_50651),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i0_fu___float_adde8m23b_127nih_43697_44257),
    .in2(out_const_46));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50669 (.out1(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_43697_50669),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_43697_48983),
    .in3(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43697_48986),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50673 (.out1(out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_43697_50673),
    .in1(out_const_31),
    .in2(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_43697_48962),
    .in3(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43697_48965),
    .in4(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43697_48969),
    .in5(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43697_48972),
    .in6(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_43697_48976),
    .in7(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43697_48979),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50677 (.out1(out_lut_expr_FU_29_i0_fu___float_adde8m23b_127nih_43697_50677),
    .in1(out_const_30),
    .in2(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_43697_48955),
    .in3(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43697_48958),
    .in4(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_43697_49004),
    .in5(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43697_49007),
    .in6(out_lut_expr_FU_28_i0_fu___float_adde8m23b_127nih_43697_50673),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50682 (.out1(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_43697_50682),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43697_49000),
    .in3(out_ui_extract_bit_expr_FU_37_i0_fu___float_adde8m23b_127nih_43697_49053),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50686 (.out1(out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_43697_50686),
    .in1(out_const_19),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43697_48965),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43697_48972),
    .in4(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43697_48979),
    .in5(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_43697_49018),
    .in6(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_43697_49025),
    .in7(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_43697_49032),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50690 (.out1(out_lut_expr_FU_41_i0_fu___float_adde8m23b_127nih_43697_50690),
    .in1(out_const_21),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43697_48958),
    .in3(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43697_49007),
    .in4(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_43697_49011),
    .in5(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_43697_49060),
    .in6(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_43697_50682),
    .in7(out_lut_expr_FU_40_i0_fu___float_adde8m23b_127nih_43697_50686),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(22),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50698 (.out1(out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_43697_50698),
    .in1(out_const_24),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_43697_49781),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_43697_49532),
    .in5(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_43697_49785),
    .in6(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_43697_49540),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50702 (.out1(out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_43697_50702),
    .in1(out_const_39),
    .in2(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_43697_49773),
    .in3(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde8m23b_127nih_43697_49516),
    .in4(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in5(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_43697_49777),
    .in6(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_43697_49524),
    .in7(out_lut_expr_FU_72_i0_fu___float_adde8m23b_127nih_43697_50698),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50706 (.out1(out_lut_expr_FU_74_i0_fu___float_adde8m23b_127nih_43697_50706),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_43697_49797),
    .in4(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_43697_49564),
    .in5(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_43697_49801),
    .in6(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_43697_49573),
    .in7(out_lut_expr_FU_73_i0_fu___float_adde8m23b_127nih_43697_50702),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50711 (.out1(out_lut_expr_FU_84_i0_fu___float_adde8m23b_127nih_43697_50711),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde8m23b_127nih_43697_49789),
    .in4(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde8m23b_127nih_43697_49548),
    .in5(out_ui_extract_bit_expr_FU_77_i0_fu___float_adde8m23b_127nih_43697_50055),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50715 (.out1(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_43697_50715),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde8m23b_127nih_43697_49793),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde8m23b_127nih_43697_49556),
    .in5(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_43697_50323),
    .in6(out_ui_extract_bit_expr_FU_79_i0_fu___float_adde8m23b_127nih_43697_50067),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50718 (.out1(out_lut_expr_FU_86_i0_fu___float_adde8m23b_127nih_43697_50718),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde8m23b_127nih_43697_49797),
    .in4(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde8m23b_127nih_43697_49564),
    .in5(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_43697_50327),
    .in6(out_ui_extract_bit_expr_FU_81_i0_fu___float_adde8m23b_127nih_43697_50079),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50721 (.out1(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_43697_50721),
    .in1(out_const_79),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde8m23b_127nih_43697_49801),
    .in4(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_43697_49573),
    .in5(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_43697_50331),
    .in6(out_ui_extract_bit_expr_FU_83_i0_fu___float_adde8m23b_127nih_43697_50091),
    .in7(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50725 (.out1(out_lut_expr_FU_92_i0_fu___float_adde8m23b_127nih_43697_50725),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde8m23b_127nih_43697_49781),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde8m23b_127nih_43697_49532),
    .in5(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde8m23b_127nih_43697_50549),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50728 (.out1(out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_43697_50728),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde8m23b_127nih_43697_49785),
    .in4(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde8m23b_127nih_43697_49540),
    .in5(out_ui_extract_bit_expr_FU_91_i0_fu___float_adde8m23b_127nih_43697_50561),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50732 (.out1(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_43697_50732),
    .in1(out_const_64),
    .in2(out_lut_expr_FU_87_i0_fu___float_adde8m23b_127nih_43697_50721),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in4(out_lut_expr_FU_93_i0_fu___float_adde8m23b_127nih_43697_50728),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50736 (.out1(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_43697_50736),
    .in1(out_const_41),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde8m23b_127nih_43697_49777),
    .in4(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde8m23b_127nih_43697_49524),
    .in5(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde8m23b_127nih_43697_50651),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50741 (.out1(out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_43697_50741),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43697_48969),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43697_48972),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50745 (.out1(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_43697_50745),
    .in1(out_const_67),
    .in2(out_lut_expr_FU_85_i0_fu___float_adde8m23b_127nih_43697_50715),
    .in3(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in4(out_lut_expr_FU_94_i0_fu___float_adde8m23b_127nih_43697_50732),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090),
    .in6(out_lut_expr_FU_98_i0_fu___float_adde8m23b_127nih_43697_50736),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50748 (.out1(out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_43697_50748),
    .in1(out_const_27),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13),
    .in4(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_43697_50745),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50752 (.out1(out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_43697_50752),
    .in1(out_const_71),
    .in2(out_reg_14_reg_14),
    .in3(out_reg_15_reg_15),
    .in4(out_reg_28_reg_28),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090),
    .in7(out_lut_expr_FU_108_i0_fu___float_adde8m23b_127nih_43697_50748),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50756 (.out1(out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_43697_50756),
    .in1(out_const_58),
    .in2(out_reg_18_reg_18),
    .in3(out_reg_19_reg_19),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in5(out_lut_expr_FU_109_i0_fu___float_adde8m23b_127nih_43697_50752),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50760 (.out1(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_43697_50760),
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
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50763 (.out1(out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_43697_50763),
    .in1(out_const_18),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in4(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in5(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090),
    .in6(out_lut_expr_FU_107_i0_fu___float_adde8m23b_127nih_43697_50745),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(39),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50769 (.out1(out_lut_expr_FU_114_i0_fu___float_adde8m23b_127nih_43697_50769),
    .in1(out_const_23),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_43697_50323),
    .in4(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde8m23b_127nih_43697_50331),
    .in5(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in6(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in7(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50772 (.out1(out_lut_expr_FU_115_i0_fu___float_adde8m23b_127nih_43697_50772),
    .in1(out_const_15),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_43697_50327),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50775 (.out1(out_lut_expr_FU_116_i0_fu___float_adde8m23b_127nih_43697_50775),
    .in1(out_const_15),
    .in2(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in3(out_ui_extract_bit_expr_FU_78_i0_fu___float_adde8m23b_127nih_43697_50323),
    .in4(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in5(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in6(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(38),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50779 (.out1(out_lut_expr_FU_117_i0_fu___float_adde8m23b_127nih_43697_50779),
    .in1(out_const_49),
    .in2(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde8m23b_127nih_43697_49773),
    .in3(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .in4(out_ui_extract_bit_expr_FU_80_i0_fu___float_adde8m23b_127nih_43697_50327),
    .in5(out_lut_expr_FU_75_i0_fu___float_adde8m23b_127nih_43697_45082),
    .in6(out_lut_expr_FU_88_i0_fu___float_adde8m23b_127nih_43697_45086),
    .in7(out_lut_expr_FU_95_i0_fu___float_adde8m23b_127nih_43697_45090),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50784 (.out1(out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_43697_50784),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_43697_48997),
    .in3(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43697_49000),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50788 (.out1(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_43697_50788),
    .in1(out_const_51),
    .in2(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_43697_48990),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43697_48993),
    .in4(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_43697_49004),
    .in5(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43697_49007),
    .in6(out_lut_expr_FU_27_i0_fu___float_adde8m23b_127nih_43697_50669),
    .in7(out_lut_expr_FU_120_i0_fu___float_adde8m23b_127nih_43697_50784),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50792 (.out1(out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_43697_50792),
    .in1(out_const_52),
    .in2(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43697_48969),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43697_48972),
    .in4(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_43697_48976),
    .in5(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43697_48979),
    .in6(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_43697_50788),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50795 (.out1(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_43697_50795),
    .in1(out_const_52),
    .in2(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_43697_48955),
    .in3(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43697_48958),
    .in4(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_43697_48962),
    .in5(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43697_48965),
    .in6(out_lut_expr_FU_122_i0_fu___float_adde8m23b_127nih_43697_50792),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(57),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50799 (.out1(out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_43697_50799),
    .in1(out_const_20),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43697_48965),
    .in3(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43697_48972),
    .in4(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43697_48979),
    .in5(out_ui_extract_bit_expr_FU_32_i0_fu___float_adde8m23b_127nih_43697_49018),
    .in6(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde8m23b_127nih_43697_49025),
    .in7(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde8m23b_127nih_43697_49032),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(45),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50803 (.out1(out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_43697_50803),
    .in1(out_const_34),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43697_48958),
    .in3(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43697_49007),
    .in4(out_ui_extract_bit_expr_FU_31_i0_fu___float_adde8m23b_127nih_43697_49011),
    .in5(out_ui_extract_bit_expr_FU_38_i0_fu___float_adde8m23b_127nih_43697_49060),
    .in6(out_lut_expr_FU_39_i0_fu___float_adde8m23b_127nih_43697_50682),
    .in7(out_lut_expr_FU_124_i0_fu___float_adde8m23b_127nih_43697_50799),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50807 (.out1(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_43697_50807),
    .in1(out_const_33),
    .in2(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43697_48986),
    .in3(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43697_48993),
    .in4(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde8m23b_127nih_43697_49039),
    .in5(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde8m23b_127nih_43697_49046),
    .in6(out_lut_expr_FU_125_i0_fu___float_adde8m23b_127nih_43697_50803),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50810 (.out1(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_43697_50810),
    .in1(out_const_13),
    .in2(out_lut_expr_FU_123_i0_fu___float_adde8m23b_127nih_43697_50795),
    .in3(out_lut_expr_FU_126_i0_fu___float_adde8m23b_127nih_43697_50807),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50814 (.out1(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_43697_50814),
    .in1(out_const_59),
    .in2(out_reg_22_reg_22),
    .in3(out_reg_23_reg_23),
    .in4(out_reg_24_reg_24),
    .in5(out_reg_25_reg_25),
    .in6(out_lut_expr_FU_111_i0_fu___float_adde8m23b_127nih_43697_50760),
    .in7(out_reg_36_reg_36),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(59),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50818 (.out1(out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_43697_50818),
    .in1(out_const_53),
    .in2(out_reg_16_reg_16),
    .in3(out_reg_17_reg_17),
    .in4(out_reg_18_reg_18),
    .in5(out_reg_19_reg_19),
    .in6(out_ui_extract_bit_expr_FU_71_i0_fu___float_adde8m23b_127nih_43697_49573),
    .in7(out_reg_29_reg_29),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50822 (.out1(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_43697_50822),
    .in1(out_const_73),
    .in2(out_reg_12_reg_12),
    .in3(out_reg_13_reg_13),
    .in4(out_reg_14_reg_14),
    .in5(out_reg_15_reg_15),
    .in6(out_lut_expr_FU_128_i0_fu___float_adde8m23b_127nih_43697_50814),
    .in7(out_reg_37_reg_37),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50826 (.out1(out_lut_expr_FU_132_i0_fu___float_adde8m23b_127nih_43697_50826),
    .in1(out_const_16),
    .in2(out_reg_30_reg_30),
    .in3(out_lut_expr_FU_130_i0_fu___float_adde8m23b_127nih_43697_50822),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_43697_50837 (.out1(out_lut_expr_FU_140_i0_fu___float_adde8m23b_127nih_43697_50837),
    .in1(out_const_27),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43697_48457),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43697_48464),
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
    .in1(out_ui_ne_expr_FU_32_0_32_200_i0_fu___float_adde8m23b_127nih_43697_44205),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_54_i0_fu___float_adde8m23b_127nih_43697_44254),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde8m23b_127nih_43697_48460),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde8m23b_127nih_43697_48464),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_11_i0_fu___float_adde8m23b_127nih_43697_48955),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_12_i0_fu___float_adde8m23b_127nih_43697_48958),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_13_i0_fu___float_adde8m23b_127nih_43697_48962),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_14_i0_fu___float_adde8m23b_127nih_43697_48965),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_15_i0_fu___float_adde8m23b_127nih_43697_48969),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde8m23b_127nih_43697_48972),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde8m23b_127nih_43697_48976),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde8m23b_127nih_43697_48979),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_186_i0_fu___float_adde8m23b_127nih_43697_44864),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde8m23b_127nih_43697_48983),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde8m23b_127nih_43697_48986),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_21_i0_fu___float_adde8m23b_127nih_43697_48990),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_22_i0_fu___float_adde8m23b_127nih_43697_48993),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_23_i0_fu___float_adde8m23b_127nih_43697_48997),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_24_i0_fu___float_adde8m23b_127nih_43697_49000),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_25_i0_fu___float_adde8m23b_127nih_43697_49004),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde8m23b_127nih_43697_49007),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_106_i0_fu___float_adde8m23b_127nih_43697_50741),
    .wenable(wrenable_reg_28));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_121_i0_fu___float_adde8m23b_127nih_43697_50788),
    .wenable(wrenable_reg_29));
  register_STD #(.BITSIZE_in1(25),
    .BITSIZE_out1(25)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_201_i2_fu___float_adde8m23b_127nih_43697_45592),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_127_i0_fu___float_adde8m23b_127nih_43697_50810),
    .wenable(wrenable_reg_30));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_pm_expr_FU_8_0_8_8_211_i0_fu___float_adde8m23b_127nih_43697_44682),
    .wenable(wrenable_reg_31));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_154_i2_fu___float_adde8m23b_127nih_43697_44692),
    .wenable(wrenable_reg_32));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_119_i0_fu___float_adde8m23b_127nih_43697_44731),
    .wenable(wrenable_reg_33));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_176_i0_fu___float_adde8m23b_127nih_43697_45078),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_110_i0_fu___float_adde8m23b_127nih_43697_50756),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_112_i0_fu___float_adde8m23b_127nih_43697_50763),
    .wenable(wrenable_reg_36));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_129_i0_fu___float_adde8m23b_127nih_43697_50818),
    .wenable(wrenable_reg_37));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_8_0_8_159_i0_fu___float_adde8m23b_127nih_43697_45599),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_136_i0_fu___float_adde8m23b_127nih_43697_45871),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_137_i0_fu___float_adde8m23b_127nih_43697_45959),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_43697_47589),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_135_i0_fu___float_adde8m23b_127nih_43697_48007),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde8m23b_127nih_43697_48457),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_conv_out_ui_bit_ior_expr_FU_0_32_32_165_i0_fu___float_adde8m23b_127nih_43697_44898_32_64;

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
  wire [7:0] out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_42657_45979;
  wire [7:0] out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_42657_45981;
  wire signed [2:0] out_UIdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_42657_43007;
  wire signed [1:0] out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_42657_43010;
  wire signed [1:0] out_UIdata_converter_FU_42_i0_fu___float_mule8m23b_127nih_42657_43040;
  wire signed [2:0] out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_42657_43013;
  wire signed [1:0] out_UIdata_converter_FU_48_i0_fu___float_mule8m23b_127nih_42657_43043;
  wire signed [1:0] out_UIdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_42657_43058;
  wire signed [1:0] out_UIdata_converter_FU_57_i0_fu___float_mule8m23b_127nih_42657_43348;
  wire [7:0] out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_42657_42767;
  wire out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_42657_45749;
  wire out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_42657_42895;
  wire out_UUdata_converter_FU_41_i0_fu___float_mule8m23b_127nih_42657_43037;
  wire out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_42657_45759;
  wire out_UUdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_42657_42973;
  wire [7:0] out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_42657_42782;
  wire out_UUdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_42657_43055;
  wire out_UUdata_converter_FU_53_i0_fu___float_mule8m23b_127nih_42657_43333;
  wire out_UUdata_converter_FU_54_i0_fu___float_mule8m23b_127nih_42657_43336;
  wire out_UUdata_converter_FU_56_i0_fu___float_mule8m23b_127nih_42657_43345;
  wire [9:0] out_UUdata_converter_FU_58_i0_fu___float_mule8m23b_127nih_42657_43367;
  wire out_UUdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_42657_43479;
  wire out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_42657_42805;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_89_i0_fu___float_mule8m23b_127nih_42657_43019;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_89_i1_fu___float_mule8m23b_127nih_42657_43046;
  wire signed [1:0] out_bit_and_expr_FU_8_8_8_89_i2_fu___float_mule8m23b_127nih_42657_43061;
  wire signed [2:0] out_bit_ior_expr_FU_8_8_8_90_i0_fu___float_mule8m23b_127nih_42657_43016;
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
  wire [63:0] out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42657_45779_32_64;
  wire out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42657_47094;
  wire out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42657_47097;
  wire out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42657_47380;
  wire out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_42657_47523;
  wire out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42657_47527;
  wire out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_42657_42849;
  wire out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_42657_43671;
  wire out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_42657_47532;
  wire out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42657_47535;
  wire out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_42657_42927;
  wire out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_42657_43663;
  wire out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_42657_47540;
  wire out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_42657_46259;
  wire out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_42657_46096;
  wire out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_42657_47547;
  wire out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_42657_46263;
  wire out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_42657_46142;
  wire out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_42657_46149;
  wire out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_42657_46163;
  wire out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42657_47555;
  wire out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_42657_45042;
  wire out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_42657_45691;
  wire out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_42657_47562;
  wire out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_42657_47565;
  wire out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_42657_47569;
  wire out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_42657_47573;
  wire out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_42657_45694;
  wire out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_42657_45707;
  wire out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_42657_45666;
  wire out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_42657_42802;
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
  wire [30:0] out_ui_bit_and_expr_FU_0_32_32_91_i0_fu___float_mule8m23b_127nih_42657_43582;
  wire [46:0] out_ui_bit_and_expr_FU_0_64_64_92_i0_fu___float_mule8m23b_127nih_42657_43361;
  wire [32:0] out_ui_bit_and_expr_FU_0_64_64_93_i0_fu___float_mule8m23b_127nih_42657_43405;
  wire [7:0] out_ui_bit_and_expr_FU_0_8_8_94_i0_fu___float_mule8m23b_127nih_42657_42779;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_95_i0_fu___float_mule8m23b_127nih_42657_43001;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_42657_42747;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_42657_42785;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i2_fu___float_mule8m23b_127nih_42657_43376;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_96_i3_fu___float_mule8m23b_127nih_42657_43464;
  wire [23:0] out_ui_bit_and_expr_FU_32_0_32_97_i0_fu___float_mule8m23b_127nih_42657_43127;
  wire [23:0] out_ui_bit_and_expr_FU_32_0_32_97_i1_fu___float_mule8m23b_127nih_42657_43133;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_98_i0_fu___float_mule8m23b_127nih_42657_42764;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_100_i0_fu___float_mule8m23b_127nih_42657_43585;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_42657_43638;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_99_i0_fu___float_mule8m23b_127nih_42657_43107;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_99_i1_fu___float_mule8m23b_127nih_42657_43123;
  wire [32:0] out_ui_bit_ior_expr_FU_0_64_64_102_i0_fu___float_mule8m23b_127nih_42657_43379;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i0_fu___float_mule8m23b_127nih_42657_42898;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_42657_42901;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i2_fu___float_mule8m23b_127nih_42657_42976;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_42657_42979;
  wire [9:0] out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_42657_45661;
  wire [9:0] out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_42657_45725;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_42657_45710;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_42657_45728;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42657_45779;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_42657_45516;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_42657_45525;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_42657_45716;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_42657_45722;
  wire out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_42657_42829;
  wire out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_42657_42915;
  wire out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_42657_46905;
  wire out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_42657_46909;
  wire out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_42657_46913;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_42657_46917;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_42657_46921;
  wire out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_42657_46925;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_42657_46929;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_42657_46933;
  wire out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_42657_46937;
  wire out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_42657_46941;
  wire out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_42657_46945;
  wire out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_42657_46949;
  wire out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_42657_46953;
  wire out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_42657_46957;
  wire out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_42657_46961;
  wire out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_42657_46965;
  wire out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_42657_46443;
  wire out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_42657_45357;
  wire out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_42657_47259;
  wire out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_42657_47083;
  wire out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_42657_46466;
  wire out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42657_47464;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_42657_46276;
  wire out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_42657_46782;
  wire out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_42657_46786;
  wire out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_42657_46790;
  wire out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_42657_46795;
  wire out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_42657_46800;
  wire out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_42657_46805;
  wire out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_42657_46810;
  wire out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_42657_46815;
  wire out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_42657_46512;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_42657_46280;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_42657_42808;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_42657_45316;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_42657_45687;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_42657_45746;
  wire [47:0] out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_42657_43364;
  wire [32:0] out_ui_lshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_42657_43370;
  wire [46:0] out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_42657_43351;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_42657_45732;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_42657_45736;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_42657_45753;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_42657_45762;
  wire [47:0] out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_42657_43136;
  wire out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_42657_43467;
  wire out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_42657_43660;
  wire out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_42657_43668;
  wire [9:0] out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_42657_43339;
  wire [32:0] out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_121_i0_fu___float_mule8m23b_127nih_42657_42755;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_121_i1_fu___float_mule8m23b_127nih_42657_42774;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_42657_45319;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_42657_45680;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_42657_45742;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_42657_45739;
  wire [22:0] out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_mule8m23b_127nih_42657_43373;
  wire [22:0] out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_42657_45306;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_127_i0_fu___float_mule8m23b_127nih_42657_42983;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_42657_42986;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_42657_45756;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_42657_45765;
  wire [9:0] out_ui_ternary_plus_expr_FU_0_16_16_16_129_i0_fu___float_mule8m23b_127nih_42657_43089;
  
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
    .BITSIZE_out1(64)) conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42657_45779_32_64 (.out1(out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42657_45779_32_64),
    .in1(out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42657_45779));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_42657_42747 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_42657_42747),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_40));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_42755 (.out1(out_ui_rshift_expr_FU_32_0_32_121_i0_fu___float_mule8m23b_127nih_42657_42755),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42657_42764 (.out1(out_ui_bit_and_expr_FU_8_0_8_98_i0_fu___float_mule8m23b_127nih_42657_42764),
    .in1(out_ui_rshift_expr_FU_32_0_32_121_i0_fu___float_mule8m23b_127nih_42657_42755),
    .in2(out_const_35));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42657_42767 (.out1(out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_42657_42767),
    .in1(out_ui_bit_and_expr_FU_8_0_8_98_i0_fu___float_mule8m23b_127nih_42657_42764));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_42774 (.out1(out_ui_rshift_expr_FU_32_0_32_121_i1_fu___float_mule8m23b_127nih_42657_42774),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42657_42779 (.out1(out_ui_bit_and_expr_FU_0_8_8_94_i0_fu___float_mule8m23b_127nih_42657_42779),
    .in1(out_const_35),
    .in2(out_ui_rshift_expr_FU_32_0_32_121_i1_fu___float_mule8m23b_127nih_42657_42774));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42657_42782 (.out1(out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_42657_42782),
    .in1(out_ui_bit_and_expr_FU_0_8_8_94_i0_fu___float_mule8m23b_127nih_42657_42779));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_42657_42785 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_42657_42785),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_40));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_42802 (.out1(out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_42657_42802),
    .in1(out_const_20),
    .in2(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_42657_46276),
    .in3(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_42657_46280),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_42805 (.out1(out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_42657_42805),
    .in1(out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_42657_42802));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_42808 (.out1(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_42657_42808),
    .in1(out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_42657_42805),
    .in2(out_const_4));
  ui_eq_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_42829 (.out1(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_42657_42829),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_42657_42747),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_42849 (.out1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_42657_42849),
    .in1(out_const_6),
    .in2(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_42657_42829),
    .in3(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42657_47527),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_42895 (.out1(out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_42657_42895),
    .in1(out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_42657_46259));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_42898 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i0_fu___float_mule8m23b_127nih_42657_42898),
    .in1(out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_42657_45732),
    .in2(out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_42657_45722));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_42901 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_42657_42901),
    .in1(out_UUdata_converter_FU_37_i0_fu___float_mule8m23b_127nih_42657_42895),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_103_i0_fu___float_mule8m23b_127nih_42657_42898));
  ui_eq_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_42915 (.out1(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_42657_42915),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_42657_42785),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_42927 (.out1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_42657_42927),
    .in1(out_const_6),
    .in2(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_42657_42915),
    .in3(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42657_47535),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_42973 (.out1(out_UUdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_42657_42973),
    .in1(out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_42657_46263));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_42976 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i2_fu___float_mule8m23b_127nih_42657_42976),
    .in1(out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_42657_45736),
    .in2(out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_42657_45716));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_42979 (.out1(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_42657_42979),
    .in1(out_UUdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_42657_42973),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_103_i2_fu___float_mule8m23b_127nih_42657_42976));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42657_42983 (.out1(out_ui_rshift_expr_FU_8_0_8_127_i0_fu___float_mule8m23b_127nih_42657_42983),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_42657_42901),
    .in2(out_const_1));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42657_42986 (.out1(out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_42657_42986),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_42657_42979),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43001 (.out1(out_ui_bit_and_expr_FU_1_1_1_95_i0_fu___float_mule8m23b_127nih_42657_43001),
    .in1(out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_42657_42986),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_42657_42979));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_42657_43007 (.out1(out_UIdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_42657_43007),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i1_fu___float_mule8m23b_127nih_42657_42901));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_43010 (.out1(out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_42657_43010),
    .in1(out_ui_rshift_expr_FU_8_0_8_127_i0_fu___float_mule8m23b_127nih_42657_42983));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_42657_43013 (.out1(out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_42657_43013),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_103_i3_fu___float_mule8m23b_127nih_42657_42979));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_42657_43016 (.out1(out_bit_ior_expr_FU_8_8_8_90_i0_fu___float_mule8m23b_127nih_42657_43016),
    .in1(out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_42657_43013),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_42657_43010));
  bit_and_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(3),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_43019 (.out1(out_bit_and_expr_FU_8_8_8_89_i0_fu___float_mule8m23b_127nih_42657_43019),
    .in1(out_bit_ior_expr_FU_8_8_8_90_i0_fu___float_mule8m23b_127nih_42657_43016),
    .in2(out_UIdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_42657_43007));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43037 (.out1(out_UUdata_converter_FU_41_i0_fu___float_mule8m23b_127nih_42657_43037),
    .in1(out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_42657_46096));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_43040 (.out1(out_UIdata_converter_FU_42_i0_fu___float_mule8m23b_127nih_42657_43040),
    .in1(out_UUdata_converter_FU_41_i0_fu___float_mule8m23b_127nih_42657_43037));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_43043 (.out1(out_UIdata_converter_FU_48_i0_fu___float_mule8m23b_127nih_42657_43043),
    .in1(out_ui_rshift_expr_FU_8_0_8_127_i1_fu___float_mule8m23b_127nih_42657_42986));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_43046 (.out1(out_bit_and_expr_FU_8_8_8_89_i1_fu___float_mule8m23b_127nih_42657_43046),
    .in1(out_UIdata_converter_FU_42_i0_fu___float_mule8m23b_127nih_42657_43040),
    .in2(out_UIdata_converter_FU_48_i0_fu___float_mule8m23b_127nih_42657_43043));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43055 (.out1(out_UUdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_42657_43055),
    .in1(out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_42657_46142));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_43058 (.out1(out_UIdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_42657_43058),
    .in1(out_UUdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_42657_43055));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_43061 (.out1(out_bit_and_expr_FU_8_8_8_89_i2_fu___float_mule8m23b_127nih_42657_43061),
    .in1(out_UIdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_42657_43058),
    .in2(out_UIdata_converter_FU_39_i0_fu___float_mule8m23b_127nih_42657_43010));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_42657_43089 (.out1(out_ui_ternary_plus_expr_FU_0_16_16_16_129_i0_fu___float_mule8m23b_127nih_42657_43089),
    .in1(out_const_41),
    .in2(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_42657_45979),
    .in3(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_42657_45981));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_42657_43107 (.out1(out_ui_bit_ior_expr_FU_0_32_32_99_i0_fu___float_mule8m23b_127nih_42657_43107),
    .in1(out_const_12),
    .in2(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_42657_42747));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_42657_43123 (.out1(out_ui_bit_ior_expr_FU_0_32_32_99_i1_fu___float_mule8m23b_127nih_42657_43123),
    .in1(out_const_12),
    .in2(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_42657_42785));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(32),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_42657_43127 (.out1(out_ui_bit_and_expr_FU_32_0_32_97_i0_fu___float_mule8m23b_127nih_42657_43127),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_99_i0_fu___float_mule8m23b_127nih_42657_43107),
    .in2(out_const_43));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(32),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_42657_43133 (.out1(out_ui_bit_and_expr_FU_32_0_32_97_i1_fu___float_mule8m23b_127nih_42657_43133),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_99_i1_fu___float_mule8m23b_127nih_42657_43123),
    .in2(out_const_43));
  ui_mult_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_out1(48),
    .PIPE_PARAMETER(0)) fu___float_mule8m23b_127nih_42657_43136 (.out1(out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_42657_43136),
    .clock(clock),
    .in1(out_ui_bit_and_expr_FU_32_0_32_97_i0_fu___float_mule8m23b_127nih_42657_43127),
    .in2(out_ui_bit_and_expr_FU_32_0_32_97_i1_fu___float_mule8m23b_127nih_42657_43133));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43333 (.out1(out_UUdata_converter_FU_53_i0_fu___float_mule8m23b_127nih_42657_43333),
    .in1(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_42657_46443));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43336 (.out1(out_UUdata_converter_FU_54_i0_fu___float_mule8m23b_127nih_42657_43336),
    .in1(out_UUdata_converter_FU_53_i0_fu___float_mule8m23b_127nih_42657_43333));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_42657_43339 (.out1(out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_42657_43339),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_1_reg_1));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43345 (.out1(out_UUdata_converter_FU_56_i0_fu___float_mule8m23b_127nih_42657_43345),
    .in1(out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_42657_46149));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_43348 (.out1(out_UIdata_converter_FU_57_i0_fu___float_mule8m23b_127nih_42657_43348),
    .in1(out_UUdata_converter_FU_56_i0_fu___float_mule8m23b_127nih_42657_43345));
  ui_lshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(2),
    .BITSIZE_out1(47),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_43351 (.out1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_42657_43351),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_4_reg_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(47),
    .BITSIZE_out1(47)) fu___float_mule8m23b_127nih_42657_43361 (.out1(out_ui_bit_and_expr_FU_0_64_64_92_i0_fu___float_mule8m23b_127nih_42657_43361),
    .in1(out_const_45),
    .in2(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_42657_43351));
  ui_lshift_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(2),
    .BITSIZE_out1(48),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_43364 (.out1(out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_42657_43364),
    .in1(out_ui_bit_and_expr_FU_0_64_64_92_i0_fu___float_mule8m23b_127nih_42657_43361),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_42657_43367 (.out1(out_UUdata_converter_FU_58_i0_fu___float_mule8m23b_127nih_42657_43367),
    .in1(out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_42657_43339));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(6),
    .BITSIZE_out1(33),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_43370 (.out1(out_ui_lshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_42657_43370),
    .in1(out_UUdata_converter_FU_58_i0_fu___float_mule8m23b_127nih_42657_43367),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(6),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_43373 (.out1(out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_mule8m23b_127nih_42657_43373),
    .in1(out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_42657_43364),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_42657_43376 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i2_fu___float_mule8m23b_127nih_42657_43376),
    .in1(out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_mule8m23b_127nih_42657_43373),
    .in2(out_const_40));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(23),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_42657_43379 (.out1(out_ui_bit_ior_expr_FU_0_64_64_102_i0_fu___float_mule8m23b_127nih_42657_43379),
    .in1(out_ui_lshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_42657_43370),
    .in2(out_ui_bit_and_expr_FU_32_0_32_96_i2_fu___float_mule8m23b_127nih_42657_43376));
  ui_bit_and_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(33),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_42657_43405 (.out1(out_ui_bit_and_expr_FU_0_64_64_93_i0_fu___float_mule8m23b_127nih_42657_43405),
    .in1(out_const_44),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_102_i0_fu___float_mule8m23b_127nih_42657_43379));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_42657_43464 (.out1(out_ui_bit_and_expr_FU_32_0_32_96_i3_fu___float_mule8m23b_127nih_42657_43464),
    .in1(out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_42657_45306),
    .in2(out_const_40));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43467 (.out1(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_42657_43467),
    .in1(out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_42657_45319),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43479 (.out1(out_UUdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_42657_43479),
    .in1(out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_42657_46163));
  ui_plus_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(1),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_42657_43489 (.out1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in1(out_ui_bit_and_expr_FU_0_64_64_93_i0_fu___float_mule8m23b_127nih_42657_43405),
    .in2(out_UUdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_42657_43479));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(33),
    .BITSIZE_out1(31)) fu___float_mule8m23b_127nih_42657_43582 (.out1(out_ui_bit_and_expr_FU_0_32_32_91_i0_fu___float_mule8m23b_127nih_42657_43582),
    .in1(out_const_42),
    .in2(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_42657_43585 (.out1(out_ui_bit_ior_expr_FU_0_32_32_100_i0_fu___float_mule8m23b_127nih_42657_43585),
    .in1(out_ui_bit_and_expr_FU_0_32_32_91_i0_fu___float_mule8m23b_127nih_42657_43582),
    .in2(out_reg_0_reg_0));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_42657_43638 (.out1(out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_42657_43638),
    .in1(out_const_36),
    .in2(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_42657_42808));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43660 (.out1(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_42657_43660),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i1_fu___float_mule8m23b_127nih_42657_42785),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43663 (.out1(out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_42657_43663),
    .in1(out_const_6),
    .in2(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_42657_43660),
    .in3(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42657_47535),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43668 (.out1(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_42657_43668),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i0_fu___float_mule8m23b_127nih_42657_42747),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_43671 (.out1(out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_42657_43671),
    .in1(out_const_6),
    .in2(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_42657_43668),
    .in3(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42657_47527),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_45042 (.out1(out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_42657_45042),
    .in1(out_const_11),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42657_47094),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42657_47097),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42657_47464),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42657_47380),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42657_47555),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_45306 (.out1(out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_mule8m23b_127nih_42657_45306),
    .in1(out_ui_lshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_42657_43364),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_45316 (.out1(out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_42657_45316),
    .in1(out_ui_bit_and_expr_FU_32_0_32_96_i3_fu___float_mule8m23b_127nih_42657_43464),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_45319 (.out1(out_ui_rshift_expr_FU_32_0_32_122_i0_fu___float_mule8m23b_127nih_42657_45319),
    .in1(out_ui_lshift_expr_FU_32_0_32_109_i0_fu___float_mule8m23b_127nih_42657_45316),
    .in2(out_const_5));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(4)) fu___float_mule8m23b_127nih_42657_45357 (.out1(out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_42657_45357),
    .in1(out_ui_plus_expr_FU_16_16_16_119_i0_fu___float_mule8m23b_127nih_42657_43339),
    .in2(out_const_15));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_45516 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_42657_45516),
    .in1(out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_42657_43663),
    .in2(out_const_19),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_45525 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_42657_45525),
    .in1(out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_42657_43671),
    .in2(out_const_19),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_in3(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_42657_45661 (.out1(out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_42657_45661),
    .in1(out_lut_expr_FU_70_i0_fu___float_mule8m23b_127nih_42657_45042),
    .in2(out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_42657_45680),
    .in3(out_const_37));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_45666 (.out1(out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_42657_45666),
    .in1(out_const_38),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42657_47094),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42657_47097),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42657_47464),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42657_47380),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42657_47555),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_45680 (.out1(out_ui_rshift_expr_FU_32_0_32_123_i0_fu___float_mule8m23b_127nih_42657_45680),
    .in1(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_42657_42808),
    .in2(out_const_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_45687 (.out1(out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_42657_45687),
    .in1(out_ui_cond_expr_FU_16_16_16_16_104_i0_fu___float_mule8m23b_127nih_42657_45661),
    .in2(out_const_16));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_45691 (.out1(out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_42657_45691),
    .in1(out_const_39),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42657_47094),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42657_47097),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42657_47464),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42657_47380),
    .in6(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42657_47555),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_45694 (.out1(out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_42657_45694),
    .in1(out_const_9),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_8_reg_8),
    .in4(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_42657_47569),
    .in5(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_42657_47573),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_45707 (.out1(out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_42657_45707),
    .in1(out_const_10),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_8_reg_8),
    .in4(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_42657_47569),
    .in5(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_42657_47573),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_42657_45710 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_42657_45710),
    .in1(out_lut_expr_FU_86_i0_fu___float_mule8m23b_127nih_42657_45707),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_100_i0_fu___float_mule8m23b_127nih_42657_43585),
    .in3(out_reg_0_reg_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_45716 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i2_fu___float_mule8m23b_127nih_42657_45716),
    .in1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_42657_42927),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_106_i0_fu___float_mule8m23b_127nih_42657_45516));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_42657_45722 (.out1(out_ui_cond_expr_FU_8_8_8_8_106_i3_fu___float_mule8m23b_127nih_42657_45722),
    .in1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_42657_42849),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_8_8_8_8_106_i1_fu___float_mule8m23b_127nih_42657_45525));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_in3(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_42657_45725 (.out1(out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_42657_45725),
    .in1(out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_42657_45666),
    .in2(out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_42657_45739),
    .in3(out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_42657_45742));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_42657_45728 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_42657_45728),
    .in1(out_lut_expr_FU_85_i0_fu___float_mule8m23b_127nih_42657_45694),
    .in2(out_reg_5_reg_5),
    .in3(out_ui_cond_expr_FU_32_32_32_32_105_i0_fu___float_mule8m23b_127nih_42657_45710));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42657_45732 (.out1(out_ui_lshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_42657_45732),
    .in1(out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_42657_45756),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42657_45736 (.out1(out_ui_lshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_42657_45736),
    .in1(out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_42657_45765),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_45739 (.out1(out_ui_rshift_expr_FU_32_0_32_124_i0_fu___float_mule8m23b_127nih_42657_45739),
    .in1(out_ui_lshift_expr_FU_32_0_32_110_i0_fu___float_mule8m23b_127nih_42657_45687),
    .in2(out_const_16));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_45742 (.out1(out_ui_rshift_expr_FU_32_0_32_123_i1_fu___float_mule8m23b_127nih_42657_45742),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_42657_43638),
    .in2(out_const_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_42657_45746 (.out1(out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_42657_45746),
    .in1(out_ui_cond_expr_FU_16_16_16_16_104_i1_fu___float_mule8m23b_127nih_42657_45725),
    .in2(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_45749 (.out1(out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_42657_45749),
    .in1(out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_42657_42849));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42657_45753 (.out1(out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_42657_45753),
    .in1(out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_42657_45749),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42657_45756 (.out1(out_ui_rshift_expr_FU_8_0_8_128_i0_fu___float_mule8m23b_127nih_42657_45756),
    .in1(out_ui_lshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_42657_45753),
    .in2(out_const_25));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_45759 (.out1(out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_42657_45759),
    .in1(out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_42657_42927));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42657_45762 (.out1(out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_42657_45762),
    .in1(out_UUdata_converter_FU_43_i0_fu___float_mule8m23b_127nih_42657_45759),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_42657_45765 (.out1(out_ui_rshift_expr_FU_8_0_8_128_i1_fu___float_mule8m23b_127nih_42657_45765),
    .in1(out_ui_lshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_42657_45762),
    .in2(out_const_25));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_42657_45779 (.out1(out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42657_45779),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_7_reg_7),
    .in3(out_ui_cond_expr_FU_32_32_32_32_105_i1_fu___float_mule8m23b_127nih_42657_45728));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42657_45979 (.out1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_42657_45979),
    .in1(out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_42657_42767));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_42657_45981 (.out1(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_42657_45981),
    .in1(out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_42657_42782));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_46096 (.out1(out_lut_expr_FU_40_i0_fu___float_mule8m23b_127nih_42657_46096),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_42657_46905),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_42657_46909),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_42657_42829),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_42657_43668),
    .in6(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42657_47527),
    .in7(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_42657_47540),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_46142 (.out1(out_lut_expr_FU_49_i0_fu___float_mule8m23b_127nih_42657_46142),
    .in1(out_const_32),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_42657_46937),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_42657_46941),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_42657_42915),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_42657_43660),
    .in6(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42657_47535),
    .in7(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_42657_47547),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_46149 (.out1(out_lut_expr_FU_55_i0_fu___float_mule8m23b_127nih_42657_46149),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_42657_46443),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_46163 (.out1(out_lut_expr_FU_62_i0_fu___float_mule8m23b_127nih_42657_46163),
    .in1(out_const_27),
    .in2(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_42657_43467),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_42657_47259),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_42657_47083),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_46259 (.out1(out_lut_expr_FU_36_i0_fu___float_mule8m23b_127nih_42657_46259),
    .in1(out_const_28),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_42657_46905),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_42657_46909),
    .in4(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42657_47527),
    .in5(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_42657_47540),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_46263 (.out1(out_lut_expr_FU_45_i0_fu___float_mule8m23b_127nih_42657_46263),
    .in1(out_const_28),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_42657_46937),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_42657_46941),
    .in4(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42657_47535),
    .in5(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_42657_47547),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46276 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_42657_46276),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46280 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_42657_46280),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(6)) fu___float_mule8m23b_127nih_42657_46443 (.out1(out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_42657_46443),
    .in1(out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_42657_43136),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(6)) fu___float_mule8m23b_127nih_42657_46466 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_42657_46466),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in2(out_const_7));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46512 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_42657_46512),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46782 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_42657_46782),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46786 (.out1(out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_42657_46786),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46790 (.out1(out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_42657_46790),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46795 (.out1(out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_42657_46795),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46800 (.out1(out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_42657_46800),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46805 (.out1(out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_42657_46805),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46810 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_42657_46810),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46815 (.out1(out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_42657_46815),
    .in1(out_ui_plus_expr_FU_32_32_32_120_i0_fu___float_mule8m23b_127nih_42657_43489),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46905 (.out1(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_42657_46905),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46909 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_42657_46909),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46913 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_42657_46913),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46917 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_42657_46917),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46921 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_42657_46921),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46925 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_42657_46925),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46929 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_42657_46929),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46933 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_42657_46933),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46937 (.out1(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_42657_46937),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46941 (.out1(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_42657_46941),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46945 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_42657_46945),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46949 (.out1(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_42657_46949),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46953 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_42657_46953),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46957 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_42657_46957),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_26));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46961 (.out1(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_42657_46961),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_30));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_46965 (.out1(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_42657_46965),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_31));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_47083 (.out1(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_42657_47083),
    .in1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_42657_43351),
    .in2(out_const_17));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_42657_47094 (.out1(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42657_47094),
    .in1(out_bit_and_expr_FU_8_8_8_89_i1_fu___float_mule8m23b_127nih_42657_43046),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_42657_47097 (.out1(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42657_47097),
    .in1(out_bit_and_expr_FU_8_8_8_89_i2_fu___float_mule8m23b_127nih_42657_43061),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(5)) fu___float_mule8m23b_127nih_42657_47259 (.out1(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_42657_47259),
    .in1(out_ui_lshift_expr_FU_64_64_64_113_i0_fu___float_mule8m23b_127nih_42657_43351),
    .in2(out_const_21));
  extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_42657_47380 (.out1(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42657_47380),
    .in1(out_bit_and_expr_FU_8_8_8_89_i0_fu___float_mule8m23b_127nih_42657_43019),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_42657_47464 (.out1(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42657_47464),
    .in1(out_ui_bit_and_expr_FU_1_1_1_95_i0_fu___float_mule8m23b_127nih_42657_43001),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47523 (.out1(out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_42657_47523),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_42657_46905),
    .in3(out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_42657_46909),
    .in4(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_42657_46913),
    .in5(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_42657_46917),
    .in6(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_42657_46929),
    .in7(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_42657_46933),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47527 (.out1(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42657_47527),
    .in1(out_const_8),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_42657_46921),
    .in3(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_42657_46925),
    .in4(out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_42657_47523),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47532 (.out1(out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_42657_47532),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_42657_46937),
    .in3(out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_42657_46941),
    .in4(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_42657_46945),
    .in5(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_42657_46949),
    .in6(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_42657_46961),
    .in7(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_42657_46965),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47535 (.out1(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42657_47535),
    .in1(out_const_8),
    .in2(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_42657_46953),
    .in3(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_42657_46957),
    .in4(out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_42657_47532),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47540 (.out1(out_lut_expr_FU_35_i0_fu___float_mule8m23b_127nih_42657_47540),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_42657_46913),
    .in3(out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_42657_46917),
    .in4(out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_42657_46921),
    .in5(out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_42657_46925),
    .in6(out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_42657_46929),
    .in7(out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_42657_46933),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47547 (.out1(out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_42657_47547),
    .in1(out_const_5),
    .in2(out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_42657_46945),
    .in3(out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_42657_46949),
    .in4(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_42657_46953),
    .in5(out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_42657_46957),
    .in6(out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_42657_46961),
    .in7(out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_42657_46965),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(49),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47555 (.out1(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42657_47555),
    .in1(out_const_14),
    .in2(out_ui_eq_expr_FU_32_0_32_107_i0_fu___float_mule8m23b_127nih_42657_42829),
    .in3(out_ui_ne_expr_FU_32_0_32_118_i1_fu___float_mule8m23b_127nih_42657_43668),
    .in4(out_ui_eq_expr_FU_32_0_32_107_i1_fu___float_mule8m23b_127nih_42657_42915),
    .in5(out_ui_ne_expr_FU_32_0_32_118_i0_fu___float_mule8m23b_127nih_42657_43660),
    .in6(out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_42657_47527),
    .in7(out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_42657_47535),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47562 (.out1(out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_42657_47562),
    .in1(out_const_5),
    .in2(out_extract_bit_expr_FU_65_i0_fu___float_mule8m23b_127nih_42657_47094),
    .in3(out_extract_bit_expr_FU_66_i0_fu___float_mule8m23b_127nih_42657_47097),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_mule8m23b_127nih_42657_47464),
    .in5(out_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_42657_47380),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47565 (.out1(out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_42657_47565),
    .in1(out_const_13),
    .in2(out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_42657_46782),
    .in3(out_ui_extract_bit_expr_FU_72_i0_fu___float_mule8m23b_127nih_42657_46786),
    .in4(out_ui_extract_bit_expr_FU_73_i0_fu___float_mule8m23b_127nih_42657_46790),
    .in5(out_ui_extract_bit_expr_FU_74_i0_fu___float_mule8m23b_127nih_42657_46795),
    .in6(out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_42657_46810),
    .in7(out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_42657_46815),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47569 (.out1(out_lut_expr_FU_83_i0_fu___float_mule8m23b_127nih_42657_47569),
    .in1(out_const_29),
    .in2(out_ui_extract_bit_expr_FU_75_i0_fu___float_mule8m23b_127nih_42657_46800),
    .in3(out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_42657_46805),
    .in4(out_ui_extract_bit_expr_FU_79_i0_fu___float_mule8m23b_127nih_42657_46512),
    .in5(out_lut_expr_FU_82_i0_fu___float_mule8m23b_127nih_42657_47565),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_42657_47573 (.out1(out_lut_expr_FU_84_i0_fu___float_mule8m23b_127nih_42657_47573),
    .in1(out_const_34),
    .in2(out_ui_ne_expr_FU_32_0_32_117_i0_fu___float_mule8m23b_127nih_42657_43467),
    .in3(out_ui_extract_bit_expr_FU_60_i0_fu___float_mule8m23b_127nih_42657_47259),
    .in4(out_ui_extract_bit_expr_FU_61_i0_fu___float_mule8m23b_127nih_42657_47083),
    .in5(out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_42657_45357),
    .in6(out_ui_extract_bit_expr_FU_64_i0_fu___float_mule8m23b_127nih_42657_46466),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_108_i0_fu___float_mule8m23b_127nih_42657_42808),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_plus_expr_FU_0_16_16_16_129_i0_fu___float_mule8m23b_127nih_42657_43089),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(48),
    .BITSIZE_out1(48)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_116_i0_fu___float_mule8m23b_127nih_42657_43136),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_54_i0_fu___float_mule8m23b_127nih_42657_43336),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_57_i0_fu___float_mule8m23b_127nih_42657_43348),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_101_i0_fu___float_mule8m23b_127nih_42657_43638),
    .wenable(wrenable_reg_5));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_80_i0_fu___float_mule8m23b_127nih_42657_45691),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_110_i1_fu___float_mule8m23b_127nih_42657_45746),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_69_i0_fu___float_mule8m23b_127nih_42657_47555),
    .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_81_i0_fu___float_mule8m23b_127nih_42657_47562),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_conv_out_ui_cond_expr_FU_32_32_32_32_105_i2_fu___float_mule8m23b_127nih_42657_45779_32_64;

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
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665,
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
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665);
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
  input selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661;
  input selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665;
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
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713;
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717;
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719;
  output OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721;
  output OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661;
  output OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665;
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
  wire [31:0] out_UUdata_converter_FU_13_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44963;
  wire [31:0] out_UUdata_converter_FU_14_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44966;
  wire [31:0] out_UUdata_converter_FU_15_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44960;
  wire [31:0] out_UUdata_converter_FU_16_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44988;
  wire [31:0] out_UUdata_converter_FU_17_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44991;
  wire [31:0] out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44985;
  wire [63:0] out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661;
  wire [63:0] out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665;
  wire out_const_0;
  wire [6:0] out_const_1;
  wire out_const_2;
  wire [1:0] out_const_3;
  wire [7:0] out_const_4;
  wire [31:0] out_conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661_64_32;
  wire [31:0] out_conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665_64_32;
  wire [29:0] out_conv_out_const_0_1_30;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [5:0] out_conv_out_const_1_7_6;
  wire [63:0] out_conv_out_reg_10_reg_10_32_64;
  wire [63:0] out_conv_out_reg_11_reg_11_32_64;
  wire [63:0] out_conv_out_reg_12_reg_12_32_64;
  wire [63:0] out_conv_out_reg_13_reg_13_32_64;
  wire [29:0] out_conv_out_reg_6_reg_6_32_30;
  wire out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_45777;
  wire out_read_cond_FU_19_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719;
  wire out_read_cond_FU_20_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721;
  wire out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713;
  wire out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717;
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
  wire out_ui_eq_expr_FU_32_0_32_22_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42633;
  wire out_ui_eq_expr_FU_32_0_32_22_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42635;
  wire out_ui_eq_expr_FU_32_0_32_22_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42637;
  wire out_ui_le_expr_FU_32_32_32_23_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42639;
  wire out_ui_le_expr_FU_32_32_32_23_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42641;
  wire out_ui_le_expr_FU_32_32_32_23_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42643;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_24_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36634;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_24_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36678;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_24_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36697;
  wire [29:0] out_ui_mult_expr_FU_32_32_32_0_25_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36642;
  wire [29:0] out_ui_mult_expr_FU_32_32_32_0_25_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36703;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_26_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36649;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_26_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36657;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36687;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_27_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36638;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_27_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36681;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_27_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36700;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36629;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_28_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36673;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_28_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36692;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [29:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [29:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire [31:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3;
  wire s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661;
  wire s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665;
  
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
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36629));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_21_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_21_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_28_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36673),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_28_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36692));
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
    .in1(out_ui_plus_expr_FU_32_0_32_26_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36649),
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
    .in2(out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44985));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_37_reg_6_0_0_0 (.out1(out_MUX_37_reg_6_0_0_0),
    .sel(selector_MUX_37_reg_6_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36687),
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
    .in1(out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44985));
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
    .BITSIZE_out1(32)) conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661_64_32 (.out1(out_conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661_64_32),
    .in1(out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665_64_32 (.out1(out_conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665_64_32),
    .in1(out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665));
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
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36629 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36629),
    .in1(in_port_C),
    .in2(out_ui_lshift_expr_FU_32_0_32_24_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36634));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36634 (.out1(out_ui_lshift_expr_FU_32_0_32_24_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36634),
    .in1(out_ui_plus_expr_FU_32_32_32_27_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36638),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36638 (.out1(out_ui_plus_expr_FU_32_32_32_27_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36638),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_2_reg_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30),
    .PIPE_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36642 (.out1(out_ui_mult_expr_FU_32_32_32_0_25_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36642),
    .clock(clock),
    .in1(in_port_n),
    .in2(out_reg_0_reg_0));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36649 (.out1(out_ui_plus_expr_FU_32_0_32_26_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36649),
    .in1(out_reg_0_reg_0),
    .in2(out_const_2));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36657 (.out1(out_ui_plus_expr_FU_32_0_32_26_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36657),
    .in1(out_reg_2_reg_2),
    .in2(out_const_2));
  __float_adde8m23b_127nih fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661 (.done_port(s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661),
    .return_port(out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661),
    .a(out_conv_out_reg_13_reg_13_32_64),
    .b(out_conv_out_reg_10_reg_10_32_64));
  __float_mule8m23b_127nih fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665 (.done_port(s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665),
    .return_port(out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665),
    .a(out_conv_out_reg_11_reg_11_32_64),
    .b(out_conv_out_reg_12_reg_12_32_64));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36673 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_28_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36673),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_24_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36678));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36678 (.out1(out_ui_lshift_expr_FU_32_0_32_24_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36678),
    .in1(out_ui_plus_expr_FU_32_32_32_27_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36681),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36681 (.out1(out_ui_plus_expr_FU_32_32_32_27_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36681),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_6_reg_6));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36687 (.out1(out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36687),
    .in1(out_reg_6_reg_6),
    .in2(out_const_2));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36692 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_28_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36692),
    .in1(in_port_B),
    .in2(out_ui_lshift_expr_FU_32_0_32_24_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36697));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36697 (.out1(out_ui_lshift_expr_FU_32_0_32_24_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36697),
    .in1(out_ui_plus_expr_FU_32_32_32_27_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36700),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(32),
    .BITSIZE_out1(30)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36700 (.out1(out_ui_plus_expr_FU_32_32_32_27_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36700),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_2_reg_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30),
    .PIPE_PARAMETER(0)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36703 (.out1(out_ui_mult_expr_FU_32_32_32_0_25_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36703),
    .clock(clock),
    .in1(in_port_w),
    .in2(out_reg_7_reg_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713 (.out1(out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713),
    .in1(out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_45777));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717 (.out1(out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717),
    .in1(out_ui_le_expr_FU_32_32_32_23_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42639));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719 (.out1(out_read_cond_FU_19_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719),
    .in1(out_reg_9_reg_9));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721 (.out1(out_read_cond_FU_20_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721),
    .in1(out_ui_le_expr_FU_32_32_32_23_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42643));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42633 (.out1(out_ui_eq_expr_FU_32_0_32_22_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42633),
    .in1(in_port_n),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42635 (.out1(out_ui_eq_expr_FU_32_0_32_22_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42635),
    .in1(in_port_w),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42637 (.out1(out_ui_eq_expr_FU_32_0_32_22_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42637),
    .in1(in_port_m),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42639 (.out1(out_ui_le_expr_FU_32_32_32_23_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42639),
    .in1(in_port_n),
    .in2(out_reg_0_reg_0));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42641 (.out1(out_ui_le_expr_FU_32_32_32_23_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42641),
    .in1(in_port_m),
    .in2(out_ui_plus_expr_FU_32_0_32_26_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36687));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42643 (.out1(out_ui_le_expr_FU_32_32_32_23_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42643),
    .in1(in_port_w),
    .in2(out_reg_4_reg_4));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44960 (.out1(out_UUdata_converter_FU_15_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44960),
    .in1(out_conv_out___float_mule8m23b_127nih_30_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665_64_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44963 (.out1(out_UUdata_converter_FU_13_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44963),
    .in1(out_BMEMORY_CTRLN_21_i0_BMEMORY_CTRLN_21_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44966 (.out1(out_UUdata_converter_FU_14_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44966),
    .in1(out_BMEMORY_CTRLN_21_i0_BMEMORY_CTRLN_21_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44985 (.out1(out_UUdata_converter_FU_18_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44985),
    .in1(out_reg_14_reg_14));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44988 (.out1(out_UUdata_converter_FU_16_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44988),
    .in1(out_UUdata_converter_FU_15_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44960));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44991 (.out1(out_UUdata_converter_FU_17_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44991),
    .in1(out_reg_5_reg_5));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_45777 (.out1(out_lut_expr_FU_2_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_45777),
    .in1(out_const_4),
    .in2(out_ui_eq_expr_FU_32_0_32_22_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42633),
    .in3(out_ui_eq_expr_FU_32_0_32_22_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42635),
    .in4(out_ui_eq_expr_FU_32_0_32_22_i2_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42637),
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
    .in1(out_ui_mult_expr_FU_32_32_32_0_25_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36642),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_17_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44991),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_13_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44963),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_14_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44966),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_16_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_44988),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_conv_out___float_adde8m23b_127nih_29_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661_64_32),
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
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_28_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36629),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_26_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36657),
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
    .in1(out_ui_mult_expr_FU_32_32_32_0_25_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36703),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_le_expr_FU_32_32_32_23_i1_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_42641),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713 = out_read_cond_FU_3_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713;
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717 = out_read_cond_FU_9_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717;
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719 = out_read_cond_FU_19_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719;
  assign OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721 = out_read_cond_FU_20_i0_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721;
  assign OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661 = s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661;
  assign OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665 = s_done_fu__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665;

endmodule

// FSM based controller description for _Z21matrix_multiplicationPKfS0_Pfjjj
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z21matrix_multiplicationPKfS0_Pfjjj(done_port,
  fuselector_BMEMORY_CTRLN_21_i0_LOAD,
  fuselector_BMEMORY_CTRLN_21_i0_STORE,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661,
  selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665,
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
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719,
  OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661,
  OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713;
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717;
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719;
  input OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721;
  input OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661;
  input OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_21_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_21_i0_STORE;
  output selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661;
  output selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665;
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
  reg selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661;
  reg selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665;
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
    selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661 = 1'b0;
    selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665 = 1'b0;
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
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713 == 1'b0)
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
          selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          wrenable_reg_13 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661 = 1'b1;
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
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719 == 1'b1)
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
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721 == 1'b1)
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
          if (OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717 == 1'b0)
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
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713;
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717;
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719;
  wire OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721;
  wire OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661;
  wire OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_21_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_21_i0_STORE;
  wire selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661;
  wire selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665;
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
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665),
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
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z21matrix_multiplicationPKfS0_Pfjjj Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36713),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36717),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36719),
    .OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721(OUT_CONDITION__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36721),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661),
    .OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665(OUT_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665),
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
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36661),
    .selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665(selector_IN_UNBOUNDED__Z21matrix_multiplicationPKfS0_Pfjjj_35776_36665),
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


