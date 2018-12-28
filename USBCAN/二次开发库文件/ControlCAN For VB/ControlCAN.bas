Attribute VB_Name = "ControlCAN"
'�豸����˵����
'USB_CAN:3    ---- ��ͨ��USB-CAN������
'USB_CAN2:4   ---- ˫ͨ��USB-CAN������

'------------------����ZLG�ĺ�������������-----------------------
'������Ҫ�õ������ݽṹ
'USB-CAN�����������忨��Ϣ���������͡�
Public Type VCI_BOARD_INFO
    hw_Version As Integer
    fw_Version As Integer
    dr_Version As Integer
    in_Version As Integer
    irq_num As Integer
    can_num As Byte
    str_Serial_Num(19) As Byte
    str_hw_Type(39) As Byte
    str_Usb_Serial(3) As Byte
End Type

'����CAN��Ϣ֡���������͡�
Public Type VCI_CAN_OBJ
    ID As Long
    TimeStamp As Long                            'ʱ���ʶ
    TimeFlag As Byte         '�Ƿ�ʹ��ʱ���ʶ
    SendType As Byte         '���ͱ�־��������δ��
    RemoteFlag As Byte       '�Ƿ���Զ��֡
    ExternFlag As Byte       '�Ƿ�����չ֡
    DataLen As Byte
    data(7) As Byte
    reserved(2) As Byte
End Type

'����CAN������״̬���������͡�
Public Type VCI_CAN_STATUS
    ErrInterrupt As Byte
    regMode As Byte
    regStatus As Byte
    regALCapture As Byte
    regECCapture As Byte
    regEWLimit As Byte
    regRECounter As Byte
    regTECounter As Byte
    reserved As Long
End Type

'���������Ϣ���������͡�
Public Type VCI_ERR_INFO
    ErrCode As Long
    Passive_ErrData(2) As Byte
    ArLost_ErrData As Byte
End Type

'�����ʼ��CAN����������
Public Type VCI_INIT_CONFIG
    AccCode As Long
    AccMask As Long
    InitFlag As Long
    Filter As Byte              '0,1��������֡��2��׼֡�˲���3����չ֡�˲���
    Timing0 As Byte
    Timing1 As Byte
    Mode As Byte                        'ģʽ��0��ʾ����ģʽ��1��ʾֻ��ģʽ,2�Բ�ģʽ
End Type


'��������
'-----------------------------����ZLG�ĺ���---------------------------------
'����ֵ˵����=1�����ɹ���=0����ʧ�ܣ�=-1Ӳ���������豸δ�򿪣�
Declare Function VCI_OpenDevice Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal reserved As Long) As Long
Declare Function VCI_CloseDevice Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long) As Long
Declare Function VCI_InitCAN Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long, ByRef pInitConfig As VCI_INIT_CONFIG) As Long

Declare Function VCI_ReadBoardInfo Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByRef pInfo As VCI_BOARD_INFO) As Long
Declare Function VCI_ReadErrInfo Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long, ByRef pErrInfo As VCI_ERR_INFO) As Long
Declare Function VCI_ReadCANStatus Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long, ByRef pCANStatus As VCI_CAN_STATUS) As Long

Declare Function VCI_GetReference Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long, ByVal reserved As Long, ByRef data As Byte) As Long
Declare Function VCI_SetReference Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long, ByVal RefType As Long, ByRef data As Byte) As Long

Declare Function VCI_GetReceiveNum Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long) As Long
Declare Function VCI_ClearBuffer Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long) As Long

Declare Function VCI_StartCAN Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long) As Long
Declare Function VCI_ResetCAN Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long) As Long

Declare Function VCI_Receive Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long, ByRef pReceive As VCI_CAN_OBJ, ByVal Length As Long, ByVal WaitTime As Integer) As Long
'����ֵΪʵ�ʷ���֡����������-1����ʾ�豸����
Declare Function VCI_Transmit Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long, ByRef pSend As VCI_CAN_OBJ, ByVal Length As Long) As Long

'-------------------------------�������������ݽṹ����---------------------------------
'USB-CAN�����������忨��Ϣ����������1�������ݽṹ��VCI_FindUsbDevice������
Public Type VCI_BOARD_INFO1
    hw_Version As Integer
    fw_Version As Integer
    dr_Version As Integer
    in_Version As Integer
    irq_num As Integer
    can_num As Byte
    reserved As Byte
    str_Serial_Num(7) As Byte
    str_hw_Type(15) As Byte
    str_Usb_Serial(3, 3) As Byte
End Type

'���峣���������
Public Type VCI_REF_NORMAL
                Mode As Byte                    '����ģʽ
                Filter As Byte          '�˲���ʽ
                AccCode As Long         '�����˲�������
                AccMask As Long         '�����˲�������
                kBaudRate As Byte       '�����������ţ�0-SelfDefine,1-5Kbps(δ��),2-18����Ϊ��10kbps,20kbps,40kbps,50kbps,80kbps,100kbps,125kbps,200kbps,250kbps,400kbps,500kbps,666kbps,800kbps,1000kbps,33.33kbps,66.66kbps,83.33kbps
                Timing0 As Byte
                Timing1 As Byte
                CANRX_EN As Byte        '������δ��
                UARTBAUD As Byte        '������δ��
End Type

'���岨�������ò�������
Public Type VCI_BAUD_TYPE
                Baud As Long                                    '�洢������ʵ��ֵ
                SJW As Byte           'ͬ����ת��ȣ�ȡֵ1-4
                BRP As Byte           'Ԥ��Ƶֵ��ȡֵ1-64
                SAM As Byte           '�����㣬ȡֵ0=����һ�Σ�1=��������
                PHSEG2_SEL As Byte    '��λ�����2ѡ��λ��ȡֵ0=����λ�����1ʱ�����,1=�ɱ��
                PRSEG As Byte         '����ʱ��Σ�ȡֵ1-8
                PHSEG1 As Byte        '��λ�����1��ȡֵ1-8
                PHSEG2 As Byte        '��λ�����2��ȡֵ1-8
End Type

'����Reference��������
Public Type VCI_REF_STRUCT
                RefNormal As VCI_REF_NORMAL
                reserved        As Byte
                BaudType As VCI_BAUD_TYPE
End Type

Declare Function VCI_GetReference2 Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long, ByVal reserved As Long, ByRef pRefStruct As VCI_REF_STRUCT) As Long
Declare Function VCI_SetReference2 Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long, ByVal RefType As Long, ByRef data As Byte) As Long
Declare Function VCI_ResumeConfig Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long) As Long

Declare Function VCI_ConnectDevice Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long) As Long
Declare Function VCI_UsbDeviceReset Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal reserved As Long) As Long
Declare Function VCI_FindUsbDevice Lib "ControlCAN.dll" (ByRef pInfo As VCI_BOARD_INFO1) As Long

'�ļ�����
