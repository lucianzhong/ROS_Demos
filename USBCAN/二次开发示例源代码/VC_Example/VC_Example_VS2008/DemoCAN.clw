; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CDemoCANDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "DemoCAN.h"

ClassCount=3
Class1=CDemoCANApp
Class2=CDemoCANDlg
Class3=CAboutDlg

ResourceCount=3
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Resource3=IDD_DEMOCAN_DIALOG

[CLS:CDemoCANApp]
Type=0
HeaderFile=DemoCAN.h
ImplementationFile=DemoCAN.cpp
Filter=N

[CLS:CDemoCANDlg]
Type=0
HeaderFile=DemoCANDlg.h
ImplementationFile=DemoCANDlg.cpp
Filter=D
BaseClass=CDialog
VirtualFilter=dWC
LastObject=IDC_COMBO_SENDFRAMETYPE

[CLS:CAboutDlg]
Type=0
HeaderFile=DemoCANDlg.h
ImplementationFile=DemoCANDlg.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[DLG:IDD_DEMOCAN_DIALOG]
Type=1
Class=CDemoCANDlg
ControlCount=23
Control1=IDC_STATIC,button,1342177287
Control2=IDC_STATIC,static,1342308352
Control3=IDC_COMBO_SENDFRAMETYPE,combobox,1344339971
Control4=IDC_COMBO_SENDFRAMEFORMAT,combobox,1344339971
Control5=IDC_STATIC,static,1342308352
Control6=IDC_EDIT_SEND_ID,edit,1484849280
Control7=IDC_STATIC,static,1342308352
Control8=IDC_EDIT_SEND_DATA,edit,1350631552
Control9=IDC_BUTTON_SEND,button,1342242816
Control10=IDC_STATIC,button,1342177287
Control11=IDC_STATIC,static,1342308352
Control12=IDC_RADIO_ID_FORMAT,button,1476526089
Control13=IDC_RADIO_ID_FORMAT2,button,1342177289
Control14=IDC_CHECK_CANRX_EN,button,1342242819
Control15=IDC_BUTTON_CLEAR,button,1342242816
Control16=IDC_LIST1,SysListView32,1350631425
Control17=IDC_STATIC,static,1342308352
Control18=IDC_COMBO_CAN_INDEX,combobox,1344339971
Control19=IDC_BUTTON_OPEN_DEVICE,button,1342242816
Control20=IDC_BUTTON_CLOSE_DEVICE,button,1342242816
Control21=IDC_STATIC,static,1342308352
Control22=IDC_STATIC,static,1342308352
Control23=IDC_COMBO_DEVTYPE,combobox,1344339971

