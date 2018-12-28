VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "USB_CAN Demo(创芯光电科技有限公司)"
   ClientHeight    =   6480
   ClientLeft      =   7155
   ClientTop       =   2280
   ClientWidth     =   7245
   LinkTopic       =   "Form1"
   ScaleHeight     =   6480
   ScaleWidth      =   7245
   Begin VB.CommandButton Command4 
      Caption         =   "清空列表"
      Height          =   375
      Left            =   6000
      TabIndex        =   34
      Top             =   3360
      Width           =   975
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "Form1.frx":0000
      Left            =   3720
      List            =   "Form1.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   19
      Top             =   430
      Width           =   1185
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   4800
      TabIndex        =   18
      Text            =   "00000080"
      Top             =   2820
      Width           =   975
   End
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   6480
      Top             =   480
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   720
      TabIndex        =   15
      Text            =   "01 02 03 04 05 06 07 08 "
      Top             =   3360
      Width           =   1935
   End
   Begin VB.ComboBox Combo5 
      Height          =   315
      ItemData        =   "Form1.frx":001C
      Left            =   3000
      List            =   "Form1.frx":0026
      Style           =   2  'Dropdown List
      TabIndex        =   14
      Top             =   2805
      Width           =   1215
   End
   Begin VB.ComboBox Combo4 
      Height          =   315
      ItemData        =   "Form1.frx":003A
      Left            =   960
      List            =   "Form1.frx":0044
      Style           =   2  'Dropdown List
      TabIndex        =   13
      Top             =   2820
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "复位CAN"
      Height          =   330
      Left            =   6000
      TabIndex        =   12
      Top             =   3000
      Width           =   1005
   End
   Begin VB.CommandButton Command2 
      Caption         =   "启动CAN"
      Height          =   330
      Left            =   6000
      TabIndex        =   11
      Top             =   2640
      Width           =   1005
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Form1.frx":0058
      Left            =   1200
      List            =   "Form1.frx":0062
      Style           =   2  'Dropdown List
      TabIndex        =   10
      Top             =   420
      Width           =   1290
   End
   Begin VB.CommandButton Connect 
      Caption         =   "连接"
      Height          =   330
      Left            =   5400
      TabIndex        =   1
      Top             =   430
      Width           =   1005
   End
   Begin VB.Frame Frame1 
      Caption         =   " 发送数据帧 "
      Height          =   1230
      Left            =   120
      TabIndex        =   0
      Top             =   2520
      Width           =   5835
      Begin VB.CommandButton Command1 
         Caption         =   "发送"
         Height          =   330
         Left            =   4680
         TabIndex        =   6
         Top             =   720
         Width           =   870
      End
      Begin VB.Label Label3 
         Caption         =   "发送格式："
         Height          =   240
         Left            =   120
         TabIndex        =   33
         Top             =   360
         Width           =   960
      End
      Begin VB.Label Label7 
         Caption         =   "数据："
         Height          =   240
         Left            =   120
         TabIndex        =   5
         Top             =   840
         Width           =   555
      End
      Begin VB.Label Label6 
         Caption         =   "帧ID："
         Height          =   195
         Left            =   4200
         TabIndex        =   4
         Top             =   360
         Width           =   585
      End
      Begin VB.Label Label5 
         Caption         =   "帧格式："
         Height          =   195
         Left            =   2160
         TabIndex        =   3
         Top             =   360
         Width           =   765
      End
      Begin VB.Label Label4 
         Caption         =   "帧类型："
         Height          =   195
         Left            =   120
         TabIndex        =   2
         Top             =   360
         Width           =   810
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "设备参数"
      Height          =   2295
      Left            =   120
      TabIndex        =   7
      Top             =   120
      Width           =   6855
      Begin VB.Frame Frame3 
         Caption         =   "初始化CAN参数"
         Height          =   1335
         Left            =   120
         TabIndex        =   20
         Top             =   840
         Width           =   6615
         Begin VB.ComboBox Combo7 
            Height          =   315
            ItemData        =   "Form1.frx":0079
            Left            =   5280
            List            =   "Form1.frx":0086
            Style           =   2  'Dropdown List
            TabIndex        =   32
            Top             =   840
            Width           =   1215
         End
         Begin VB.ComboBox Combo6 
            Height          =   315
            ItemData        =   "Form1.frx":00A8
            Left            =   5280
            List            =   "Form1.frx":00B5
            Style           =   2  'Dropdown List
            TabIndex        =   30
            Top             =   360
            Width           =   1215
         End
         Begin VB.TextBox Text6 
            Height          =   285
            Left            =   3360
            TabIndex        =   28
            Text            =   "14"
            Top             =   840
            Width           =   855
         End
         Begin VB.TextBox Text5 
            Height          =   285
            Left            =   1200
            TabIndex        =   26
            Text            =   "00"
            Top             =   840
            Width           =   855
         End
         Begin VB.TextBox Text3 
            Height          =   285
            Left            =   3360
            TabIndex        =   24
            Text            =   "FFFFFFFF"
            Top             =   360
            Width           =   855
         End
         Begin VB.TextBox Text2 
            Height          =   285
            Left            =   1200
            TabIndex        =   22
            Text            =   "00000000"
            Top             =   360
            Width           =   855
         End
         Begin VB.Label Label13 
            Caption         =   "模式："
            Height          =   255
            Left            =   4680
            TabIndex        =   31
            Top             =   885
            Width           =   615
         End
         Begin VB.Label Label12 
            Caption         =   "滤波方式："
            Height          =   255
            Left            =   4320
            TabIndex        =   29
            Top             =   400
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "定时器1：0x"
            Height          =   255
            Left            =   2280
            TabIndex        =   27
            Top             =   840
            Width           =   975
         End
         Begin VB.Label Label8 
            Caption         =   "定时器0：0x"
            Height          =   255
            Left            =   120
            TabIndex        =   25
            Top             =   840
            Width           =   975
         End
         Begin VB.Label Label2 
            Caption         =   "屏蔽码：0x"
            Height          =   255
            Left            =   2400
            TabIndex        =   23
            Top             =   360
            Width           =   975
         End
         Begin VB.Label Label1 
            Caption         =   "验收码：0x"
            Height          =   255
            Left            =   240
            TabIndex        =   21
            Top             =   360
            Width           =   975
         End
      End
      Begin VB.Label Label10 
         Caption         =   "CAN通道："
         Height          =   255
         Left            =   2520
         TabIndex        =   9
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Label9 
         Caption         =   "设备类型："
         Height          =   255
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "信息"
      Height          =   2535
      Left            =   120
      TabIndex        =   16
      Top             =   3840
      Width           =   6975
      Begin VB.ListBox List1 
         Height          =   2040
         Left            =   120
         TabIndex        =   17
         Top             =   240
         Width           =   6735
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim m_devtype As Long
Dim m_connect As Byte
Dim m_cannum As Long
Dim m_bRun As Boolean
Public Function EnableUI(bEnable As Boolean)
    Label1.Enabled = bEnable
    Label2.Enabled = bEnable
    Label12.Enabled = bEnable
    Label8.Enabled = bEnable
    Label11.Enabled = bEnable
    Label13.Enabled = bEnable
    Text2.Enabled = bEnable
    Text3.Enabled = bEnable
    Text5.Enabled = bEnable
    Text6.Enabled = bEnable
    Combo1.Enabled = bEnable
    Combo2.Enabled = bEnable
    Combo6.Enabled = bEnable
    Combo7.Enabled = bEnable
