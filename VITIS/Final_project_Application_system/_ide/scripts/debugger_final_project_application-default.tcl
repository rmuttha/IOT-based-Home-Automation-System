# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: E:\EMBEDDED_DESIGN\PID_CONTROL_PROJ1\TEST2_VITIS\Final_project_Application_system\_ide\scripts\debugger_final_project_application-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source E:\EMBEDDED_DESIGN\PID_CONTROL_PROJ1\TEST2_VITIS\Final_project_Application_system\_ide\scripts\debugger_final_project_application-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys A7 -100T 210292BB2F8EA" && level==0 && jtag_device_ctx=="jsn-Nexys A7 -100T-210292BB2F8EA-13631093-0"}
fpga -file E:/EMBEDDED_DESIGN/PID_CONTROL_PROJ1/TEST2_VITIS/Final_project_Application/_ide/bitstream/download.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw E:/EMBEDDED_DESIGN/PID_CONTROL_PROJ1/TEST2_VITIS/Final_Project_Platform/export/Final_Project_Platform/hw/nexysa7fpga.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow E:/EMBEDDED_DESIGN/PID_CONTROL_PROJ1/TEST2_VITIS/Final_project_Application/Debug/Final_project_Application.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
