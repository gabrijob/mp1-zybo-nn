// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Fri Aug 30 10:23:28 2019
// Host        : gabriel-Mint running 64-bit Linux Mint 19.1 Tessa
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_AXIS_mem_read_0_0_sim_netlist.v
// Design      : design_1_AXIS_mem_read_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_mem_read_v1_0
   (s_axis_tdata,
    s_axis_tvalid,
    s_axis_tlast,
    m_axis_tready,
    m_axis_aclk,
    s_axis_aresetn,
    s_axis_aclk,
    m_axis_aresetn);
  output [31:0]s_axis_tdata;
  inout s_axis_tvalid;
  inout s_axis_tlast;
  inout m_axis_tready;
  input m_axis_aclk;
  input s_axis_aresetn;
  input s_axis_aclk;
  input m_axis_aresetn;

  wire m_axis_aclk;
  wire m_axis_aresetn;
  wire m_axis_tready;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_mem_read_v1_0_M_AXIS AXIS_mem_read_v1_0_M_AXIS_inst
       (.m_axis_aclk(m_axis_aclk),
        .m_axis_aresetn(m_axis_aresetn),
        .m_axis_tready(m_axis_tready),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tvalid(s_axis_tvalid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_mem_read_v1_0_S_AXIS AXIS_mem_read_v1_0_S_AXIS_inst
       (.m_axis_tready(m_axis_tready),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_mem_read_v1_0_M_AXIS
   (s_axis_tvalid,
    s_axis_tlast,
    s_axis_tdata,
    m_axis_aclk,
    m_axis_aresetn,
    m_axis_tready);
  output s_axis_tvalid;
  output s_axis_tlast;
  output [31:0]s_axis_tdata;
  input m_axis_aclk;
  input m_axis_aresetn;
  input m_axis_tready;

  wire \FSM_sequential_mst_exec_state[0]_i_1_n_0 ;
  wire \FSM_sequential_mst_exec_state[1]_i_1_n_0 ;
  wire \FSM_sequential_mst_exec_state[1]_i_2_n_0 ;
  wire axis_tlast;
  wire axis_tvalid_delay_i_1_n_0;
  wire count;
  wire [4:0]count_reg;
  wire m_axis_aclk;
  wire m_axis_aresetn;
  wire m_axis_tready;
  wire [1:0]mst_exec_state;
  wire [3:0]p_0_in;
  wire [4:0]p_0_in__0;
  wire read_pointer;
  wire [3:0]read_pointer_reg;
  wire [31:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tvalid;
  wire \stream_data_out[1]_i_1_n_0 ;
  wire \stream_data_out[2]_i_1_n_0 ;
  wire \stream_data_out[31]_i_1_n_0 ;
  wire \stream_data_out[3]_i_1_n_0 ;
  wire tx_done3_out;
  wire tx_done_i_1_n_0;
  wire tx_done_reg_n_0;
  wire tx_en;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hE3)) 
    \FSM_sequential_mst_exec_state[0]_i_1 
       (.I0(\FSM_sequential_mst_exec_state[1]_i_2_n_0 ),
        .I1(mst_exec_state[1]),
        .I2(mst_exec_state[0]),
        .O(\FSM_sequential_mst_exec_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hF530)) 
    \FSM_sequential_mst_exec_state[1]_i_1 
       (.I0(\FSM_sequential_mst_exec_state[1]_i_2_n_0 ),
        .I1(tx_done_reg_n_0),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .O(\FSM_sequential_mst_exec_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \FSM_sequential_mst_exec_state[1]_i_2 
       (.I0(count_reg[0]),
        .I1(count_reg[1]),
        .I2(count_reg[2]),
        .I3(count_reg[4]),
        .I4(count_reg[3]),
        .O(\FSM_sequential_mst_exec_state[1]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "INIT_COUNTER:01,SEND_STREAM:10,IDLE:00" *) 
  FDRE \FSM_sequential_mst_exec_state_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_mst_exec_state[0]_i_1_n_0 ),
        .Q(mst_exec_state[0]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "INIT_COUNTER:01,SEND_STREAM:10,IDLE:00" *) 
  FDRE \FSM_sequential_mst_exec_state_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_mst_exec_state[1]_i_1_n_0 ),
        .Q(mst_exec_state[1]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    axis_tlast_delay_i_1
       (.I0(read_pointer_reg[0]),
        .I1(read_pointer_reg[1]),
        .I2(read_pointer_reg[2]),
        .I3(read_pointer_reg[3]),
        .O(axis_tlast));
  FDRE axis_tlast_delay_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(axis_tlast),
        .Q(s_axis_tlast),
        .R(\stream_data_out[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    axis_tvalid_delay_i_1
       (.I0(mst_exec_state[0]),
        .I1(mst_exec_state[1]),
        .I2(read_pointer_reg[3]),
        .O(axis_tvalid_delay_i_1_n_0));
  FDRE axis_tvalid_delay_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(axis_tvalid_delay_i_1_n_0),
        .Q(s_axis_tvalid),
        .R(\stream_data_out[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(count_reg[0]),
        .I1(count_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count[2]_i_1 
       (.I0(count_reg[2]),
        .I1(count_reg[1]),
        .I2(count_reg[0]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \count[3]_i_1 
       (.I0(count_reg[3]),
        .I1(count_reg[2]),
        .I2(count_reg[1]),
        .I3(count_reg[0]),
        .O(p_0_in__0[3]));
  LUT3 #(
    .INIT(8'h08)) 
    \count[4]_i_1 
       (.I0(\FSM_sequential_mst_exec_state[1]_i_2_n_0 ),
        .I1(mst_exec_state[0]),
        .I2(mst_exec_state[1]),
        .O(count));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \count[4]_i_2 
       (.I0(count_reg[4]),
        .I1(count_reg[2]),
        .I2(count_reg[1]),
        .I3(count_reg[0]),
        .I4(count_reg[3]),
        .O(p_0_in__0[4]));
  FDRE \count_reg[0] 
       (.C(m_axis_aclk),
        .CE(count),
        .D(p_0_in__0[0]),
        .Q(count_reg[0]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \count_reg[1] 
       (.C(m_axis_aclk),
        .CE(count),
        .D(p_0_in__0[1]),
        .Q(count_reg[1]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \count_reg[2] 
       (.C(m_axis_aclk),
        .CE(count),
        .D(p_0_in__0[2]),
        .Q(count_reg[2]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \count_reg[3] 
       (.C(m_axis_aclk),
        .CE(count),
        .D(p_0_in__0[3]),
        .Q(count_reg[3]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \count_reg[4] 
       (.C(m_axis_aclk),
        .CE(count),
        .D(p_0_in__0[4]),
        .Q(count_reg[4]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \read_pointer[1]_i_1 
       (.I0(read_pointer_reg[0]),
        .I1(read_pointer_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \read_pointer[2]_i_1 
       (.I0(read_pointer_reg[2]),
        .I1(read_pointer_reg[1]),
        .I2(read_pointer_reg[0]),
        .O(p_0_in[2]));
  LUT4 #(
    .INIT(16'h0020)) 
    \read_pointer[3]_i_1 
       (.I0(m_axis_tready),
        .I1(read_pointer_reg[3]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .O(read_pointer));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \read_pointer[3]_i_2 
       (.I0(read_pointer_reg[0]),
        .I1(read_pointer_reg[1]),
        .I2(read_pointer_reg[2]),
        .O(p_0_in[3]));
  FDRE \read_pointer_reg[0] 
       (.C(m_axis_aclk),
        .CE(read_pointer),
        .D(p_0_in[0]),
        .Q(read_pointer_reg[0]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \read_pointer_reg[1] 
       (.C(m_axis_aclk),
        .CE(read_pointer),
        .D(p_0_in[1]),
        .Q(read_pointer_reg[1]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \read_pointer_reg[2] 
       (.C(m_axis_aclk),
        .CE(read_pointer),
        .D(p_0_in[2]),
        .Q(read_pointer_reg[2]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \read_pointer_reg[3] 
       (.C(m_axis_aclk),
        .CE(read_pointer),
        .D(p_0_in[3]),
        .Q(read_pointer_reg[3]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \stream_data_out[0]_i_1 
       (.I0(read_pointer_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \stream_data_out[1]_i_1 
       (.I0(read_pointer_reg[0]),
        .I1(read_pointer_reg[1]),
        .O(\stream_data_out[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \stream_data_out[2]_i_1 
       (.I0(read_pointer_reg[2]),
        .I1(read_pointer_reg[1]),
        .I2(read_pointer_reg[0]),
        .O(\stream_data_out[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \stream_data_out[31]_i_1 
       (.I0(m_axis_aresetn),
        .O(\stream_data_out[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0020)) 
    \stream_data_out[31]_i_2 
       (.I0(m_axis_tready),
        .I1(read_pointer_reg[3]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .O(tx_en));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \stream_data_out[3]_i_1 
       (.I0(read_pointer_reg[0]),
        .I1(read_pointer_reg[1]),
        .I2(read_pointer_reg[2]),
        .O(\stream_data_out[3]_i_1_n_0 ));
  FDSE \stream_data_out_reg[0] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(p_0_in[0]),
        .Q(s_axis_tdata[0]),
        .S(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[10] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[10]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[11] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[11]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[12] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[12]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[13] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[13]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[14] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[14]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[15] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[15]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[16] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[16]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[17] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[17]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[18] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[18]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[19] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[19]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[1] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(\stream_data_out[1]_i_1_n_0 ),
        .Q(s_axis_tdata[1]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[20] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[20]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[21] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[21]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[22] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[22]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[23] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[23]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[24] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[24]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[25] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[25]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[26] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[26]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[27] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[27]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[28] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[28]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[29] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[29]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[2] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(\stream_data_out[2]_i_1_n_0 ),
        .Q(s_axis_tdata[2]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[30] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[30]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[31] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[31]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[3] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(\stream_data_out[3]_i_1_n_0 ),
        .Q(s_axis_tdata[3]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[4] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[4]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[5] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[5]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[6] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[6]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[7] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[7]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[8] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[8]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  FDRE \stream_data_out_reg[9] 
       (.C(m_axis_aclk),
        .CE(tx_en),
        .D(1'b0),
        .Q(s_axis_tdata[9]),
        .R(\stream_data_out[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5400)) 
    tx_done_i_1
       (.I0(tx_en),
        .I1(tx_done3_out),
        .I2(tx_done_reg_n_0),
        .I3(m_axis_aresetn),
        .O(tx_done_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    tx_done_i_2
       (.I0(read_pointer_reg[1]),
        .I1(read_pointer_reg[0]),
        .I2(read_pointer_reg[3]),
        .I3(read_pointer_reg[2]),
        .O(tx_done3_out));
  FDRE tx_done_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(tx_done_i_1_n_0),
        .Q(tx_done_reg_n_0),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_mem_read_v1_0_S_AXIS
   (m_axis_tready,
    s_axis_aclk,
    s_axis_tlast,
    s_axis_tvalid,
    s_axis_aresetn);
  inout m_axis_tready;
  input s_axis_aclk;
  input s_axis_tlast;
  input s_axis_tvalid;
  input s_axis_aresetn;

  wire m_axis_tready;
  wire mst_exec_state_i_1_n_0;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire s_axis_tlast;
  wire s_axis_tvalid;
  wire [2:0]write_pointer;
  wire \write_pointer[0]_i_1_n_0 ;
  wire \write_pointer[1]_i_1_n_0 ;
  wire \write_pointer[2]_i_1_n_0 ;
  wire writes_done;
  wire writes_done_i_1_n_0;
  wire writes_done_i_2_n_0;

  LUT4 #(
    .INIT(16'h7200)) 
    mst_exec_state_i_1
       (.I0(m_axis_tready),
        .I1(writes_done),
        .I2(s_axis_tvalid),
        .I3(s_axis_aresetn),
        .O(mst_exec_state_i_1_n_0));
  FDRE mst_exec_state_reg
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(mst_exec_state_i_1_n_0),
        .Q(m_axis_tready),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6A00)) 
    \write_pointer[0]_i_1 
       (.I0(write_pointer[0]),
        .I1(s_axis_tvalid),
        .I2(m_axis_tready),
        .I3(s_axis_aresetn),
        .O(\write_pointer[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h6AAA0000)) 
    \write_pointer[1]_i_1 
       (.I0(write_pointer[1]),
        .I1(s_axis_tvalid),
        .I2(m_axis_tready),
        .I3(write_pointer[0]),
        .I4(s_axis_aresetn),
        .O(\write_pointer[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAA00000000)) 
    \write_pointer[2]_i_1 
       (.I0(write_pointer[2]),
        .I1(s_axis_tvalid),
        .I2(m_axis_tready),
        .I3(write_pointer[0]),
        .I4(write_pointer[1]),
        .I5(s_axis_aresetn),
        .O(\write_pointer[2]_i_1_n_0 ));
  FDRE \write_pointer_reg[0] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\write_pointer[0]_i_1_n_0 ),
        .Q(write_pointer[0]),
        .R(1'b0));
  FDRE \write_pointer_reg[1] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\write_pointer[1]_i_1_n_0 ),
        .Q(write_pointer[1]),
        .R(1'b0));
  FDRE \write_pointer_reg[2] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\write_pointer[2]_i_1_n_0 ),
        .Q(write_pointer[2]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hCEEE0000)) 
    writes_done_i_1
       (.I0(writes_done),
        .I1(writes_done_i_2_n_0),
        .I2(m_axis_tready),
        .I3(s_axis_tvalid),
        .I4(s_axis_aresetn),
        .O(writes_done_i_1_n_0));
  LUT4 #(
    .INIT(16'hEAAA)) 
    writes_done_i_2
       (.I0(s_axis_tlast),
        .I1(write_pointer[0]),
        .I2(write_pointer[1]),
        .I3(write_pointer[2]),
        .O(writes_done_i_2_n_0));
  FDRE writes_done_reg
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(writes_done_i_1_n_0),
        .Q(writes_done),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_AXIS_mem_read_0_0,AXIS_mem_read_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "AXIS_mem_read_v1_0,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (m_axis_tdata,
    m_axis_tstrb,
    m_axis_tlast,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_aclk,
    m_axis_aresetn,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tlast,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_aclk,
    s_axis_aresetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [31:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TSTRB" *) output [3:0]m_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M_AXIS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CLK, ASSOCIATED_BUSIF M_AXIS, ASSOCIATED_RESET m_axis_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input m_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 M_AXIS_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [31:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TSTRB" *) input [3:0]s_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXIS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_CLK, ASSOCIATED_BUSIF S_AXIS, ASSOCIATED_RESET s_axis_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXIS_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axis_aresetn;

  wire \<const1> ;
  wire m_axis_aclk;
  wire m_axis_aresetn;
  wire m_axis_tready;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [31:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tvalid;

  assign \<const1>  = s_axis_tstrb[0];
  assign \<const1>  = s_axis_tstrb[1];
  assign \<const1>  = s_axis_tstrb[2];
  assign \<const1>  = s_axis_tstrb[3];
  assign m_axis_tdata[31:0] = s_axis_tdata;
  assign m_axis_tlast = s_axis_tlast;
  assign m_axis_tstrb[3] = \<const1> ;
  assign m_axis_tstrb[2] = \<const1> ;
  assign m_axis_tstrb[1] = \<const1> ;
  assign m_axis_tstrb[0] = \<const1> ;
  assign m_axis_tvalid = s_axis_tvalid;
  assign s_axis_tready = m_axis_tready;
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_mem_read_v1_0 inst
       (.m_axis_aclk(m_axis_aclk),
        .m_axis_aresetn(m_axis_aresetn),
        .m_axis_tready(m_axis_tready),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tvalid(s_axis_tvalid));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
