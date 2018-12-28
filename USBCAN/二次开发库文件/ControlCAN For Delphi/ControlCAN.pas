unit ControlCAN;

interface

uses
  WinTypes;

const
  DLL_NAME  = 'ControlCAN.dll';//��̬������

type

//--------------------------------------����ZLG�ĺ�������������-----------------
//�����������ݽṹ

//USB-CAN�����������忨��Ϣ���������͡�
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

//����CAN��Ϣ֡���������͡�
VCI_CAN_OBJ = Record
	ID : UINT;
	TimeStamp : UINT;
	TimeFlag : BYTE;
	SendType : BYTE;
	RemoteFlag : BYTE;//�Ƿ���Զ��֡
	ExternFlag : BYTE;//�Ƿ�����չ֡
	DataLen : BYTE;
	Data : array[0..7] of BYTE;
	Reserved : array[0..2] of BYTE;
END;

PVCI_CAN_OBJ = ^VCI_CAN_OBJ;

//����CAN������״̬���������͡�
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

//���������Ϣ���������͡�
VCI_ERR_INFO = Record
		ErrCode : UINT;
		Passive_ErrData : array[0..2] of BYTE;
		ArLost_ErrData : BYTE;
END;

PVCI_ERR_INFO = ^VCI_ERR_INFO;

//�����ʼ��CAN����������
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

//���붯̬�⺯��
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

//------------------------�������������ݽṹ����--------------------------------
type
//USB-CAN�����������忨��Ϣ����������1����������VCI_FindUsbDevice����������
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

//���峣���������
VCI_REF_NORMAL = Record
  Mode : UCHAR;         //����ģʽ
  Filter : UCHAR;       //�˲���ʽ
  AccCode : DWORD;      //�����˲�������
  AccMask : DWORD;      //�����˲�������
  kBaudRate : UCHAR;    //�����������ţ�0-SelfDefine,1-5Kbps(δ��),2-18����Ϊ��10kbps,20kbps,40kbps,50kbps,80kbps,100kbps,125kbps,200kbps,250kbps,400kbps,500kbps,666kbps,800kbps,1000kbps,33.33kbps,66.66kbps,83.33kbps
  Timing0 : UCHAR;
  Timing1 : UCHAR;
  CANRX_EN : UCHAR;     //������δ��
  UARTBAUD : UCHAR;     //������δ��
END;

PVCI_REF_NORMAL = ^VCI_REF_NORMAL;

//���岨�������ò�������
VCI_BAUD_TYPE = Record
  Baud : DWORD;         //�洢������ʵ��ֵ
  SJW : UCHAR;          //ͬ����ת��ȣ�ȡֵ1-4
  BRP : UCHAR;          //Ԥ��Ƶֵ��ȡֵ1-64
  SAM : UCHAR;          //�����㣬ȡֵ0=����һ�Σ�1=��������
  PHSEG2_SEL : UCHAR;   //��λ�����2ѡ��λ��ȡֵ0=����λ�����1ʱ�����,1=�ɱ��
  PRSEG : UCHAR;        //����ʱ��Σ�ȡֵ1-8
  PHSEG1 : UCHAR;       //��λ�����1��ȡֵ1-8
  PHSEG2 : UCHAR;       //��λ�����2��ȡֵ1-8
END;

PVCI_BAUD_TYPE = ^VCI_BAUD_TYPE;

//����Reference��������
VCI_REF_STRUCT = Record
  RefNormal : VCI_REF_NORMAL;
  Reserved : UCHAR;
  BaudType : VCI_BAUD_TYPE;
END;

PVCI_REF_STRUCT = ^VCI_REF_STRUCT;

//���붯̬�⺯��
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
