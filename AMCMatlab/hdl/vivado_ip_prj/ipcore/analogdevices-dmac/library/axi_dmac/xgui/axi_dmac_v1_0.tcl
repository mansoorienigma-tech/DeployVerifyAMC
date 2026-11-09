
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/axi_dmac_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {General settings}]
  #Adding Group
  set DMA_Endpoint_Configuration [ipgui::add_group $IPINST -name "DMA Endpoint Configuration" -parent ${Page_0} -layout horizontal]
  #Adding Group
  set Source [ipgui::add_group $IPINST -name "Source" -parent ${DMA_Endpoint_Configuration}]
  ipgui::add_param $IPINST -name "DMA_TYPE_SRC" -parent ${Source} -widget comboBox
  ipgui::add_param $IPINST -name "DMA_AXI_PROTOCOL_SRC" -parent ${Source} -widget comboBox
  ipgui::add_param $IPINST -name "DMA_DATA_WIDTH_SRC" -parent ${Source}
  ipgui::add_param $IPINST -name "AXI_SLICE_SRC" -parent ${Source}
  ipgui::add_param $IPINST -name "SYNC_TRANSFER_START" -parent ${Source}

  #Adding Group
  set Destination [ipgui::add_group $IPINST -name "Destination" -parent ${DMA_Endpoint_Configuration}]
  ipgui::add_param $IPINST -name "DMA_TYPE_DEST" -parent ${Destination} -widget comboBox
  ipgui::add_param $IPINST -name "DMA_AXI_PROTOCOL_DEST" -parent ${Destination} -widget comboBox
  ipgui::add_param $IPINST -name "DMA_DATA_WIDTH_DEST" -parent ${Destination}
  ipgui::add_param $IPINST -name "AXI_SLICE_DEST" -parent ${Destination}


  #Adding Group
  set General_Configuration [ipgui::add_group $IPINST -name "General Configuration" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "ID" -parent ${General_Configuration}
  ipgui::add_param $IPINST -name "DMA_LENGTH_WIDTH" -parent ${General_Configuration}
  ipgui::add_param $IPINST -name "FIFO_SIZE" -parent ${General_Configuration} -widget comboBox
  ipgui::add_param $IPINST -name "MAX_BYTES_PER_BURST" -parent ${General_Configuration}

  #Adding Group
  set Features [ipgui::add_group $IPINST -name "Features" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "CYCLIC" -parent ${Features}
  ipgui::add_param $IPINST -name "DMA_2D_TRANSFER" -parent ${Features}
  #Adding Group
  set 2D_Settings [ipgui::add_group $IPINST -name "2D Settings" -parent ${Features}]
  set DMA_2D_TLAST_MODE [ipgui::add_param $IPINST -name "DMA_2D_TLAST_MODE" -parent ${2D_Settings} -widget comboBox]
  set_property tooltip {AXI Stream TLAST port function} ${DMA_2D_TLAST_MODE}
  set ENABLE_FRAME_LOCK [ipgui::add_param $IPINST -name "ENABLE_FRAME_LOCK" -parent ${2D_Settings}]
  set_property tooltip {Requires Cyclic mode} ${ENABLE_FRAME_LOCK}
  ipgui::add_param $IPINST -name "MAX_NUM_FRAMES" -parent ${2D_Settings} -widget comboBox

  ipgui::add_param $IPINST -name "USE_EXT_SYNC" -parent ${Features}

  #Adding Group
  set Clock_Domain_Configuration [ipgui::add_group $IPINST -name "Clock Domain Configuration" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "ASYNC_CLK_REQ_SRC" -parent ${Clock_Domain_Configuration}
  ipgui::add_param $IPINST -name "ASYNC_CLK_SRC_DEST" -parent ${Clock_Domain_Configuration}
  ipgui::add_param $IPINST -name "ASYNC_CLK_DEST_REQ" -parent ${Clock_Domain_Configuration}

  #Adding Group
  set Debug [ipgui::add_group $IPINST -name "Debug" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "DISABLE_DEBUG_REGISTERS" -parent ${Debug}
  ipgui::add_param $IPINST -name "ENABLE_DIAGNOSTICS_IF" -parent ${Debug}


  #Adding Page
  set Autorun_settings [ipgui::add_page $IPINST -name "Autorun settings"]
  set HAS_AUTORUN [ipgui::add_param $IPINST -name "HAS_AUTORUN" -parent ${Autorun_settings}]
  set_property tooltip {Start transfer after reset deassertion} ${HAS_AUTORUN}
  #Adding Group
  set Register_Defaults [ipgui::add_group $IPINST -name "Register Defaults" -parent ${Autorun_settings}]
  ipgui::add_param $IPINST -name "DMAC_DEF_FLAGS" -parent ${Register_Defaults}
  ipgui::add_param $IPINST -name "DMAC_DEF_SRC_ADDR" -parent ${Register_Defaults}
  ipgui::add_param $IPINST -name "DMAC_DEF_DEST_ADDR" -parent ${Register_Defaults}
  ipgui::add_param $IPINST -name "DMAC_DEF_X_LENGTH" -parent ${Register_Defaults}
  ipgui::add_param $IPINST -name "DMAC_DEF_Y_LENGTH" -parent ${Register_Defaults}
  ipgui::add_param $IPINST -name "DMAC_DEF_SRC_STRIDE" -parent ${Register_Defaults}
  ipgui::add_param $IPINST -name "DMAC_DEF_DEST_STRIDE" -parent ${Register_Defaults}
  ipgui::add_param $IPINST -name "DMAC_DEF_FLOCK_CFG" -parent ${Register_Defaults}
  ipgui::add_param $IPINST -name "DMAC_DEF_FLOCK_STRIDE" -parent ${Register_Defaults}



}

proc update_PARAM_VALUE.DMAC_DEF_DEST_ADDR { PARAM_VALUE.DMAC_DEF_DEST_ADDR PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to update DMAC_DEF_DEST_ADDR when any of the dependent parameters in the arguments change
	
	set DMAC_DEF_DEST_ADDR ${PARAM_VALUE.DMAC_DEF_DEST_ADDR}
	set HAS_AUTORUN ${PARAM_VALUE.HAS_AUTORUN}
	set values(HAS_AUTORUN) [get_property value $HAS_AUTORUN]
	if { [gen_USERPARAMETER_DMAC_DEF_DEST_ADDR_ENABLEMENT $values(HAS_AUTORUN)] } {
		set_property enabled true $DMAC_DEF_DEST_ADDR
	} else {
		set_property enabled false $DMAC_DEF_DEST_ADDR
	}
}

proc validate_PARAM_VALUE.DMAC_DEF_DEST_ADDR { PARAM_VALUE.DMAC_DEF_DEST_ADDR } {
	# Procedure called to validate DMAC_DEF_DEST_ADDR
	return true
}

proc update_PARAM_VALUE.DMAC_DEF_DEST_STRIDE { PARAM_VALUE.DMAC_DEF_DEST_STRIDE PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to update DMAC_DEF_DEST_STRIDE when any of the dependent parameters in the arguments change
	
	set DMAC_DEF_DEST_STRIDE ${PARAM_VALUE.DMAC_DEF_DEST_STRIDE}
	set HAS_AUTORUN ${PARAM_VALUE.HAS_AUTORUN}
	set values(HAS_AUTORUN) [get_property value $HAS_AUTORUN]
	if { [gen_USERPARAMETER_DMAC_DEF_DEST_STRIDE_ENABLEMENT $values(HAS_AUTORUN)] } {
		set_property enabled true $DMAC_DEF_DEST_STRIDE
	} else {
		set_property enabled false $DMAC_DEF_DEST_STRIDE
	}
}

proc validate_PARAM_VALUE.DMAC_DEF_DEST_STRIDE { PARAM_VALUE.DMAC_DEF_DEST_STRIDE } {
	# Procedure called to validate DMAC_DEF_DEST_STRIDE
	return true
}

proc update_PARAM_VALUE.DMAC_DEF_FLAGS { PARAM_VALUE.DMAC_DEF_FLAGS PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to update DMAC_DEF_FLAGS when any of the dependent parameters in the arguments change
	
	set DMAC_DEF_FLAGS ${PARAM_VALUE.DMAC_DEF_FLAGS}
	set HAS_AUTORUN ${PARAM_VALUE.HAS_AUTORUN}
	set values(HAS_AUTORUN) [get_property value $HAS_AUTORUN]
	if { [gen_USERPARAMETER_DMAC_DEF_FLAGS_ENABLEMENT $values(HAS_AUTORUN)] } {
		set_property enabled true $DMAC_DEF_FLAGS
	} else {
		set_property enabled false $DMAC_DEF_FLAGS
	}
}

proc validate_PARAM_VALUE.DMAC_DEF_FLAGS { PARAM_VALUE.DMAC_DEF_FLAGS } {
	# Procedure called to validate DMAC_DEF_FLAGS
	return true
}

proc update_PARAM_VALUE.DMAC_DEF_FLOCK_CFG { PARAM_VALUE.DMAC_DEF_FLOCK_CFG PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to update DMAC_DEF_FLOCK_CFG when any of the dependent parameters in the arguments change
	
	set DMAC_DEF_FLOCK_CFG ${PARAM_VALUE.DMAC_DEF_FLOCK_CFG}
	set HAS_AUTORUN ${PARAM_VALUE.HAS_AUTORUN}
	set values(HAS_AUTORUN) [get_property value $HAS_AUTORUN]
	if { [gen_USERPARAMETER_DMAC_DEF_FLOCK_CFG_ENABLEMENT $values(HAS_AUTORUN)] } {
		set_property enabled true $DMAC_DEF_FLOCK_CFG
	} else {
		set_property enabled false $DMAC_DEF_FLOCK_CFG
	}
}

proc validate_PARAM_VALUE.DMAC_DEF_FLOCK_CFG { PARAM_VALUE.DMAC_DEF_FLOCK_CFG } {
	# Procedure called to validate DMAC_DEF_FLOCK_CFG
	return true
}

proc update_PARAM_VALUE.DMAC_DEF_FLOCK_STRIDE { PARAM_VALUE.DMAC_DEF_FLOCK_STRIDE PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to update DMAC_DEF_FLOCK_STRIDE when any of the dependent parameters in the arguments change
	
	set DMAC_DEF_FLOCK_STRIDE ${PARAM_VALUE.DMAC_DEF_FLOCK_STRIDE}
	set HAS_AUTORUN ${PARAM_VALUE.HAS_AUTORUN}
	set values(HAS_AUTORUN) [get_property value $HAS_AUTORUN]
	if { [gen_USERPARAMETER_DMAC_DEF_FLOCK_STRIDE_ENABLEMENT $values(HAS_AUTORUN)] } {
		set_property enabled true $DMAC_DEF_FLOCK_STRIDE
	} else {
		set_property enabled false $DMAC_DEF_FLOCK_STRIDE
	}
}

proc validate_PARAM_VALUE.DMAC_DEF_FLOCK_STRIDE { PARAM_VALUE.DMAC_DEF_FLOCK_STRIDE } {
	# Procedure called to validate DMAC_DEF_FLOCK_STRIDE
	return true
}

proc update_PARAM_VALUE.DMAC_DEF_SRC_ADDR { PARAM_VALUE.DMAC_DEF_SRC_ADDR PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to update DMAC_DEF_SRC_ADDR when any of the dependent parameters in the arguments change
	
	set DMAC_DEF_SRC_ADDR ${PARAM_VALUE.DMAC_DEF_SRC_ADDR}
	set HAS_AUTORUN ${PARAM_VALUE.HAS_AUTORUN}
	set values(HAS_AUTORUN) [get_property value $HAS_AUTORUN]
	if { [gen_USERPARAMETER_DMAC_DEF_SRC_ADDR_ENABLEMENT $values(HAS_AUTORUN)] } {
		set_property enabled true $DMAC_DEF_SRC_ADDR
	} else {
		set_property enabled false $DMAC_DEF_SRC_ADDR
	}
}

proc validate_PARAM_VALUE.DMAC_DEF_SRC_ADDR { PARAM_VALUE.DMAC_DEF_SRC_ADDR } {
	# Procedure called to validate DMAC_DEF_SRC_ADDR
	return true
}

proc update_PARAM_VALUE.DMAC_DEF_SRC_STRIDE { PARAM_VALUE.DMAC_DEF_SRC_STRIDE PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to update DMAC_DEF_SRC_STRIDE when any of the dependent parameters in the arguments change
	
	set DMAC_DEF_SRC_STRIDE ${PARAM_VALUE.DMAC_DEF_SRC_STRIDE}
	set HAS_AUTORUN ${PARAM_VALUE.HAS_AUTORUN}
	set values(HAS_AUTORUN) [get_property value $HAS_AUTORUN]
	if { [gen_USERPARAMETER_DMAC_DEF_SRC_STRIDE_ENABLEMENT $values(HAS_AUTORUN)] } {
		set_property enabled true $DMAC_DEF_SRC_STRIDE
	} else {
		set_property enabled false $DMAC_DEF_SRC_STRIDE
	}
}

proc validate_PARAM_VALUE.DMAC_DEF_SRC_STRIDE { PARAM_VALUE.DMAC_DEF_SRC_STRIDE } {
	# Procedure called to validate DMAC_DEF_SRC_STRIDE
	return true
}

proc update_PARAM_VALUE.DMAC_DEF_X_LENGTH { PARAM_VALUE.DMAC_DEF_X_LENGTH PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to update DMAC_DEF_X_LENGTH when any of the dependent parameters in the arguments change
	
	set DMAC_DEF_X_LENGTH ${PARAM_VALUE.DMAC_DEF_X_LENGTH}
	set HAS_AUTORUN ${PARAM_VALUE.HAS_AUTORUN}
	set values(HAS_AUTORUN) [get_property value $HAS_AUTORUN]
	if { [gen_USERPARAMETER_DMAC_DEF_X_LENGTH_ENABLEMENT $values(HAS_AUTORUN)] } {
		set_property enabled true $DMAC_DEF_X_LENGTH
	} else {
		set_property enabled false $DMAC_DEF_X_LENGTH
	}
}

proc validate_PARAM_VALUE.DMAC_DEF_X_LENGTH { PARAM_VALUE.DMAC_DEF_X_LENGTH } {
	# Procedure called to validate DMAC_DEF_X_LENGTH
	return true
}

proc update_PARAM_VALUE.DMAC_DEF_Y_LENGTH { PARAM_VALUE.DMAC_DEF_Y_LENGTH PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to update DMAC_DEF_Y_LENGTH when any of the dependent parameters in the arguments change
	
	set DMAC_DEF_Y_LENGTH ${PARAM_VALUE.DMAC_DEF_Y_LENGTH}
	set HAS_AUTORUN ${PARAM_VALUE.HAS_AUTORUN}
	set values(HAS_AUTORUN) [get_property value $HAS_AUTORUN]
	if { [gen_USERPARAMETER_DMAC_DEF_Y_LENGTH_ENABLEMENT $values(HAS_AUTORUN)] } {
		set_property enabled true $DMAC_DEF_Y_LENGTH
	} else {
		set_property enabled false $DMAC_DEF_Y_LENGTH
	}
}

proc validate_PARAM_VALUE.DMAC_DEF_Y_LENGTH { PARAM_VALUE.DMAC_DEF_Y_LENGTH } {
	# Procedure called to validate DMAC_DEF_Y_LENGTH
	return true
}

proc update_PARAM_VALUE.DMA_2D_TLAST_MODE { PARAM_VALUE.DMA_2D_TLAST_MODE PARAM_VALUE.DMA_2D_TRANSFER } {
	# Procedure called to update DMA_2D_TLAST_MODE when any of the dependent parameters in the arguments change
	
	set DMA_2D_TLAST_MODE ${PARAM_VALUE.DMA_2D_TLAST_MODE}
	set DMA_2D_TRANSFER ${PARAM_VALUE.DMA_2D_TRANSFER}
	set values(DMA_2D_TRANSFER) [get_property value $DMA_2D_TRANSFER]
	if { [gen_USERPARAMETER_DMA_2D_TLAST_MODE_ENABLEMENT $values(DMA_2D_TRANSFER)] } {
		set_property enabled true $DMA_2D_TLAST_MODE
	} else {
		set_property enabled false $DMA_2D_TLAST_MODE
	}
}

proc validate_PARAM_VALUE.DMA_2D_TLAST_MODE { PARAM_VALUE.DMA_2D_TLAST_MODE } {
	# Procedure called to validate DMA_2D_TLAST_MODE
	return true
}

proc update_PARAM_VALUE.DMA_AXI_PROTOCOL_DEST { PARAM_VALUE.DMA_AXI_PROTOCOL_DEST PARAM_VALUE.DMA_TYPE_DEST } {
	# Procedure called to update DMA_AXI_PROTOCOL_DEST when any of the dependent parameters in the arguments change
	
	set DMA_AXI_PROTOCOL_DEST ${PARAM_VALUE.DMA_AXI_PROTOCOL_DEST}
	set DMA_TYPE_DEST ${PARAM_VALUE.DMA_TYPE_DEST}
	set values(DMA_TYPE_DEST) [get_property value $DMA_TYPE_DEST]
	if { [gen_USERPARAMETER_DMA_AXI_PROTOCOL_DEST_ENABLEMENT $values(DMA_TYPE_DEST)] } {
		set_property enabled true $DMA_AXI_PROTOCOL_DEST
	} else {
		set_property enabled false $DMA_AXI_PROTOCOL_DEST
	}
}

proc validate_PARAM_VALUE.DMA_AXI_PROTOCOL_DEST { PARAM_VALUE.DMA_AXI_PROTOCOL_DEST } {
	# Procedure called to validate DMA_AXI_PROTOCOL_DEST
	return true
}

proc update_PARAM_VALUE.DMA_AXI_PROTOCOL_SRC { PARAM_VALUE.DMA_AXI_PROTOCOL_SRC PARAM_VALUE.DMA_TYPE_SRC } {
	# Procedure called to update DMA_AXI_PROTOCOL_SRC when any of the dependent parameters in the arguments change
	
	set DMA_AXI_PROTOCOL_SRC ${PARAM_VALUE.DMA_AXI_PROTOCOL_SRC}
	set DMA_TYPE_SRC ${PARAM_VALUE.DMA_TYPE_SRC}
	set values(DMA_TYPE_SRC) [get_property value $DMA_TYPE_SRC]
	if { [gen_USERPARAMETER_DMA_AXI_PROTOCOL_SRC_ENABLEMENT $values(DMA_TYPE_SRC)] } {
		set_property enabled true $DMA_AXI_PROTOCOL_SRC
	} else {
		set_property enabled false $DMA_AXI_PROTOCOL_SRC
	}
}

proc validate_PARAM_VALUE.DMA_AXI_PROTOCOL_SRC { PARAM_VALUE.DMA_AXI_PROTOCOL_SRC } {
	# Procedure called to validate DMA_AXI_PROTOCOL_SRC
	return true
}

proc update_PARAM_VALUE.ENABLE_FRAME_LOCK { PARAM_VALUE.ENABLE_FRAME_LOCK PARAM_VALUE.DMA_2D_TRANSFER PARAM_VALUE.CYCLIC } {
	# Procedure called to update ENABLE_FRAME_LOCK when any of the dependent parameters in the arguments change
	
	set ENABLE_FRAME_LOCK ${PARAM_VALUE.ENABLE_FRAME_LOCK}
	set DMA_2D_TRANSFER ${PARAM_VALUE.DMA_2D_TRANSFER}
	set CYCLIC ${PARAM_VALUE.CYCLIC}
	set values(DMA_2D_TRANSFER) [get_property value $DMA_2D_TRANSFER]
	set values(CYCLIC) [get_property value $CYCLIC]
	if { [gen_USERPARAMETER_ENABLE_FRAME_LOCK_ENABLEMENT $values(DMA_2D_TRANSFER) $values(CYCLIC)] } {
		set_property enabled true $ENABLE_FRAME_LOCK
	} else {
		set_property enabled false $ENABLE_FRAME_LOCK
	}
}

proc validate_PARAM_VALUE.ENABLE_FRAME_LOCK { PARAM_VALUE.ENABLE_FRAME_LOCK } {
	# Procedure called to validate ENABLE_FRAME_LOCK
	return true
}

proc update_PARAM_VALUE.MAX_NUM_FRAMES { PARAM_VALUE.MAX_NUM_FRAMES PARAM_VALUE.ENABLE_FRAME_LOCK } {
	# Procedure called to update MAX_NUM_FRAMES when any of the dependent parameters in the arguments change
	
	set MAX_NUM_FRAMES ${PARAM_VALUE.MAX_NUM_FRAMES}
	set ENABLE_FRAME_LOCK ${PARAM_VALUE.ENABLE_FRAME_LOCK}
	set values(ENABLE_FRAME_LOCK) [get_property value $ENABLE_FRAME_LOCK]
	if { [gen_USERPARAMETER_MAX_NUM_FRAMES_ENABLEMENT $values(ENABLE_FRAME_LOCK)] } {
		set_property enabled true $MAX_NUM_FRAMES
	} else {
		set_property enabled false $MAX_NUM_FRAMES
	}
}

proc validate_PARAM_VALUE.MAX_NUM_FRAMES { PARAM_VALUE.MAX_NUM_FRAMES } {
	# Procedure called to validate MAX_NUM_FRAMES
	return true
}

proc update_PARAM_VALUE.SYNC_TRANSFER_START { PARAM_VALUE.SYNC_TRANSFER_START PARAM_VALUE.DMA_TYPE_SRC } {
	# Procedure called to update SYNC_TRANSFER_START when any of the dependent parameters in the arguments change
	
	set SYNC_TRANSFER_START ${PARAM_VALUE.SYNC_TRANSFER_START}
	set DMA_TYPE_SRC ${PARAM_VALUE.DMA_TYPE_SRC}
	set values(DMA_TYPE_SRC) [get_property value $DMA_TYPE_SRC]
	if { [gen_USERPARAMETER_SYNC_TRANSFER_START_ENABLEMENT $values(DMA_TYPE_SRC)] } {
		set_property enabled true $SYNC_TRANSFER_START
	} else {
		set_property enabled false $SYNC_TRANSFER_START
	}
}

proc validate_PARAM_VALUE.SYNC_TRANSFER_START { PARAM_VALUE.SYNC_TRANSFER_START } {
	# Procedure called to validate SYNC_TRANSFER_START
	return true
}

proc update_PARAM_VALUE.ALLOW_ASYM_MEM { PARAM_VALUE.ALLOW_ASYM_MEM } {
	# Procedure called to update ALLOW_ASYM_MEM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ALLOW_ASYM_MEM { PARAM_VALUE.ALLOW_ASYM_MEM } {
	# Procedure called to validate ALLOW_ASYM_MEM
	return true
}

proc update_PARAM_VALUE.ASYNC_CLK_DEST_REQ { PARAM_VALUE.ASYNC_CLK_DEST_REQ } {
	# Procedure called to update ASYNC_CLK_DEST_REQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK_DEST_REQ { PARAM_VALUE.ASYNC_CLK_DEST_REQ } {
	# Procedure called to validate ASYNC_CLK_DEST_REQ
	return true
}

proc update_PARAM_VALUE.ASYNC_CLK_REQ_SRC { PARAM_VALUE.ASYNC_CLK_REQ_SRC } {
	# Procedure called to update ASYNC_CLK_REQ_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK_REQ_SRC { PARAM_VALUE.ASYNC_CLK_REQ_SRC } {
	# Procedure called to validate ASYNC_CLK_REQ_SRC
	return true
}

proc update_PARAM_VALUE.ASYNC_CLK_SRC_DEST { PARAM_VALUE.ASYNC_CLK_SRC_DEST } {
	# Procedure called to update ASYNC_CLK_SRC_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK_SRC_DEST { PARAM_VALUE.ASYNC_CLK_SRC_DEST } {
	# Procedure called to validate ASYNC_CLK_SRC_DEST
	return true
}

proc update_PARAM_VALUE.AXI_ID_WIDTH_DEST { PARAM_VALUE.AXI_ID_WIDTH_DEST } {
	# Procedure called to update AXI_ID_WIDTH_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ID_WIDTH_DEST { PARAM_VALUE.AXI_ID_WIDTH_DEST } {
	# Procedure called to validate AXI_ID_WIDTH_DEST
	return true
}

proc update_PARAM_VALUE.AXI_ID_WIDTH_SRC { PARAM_VALUE.AXI_ID_WIDTH_SRC } {
	# Procedure called to update AXI_ID_WIDTH_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ID_WIDTH_SRC { PARAM_VALUE.AXI_ID_WIDTH_SRC } {
	# Procedure called to validate AXI_ID_WIDTH_SRC
	return true
}

proc update_PARAM_VALUE.AXI_SLICE_DEST { PARAM_VALUE.AXI_SLICE_DEST } {
	# Procedure called to update AXI_SLICE_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_SLICE_DEST { PARAM_VALUE.AXI_SLICE_DEST } {
	# Procedure called to validate AXI_SLICE_DEST
	return true
}

proc update_PARAM_VALUE.AXI_SLICE_SRC { PARAM_VALUE.AXI_SLICE_SRC } {
	# Procedure called to update AXI_SLICE_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_SLICE_SRC { PARAM_VALUE.AXI_SLICE_SRC } {
	# Procedure called to validate AXI_SLICE_SRC
	return true
}

proc update_PARAM_VALUE.CYCLIC { PARAM_VALUE.CYCLIC } {
	# Procedure called to update CYCLIC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CYCLIC { PARAM_VALUE.CYCLIC } {
	# Procedure called to validate CYCLIC
	return true
}

proc update_PARAM_VALUE.DISABLE_DEBUG_REGISTERS { PARAM_VALUE.DISABLE_DEBUG_REGISTERS } {
	# Procedure called to update DISABLE_DEBUG_REGISTERS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DISABLE_DEBUG_REGISTERS { PARAM_VALUE.DISABLE_DEBUG_REGISTERS } {
	# Procedure called to validate DISABLE_DEBUG_REGISTERS
	return true
}

proc update_PARAM_VALUE.DMA_2D_TRANSFER { PARAM_VALUE.DMA_2D_TRANSFER } {
	# Procedure called to update DMA_2D_TRANSFER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_2D_TRANSFER { PARAM_VALUE.DMA_2D_TRANSFER } {
	# Procedure called to validate DMA_2D_TRANSFER
	return true
}

proc update_PARAM_VALUE.DMA_AXI_ADDR_WIDTH { PARAM_VALUE.DMA_AXI_ADDR_WIDTH } {
	# Procedure called to update DMA_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_AXI_ADDR_WIDTH { PARAM_VALUE.DMA_AXI_ADDR_WIDTH } {
	# Procedure called to validate DMA_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.DMA_DATA_WIDTH_DEST { PARAM_VALUE.DMA_DATA_WIDTH_DEST } {
	# Procedure called to update DMA_DATA_WIDTH_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_DATA_WIDTH_DEST { PARAM_VALUE.DMA_DATA_WIDTH_DEST } {
	# Procedure called to validate DMA_DATA_WIDTH_DEST
	return true
}

proc update_PARAM_VALUE.DMA_DATA_WIDTH_SRC { PARAM_VALUE.DMA_DATA_WIDTH_SRC } {
	# Procedure called to update DMA_DATA_WIDTH_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_DATA_WIDTH_SRC { PARAM_VALUE.DMA_DATA_WIDTH_SRC } {
	# Procedure called to validate DMA_DATA_WIDTH_SRC
	return true
}

proc update_PARAM_VALUE.DMA_LENGTH_WIDTH { PARAM_VALUE.DMA_LENGTH_WIDTH } {
	# Procedure called to update DMA_LENGTH_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_LENGTH_WIDTH { PARAM_VALUE.DMA_LENGTH_WIDTH } {
	# Procedure called to validate DMA_LENGTH_WIDTH
	return true
}

proc update_PARAM_VALUE.DMA_TYPE_DEST { PARAM_VALUE.DMA_TYPE_DEST } {
	# Procedure called to update DMA_TYPE_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_TYPE_DEST { PARAM_VALUE.DMA_TYPE_DEST } {
	# Procedure called to validate DMA_TYPE_DEST
	return true
}

proc update_PARAM_VALUE.DMA_TYPE_SRC { PARAM_VALUE.DMA_TYPE_SRC } {
	# Procedure called to update DMA_TYPE_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_TYPE_SRC { PARAM_VALUE.DMA_TYPE_SRC } {
	# Procedure called to validate DMA_TYPE_SRC
	return true
}

proc update_PARAM_VALUE.ENABLE_DIAGNOSTICS_IF { PARAM_VALUE.ENABLE_DIAGNOSTICS_IF } {
	# Procedure called to update ENABLE_DIAGNOSTICS_IF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_DIAGNOSTICS_IF { PARAM_VALUE.ENABLE_DIAGNOSTICS_IF } {
	# Procedure called to validate ENABLE_DIAGNOSTICS_IF
	return true
}

proc update_PARAM_VALUE.FIFO_SIZE { PARAM_VALUE.FIFO_SIZE } {
	# Procedure called to update FIFO_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_SIZE { PARAM_VALUE.FIFO_SIZE } {
	# Procedure called to validate FIFO_SIZE
	return true
}

proc update_PARAM_VALUE.HAS_AUTORUN { PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to update HAS_AUTORUN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_AUTORUN { PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to validate HAS_AUTORUN
	return true
}

proc update_PARAM_VALUE.ID { PARAM_VALUE.ID } {
	# Procedure called to update ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ID { PARAM_VALUE.ID } {
	# Procedure called to validate ID
	return true
}

proc update_PARAM_VALUE.MAX_BYTES_PER_BURST { PARAM_VALUE.MAX_BYTES_PER_BURST } {
	# Procedure called to update MAX_BYTES_PER_BURST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_BYTES_PER_BURST { PARAM_VALUE.MAX_BYTES_PER_BURST } {
	# Procedure called to validate MAX_BYTES_PER_BURST
	return true
}

proc update_PARAM_VALUE.USE_EXT_SYNC { PARAM_VALUE.USE_EXT_SYNC } {
	# Procedure called to update USE_EXT_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_EXT_SYNC { PARAM_VALUE.USE_EXT_SYNC } {
	# Procedure called to validate USE_EXT_SYNC
	return true
}


proc update_MODELPARAM_VALUE.ID { MODELPARAM_VALUE.ID PARAM_VALUE.ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ID}] ${MODELPARAM_VALUE.ID}
}

proc update_MODELPARAM_VALUE.DMA_DATA_WIDTH_SRC { MODELPARAM_VALUE.DMA_DATA_WIDTH_SRC PARAM_VALUE.DMA_DATA_WIDTH_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_DATA_WIDTH_SRC}] ${MODELPARAM_VALUE.DMA_DATA_WIDTH_SRC}
}

