Option Strict Off
Option Explicit On 
Imports VB = Microsoft.VisualBasic

Public Class Form1
    Inherits System.Windows.Forms.Form

#Region " Windows ������������ɵĴ��� "

    Public Sub New()
        MyBase.New()

        '�õ����� Windows ���������������ġ�
        InitializeComponent()

        '�� InitializeComponent() ����֮������κγ�ʼ��

    End Sub

    '������д dispose ����������б�
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Windows ����������������
    Private components As System.ComponentModel.IContainer

    'ע��: ���¹����� Windows ����������������
    '����ʹ�� Windows ����������޸Ĵ˹��̡�
    '��Ҫʹ�ô���༭���޸�����
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents butSend As System.Windows.Forms.Button
    Friend WithEvents cboMode As System.Windows.Forms.ComboBox
    Friend WithEvents txtTimer1 As System.Windows.Forms.TextBox
    Friend WithEvents txtTimer0 As System.Windows.Forms.TextBox
    Friend WithEvents cboFilterMode As System.Windows.Forms.ComboBox
    Friend WithEvents txtScreenCode As System.Windows.Forms.TextBox
    Friend WithEvents txtCheckCode As System.Windows.Forms.TextBox
    Friend WithEvents cboCANNum As System.Windows.Forms.ComboBox
    Friend WithEvents txtFrameID As System.Windows.Forms.TextBox
    Friend WithEvents cboFrameFormat As System.Windows.Forms.ComboBox
    Friend WithEvents cboFrameType As System.Windows.Forms.ComboBox
    Friend WithEvents txtDate As System.Windows.Forms.TextBox
    Friend WithEvents butStartUp As System.Windows.Forms.Button
    Friend WithEvents butReplacement As System.Windows.Forms.Button
    Friend WithEvents lstInfo As System.Windows.Forms.ListBox
    Friend WithEvents tmrRead As System.Windows.Forms.Timer
    Friend WithEvents cboDevtype As System.Windows.Forms.ComboBox
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents butConnect As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.butConnect = New System.Windows.Forms.Button
        Me.cboDevtype = New System.Windows.Forms.ComboBox
        Me.Label14 = New System.Windows.Forms.Label
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.cboMode = New System.Windows.Forms.ComboBox
        Me.Label8 = New System.Windows.Forms.Label
        Me.txtTimer1 = New System.Windows.Forms.TextBox
        Me.Label7 = New System.Windows.Forms.Label
        Me.txtTimer0 = New System.Windows.Forms.TextBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.cboFilterMode = New System.Windows.Forms.ComboBox
        Me.Label5 = New System.Windows.Forms.Label
        Me.txtScreenCode = New System.Windows.Forms.TextBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.txtCheckCode = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.cboCANNum = New System.Windows.Forms.ComboBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.butSend = New System.Windows.Forms.Button
        Me.txtFrameID = New System.Windows.Forms.TextBox
        Me.Label13 = New System.Windows.Forms.Label
        Me.cboFrameFormat = New System.Windows.Forms.ComboBox
        Me.Label12 = New System.Windows.Forms.Label
        Me.cboFrameType = New System.Windows.Forms.ComboBox
        Me.Label11 = New System.Windows.Forms.Label
        Me.txtDate = New System.Windows.Forms.TextBox
        Me.Label10 = New System.Windows.Forms.Label
        Me.butStartUp = New System.Windows.Forms.Button
        Me.butReplacement = New System.Windows.Forms.Button
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.lstInfo = New System.Windows.Forms.ListBox
        Me.tmrRead = New System.Windows.Forms.Timer(Me.components)
        Me.Button1 = New System.Windows.Forms.Button
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.butConnect)
        Me.GroupBox1.Controls.Add(Me.cboDevtype)
        Me.GroupBox1.Controls.Add(Me.Label14)
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Controls.Add(Me.cboCANNum)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Location = New System.Drawing.Point(8, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(480, 144)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "�豸����"
        '
        'butConnect
        '
        Me.butConnect.Location = New System.Drawing.Point(384, 17)
        Me.butConnect.Name = "butConnect"
        Me.butConnect.Size = New System.Drawing.Size(64, 24)
        Me.butConnect.TabIndex = 5
        Me.butConnect.Text = "�����豸"
        '
        'cboDevtype
        '
        Me.cboDevtype.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cboDevtype.Items.AddRange(New Object() {"3", "4"})
        Me.cboDevtype.Location = New System.Drawing.Point(62, 22)
        Me.cboDevtype.MaxDropDownItems = 15
        Me.cboDevtype.Name = "cboDevtype"
        Me.cboDevtype.Size = New System.Drawing.Size(137, 20)
        Me.cboDevtype.TabIndex = 7
        '
        'Label14
        '
        Me.Label14.Location = New System.Drawing.Point(4, 24)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(52, 16)
        Me.Label14.TabIndex = 6
        Me.Label14.Text = "���ͺ�:"
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.cboMode)
        Me.GroupBox2.Controls.Add(Me.Label8)
        Me.GroupBox2.Controls.Add(Me.txtTimer1)
        Me.GroupBox2.Controls.Add(Me.Label7)
        Me.GroupBox2.Controls.Add(Me.txtTimer0)
        Me.GroupBox2.Controls.Add(Me.Label6)
        Me.GroupBox2.Controls.Add(Me.cboFilterMode)
        Me.GroupBox2.Controls.Add(Me.Label5)
        Me.GroupBox2.Controls.Add(Me.txtScreenCode)
        Me.GroupBox2.Controls.Add(Me.Label4)
        Me.GroupBox2.Controls.Add(Me.txtCheckCode)
        Me.GroupBox2.Controls.Add(Me.Label3)
        Me.GroupBox2.Location = New System.Drawing.Point(8, 56)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(464, 80)
        Me.GroupBox2.TabIndex = 5
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "��ʼ��CAN����"
        '
        'cboMode
        '
        Me.cboMode.Location = New System.Drawing.Point(376, 48)
        Me.cboMode.Name = "cboMode"
        Me.cboMode.Size = New System.Drawing.Size(80, 20)
        Me.cboMode.TabIndex = 11
        '
        'Label8
        '
        Me.Label8.Location = New System.Drawing.Point(336, 50)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(48, 16)
        Me.Label8.TabIndex = 10
        Me.Label8.Text = "ģʽ��"
        '
        'txtTimer1
        '
        Me.txtTimer1.Location = New System.Drawing.Point(233, 47)
        Me.txtTimer1.Name = "txtTimer1"
        Me.txtTimer1.Size = New System.Drawing.Size(63, 21)
        Me.txtTimer1.TabIndex = 9
        Me.txtTimer1.Text = "14"
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(158, 50)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(73, 16)
        Me.Label7.TabIndex = 8
        Me.Label7.Text = "��ʱ��1��0x"
        '
        'txtTimer0
        '
        Me.txtTimer0.Location = New System.Drawing.Point(88, 48)
        Me.txtTimer0.Name = "txtTimer0"
        Me.txtTimer0.Size = New System.Drawing.Size(56, 21)
        Me.txtTimer0.TabIndex = 7
        Me.txtTimer0.Text = "00"
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(10, 48)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(80, 16)
        Me.Label6.TabIndex = 6
        Me.Label6.Text = "��ʱ��0��0x"
        '
        'cboFilterMode
        '
        Me.cboFilterMode.Location = New System.Drawing.Point(376, 17)
        Me.cboFilterMode.Name = "cboFilterMode"
        Me.cboFilterMode.Size = New System.Drawing.Size(80, 20)
        Me.cboFilterMode.TabIndex = 5
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(312, 20)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(72, 16)
        Me.Label5.TabIndex = 4
        Me.Label5.Text = "�˲���ʽ��"
        '
        'txtScreenCode
        '
        Me.txtScreenCode.Location = New System.Drawing.Point(233, 16)
        Me.txtScreenCode.Name = "txtScreenCode"
        Me.txtScreenCode.Size = New System.Drawing.Size(64, 21)
        Me.txtScreenCode.TabIndex = 3
        Me.txtScreenCode.Text = "FFFFFFFF"
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(164, 19)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(68, 16)
        Me.Label4.TabIndex = 2
        Me.Label4.Text = "�����룺0x"
        '
        'txtCheckCode
        '
        Me.txtCheckCode.Location = New System.Drawing.Point(88, 14)
        Me.txtCheckCode.Name = "txtCheckCode"
        Me.txtCheckCode.Size = New System.Drawing.Size(56, 21)
        Me.txtCheckCode.TabIndex = 1
        Me.txtCheckCode.Text = "00000000"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(16, 17)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(72, 16)
        Me.Label3.TabIndex = 0
        Me.Label3.Text = "�����룺0x"
        '
        'cboCANNum
        '
        Me.cboCANNum.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cboCANNum.Location = New System.Drawing.Point(287, 22)
        Me.cboCANNum.Name = "cboCANNum"
        Me.cboCANNum.Size = New System.Drawing.Size(59, 20)
        Me.cboCANNum.TabIndex = 3
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(215, 26)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(72, 15)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "�ڼ�·CAN:"
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.butSend)
        Me.GroupBox3.Controls.Add(Me.txtFrameID)
        Me.GroupBox3.Controls.Add(Me.Label13)
        Me.GroupBox3.Controls.Add(Me.cboFrameFormat)
        Me.GroupBox3.Controls.Add(Me.Label12)
        Me.GroupBox3.Controls.Add(Me.cboFrameType)
        Me.GroupBox3.Controls.Add(Me.Label11)
        Me.GroupBox3.Controls.Add(Me.txtDate)
        Me.GroupBox3.Controls.Add(Me.Label10)
        Me.GroupBox3.Location = New System.Drawing.Point(8, 158)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(403, 82)
        Me.GroupBox3.TabIndex = 1
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "��������֡"
        '
        'butSend
        '
        Me.butSend.Location = New System.Drawing.Point(336, 48)
        Me.butSend.Name = "butSend"
        Me.butSend.Size = New System.Drawing.Size(56, 24)
        Me.butSend.TabIndex = 10
        Me.butSend.Text = "����"
        '
        'txtFrameID
        '
        Me.txtFrameID.Location = New System.Drawing.Point(327, 21)
        Me.txtFrameID.Name = "txtFrameID"
        Me.txtFrameID.Size = New System.Drawing.Size(65, 21)
        Me.txtFrameID.TabIndex = 9
        Me.txtFrameID.Text = "00000080"
        '
        'Label13
        '
        Me.Label13.Location = New System.Drawing.Point(285, 25)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(48, 16)
        Me.Label13.TabIndex = 8
        Me.Label13.Text = "֡ID��"
        '
        'cboFrameFormat
        '
        Me.cboFrameFormat.Location = New System.Drawing.Point(210, 21)
        Me.cboFrameFormat.Name = "cboFrameFormat"
        Me.cboFrameFormat.Size = New System.Drawing.Size(64, 20)
        Me.cboFrameFormat.TabIndex = 7
        '
        'Label12
        '
        Me.Label12.Location = New System.Drawing.Point(158, 25)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(64, 16)
        Me.Label12.TabIndex = 6
        Me.Label12.Text = "֡��ʽ��"
        '
        'cboFrameType
        '
        Me.cboFrameType.Location = New System.Drawing.Point(81, 21)
        Me.cboFrameType.Name = "cboFrameType"
        Me.cboFrameType.Size = New System.Drawing.Size(72, 20)
        Me.cboFrameType.TabIndex = 5
        '
        'Label11
        '
        Me.Label11.Location = New System.Drawing.Point(29, 26)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(64, 16)
        Me.Label11.TabIndex = 4
        Me.Label11.Text = "֡���ͣ�"
        '
        'txtDate
        '
        Me.txtDate.Location = New System.Drawing.Point(72, 48)
        Me.txtDate.Name = "txtDate"
        Me.txtDate.Size = New System.Drawing.Size(168, 21)
        Me.txtDate.TabIndex = 3
        Me.txtDate.Text = "01 02 03 04 05 06 07 08 "
        '
        'Label10
        '
        Me.Label10.Location = New System.Drawing.Point(31, 48)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(48, 16)
        Me.Label10.TabIndex = 2
        Me.Label10.Text = "���ݣ�"
        '
        'butStartUp
        '
        Me.butStartUp.Location = New System.Drawing.Point(424, 162)
        Me.butStartUp.Name = "butStartUp"
        Me.butStartUp.Size = New System.Drawing.Size(64, 24)
        Me.butStartUp.TabIndex = 2
        Me.butStartUp.Text = "����CAN"
        '
        'butReplacement
        '
        Me.butReplacement.Location = New System.Drawing.Point(424, 190)
        Me.butReplacement.Name = "butReplacement"
        Me.butReplacement.Size = New System.Drawing.Size(64, 24)
        Me.butReplacement.TabIndex = 3
        Me.butReplacement.Text = "��λCAN"
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.lstInfo)
        Me.GroupBox4.Location = New System.Drawing.Point(8, 248)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(480, 160)
        Me.GroupBox4.TabIndex = 4
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "��Ϣ"
        '
        'lstInfo
        '
        Me.lstInfo.ItemHeight = 12
        Me.lstInfo.Location = New System.Drawing.Point(8, 17)
        Me.lstInfo.Name = "lstInfo"
        Me.lstInfo.Size = New System.Drawing.Size(464, 124)
        Me.lstInfo.TabIndex = 0
        '
        'tmrRead
        '
        Me.tmrRead.Enabled = True
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(424, 220)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(64, 24)
        Me.Button1.TabIndex = 5
        Me.Button1.Text = "����б�"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(6, 14)
        Me.ClientSize = New System.Drawing.Size(497, 413)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.butReplacement)
        Me.Controls.Add(Me.butStartUp)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox1)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form1"
        Me.Text = "USB_CAN Demo(��о���Ƽ����޹�˾)"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.GroupBox4.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    Dim m_devtype As Integer
    Dim m_connect As Byte
    Dim m_devind As Integer
    Dim m_cannum As Integer
    Dim SendType, frameformat As Object
    Dim frametype As Byte
    Dim ID As Integer
    Dim data(7) As Byte
    'Dim frameinfo(49) As VCI_CAN_OBJ
    Dim m_arrdevtype(20) As Int32

    Public Function EnableUI(ByRef bEnable As Boolean) As Object
        cboDevtype.Enabled = bEnable
        cboCANNum.Enabled = bEnable
        Label3.Enabled = bEnable
        txtCheckCode.Enabled = bEnable
        Label4.Enabled = bEnable
        txtScreenCode.Enabled = bEnable
        Label5.Enabled = bEnable
        cboFilterMode.Enabled = bEnable
        Label6.Enabled = bEnable
        txtTimer0.Enabled = bEnable
        Label7.Enabled = bEnable
        txtTimer1.Enabled = bEnable
        Label8.Enabled = bEnable
        cboMode.Enabled = bEnable

    End Function


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        m_connect = 0
        m_cannum = 0

        cboCANNum.Items.Add(0)
        cboCANNum.Items.Add(1)

        cboFilterMode.Items.Add("������������")
        cboFilterMode.Items.Add("ֻ���ձ�׼֡")
        cboFilterMode.Items.Add("ֻ������չ֡")

        cboMode.Items.Add("����ģʽ")
        cboMode.Items.Add("ֻ��ģʽ")
        cboMode.Items.Add("�Բ�ģʽ")

        cboFrameType.Items.Add("��׼֡")
        cboFrameType.Items.Add("��չ֡")

        cboFrameFormat.Items.Add("����֡")
        cboFrameFormat.Items.Add("Զ��֡")
        'tmrRead.Enabled = False
        cboCANNum.SelectedIndex = 0
        cboFrameType.SelectedIndex = 0
        cboFrameFormat.SelectedIndex = 0
        cboFilterMode.SelectedIndex = 0
        cboMode.SelectedIndex = 2

        Dim curindex As Int32 = 0
        cboDevtype.Items.Clear()

        curindex = cboDevtype.Items.Add("USB_CAN")
        curindex = cboDevtype.Items.Add("USB_CAN2")

        cboDevtype.SelectedIndex = 1 'Ĭ��Ӳ���� USBCAN2=index+3=4
        cboDevtype.MaxDropDownItems = cboDevtype.Items.Count

    End Sub

    Private Sub butStartUp_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles butStartUp.Click
        If m_connect = 0 Then
            MsgBox("���ȴ򿪶˿�")
            Exit Sub
        End If
        If VCI_StartCAN(m_devtype, m_devind, m_cannum) <> 1 Then
            MsgBox("����CAN����")
        Else
            lstInfo.Items.Add("����CAN�ɹ�")
            lstInfo.SelectedIndex = lstInfo.Items.Count - 1
        End If

    End Sub

    Private Sub butReplacement_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles butReplacement.Click
        If m_connect = 0 Then
            MsgBox("���ȴ򿪶˿�")
            Exit Sub
        End If
        If VCI_ResetCAN(m_devtype, m_devind, m_cannum) <> 1 Then
            MsgBox("��λCAN����")
        Else
            lstInfo.Items.Add("��λCAN�ɹ�")
            lstInfo.SelectedIndex = lstInfo.Items.Count - 1
        End If

    End Sub

    Private Sub butSend_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles butSend.Click
        Dim i As Object
        Dim strdata As Object

        If m_connect = 0 Then
            MsgBox("���ȴ򿪶˿�")
            Exit Sub
        End If
        Dim frameinfo(0) As VCI_CAN_OBJ

        Dim str As String
        frameformat = cboFrameFormat.SelectedIndex
        frametype = cboFrameType.SelectedIndex
        str = "&H"
        str = str + txtFrameID.Text
        ID = Val(str)
        str = txtDate.Text
        strdata = " "
        i = 0
        For i = 0 To 7
            strdata = VB.Left(str, 2)
            If Len(strdata) = 0 Then
                Exit For
            End If
            str = VB.Right(str, Len(str) - 3)
            data(i) = Val("&H" + strdata)
        Next

        frameinfo(0).DataLen = i
        frameinfo(0).ExternFlag = frametype
        frameinfo(0).RemoteFlag = frameformat
        frameinfo(0).SendType = SendType
        frameinfo(0).ID = ID

        frameinfo(0).data0 = data(0)
        frameinfo(0).data1 = data(1)
        frameinfo(0).data2 = data(2)
        frameinfo(0).data3 = data(3)
        frameinfo(0).data4 = data(4)
        frameinfo(0).data5 = data(5)
        frameinfo(0).data6 = data(6)
        frameinfo(0).data7 = data(7)


        If VCI_Transmit(m_devtype, m_devind, m_cannum, frameinfo(0), 1) <> 1 Then
            MsgBox("��������ʧ��")
        Else
            lstInfo.Items.Add("�������ݳɹ�")
        End If
        lstInfo.SelectedIndex = lstInfo.Items.Count - 1
    End Sub

    Private Sub tmrRead_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tmrRead.Tick
        tmrRead.Enabled = False
        Dim j As Object
        Dim tmpstr As Object
        Dim i As Object
        Dim ErrInfo(0) As VCI_ERR_INFO
        Dim data(7) As Byte
        If m_connect = 0 Then
            tmrRead.Enabled = True
            Exit Sub
        End If
        Dim length As Long
        Dim SendFrame(49) As VCI_CAN_OBJ        '�������鳤��50

        Dim str As String
        length = VCI_GetReceiveNum(m_devtype, m_devind, m_cannum)
        If length <= 0 Then
            'VCI_ReadErrInfo(m_devtype, m_devind, m_cannum, ErrInfo(0)) 'ע�⣺���û�ж��������������ô˺�������ȡ����ǰ�Ĵ����룬

            tmrRead.Enabled = True
            Exit Sub
        End If

        length = VCI_Receive(m_devtype, m_devind, m_cannum, SendFrame(0), 50, 10)
        For i = 0 To length - 1
            str = "���յ�����֡:  "
            If SendFrame(i).TimeFlag = 0 Then
                tmpstr = "ʱ���ʶ:��  "
            Else
                tmpstr = "ʱ���ʶ:0x" + Hex(SendFrame(i).TimeStamp)
            End If
            str = str + tmpstr
            tmpstr = "  ֡ID:0x" + Hex(SendFrame(i).ID)
            str = str + tmpstr
            str = str + "  ֡��ʽ:"
            If SendFrame(i).RemoteFlag = 0 Then
                tmpstr = "����֡ "
            Else
                tmpstr = "Զ��֡ "
            End If
            str = str + tmpstr
            str = str + "  ֡����:"
            If SendFrame(i).ExternFlag = 0 Then
                tmpstr = "��׼֡ "
            Else
                tmpstr = "��չ֡ "
            End If
            str = str + tmpstr
            lstInfo.Items.Add(str)
            lstInfo.SelectedIndex = lstInfo.Items.Count - 1
            If SendFrame(i).RemoteFlag = 0 Then
                str = "  ����:"
                If SendFrame(i).DataLen > 8 Then
                    SendFrame(i).DataLen = 8
                End If
                data(0) = SendFrame(i).data0
                data(1) = SendFrame(i).data1
                data(2) = SendFrame(i).data2
                data(3) = SendFrame(i).data3
                data(4) = SendFrame(i).data4
                data(5) = SendFrame(i).data5
                data(6) = SendFrame(i).data6
                data(7) = SendFrame(i).data7
                For j = 0 To SendFrame(i).DataLen - 1
                    tmpstr = Hex(data(j)) + " "
                    str = str + tmpstr
                Next
                lstInfo.Items.Add(str)
                lstInfo.SelectedIndex = lstInfo.Items.Count - 1
            End If
        Next
        tmrRead.Enabled = True
    End Sub

    Private Sub butConnect_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles butConnect.Click
        Dim cannum As Integer
        Dim code As Object
        Dim mask As Integer
        Dim Timing0, Timing1, filtertype As Object
        Dim Mode As Byte
        Dim InitConfig As VCI_INIT_CONFIG

        If m_connect = 1 Then
            m_connect = 0
            butConnect.Text = "�����豸"
            VCI_CloseDevice(m_devtype, m_devind)
            EnableUI(True)
            Exit Sub
        End If
        m_devtype = m_arrdevtype(cboDevtype.SelectedIndex) + 3

        cannum = cboCANNum.SelectedIndex
        filtertype = cboFilterMode.SelectedIndex
        Mode = cboMode.SelectedIndex
        code = Val("&H" + txtCheckCode.Text)
        mask = Val("&H" + txtScreenCode.Text)
        Timing0 = Val("&H" + txtTimer0.Text)
        Timing1 = Val("&H" + txtTimer1.Text)
        InitConfig.AccCode = code
        InitConfig.AccMask = mask
        InitConfig.Filter_Renamed = filtertype
        InitConfig.Mode = Mode
        InitConfig.Timing0 = Timing0
        InitConfig.Timing1 = Timing1

        If VCI_OpenDevice(m_devtype, 0, 0) <> 1 Then  'ǿ�ƴ򿪼�����еĵ�һ��USBCAN�豸��index=0
            MsgBox("���豸����")
        Else
            If VCI_InitCAN(m_devtype, 0, cannum, InitConfig) = 1 Then
                m_connect = 1
                m_devind = 0
                m_cannum = cannum
                butConnect.Text = "�Ͽ��豸"
                EnableUI(False)
            Else
                MsgBox("��ʼ��CAN����")
            End If
        End If

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim i As Short
        For i = 0 To lstInfo.Items.Count - 1
            lstInfo.Items.RemoveAt(0)
        Next

    End Sub
End Class
