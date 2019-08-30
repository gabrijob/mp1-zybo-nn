connect

# Select the target whose name starts with ARM and ends with #0.
# On Zynq, this selects “ARM Cortex-A9 MPCore #0”

targets -set -filter {name =~ "ARM* #0"}
rst
fpga -f ./sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
loadhw ./sdk/design_1_wrapper_hw_platform_0/system.hdf

dow ./sdk/fsbl/Debug/fsbl.elf
con -timeout 5
stop

dow ./sdk/axi_test/Debug/axi_test.elf

# Set a breakpoint at exit

bpadd -addr &exit

# Resume execution and block until the core stops (due to breakpoint)

con -block