proc update_MODELPARAM_VALUE.DMA_DATA_WIDTH_DEST { MODELPARAM_VALUE.DMA_DATA_WIDTH_DEST PARAM_VALUE.DMA_DATA_WIDTH_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_DATA_WIDTH_DEST}] ${MODELPARAM_VALUE.DMA_DATA_WIDTH_DEST}
}

proc update_MODELPARAM_VALUE.DMA_LENGTH_WIDTH { MODELPARAM_VALUE.DMA_LENGTH_WIDTH PARAM_VALUE.DMA_LENGTH_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_LENGTH_WIDTH}] ${MODELPARAM_VALUE.DMA_LENGTH_WIDTH}
}

proc update_MODELPARAM_VALUE.DMA_2D_TRANSFER { MODELPARAM_VALUE.DMA_2D_TRANSFER PARAM_VALUE.DMA_2D_TRANSFER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_2D_TRANSFER}] ${MODELPARAM_VALUE.DMA_2D_TRANSFER}
}

proc update_MODELPARAM_VALUE.DMA_2D_TLAST_MODE { MODELPARAM_VALUE.DMA_2D_TLAST_MODE PARAM_VALUE.DMA_2D_TLAST_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_2D_TLAST_MODE}] ${MODELPARAM_VALUE.DMA_2D_TLAST_MODE}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK_REQ_SRC { MODELPARAM_VALUE.ASYNC_CLK_REQ_SRC PARAM_VALUE.ASYNC_CLK_REQ_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK_REQ_SRC}] ${MODELPARAM_VALUE.ASYNC_CLK_REQ_SRC}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK_SRC_DEST { MODELPARAM_VALUE.ASYNC_CLK_SRC_DEST PARAM_VALUE.ASYNC_CLK_SRC_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK_SRC_DEST}] ${MODELPARAM_VALUE.ASYNC_CLK_SRC_DEST}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK_DEST_REQ { MODELPARAM_VALUE.ASYNC_CLK_DEST_REQ PARAM_VALUE.ASYNC_CLK_DEST_REQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK_DEST_REQ}] ${MODELPARAM_VALUE.ASYNC_CLK_DEST_REQ}
}