End Function


Private Sub Command1_Click()
    If m_connect = 0 Then
        MsgBox ("请先打开端口")
        Exit Sub
    End If
    
    Dim SendType, frameformat, frametype As Byte
    Dim ID As Long
    Dim data(7) As Byte
    Dim frameinfo As VCI_CAN_OBJ
    Dim str, tmpstr As String
    
    SendType = 0
    frameformat = Combo5.ListIndex
    frametype = Combo4.ListIndex
    str = "&H"
    str = str + Text1.Text
    ID = Val(str)
    str = Text4.Text
    strdata = " "
    i = 0
    For i = 0 To 7
       strdata = Left(str, 2)
       If Len(strdata) = 0 Then
          Exit For
       End If
       str = Right(str, Len(str) - 3)
       data(i) = Val("&H" + strdata)
    Next
    
    frameinfo.DataLen = i
    frameinfo.ExternFlag = frametype
    frameinfo.RemoteFlag = frameformat
    frameinfo.ID = ID
    For j = 0 To i - 1
        frameinfo.data(j) = data(j)
    Next
    If VCI_Transmit(m_devtype, 0, m_cannum, frameinfo, 1) <> 1 Then
        MsgBox ("发送数据失败")
    Else
        str = "发送数据成功:  "
        tmpstr = "时间标识:无  "
        str = str + tmpstr
        tmpstr = "  帧ID:0x" + Hex(frameinfo.ID)
        str = str + tmpstr
        str = str + "  帧格式:"
        If frameinfo.RemoteFlag = 0 Then
            tmpstr = "数据帧 "
        Else
            tmpstr = "远程帧 "
        End If
        str = str + tmpstr
        str = str + "  帧类型:"
        If frameinfo.ExternFlag = 0 Then
            tmpstr = "标准帧 "
        Else
            tmpstr = "扩展帧 "
        End If
        str = str + tmpstr
        List1.AddItem str, List1.ListCount
        If frameinfo.RemoteFlag = 0 Then
            str = "  数据:"
            If frameinfo.DataLen > 8 Then
                frameinfo.DataLen = 8
            End If
            For j = 0 To frameinfo.DataLen - 1
                tmpstr = Hex(frameinfo.data(j)) + " "
                str = str + tmpstr
            Next
            List1.AddItem str, List1.ListCount
        End If
        List1.ListIndex = List1.ListCount - 1
    End If
    List1.ListIndex = List1.ListCount - 1
