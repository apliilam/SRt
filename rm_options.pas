unit RM_Options;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RM_Translate, LCLTranslator, ComCtrls, ExtCtrls, Buttons;

type

    { TForm4 }
  TForm4 = class(TForm)
    prCheckBoxCopyPrName: TCheckBox;
    prCheckBoxUseSS_Compatibility: TCheckBox;
    rCheckBox_UseSignature: TCheckBox;
    rCheckBox_UseDate: TCheckBox;
    rComboBoxDateFormat: TComboBox;
    rComboBox_dbNameList: TComboBox;
    rLabelDateFormat: TLabel;
    rLabel_jpgDimensions: TLabel;
    rLabel_jpgDimensions1: TLabel;
    rLabel_jpgQuality: TLabel;
    rPanel_options1: TPanel;
    rGroupBox_FormProperties: TGroupBox;
    rGroupBox_Lang: TGroupBox;
    rPanel_options2: TPanel;
    rRadioButton_en: TRadioButton;
    rRadioButton_ru: TRadioButton;
    rSB_dbNameDel: TSpeedButton;
    rTrackBar_jpgDimension: TTrackBar;
    rTrackBar_jpgQuality: TTrackBar;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure prCheckBoxUseSS_CompatibilityChange(Sender: TObject);
    procedure rCheckBox_UseDateChange(Sender: TObject);
    procedure rCheckBox_UseSignatureChange(Sender: TObject);
    procedure rRadioButton_enChange(Sender: TObject);
    procedure rRadioButton_ruChange(Sender: TObject);
    procedure rSB_dbNameDelClick(Sender: TObject);
    procedure rTrackBar_jpgQualityChange(Sender: TObject);
    procedure rTrackBar_jpgDimensionChange(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form4: TForm4;




implementation

uses RM_main, rSQL, RM_Additional;

{$R *.lfm}

{ TForm4 }




procedure TForm4.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Form1.AllPrint;
end;

procedure TForm4.prCheckBoxUseSS_CompatibilityChange(Sender: TObject);
var
  j:integer;
begin
  j:=Form1.prPageControl.TabIndex;
  Form1.prPageControl.TabIndex:=-1;
  Form1.prPageControl.TabIndex:=j;
end;



procedure UseSign(SignSB: TSpeedButton; SignImg: TImage);
begin
  SignSB.Visible:=true;
  SignImg.BringToFront;
end;
procedure NotUseSign(SignSB: TSpeedButton; SignImg: TImage);
begin
  SignSB.Visible:=false;
  SignImg.Picture.Clear;
  SignImg.SendToBack;
end;

procedure TForm4.rCheckBox_UseSignatureChange(Sender: TObject);
begin
  if rCheckBox_UseSignature.Checked then
    begin
      if MessageDlg(Trl_Confirmation, Trl_BeCarefulDigitalSignature+#10#13+Trl_ContinueQ, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        begin
          rCheckBox_UseSignature.Checked:=false;
          Exit;
        end;
      with Form1 do
        begin
          UseSign(mrEngSB_PSignature, mrEngImage_PSign);
          UseSign(mrEngSB_OSignature, mrEngImage_OSign);
          UseSign(mrEngSB_WSignature, mrEngImage_WSign);
          UseSign(mrRusSB_PSignature, mrRusImage_PSign);
          UseSign(mrRusSB_OSignature, mrRusImage_OSign);
          UseSign(mrRusSB_WSignature, mrRusImage_WSign);

          UseSign(prEngSB_PSignature, prEngImage_PSign);
          UseSign(prEngSB_OSignature, prEngImage_OSign);
          UseSign(prEngSB_WSignature, prEngImage_WSign);
          UseSign(prRusSB_PSignature, prRusImage_PSign);
          UseSign(prRusSB_OSignature, prRusImage_OSign);
          UseSign(prRusSB_WSignature, prRusImage_WSign);
        end;
    end
  else
    with Form1 do
      begin
        NotUseSign(mrEngSB_PSignature, mrEngImage_PSign);
        NotUseSign(mrEngSB_OSignature, mrEngImage_OSign);
        NotUseSign(mrEngSB_WSignature, mrEngImage_WSign);
        NotUseSign(mrRusSB_PSignature, mrRusImage_PSign);
        NotUseSign(mrRusSB_OSignature, mrRusImage_OSign);
        NotUseSign(mrRusSB_WSignature, mrRusImage_WSign);

        NotUseSign(prEngSB_PSignature, prEngImage_PSign);
        NotUseSign(prEngSB_OSignature, prEngImage_OSign);
        NotUseSign(prEngSB_WSignature, prEngImage_WSign);
        NotUseSign(prRusSB_PSignature, prRusImage_PSign);
        NotUseSign(prRusSB_OSignature, prRusImage_OSign);
        NotUseSign(prRusSB_WSignature, prRusImage_WSign);
      end;
  Form1.AllPrint;
end;


procedure UseDate(DateSB: TSpeedButton);
begin
  DateSB.Visible:=true;
end;
procedure NotUseDate(DateSB: TSpeedButton);
begin
  DateSB.Visible:=false;
end;
procedure TForm4.rCheckBox_UseDateChange(Sender: TObject);
begin
  if rCheckBox_UseDate.Checked then
    with Form1 do
      begin
        prCheckBoxUseSS_Compatibility.Enabled:=true;
        rCheckBox_UseSignature.Enabled:=true;
        UseDate(mrEngSB_PDate);
        UseDate(mrEngSB_PShootDate);
        UseDate(mrEngSB_ODate);
        UseDate(mrEngSB_ODateBirth);
        UseDate(mrEngSB_WDate);
        UseDate(mrRusSB_PDate);
        UseDate(mrRusSB_ODate);
        UseDate(mrRusSB_WDate);

        UseDate(prEngSB_PDate);
        UseDate(prEngSB_ODate);
        UseDate(prEngSB_WDate);
        UseDate(prRusSB_PDate);
        UseDate(prRusSB_ODate);
        UseDate(prRusSB_WDate);
      end
   else
     with Form1 do
       begin
         prCheckBoxUseSS_Compatibility.Checked:=false;
         prCheckBoxUseSS_Compatibility.Enabled:=false;
         rCheckBox_UseSignature.Checked:=false;
         rCheckBox_UseSignature.Enabled:=false;



         NotUseDate(mrEngSB_PDate);
         NotUseDate(mrEngSB_PShootDate);
         NotUseDate(mrEngSB_ODate);
         NotUseDate(mrEngSB_ODateBirth);
         NotUseDate(mrEngSB_WDate);
         NotUseDate(mrRusSB_PDate);
         NotUseDate(mrRusSB_ODate);
         NotUseDate(mrRusSB_WDate);

         NotUseDate(prEngSB_PDate);
         NotUseDate(prEngSB_ODate);
         NotUseDate(prEngSB_WDate);
         NotUseDate(prRusSB_PDate);
         NotUseDate(prRusSB_ODate);
         NotUseDate(prRusSB_WDate);
       end;
   prCheckBoxUseSS_CompatibilityChange(self);
   Form1.AllPrint;
end;



procedure TForm4.rRadioButton_enChange(Sender: TObject);
begin
  if rRadioButton_en.Checked then
    begin
      SetDefaultLang('en', ExtractFilePath(ParamStr(0))+TranslateFile_EN, true);
      Form1.prPageControlChange(self);
      Form4.Refresh;
    end;
end;
procedure TForm4.rRadioButton_ruChange(Sender: TObject);
begin
  if rRadioButton_ru.Checked then
    begin
      SetDefaultLang('ru', ExtractFilePath(ParamStr(0))+TranslateFile_RU, true);
      Form1.prPageControlChange(self);
      Form4.Refresh;
    end;
end;

procedure TForm4.rSB_dbNameDelClick(Sender: TObject);
begin
  sqldb.ExecSQL('DELETE FROM person WHERE EngName="'+rComboBox_dbNameList.Text+'"');
  dbGetPersonNameList(Form1.rListBox_dbNameList, rComboBox_dbNameList);
end;

procedure TForm4.rTrackBar_jpgQualityChange(Sender: TObject);
begin
  JpgQuality:=rTrackBar_jpgQuality.Position;
  rTrackBar_jpgQuality.SelEnd:=rTrackBar_jpgQuality.Position;
  rLabel_jpgQuality.Caption:='release quality (JPG): '+IntToStr(rTrackBar_jpgQuality.Position);
end;

procedure TForm4.rTrackBar_jpgDimensionChange(Sender: TObject);
var
  str: string;
  r: integer;
begin
  JpgDimensions:=rTrackBar_jpgDimension.Position;
  rTrackBar_jpgDimension.SelEnd:=rTrackBar_jpgDimension.Position;
  //r:=WidthByUser;
  str:=IntToStr(WidthByUser)+'px';
  rLabel_jpgDimensions.Caption:='release Width: '+str;
end;

end.

