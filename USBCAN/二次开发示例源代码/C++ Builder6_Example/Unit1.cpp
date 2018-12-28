//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;


/*
�����Ǿ���ĵ��ö�̬������������õ��Ƕ�̬���صķ�������Ҫ�����ڳ����ʼ����
ʱ��Ӷ�̬����ȡ�ø��������ĵ�ַ������������Ȼ������Ҫ��ʱ����þͿ����ˣ������
�����˳���ʱ���ͷŵ��򿪵Ķ�̬�������С�
*/

/*---------------------------����ZLG�ļ���������------------------------------*/
//���ȶ�����Ҫ�õ������ݽṹ
//USB-CAN�����������忨��Ϣ���������͡�
typedef  struct  _VCI_BOARD_INFO{
		USHORT	hw_Version;
		USHORT	fw_Version;
		USHORT	dr_Version;
		USHORT	in_Version;
		USHORT	irq_Num;
		BYTE	can_Num;
		CHAR	str_Serial_Num[20];
		CHAR	str_hw_Type[40];
		USHORT	Reserved[4];
} VCI_BOARD_INFO,*PVCI_BOARD_INFO;

//����CAN��Ϣ֡���������͡�
typedef  struct  _VCI_CAN_OBJ{
	UINT	ID;
	UINT	TimeStamp;	 		 //ʱ���ʶ
	BYTE	TimeFlag;			 //�Ƿ�ʹ��ʱ���ʶ
	BYTE	SendType;			 //���ͱ�־��������δ��
	BYTE	RemoteFlag;			 //�Ƿ���Զ��֡
	BYTE	ExternFlag;			 //�Ƿ�����չ֡
	BYTE	DataLen;
	BYTE	Data[8];
	BYTE	Reserved[3];			//����
}VCI_CAN_OBJ,*PVCI_CAN_OBJ;

//����CAN������״̬���������͡�
typedef struct _VCI_CAN_STATUS{
	UCHAR	ErrInterrupt;
	UCHAR	regMode;
	UCHAR	regStatus;
	UCHAR	regALCapture;
	UCHAR	regECCapture; 
	UCHAR	regEWLimit;
	UCHAR	regRECounter; 
	UCHAR	regTECounter;
	DWORD	Reserved;
}VCI_CAN_STATUS,*PVCI_CAN_STATUS;

//���������Ϣ���������͡�
typedef struct _ERR_INFO{
	UINT	ErrCode;
	BYTE	Passive_ErrData[3];
	BYTE	ArLost_ErrData;
} VCI_ERR_INFO,*PVCI_ERR_INFO;

//�����ʼ��CAN����������
typedef struct _INIT_CONFIG{
	DWORD	AccCode;
	DWORD	AccMask;
	DWORD	InitFlag;
	UCHAR	Filter;   //0,1��������֡��2��׼֡�˲���3����չ֡�˲���
	UCHAR	Timing0;
	UCHAR	Timing1;
	UCHAR	Mode;     //ģʽ��0��ʾ����ģʽ��1��ʾֻ��ģʽ,2�Բ�ģʽ
}VCI_INIT_CONFIG,*PVCI_INIT_CONFIG;

//����������Ҫ����ĺ�������
//����ControlCAN.h�еĺ����������庯��ָ������
//////////////////////////////////////////////////////////////////////////
//����ZLG�ĺ���
typedef DWORD (CALLBACK*  LPVCI_OpenDevice)(DWORD,DWORD,DWORD);
typedef DWORD (CALLBACK*  LPVCI_CloseDevice)(DWORD,DWORD);
typedef DWORD (CALLBACK*  LPVCI_InitCan)(DWORD,DWORD,DWORD,PVCI_INIT_CONFIG);

typedef DWORD (CALLBACK*  LPVCI_ReadBoardInfo)(DWORD,DWORD,PVCI_BOARD_INFO);
typedef DWORD (CALLBACK*  LPVCI_ReadErrInfo)(DWORD,DWORD,DWORD,PVCI_ERR_INFO);
typedef DWORD (CALLBACK*  LPVCI_ReadCanStatus)(DWORD,DWORD,DWORD,PVCI_CAN_STATUS);

typedef DWORD (CALLBACK*  LPVCI_GetReference)(DWORD,DWORD,DWORD,DWORD,PVOID);
typedef DWORD (CALLBACK*  LPVCI_SetReference)(DWORD,DWORD,DWORD,DWORD,PVOID);