proc update_MODELPARAM_VALUE.AXI_SLICE_DEST { MODELPARAM_VALUE.AXI_SLICE_DEST PARAM_VALUE.AXI_SLICE_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_SLICE_DEST}] ${MODELPARAM_VALUE.AXI_SLICE_DEST}
}

proc update_MODELPARAM_VALUE.AXI_SLICE_SRC { MODELPARAM_VALUE.AXI_SLICE_SRC PARAM_VALUE.AXI_SLICE_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_SLICE_SRC}] ${MODELPARAM_VALUE.AXI_SLICE_SRC}
}

proc update_MODELPARAM_VALUE.SYNC_TRANSFER_START { MODELPARAM_VALUE.SYNC_TRANSFER_START PARAM_VALUE.SYNC_TRANSFER_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SYNC_TRANSFER_START}] ${MODELPARAM_VALUE.SYNC_TRANSFER_START}
}

proc update_MODELPARAM_VALUE.CYCLIC { MODELPARAM_VALUE.CYCLIC PARAM_VALUE.CYCLIC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CYCLIC}] ${MODELPARAM_VALUE.CYCLIC}
}

proc update_MODELPARAM_VALUE.DMA_AXI_PROTOCOL_DEST { MODELPARAM_VALUE.DMA_AXI_PROTOCOL_DEST PARAM_VALUE.DMA_AXI_PROTOCOL_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_AXI_PROTOCOL_DEST}] ${MODELPARAM_VALUE.DMA_AXI_PROTOCOL_DEST}
}

