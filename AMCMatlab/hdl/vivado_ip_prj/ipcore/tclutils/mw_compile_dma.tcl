# Copyright 2023 The MathWorks, Inc.
set savedDir [pwd]

cd ipcore/analogdevices-dmac/library

cd util_axis_resize
source util_axis_resize_ip.tcl
close_project

cd ../util_cdc
source util_cdc_ip.tcl
close_project

cd ../util_axis_fifo
source util_axis_fifo_ip.tcl
close_project

cd ../axi_dmac
source axi_dmac_ip.tcl
close_project

cd $savedDir
