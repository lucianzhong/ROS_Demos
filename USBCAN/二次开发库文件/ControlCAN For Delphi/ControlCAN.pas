unit ControlCAN;

interface

uses
  WinTypes;

const
  DLL_NAME  = 'ControlCAN.dll';//动态库名称

type

//--------------------------------------兼容ZLG的函数及数据类型-----------------
//声明各个数据结构

//USB-CAN总线适配器板卡信息的数据类型。
VCI_BOARD_INFO = Record
		hw_Version : WORD;
		fw_Version : WORD;
		dr_Version : WORD;
		in_Version : WORD;
		irq_Num : WORD;
		can_Num : BYTE;
		str_Serial_Num : array[0..19] of CHAR;
		str_hw_Type : array[0..39] of CHAR;
		Reserved : array[0..3] of WORD;
END;

PVCI_BOARD_INFO=^VCI_BOARD_INFO;

//定义CAN信息帧的数据类型。
VCI_CAN_OBJ = Record
	ID : UINT;
	TimeStamp : UINT;
	TimeFlag : BYTE;
	SendType : BYTE;
	RemoteFlag : BYTE;//是否是远程帧
	ExternFlag : BYTE;//是否是扩展帧
	DataLen : BYTE;
	Data : array[0..7] of BYTE;
	Reserved : array[0..2] of BYTE;
END;

PVCI_CAN_OBJ = ^VCI_CAN_OBJ;

//定义CAN控制器状态的数据类型。
VCI_CAN_STATUS = Record
	ErrInterrupt : UCHAR;
	regMode : UCHAR;
	regStatus : UCHAR;
	regALCapture : UCHAR;
	regECCapture : UCHAR;
	regEWLimit : UCHAR;
	regRECounter : UCHAR;
	regTECounter : UCHAR;
	Reserved : DWORD;
END;

PVCI_CAN_STATUS = ^VCI_CAN_STATUS;

//定义错误信息的数据类型。
VCI_ERR_INFO = Record
		ErrCode : UINT;
		Passive_ErrData : array[0..2] of BYTE;
		ArLost_ErrData : BYTE;
END;

PVCI_ERR_INFO = ^VCI_ERR_INFO;

//定义初始化CAN的数据类型
VCI_INIT_CONFIG = Record
	AccCode : DWORD;
	AccMask : DWORD;
	Reserved : DWORD;
	Filter : UCHAR;
	Timing0 : UCHAR;
	Timing1 : UCHAR;
	Mode : UCHAR;
END;

PVCI_INIT_CONFIG = ^VCI_INIT_CONFIG;

//导入动态库函数
function VCI_OpenDevice ( DevType  : DWORD;
                          DevIndex : DWORD;
                          Reserved : DWORD) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_CloseDevice ( DevType  : DWORD;
                           DevIndex : DWORD) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_InitCAN ( DevType  : DWORD;
                       DevIndex : DWORD;
                       CANIndex : DWORD;
                       pInitConfig : PVCI_INIT_CONFIG) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_ReadBoardInfo ( DevType  : DWORD;
                             DevIndex : DWORD;
                             pInfo : PVCI_BOARD_INFO) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_ReadErrInfo ( DevType  : DWORD;
                           DevIndex : DWORD;
                           CANIndex : DWORD;
                           pErrInfo : PVCI_ERR_INFO) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_ReadCANStatus ( DevType  : DWORD;
                             DevIndex : DWORD;
                             CANIndex : DWORD;
                             pCANStatus : PVCI_CAN_STATUS) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_GetReference ( DevType  : DWORD;
                            DevIndex : DWORD;
                            CANIndex : DWORD;
                            RefType : DWORD;
                            pData : Pointer) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_SetReference ( DevType  : DWORD;
                            DevIndex : DWORD;
                            CANIndex : DWORD;
                            RefType : DWORD;
                            pData : Pointer) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_GetReceiveNum ( DevType  : DWORD;
                             DevIndex : DWORD;
                             CANIndex : DWORD) : ULONG;
  stdcall;
  external DLL_NAME;

