vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/microblaze_v11_0_10
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lmb_v10_v3_0_12
vlib modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_21
vlib modelsim_lib/msim/blk_mem_gen_v8_4_5
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_27
vlib modelsim_lib/msim/fifo_generator_v13_2_7
vlib modelsim_lib/msim/axi_data_fifo_v2_1_26
vlib modelsim_lib/msim/axi_crossbar_v2_1_28
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/axi_intc_v4_1_17
vlib modelsim_lib/msim/xlconcat_v2_1_4
vlib modelsim_lib/msim/mdm_v3_2_23
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/axi_timer_v2_0_29
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/axi_uartlite_v2_0_31
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_iic_v2_1_3
vlib modelsim_lib/msim/axi_gpio_v2_0_29

vmap xpm modelsim_lib/msim/xpm
vmap microblaze_v11_0_10 modelsim_lib/msim/microblaze_v11_0_10
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lmb_v10_v3_0_12 modelsim_lib/msim/lmb_v10_v3_0_12
vmap lmb_bram_if_cntlr_v4_0_21 modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_21
vmap blk_mem_gen_v8_4_5 modelsim_lib/msim/blk_mem_gen_v8_4_5
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_27 modelsim_lib/msim/axi_register_slice_v2_1_27
vmap fifo_generator_v13_2_7 modelsim_lib/msim/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_26 modelsim_lib/msim/axi_data_fifo_v2_1_26
vmap axi_crossbar_v2_1_28 modelsim_lib/msim/axi_crossbar_v2_1_28
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap axi_intc_v4_1_17 modelsim_lib/msim/axi_intc_v4_1_17
vmap xlconcat_v2_1_4 modelsim_lib/msim/xlconcat_v2_1_4
vmap mdm_v3_2_23 modelsim_lib/msim/mdm_v3_2_23
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap axi_timer_v2_0_29 modelsim_lib/msim/axi_timer_v2_0_29
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_31 modelsim_lib/msim/axi_uartlite_v2_0_31
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_iic_v2_1_3 modelsim_lib/msim/axi_iic_v2_1_3
vmap axi_gpio_v2_0_29 modelsim_lib/msim/axi_gpio_v2_0_29

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"F:/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"F:/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_10  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/1f7b/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_microblaze_0_3/sim/embsys_microblaze_0_3.vhd" \

vcom -work lmb_v10_v3_0_12  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/cd1d/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_dlmb_v10_3/sim/embsys_dlmb_v10_3.vhd" \
"../../../bd/embsys/ip/embsys_ilmb_v10_3/sim/embsys_ilmb_v10_3.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_21  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/a177/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_dlmb_bram_if_cntlr_3/sim/embsys_dlmb_bram_if_cntlr_3.vhd" \
"../../../bd/embsys/ip/embsys_ilmb_bram_if_cntlr_3/sim/embsys_ilmb_bram_if_cntlr_3.vhd" \

vlog -work blk_mem_gen_v8_4_5  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../bd/embsys/ip/embsys_lmb_bram_3/sim/embsys_lmb_bram_3.v" \

vlog -work generic_baseblocks_v2_1_0  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_27  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_26  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_28  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../bd/embsys/ip/embsys_xbar_2/sim/embsys_xbar_2.v" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_intc_v4_1_17  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/802b/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_microblaze_0_axi_intc_2/sim/embsys_microblaze_0_axi_intc_2.vhd" \

vlog -work xlconcat_v2_1_4  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../bd/embsys/ip/embsys_microblaze_0_xlconcat_2/sim/embsys_microblaze_0_xlconcat_2.v" \

vcom -work mdm_v3_2_23  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/b8f4/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_mdm_1_2/sim/embsys_mdm_1_2.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../bd/embsys/ip/embsys_clk_wiz_1_3/embsys_clk_wiz_1_3_clk_wiz.v" \
"../../../bd/embsys/ip/embsys_clk_wiz_1_3/embsys_clk_wiz_1_3.v" \

vcom -work lib_cdc_v1_0_2  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_rst_clk_wiz_1_100M_3/sim/embsys_rst_clk_wiz_1_100M_3.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../bd/embsys/ipshared/f811/hdl/nexys4io_v3_0_S00_AXI.v" \
"../../../bd/embsys/ipshared/f811/hdl/nexys4io_v3_0.v" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/f811/src/rgbpwm.v" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/f811/src/debounce.v" \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/f811/src/sevensegment.v" \
"../../../bd/embsys/ip/embsys_nexys4io_0_2/sim/embsys_nexys4io_0_2.v" \

vcom -work lib_pkg_v1_0_2  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_timer_v2_0_29  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/22b2/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_axi_timer_0_2/sim/embsys_axi_timer_0_2.vhd" \

vcom -work lib_srl_fifo_v1_0_2  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_31  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/67a1/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_axi_uartlite_0_2/sim/embsys_axi_uartlite_0_2.vhd" \

vcom -work interrupt_control_v3_1_4  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_iic_v2_1_3  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/1439/hdl/axi_iic_v2_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_axi_iic_0_3/sim/embsys_axi_iic_0_3.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../bd/embsys/ip/embsys_bidirec_0_0/sim/embsys_bidirec_0_0.v" \
"../../../bd/embsys/ip/embsys_bidirec_1_0/sim/embsys_bidirec_1_0.v" \

vcom -work axi_gpio_v2_0_29  -93  \
"../../../../project_1.gen/sources_1/bd/embsys/ipshared/6219/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_axi_gpio_0_0/sim/embsys_axi_gpio_0_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_1_0/sim/embsys_axi_gpio_1_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_2_0/sim/embsys_axi_gpio_2_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_3_0/sim/embsys_axi_gpio_3_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_4_0/sim/embsys_axi_gpio_4_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_5_0/sim/embsys_axi_gpio_5_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_6_0/sim/embsys_axi_gpio_6_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_7_0/sim/embsys_axi_gpio_7_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_8_0/sim/embsys_axi_gpio_8_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_9_0/sim/embsys_axi_gpio_9_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_10_0/sim/embsys_axi_gpio_10_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../bd/embsys/sim/embsys.v" \

vcom -work xil_defaultlib  -93  \
"../../../bd/embsys/ip/embsys_axi_gpio_11_0/sim/embsys_axi_gpio_11_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_12_0/sim/embsys_axi_gpio_12_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_13_0/sim/embsys_axi_gpio_13_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_14_0/sim/embsys_axi_gpio_14_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ipshared/7698" "+incdir+../../../../project_1.gen/sources_1/bd/embsys/ip/embsys_nexys4io_0_2/drivers/nexys4io_v1_0/src" \
"../../../bd/embsys/ip/embsys_tier2_xbar_0_0/sim/embsys_tier2_xbar_0_0.v" \
"../../../bd/embsys/ip/embsys_tier2_xbar_1_0/sim/embsys_tier2_xbar_1_0.v" \
"../../../bd/embsys/ip/embsys_tier2_xbar_2_0/sim/embsys_tier2_xbar_2_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