End Sub

Private Sub Command2_Click()
    If m_connect = 0 Then
        MsgBox ("请先打开端口")
        Exit Sub
    End If
    If VCI_StartCAN(m_devtype, 0, m_cannum) <> 1 Then
        MsgBox ("启动CAN错误")
    Else
        List1.AddItem "启动CAN成功", List1.ListCount
        Command1.Enabled = True
    End If
End Sub

Private Sub Command3_Click()
    If m_connect = 0 Then
        MsgBox ("请先打开端口")
        Exit Sub
    End If
    If VCI_ResetCAN(m_devtype, 0, m_cannum) <> 1 Then
        MsgBox ("复位CAN错误")
   Else
        List1.AddItem "复位CAN成功", List1.ListCount
        Command1.Enabled = False
    End If

End Sub

Private Sub Command4_Click()
    Dim i As Integer
    For i = 0 To List1.ListCount - 1
        List1.RemoveItem 0
    Next
        
End Sub


Private Sub Connect_Click()
    Dim cannum As Long
    Dim code, mask As Long
    Dim Timing0, Timing1, filtertype, Mode As Byte
    Dim InitConfig As VCI_INIT_CONFIG
    
    If m_connect = 1 Then
        m_connect = 0
        Connect.Caption = "连接"
        VCI_CloseDevice m_devtype, 0
        EnableUI True
        Exit Sub
    End If
        
    If Combo1.ListIndex <> -1 And Combo2.ListIndex <> -1 Then
        cannum = Combo2.ListIndex
        filtertype = Combo6.ListIndex + 1
        Mode = Combo7.ListIndex
        code = Val("&H" + Text2.Text)
        mask = Val("&H" + Text3.Text)
        Timing0 = Val("&H" + Text5.Text)
        Timing1 = Val("&H" + Text6.Text)
        InitConfig.AccCode = code
        InitConfig.AccMask = mask
        InitConfig.Filter = filtertype
        InitConfig.Mode = Mode
        InitConfig.Timing0 = Timing0
        InitConfig.Timing1 = Timing1
        If VCI_OpenDevice(m_devtype, 0, 0) <> 1 Then
            MsgBox ("打开设备错误")
        Else
            If VCI_InitCAN(m_devtype, 0, cannum, InitConfig) = 1 Then
                m_connect = 1
                m_cannum = cannum
                Connect.Caption = "断开"
            Else
                MsgBox ("初始化CAN错误")
            End If
        End If
    End If
    EnableUI False
    