proc update_MODELPARAM_VALUE.DMA_AXI_PROTOCOL_SRC { MODELPARAM_VALUE.DMA_AXI_PROTOCOL_SRC PARAM_VALUE.DMA_AXI_PROTOCOL_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_AXI_PROTOCOL_SRC}] ${MODELPARAM_VALUE.DMA_AXI_PROTOCOL_SRC}
}

proc update_MODELPARAM_VALUE.DMA_TYPE_DEST { MODELPARAM_VALUE.DMA_TYPE_DEST PARAM_VALUE.DMA_TYPE_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_TYPE_DEST}] ${MODELPARAM_VALUE.DMA_TYPE_DEST}
}

proc update_MODELPARAM_VALUE.DMA_TYPE_SRC { MODELPARAM_VALUE.DMA_TYPE_SRC PARAM_VALUE.DMA_TYPE_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_TYPE_SRC}] ${MODELPARAM_VALUE.DMA_TYPE_SRC}
}

proc update_MODELPARAM_VALUE.DMA_AXI_ADDR_WIDTH { MODELPARAM_VALUE.DMA_AXI_ADDR_WIDTH PARAM_VALUE.DMA_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.DMA_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.MAX_BYTES_PER_BURST { MODELPARAM_VALUE.MAX_BYTES_PER_BURST PARAM_VALUE.MAX_BYTES_PER_BURST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_BYTES_PER_BURST}] ${MODELPARAM_VALUE.MAX_BYTES_PER_BURST}
}

