obj-$(CONFIG_GOBINET) 	:= GobiNet.o
GobiNet-objs 		:= GobiUSBNet.o QMIDevice.o QMI.o usbnet_2_6_32.o usbnet_3_0_6.o \
	            	usbnet_2_6_35.o usbnet_3_10_21.o usbnet_3_12_xx.o usbnet_4_4_xx.o
ifdef TX_URB_MONITOR
ifeq ($(TX_URB_MONITOR), 1)
KBUILD_CFLAGS += -DTX_XMIT_SIERRA -DTX_URB_MONITOR
else
TX_URB_MONITOR:=0
endif
else
TX_URB_MONITOR:=0
endif
ifeq ($(TX_URB_MONITOR), 1)
	ccflags-y:=-DTX_URB_MONITOR
endif

RAWIP := 0
ifeq ($(RAWIP), 1)
	ccflags-y:=-DDATA_MODE_RP
endif