End Sub


Private Sub Form_Activate()
    m_bRun = True
End Sub

Private Sub Form_Load()
    Me.Left = (Screen.Width - Me.Width) / 2
    Me.Top = (Screen.Height - Me.Height) / 2
    m_bRun = False
    m_devtype = 4 'USB_CAN2类型号
    m_connect = 0
    m_cannum = 0
    Combo1.ListIndex = 1
    Combo2.ListIndex = 0
    Combo4.ListIndex = 0
    Combo5.ListIndex = 0
    Combo6.ListIndex = 0
    Combo7.ListIndex = 0
    EnableUI True
    Command1.Enabled = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If m_connect = 1 Then
        m_connect = 0
        VCI_CloseDevice m_devtype, 0
    End If
End Sub
Private Sub Combo1_Click()
    If m_bRun = True Then
        m_devtype = Combo1.ListIndex + 3
        If m_devtype = 3 Then
            Combo2.RemoveItem 1
            m_cannum = 0
            Combo2.ListIndex = 0
        Else
            Combo2.AddItem "通道2"
        End If
    End If
End Sub

Private Sub Timer1_Timer()
    Timer1.Enabled = False
    Dim ErrInfo As VCI_ERR_INFO
    
    If m_connect = 0 Then
        Timer1.Enabled = True
        Exit Sub
    End If

    Dim Length As Long
    Dim frameinfo(49) As VCI_CAN_OBJ
    Dim str As String
    
    Length = VCI_Receive(m_devtype, 0, m_cannum, frameinfo(0), 50, 10)
    If Length <= 0 Then
        VCI_ReadErrInfo m_devtype, 0, m_cannum, ErrInfo '注意：如果没有读到数据则必须调用此函数来读取出当前的错误码，
                                                               '千万不能省略这一步（即使你可能不想知道错误码是什么）
        Timer1.Enabled = True
        Exit Sub
    End If
    
    For i = 0 To Length - 1
        str = "接收到数据帧:  "
        If frameinfo(i).TimeFlag = 0 Then
            tmpstr = "时间标识:无  "
        Else
            tmpstr = "时间标识:0x" + Hex(frameinfo(i).TimeStamp)
        End If
        str = str + tmpstr
        tmpstr = "  帧ID:0x" + Hex(frameinfo(i).ID)
        str = str + tmpstr
        str = str + "  帧格式:"
        If frameinfo(i).RemoteFlag = 0 Then
            tmpstr = "数据帧 "
        Else
            tmpstr = "远程帧 "
        End If
        str = str + tmpstr
        str = str + "  帧类型:"
        If frameinfo(i).ExternFlag = 0 Then
            tmpstr = "标准帧 "
        Else
            tmpstr = "扩展帧 "
        End If
        str = str + tmpstr
        List1.AddItem str, List1.ListCount
        If frameinfo(i).RemoteFlag = 0 Then
            str = "  数据:"
            If frameinfo(i).DataLen > 8 Then
                frameinfo(i).DataLen = 8
            End If
            For j = 0 To frameinfo(i).DataLen - 1
                tmpstr = Hex(frameinfo(i).data(j)) + " "
                str = str + tmpstr
            Next
            List1.AddItem str, List1.ListCount
        End If
        List1.ListIndex = List1.ListCount - 1
    Next
    Timer1.Enabled = True
End Sub