typedef ULONG (CALLBACK*  LPVCI_GetReceiveNum)(DWORD,DWORD,DWORD);
typedef DWORD (CALLBACK*  LPVCI_ClearBuffer)(DWORD,DWORD,DWORD);

typedef DWORD (CALLBACK*  LPVCI_StartCAN)(DWORD,DWORD,DWORD);
typedef DWORD (CALLBACK*  LPVCI_ResetCAN)(DWORD,DWORD,DWORD);

typedef ULONG (CALLBACK*  LPVCI_Transmit)(DWORD,DWORD,DWORD,PVCI_CAN_OBJ,ULONG);
typedef ULONG (CALLBACK*  LPVCI_Receive)(DWORD,DWORD,DWORD,PVCI_CAN_OBJ,ULONG,INT);

/*-------------------------����������������������-----------------------------*/
//���ȶ�����Ҫ�õ������ݽṹ
//USB-CAN�����������忨��Ϣ���������ͣ���������VCI_FindUsbDevice���������á�
typedef  struct  _VCI_BOARD_INFO1{
		USHORT	hw_Version;
		USHORT	fw_Version;
		USHORT	dr_Version;
		USHORT	in_Version;
		USHORT	irq_Num;
		BYTE	can_Num;
                BYTE    reserved;
		CHAR	str_Serial_Num[8];
		CHAR	str_hw_Type[16];
		CHAR	str_USB_Serial[4][4];
} VCI_BOARD_INFO1,*PVCI_BOARD_INFO1;

//���峣���������
typedef struct _REF_NORMAL{
	BYTE Mode;		 //����ģʽ
	BYTE Filter;		 //�˲���ʽ
	DWORD AccCode;		//�����˲�������
	DWORD AccMask;		//�����˲�������
	BYTE kBaudRate;		//�����������ţ�0-SelfDefine,1-5Kbps(δ��),2-18����Ϊ��10kbps,20kbps,40kbps,50kbps,80kbps,100kbps,125kbps,200kbps,250kbps,400kbps,500kbps,666kbps,800kbps,1000kbps,33.33kbps,66.66kbps,83.33kbps
	BYTE Timing0;
	BYTE Timing1;
	BYTE CANRX_EN;		//������δ��
	BYTE UARTBAUD;		//������δ��
}VCI_REF_NORMAL,*PVCI_REF_NORMAL;	

//���岨�������ò�������
typedef struct _BAUD_TYPE{
	DWORD Baud;		//�洢������ʵ��ֵ
	BYTE SJW;		//ͬ����ת��ȣ�ȡֵ1-4
	BYTE BRP;		//Ԥ��Ƶֵ��ȡֵ1-64
	BYTE SAM;		//�����㣬ȡֵ0=����һ�Σ�1=��������
	BYTE PHSEG2_SEL;	//��λ�����2ѡ��λ��ȡֵ0=����λ�����1ʱ�����,1=�ɱ��
	BYTE PRSEG;		//����ʱ��Σ�ȡֵ1-8
	BYTE PHSEG1;		//��λ�����1��ȡֵ1-8
	BYTE PHSEG2;		//��λ�����2��ȡֵ1-8
}VCI_BAUD_TYPE,*PVCI_BAUD_TYPE;

//����Reference��������
typedef struct _REF_STRUCT{
	VCI_REF_NORMAL RefNormal;
	BYTE Reserved;
	VCI_BAUD_TYPE BaudType;
}VCI_REF_STRUCT,*PVCI_REF_STRUCT; 


//��������
typedef DWORD (CALLBACK*  LPVCI_GetReference2)(DWORD,DWORD,DWORD,DWORD,PVCI_REF_STRUCT);
typedef DWORD (CALLBACK*  LPVCI_SetReference2)(DWORD,DWORD,DWORD,DWORD,PVOID);
typedef DWORD (CALLBACK*  LPVCI_ResumeConfig)(DWORD,DWORD,DWORD);

typedef DWORD (CALLBACK*  LPVCI_ConnectDevice)(DWORD,DWORD);
typedef DWORD (CALLBACK*  LPVCI_UsbDeviceReset)(DWORD,DWORD,DWORD);
typedef DWORD (CALLBACK*  LPVCI_FindUsbDevice)(PVCI_BOARD_INFO1);
//////////////////////////////////////////////////////////////////////////

