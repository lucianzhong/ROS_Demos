//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <process.h>

//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TComboBox *ComboBox1;
        TComboBox *ComboBox2;
        TButton *Button1;
        TButton *Button2;
        TButton *Button3;
        TGroupBox *GroupBox1;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label7;
        TGroupBox *GroupBox2;
        TLabel *Label8;
        TLabel *Label9;
        TComboBox *ComboBox6;
        TComboBox *ComboBox7;
        TEdit *Edit1;
        TEdit *Edit4;
        TGroupBox *GroupBox6;
        TListBox *ListBox1;
        TButton *Button4;
        TGroupBox *GroupBox3;
        TLabel *Label1;
        TEdit *Edit2;
        TLabel *Label2;
        TEdit *Edit3;
        TEdit *Edit5;
        TLabel *Label10;
        TLabel *Label11;
        TEdit *Edit6;
        TLabel *Label12;
        TLabel *Label13;
        TComboBox *ComboBox3;
        TComboBox *ComboBox4;
        TButton *Button5;
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall Button3Click(TObject *Sender);

        void __fastcall Button6Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button4Click(TObject *Sender);
        void __fastcall EnableUI(BOOL bEnable);
        void __fastcall ComboBox1Click(TObject *Sender);
        void __fastcall ComboBox2Click(TObject *Sender);
        void __fastcall Button5Click(TObject *Sender);
private:	// User declarations
public:
        HANDLE m_readhandle;		// User declarations
        __fastcall TForm1(TComponent* Owner);

};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
