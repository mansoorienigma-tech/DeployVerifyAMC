/*
 * File Name:         hdl_prj\ipcore\AXIS2AXIM_v1_0\include\AXIS2AXIM_addr.h
 * Description:       C Header File
 * Created:           2019-06-24 13:42:01
*/

#ifndef AXIS2AXIM_H_
#define AXIS2AXIM_H_

#define  IPCore_Reset_AXIS2AXIM              0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_AXIS2AXIM             0x4  //enabled (by default) when bit 0 is 0x1
#define  AXI4_Master_Rd_BaseAddr_AXIS2AXIM   0x8  //Base Address offset for AXI4 Master Read
#define  AXI4_Master_Wr_BaseAddr_AXIS2AXIM   0xC  //Base Address offset for AXI4 Master Write
#define  IPCore_Timestamp_AXIS2AXIM          0x10  //contains unique IP timestamp (yymmddHHMM): 1906241341

#endif /* AXIS2AXIM_H_ */