HANDLE m_hDLL;//��������򿪵Ķ�̬����

//�ӿں���ָ��
LPVCI_OpenDevice VCI_OpenDevice;
LPVCI_CloseDevice VCI_CloseDevice;
LPVCI_InitCan VCI_InitCAN;
LPVCI_ReadBoardInfo VCI_ReadBoardInfo;
LPVCI_ReadErrInfo VCI_ReadErrInfo;
LPVCI_ReadCanStatus VCI_ReadCanStatus;
LPVCI_GetReference VCI_GetReference;
LPVCI_SetReference VCI_SetReference;
LPVCI_GetReceiveNum VCI_GetReceiveNum;
LPVCI_ClearBuffer VCI_ClearBuffer;
LPVCI_StartCAN VCI_StartCAN;
LPVCI_ResetCAN VCI_ResetCAN;
LPVCI_Transmit VCI_Transmit;
LPVCI_Receive VCI_Receive;
LPVCI_GetReference2 VCI_GetReference2;
LPVCI_SetReference2 VCI_SetReference2;
LPVCI_ResumeConfig VCI_ResumeConfig;
LPVCI_ConnectDevice VCI_ConnectDevice;
LPVCI_UsbDeviceReset VCI_UsbDeviceReset;
LPVCI_FindUsbDevice VCI_FindUsbDevice;

////////////////////////////////////////////////////////////////////////////
DWORD m_devtype=4;//USBCAN2���ͺ�
DWORD m_devind=0;
DWORD m_cannum=0;
int m_connect=0;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
        m_hDLL = LoadLibrary("ControlCAN.dll");//�򿪶�̬��

        //ȡ�ú�����ַ
        VCI_OpenDevice=(LPVCI_OpenDevice)GetProcAddress(m_hDLL,"VCI_OpenDevice");
 	VCI_CloseDevice=(LPVCI_CloseDevice)GetProcAddress(m_hDLL,"VCI_CloseDevice");
   	VCI_InitCAN=(LPVCI_InitCan)GetProcAddress(m_hDLL,"VCI_InitCAN");
   	VCI_ReadBoardInfo=(LPVCI_ReadBoardInfo)GetProcAddress(m_hDLL,"VCI_ReadBoardInfo");
    	VCI_ReadErrInfo=(LPVCI_ReadErrInfo)GetProcAddress(m_hDLL,"VCI_ReadErrInfo");
    	VCI_ReadCanStatus=(LPVCI_ReadCanStatus)GetProcAddress(m_hDLL,"VCI_ReadCANStatus");
  	VCI_GetReference=(LPVCI_GetReference)GetProcAddress(m_hDLL,"VCI_GetReference");
    	VCI_SetReference=(LPVCI_SetReference)GetProcAddress(m_hDLL,"VCI_SetReference");
  	VCI_GetReceiveNum=(LPVCI_GetReceiveNum)GetProcAddress(m_hDLL,"VCI_GetReceiveNum");
 	VCI_ClearBuffer=(LPVCI_ClearBuffer)GetProcAddress(m_hDLL,"VCI_ClearBuffer");
 	VCI_StartCAN=(LPVCI_StartCAN)GetProcAddress(m_hDLL,"VCI_StartCAN");
  	VCI_ResetCAN=(LPVCI_ResetCAN)GetProcAddress(m_hDLL,"VCI_ResetCAN");
    	VCI_Transmit=(LPVCI_Transmit)GetProcAddress(m_hDLL,"VCI_Transmit");
    	VCI_Receive=(LPVCI_Receive)GetProcAddress(m_hDLL,"VCI_Receive");
        VCI_GetReference2=(LPVCI_GetReference2)GetProcAddress(m_hDLL,"VCI_GetReference2");
        VCI_SetReference2=(LPVCI_SetReference2)GetProcAddress(m_hDLL,"VCI_SetReference2");
        VCI_ResumeConfig=(LPVCI_ResumeConfig)GetProcAddress(m_hDLL,"VCI_ResumeConfig");
        VCI_ConnectDevice=(LPVCI_ConnectDevice)GetProcAddress(m_hDLL,"VCI_ConnectDevice");
        VCI_UsbDeviceReset=(LPVCI_UsbDeviceReset)GetProcAddress(m_hDLL,"VCI_UsbDeviceReset");
}
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
        if(m_connect==1)
        {
                m_connect=0;
                WaitForSingleObject(m_readhandle,2000);
                m_readhandle=NULL;
                VCI_CloseDevice(m_devtype,m_devind);
        }

        FreeLibrary(m_hDLL);//�ͷŶ�̬����
}
void __fastcall TForm1::EnableUI(BOOL bEnable)
{
        Label8->Enabled = bEnable;
        ComboBox1->Enabled = bEnable;
        Label9->Enabled = bEnable;
        ComboBox2->Enabled = bEnable;
        Label1->Enabled = bEnable;
        Edit2->Enabled = bEnable;
        Label2->Enabled = bEnable;
        Edit3->Enabled = bEnable;
        Label12->Enabled = bEnable;
        ComboBox3->Enabled = bEnable;
        Label13->Enabled = bEnable;
        ComboBox4->Enabled = bEnable;
        Label10->Enabled = bEnable;
        Edit5->Enabled = bEnable;
        Label11->Enabled = bEnable;
        Edit6->Enabled = bEnable;
}
//---------------------------------------------------------------------------
void ReceiveThread(void *param)
{
   TListBox *box=(TListBox*)param;
   VCI_CAN_OBJ receivedata[2500];
   VCI_ERR_INFO errinfo;
   int len,i;
   AnsiString str,tmpstr;
   while(1)
   {
        if(m_connect==0)
                break;
        Sleep(1);
        len=VCI_Receive(m_devtype,m_devind,m_cannum,receivedata,2500,200);
        if(len<=0)
        {

        }
        else
        {
	        for(i=0;i<len;i++)
		{
			str="���յ�����֡:  ";
			if(receivedata[i].TimeFlag==0)
				tmpstr="ʱ���ʶ:��  ";
			else
				tmpstr="ʱ���ʶ:0x"+IntToHex((int)receivedata[i].TimeStamp,1)+" ";
			str+=tmpstr;
			tmpstr="֡ID:0x"+IntToHex((int)receivedata[i].ID,1)+" ";
			str+=tmpstr;
			str+="֡��ʽ:";
			if(receivedata[i].RemoteFlag==0)
				tmpstr="����֡ ";
			else
				tmpstr="Զ��֡ ";
			str+=tmpstr;
			str+="֡����:";
			if(receivedata[i].ExternFlag==0)
				tmpstr="��׼֡ ";
			else
				tmpstr="��չ֡ ";
			str+=tmpstr;
			box->Items->Add(str);
			if(receivedata[i].RemoteFlag==0)
			{
				str="����:";
                                if(receivedata[i].DataLen>8)
                                        receivedata[i].DataLen=8;
				for(int j=0;j<receivedata[i].DataLen;j++)
				{
					tmpstr=IntToHex((int)receivedata[i].Data[j],2)+" ";
					str+=tmpstr;
				}
				box->Items->Add(str);
			}
		}
		box->ItemIndex=box->Items->Count-1;
        }
   }
   _endthread();
}


