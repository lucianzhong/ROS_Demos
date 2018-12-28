

Option Strict Off
Option Explicit On

Imports System.Runtime.InteropServices

Module ControlCAN
    '�豸����˵����
    Public Const VCI_USBCAN As Int32 = 3
    Public Const VCI_USBCAN2 As Int32 = 4

    '------------------����ZLG�ĺ�������������-----------------------
    '������Ҫ�õ������ݽṹ
    'USB-CAN�����������忨��Ϣ���������͡�
    Public Structure VCI_BOARD_INFO
        Dim hw_Version As Short
        Dim fw_Version As Short
        Dim dr_Version As Short
        Dim in_Version As Short
        Dim irq_num As Short
        Dim can_num As Byte
        <MarshalAs(UnmanagedType.ByValArray, SizeConst:=20)> Dim str_Serial_Num() As Byte
        <MarshalAs(UnmanagedType.ByValArray, SizeConst:=40)> Dim str_hw_Type() As Byte
        <MarshalAs(UnmanagedType.ByValArray, SizeConst:=4)> Dim Reserved() As Short

    End Structure

    '����CAN��Ϣ֡���������͡�
    Public Structure VCI_CAN_OBJ
        Dim ID As Integer
        Dim TimeStamp As Integer
        Dim TimeFlag As Byte
        Dim SendType As Byte
        Dim RemoteFlag As Byte
        Dim ExternFlag As Byte
        Dim DataLen As Byte

        Dim data0 As Byte
        Dim data1 As Byte
        Dim data2 As Byte
        Dim data3 As Byte
        Dim data4 As Byte
        Dim data5 As Byte
        Dim data6 As Byte
        Dim data7 As Byte

        Dim Reserved0 As Byte
        Dim Reserved1 As Byte
        Dim Reserved2 As Byte

    End Structure

    '����CAN������״̬���������͡�
    Public Structure VCI_CAN_STATUS
        Dim ErrInterrupt As Byte
        Dim regMode As Byte
        Dim regStatus As Byte
        Dim regALCapture As Byte
        Dim regECCapture As Byte
        Dim regEWLimit As Byte
        Dim regRECounter As Byte
        Dim regTECounter As Byte
        Dim Reserved As Integer
    End Structure

    '���������Ϣ���������͡�
    Public Structure VCI_ERR_INFO
        Dim ErrCode As Integer
        <MarshalAs(UnmanagedType.ByValArray, SizeConst:=3)> Dim Passive_ErrData() As Byte
        Dim ArLost_ErrData As Byte

    End Structure

    '�����ʼ��CAN����������
    Public Structure VCI_INIT_CONFIG
        Dim AccCode As Integer
        Dim AccMask As Integer
        Dim Reserved As Integer
        Dim Filter_Renamed As Byte '0,1��������֡��2��׼֡�˲���3����չ֡�˲���
        Dim Timing0 As Byte
        Dim Timing1 As Byte
        Dim Mode As Byte 'ģʽ��0��ʾ����ģʽ��1��ʾֻ��ģʽ,2�Բ�ģʽ
    End Structure

    '��������
    '-----------------------------����ZLG�ĺ���---------------------------------
    '����ֵ˵����=1�����ɹ���=0����ʧ�ܣ�=-1Ӳ���������豸δ�򿪣�

    '���豸����ڲ���DeviceType��ʾ�豸���ͺţ�DeviceInd��ʾ�豸�����ţ�������ӿں�����ʹ���ֲᣩ�����豸ΪCAN232ʱReserved��ʾ�򿪴��ڵĲ����ʣ���Ϊ�����豸ʱ����������
    Declare Function VCI_OpenDevice Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal Reserved As Integer) As Integer
    '�ر��豸
    Declare Function VCI_CloseDevice Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer) As Integer
    '��ʼ��ָ����CAN
    Declare Function VCI_InitCAN Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByRef InitConfig As VCI_INIT_CONFIG) As Integer
    '��ȡ�豸��Ϣ
    Declare Function VCI_ReadBoardInfo Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByRef info As VCI_BOARD_INFO) As Integer
    '��ȡ���һ�δ�����Ϣ
    Declare Function VCI_ReadErrInfo Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByRef ErrInfo As VCI_ERR_INFO) As Integer
    '��ȡCAN״̬
    Declare Function VCI_ReadCANStatus Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByRef CANStatus As VCI_CAN_STATUS) As Integer
    '��ȡ�豸����Ӧ����
    Declare Function VCI_GetReference Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByVal RefType As Integer, ByRef data As Long) As Integer
    '�����豸����Ӧ��������Ҫ����ͬ�豸���ض�����
    Declare Function VCI_SetReference Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByVal RefType As Integer, ByRef data As Long) As Integer
    '��ȡָ�����ջ������н��յ�����δ����ȡ��֡��
    Declare Function VCI_GetReceiveNum Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer) As Integer
    '���ָ��������
    Declare Function VCI_ClearBuffer Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer) As Integer
    '����CAN
    Declare Function VCI_StartCAN Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer) As Integer
    '��λCAN
    Declare Function VCI_ResetCAN Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer) As Integer
    '��ָ���ĵ��豸��������
    Declare Function VCI_Transmit Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByRef Sendbuf As VCI_CAN_OBJ, ByVal length As Integer) As Integer
    '��ָ�����豸��ȡ����
    Declare Function VCI_Receive Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByRef Receive As VCI_CAN_OBJ, ByVal length As Integer, ByVal WaitTime As Integer) As Integer


    '-------------------------------�������������ݽṹ����---------------------------------
    'USB-CAN�����������忨��Ϣ����������1�������ݽṹ��VCI_FindUsbDevice������

    Public Structure VCI_BOARD_INFO1
        Dim hw_Version As Short
        Dim fw_Version As Short
        Dim dr_Version As Short
        Dim in_Version As Short
        Dim irq_num As Short
        Dim can_num As Byte
        Dim reserved As Byte
        <MarshalAs(UnmanagedType.ByValArray, SizeConst:=8)> Dim str_Serial_Num() As Byte
        <MarshalAs(UnmanagedType.ByValArray, SizeConst:=16)> Dim str_hw_Type() As Byte
        <MarshalAs(UnmanagedType.ByValArray, SizeConst:=16)> Dim str_Usb_Serial() As Byte

    End Structure

    '���峣���������
    Public Structure VCI_REF_NORMAL
        Dim Mode As Byte '����ģʽ
        Dim Filter_Renamed As Byte '�˲���ʽ
        Dim AccCode As Integer '�����˲�������
        Dim AccMask As Integer '�����˲�������
        Dim kBaudRate As Byte '�����������ţ�0-SelfDefine,1-5Kbps(δ��),2-18����Ϊ��10kbps,20kbps,40kbps,50kbps,80kbps,100kbps,125kbps,200kbps,250kbps,400kbps,500kbps,666kbps,800kbps,1000kbps,33.33kbps,66.66kbps,83.33kbps
        Dim Timing0 As Byte
        Dim Timing1 As Byte
        Dim CANRX_EN As Byte '������δ��
        Dim UARTBAUD As Byte '������δ��
    End Structure

    '���岨�������ò�������
    Public Structure VCI_BAUD_TYPE
        Dim Baud As Integer '�洢������ʵ��ֵ
        Dim SJW As Byte 'ͬ����ת��ȣ�ȡֵ1-4
        Dim BRP As Byte 'Ԥ��Ƶֵ��ȡֵ1-64
        Dim SAM As Byte '�����㣬ȡֵ0=����һ�Σ�1=��������
        Dim PHSEG2_SEL As Byte '��λ�����2ѡ��λ��ȡֵ0=����λ�����1ʱ�����,1=�ɱ��
        Dim PRSEG As Byte '����ʱ��Σ�ȡֵ1-8
        Dim PHSEG1 As Byte '��λ�����1��ȡֵ1-8
        Dim PHSEG2 As Byte '��λ�����2��ȡֵ1-8
    End Structure

    '����Reference��������
    Public Structure VCI_REF_STRUCT
        Dim RefNormal As VCI_REF_NORMAL
        Dim reserved As Byte
        Dim BaudType As VCI_BAUD_TYPE
    End Structure

    Declare Function VCI_GetReference2 Lib "ControlCAN.dll" (ByVal DevType As Integer, ByVal DevIndex As Integer, ByVal CANIndex As Integer, ByVal reserved As Integer, ByRef pRefStruct As VCI_REF_STRUCT) As Integer
    Declare Function VCI_SetReference2 Lib "ControlCAN.dll" (ByVal DevType As Integer, ByVal DevIndex As Integer, ByVal CANIndex As Integer, ByVal RefType As Integer, ByRef data As Byte) As Integer
    Declare Function VCI_ResumeConfig Lib "ControlCAN.dll" (ByVal DevType As Integer, ByVal DevIndex As Integer) As Integer

    Declare Function VCI_ConnectDevice Lib "ControlCAN.dll" (ByVal DevType As Integer, ByVal DevIndex As Integer) As Integer
    Declare Function VCI_UsbDeviceReset Lib "ControlCAN.dll" (ByVal DevType As Integer, ByVal DevIndex As Integer, ByVal reserved As Integer) As Integer
    Declare Function VCI_FindUsbDevice Lib "ControlCAN.dll" (ByRef pInfo As VCI_BOARD_INFO1) As Integer



    Public Sub bytecpy(ByRef desarr() As Byte, ByVal desoff As Long, ByVal srcarr() As Byte, ByVal srcoff As Long, ByVal len As Long)
        Dim i As Long

        For i = 0 To len - 1
            desarr(desoff + i) = srcarr(i + srcoff)
        Next
    End Sub


End Module