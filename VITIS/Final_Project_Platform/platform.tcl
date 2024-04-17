# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct E:\EMBEDDED_DESIGN\PID_CONTROL_PROJ1\TEST2_VITIS\Final_Project_Platform\platform.tcl
# 
# OR launch xsct and run below command.
# source E:\EMBEDDED_DESIGN\PID_CONTROL_PROJ1\TEST2_VITIS\Final_Project_Platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Final_Project_Platform}\
-hw {E:\EMBEDDED_DESIGN\PID_CONTROL_PROJ1\TEST1_VIVADO\project_1\nexysa7fpga.xsa}\
-proc {microblaze_0} -os {standalone} -out {E:/EMBEDDED_DESIGN/PID_CONTROL_PROJ1/TEST2_VITIS}

platform write
platform generate -domains 
platform active {Final_Project_Platform}
bsp reload
platform generate
platform generate
platform active {Final_Project_Platform}
platform generate -domains 
platform active {Final_Project_Platform}
platform config -updatehw {E:/EMBEDDED_DESIGN/PID_CONTROL_PROJ1/TEST1_VIVADO/project_1/nexysa7fpga.xsa}
platform generate -domains 
platform active {Final_Project_Platform}
platform config -updatehw {E:/EMBEDDED_DESIGN/PID_CONTROL_PROJ1/TEST1_VIVADO/project_1/nexysa7fpga.xsa}
platform generate -domains 
platform active {Final_Project_Platform}
platform config -updatehw {E:/EMBEDDED_DESIGN/PID_CONTROL_PROJ1/TEST1_VIVADO/project_1/nexysa7fpga.xsa}
platform generate -domains 
