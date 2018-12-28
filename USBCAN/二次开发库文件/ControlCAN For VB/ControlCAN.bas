Attribute VB_Name = "ControlCAN"
'设备类型说明：
'USB_CAN:3    ---- 单通道USB-CAN适配器
'USB_CAN2:4   ---- 双通道USB-CAN适配器

'------------------兼容ZLG的函数及数据类型-----------------------
'定义需要用到的数据结构
'USB-CAN总线适配器板卡信息的数据类型。
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

'定义CAN信息帧的数据类型。
Public Type VCI_CAN_OBJ
    ID As Long
    TimeStamp As Long                            '时间标识
    TimeFlag As Byte         '是否使用时间标识
    SendType As Byte         '发送标志。保留，未用
    RemoteFlag As Byte       '是否是远程帧
    ExternFlag As Byte       '是否是扩展帧
    DataLen As Byte
    data(7) As Byte
    reserved(2) As Byte
End Type

'定义CAN控制器状态的数据类型。
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

'定义错误信息的数据类型。
Public Type VCI_ERR_INFO
    ErrCode As Long
    Passive_ErrData(2) As Byte
    ArLost_ErrData As Byte
End Type

'定义初始化CAN的数据类型
Public Type VCI_INIT_CONFIG
    AccCode As Long
    AccMask As Long
    InitFlag As Long
    Filter As Byte              '0,1接收所有帧。2标准帧滤波，3是扩展帧滤波。
    Timing0 As Byte
    Timing1 As Byte
    Mode As Byte                        '模式，0表示正常模式，1表示只听模式,2自测模式
End Type


'函数声明
'-----------------------------兼容ZLG的函数---------------------------------
'返回值说明：=1操作成功，=0操作失败，=-1硬件错误（如设备未打开）
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
'返回值为实际发送帧数，若返回-1，表示设备错误
Declare Function VCI_Transmit Lib "ControlCAN.dll" (ByVal DevType As Long, ByVal DevIndex As Long, ByVal CANIndex As Long, ByRef pSend As VCI_CAN_OBJ, ByVal Length As Long) As Long

'-------------------------------其他函数及数据结构描述---------------------------------
'USB-CAN总线适配器板卡信息的数据类型1，该数据结构在VCI_FindUsbDevice中引用
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

'定义常规参数类型
Public Type VCI_REF_NORMAL
                Mode As Byte                    '工作模式
                Filter As Byte          '滤波方式
                AccCode As Long         '接收滤波验收码
                AccMask As Long         '接收滤波屏蔽码
                kBaudRate As Byte       '波特率索引号，0-SelfDefine,1-5Kbps(未用),2-18依次为：10kbps,20kbps,40kbps,50kbps,80kbps,100kbps,125kbps,200kbps,250kbps,400kbps,500kbps,666kbps,800kbps,1000kbps,33.33kbps,66.66kbps,83.33kbps
                Timing0 As Byte
                Timing1 As Byte
                CANRX_EN As Byte        '保留，未用
                UARTBAUD As Byte        '保留，未用
End Type

'定义波特率设置参数类型
Public Type VCI_BAUD_TYPE
                Baud As Long                                    '存储波特率实际值
                SJW As Byte           '同步跳转宽度，取值1-4
                BRP As Byte           '预分频值，取值1-64
                SAM As Byte           '采样点，取值0=采样一次，1=采样三次
                PHSEG2_SEL As Byte    '相位缓冲段2选择位，取值0=由相位缓冲段1时间决定,1=可编程
                PRSEG As Byte         '传播时间段，取值1-8
                PHSEG1 As Byte        '相位缓冲段1，取值1-8
                PHSEG2 As Byte        '相位缓冲段2，取值1-8
End Type

'定义Reference参数类型
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

'文件结束