function VCI_ClearBuffer ( DevType  : DWORD;
                           DevIndex : DWORD;
                           CANIndex : DWORD) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_StartCAN ( DevType  : DWORD;
                        DevIndex : DWORD;
                        CANIndex : DWORD) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_ResetCAN ( DevType  : DWORD;
                        DevIndex : DWORD;
                        CANIndex : DWORD) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_Transmit ( DevType  : DWORD;
                        DevIndex : DWORD;
                        CANIndex : DWORD;
                        pSend : PVCI_CAN_OBJ;
                        Len : ULONG) : ULONG;
  stdcall;
  external DLL_NAME;

function VCI_Receive ( DevType  : DWORD;
                        DevIndex : DWORD;
                        CANIndex : DWORD;
                        pReceive : PVCI_CAN_OBJ;
                        Len : ULONG;
                        WaitTime : integer) : ULONG;
  stdcall;
  external DLL_NAME;

//------------------------其他函数及数据结构描述--------------------------------
type
//USB-CAN总线适配器板卡信息的数据类型1，该类型在VCI_FindUsbDevice函数中引用
VCI_BOARD_INFO1 = Record
		hw_Version : WORD;
		fw_Version : WORD;
		dr_Version : WORD;
		in_Version : WORD;
		irq_Num : WORD;
		can_Num : BYTE;
    reserved : BYTE;
		str_Serial_Num : array[0..7] of CHAR;
		str_hw_Type : array[0..15] of CHAR;
		str_USB_Serial : array[0..3,0..3] of CHAR;
END;

PVCI_BOARD_INFO1=^VCI_BOARD_INFO1;

//定义常规参数类型
VCI_REF_NORMAL = Record
  Mode : UCHAR;         //工作模式
  Filter : UCHAR;       //滤波方式
  AccCode : DWORD;      //接收滤波验收码
  AccMask : DWORD;      //接收滤波屏蔽码
  kBaudRate : UCHAR;    //波特率索引号，0-SelfDefine,1-5Kbps(未用),2-18依次为：10kbps,20kbps,40kbps,50kbps,80kbps,100kbps,125kbps,200kbps,250kbps,400kbps,500kbps,666kbps,800kbps,1000kbps,33.33kbps,66.66kbps,83.33kbps
  Timing0 : UCHAR;
  Timing1 : UCHAR;
  CANRX_EN : UCHAR;     //保留，未用
  UARTBAUD : UCHAR;     //保留，未用
END;

PVCI_REF_NORMAL = ^VCI_REF_NORMAL;

//定义波特率设置参数类型
VCI_BAUD_TYPE = Record
  Baud : DWORD;         //存储波特率实际值
  SJW : UCHAR;          //同步跳转宽度，取值1-4
  BRP : UCHAR;          //预分频值，取值1-64
  SAM : UCHAR;          //采样点，取值0=采样一次，1=采样三次
  PHSEG2_SEL : UCHAR;   //相位缓冲段2选择位，取值0=由相位缓冲段1时间决定,1=可编程
  PRSEG : UCHAR;        //传播时间段，取值1-8
  PHSEG1 : UCHAR;       //相位缓冲段1，取值1-8
  PHSEG2 : UCHAR;       //相位缓冲段2，取值1-8
END;

PVCI_BAUD_TYPE = ^VCI_BAUD_TYPE;

//定义Reference参数类型
VCI_REF_STRUCT = Record
  RefNormal : VCI_REF_NORMAL;
  Reserved : UCHAR;
  BaudType : VCI_BAUD_TYPE;
END;

PVCI_REF_STRUCT = ^VCI_REF_STRUCT;

//导入动态库函数
function VCI_GetReference2 ( DevType  : DWORD;
                        DevIndex : DWORD;
                        CANIndex : DWORD;
                        Reserved : DWORD;
                        pRefStruct : PVCI_REF_STRUCT) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_SetReference2 ( DevType  : DWORD;
                        DevIndex : DWORD;
                        CANIndex : DWORD;
                        RefType : DWORD;
                        pRefStruct : Pointer) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_ResumeConfig ( DevType  : DWORD;
                        DevIndex : DWORD;
                        CANIndex : DWORD) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_ConnectDevice ( DevType  : DWORD;
                        DevIndex : DWORD) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_UsbDeviceReset ( DevType  : DWORD;
                        DevIndex : DWORD;
                        Reserved : DWORD) : DWORD;
  stdcall;
  external DLL_NAME;

function VCI_FindUsbDevice ( pInfo  : PVCI_BOARD_INFO1) : DWORD;
  stdcall;
  external DLL_NAME;

implementation

end.