proc update_MODELPARAM_VALUE.FIFO_SIZE { MODELPARAM_VALUE.FIFO_SIZE PARAM_VALUE.FIFO_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_SIZE}] ${MODELPARAM_VALUE.FIFO_SIZE}
}

proc update_MODELPARAM_VALUE.AXI_ID_WIDTH_SRC { MODELPARAM_VALUE.AXI_ID_WIDTH_SRC PARAM_VALUE.AXI_ID_WIDTH_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ID_WIDTH_SRC}] ${MODELPARAM_VALUE.AXI_ID_WIDTH_SRC}
}

proc update_MODELPARAM_VALUE.AXI_ID_WIDTH_DEST { MODELPARAM_VALUE.AXI_ID_WIDTH_DEST PARAM_VALUE.AXI_ID_WIDTH_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ID_WIDTH_DEST}] ${MODELPARAM_VALUE.AXI_ID_WIDTH_DEST}
}

proc update_MODELPARAM_VALUE.DISABLE_DEBUG_REGISTERS { MODELPARAM_VALUE.DISABLE_DEBUG_REGISTERS PARAM_VALUE.DISABLE_DEBUG_REGISTERS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DISABLE_DEBUG_REGISTERS}] ${MODELPARAM_VALUE.DISABLE_DEBUG_REGISTERS}
}