void __fastcall TForm1::Button1Click(TObject *Sender)
{
        if(m_connect==1)
        {
                Button1->Caption ="����";
                m_connect=0;
                WaitForSingleObject(m_readhandle,2000);
                m_readhandle=NULL;
                VCI_CloseDevice(m_devtype,m_devind);
                EnableUI(TRUE);
                return;
        }
        int index = 0;
        int cannum = ComboBox2->ItemIndex;
        VCI_INIT_CONFIG initconfig;
        initconfig.AccCode=StrToInt("0x"+Edit2->Text);
        initconfig.AccMask=StrToInt("0x"+Edit3->Text);
        initconfig.Timing0=StrToInt("0x"+Edit5->Text);
        initconfig.Timing1=StrToInt("0x"+Edit6->Text);
        initconfig.Filter=ComboBox3->ItemIndex;
        initconfig.Mode=ComboBox4->ItemIndex;

        if(index>=0&&cannum>=0)
        {
                if(VCI_OpenDevice(m_devtype,index,0)==1)
                {
                        if(VCI_InitCAN(m_devtype,index,cannum,&initconfig)==1)
                        {
                                Button1->Caption ="�Ͽ�";
                                m_connect=1;
                                m_devind=0;
                                m_cannum=cannum;
                                m_readhandle=(HANDLE)_beginthread(ReceiveThread,0,(void*)ListBox1);
                        }
                        else
                        {
                                ShowMessage("��ʼ��CAN����");
                        }
                }
                else
                {
                        ShowMessage("�򿪶˿ڴ���");
                }

        }
        EnableUI(FALSE);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button2Click(TObject *Sender)
{
        if(m_connect==0)
        {
                ShowMessage("���ȴ򿪶˿�");
                return;
        }
        if(VCI_ResetCAN(m_devtype,m_devind,m_cannum)==1)
        {
                ListBox1->Items->Add("��λCAN�ɹ�");
                Button4->Enabled = FALSE;
        }
        else
        {
                ListBox1->Items->Add("��λCANʧ��");
        }
        ListBox1->ItemIndex=ListBox1->Items->Count-1;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button3Click(TObject *Sender)
{
        if(m_connect==0)
        {
                ShowMessage("���ȴ򿪶˿�");
                return;
        }
        if(VCI_StartCAN(m_devtype,m_devind,m_cannum)==1)
        {
                ListBox1->Items->Add("����CAN�ɹ�");
                Button4->Enabled = TRUE;
        }
        else
        {
                ListBox1->Items->Add("����CANʧ��");
        }
        ListBox1->ItemIndex=ListBox1->Items->Count-1;
}
//---------------------------------------------------------------------------




void __fastcall TForm1::Button6Click(TObject *Sender)
{
        if(m_connect==0)
        {
                ShowMessage("���ȴ򿪶˿�");
                return;
        }
        DWORD i= ComboBox3->ItemIndex;
        if(VCI_SetReference(m_devtype,m_devind,0,1,(PVOID)&i)==1)
        {
                ListBox1->Items->Add("���ĳɹ�");
        }
        else
        {
                ListBox1->Items->Add("����ʧ��");
        }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
      ComboBox1->ItemIndex = 1;
      ComboBox2->ItemIndex = 0;
      ComboBox3->ItemIndex = 0;
      ComboBox4->ItemIndex = 0;
      ComboBox6->ItemIndex =0;
      ComboBox7->ItemIndex =0;
      EnableUI(TRUE);
      Button4->Enabled = FALSE;
}
//---------------------------------------------------------------------------


//---------------------------------------------------------------------------

//---------------------------------------------------------------------------


void __fastcall TForm1::Button4Click(TObject *Sender)
{
        if(m_connect==0)
        {
                ShowMessage("���ȴ򿪶˿�");
                return;
        }

        BYTE sendtype,frametype,frameformat;
        DWORD id;
        BYTE data[8];

        frametype=ComboBox6->ItemIndex;
        frameformat=ComboBox7->ItemIndex;
        id=StrToInt("0x"+Edit1->Text);

        AnsiString str=Edit4->Text;
        AnsiString strdata;
        int i,kkk;
        for(i=0;i<8;i++)
        {
                strdata=str.SubString(3*i+1,2);
                strdata=strdata.Trim();
                kkk=strdata.Length();
                if(kkk==0)
                {
                        goto exit;
                }
                data[i]=StrToInt(strdata);
                //sscanf(strdata.c_str(),"%x",data+i);
        }

exit:
        VCI_CAN_OBJ senddata;
        senddata.SendType=sendtype;
        senddata.ExternFlag=frametype;
        senddata.RemoteFlag=frameformat;
        senddata.ID=id;
        senddata.DataLen=i;
        memcpy(senddata.Data,data,i);

        if(VCI_Transmit(m_devtype,m_devind,m_cannum,&senddata,1)==1)
        {
                ListBox1->Items->Add("���ͳɹ�");
        }
        else
        {
                ListBox1->Items->Add("����ʧ��");
        }
        ListBox1->ItemIndex=ListBox1->Items->Count-1;
}


//---------------------------------------------------------------------------

void __fastcall TForm1::ComboBox1Click(TObject *Sender)
{
        m_devtype =  ComboBox1->ItemIndex + 3;
        if( m_devtype  == 3 && ComboBox2->ItemIndex > 0)
        {
            ComboBox2->ItemIndex = 0;
            m_cannum = 0;
        }
}
//---------------------------------------------------------------------------


void __fastcall TForm1::ComboBox2Click(TObject *Sender)
{
      if( m_devtype == 3 && ComboBox2->ItemIndex > 0 )
         ComboBox2->ItemIndex = 0;
      m_cannum = ComboBox2->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button5Click(TObject *Sender)
{
     ListBox1->Clear();
}
//---------------------------------------------------------------------------

