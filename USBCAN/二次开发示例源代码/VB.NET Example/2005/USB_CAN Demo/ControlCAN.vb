

Option Strict Off
Option Explicit On

Imports System.Runtime.InteropServices

Module ControlCAN
    '设备类型说明：
    Public Const VCI_USBCAN As Int32 = 3
    Public Const VCI_USBCAN2 As Int32 = 4

    '------------------兼容ZLG的函数及数据类型-----------------------
    '定义需要用到的数据结构
    'USB-CAN总线适配器板卡信息的数据类型。
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

    '定义CAN信息帧的数据类型。
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

    '定义CAN控制器状态的数据类型。
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

    '定义错误信息的数据类型。
    Public Structure VCI_ERR_INFO
        Dim ErrCode As Integer
        <MarshalAs(UnmanagedType.ByValArray, SizeConst:=3)> Dim Passive_ErrData() As Byte
        Dim ArLost_ErrData As Byte

    End Structure

    '定义初始化CAN的数据类型
    Public Structure VCI_INIT_CONFIG
        Dim AccCode As Integer
        Dim AccMask As Integer
        Dim Reserved As Integer
        Dim Filter_Renamed As Byte '0,1接收所有帧。2标准帧滤波，3是扩展帧滤波。
        Dim Timing0 As Byte
        Dim Timing1 As Byte
        Dim Mode As Byte '模式，0表示正常模式，1表示只听模式,2自测模式
    End Structure

    '函数声明
    '-----------------------------兼容ZLG的函数---------------------------------
    '返回值说明：=1操作成功，=0操作失败，=-1硬件错误（如设备未打开）

    '打开设备，入口参数DeviceType表示设备类型号；DeviceInd表示设备索引号（具体见接口函数库使用手册）；当设备为CAN232时Reserved表示打开串口的波特率，当为其他设备时参数无意义
    Declare Function VCI_OpenDevice Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal Reserved As Integer) As Integer
    '关闭设备
    Declare Function VCI_CloseDevice Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer) As Integer
    '初始化指定的CAN
    Declare Function VCI_InitCAN Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByRef InitConfig As VCI_INIT_CONFIG) As Integer
    '获取设备信息
    Declare Function VCI_ReadBoardInfo Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByRef info As VCI_BOARD_INFO) As Integer
    '获取最后一次错误信息
    Declare Function VCI_ReadErrInfo Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByRef ErrInfo As VCI_ERR_INFO) As Integer
    '获取CAN状态
    Declare Function VCI_ReadCANStatus Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByRef CANStatus As VCI_CAN_STATUS) As Integer
    '获取设备的相应参数
    Declare Function VCI_GetReference Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByVal RefType As Integer, ByRef data As Long) As Integer
    '设置设备的相应参数，主要处理不同设备的特定操作
    Declare Function VCI_SetReference Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByVal RefType As Integer, ByRef data As Long) As Integer
    '获取指定接收缓冲区中接收到但尚未被读取得帧数
    Declare Function VCI_GetReceiveNum Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer) As Integer
    '清空指定缓冲区
    Declare Function VCI_ClearBuffer Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer) As Integer
    '启动CAN
    Declare Function VCI_StartCAN Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer) As Integer
    '复位CAN
    Declare Function VCI_ResetCAN Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer) As Integer
    '向指定的的设备发送数据
    Declare Function VCI_Transmit Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByRef Sendbuf As VCI_CAN_OBJ, ByVal length As Integer) As Integer
    '从指定的设备读取数据
    Declare Function VCI_Receive Lib "ControlCAN.dll" (ByVal DeviceType As Integer, ByVal DeviceInd As Integer, ByVal CANInd As Integer, ByRef Receive As VCI_CAN_OBJ, ByVal length As Integer, ByVal WaitTime As Integer) As Integer


    '-------------------------------其他函数及数据结构描述---------------------------------
    'USB-CAN总线适配器板卡信息的数据类型1，该数据结构在VCI_FindUsbDevice中引用

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

    '定义常规参数类型
    Public Structure VCI_REF_NORMAL
        Dim Mode As Byte '工作模式
        Dim Filter_Renamed As Byte '滤波方式
        Dim AccCode As Integer '接收滤波验收码
        Dim AccMask As Integer '接收滤波屏蔽码
        Dim kBaudRate As Byte '波特率索引号，0-SelfDefine,1-5Kbps(未用),2-18依次为：10kbps,20kbps,40kbps,50kbps,80kbps,100kbps,125kbps,200kbps,250kbps,400kbps,500kbps,666kbps,800kbps,1000kbps,33.33kbps,66.66kbps,83.33kbps
        Dim Timing0 As Byte
        Dim Timing1 As Byte
        Dim CANRX_EN As Byte '保留，未用
        Dim UARTBAUD As Byte '保留，未用
    End Structure

    '定义波特率设置参数类型
    Public Structure VCI_BAUD_TYPE
        Dim Baud As Integer '存储波特率实际值
        Dim SJW As Byte '同步跳转宽度，取值1-4
        Dim BRP As Byte '预分频值，取值1-64
        Dim SAM As Byte '采样点，取值0=采样一次，1=采样三次
        Dim PHSEG2_SEL As Byte '相位缓冲段2选择位，取值0=由相位缓冲段1时间决定,1=可编程
        Dim PRSEG As Byte '传播时间段，取值1-8
        Dim PHSEG1 As Byte '相位缓冲段1，取值1-8
        Dim PHSEG2 As Byte '相位缓冲段2，取值1-8
    End Structure

    '定义Reference参数类型
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