proc update_MODELPARAM_VALUE.ENABLE_DIAGNOSTICS_IF { MODELPARAM_VALUE.ENABLE_DIAGNOSTICS_IF PARAM_VALUE.ENABLE_DIAGNOSTICS_IF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_DIAGNOSTICS_IF}] ${MODELPARAM_VALUE.ENABLE_DIAGNOSTICS_IF}
}

proc update_MODELPARAM_VALUE.ALLOW_ASYM_MEM { MODELPARAM_VALUE.ALLOW_ASYM_MEM PARAM_VALUE.ALLOW_ASYM_MEM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ALLOW_ASYM_MEM}] ${MODELPARAM_VALUE.ALLOW_ASYM_MEM}
}

proc update_MODELPARAM_VALUE.ENABLE_FRAME_LOCK { MODELPARAM_VALUE.ENABLE_FRAME_LOCK PARAM_VALUE.ENABLE_FRAME_LOCK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_FRAME_LOCK}] ${MODELPARAM_VALUE.ENABLE_FRAME_LOCK}
}

proc update_MODELPARAM_VALUE.MAX_NUM_FRAMES { MODELPARAM_VALUE.MAX_NUM_FRAMES PARAM_VALUE.MAX_NUM_FRAMES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_NUM_FRAMES}] ${MODELPARAM_VALUE.MAX_NUM_FRAMES}
}

