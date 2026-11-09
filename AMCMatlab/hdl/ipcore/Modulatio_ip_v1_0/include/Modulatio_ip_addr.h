/*
 * File Name:         E:\AMC_Projects\deployModule\AMCMatlab\hdl\ipcore\Modulatio_ip_v1_0\include\Modulatio_ip_addr.h
 * Description:       C Header File
 * Created:           2026-11-04 12:59:17
*/

#ifndef MODULATIO_IP_H_
#define MODULATIO_IP_H_

#define  IPCore_Reset_Modulatio_ip                                      0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_Modulatio_ip                                     0x4  //enabled (by default) when bit 0 is 0x1
#define  Deep_Learning_interface_Rd_BaseAddr_Modulatio_ip               0x8  //Base Address offset for Deep Learning interface Read (Default Base Address: hex2dec(A0060000))
#define  Deep_Learning_interface_Wr_BaseAddr_Modulatio_ip               0xC  //Base Address offset for Deep Learning interface Write (Default Base Address: hex2dec(A0060000))
#define  Deep_Learning_I_O_memory_Rd_BaseAddr_Modulatio_ip              0x10  //Base Address offset for Deep Learning I/O memory Read (Default Base Address: hex2dec(80000000))
#define  Deep_Learning_I_O_memory_Wr_BaseAddr_Modulatio_ip              0x14  //Base Address offset for Deep Learning I/O memory Write (Default Base Address: hex2dec(80000000))
#define  IPCore_PacketSize_AXI_Stream_to_Software_Master_Modulatio_ip   0x18  //Packet size for AXI Stream to Software Master interface, the default value is 1024. The TLAST output signal of the AXI Stream to Software Master interface is generated based on the packet size.
#define  IPCore_Timestamp_Modulatio_ip                                  0x1C  //contains unique IP timestamp (yymmddHHMM): 2611041258
#define  DUTProcstart_Data_Modulatio_ip                                 0x100  //data register for Inport DUTProcstart
#define  NCO_Phase_Incr_Data_Modulatio_ip                               0x104  //data register for Inport NCO Phase Incr
#define  Frame_Size_Data_Modulatio_ip                                   0x108  //data register for Inport Frame Size
#define  Trigger_Capture_Data_Modulatio_ip                              0x10C  //data register for Inport Trigger Capture
#define  txEnable_Data_Modulatio_ip                                     0x110  //data register for Inport txEnable
#define  Stream_Enable_Data_Modulatio_ip                                0x114  //data register for Inport Stream Enable
#define  mod_Test_Signal_Sel_Data_Modulatio_ip                          0x120  //data register for Inport mod Test Signal Sel
#define  FIFO_Almost_Full_Count_Data_Modulatio_ip                       0x124  //data register for Outport FIFO Almost Full Count
#define  Ready_Data_Modulatio_ip                                        0x128  //data register for Inport Ready

#endif /* MODULATIO_IP_H_ */