proc update_MODELPARAM_VALUE.USE_EXT_SYNC { MODELPARAM_VALUE.USE_EXT_SYNC PARAM_VALUE.USE_EXT_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_EXT_SYNC}] ${MODELPARAM_VALUE.USE_EXT_SYNC}
}

proc update_MODELPARAM_VALUE.HAS_AUTORUN { MODELPARAM_VALUE.HAS_AUTORUN PARAM_VALUE.HAS_AUTORUN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_AUTORUN}] ${MODELPARAM_VALUE.HAS_AUTORUN}
}

proc update_MODELPARAM_VALUE.DMAC_DEF_FLAGS { MODELPARAM_VALUE.DMAC_DEF_FLAGS PARAM_VALUE.DMAC_DEF_FLAGS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMAC_DEF_FLAGS}] ${MODELPARAM_VALUE.DMAC_DEF_FLAGS}
}

proc update_MODELPARAM_VALUE.DMAC_DEF_SRC_ADDR { MODELPARAM_VALUE.DMAC_DEF_SRC_ADDR PARAM_VALUE.DMAC_DEF_SRC_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMAC_DEF_SRC_ADDR}] ${MODELPARAM_VALUE.DMAC_DEF_SRC_ADDR}
}

proc update_MODELPARAM_VALUE.DMAC_DEF_DEST_ADDR { MODELPARAM_VALUE.DMAC_DEF_DEST_ADDR PARAM_VALUE.DMAC_DEF_DEST_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMAC_DEF_DEST_ADDR}] ${MODELPARAM_VALUE.DMAC_DEF_DEST_ADDR}
}

proc update_MODELPARAM_VALUE.DMAC_DEF_X_LENGTH { MODELPARAM_VALUE.DMAC_DEF_X_LENGTH PARAM_VALUE.DMAC_DEF_X_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMAC_DEF_X_LENGTH}] ${MODELPARAM_VALUE.DMAC_DEF_X_LENGTH}
}

proc update_MODELPARAM_VALUE.DMAC_DEF_Y_LENGTH { MODELPARAM_VALUE.DMAC_DEF_Y_LENGTH PARAM_VALUE.DMAC_DEF_Y_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMAC_DEF_Y_LENGTH}] ${MODELPARAM_VALUE.DMAC_DEF_Y_LENGTH}
}

proc update_MODELPARAM_VALUE.DMAC_DEF_SRC_STRIDE { MODELPARAM_VALUE.DMAC_DEF_SRC_STRIDE PARAM_VALUE.DMAC_DEF_SRC_STRIDE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMAC_DEF_SRC_STRIDE}] ${MODELPARAM_VALUE.DMAC_DEF_SRC_STRIDE}
}

proc update_MODELPARAM_VALUE.DMAC_DEF_DEST_STRIDE { MODELPARAM_VALUE.DMAC_DEF_DEST_STRIDE PARAM_VALUE.DMAC_DEF_DEST_STRIDE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMAC_DEF_DEST_STRIDE}] ${MODELPARAM_VALUE.DMAC_DEF_DEST_STRIDE}
}

proc update_MODELPARAM_VALUE.DMAC_DEF_FLOCK_CFG { MODELPARAM_VALUE.DMAC_DEF_FLOCK_CFG PARAM_VALUE.DMAC_DEF_FLOCK_CFG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMAC_DEF_FLOCK_CFG}] ${MODELPARAM_VALUE.DMAC_DEF_FLOCK_CFG}
}

proc update_MODELPARAM_VALUE.DMAC_DEF_FLOCK_STRIDE { MODELPARAM_VALUE.DMAC_DEF_FLOCK_STRIDE PARAM_VALUE.DMAC_DEF_FLOCK_STRIDE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMAC_DEF_FLOCK_STRIDE}] ${MODELPARAM_VALUE.DMAC_DEF_FLOCK_STRIDE}
}

