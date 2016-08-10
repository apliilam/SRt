unit RM_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  variants, EditBtn, LResources, StdCtrls, ExtCtrls, ExtDlgs, LCLType, LCLIntf,
  Buttons, Menus, ComCtrls, RM_Additional, RM_CropImg, RM_ProgressForm,
  RM_Options, RM_Translate, rSQL, types, dateutils, Clipbrd,
  LCLProc, LCLTranslator,         //DefaultTranslator, gettext, translations,
  winpeimagereader, elfreader, machoreader,resource,versionresource;

type

  { TForm1 }
  TForm1 = class(TForm)
    mrCheckBox_autofillMRname: TCheckBox;
    Edit8: TEdit;
    Edit9: TEdit;
    MenuSLicense: TMenuItem;
    mrGroupBoxFile: TGroupBox;
    ImageWarningA4: TImage;
    ImageWarningA5: TImage;
    MenuSOnlineHelp: TMenuItem;
    mrComboBox__ssGender: TComboBox;
    mrComboBox_ssEthnicity: TComboBox;
    mrEngEdit_ODateBirth: TDateEdit;
    mrEngEdit_OState: TEdit;
    mrEngEdit_PShootDate: TDateEdit;
    mrEngEdit_PShootDescription: TEdit;
    mrEngEdit_PState: TEdit;
    mrEngEdit_PShootLocation: TEdit;
    mrEngSB_ODateBirth: TSpeedButton;
    mrEngSB_PShootDate: TSpeedButton;
    mrImageENG_temp: TImage;
    mrImageRUS_temp: TImage;
    mrImageFormENG: TImage;
    mrEngSB_dbOLoad: TSpeedButton;
    mrEngSB_dbOUpdate: TSpeedButton;
    mrEngSB_dbPLoad: TSpeedButton;
    mrEngSB_dbPUpdate: TSpeedButton;
    mrEngSB_dbWLoad: TSpeedButton;
    mrEngSB_dbWUpdate: TSpeedButton;
    mrEngSB_Obuttons: TSpeedButton;
    mrEngSB_OClear: TSpeedButton;
    mrEngSB_Pbuttons: TSpeedButton;
    mrEngSB_PClear: TSpeedButton;
    mrEngSB_Wbuttons: TSpeedButton;
    mrEngSB_WClear: TSpeedButton;
    mrEngComboBox_OCountry: TComboBox;
    mrEngComboBox_PCountry: TComboBox;
    mrEngEdit_OAddress: TEdit;
    mrEngEdit_OCity: TEdit;
    mrEngEdit_OEmail: TEdit;
    mrEngEdit_OName: TEdit;
    mrEngEdit_OPhone: TEdit;
    mrEngEdit_OZipCode: TEdit;
    mrEngEdit_PAddress: TEdit;
    mrEngEdit_PCity: TEdit;
    mrEngEdit_PEmail: TEdit;
    mrEngEdit_PName: TEdit;
    mrEngEdit_PPhone: TEdit;
    mrEngEdit_PZipCode: TEdit;
    mrEngEdit_WName: TEdit;
    mrEngImage_OSign: TImage;
    mrEngImage_PSign: TImage;
    mrEngImage_WSign: TImage;
    mrEngSB_OSignature: TSpeedButton;
    mrEngSB_PSignature: TSpeedButton;
    mrEngSB_WSignature: TSpeedButton;
    mrEngEdit_ODate: TDateEdit;
    mrEngEdit_PDate: TDateEdit;
    mrEngEdit_WDate: TDateEdit;
    mrEngSB_ODate: TSpeedButton;
    mrEngSB_PDate: TSpeedButton;
    mrEngSB_WDate: TSpeedButton;
    mrEngSB_OCountry: TSpeedButton;
    mrEngSB_PCountry: TSpeedButton;
    mrImageFormRef: TImage;
    mrRusEdit_OState: TEdit;
    mrRusEdit_PState: TEdit;
    mrScrollBoxRef: TScrollBox;
    Panel1: TPanel;
    mrImage_Red: TImage;
    mrEditCustomTitle: TEdit;
    prButtonCreate: TButton;
    prImageFORM1: TImage;
    mrImageFormRUS: TImage;
    mrRusComboBox_OCountry: TComboBox;
    mrRusComboBox_PCountry: TComboBox;
    mrRusEdit_OAddress: TEdit;
    mrRusEdit_OCity: TEdit;
    mrRusEdit_ODate: TDateEdit;
    mrRusEdit_OEmail: TEdit;
    mrRusEdit_OName: TEdit;
    mrRusEdit_OPhone: TEdit;
    mrRusEdit_OZipCode: TEdit;
    mrRusEdit_PAddress: TEdit;
    mrRusEdit_PCity: TEdit;
    mrRusEdit_PDate: TDateEdit;
    mrRusEdit_PEmail: TEdit;
    mrRusEdit_PName: TEdit;
    prRusEdit_PName2: TEdit;
    mrRusEdit_PName2: TEdit;
    mrRusEdit_PPhone: TEdit;
    mrRusEdit_PZipCode: TEdit;
    mrRusEdit_WDate: TDateEdit;
    mrRusEdit_WName: TEdit;
    mrRusImage_OSign: TImage;
    mrRusImage_PSign: TImage;
    mrRusImage_WSign: TImage;
    mrRusSB_dbOLoad: TSpeedButton;
    mrRusSB_dbOUpdate: TSpeedButton;
    mrRusSB_dbPLoad: TSpeedButton;
    mrRusSB_dbPUpdate: TSpeedButton;
    prRusSB_dbWLoad: TSpeedButton;
    mrRusSB_dbWLoad: TSpeedButton;
    prRusSB_dbWUpdate: TSpeedButton;
    mrRusSB_dbWUpdate: TSpeedButton;
    mrRusSB_Obuttons: TSpeedButton;
    mrRusSB_OClear: TSpeedButton;
    mrRusSB_OCountry: TSpeedButton;
    mrRusSB_ODate: TSpeedButton;
    mrRusSB_OSignature: TSpeedButton;
    mrRusSB_Pbuttons: TSpeedButton;
    mrRusSB_PClear: TSpeedButton;
    mrRusSB_PCountry: TSpeedButton;
    mrRusSB_PDate: TSpeedButton;
    mrRusSB_PSignature: TSpeedButton;
    prRusSB_Wbuttons: TSpeedButton;
    mrRusSB_Wbuttons: TSpeedButton;
    prRusSB_WClear: TSpeedButton;
    prRusSB_dbOLoad: TSpeedButton;
    prRusSB_dbOUpdate: TSpeedButton;
    prRusSB_Obuttons: TSpeedButton;
    prRusSB_OClear: TSpeedButton;
    prRusSB_dbPLoad: TSpeedButton;
    prEngSB_dbPUpdate: TSpeedButton;
    prEngSB_dbPLoad: TSpeedButton;
    prRusSB_dbPUpdate: TSpeedButton;
    prEngSB_dbWLoad: TSpeedButton;
    prEngSB_dbWUpdate: TSpeedButton;
    prEngSB_Obuttons: TSpeedButton;
    prRusSB_Pbuttons: TSpeedButton;
    prRusSB_PClear: TSpeedButton;
    prEngSB_Wbuttons: TSpeedButton;
    prEngSB_PClear: TSpeedButton;
    prEngSB_WClear: TSpeedButton;
    mrRusSB_WClear: TSpeedButton;
    mrRusSB_WDate: TSpeedButton;
    mrRusSB_WSignature: TSpeedButton;
    prSBrefPanelCollapse: TSpeedButton;
    prScrollBoxQ1: TScrollBox;
    mrScrollBoxRUS: TScrollBox;
    rListBox_dbNameList: TListBox;
    MenuSDonate: TMenuItem;
    mrEdit_ssBirthDate: TEdit;
    prEngSB_OClear: TSpeedButton;
    prEngSB_dbOLoad: TSpeedButton;
    prEngSB_dbOUpdate: TSpeedButton;
    rPanel1: TPanel;
    prCheckBox_Nearly: TCheckBox;
    prCheckBox_OneReleasePerFile: TCheckBox;
    rCheckBox_Self: TCheckBox;
    prEngComboBox_OCountry: TComboBox;
    prRusComboBox_OCountry: TComboBox;
    prEngComboBox_PCountry: TComboBox;
    prRusComboBox_PCountry: TComboBox;
    prEngEdit_PName: TEdit;
    prRusEdit_PName: TEdit;
    prEngEdit_OAddress: TEdit;
    prRusEdit_OAddress: TEdit;
    prEngEdit_OCity: TEdit;
    prRusEdit_OCity: TEdit;
    prEngEdit_ODate: TDateEdit;
    prRusEdit_ODate: TDateEdit;
    prEngEdit_OEmail: TEdit;
    prRusEdit_OEmail: TEdit;
    prEngEdit_OPhone: TEdit;
    prRusEdit_OPhone: TEdit;
    prEngEdit_OName: TEdit;
    prRusEdit_OName: TEdit;
    prEngEdit_OZipCode: TEdit;
    prRusEdit_OZipCode: TEdit;
    prEngEdit_PAddress: TEdit;
    prRusEdit_PAddress: TEdit;
    prEngEdit_PCity: TEdit;
    prRusEdit_PCity: TEdit;
    prEngEdit_PDate: TDateEdit;
    prRusEdit_PDate: TDateEdit;
    prEngEdit_PEmail: TEdit;
    prRusEdit_PEmail: TEdit;
    prEngEdit_PPhone: TEdit;
    prRusEdit_PPhone: TEdit;
    prEngEdit_PZipCode: TEdit;
    prRusEdit_PZipCode: TEdit;
    prEngEdit_WDate: TDateEdit;
    prRusEdit_WDate: TDateEdit;
    prEngEdit_WName: TEdit;
    prRusEdit_WName: TEdit;
    prImage2: TImage;
    prImage3: TImage;
    prImageRUS_temp: TImage;
    prImageFormENG: TImage;
    prImageFormRef: TImage;
    prImageFormRUS: TImage;
    mrLabel_ssEthnicity: TLabel;
    mrLabel_ssGender: TLabel;
    mrLabel_ssBirthDate: TLabel;
    mrmScrollBox: TScrollBox;
    mrmScrollBoxENG: TScrollBox;
    mrmScrollBoxRef: TScrollBox;
    mrmScrollBoxRUS: TScrollBox;
    mrmImageFormENG: TImage;
    mrmImageFormRUS: TImage;
    mrmImageFormRef: TImage;
    prImageENG_temp: TImage;
    prEngImage_OSign: TImage;
    prRusImage_OSign: TImage;
    prEngImage_PSign: TImage;
    prRusImage_PSign: TImage;
    prEngImage_WSign: TImage;
    prRusImage_WSign: TImage;
    prPanelRef: TPanel;
    prSBDelAllReferences: TSpeedButton;
    prEngSB_OCountry: TSpeedButton;
    prRusSB_OCountry: TSpeedButton;
    prEngSB_ODate: TSpeedButton;
    prRusSB_ODate: TSpeedButton;
    prEngSB_OSignature: TSpeedButton;
    prRusSB_OSignature: TSpeedButton;
    prEngSB_PCountry: TSpeedButton;
    prRusSB_PCountry: TSpeedButton;
    prEngSB_PDate: TSpeedButton;
    prRusSB_PDate: TSpeedButton;
    prEngSB_PSignature: TSpeedButton;
    prRusSB_PSignature: TSpeedButton;
    prEngSB_WDate: TSpeedButton;
    prRusSB_WDate: TSpeedButton;
    prEngSB_WSignature: TSpeedButton;
    prRusSB_WSignature: TSpeedButton;
    prScrollBox: TScrollBox;
    prScrollBoxENG: TScrollBox;
    prScrollBoxRef: TScrollBox;
    prScrollBoxRUS: TScrollBox;
    prPanelLang: TPanel;
    prBitBtn_ssModelPhoto: TBitBtn;
    mrBitBtn_ssModelPhoto: TBitBtn;
    mrEdit_ssCountry: TEdit;
    mrEdit_ssModelPhoto: TEdit;
    mrEdit_ssFirstName: TEdit;
    prEdit_ssNote: TEdit;
    prEdit_ssModelPhoto: TEdit;
    mrEdit_ssNote: TEdit;
    prEdit_ssPropertyOwner: TEdit;
    prEdit_ssName: TEdit;
    prEdit_ssCountry: TEdit;
    mrEdit_ssLastName: TEdit;
    mrEdit_ssShootingDate: TEdit;
    prEdit_ssType: TEdit;
    prEdit_ssShootingDate: TEdit;
    mrEdit_ssType: TEdit;
    mrGroupBox_SSfieldsModel: TGroupBox;
    mrLabel_ssCountry: TLabel;
    prLabel_ssModelPhoto: TLabel;
    mrLabel_ssModelPhoto: TLabel;
    mrLabel_ssFirstName: TLabel;
    prLabel_ssNote: TLabel;
    mrLabel_ssNote: TLabel;
    prLabel_ssPropertyOwner: TLabel;
    prLabel_ssCountry: TLabel;
    mrLabel_ssLastName: TLabel;
    prLabel_ssShootingDate: TLabel;
    mrLabel_ssShootingDate: TLabel;
    prLabel_ssType: TLabel;
    prGroupBox_SSfieldProperty: TGroupBox;
    MainMenu1: TMainMenu;
    MenuFile: TMenuItem;
    MenuHelp: TMenuItem;
    MenuExit: TMenuItem;
    MenuSAbout: TMenuItem;
    MenuOptions: TMenuItem;
    prLabel_ssName: TLabel;
    mrLabel_ssType: TLabel;
    prPageControl: TPageControl;
    prImageFORM: TImage;
    prPPMenuGetFileDate: TMenuItem;
    prPopupMenuFile: TPopupMenu;
    prPPMenuGetRefDate: TMenuItem;
    prMemoTemp: TMemo;
    prPPMenuReset: TMenuItem;
    prPPMenuRotate: TMenuItem;
    prPPMenuItemRotateYES90: TMenuItem;
    prPPMenuItemRotateNO90: TMenuItem;
    prPPMenuCrop: TMenuItem;
    prListBoxFile: TListBox;
    prPPMenuDelete: TMenuItem;
    prPopupMenuRef: TPopupMenu;
    prEditCustomTitle: TEdit;
    prGroupBoxFile: TGroupBox;
    prLabelSelFile: TLabel;
    prScrollBoxQ: TScrollBox;
    mrScrollBox: TScrollBox;
    mrScrollBoxENG: TScrollBox;
    prSpeedButtonFile: TSpeedButton;
    prSpeedButtonFileClear: TSpeedButton;
    prSpeedButtonFileDelete: TSpeedButton;
    prSB_Add: TSpeedButton;
    prStatusBar: TStatusBar;
    rPanelRefAREA: TPanel;
    rSBformENG: TSpeedButton;
    rSBformRef: TSpeedButton;
    rSBformRUS: TSpeedButton;
    mr: TTabSheet;
    mrm: TTabSheet;
    prEngSB_Pbuttons: TSpeedButton;
    prA: TTabSheet;
    pr: TTabSheet;
    TimerStart: TTimer;


    procedure Button1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure MenuOptionsClick(Sender: TObject);
    procedure MenuSDonateClick(Sender: TObject);
    procedure MenuSAboutClick(Sender: TObject);
    procedure MenuSLicenseClick(Sender: TObject);
    procedure MenuSOnlineHelpClick(Sender: TObject);
    procedure mrBitBtn_ssModelPhoto1Click(Sender: TObject);
    procedure mrBitBtn_ssModelPhotoClick(Sender: TObject);
    procedure mrCheckBox_autofillMRnameChange(Sender: TObject);
    procedure mrEditCustomTitleChange(Sender: TObject);
    procedure mrEngComboBox_OCountryChange(Sender: TObject);
    procedure mrEngComboBox_PCountryChange(Sender: TObject);
    procedure mrEngEdit_ODateBirthChange(Sender: TObject);
    procedure mrEngEdit_ODateChange(Sender: TObject);
    procedure mrEngEdit_OEmailChange(Sender: TObject);
    procedure mrEngEdit_ONameChange(Sender: TObject);
    procedure mrEngEdit_OPhoneChange(Sender: TObject);
    procedure mrEngEdit_OZipCodeChange(Sender: TObject);
    procedure mrEngEdit_PAddressChange(Sender: TObject);
    procedure mrEngEdit_PCityChange(Sender: TObject);
    procedure mrEngEdit_PDateChange(Sender: TObject);
    procedure mrEngEdit_PEmailChange(Sender: TObject);
    procedure mrEngEdit_PNameChange(Sender: TObject);
    procedure mrEngEdit_PNameMouseLeave(Sender: TObject);
    procedure mrEngEdit_PPhoneChange(Sender: TObject);
    procedure mrEngEdit_PShootDateChange(Sender: TObject);
    procedure mrEngEdit_PShootDescriptionChange(Sender: TObject);
    procedure mrEngEdit_PStateChange(Sender: TObject);
    procedure mrEngEdit_PZipCodeChange(Sender: TObject);
    procedure mrEngEdit_WDateChange(Sender: TObject);
    procedure mrEngImage_OSignDblClick(Sender: TObject);
    procedure mrEngImage_PSignDblClick(Sender: TObject);
    procedure mrEngImage_PSignPictureChanged(Sender: TObject);
    procedure mrEngImage_WSignDblClick(Sender: TObject);
    procedure mrEngSB_dbOLoadClick(Sender: TObject);
    procedure mrEngSB_dbOUpdateClick(Sender: TObject);
    procedure mrEngSB_dbPLoadClick(Sender: TObject);
    procedure mrEngSB_dbPUpdateClick(Sender: TObject);
    procedure mrEngSB_dbWLoadClick(Sender: TObject);
    procedure mrEngSB_dbWUpdateClick(Sender: TObject);
    procedure mrEngSB_ObuttonsMouseEnter(Sender: TObject);
    procedure mrEngSB_ObuttonsMouseLeave(Sender: TObject);
    procedure mrEngSB_OClearClick(Sender: TObject);
    procedure mrEngSB_OCountryClick(Sender: TObject);
    procedure mrEngSB_ODateBirthClick(Sender: TObject);
    procedure mrEngSB_ODateClick(Sender: TObject);
    procedure mrEngSB_OSignatureClick(Sender: TObject);
    procedure mrEngSB_PbuttonsMouseEnter(Sender: TObject);
    procedure mrEngSB_PbuttonsMouseLeave(Sender: TObject);
    procedure mrEngSB_PClearClick(Sender: TObject);
    procedure mrEngSB_PCountryClick(Sender: TObject);
    procedure mrEngSB_PDateClick(Sender: TObject);
    procedure mrEngSB_PShootDateClick(Sender: TObject);
    procedure mrEngSB_PSignatureClick(Sender: TObject);
    procedure mrEngSB_WbuttonsMouseEnter(Sender: TObject);
    procedure mrEngSB_WbuttonsMouseLeave(Sender: TObject);
    procedure mrEngSB_WClearClick(Sender: TObject);
    procedure mrEngSB_WDateClick(Sender: TObject);
    procedure mrEngSB_WSignatureClick(Sender: TObject);
    procedure mrGroupBoxFileResize(Sender: TObject);
    procedure mrGroupBox_SSfieldsModelResize(Sender: TObject);
    procedure mrRusComboBox_OCountryChange(Sender: TObject);
    procedure mrRusComboBox_PCountryChange(Sender: TObject);
    procedure mrRusEdit_ODateChange(Sender: TObject);
    procedure mrRusEdit_OEmailChange(Sender: TObject);
    procedure mrRusEdit_OPhoneChange(Sender: TObject);
    procedure mrRusEdit_OZipCodeChange(Sender: TObject);
    procedure mrRusEdit_PAddressChange(Sender: TObject);
    procedure mrRusEdit_PCityChange(Sender: TObject);
    procedure mrRusEdit_PDateChange(Sender: TObject);
    procedure mrRusEdit_PEmailChange(Sender: TObject);
    procedure mrRusEdit_PNameChange(Sender: TObject);
    procedure mrRusEdit_PPhoneChange(Sender: TObject);
    procedure mrRusEdit_PStateChange(Sender: TObject);
    procedure mrRusEdit_PZipCodeChange(Sender: TObject);
    procedure mrRusEdit_WDateChange(Sender: TObject);
    procedure mrRusImage_OSignDblClick(Sender: TObject);
    procedure mrRusImage_PSignDblClick(Sender: TObject);
    procedure mrRusImage_PSignPictureChanged(Sender: TObject);
    procedure mrRusImage_WSignDblClick(Sender: TObject);
    procedure mrRusSB_ObuttonsMouseEnter(Sender: TObject);
    procedure mrRusSB_ObuttonsMouseLeave(Sender: TObject);
    procedure mrRusSB_OCountryClick(Sender: TObject);
    procedure mrRusSB_ODateClick(Sender: TObject);
    procedure mrRusSB_OSignatureClick(Sender: TObject);
    procedure mrRusSB_PbuttonsMouseEnter(Sender: TObject);
    procedure mrRusSB_PbuttonsMouseLeave(Sender: TObject);
    procedure mrRusSB_PClearClick(Sender: TObject);
    procedure mrRusSB_PCountryClick(Sender: TObject);
    procedure mrRusSB_PDateClick(Sender: TObject);
    procedure mrRusSB_PSignatureClick(Sender: TObject);
    procedure mrRusSB_WbuttonsMouseEnter(Sender: TObject);
    procedure mrRusSB_WbuttonsMouseLeave(Sender: TObject);
    procedure mrRusSB_WDateClick(Sender: TObject);
    procedure mrRusSB_WSignatureClick(Sender: TObject);
    procedure prBitBtn_ssModelPhotoClick(Sender: TObject);
    procedure prCheckBoxCutPrName30Change(Sender: TObject);
    procedure prCheckBox_NearlyChange(Sender: TObject);
    procedure prCheckBox_OneReleasePerFileClick(Sender: TObject);
    procedure prEngComboBox_OCountryChange(Sender: TObject);
    procedure prEngComboBox_PCountryChange(Sender: TObject);
    procedure prEngEdit_ODateChange(Sender: TObject);
    procedure prEngEdit_OEmailChange(Sender: TObject);
    procedure prEngEdit_ONameChange(Sender: TObject);
    procedure prEngEdit_OPhoneChange(Sender: TObject);
    procedure prEngEdit_OZipCodeChange(Sender: TObject);
    procedure prEngImage_PSignPictureChanged(Sender: TObject);
    procedure prEngSB_dbOLoadClick(Sender: TObject);
    procedure prEngSB_dbOUpdateClick(Sender: TObject);
    procedure prEngSB_dbPLoadClick(Sender: TObject);
    procedure prEngSB_dbPUpdateClick(Sender: TObject);
    procedure mmrEngSB_dbWLoadClick(Sender: TObject);
    procedure prEngSB_dbWUpdateClick(Sender: TObject);
    procedure prEngSB_ObuttonsMouseEnter(Sender: TObject);
    procedure prEngSB_ObuttonsMouseLeave(Sender: TObject);
    procedure prEngSB_OClearClick(Sender: TObject);
    procedure prEngSB_ODateClick(Sender: TObject);
    procedure prEngSB_PbuttonsMouseEnter(Sender: TObject);
    procedure prEngSB_PbuttonsMouseLeave(Sender: TObject);
    procedure prEngSB_PClearClick(Sender: TObject);
    procedure prEngSB_PDateClick(Sender: TObject);
    procedure prEngSB_WbuttonsMouseEnter(Sender: TObject);
    procedure prEngSB_WbuttonsMouseLeave(Sender: TObject);
    procedure prEngSB_WClearClick(Sender: TObject);
    procedure prEngSB_WDateClick(Sender: TObject);
    procedure prGroupBoxFileResize(Sender: TObject);
    procedure prGroupBox_SSfieldPropertyResize(Sender: TObject);
    procedure prListBoxFileClick(Sender: TObject);
    procedure prListBoxFileContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure prPageControlChange(Sender: TObject);
    procedure prPanelRefMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure prPanelRefMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure prPanelRefMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure prPPMenuGetFileDateClick(Sender: TObject);
    procedure prPPMenuGetRefDateClick(Sender: TObject);
    procedure prPPMenuItemRotateYES90Click(Sender: TObject);
    procedure prPPMenuItemRotateNO90Click(Sender: TObject);
    procedure prPPMenuCropClick(Sender: TObject);
    procedure prPanelRefDblClick(Sender: TObject);
    procedure prPPMenuDeleteClick(Sender: TObject);
    procedure prButtonCreateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure prEditCustomTitleKeyPress(Sender: TObject; var Key: char);
    procedure prRusImage_PSignPictureChanged(Sender: TObject);
    procedure rCheckBox_SelfClick(Sender: TObject);
    procedure prEngEdit_PNameChange(Sender: TObject);
    procedure prEngEdit_PAddressChange(Sender: TObject);
    procedure prEngEdit_PCityChange(Sender: TObject);
    procedure prEngEdit_PDateChange(Sender: TObject);
    procedure prEngEdit_PEmailChange(Sender: TObject);
    procedure prEngEdit_PPhoneChange(Sender: TObject);
    procedure prEngEdit_PZipCodeChange(Sender: TObject);
    procedure prEngEdit_WDateChange(Sender: TObject);
    procedure prEngImage_OSignDblClick(Sender: TObject);
    procedure prEngImage_PSignDblClick(Sender: TObject);
    procedure prEngImage_WSignDblClick(Sender: TObject);
    procedure prListBoxFileDblClick(Sender: TObject);
    procedure prListBoxFileDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure prListBoxFileDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure prListBoxFileMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure prListBoxFileSelectionChange(Sender: TObject; User: boolean);
    procedure prPPMenuResetClick(Sender: TObject);
    procedure prRusComboBox_OCountryChange(Sender: TObject);
    procedure prRusComboBox_PCountryChange(Sender: TObject);
    procedure prRusEdit_ODateChange(Sender: TObject);
    procedure prRusEdit_OEmailChange(Sender: TObject);
    procedure prRusEdit_OPhoneChange(Sender: TObject);
    procedure prRusEdit_OZipCodeChange(Sender: TObject);
    procedure prRusEdit_PAddressChange(Sender: TObject);
    procedure prRusEdit_PCityChange(Sender: TObject);
    procedure prRusEdit_PDateChange(Sender: TObject);
    procedure prRusEdit_PEmailChange(Sender: TObject);
    procedure prRusEdit_PNameChange(Sender: TObject);
    procedure prRusEdit_PPhoneChange(Sender: TObject);
    procedure prRusEdit_PZipCodeChange(Sender: TObject);
    procedure prRusEdit_WDateChange(Sender: TObject);
    procedure prRusImage_OSignDblClick(Sender: TObject);
    procedure prRusImage_PSignDblClick(Sender: TObject);
    procedure prRusImage_WSignDblClick(Sender: TObject);
    procedure prRusSB_ObuttonsMouseEnter(Sender: TObject);
    procedure prRusSB_ObuttonsMouseLeave(Sender: TObject);
    procedure mrRusSB_OClearClick(Sender: TObject);
    procedure prRusSB_OClearClick(Sender: TObject);
    procedure prRusSB_OCountryClick(Sender: TObject);
    procedure prRusSB_ODateClick(Sender: TObject);
    procedure prRusSB_OSignatureClick(Sender: TObject);
    procedure prRusSB_PbuttonsMouseEnter(Sender: TObject);
    procedure prRusSB_PbuttonsMouseLeave(Sender: TObject);
    procedure prRusSB_PClearClick(Sender: TObject);
    procedure prRusSB_PCountryClick(Sender: TObject);
    procedure prRusSB_PDateClick(Sender: TObject);
    procedure prRusSB_PSignatureClick(Sender: TObject);
    procedure prRusSB_WbuttonsMouseEnter(Sender: TObject);
    procedure prRusSB_WbuttonsMouseLeave(Sender: TObject);
    procedure mrRusSB_WClearClick(Sender: TObject);
    procedure prRusSB_WClearClick(Sender: TObject);
    procedure prRusSB_WDateClick(Sender: TObject);
    procedure prRusSB_WSignatureClick(Sender: TObject);
    procedure prSBrefPanelCollapseClick(Sender: TObject);
    procedure prSB_AddClick(Sender: TObject);
    procedure prEngSB_OCountryClick(Sender: TObject);
    procedure prEngSB_OSignatureClick(Sender: TObject);
    procedure prEngSB_PCountryClick(Sender: TObject);
    procedure prEngSB_PSignatureClick(Sender: TObject);
    procedure prEngSB_WSignatureClick(Sender: TObject);
    procedure prSpeedButtonFileDeleteClick(Sender: TObject);
    procedure prSpeedButtonFileClearClick(Sender: TObject);
    procedure prSpeedButtonFileClick(Sender: TObject);
    procedure OffVisible;
    procedure OnVisible;
    procedure DateFileToForm;
    procedure DateSketchToForm;
    procedure AllPrint;
    procedure mrRusPrint;
    procedure mrEngPrint;
    procedure prEngPrint;
    procedure prRusPrint;
    procedure RefPrint;
    procedure ReadData;
    procedure prSBDelAllReferencesClick(Sender: TObject);
    procedure rListBox_dbNameListMouseLeave(Sender: TObject);
    procedure rListBox_dbNameListSelectionChange(Sender: TObject; User: boolean);
    procedure rPanel1Click(Sender: TObject);
    procedure rPanelRefAREADblClick(Sender: TObject);
    procedure rSBformENGClick(Sender: TObject);
    procedure rSBformRefClick(Sender: TObject);
    procedure rSBformRUSClick(Sender: TObject);
    procedure TimerStartTimer(Sender: TObject);
    procedure WriteData;
    procedure UpdateMyF;
    procedure UpdateMyS;
    procedure MovingImage(Img: TImage);
    procedure RunPopupMenuRef(Img: TImage; Button: TMouseButton);
    function mrEngCheckErrorFormFields: boolean;
    function mrRusCheckErrorFormFields: boolean;
    function prEngCheckErrorFormFields: boolean;
    function prRusCheckErrorFormFields: boolean;
    procedure CreateMR;
    procedure CreatePR;
    procedure StartOptions;
    procedure FillStockSubmitterfields;
    procedure GetFileListData;
    procedure WhatFormUsed;
    procedure ifSelfOwner;
    procedure ShowPersonList(aSender: TObject);
    procedure FillBy_mrSB_dbPLoad(EngName: string);
    procedure FillBy_mrSB_dbOLoad(EngName: string);
    procedure FillBy_mrSB_dbWLoad(EngName: string);
    procedure FillBy_prSB_dbPLoad(EngName: string);
    procedure FillBy_prSB_dbOLoad(EngName: string);
    procedure FillBy_prSB_dbWLoad(EngName: string);
    procedure ClearStockSubmitterfieldsProperty;
    procedure ClearStockSubmitterfieldsModel;
    procedure PanelsHide;
    procedure PanelsShow_Model;
    procedure PanelsShow_Property;
    procedure PanelsResize_Model;
    procedure PanelsResize_Property;
    procedure mrAutoFill_MRname;


    procedure MyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MyMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HideEditByMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure EnterKeyPress(Sender: TObject; var Key: char);
    procedure EditMouseLeave(Sender: TObject);

  private
    { private declarations }
  public




    procedure MyMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure MyMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    { public declarations }
  end;

  myFile = Record
    fullFileName,
    FileNamePath,
    FileName,
    FileNameNoExt,
    Title                 : String;
    Date                  : TDateTime;
  end;

  mySketch = Record
    fullFileName          : String;
    Date                  : TDateTime;
  end;


var
  Captured : Boolean;
  Px,Py,yMin: Integer;
  Form1: TForm1;
  StartingPoint : TPoint;
  SysPath: string;
  myF: array of myFile;
  myS: array of mySketch;
  arrCountryComboBox: Array of TComboBox;
  prFileName: string;
  temporaryImg: Timage;
  FirstStarts: integer;
  Setting_DateFormat, Locale_DateFormat, Setting_DateSeparator: string;
  Pref,prssReleaseFilePath,prssReleaseName,mrssReleaseFilePath,mrssReleaseName: string;
  JpgQuality,JpgDimensions,aVertScroll: integer;
  bmpSave: TBitmap;
  mScrollBox: TScrollBox;

//resourcestring
const
  AppsName = 'StockRelease tool';
  AppsVersion = ' v0.1 (beta)';
  apliilamSite = 'http://apliilam.github.io/SRt';
  LicenseLink = 'https://raw.githubusercontent.com/apliilam/SRt/master/LICENSE';
  DonateLink = 'https://paypal.me/aliosporter';
  LengthReleaseName = 30;
  ModelAge = 18;

implementation

{$R *.lfm}

{ TForm1 }






procedure TForm1.StartOptions;
begin
  if (GetSystemMetrics(SM_CXSCREEN)<Form1.Width) or (GetSystemMetrics(SM_CYSCREEN)<Form1.Height) then  // проверка на разрешение экрана
    begin
      Left:=0;
      Top:=0;
      WindowState:=wsMaximized;
    end;
  Application.HintPause:= 50;
  Application.HintHidePause:=10240;
  Application.Title:=AppsName;

  SysPath:= ExtractFilePath(ParamStr(0))+'sys\';
  dbFile:=SysPath+'set.rlstl';
  CreateDataBase;
  Locale_DateFormat:= GetLocaleShortDate;

  prPanelRef.ControlStyle:= prPanelRef.ControlStyle+[csParentBackground];
  prListBoxFile.DragMode := dmAutomatic;
  prGroupBoxFile.Caption:=Trl_prGroupBoxFileCaption;
  prPageControl.TabIndex:=-1;
  SetCountryList;
  SetGenderToComboBox(mrComboBox__ssGender);
  SetEthnicityToComboBox(mrComboBox_ssEthnicity);

  prGroupBox_SSfieldProperty.Top:=328;
  prGroupBox_SSfieldProperty.Left:=8;
  mrGroupBox_SSfieldsModel.Top:=328;
  mrGroupBox_SSfieldsModel.Left:=8;

  bmpSave:= TBitmap.Create;
  bmpSave.PixelFormat:=pf24bit;

end;







////////////////////////////////////////////////
// StockSubmitter Section
procedure TForm1.ClearStockSubmitterfieldsModel;
var
  i: integer;
begin
  for i:=0 to mrGroupBox_SSfieldsModel.ControlCount-1 do
    begin
      if (mrGroupBox_SSfieldsModel.Controls[i] is TEdit) then
        (mrGroupBox_SSfieldsModel.Controls[i] as TEdit).Clear;
      if (mrGroupBox_SSfieldsModel.Controls[i] is TComboBox) then
        (mrGroupBox_SSfieldsModel.Controls[i] as TComboBox).ItemIndex:=0;
    end;
end;
procedure TForm1.ClearStockSubmitterfieldsProperty;
begin

end;
procedure FillFirstLastNAME(s: string);
var
  sList: TStringList;
  i: integer;
begin
  sList := TStringList.create;
  try
    sList.text:= stringReplace(s, ' ', LineEnding, [rfReplaceAll]);
    if sList.Count>1 then
      begin
        Form1.mrEdit_ssFirstName.Text:=sList.Strings[0];
        Form1.mrEdit_ssLastName.Text:=sList.Strings[1];
      end
    else
      begin
        Form1.mrEdit_ssFirstName.Text:='';
        Form1.mrEdit_ssLastName.Text:='';
      end;
  finally
    sList.free;
  end;
end;

procedure TForm1.FillStockSubmitterfields;
begin
  case GetPageName of
    'mr': ////////////////////////////// Model Release
      begin
        mrEdit_ssType.Text:='model';
        mrEdit_ssShootingDate.Text:=FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], mrEngEdit_PShootDate.Date);
        mrEdit_ssBirthDate.Text:=FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], mrEngEdit_ODateBirth.Date);
        mrEdit_ssCountry.Text:=mrEngComboBox_OCountry.Text;
        if mrEngEdit_OName.Text<>'' then
          begin
            FillFirstLastNAME(mrEngEdit_OName.Text);
            //mrComboBox__ssGender.ItemIndex:= mrComboBox__ssGender.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(mrEngEdit_OName.Text, 'EngGender'))));
            //mrComboBox_ssEthnicity.ItemIndex:= mrComboBox_ssEthnicity.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(mrEngEdit_OName.Text, 'EngEthnicity'))));
          end
        else
          begin
            mrComboBox__ssGender.ItemIndex:= 0;
            mrComboBox_ssEthnicity.ItemIndex:= 16;
          end;

      end;
    'mrm': ////////////////////////////// Model Release (minor)
      begin
        //mrEdit_ssType.Text:='model';

      end;
    'pr': ////////////////////////////// Property Release
      begin
        //ClearStockSubmitterfieldsProperty;
        prEdit_ssType.Text:='property';
        prEdit_ssShootingDate.Text:=FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], prEngEdit_ODate.Date);
        prEdit_ssName.Text:=prssReleaseName;
        prEdit_ssPropertyOwner.Text:=prEngEdit_OName.Text;
        prEdit_ssCountry.Text:=prEngComboBox_OCountry.Text;//prssCountry;
        //prEdit_ssModelPhoto.Text:=prssModelPhoto;
      end;
    'prA': //////////////////////////////
      begin

      end
    else
      begin

      end
    end;
end;

procedure TForm1.prGroupBox_SSfieldPropertyResize(Sender: TObject);
var
  kWidth: integer;
begin
  kWidth:=prGroupBox_SSfieldProperty.Width-prEdit_ssType.Left-10;
  prEdit_ssType.Width:=kWidth;
  prEdit_ssShootingDate.Width:=kWidth;
  prEdit_ssName.Width:=kWidth;
  prEdit_ssPropertyOwner.Width:=kWidth;
  prEdit_ssCountry.Width:=kWidth;
  prEdit_ssModelPhoto.Width:=kWidth-prBitBtn_ssModelPhoto.Width;
  prEdit_ssNote.Width:=kWidth;
  prBitBtn_ssModelPhoto.Left:=prEdit_ssModelPhoto.Left+prEdit_ssModelPhoto.Width;
end;
procedure TForm1.mrGroupBox_SSfieldsModelResize(Sender: TObject);
var
  kWidth: integer;
begin
  kWidth:=mrGroupBox_SSfieldsModel.Width-mrEdit_ssType.Left-10;
  mrEdit_ssType.Width:=kWidth;
  mrEdit_ssShootingDate.Width:=kWidth;
  mrEdit_ssFirstName.Width:=kWidth;
  mrEdit_ssLastName.Width:=kWidth;
  mrComboBox__ssGender.Width:=kWidth;
  mrEdit_ssBirthDate.Width:=kWidth;
  mrComboBox_ssEthnicity.Width:=kWidth;
  mrEdit_ssCountry.Width:=kWidth;
  mrEdit_ssModelPhoto.Width:=kWidth-mrBitBtn_ssModelPhoto.Width;
  mrEdit_ssNote.Width:=kWidth;
  mrBitBtn_ssModelPhoto.Left:=mrEdit_ssModelPhoto.Left+mrEdit_ssModelPhoto.Width;
end;


procedure TForm1.prBitBtn_ssModelPhotoClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_ModelPhoto';
  OpenDlg.Options:=[ofAutoPreview,ofFileMustExist];
  OpenDlg.Filter :='Only JPG-files|*.jpg';
  //OpenDlg.FilterIndex := 1;
  //OpenDlg.InitialDir := GetCurrentDir;
  try
    if OpenDlg.Execute then
      begin
        prEdit_ssModelPhoto.Text:=OpenDlg.FileName;
        FillStockSubmitterfields;
      end
    else
      begin
        prEdit_ssModelPhoto.Text:='';
        FillStockSubmitterfields;
      end;
  finally
    OpenDlg.Free;
  end;
end;
// StockSubmitter Section
////////////////////////////////////////////////


////////////////////////////////////////////////
// Drag&Drop for moving Controls by mouse
procedure TForm1.MyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
    begin
      Captured:=True;
      Px:=X; Py:=Y;
      (Sender as TImage).BringToFront;
    end;
end;
procedure TForm1.MyMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Captured then
    with Sender as TImage do
      begin
        Left:= Left-Px+X;
        Top:= Top-Py+Y;
      end;
  MovingImage(Sender as TImage);
end;
procedure TForm1.MyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Captured:= False;
  AllPrint;
  RunPopupMenuRef((Sender as TImage), Button);
end;

procedure TForm1.MovingImage(Img: TImage);
begin
  if Img.Parent=prPanelRef then
    begin
      if Img.Left<=0 then Img.Left:=1;
      if Img.Top<=0 then Img.Top:=1;
      if Img.Left>=prPanelRef.Width-Img.Width then
        Img.Left:=prPanelRef.Width-Img.Width-3;
      if Img.Top>=prPanelRef.Height-Img.Height then
        Img.Top:=prPanelRef.Height-Img.Height-4;
    end;
end;
// Drag&Drop for moving Controls by mouse
////////////////////////////////////////////////


////////////////////////////////////////////////
// for hide EditControls by mouse
procedure TForm1.HideEditByMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  ScrBox: TScrollBox;
  iEdit: TEdit;
  i: integer;
begin
  if not ((Sender as TImage).GetParentComponent is TScrollBox) then Exit
  else ScrBox:=((Sender as TImage).GetParentComponent as TScrollBox);
  for i:=0 to ScrBox.ControlCount-1 do
    begin
      if (ScrBox.Controls[i] is TEdit) then
        begin
          iEdit:=(ScrBox.Controls[i] as TEdit);

          if iEdit.Focused=false then
            begin
              if (X>=iEdit.Left) and (x<=iEdit.Width+iEdit.Left) and (Y>=iEdit.Top) and (Y<=iEdit.Height+iEdit.Top) then
                iEdit.Visible:=True
              else
                iEdit.Visible:=False;
            end;
        end;
    end;
end;
// for hide EditControls by mouse
////////////////////////////////////////////////

////////////////////////////////////////////////
// Resize TControl by mouse
procedure TForm1.MyMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  (Sender as TControl).Width:=(Sender as TControl).Width-20;
  (Sender as TControl).Height:= Proportional_TPictureToTImageSizeHeight((Sender as TImage).Picture, (Sender as TImage));
  AllPrint;
end;
procedure TForm1.MyMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if ((Sender as TControl).Width<prPanelRef.Width) and ((Sender as TControl).Height<prPanelRef.Height) then
    begin
  (Sender as TControl).Width:=(Sender as TControl).Width+20;
  (Sender as TControl).Height:= Proportional_TPictureToTImageSizeHeight((Sender as TImage).Picture, (Sender as TImage));
  AllPrint;
    end;
end;
// Resize TControl by mouse
////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
/// PopupMenu File
procedure TForm1.prPPMenuGetFileDateClick(Sender: TObject);
begin
  DateFileToForm;
end;
/// PopupMenu File
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
/// PopupMenu Ref
procedure TForm1.RunPopupMenuRef(Img: TImage; Button: TMouseButton);
begin
  if Img.Parent=prPanelRef then
    if Button = mbRight then
      begin
        temporaryImg:= Img;
        prPopupMenuRef.PopUp;
      end;
end;

procedure TForm1.prPPMenuCropClick(Sender: TObject);
begin
  GoToCropIMG(temporaryImg, Form2.prImageCrop);
  Form2.ShowModal;
end;

procedure TForm1.prPPMenuItemRotateYES90Click(Sender: TObject);
begin
  RotateBitmap90(temporaryImg.Picture.bitmap);
  RotateBitmap90(temporaryImg.Picture.bitmap);
  RotateBitmap90(temporaryImg.Picture.bitmap);
  RotateTImage(temporaryImg);
  AllPrint;
end;

procedure TForm1.prPPMenuItemRotateNO90Click(Sender: TObject);
begin
  RotateBitmap90(temporaryImg.Picture.bitmap);
  RotateTImage(temporaryImg);
  AllPrint;
end;

procedure TForm1.prPPMenuGetRefDateClick(Sender: TObject);
begin
  DateSketchToForm;
end;

procedure TForm1.prPPMenuResetClick(Sender: TObject);
begin
  temporaryImg.Picture.LoadFromFile(temporaryImg.HelpKeyword);
  SetSketchImgProperty(temporaryImg);
  UpdateMyS;
  AllPrint;
end;

procedure TForm1.prPPMenuDeleteClick(Sender: TObject);
begin
  temporaryImg.Free;
  UpdateMyS;
  PositionRefAreaPanel;
  AllPrint;
end;
/// PopupMenu Ref
////////////////////////////////////////////////////////////////////////////////


procedure TForm1.DateFileToForm;
var
  fDate: TDateTime;
  i: integer;
begin
  if prListBoxFile.SelCount=1 then
    begin
      i:= prListBoxFile.Items.IndexOf(prListBoxFile.GetSelectedText);
      fDate:= myF[i].Date;
      prEngEdit_PDate.Date:= fDate;
      AllPrint;
    end;
end;



procedure TForm1.UpdateMyF;   /// Update File List
var
  i: integer;
begin
  if prListBoxFile.Count<>0 then
    begin
      if prListBoxFile.Count>5 then
        begin
          Repeat
            prListBoxFile.Items.Delete(prListBoxFile.Count-1)
          until prListBoxFile.Count=5;
        Showmessage(Trl_CountFilesError_TooManyFiles+#10#13+'('+Trl_mustBeLessThan+IntToStr(5)+Trl__files+')');
        end;

      setlength(myF,0);
      Form3.Show;
      Form3.Repaint;
      Form3.prProgressBar.Max:=prListBoxFile.Count;
      setlength(myF,prListBoxFile.Count);
      for i:=0 to Length(myF)-1 do
        begin
          if FileExistsUTF8(prListBoxFile.Items.Strings[i]) then
            begin
              myF[i].fullFileName:= prListBoxFile.Items.Strings[i];
              myF[i].FileNamePath:= ExtractFilePath(prListBoxFile.Items.Strings[i]);
              myF[i].FileName:=ExtractFileName(prListBoxFile.Items.Strings[i]);
              myF[i].FileNameNoExt:= ChangeFileExt(ExtractFileName(prListBoxFile.Items.Strings[i]),'');
              ReadTitleFromFile(myF[i].fullFileName, myF[i].Title);
              myF[i].Date:= GetDateLastGhange(myF[i].fullFileName);

              if  myF[i].Title='' then myF[i].Title:=myF[i].FileNameNoExt; // при отсутствии Title берем из FileName
              Form3.prProgressBar.Position:=i+1;
            end
          else
            begin
              myF[i].fullFileName:= '';
              myF[i].FileNamePath:='';
              myF[i].FileName:='';
              myF[i].FileNameNoExt:=prListBoxFile.Items.Strings[i];
              myF[i].Title:=prListBoxFile.Items.Strings[i];
              myF[i].Date:=Today;
              Form3.prProgressBar.Position:=i+1;
            end;
        end;
      Form3.prProgressBar.Position:=0;
      Form3.Close;
      prListBoxFile.Selected[0]:=true;
      prEngEdit_PDate.Date:=myF[High(myF)].Date;
    end;
  prGroupBoxFile.Caption:=Trl_prGroupBoxFileCaption+' '+'('+IntToStr(prListBoxFile.Count)+')';
  prGroupBoxFile.Repaint;
end;

procedure TForm1.DateSketchToForm;
begin
  if prPanelRef.ControlCount>0 then
    begin
      prEngEdit_ODate.Date:= GetDateLastGhange(temporaryImg.HelpKeyword);
      AllPrint;
    end;
end;

procedure TForm1.UpdateMyS; /// Update Referense list
var
  i: integer;
begin
  setlength(myS,0);
  if prPanelRef.ControlCount>0 then
    begin
      setlength(myS,prPanelRef.ControlCount);
      for i:=0 to Length(myS)-1 do
        if FileExistsUTF8(prPanelRef.Controls[i].HelpKeyword) then
          begin
            myS[i].fullFileName:=prPanelRef.Controls[i].HelpKeyword;
            myS[i].Date:= GetDateLastGhange(myS[i].fullFileName);
          end;
      if rCheckBox_Self.Checked=false then
        begin
          if myS[High(myS)].Date<>NULL then
            prEngEdit_ODate.Date:=myS[High(myS)].Date
          else
            prEngEdit_ODate.Clear;
        end;
    end;
end;


////////////////////////////////////////////////////////////////////////////////
/// Form1
procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  WriteData;
  FreeandNil(bmpSave);
  MyPause(200);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TForm4, Form4);
  StartOptions;
  //showmessage('Wndows version '+IntToStr(GetWinVerMajor)+'.'+IntToStr(GetWinVerMinor));
  //showmessage(GetLocaleDateSeparator+#10#13+ConvertDateFormatToLocaleDateFormat('12.05.2001')+#10#13+GetLocaleShortDate);

  ////-> for moving controls by mouse
  Captured:= False;
  //prEngImage_OSign.OnMouseDown := @MyMouseDown;  ///Example
  //<-

end;

procedure TForm1.prEditCustomTitleKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then
    begin
      if (Length(prEditCustomTitle.Text)>0) then
        begin
          prListBoxFile.Items.Add(prEditCustomTitle.Text);
          UpdateMyF;
          AllPrint;
        end;
      prEditCustomTitle.Visible:=false;
      prEditCustomTitle.Clear;
    end;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  Application.Title:=AppsName;
  ReadData;
  FillStockSubmitterfields;
  AllPrint;
  prLabelSelFile.Caption:=ExtractFileName(prListBoxFile.GetSelectedText);
  if FirstStarts<>1 then
    begin  //при первом запуске
      if GetLocaleLanguage='ru' then
        Form4.rRadioButton_ru.Checked:=true
      else
        Form4.rRadioButton_en.Checked:=true;
      MenuSAbout.Click;
    end;
  TimerStart.Enabled:=true;
end;

procedure TForm1.MenuExitClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.MenuOptionsClick(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm1.MenuSDonateClick(Sender: TObject);
var
  ppMail,str: string;
begin
  ppMail:= 'apliilam@gmail.com';
  str:=Trl_DonationMessage1+' ('+ppMail+').'+#10#13+#10#13+Trl_DonationMessage3;
  if MessageDlg('Donation', str, mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    begin
      Clipboard.AsText:=ppMail;
      OpenLink(DonateLink);
    end;

end;

procedure TForm1.MenuSAboutClick(Sender: TObject);
var
  str: string;
begin
  if FileExistsUTF8(SysPath+'help.txt') then
    begin
      prMemoTemp.Lines.LoadFromFile(SysPath+'help.txt');
      //str:=SysToUTF8(prMemoTemp.Text); // file help.txt must be ANSI(for only win7 use)
      str:=prMemoTemp.Text;              // file help.txt must be UTF8(for win7,win10 use)
      showmessage(str);
    end
  else
    begin
      MessageBox(Self.Handle, PChar(Trl_FileNotFound), PChar(Trl_Error), MB_OK+MB_ICONERROR);
    end;
end;

procedure TForm1.MenuSLicenseClick(Sender: TObject);
begin
  OpenLink(LicenseLink);
end;

procedure TForm1.MenuSOnlineHelpClick(Sender: TObject);
begin
  OpenLink(apliilamSite);
end;

procedure TForm1.mrBitBtn_ssModelPhoto1Click(Sender: TObject);
begin
  //Form5.prEng_PhotographerFF;
end;

procedure TForm1.mrBitBtn_ssModelPhotoClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_ModelPhoto';
  OpenDlg.Options:=[ofAutoPreview,ofFileMustExist];
  OpenDlg.Filter :='Only JPG-files|*.jpg';
  //OpenDlg.FilterIndex := 1;
  //OpenDlg.InitialDir := GetCurrentDir;
  try
    if OpenDlg.Execute then
      begin
        mrEdit_ssModelPhoto.Text:=OpenDlg.FileName;
        FillStockSubmitterfields;
      end
    else
      begin
        mrEdit_ssModelPhoto.Text:='';
        FillStockSubmitterfields;
      end;
  finally
    OpenDlg.Free;
  end;
end;

procedure TForm1.mrCheckBox_autofillMRnameChange(Sender: TObject);
begin
  mrAutoFill_MRname;
end;

procedure TForm1.mrAutoFill_MRname;
begin
  if mrCheckBox_autofillMRname.Checked then
    mrEditCustomTitle.Caption:=mrEngEdit_OName.Caption+' ('+mrEngEdit_PShootDescription.Caption+')';
end;

procedure TForm1.mrEditCustomTitleChange(Sender: TObject);
begin
  if Length((Sender as TEdit).Text)=0 then mrssReleaseName:=''
  else mrssReleaseName:=(Sender as TEdit).Text+Pref;
end;

procedure TForm1.prCheckBoxCutPrName30Change(Sender: TObject);
begin
  GetFileListData;
  FillStockSubmitterfields;
  AllPrint;
end;

procedure TForm1.prCheckBox_NearlyChange(Sender: TObject);
begin
  GetFileListData;
  FillStockSubmitterfields;
  AllPrint;
end;

procedure TForm1.prCheckBox_OneReleasePerFileClick(Sender: TObject);
begin
  AllPrint;
end;

procedure TForm1.prListBoxFileClick(Sender: TObject);
begin
  prLabelSelFile.Caption:=ExtractFileName(prListBoxFile.GetSelectedText);
end;

procedure TForm1.prListBoxFileContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  if prListBoxFile.SelCount=1 then
    begin
      if FileExistsUTF8(prListBoxFile.GetSelectedText) then
        prPopupMenuFile.Items.Items[0].Caption:= Trl_GetFileDate
      else
        prPopupMenuFile.Items.Items[0].Caption:= Trl_GetCurrentDate;
      prPopupMenuFile.PopUp;
    end;
end;

procedure TForm1.prPageControlChange(Sender: TObject);
begin
  //mScrollBox:=FindScrollBoxMaster;

  //aVertScroll:=mScrollBox.VertScrollBar.ScrollPos;
  prPageControl.Enabled:=false;


  case GetPageName of
    'mr': ////////////////////////////// Model Release
      begin
        PanelsHide;
        prButtonCreate.Caption:=Trl_Create+' Model Release';
        rCheckBox_Self.Caption:=Trl_IamModelAndPhotographer;
        Pref:= 'MR';
        GetFileListData;
        if Form4.prCheckBoxUseSS_Compatibility.Checked then
          begin
            mrGroupBox_SSfieldsModel.Visible:=true;
            FillStockSubmitterfields;
          end;

        WhatFormUsed;
        PanelsResize_Model;
        PanelsShow_Model;
        prPPMenuGetRefDate.Visible:=false;
      end;
    'mrm': ////////////////////////////// Model Release (minor)
      begin
        prButtonCreate.Caption:=Trl_Create+' Model Release (minor)';
        rCheckBox_Self.Caption:=Trl_IamModelAndPhotographer;
        Pref:= 'MRm';
        GetFileListData;
        if Form4.prCheckBoxUseSS_Compatibility.Checked then
          begin
            mrGroupBox_SSfieldsModel.Visible:=true;
            FillStockSubmitterfields;
          end;

        WhatFormUsed;

      end;
    'pr': ////////////////////////////// Property Release
      begin
        PanelsHide;
        prButtonCreate.Caption:=Trl_Create+' Property Release';
        rCheckBox_Self.Caption:=Trl_IamOwnerAndPhotographer;
        Pref:= 'PR';
        GetFileListData;
        if Form4.prCheckBoxUseSS_Compatibility.Checked then
          begin
            prGroupBox_SSfieldProperty.Visible:=true;
            FillStockSubmitterfields;
          end;

        WhatFormUsed;
        PanelsResize_Property;
        PanelsShow_Property;
        prPPMenuGetRefDate.Visible:=true;
      end;
    'prA': ////////////////////////////// Property Release (OLD)
      begin
        Pref:= 'PRa';
        GetFileListData;
        if Form4.prCheckBoxUseSS_Compatibility.Checked then
          begin
            prGroupBox_SSfieldProperty.Visible:=true;
            FillStockSubmitterfields;
          end;

      end
    else
      begin

      end;
  end;

  AllPrint;
  prPageControl.Enabled:=true;
  //mScrollBox.VertScrollBar.Position:=aVertScroll;
end;

procedure TForm1.prPanelRefMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
    begin
      Captured:=True;
      Py:=Y;
      yMin:=GetMinHeightRefPanel;
    end;
end;

procedure TForm1.prPanelRefMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin                    // доделать Resize RefPanel
  if  rSBformRef.Tag=1 then
    begin
      if Y>(prPanelRef.Height-12) then
        prPanelRef.Cursor:=crSizeNS
      else prPanelRef.Cursor:=crHandPoint;

      if (Captured) and (prPanelRef.Cursor=crSizeNS) then
        with Sender as TPanel do
          begin
            Height:=Y;
            if Height<(yMin+10) then Height:=yMin+10;
            POSRefPaneltoPOSRefPanelAREA;
            ((Sender as TPanel).GetParentComponent as TScrollBox).Height:=Height+40;
            MyRepaint;
          end;
    end;
end;

procedure TForm1.prPanelRefMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Captured then
    begin
      Captured:= False;
      AllPrint;
    end;
end;


procedure TForm1.prPanelRefDblClick(Sender: TObject);
var
  i: integer;
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_Sketches';
  OpenDlg.Options:=[ofAllowMultiselect,ofAutoPreview,ofFileMustExist];
  OpenDlg.Filter :='Only Images|*.jpg;*.png;*.bmp';   //  'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      for i := 0 to OpenDlg.Files.Count -1 do
        AddSketchImgToForm(OpenDlg.Files.Strings[i]);
      UpdateMyS;
      AllPrint;
    end;
  OpenDlg.Free;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  AllPrint;
end;

procedure TForm1.WhatFormUsed;
var
  ScrollBoxChild,ScrollBoxMaster: TScrollBox;
  ImgChild: TImage;
  sbArr: Array of TSpeedButton;
  scrollArr,MasterScrollArr: Array of TScrollBox;
  imgArr: Array of TImage;
  i,j: integer;
begin
  /// заносим кнопки в arrow
  SetLength(sbArr,0);
  for i:=0 to Form1.prPanelLang.ControlCount-1 do
    if (prPanelLang.Controls[i] is TSpeedButton) then
      begin
        SetLength(sbArr,Length(sbArr)+1);
        sbArr[Length(sbArr)-1]:=(prPanelLang.Controls[i] as TSpeedButton);
      end;
  sbArr:=arrSort(sbArr);

  /// заносим scrollbox и image в arrows
  SetLength(scrollArr,0);
  SetLength(imgArr,0);
  ScrollBoxMaster:=FindScrollBoxMaster;
  for i:=0 to ScrollBoxMaster.ControlCount-1 do
    if (ScrollBoxMaster.Controls[i] is TScrollBox) then
    begin
      ScrollBoxChild:=ScrollBoxMaster.Controls[i] as TScrollBox;
      if Length(ScrollBoxChild.HelpKeyword)=3 then
        begin
          SetLength(scrollArr,Length(scrollArr)+1);
          SetLength(imgArr,Length(scrollArr)+1);
          scrollArr[Length(scrollArr)-1]:=ScrollBoxChild;

          for j:=0 to ScrollBoxChild.ControlCount-1 do
            begin
              if (ScrollBoxChild.Controls[j] is TImage) then
                begin
                  ImgChild:=ScrollBoxChild.Controls[j] as TImage;
                  if (ImgChild.HelpKeyword)=(ScrollBoxChild.HelpKeyword) then
                    imgArr[Length(scrollArr)-1]:=ImgChild;
                end;
            end;
        end;
    end;

  //////////////////
  SetLength(MasterScrollArr,3);
  MasterScrollArr[0]:=mrScrollBox;
  MasterScrollArr[1]:=mrmScrollBox;
  MasterScrollArr[2]:=prScrollBox;
  ALLFormTurnOff(MasterScrollArr);

  /////////////////////


  for i:=0 to High(sbArr) do
    begin
      for j:=0 to High(scrollArr) do
        begin
          if sbArr[i].HelpKeyword=scrollArr[j].HelpKeyword then
            begin
              if sbArr[i].Flat then
                FormTurnOff(ScrollBoxMaster,scrollArr[j],0)
              else
                begin
                  if imgArr[j].HelpKeyword='Ref' then
                    begin
                      FormTurnOn(ScrollBoxMaster,scrollArr[j],prPanelRef.Height+50);
                      RefPanelToActiveForm(scrollArr[j]);
                    end
                  else
                    begin
                      FormTurnOn(ScrollBoxMaster,scrollArr[j],imgArr[j].Picture.Height);
                    end;
                end;
            end;
        end;
    end;
end;

procedure TForm1.rSBformENGClick(Sender: TObject);
begin
  SetLangButtonTag(Sender as TSpeedButton);
  WhatFormUsed;
  AllPrint;
end;

procedure TForm1.rSBformRUSClick(Sender: TObject);
begin
  SetLangButtonTag(Sender as TSpeedButton);
  WhatFormUsed;
  AllPrint;
end;

procedure TForm1.rSBformRefClick(Sender: TObject);
begin
  SetLangButtonTag(Sender as TSpeedButton);
  WhatFormUsed;
  AllPrint;
end;


procedure TForm1.TimerStartTimer(Sender: TObject);
begin
  Application.MainForm.Caption:=GetAppsCaption;
  Application.Title:=GetAppsCaption;
  prPageControlChange(prPageControl);
  (Sender as TTimer).Enabled:=false;
end;


procedure TForm1.PanelsHide;
begin
  mrGroupBoxFile.Visible:=false;
  mrGroupBox_SSfieldsModel.Visible:=false;

  prGroupBoxFile.Visible:=false;
  prGroupBox_SSfieldProperty.Visible:=false;
  prCheckBox_OneReleasePerFile.Visible:=false;
  prCheckBox_Nearly.Visible:=false;
end;

procedure TForm1.PanelsShow_Model;
begin
  mrGroupBoxFile.Visible:=true;
  if Form4.prCheckBoxUseSS_Compatibility.Checked then
    mrGroupBox_SSfieldsModel.Visible:=true;
end;
procedure TForm1.PanelsShow_Property;
begin
  prGroupBoxFile.Visible:=true;
  prCheckBox_OneReleasePerFile.Visible:=true;
  prCheckBox_Nearly.Visible:=true;
  if Form4.prCheckBoxUseSS_Compatibility.Checked then
    prGroupBox_SSfieldProperty.Visible:=true;
end;


procedure TForm1.PanelsResize_Model;
var
  Wpanels,k: integer;
begin
  k:= 7;
  Wpanels:=prPageControl.Left-2*k;

  mrGroupBoxFile.Width:=Wpanels;
  mrGroupBoxFile.Left:=k;
  mrGroupBoxFile.Top:=3*k;

  rPanel1.Width:=Wpanels;
  rPanel1.Height:=40;
  rPanel1.Left:=k;
  rPanel1.Top:=mrGroupBoxFile.Top+mrGroupBoxFile.Height+k;

    rCheckBox_Self.Left:=k+1;
    rCheckBox_Self.Top:=k;

  mrGroupBox_SSfieldsModel.Width:=Wpanels;
  mrGroupBox_SSfieldsModel.Left:=k;
  mrGroupBox_SSfieldsModel.Top:=rPanel1.Top+rPanel1.Height+2*k;

  prButtonCreate.Left:=prPageControl.Left-prButtonCreate.Width-2*k;
  if mrGroupBox_SSfieldsModel.Visible then
    prButtonCreate.Top:=mrGroupBox_SSfieldsModel.Top+mrGroupBox_SSfieldsModel.Height+2*k
  else
    prButtonCreate.Top:=rPanel1.Top+rPanel1.Height+2*k;
end;

procedure TForm1.PanelsResize_Property;
var
  Wpanels,k,r: integer;
begin
  k:= 7;
  Wpanels:=prPageControl.Left-2*k;

  prGroupBoxFile.Width:=Wpanels;
  prGroupBoxFile.Left:=k;
  prGroupBoxFile.Top:=3*k;

  rPanel1.Width:=Wpanels;
  rPanel1.Height:=70;
  rPanel1.Left:=k;
  rPanel1.Top:=prGroupBoxFile.Top+prGroupBoxFile.Height+k;

    r:=k+1;
    prCheckBox_OneReleasePerFile.Left:=r;
    prCheckBox_OneReleasePerFile.Top:=k;
    rCheckBox_Self.Left:=r;
    rCheckBox_Self.Top:=prCheckBox_OneReleasePerFile.Top+prCheckBox_OneReleasePerFile.Height;
    prCheckBox_Nearly.Left:=r;
    prCheckBox_Nearly.Top:=rCheckBox_Self.Top+rCheckBox_Self.Height;

  prGroupBox_SSfieldProperty.Width:=Wpanels;
  prGroupBox_SSfieldProperty.Left:=k;
  prGroupBox_SSfieldProperty.Top:=rPanel1.Top+rPanel1.Height+2*k;

  prButtonCreate.Left:=prPageControl.Left-prButtonCreate.Width-2*k;
  if prGroupBox_SSfieldProperty.Visible then
    prButtonCreate.Top:=prGroupBox_SSfieldProperty.Top+prGroupBox_SSfieldProperty.Height+2*k
  else
    prButtonCreate.Top:=rPanel1.Top+rPanel1.Height+2*k;
end;



procedure TForm1.FormResize(Sender: TObject);
var
  k,Wmin,Hmin,W2,H2: Integer;
begin
  k:= 7;
  Wmin:= 465+prScrollBox.Width+2*k;
  Hmin:= prButtonCreate.Top+prButtonCreate.Height+prStatusBar.Height+2*k;
  W2:= Form1.Width;
  H2:= Form1.Height;

  prStatusBar.Panels.Items[2].Width:=prPageControl.Left-
                                     prStatusBar.Panels.Items[0].Width-
                                     prStatusBar.Panels.Items[1].Width;
  if W2<Wmin then
    Form1.Width:= Wmin;
  if H2<Hmin then
    Form1.Height:= Hmin;

  prPanelLang.Top:=prPageControl.Top+25;
  prPanelLang.Left:=prPageControl.Left+5;

  case GetPageName of
    'mr': ////////////////////////////// Model Release
      begin
        PanelsResize_Model;
      end;
    'mrm': ////////////////////////////// Model Release (minor)
      begin

      end;
    'pr': ////////////////////////////// Property Release
      begin
        PanelsResize_Property;
      end;
    'prA': ////////////////////////////// Temp
      begin

      end
    else ////////////////////////////
      begin

      end
    end;
end;
                                 /////////////////////mgm

procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of String);
var
  i: Integer;
  p: TPoint;
begin
  GetCursorPos(p);
  if FindDragTarget(p, True) is TListbox then   // drop to Listbox
    begin
      for i := Low(FileNames) to High(FileNames) do
        if (ExtractFileExt(FileNames[i])='.jpg') or
           (ExtractFileExt(FileNames[i])='.JPG') then
             if (FindDragTarget(p, True) as TListbox).Count<40 then
               prListBoxFile.Items.Add(FileNames[i]);
      UpdateMyF;
      AllPrint;
    end;
  if FindDragTarget(p, True) is TPanel then     // drop to Panel
    begin
      Form3.Show;
      Form3.Repaint;
      Form3.prProgressBar.Max:=Length(FileNames);
      for i := Low(FileNames) to High(FileNames) do
        begin
        if (ExtractFileExt(FileNames[i])='.jpg') or
           (ExtractFileExt(FileNames[i])='.JPG') or
           (ExtractFileExt(FileNames[i])='.png') or
           (ExtractFileExt(FileNames[i])='.PNG') or
           (ExtractFileExt(FileNames[i])='.bmp') or
           (ExtractFileExt(FileNames[i])='.BMP') then
            AddSketchImgToForm(FileNames[i]);
        Form3.prProgressBar.Position:=i+1;
        end;
      UpdateMyS;
      AllPrint;
      Form3.prProgressBar.Position:=0;
      Form3.Close;
      PositionRefAreaPanel;
    end;
end;


procedure TForm1.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ScrollDown;
end;

procedure TForm1.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ScrollUp;
end;

/// Form1
////////////////////////////////////////////////////////////////////////////////
procedure TForm1.prGroupBoxFileResize(Sender: TObject);
begin
  prListBoxFile.Width:= prGroupBoxFile.Width-20;
  prEditCustomTitle.Width:= prGroupBoxFile.Width-20;
end;

function TForm1.mrEngCheckErrorFormFields: boolean;
begin
  result:=false;
  if (Length(mrEngEdit_PName.Text)=0)             or
     (Length(mrEngEdit_PAddress.Text)=0)          or
     (Length(mrEngEdit_PCity.Text)=0)             or
     (Length(mrEngEdit_PState.Text)=0)            or
     (mrEngComboBox_PCountry.ItemIndex<1)         or
     (Length(mrEngEdit_PZipCode.Text)=0)          or
     (Length(mrEngEdit_PPhone.Text)=0)            or
     (Length(mrEngEdit_PEmail.Text)=0)            or

     (Length(mrEngEdit_PShootLocation.Text)=0)    or
     (Length(mrEngEdit_PShootDescription.Text)=0) or

     (Length(mrEngEdit_OName.Text)=0)             or
     (Length(mrEngEdit_OAddress.Text)=0)          or
     (Length(mrEngEdit_OCity.Text)=0)             or
     (Length(mrEngEdit_OState.Text)=0)            or
     (mrEngComboBox_OCountry.ItemIndex<1)         or
     (Length(mrEngEdit_OZipCode.Text)=0)          or
     (Length(mrEngEdit_OPhone.Text)=0)            or
     (Length(mrEngEdit_OEmail.Text)=0)            or
     (Length(mrEngEdit_WName.Text)=0)             then result:=true;
end;
function TForm1.mrRusCheckErrorFormFields: boolean;
begin
  result:=false;
  if (Length(mrRusEdit_PName.Text)=0)             or
     (Length(mrRusEdit_PName2.Text)=0)            or
     (Length(mrRusEdit_PAddress.Text)=0)          or
     (Length(mrRusEdit_PCity.Text)=0)             or
     (Length(mrRusEdit_PState.Text)=0)            or
     (mrRusComboBox_PCountry.ItemIndex<1)         or
     (Length(mrRusEdit_PZipCode.Text)=0)          or
     (Length(mrRusEdit_PPhone.Text)=0)            or
     (Length(mrRusEdit_PEmail.Text)=0)            or
     (Length(mrRusEdit_OName.Text)=0)             or
     (Length(mrRusEdit_OAddress.Text)=0)          or
     (Length(mrRusEdit_OCity.Text)=0)             or
     (Length(mrRusEdit_OState.Text)=0)            or
     (mrRusComboBox_OCountry.ItemIndex<1)         or
     (Length(mrRusEdit_OZipCode.Text)=0)          or
     (Length(mrRusEdit_OPhone.Text)=0)            or
     (Length(mrRusEdit_OEmail.Text)=0)            or
     (Length(mrRusEdit_WName.Text)=0)             then result:=true;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Showmessage(IntToStr(YearsBetween(mrEngEdit_PShootDate.Date, mrEngEdit_ODateBirth.Date)));
end;

procedure TForm1.CreateMR;
var
  SavePicDlg: TSavePictureDialog;
begin
  ///проверка на имя релиза

  if Length(mrEditCustomTitle.Text)=0 then
    begin
      MessageBox(Self.Handle, PChar(Trl_YouNeedNameReleaseFile), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

  ///если ENG форма вкл
  if rSBformENG.Flat=false then
    begin
      //проверка на пустые поля
      if mrEngCheckErrorFormFields then
        begin
          MessageBox(Self.Handle, PChar(Trl_YouMustFillAllFields+' (ENG)'), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
          Exit;
        end;
      //проверка на наличие подписей
      if Form4.rCheckBox_UseSignature.Checked then
        begin
          if rSBformENG.Flat=false then
            if (mrEngImage_PSign.Picture.Graphic=nil)       or
               (mrEngImage_OSign.Picture.Graphic=nil)       or
               (mrEngImage_WSign.Picture.Graphic=nil)       then
              begin
                MessageBox(Self.Handle, PChar(Trl_UploadSignatureFile+' (ENG)'), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
                Exit;
              end;
        end;
    end;
  ///если RUS форма вкл
  if rSBformRUS.Flat=false then
    begin
      //проверка на пустые поля
      if mrRusCheckErrorFormFields then
        begin
          MessageBox(Self.Handle, PChar(Trl_YouMustFillAllFields+' (RUS)'), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
          Exit;
        end;
      //проверка на наличие подписей
      if Form4.rCheckBox_UseSignature.Checked then
        begin
          if rSBformRUS.Flat=false then
            if (mrRusImage_PSign.Picture.Graphic=nil)       or
               (mrRusImage_OSign.Picture.Graphic=nil)       or
               (mrRusImage_WSign.Picture.Graphic=nil)       then
              begin
                MessageBox(Self.Handle, PChar(Trl_UploadSignatureFile+' (RUS)'), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
                Exit;
              end;
        end;
    end;



  ////Использование Дат на форме
  if Form4.rCheckBox_UseDate.Checked then
    begin
      ///проверка возраста модели (ShootingDate > DateBirth ... ModelAge)
      If YearsBetween(mrEngEdit_PShootDate.Date, mrEngEdit_ODateBirth.Date)<ModelAge then
        begin
          Showmessage(Trl_ModelMustBeAnAdult);
          Exit;
        end;
      ///сверка даты (ModelDate > ShootingDate)
      If mrEngEdit_ODate.Date<mrEngEdit_PShootDate.Date then
        begin
          Showmessage(Trl_ModelDateCanNotBeEarlierShootDate);
          Exit;
        end;
      ///сверка даты (Photographer > Model)
      If mrEngEdit_PDate.Date<mrEngEdit_ODate.Date then
        begin
          Showmessage(Trl_PhotographerDateCanNotBeEarlierModelDate);
          Exit;
        end;
      ///сверка даты (Witness > Photographer)
      If mrEngEdit_WDate.Date<mrEngEdit_PDate.Date then
        begin
          Showmessage(Trl_WitnessDateCanNotBeEarlierPhotographerDate);
          Exit;
        end;
    end;



  ///добавлены ли скетчи
  if rSBformRef.Flat=false then
    if prPanelRef.ControlCount=0 then
      if MessageDlg(Trl_Confirmation, Trl_SketchesHasNotBeenAdded+#10#13+Trl_ContinueQ, mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;


  try
    SavePicDlg:= TSavePictureDialog.Create(self);
    SavePicDlg.Name:='SavePictureDialog_ModelRelease';
    SavePicDlg.Options:=[ofEnableSizing,ofViewDetail];
    SavePicDlg.Filter :='JPG image file only|*.jpg';
    SavePicDlg.FileName:=mrssReleaseName;

    if SavePicDlg.Execute then
      begin
        mrssReleaseFilePath:=SavePicDlg.FileName;
        if FileExistsUTF8(mrssReleaseFilePath) then
          begin
            if MessageDlg(Trl_Confirmation, Trl_File_+'"'+mrssReleaseFilePath+'"'+Trl__AlreadyExistsDot+#10#13+Trl_OverwriteFileQ, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                BitmapUnion;
                SaveBitmapToJPG(bmpSave, mrssReleaseFilePath, JpgQuality);
                MessageBox(Self.Handle, PChar(Trl_ReleaseFileCreated), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
              end;
          end
        else
          begin
            BitmapUnion;
            SaveBitmapToJPG(bmpSave, mrssReleaseFilePath, JpgQuality);
            MessageBox(Self.Handle, PChar(Trl_ReleaseFileCreated), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
          end;
        //for StockSubmitter
        FillStockSubmitterfields;
        WriteUserComment(Form4.prCheckBoxUseSS_Compatibility.Checked, mrssReleaseFilePath);
      end;
  finally
    SavePicDlg.Free;
  end;
  if Form4.prCheckBoxCopyPrName.Checked=true then Clipboard.AsText:=mrssReleaseName;
end;


function TForm1.prEngCheckErrorFormFields: boolean;
begin
  result:=false;
  if (Length(prEngEdit_PName.Text)=0)             or
     (Length(prEngEdit_PAddress.Text)=0)          or
     (Length(prEngEdit_PCity.Text)=0)             or
     (prEngComboBox_PCountry.ItemIndex<1)         or
     (Length(prEngEdit_PZipCode.Text)=0)          or
     (Length(prEngEdit_PPhone.Text)=0)            or
     (Length(prEngEdit_PEmail.Text)=0)            or
     (Length(prEngEdit_OName.Text)=0)             or
     (Length(prEngEdit_OAddress.Text)=0)          or
     (Length(prEngEdit_OCity.Text)=0)             or
     (prEngComboBox_OCountry.ItemIndex<1)         or
     (Length(prEngEdit_OZipCode.Text)=0)          or
     (Length(prEngEdit_OPhone.Text)=0)            or
     (Length(prEngEdit_OEmail.Text)=0)            or
     (Length(prEngEdit_WName.Text)=0)             then result:=true;
end;
function TForm1.prRusCheckErrorFormFields: boolean;
begin
  result:=false;
  if (Length(prRusEdit_PName.Text)=0)             or
     (Length(prRusEdit_PName2.Text)=0)            or
     (Length(prRusEdit_PAddress.Text)=0)          or
     (Length(prRusEdit_PCity.Text)=0)             or
     (prRusComboBox_PCountry.ItemIndex<1)         or
     (Length(prRusEdit_PZipCode.Text)=0)          or
     (Length(prRusEdit_PPhone.Text)=0)            or
     (Length(prRusEdit_PEmail.Text)=0)            or
     (Length(prRusEdit_OName.Text)=0)             or
     (Length(prRusEdit_OAddress.Text)=0)          or
     (Length(prRusEdit_OCity.Text)=0)             or
     (prRusComboBox_OCountry.ItemIndex<1)         or
     (Length(prRusEdit_OZipCode.Text)=0)          or
     (Length(prRusEdit_OPhone.Text)=0)            or
     (Length(prRusEdit_OEmail.Text)=0)            or
     (Length(prRusEdit_WName.Text)=0)             then result:=true;
end;


procedure TForm1.CreatePR;
var
  SavePicDlg: TSavePictureDialog;
  SelDirDlg: TSelectDirectoryDialog;
  i: integer;
begin
  ///добавлены ли файлы в листбокс
  if prListBoxFile.Count=0 then
    begin
      MessageBox(Self.Handle, PChar(Trl_YouNeedAddFileToList), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

  ///если ENG форма вкл
  if rSBformENG.Flat=false then
    begin
      //проверка на пустые поля
      if prEngCheckErrorFormFields then
        begin
          MessageBox(Self.Handle, PChar(Trl_YouMustFillAllFields+' (ENG)'), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
          Exit;
        end;
      //проверка на наличие подписей
      if Form4.rCheckBox_UseSignature.Checked then
        begin
          if rSBformENG.Flat=false then
            if (prEngImage_PSign.Picture.Graphic=nil)       or
               (prEngImage_OSign.Picture.Graphic=nil)       or
               (prEngImage_WSign.Picture.Graphic=nil)       then
              begin
                MessageBox(Self.Handle, PChar(Trl_UploadSignatureFile+' (ENG)'), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
                Exit;
              end;
        end;
    end;
  ///если RUS форма вкл
  if rSBformRUS.Flat=false then
    begin
      //проверка на пустые поля
      if prRusCheckErrorFormFields then
        begin
          MessageBox(Self.Handle, PChar(Trl_YouMustFillAllFields+' (RUS)'), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
          Exit;
        end;
      //проверка на наличие подписей
      if Form4.rCheckBox_UseSignature.Checked then
        begin
          if rSBformRUS.Flat=false then
            if (prRusImage_PSign.Picture.Graphic=nil)       or
               (prRusImage_OSign.Picture.Graphic=nil)       or
               (prRusImage_WSign.Picture.Graphic=nil)       then
              begin
                MessageBox(Self.Handle, PChar(Trl_UploadSignatureFile+' (RUS)'), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
                Exit;
              end;
        end;
    end;


  ////Использование Дат на форме
  if Form4.rCheckBox_UseDate.Checked then
    begin
      ///сверка даты Photographer>Owner
      If prEngEdit_PDate.Date<prEngEdit_ODate.Date then
        begin
          Showmessage(Trl_PhotographerDateCanNotBeEarlierOwnerDate);
          Exit;
        end;
      ///сверка даты Witness>Photographer
      If prEngEdit_WDate.Date<prEngEdit_PDate.Date then
        begin
          Showmessage(Trl_WitnessDateCanNotBeEarlierPhotographerDate);
          Exit;
        end;
    end;


  ///добавлены ли скетчи
  if rSBformRef.Flat=false then
    if prPanelRef.ControlCount=0 then
      if MessageDlg(Trl_Confirmation, Trl_SketchesHasNotBeenAdded+#10#13+Trl_ContinueQ, mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;


  if prCheckBox_OneReleasePerFile.Checked=true then   /// if one release per one file
    begin
      SelDirDlg:=TSelectDirectoryDialog.Create(self);
      SelDirDlg.InitialDir:=GetCurrentDir;
      if SelDirDlg.Execute then
        for i:=0 to prListBoxFile.Count-1 do
          begin
            prListBoxFile.Selected[i]:=true;
            prssReleaseFilePath:=SelDirDlg.FileName+'\'+prssReleaseName+'.jpg';
            if FileExistsUTF8(prssReleaseFilePath) then
              begin
                if MessageDlg(Trl_Confirmation, Trl_File_+'"'+prssReleaseName+'.jpg'+'"'+Trl__AlreadyExistsDot+#10#13+Trl_OverwriteFileQ, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                  begin
                    BitmapUnion;
                    SaveBitmapToJPG(bmpSave, prssReleaseFilePath, JpgQuality);
                  end;
              end
            else
              begin
                BitmapUnion;
                SaveBitmapToJPG(bmpSave, prssReleaseFilePath, JpgQuality);
              end;
            //for StockSubmitter
            FillStockSubmitterfields;
            WriteUserComment(Form4.prCheckBoxUseSS_Compatibility.Checked, prssReleaseFilePath);
          end;
      FreeAndNil(SelDirDlg);
    end
  else  /// if all files from list - one release
    begin
      if prListBoxFile.SelCount=1 then
        i:=prListBoxFile.Items.IndexOf(prListBoxFile.GetSelectedText);
      if (prCheckBox_Nearly.Checked=true) and (Length(myF[i].FileNamePath)>1) then
         begin
           prssReleaseFilePath:=myF[i].FileNamePath+prssReleaseName+'.jpg';
           if FileExistsUTF8(prssReleaseFilePath) then
             begin
               if MessageDlg(Trl_Confirmation, Trl_File_+'"'+prssReleaseName+'.jpg'+'"'+Trl__AlreadyExistsDot+#10#13+Trl_OverwriteFileQ, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                 begin
                   BitmapUnion;
                   SaveBitmapToJPG(bmpSave, prssReleaseFilePath, JpgQuality);
                   MessageBox(Self.Handle, PChar(Trl_ReleaseFileCreated), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
                 end;
             end
           else
             begin
               BitmapUnion;
               SaveBitmapToJPG(bmpSave, prssReleaseFilePath, JpgQuality);
               MessageBox(Self.Handle, PChar(Trl_ReleaseFileCreated), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
             end;
           //for StockSubmitter
           FillStockSubmitterfields;
           WriteUserComment(Form4.prCheckBoxUseSS_Compatibility.Checked, prssReleaseFilePath);
         end
      else
        begin
          SavePicDlg:= TSavePictureDialog.Create(self);
          SavePicDlg.Name:='SavePictureDialog_PropertyRelease';
          SavePicDlg.Options:=[ofEnableSizing,ofViewDetail];
          SavePicDlg.Filter :='JPG image file only|*.jpg';
          SavePicDlg.FileName:=prssReleaseName;

          if SavePicDlg.Execute then
            begin
              prssReleaseFilePath:=SavePicDlg.FileName;
              if FileExistsUTF8(prssReleaseFilePath) then
                begin
                  if MessageDlg(Trl_Confirmation, Trl_File_+'"'+prssReleaseFilePath+'"'+Trl__AlreadyExistsDot+#10#13+Trl_OverwriteFileQ, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                    begin
                      BitmapUnion;
                      SaveBitmapToJPG(bmpSave, prssReleaseFilePath, JpgQuality);
                      MessageBox(Self.Handle, PChar(Trl_ReleaseFileCreated), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
                    end;
                end
              else
                begin
                  BitmapUnion;
                  SaveBitmapToJPG(bmpSave, prssReleaseFilePath, JpgQuality);
                  MessageBox(Self.Handle, PChar(Trl_ReleaseFileCreated), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
                end;
              prssReleaseName:=ChangeFileExt(ExtractFileName(prssReleaseFilePath),'');
              //for StockSubmitter
              FillStockSubmitterfields;
              WriteUserComment(Form4.prCheckBoxUseSS_Compatibility.Checked, prssReleaseFilePath);
            end;
          SavePicDlg.Free;
        end;
      if Form4.prCheckBoxCopyPrName.Checked=true then Clipboard.AsText:=prssReleaseName;
    end;
end;

procedure TForm1.prButtonCreateClick(Sender: TObject);
begin
  AllPrint;
  //включена ли хоть одна из форм (ENG, RUS)
  if (rSBformENG.Flat) and (rSBformRUS.Flat) then
    begin
      MessageBox(Self.Handle, PChar(Trl_TurnOnForm), PChar(Trl_Information), MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

  case GetPageName of
    'mr': ////////////////////////////// Model Release
      begin
        CreateMR;
      end;
    'mrm': ////////////////////////////// Model Release (minor)
      begin

      end;
    'pr': ////////////////////////////// Property Release
      begin
        CreatePR;
      end;
    'prA': ////////////////////////////// Temp
      begin

      end
    else ////////////////////////////
      begin

      end
    end;
end;


procedure TForm1.rCheckBox_SelfClick(Sender: TObject);
begin
  ifSelfOwner;
  AllPrint;
end;

procedure TForm1.ifSelfOwner;
begin
  if rCheckBox_Self.Checked then
    begin
      mrEngSB_Obuttons.Enabled:=false;
      mrRusSB_Obuttons.Enabled:=false;
      prEngSB_Obuttons.Enabled:=false;
      prRusSB_Obuttons.Enabled:=false;

      ///mrEng
      mrEngEdit_OName.Text:=mrEngEdit_PName.Text;
      mrEngEdit_OAddress.Text:=mrEngEdit_PAddress.Text;
      mrEngEdit_OCity.Text:=mrEngEdit_PCity.Text;
      mrEngEdit_OState.Text:=mrEngEdit_PState.Text;
      mrEngComboBox_OCountry.ItemIndex:=mrEngComboBox_PCountry.ItemIndex;
      mrEngEdit_OZipCode.Text:=mrEngEdit_PZipCode.Text;
      mrEngEdit_OPhone.Text:=mrEngEdit_PPhone.Text;
      mrEngEdit_OEmail.Text:=mrEngEdit_PEmail.Text;
      mrEngEdit_ODate.Date:=mrEngEdit_PDate.Date;
      //
      mrEngEdit_OName.Enabled:=false;
      mrEngEdit_OAddress.Enabled:=false;
      mrEngEdit_OCity.Enabled:=false;
      mrEngEdit_OState.Enabled:=false;
      mrEngSB_OCountry.Visible:=false;
      mrEngEdit_OZipCode.Enabled:=false;
      mrEngEdit_OPhone.Enabled:=false;
      mrEngEdit_OEmail.Enabled:=false;
      mrEngSB_OSignature.Enabled:=false;
      if Form4.rCheckBox_UseSignature.Checked then
        if FileExistsUTF8(mrEngImage_PSign.HelpKeyword) then
          begin
            mrEngImage_OSign.HelpKeyword:=mrEngImage_PSign.HelpKeyword;
            mrEngImage_OSign.Picture.LoadFromFile(mrEngImage_OSign.HelpKeyword);
          end
        else
          begin
            mrEngImage_OSign.HelpKeyword:='';
            mrEngImage_OSign.Picture.Clear;
          end;
      dbGetDate('person', 'EngName', mrEngEdit_PName.Text, 'EngDateBirth', mrEngEdit_ODateBirth);

      ///mrRus
      mrRusEdit_OName.Text:=mrRusEdit_PName.Text;
      mrRusEdit_OAddress.Text:=mrRusEdit_PAddress.Text;
      mrRusEdit_OCity.Text:=mrRusEdit_PCity.Text;
      mrRusEdit_OState.Text:=mrRusEdit_PState.Text;
      mrRusComboBox_OCountry.ItemIndex:=mrRusComboBox_PCountry.ItemIndex;
      mrRusEdit_OZipCode.Text:=mrRusEdit_PZipCode.Text;
      mrRusEdit_OPhone.Text:=mrRusEdit_PPhone.Text;
      mrRusEdit_OEmail.Text:=mrRusEdit_PEmail.Text;
      mrRusEdit_ODate.Date:=mrRusEdit_PDate.Date;
      mrRusEdit_OName.Enabled:=false;
      mrRusEdit_OAddress.Enabled:=false;
      //
      mrRusEdit_OCity.Enabled:=false;
      mrRusEdit_OState.Enabled:=false;
      mrRusSB_OCountry.Visible:=false;
      mrRusEdit_OZipCode.Enabled:=false;
      mrRusEdit_OPhone.Enabled:=false;
      mrRusEdit_OEmail.Enabled:=false;
      mrRusSB_OSignature.Enabled:=false;
      if Form4.rCheckBox_UseSignature.Checked then
        if FileExistsUTF8(mrRusImage_PSign.HelpKeyword) then
          begin
            mrRusImage_OSign.HelpKeyword:=mrRusImage_PSign.HelpKeyword;
            mrRusImage_OSign.Picture.LoadFromFile(mrRusImage_OSign.HelpKeyword);
          end
        else
          begin
            mrRusImage_OSign.HelpKeyword:='';
            mrRusImage_OSign.Picture.Clear;
          end;

      ///prEng
      prEngEdit_OName.Text:=prEngEdit_PName.Text;
      prEngEdit_OAddress.Text:=prEngEdit_PAddress.Text;
      prEngEdit_OCity.Text:=prEngEdit_PCity.Text;
      prEngComboBox_OCountry.ItemIndex:=prEngComboBox_PCountry.ItemIndex;
      prEngEdit_OZipCode.Text:=prEngEdit_PZipCode.Text;
      prEngEdit_OPhone.Text:=prEngEdit_PPhone.Text;
      prEngEdit_OEmail.Text:=prEngEdit_PEmail.Text;
      prEngEdit_ODate.Date:=prEngEdit_PDate.Date;
      //
      prEngEdit_OName.Enabled:=false;
      prEngEdit_OAddress.Enabled:=false;
      prEngEdit_OCity.Enabled:=false;
      prEngSB_OCountry.Visible:=false;
      prEngEdit_OZipCode.Enabled:=false;
      prEngEdit_OPhone.Enabled:=false;
      prEngEdit_OEmail.Enabled:=false;
      prEngSB_OSignature.Enabled:=false;
      if Form4.rCheckBox_UseSignature.Checked then
        if FileExistsUTF8(prEngImage_PSign.HelpKeyword) then
          begin
            prEngImage_OSign.HelpKeyword:=prEngImage_PSign.HelpKeyword;
            prEngImage_OSign.Picture.LoadFromFile(prEngImage_OSign.HelpKeyword);
          end
        else
          begin
            prEngImage_OSign.HelpKeyword:='';
            prEngImage_OSign.Picture.Clear;
          end;

      ///prRus
      prRusEdit_OName.Text:=prRusEdit_PName.Text;
      prRusEdit_OAddress.Text:=prRusEdit_PAddress.Text;
      prRusEdit_OCity.Text:=prRusEdit_PCity.Text;
      prRusComboBox_OCountry.ItemIndex:=prRusComboBox_PCountry.ItemIndex;
      prRusEdit_OZipCode.Text:=prRusEdit_PZipCode.Text;
      prRusEdit_OPhone.Text:=prRusEdit_PPhone.Text;
      prRusEdit_OEmail.Text:=prRusEdit_PEmail.Text;
      prRusEdit_ODate.Date:=prRusEdit_PDate.Date;
      prRusEdit_OName.Enabled:=false;
      prRusEdit_OAddress.Enabled:=false;
      //
      prRusEdit_OCity.Enabled:=false;
      prRusSB_OCountry.Visible:=false;
      prRusEdit_OZipCode.Enabled:=false;
      prRusEdit_OPhone.Enabled:=false;
      prRusEdit_OEmail.Enabled:=false;
      prRusSB_OSignature.Enabled:=false;
      if Form4.rCheckBox_UseSignature.Checked then
        if FileExistsUTF8(prRusImage_PSign.HelpKeyword) then
          begin
            prRusImage_OSign.HelpKeyword:=prRusImage_PSign.HelpKeyword;
            prRusImage_OSign.Picture.LoadFromFile(prRusImage_OSign.HelpKeyword);
          end
        else
          begin
            prRusImage_OSign.HelpKeyword:='';
            prRusImage_OSign.Picture.Clear;
          end;
    end
  else
    begin
      mrEngSB_Obuttons.Enabled:=true;
      mrRusSB_Obuttons.Enabled:=true;
      prEngSB_Obuttons.Enabled:=true;
      prRusSB_Obuttons.Enabled:=true;

      ///mrEng
      mrEngEdit_OName.Enabled:=true;
      mrEngEdit_OAddress.Enabled:=true;
      mrEngEdit_OCity.Enabled:=true;
      mrEngEdit_OState.Enabled:=true;
      mrEngSB_OCountry.Visible:=true;
      mrEngEdit_OZipCode.Enabled:=true;
      mrEngEdit_OPhone.Enabled:=true;
      mrEngEdit_OEmail.Enabled:=true;
      mrEngSB_OSignature.Enabled:=true;
      ///mrRus
      mrRusEdit_OName.Enabled:=true;
      mrRusEdit_OAddress.Enabled:=true;
      mrRusEdit_OCity.Enabled:=true;
      mrRusEdit_OState.Enabled:=true;
      mrRusSB_OCountry.Visible:=true;
      mrRusEdit_OZipCode.Enabled:=true;
      mrRusEdit_OPhone.Enabled:=true;
      mrRusEdit_OEmail.Enabled:=true;
      mrRusSB_OSignature.Enabled:=true;

      ///prEng
      prEngEdit_OName.Enabled:=true;
      prEngEdit_OAddress.Enabled:=true;
      prEngEdit_OCity.Enabled:=true;
      prEngSB_OCountry.Visible:=true;
      prEngEdit_OZipCode.Enabled:=true;
      prEngEdit_OPhone.Enabled:=true;
      prEngEdit_OEmail.Enabled:=true;
      prEngSB_OSignature.Enabled:=true;
      ///prRus
      prRusEdit_OName.Enabled:=true;
      prRusEdit_OAddress.Enabled:=true;
      prRusEdit_OCity.Enabled:=true;
      prRusSB_OCountry.Visible:=true;
      prRusEdit_OZipCode.Enabled:=true;
      prRusEdit_OPhone.Enabled:=true;
      prRusEdit_OEmail.Enabled:=true;
      prRusSB_OSignature.Enabled:=true;
    end;
end;


////////////////////////////////
/// File(s) Controls


///////////////////////////////////////
// DragDrop for ListBox
procedure TForm1.prListBoxFileDragDrop(Sender, Source: TObject; X, Y: Integer) ;
var
   DropPosition, StartPosition: Integer;
   DropPoint: TPoint;
begin
   DropPoint.X:= X;
   DropPoint.Y:= Y;
   with Source as TListBox do
   begin
     StartPosition:= ItemAtPos(StartingPoint,True);
     DropPosition:= ItemAtPos(DropPoint,True);
     Items.Move(StartPosition, DropPosition);
   end;
   UpdateMyF;
   AllPrint;
end;
procedure TForm1.prListBoxFileDragOver(Sender, Source: TObject;
    X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=Source=prListBoxFile;
end;
procedure TForm1.prListBoxFileMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   StartingPoint.X:=X;
   StartingPoint.Y:=Y;
end;
// DragDrop for ListBox
//////////////////////////////////////////


procedure TForm1.prListBoxFileDblClick(Sender: TObject);
begin
  DateFileToForm;
end;


procedure TForm1.GetFileListData;
var
   i:integer;
begin
  if prListBoxFile.SelCount=1 then
    begin
      prLabelSelFile.Caption:=ExtractFileName(prListBoxFile.GetSelectedText);
      i:= prListBoxFile.Items.IndexOf(prListBoxFile.GetSelectedText);
      prssReleaseName:=CutStringUpTo(myF[i].FileNameNoExt,LengthReleaseName-Length(Pref))+Pref;

      if (DirectoryExistsUTF8(myF[i].FileNamePath)) and (prCheckBox_Nearly.Checked) then
        prssReleaseFilePath:= myF[i].FileNamePath+prssReleaseName+'.jpg'
      else
        prssReleaseFilePath:='';
    end;
end;

procedure TForm1.prListBoxFileSelectionChange(Sender: TObject; User: boolean);
begin
  GetFileListData;
  FillStockSubmitterfields;
  AllPrint;
end;

procedure TForm1.prSpeedButtonFileClick(Sender: TObject);
var
  i: integer;
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_Files1';
  OpenDlg.Options:=[ofAllowMultiselect,ofAutoPreview,ofFileMustExist];
  OpenDlg.Filter :='Only JPG-files|*.jpg';   //  'Image files only|*.jpg;*.png';
  //OpenDlg.FilterIndex := 1;
  //OpenDlg.InitialDir := GetCurrentDir;

  if OpenDlg.Execute then
    begin
      for i := 0 to OpenDlg.Files.Count -1 do
        if prListBoxFile.Count<6 then
          prListBoxFile.Items.Add(OpenDlg.Files.Strings[i]);
      UpdateMyF;
      //prListBoxFile.Selected[0]:=true;
      AllPrint;
    end;
  OpenDlg.Free;
end;

procedure TForm1.prSpeedButtonFileClearClick(Sender: TObject);
begin
  prListBoxFile.Clear;
  prLabelSelFile.Caption:='';
  UpdateMyF;
  AllPrint;
end;

procedure TForm1.prSpeedButtonFileDeleteClick(Sender: TObject);
var
  n:integer;
begin
  if prListBoxFile.Count<>0 then
    if prListBoxFile.SelCount > 0 then
      begin
        n:=prListBoxFile.Items.IndexOf(prListBoxFile.GetSelectedText);
        prListBoxFile.Items.Delete(n);

        if prListBoxFile.Count>0 then
          if prListBoxFile.Count>n then
            prListBoxFile.Selected[n]:=true
          else
            if (prListBoxFile.Count=n) then
              prListBoxFile.Selected[n-1]:=true;

        prLabelSelFile.Caption:=ExtractFileName(prListBoxFile.GetSelectedText);
        UpdateMyF;
        AllPrint;
      end;
end;

procedure TForm1.prSB_AddClick(Sender: TObject);
begin
  prEditCustomTitle.Visible:=true;
  prEditCustomTitle.SetFocus;
end;

///File(s) Controls
/////////////////////////////////////////////////



////////////////////////////////
/// Sketch Controls
procedure TForm1.prSBDelAllReferencesClick(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to prPanelRef.ControlCount-1 do
    (prPanelRef.Controls[0]).Free;
  UpdateMyS;
  PositionRefAreaPanel;
  AllPrint;
end;

procedure TForm1.prSBrefPanelCollapseClick(Sender: TObject);
begin
  prPanelRef.Height:=GetMinHeightRefPanel;
  POSRefPaneltoPOSRefPanelAREA;
  prPageControlChange(Sender);
end;

procedure TForm1.rPanelRefAREADblClick(Sender: TObject);
begin
  prPanelRef.OnDblClick(prPanelRef);
  PositionRefAreaPanel;
end;
///Sketch Controls
/////////////////////////////////////////////////


procedure TForm1.ReadData;
begin
  if FileExistsUTF8(dbFile) then
    try
      if sqldb.TableExists('options') then
        begin
          FirstStarts:=StrToInt(dbGetOptions('FirstStarts'));
          prPageControl.ActivePageIndex:= GetPageIndex(dbGetOptions('ReleaseIndex'));

          rSBformENG.Flat:=StrToBool(dbGetOptions('rSBformENGFlat'));
          rSBformRUS.Flat:=StrToBool(dbGetOptions('rSBformRUSFlat'));
          rSBformRef.Flat:=StrToBool(dbGetOptions('rSBformRefFlat'));
          rSBformENG.Tag:= StrToInt(dbGetOptions('rSBformENGTag'));
          rSBformRUS.Tag:= StrToInt(dbGetOptions('rSBformRUSTag'));
          rSBformRef.Tag:= StrToInt(dbGetOptions('rSBformRefTag'));
          Form4.prCheckBoxUseSS_Compatibility.Checked:=StrToBool(dbGetOptions('SS_Compatibility'));
          Form4.prCheckBoxCopyPrName.Checked:=StrToBool(dbGetOptions('prCheckBoxCopyPrName'));
          prCheckBox_OneReleasePerFile.Checked:=StrToBool(dbGetOptions('OneReleasePerFile'));
          prCheckBox_Nearly.Checked:=StrToBool(dbGetOptions('Nearly'));
          rCheckBox_Self.Checked:=StrToBool(dbGetOptions('SelfOwner'));
          Form4.rRadioButton_en.Checked:=StrToBool(dbGetOptions('RadioButton_en'));
          Form4.rRadioButton_ru.Checked:=StrToBool(dbGetOptions('RadioButton_ru'));
          Form4.rComboBoxDateFormat.ItemIndex:= StrToInt(dbGetOptions('FormDateFormat'));
          Form4.rTrackBar_jpgQuality.Position:= StrToInt(dbGetOptions('JpgQuality'));
          Form4.rTrackBar_jpgDimension.Position:= StrToInt(dbGetOptions('jpgWDimension'));
          Form4.rCheckBox_UseSignature.Checked:=StrToBool(dbGetOptions('UseSignature'));
          Form4.rCheckBox_UseDate.Checked:=StrToBool(dbGetOptions('UseDate'));
          mrCheckBox_autofillMRname.Checked:=StrToBool(dbGetOptions('mrCheckBox_autofillMRname'));
        end;
      if sqldb.TableExists('formfields') then
        begin
        ///// mrENG
          mrEngEdit_PName.Text:=dbGetFormFields('mrENG', 'Pname');
          mrEngEdit_PAddress.Text:=dbGetFormFields('mrENG', 'Paddress');
          mrEngEdit_PCity.Text:=dbGetFormFields('mrENG', 'Pcity');
          mrEngEdit_PState.Text:=dbGetFormFields('mrENG', 'PState');
          mrEngComboBox_PCountry.ItemIndex:= mrEngComboBox_PCountry.Items.IndexOfObject(TObject(StrToInt(dbGetFormFields('mrENG', 'Pcountry'))));
          mrEngEdit_PZipCode.Text:=dbGetFormFields('mrENG', 'Pzip');
          mrEngEdit_PPhone.Text:=dbGetFormFields('mrENG', 'Pphone');
          mrEngEdit_PEmail.Text:=dbGetFormFields('mrENG', 'Pemail');
          dbGetDate('formfields', 'form', 'mrENG', 'Pdate', mrEngEdit_PDate);
          dbLoadSignature('formfields', 'form', 'mrENG', 'Psignature', mrEngImage_PSign);
          mrEngImage_PSign.Left:=StrToInt(dbGetFormFields('mrENG', 'PSignatureLeft'));
          mrEngImage_PSign.Top:=StrToInt(dbGetFormFields('mrENG', 'PSignatureTop'));
          mrEngEdit_OName.Text:=dbGetFormFields('mrENG', 'Oname');
          mrEngEdit_OAddress.Text:=dbGetFormFields('mrENG', 'OAddress');
          mrEngEdit_OCity.Text:=dbGetFormFields('mrENG', 'Ocity');
          mrEngEdit_OState.Text:=dbGetFormFields('mrENG', 'OState');
          mrEngComboBox_OCountry.ItemIndex:= mrEngComboBox_OCountry.Items.IndexOfObject(TObject(StrToInt(dbGetFormFields('mrENG', 'Ocountry'))));
          mrEngEdit_OZipCode.Text:=dbGetFormFields('mrENG', 'Ozip');
          mrEngEdit_OPhone.Text:=dbGetFormFields('mrENG', 'OPhone');
          mrEngEdit_OEmail.Text:=dbGetFormFields('mrENG', 'Oemail');
          dbGetDate('formfields', 'form', 'mrENG', 'Odate', mrEngEdit_ODate);
          dbGetDate('formfields', 'form', 'mrENG', 'ODateBirth', mrEngEdit_ODateBirth);
          dbLoadSignature('formfields', 'form', 'mrENG', 'Osignature', mrEngImage_OSign);
          mrEngImage_OSign.Left:=StrToInt(dbGetFormFields('mrENG', 'OSignatureLeft'));
          mrEngImage_OSign.Top:=StrToInt(dbGetFormFields('mrENG', 'OSignatureTop'));
          mrEngEdit_WName.Text:=dbGetFormFields('mrENG', 'Wname');
          dbGetDate('formfields', 'form', 'mrENG', 'Wdate', mrEngEdit_WDate);
          dbLoadSignature('formfields', 'form', 'mrENG', 'Wsignature', mrEngImage_WSign);
          mrEngImage_WSign.Left:=StrToInt(dbGetFormFields('mrENG', 'WSignatureLeft'));
          mrEngImage_WSign.Top:=StrToInt(dbGetFormFields('mrENG', 'WSignatureTop'));

          mrEngEdit_PShootLocation.Text:=dbGetFormFields('mrENG', 'PShootLocation');
          mrEngEdit_PShootDescription.Text:=dbGetFormFields('mrENG', 'PShootDescription');
          dbGetDate('formfields', 'form', 'mrENG', 'PShootDate', mrEngEdit_PShootDate);
          mrEdit_ssNote.Text:=dbGetFormFields('mrENG', 'ssNote');
          mrEdit_ssModelPhoto.Text:=dbGetFormFields('mrENG', 'ssModelPhotoPath');
          mrComboBox__ssGender.ItemIndex:= mrComboBox__ssGender.Items.IndexOfObject(TObject(StrToInt(dbGetFormFields('mrENG', 'OGender'))));
          mrComboBox_ssEthnicity.ItemIndex:= mrComboBox_ssEthnicity.Items.IndexOfObject(TObject(StrToInt(dbGetFormFields('mrENG', 'OEthnicity'))));

        ///// mrRUS
          mrRusEdit_PName.Text:=dbGetFormFields('mrRUS', 'Pname');
          mrRusEdit_PName2.Text:=dbGetFormFields('mrRUS', 'Pname2');
          mrRusEdit_PAddress.Text:=dbGetFormFields('mrRUS', 'Paddress');
          mrRusEdit_PCity.Text:=dbGetFormFields('mrRUS', 'Pcity');
          mrRusEdit_PState.Text:=dbGetFormFields('mrRUS', 'PState');
          mrRusComboBox_PCountry.ItemIndex:= mrRusComboBox_PCountry.Items.IndexOfObject(TObject(StrToInt(dbGetFormFields('mrRUS', 'Pcountry'))));
          mrRusEdit_PZipCode.Text:=dbGetFormFields('mrRUS', 'Pzip');
          mrRusEdit_PPhone.Text:=dbGetFormFields('mrRUS', 'Pphone');
          mrRusEdit_PEmail.Text:=dbGetFormFields('mrRUS', 'Pemail');
          dbGetDate('formfields', 'form', 'mrRUS', 'Pdate', mrRusEdit_PDate);
          dbLoadSignature('formfields', 'form', 'mrRUS', 'Psignature', mrRusImage_PSign);
          mrRusImage_PSign.Left:=StrToInt(dbGetFormFields('mrRUS', 'PSignatureLeft'));
          mrRusImage_PSign.Top:=StrToInt(dbGetFormFields('mrRUS', 'PSignatureTop'));
          mrRusEdit_OName.Text:=dbGetFormFields('mrRUS', 'Oname');
          mrRusEdit_OAddress.Text:=dbGetFormFields('mrRUS', 'OAddress');
          mrRusEdit_OCity.Text:=dbGetFormFields('mrRUS', 'Ocity');
          mrRusEdit_OState.Text:=dbGetFormFields('mrRUS', 'OState');
          mrRusComboBox_OCountry.ItemIndex:= mrRusComboBox_OCountry.Items.IndexOfObject(TObject(StrToInt(dbGetFormFields('mrRUS', 'Ocountry'))));
          mrRusEdit_OZipCode.Text:=dbGetFormFields('mrRUS', 'Ozip');
          mrRusEdit_OPhone.Text:=dbGetFormFields('mrRUS', 'OPhone');
          mrRusEdit_OEmail.Text:=dbGetFormFields('mrRUS', 'Oemail');
          dbGetDate('formfields', 'form', 'mrRUS', 'Odate', mrRusEdit_ODate);
          dbLoadSignature('formfields', 'form', 'mrRUS', 'Osignature', mrRusImage_OSign);
          mrRusImage_OSign.Left:=StrToInt(dbGetFormFields('mrRUS', 'OSignatureLeft'));
          mrRusImage_OSign.Top:=StrToInt(dbGetFormFields('mrRUS', 'OSignatureTop'));
          mrRusEdit_WName.Text:=dbGetFormFields('mrRUS', 'Wname');
          dbGetDate('formfields', 'form', 'mrRUS', 'Wdate', mrRusEdit_WDate);
          dbLoadSignature('formfields', 'form', 'mrRUS', 'Wsignature', mrRusImage_WSign);
          mrRusImage_WSign.Left:=StrToInt(dbGetFormFields('mrRUS', 'WSignatureLeft'));
          mrRusImage_WSign.Top:=StrToInt(dbGetFormFields('mrRUS', 'WSignatureTop'));

        ///// prENG
          prEngEdit_PName.Text:=dbGetFormFields('prENG', 'Pname');
          prEngEdit_PAddress.Text:=dbGetFormFields('prENG', 'Paddress');
          prEngEdit_PCity.Text:=dbGetFormFields('prENG', 'Pcity');
          prEngComboBox_PCountry.ItemIndex:= prEngComboBox_PCountry.Items.IndexOfObject(TObject(StrToInt(dbGetFormFields('prENG', 'Pcountry'))));
          prEngEdit_PZipCode.Text:=dbGetFormFields('prENG', 'Pzip');
          prEngEdit_PPhone.Text:=dbGetFormFields('prENG', 'Pphone');
          prEngEdit_PEmail.Text:=dbGetFormFields('prENG', 'Pemail');
          dbGetDate('formfields', 'form', 'prENG', 'Pdate', prEngEdit_PDate);
          dbLoadSignature('formfields', 'form', 'prENG', 'Psignature', prEngImage_PSign);
          prEngImage_PSign.Left:=StrToInt(dbGetFormFields('prENG', 'PSignatureLeft'));
          prEngImage_PSign.Top:=StrToInt(dbGetFormFields('prENG', 'PSignatureTop'));
          prEngEdit_OName.Text:=dbGetFormFields('prENG', 'Oname');
          prEngEdit_OAddress.Text:=dbGetFormFields('prENG', 'OAddress');
          prEngEdit_OCity.Text:=dbGetFormFields('prENG', 'Ocity');
          prEngComboBox_OCountry.ItemIndex:= prEngComboBox_OCountry.Items.IndexOfObject(TObject(StrToInt(dbGetFormFields('prENG', 'Ocountry'))));
          prEngEdit_OZipCode.Text:=dbGetFormFields('prENG', 'Ozip');
          prEngEdit_OPhone.Text:=dbGetFormFields('prENG', 'OPhone');
          prEngEdit_OEmail.Text:=dbGetFormFields('prENG', 'Oemail');
          dbGetDate('formfields', 'form', 'prENG', 'Odate', prEngEdit_ODate);
          dbLoadSignature('formfields', 'form', 'prENG', 'Osignature', prEngImage_OSign);
          prEngImage_OSign.Left:=StrToInt(dbGetFormFields('prENG', 'OSignatureLeft'));
          prEngImage_OSign.Top:=StrToInt(dbGetFormFields('prENG', 'OSignatureTop'));
          prEngEdit_WName.Text:=dbGetFormFields('prENG', 'Wname');
          dbGetDate('formfields', 'form', 'prENG', 'Wdate', prEngEdit_WDate);
          dbLoadSignature('formfields', 'form', 'prENG', 'Wsignature', prEngImage_WSign);
          prEngImage_WSign.Left:=StrToInt(dbGetFormFields('prENG', 'WSignatureLeft'));
          prEngImage_WSign.Top:=StrToInt(dbGetFormFields('prENG', 'WSignatureTop'));
          prEdit_ssNote.Text:=dbGetFormFields('prENG', 'ssNote');
          prEdit_ssModelPhoto.Text:=dbGetFormFields('prENG', 'ssModelPhotoPath');

        ///// prRUS
          prRusEdit_PName.Text:=dbGetFormFields('prRUS', 'Pname');
          prRusEdit_PName2.Text:=dbGetFormFields('prRUS', 'Pname2');
          prRusEdit_PAddress.Text:=dbGetFormFields('prRUS', 'Paddress');
          prRusEdit_PCity.Text:=dbGetFormFields('prRUS', 'Pcity');
          prRusComboBox_PCountry.ItemIndex:= prRusComboBox_PCountry.Items.IndexOfObject(TObject(StrToInt(dbGetFormFields('prRUS', 'Pcountry'))));
          prRusEdit_PZipCode.Text:=dbGetFormFields('prRUS', 'Pzip');
          prRusEdit_PPhone.Text:=dbGetFormFields('prRUS', 'Pphone');
          prRusEdit_PEmail.Text:=dbGetFormFields('prRUS', 'Pemail');
          dbGetDate('formfields', 'form', 'prRUS', 'Pdate', prRusEdit_PDate);
          dbLoadSignature('formfields', 'form', 'prRUS', 'Psignature', prRusImage_PSign);
          prRusImage_PSign.Left:=StrToInt(dbGetFormFields('prRUS', 'PSignatureLeft'));
          prRusImage_PSign.Top:=StrToInt(dbGetFormFields('prRUS', 'PSignatureTop'));
          prRusEdit_OName.Text:=dbGetFormFields('prRUS', 'Oname');
          prRusEdit_OAddress.Text:=dbGetFormFields('prRUS', 'OAddress');
          prRusEdit_OCity.Text:=dbGetFormFields('prRUS', 'Ocity');
          prRusComboBox_OCountry.ItemIndex:= prRusComboBox_OCountry.Items.IndexOfObject(TObject(StrToInt(dbGetFormFields('prRUS', 'Ocountry'))));
          prRusEdit_OZipCode.Text:=dbGetFormFields('prRUS', 'Ozip');
          prRusEdit_OPhone.Text:=dbGetFormFields('prRUS', 'OPhone');
          prRusEdit_OEmail.Text:=dbGetFormFields('prRUS', 'Oemail');
          dbGetDate('formfields', 'form', 'prRUS', 'Odate', prRusEdit_ODate);
          dbLoadSignature('formfields', 'form', 'prRUS', 'Osignature', prRusImage_OSign);
          prRusImage_OSign.Left:=StrToInt(dbGetFormFields('prRUS', 'OSignatureLeft'));
          prRusImage_OSign.Top:=StrToInt(dbGetFormFields('prRUS', 'OSignatureTop'));
          prRusEdit_WName.Text:=dbGetFormFields('prRUS', 'Wname');
          dbGetDate('formfields', 'form', 'prRUS', 'Wdate', prRusEdit_WDate);
          dbLoadSignature('formfields', 'form', 'prRUS', 'Wsignature', prRusImage_WSign);
          prRusImage_WSign.Left:=StrToInt(dbGetFormFields('prRUS', 'WSignatureLeft'));
          prRusImage_WSign.Top:=StrToInt(dbGetFormFields('prRUS', 'WSignatureTop'));
        end;

      dbGetPersonNameList(rListBox_dbNameList, Form4.rComboBox_dbNameList);
    finally

    end;
    if FileExistsUTF8(prEdit_ssModelPhoto.Text)=false then prEdit_ssModelPhoto.Text:='';
    if FileExistsUTF8(mrEdit_ssModelPhoto.Text)=false then mrEdit_ssModelPhoto.Text:='';

    FillStockSubmitterfields;
end;

procedure TForm1.WriteData;
begin
  if FileExistsUTF8(dbFile) then
    try
      sqldb.BeginTransaction;

      if sqldb.TableExists('options') then
        begin
          dbUpdOptions('FirstStarts', IntToStr(1));
          dbUpdOptions('ReleaseIndex', prPageControl.ActivePage.Name);
          dbUpdOptions('rSBformENGFlat', BoolToStr(rSBformENG.Flat));
          dbUpdOptions('rSBformRUSFlat', BoolToStr(rSBformRUS.Flat));
          dbUpdOptions('rSBformRefFlat', BoolToStr(rSBformRef.Flat));
          dbUpdOptions('rSBformENGTag', IntToStr(rSBformENG.Tag));
          dbUpdOptions('rSBformRUSTag', IntToStr(rSBformRUS.Tag));
          dbUpdOptions('rSBformRefTag', IntToStr(rSBformRef.Tag));
          dbUpdOptions('SS_Compatibility', BoolToStr(Form4.prCheckBoxUseSS_Compatibility.Checked));
          dbUpdOptions('prCheckBoxCopyPrName', BoolToStr(Form4.prCheckBoxCopyPrName.Checked));
          dbUpdOptions('OneReleasePerFile', BoolToStr(prCheckBox_OneReleasePerFile.Checked));
          dbUpdOptions('Nearly', BoolToStr(prCheckBox_Nearly.Checked));
          dbUpdOptions('SelfOwner', BoolToStr(rCheckBox_Self.Checked));
          dbUpdOptions('RadioButton_en', BoolToStr(Form4.rRadioButton_en.Checked));
          dbUpdOptions('RadioButton_ru', BoolToStr(Form4.rRadioButton_ru.Checked));
          dbUpdOptions('FormDateFormat', IntToStr(Form4.rComboBoxDateFormat.ItemIndex));
          dbUpdOptions('JpgQuality', IntToStr(Form4.rTrackBar_jpgQuality.Position));
          dbUpdOptions('jpgWDimension', IntToStr(Form4.rTrackBar_jpgDimension.Position));
          dbUpdOptions('UseSignature', BoolToStr(Form4.rCheckBox_UseSignature.Checked));
          dbUpdOptions('UseDate', BoolToStr(Form4.rCheckBox_UseDate.Checked));
          dbUpdOptions('mrCheckBox_autofillMRname', BoolToStr(mrCheckBox_autofillMRname.Checked));
        end;
      if sqldb.TableExists('formfields') then
        begin
        ///// mrENG
          dbUpdFormFields('mrENG', 'Pname', mrEngEdit_PName.Text);
          dbUpdFormFields('mrENG', 'Paddress', mrEngEdit_PAddress.Text);
          dbUpdFormFields('mrENG', 'Pcity', mrEngEdit_PCity.Text);
          dbUpdFormFields('mrENG', 'PState', mrEngEdit_PState.Text);
          dbUpdFormFields('mrENG', 'Pcountry', IntToStr(Integer(mrEngComboBox_PCountry.Items.Objects[mrEngComboBox_PCountry.ItemIndex])));
          dbUpdFormFields('mrENG', 'Pzip', mrEngEdit_PZipCode.Text);
          dbUpdFormFields('mrENG', 'Pphone', mrEngEdit_PPhone.Text);
          dbUpdFormFields('mrENG', 'Pemail', mrEngEdit_PEmail.Text);
          dbUpdFormFields('mrENG', 'Pdate', ConvertToSettingDateFormat(mrEngEdit_PDate.Date));
          dbUpdFormFields('mrENG', 'Psignature', mrEngImage_PSign.HelpKeyword);
          dbUpdFormFields('mrENG', 'PSignatureLeft', IntToStr(mrEngImage_PSign.Left));
          dbUpdFormFields('mrENG', 'PSignatureTop', IntToStr(mrEngImage_PSign.Top));
          dbUpdFormFields('mrENG', 'Oname', mrEngEdit_OName.Text);
          dbUpdFormFields('mrENG', 'Oaddress', mrEngEdit_OAddress.Text);
          dbUpdFormFields('mrENG', 'Ocity', mrEngEdit_OCity.Text);
          dbUpdFormFields('mrENG', 'OState', mrEngEdit_OState.Text);
          dbUpdFormFields('mrENG', 'Ocountry', IntToStr(Integer(mrEngComboBox_OCountry.Items.Objects[mrEngComboBox_OCountry.ItemIndex])));
          dbUpdFormFields('mrENG', 'Ozip', mrEngEdit_OZipCode.Text);
          dbUpdFormFields('mrENG', 'Ophone', mrEngEdit_OPhone.Text);
          dbUpdFormFields('mrENG', 'Oemail', mrEngEdit_OEmail.Text);
          dbUpdFormFields('mrENG', 'Odate', ConvertToSettingDateFormat(mrEngEdit_ODate.Date));
          dbUpdFormFields('mrENG', 'ODateBirth', ConvertToSettingDateFormat(mrEngEdit_ODateBirth.Date));
          dbUpdFormFields('mrENG', 'Osignature', mrEngImage_OSign.HelpKeyword);
          dbUpdFormFields('mrENG', 'OSignatureLeft', IntToStr(mrEngImage_OSign.Left));
          dbUpdFormFields('mrENG', 'OSignatureTop', IntToStr(mrEngImage_OSign.Top));
          dbUpdFormFields('mrENG', 'Wname', mrEngEdit_WName.Text);
          dbUpdFormFields('mrENG', 'Wdate', ConvertToSettingDateFormat(mrEngEdit_WDate.Date));
          dbUpdFormFields('mrENG', 'Wsignature', mrEngImage_WSign.HelpKeyword);
          dbUpdFormFields('mrENG', 'WSignatureLeft', IntToStr(mrEngImage_WSign.Left));
          dbUpdFormFields('mrENG', 'WSignatureTop', IntToStr(mrEngImage_WSign.Top));

          dbUpdFormFields('mrENG', 'PShootDate', ConvertToSettingDateFormat(mrEngEdit_PShootDate.Date));
          dbUpdFormFields('mrENG', 'PShootLocation', mrEngEdit_PShootLocation.Text);
          dbUpdFormFields('mrENG', 'PShootDescription', mrEngEdit_PShootDescription.Text);
          dbUpdFormFields('mrENG', 'ssNote', mrEdit_ssNote.Text);
          dbUpdFormFields('mrENG', 'ssModelPhotoPath', mrEdit_ssModelPhoto.Text);
          dbUpdFormFields('mrENG', 'OGender', IntToStr(Integer(mrComboBox__ssGender.Items.Objects[mrComboBox__ssGender.ItemIndex])));
          dbUpdFormFields('mrENG', 'OEthnicity', IntToStr(Integer(mrComboBox_ssEthnicity.Items.Objects[mrComboBox_ssEthnicity.ItemIndex])));

        ///// mrRUS
          dbUpdFormFields('mrRUS', 'Pname', mrRusEdit_PName.Text);
          dbUpdFormFields('mrRUS', 'Pname2', mrRusEdit_PName2.Text);
          dbUpdFormFields('mrRUS', 'Paddress', mrRusEdit_PAddress.Text);
          dbUpdFormFields('mrRUS', 'Pcity', mrRusEdit_PCity.Text);
          dbUpdFormFields('mrRUS', 'PState', mrRusEdit_PState.Text);
          dbUpdFormFields('mrRUS', 'Pcountry', IntToStr(Integer(mrRusComboBox_PCountry.Items.Objects[mrRusComboBox_PCountry.ItemIndex])));
          dbUpdFormFields('mrRUS', 'Pzip', mrRusEdit_PZipCode.Text);
          dbUpdFormFields('mrRUS', 'Pphone', mrRusEdit_PPhone.Text);
          dbUpdFormFields('mrRUS', 'Pemail', mrRusEdit_PEmail.Text);
          dbUpdFormFields('mrRUS', 'Pdate', ConvertToSettingDateFormat(mrRusEdit_PDate.Date));
          dbUpdFormFields('mrRUS', 'Psignature', mrRusImage_PSign.HelpKeyword);
          dbUpdFormFields('mrRUS', 'PSignatureLeft', IntToStr(mrRusImage_PSign.Left));
          dbUpdFormFields('mrRUS', 'PSignatureTop', IntToStr(mrRusImage_PSign.Top));
          dbUpdFormFields('mrRUS', 'Oname', mrRusEdit_OName.Text);
          dbUpdFormFields('mrRUS', 'Oaddress', mrRusEdit_OAddress.Text);
          dbUpdFormFields('mrRUS', 'Ocity', mrRusEdit_OCity.Text);
          dbUpdFormFields('mrRUS', 'OState', mrRusEdit_OState.Text);
          dbUpdFormFields('mrRUS', 'Ocountry', IntToStr(Integer(mrRusComboBox_OCountry.Items.Objects[mrRusComboBox_OCountry.ItemIndex])));
          dbUpdFormFields('mrRUS', 'Ozip', mrRusEdit_OZipCode.Text);
          dbUpdFormFields('mrRUS', 'Ophone', mrRusEdit_OPhone.Text);
          dbUpdFormFields('mrRUS', 'Oemail', mrRusEdit_OEmail.Text);
          dbUpdFormFields('mrRUS', 'Odate', ConvertToSettingDateFormat(mrRusEdit_ODate.Date));
          dbUpdFormFields('mrRUS', 'Osignature', mrRusImage_OSign.HelpKeyword);
          dbUpdFormFields('mrRUS', 'OSignatureLeft', IntToStr(mrRusImage_OSign.Left));
          dbUpdFormFields('mrRUS', 'OSignatureTop', IntToStr(mrRusImage_OSign.Top));
          dbUpdFormFields('mrRUS', 'Wname', mrRusEdit_WName.Text);
          dbUpdFormFields('mrRUS', 'Wdate', ConvertToSettingDateFormat(mrRusEdit_WDate.Date));
          dbUpdFormFields('mrRUS', 'Wsignature', mrRusImage_WSign.HelpKeyword);
          dbUpdFormFields('mrRUS', 'WSignatureLeft', IntToStr(mrRusImage_WSign.Left));
          dbUpdFormFields('mrRUS', 'WSignatureTop', IntToStr(mrRusImage_WSign.Top));

        ///// prENG
          dbUpdFormFields('prENG', 'Pname', prEngEdit_PName.Text);
          dbUpdFormFields('prENG', 'Paddress', prEngEdit_PAddress.Text);
          dbUpdFormFields('prENG', 'Pcity', prEngEdit_PCity.Text);
          dbUpdFormFields('prENG', 'Pcountry', IntToStr(Integer(prEngComboBox_PCountry.Items.Objects[prEngComboBox_PCountry.ItemIndex])));
          dbUpdFormFields('prENG', 'Pzip', prEngEdit_PZipCode.Text);
          dbUpdFormFields('prENG', 'Pphone', prEngEdit_PPhone.Text);
          dbUpdFormFields('prENG', 'Pemail', prEngEdit_PEmail.Text);
          dbUpdFormFields('prENG', 'Pdate', ConvertToSettingDateFormat(prEngEdit_PDate.Date));
          dbUpdFormFields('prENG', 'Psignature', prEngImage_PSign.HelpKeyword);
          dbUpdFormFields('prENG', 'PSignatureLeft', IntToStr(prEngImage_PSign.Left));
          dbUpdFormFields('prENG', 'PSignatureTop', IntToStr(prEngImage_PSign.Top));
          dbUpdFormFields('prENG', 'Oname', prEngEdit_OName.Text);
          dbUpdFormFields('prENG', 'Oaddress', prEngEdit_OAddress.Text);
          dbUpdFormFields('prENG', 'Ocity', prEngEdit_OCity.Text);
          dbUpdFormFields('prENG', 'Ocountry', IntToStr(Integer(prEngComboBox_OCountry.Items.Objects[prEngComboBox_OCountry.ItemIndex])));
          dbUpdFormFields('prENG', 'Ozip', prEngEdit_OZipCode.Text);
          dbUpdFormFields('prENG', 'Ophone', prEngEdit_OPhone.Text);
          dbUpdFormFields('prENG', 'Oemail', prEngEdit_OEmail.Text);
          dbUpdFormFields('prENG', 'Odate', ConvertToSettingDateFormat(prEngEdit_ODate.Date));
          dbUpdFormFields('prENG', 'Osignature', prEngImage_OSign.HelpKeyword);
          dbUpdFormFields('prENG', 'OSignatureLeft', IntToStr(prEngImage_OSign.Left));
          dbUpdFormFields('prENG', 'OSignatureTop', IntToStr(prEngImage_OSign.Top));
          dbUpdFormFields('prENG', 'Wname', prEngEdit_WName.Text);
          dbUpdFormFields('prENG', 'Wdate', ConvertToSettingDateFormat(prEngEdit_WDate.Date));
          dbUpdFormFields('prENG', 'Wsignature', prEngImage_WSign.HelpKeyword);
          dbUpdFormFields('prENG', 'WSignatureLeft', IntToStr(prEngImage_WSign.Left));
          dbUpdFormFields('prENG', 'WSignatureTop', IntToStr(prEngImage_WSign.Top));
          dbUpdFormFields('prENG', 'ssNote', prEdit_ssNote.Text);
          dbUpdFormFields('prENG', 'ssModelPhotoPath', prEdit_ssModelPhoto.Text);

        ///// prRUS
          dbUpdFormFields('prRUS', 'Pname', prRusEdit_PName.Text);
          dbUpdFormFields('prRUS', 'Pname2', prRusEdit_PName2.Text);
          dbUpdFormFields('prRUS', 'Paddress', prRusEdit_PAddress.Text);
          dbUpdFormFields('prRUS', 'Pcity', prRusEdit_PCity.Text);
          dbUpdFormFields('prRUS', 'Pcountry', IntToStr(Integer(prRusComboBox_PCountry.Items.Objects[prRusComboBox_PCountry.ItemIndex])));
          dbUpdFormFields('prRUS', 'Pzip', prRusEdit_PZipCode.Text);
          dbUpdFormFields('prRUS', 'Pphone', prRusEdit_PPhone.Text);
          dbUpdFormFields('prRUS', 'Pemail', prRusEdit_PEmail.Text);
          dbUpdFormFields('prRUS', 'Pdate', ConvertToSettingDateFormat(prRusEdit_PDate.Date));
          dbUpdFormFields('prRUS', 'Psignature', prRusImage_PSign.HelpKeyword);
          dbUpdFormFields('prRUS', 'PSignatureLeft', IntToStr(prRusImage_PSign.Left));
          dbUpdFormFields('prRUS', 'PSignatureTop', IntToStr(prRusImage_PSign.Top));
          dbUpdFormFields('prRUS', 'Oname', prRusEdit_OName.Text);
          dbUpdFormFields('prRUS', 'Oaddress', prRusEdit_OAddress.Text);
          dbUpdFormFields('prRUS', 'Ocity', prRusEdit_OCity.Text);
          dbUpdFormFields('prRUS', 'Ocountry', IntToStr(Integer(prRusComboBox_OCountry.Items.Objects[prRusComboBox_OCountry.ItemIndex])));
          dbUpdFormFields('prRUS', 'Ozip', prRusEdit_OZipCode.Text);
          dbUpdFormFields('prRUS', 'Ophone', prRusEdit_OPhone.Text);
          dbUpdFormFields('prRUS', 'Oemail', prRusEdit_OEmail.Text);
          dbUpdFormFields('prRUS', 'Odate', ConvertToSettingDateFormat(prRusEdit_ODate.Date));
          dbUpdFormFields('prRUS', 'Osignature', prRusImage_OSign.HelpKeyword);
          dbUpdFormFields('prRUS', 'OSignatureLeft', IntToStr(prRusImage_OSign.Left));
          dbUpdFormFields('prRUS', 'OSignatureTop', IntToStr(prRusImage_OSign.Top));
          dbUpdFormFields('prRUS', 'Wname', prRusEdit_WName.Text);
          dbUpdFormFields('prRUS', 'Wdate', ConvertToSettingDateFormat(prRusEdit_WDate.Date));
          dbUpdFormFields('prRUS', 'Wsignature', prRusImage_WSign.HelpKeyword);
          dbUpdFormFields('prRUS', 'WSignatureLeft', IntToStr(prRusImage_WSign.Left));
          dbUpdFormFields('prRUS', 'WSignatureTop', IntToStr(prRusImage_WSign.Top));
        end;
    finally
      sqldb.Commit;
    end;
end;


procedure TForm1.OffVisible;
var
  i: integer;
begin
  case GetPageName of
    'mr': ////////////////////////////// Model Release
      begin
        //Eng
        for i:=0 to mrScrollBoxENG.ControlCount-1 do
          if (mrScrollBoxENG.Controls[i] is TEdit) then
              mrScrollBoxENG.Controls[i].Visible:=false;
        //Rus
        for i:=0 to mrScrollBoxRUS.ControlCount-1 do
          if (mrScrollBoxRUS.Controls[i] is TEdit) then
               mrScrollBoxRUS.Controls[i].Visible:=false;
      end;
    'mrm': ////////////////////////////// Model Release (minor)
      begin
        //Eng

        //Rus
      end;
    'pr': ////////////////////////////// Property Release
      begin
        //Eng
        for i:=0 to prScrollBoxENG.ControlCount-1 do
          if (prScrollBoxENG.Controls[i] is TEdit){ or
             (prScrollBoxENG.Controls[i] is TComboBox)} then
               prScrollBoxENG.Controls[i].Visible:=false;
        //Rus
        for i:=0 to prScrollBoxRUS.ControlCount-1 do
          if (prScrollBoxRUS.Controls[i] is TEdit){ or
             (prScrollBoxRUS.Controls[i] is TComboBox)} then
               prScrollBoxRUS.Controls[i].Visible:=false;
      end;
    'prA': //////////////////////////////
      begin
        //Eng

        //Rus
      end
    else
      begin

      end
  end;
end;

procedure TForm1.OnVisible;
var
  i: integer;
begin
  case GetPageName of
    'mr': ////////////////////////////// Model Release
      begin
        //Eng
        for i:=0 to mrScrollBoxENG.ControlCount-1 do
          if (mrScrollBoxENG.Controls[i] is TEdit) then
              mrScrollBoxENG.Controls[i].Visible:=true;
        //Rus
        for i:=0 to mrScrollBoxRUS.ControlCount-1 do
          if (mrScrollBoxRUS.Controls[i] is TEdit) then
               mrScrollBoxRUS.Controls[i].Visible:=true;
      end;
    'mrm': ////////////////////////////// Model Release (minor)
      begin
        //Eng

        //Rus
      end;
    'pr': ////////////////////////////// Property Release
      begin
        //Eng
        for i:=0 to prScrollBoxENG.ControlCount-1 do
          if (prScrollBoxENG.Controls[i] is TEdit){ or
             (prScrollBoxENG.Controls[i] is TComboBox)} then
               prScrollBoxENG.Controls[i].Visible:=true;
        //Rus
        for i:=0 to prScrollBoxRUS.ControlCount-1 do
          if (prScrollBoxRUS.Controls[i] is TEdit){ or
             (prScrollBoxRUS.Controls[i] is TComboBox)} then
               prScrollBoxRUS.Controls[i].Visible:=true;
      end;
    'prA': //////////////////////////////
      begin
        //Eng

        //Rus
      end
    else
      begin

      end
  end;
end;



procedure TForm1.AllPrint;
begin

  if rSBformRef.Tag<>0 then RefPrint;
  case GetPageName of
    'mr': ////////////////////////////// Model Release
      begin
        if rSBformENG.Tag<>0 then mrEngPrint;
        if rSBformRUS.Tag<>0 then mrRusPrint;

      end;
    'mrm': ////////////////////////////// Model Release (minor)
      begin

      end;
    'pr': ////////////////////////////// Property Release
      begin
        if rSBformENG.Tag<>0 then prEngPrint;
        if rSBformRUS.Tag<>0 then prRusPrint;

      end;
    'prA': //////////////////////////////
      begin

      end
    else
      begin

      end
    end;
  OffVisible;
  FillStockSubmitterfields;
end;

procedure TForm1.RefPrint;
var
  bm: TBitmap;
  Img: TImage;
  OldBkMode: integer;
begin
  case GetPageName of
    'mr':
      Img:=mrImageFormRef;
    'mrm':
      Img:=mrmImageFormRef;
    'pr':
      Img:=prImageFormRef
  else
    begin
      Img:=mrImageFormRef;
    end
  end;

  Img.Canvas.Clear;
  bm := TBitmap.Create;
  bm.PixelFormat:=pf24bit;
  bm.Width := Img.Width;
  bm.Height := Img.Height;
  FillCanvasColor(bm.Canvas, clWhite);
  OldBkMode := SetBkMode(bm.Canvas.Handle, TRANSPARENT);

  BakePanelControlsToForm(prPanelRef, bm);

  SetBkMode(bm.Canvas.Handle, OldBkMode);
  Img.Picture.Assign(bm);
  bm.Destroy;
end;



///////////////////////////////////////////////////////////////// Model Release
procedure TForm1.mrEngPrint;
var
  bm: TBitmap;
  ImgFORM: TImage;
  OldBkMode,L,T: integer;
begin
  ImgFORM:=mrImageFormENG;

  ImgFORM.Canvas.Clear;
  ImgFORM.Canvas.Draw(0, 0, mrImageENG_temp.Picture.Graphic);
  mrScrollBoxENG.Height:=ImgFORM.Picture.Height;
  L:=7;
  T:=2;

  bm := TBitmap.Create;
  bm.PixelFormat:=pf24bit;
  bm.Width := ImgFORM.Picture.Width;
  bm.Height := ImgFORM.Height;
  bm.Canvas.Draw(0, 0, mrImageENG_temp.Picture.Graphic);
  OldBkMode := SetBkMode(bm.Canvas.Handle, TRANSPARENT);

  bm.Canvas.Draw(mrEngImage_PSign.Left,mrEngImage_PSign.Top,mrEngImage_PSign.Picture.Graphic);
  bm.Canvas.Draw(mrEngImage_OSign.Left,mrEngImage_OSign.Top,mrEngImage_OSign.Picture.Graphic);
  bm.Canvas.Draw(mrEngImage_WSign.Left,mrEngImage_WSign.Top,mrEngImage_WSign.Picture.Graphic);

  bm.Canvas.Font.Size:=12;
  bm.Canvas.Font.Style:=[fsBold];
  bm.Canvas.TextOut(80, 67, mrEngEdit_OName.Text);  // Name OName2  (Model)
  bm.Canvas.TextOut(75, 90, mrEngEdit_PName.Text);  // Name PName2  (Photographer)

  bm.Canvas.Font.Size:=12;
  bm.Canvas.TextOut(mrEngEdit_PName.Left+L+1, mrEngEdit_PName.Top+T, mrEngEdit_PName.Text);  // Name photographer
  bm.Canvas.TextOut(mrEngEdit_OName.Left+L+1, mrEngEdit_OName.Top+T, mrEngEdit_OName.Text);  // Name OwnerName

  bm.Canvas.Font.Style:=[];
  bm.Canvas.TextOut(mrEngEdit_PAddress.Left+L, mrEngEdit_PAddress.Top+T, mrEngEdit_PAddress.Text);  // Address photographer
  bm.Canvas.TextOut(mrEngEdit_OAddress.Left+L, mrEngEdit_OAddress.Top+T, mrEngEdit_OAddress.Text);  // Address Owner
  bm.Canvas.TextOut(mrEngEdit_PCity.Left+L, mrEngEdit_PCity.Top+T, mrEngEdit_PCity.Text);  // City photographer
  bm.Canvas.TextOut(mrEngEdit_OCity.Left+L, mrEngEdit_OCity.Top+T, mrEngEdit_OCity.Text);  // City Owner
  bm.Canvas.TextOut(mrEngEdit_PState.Left+L, mrEngEdit_PState.Top+T, mrEngEdit_PState.Text);  // State photographer
  bm.Canvas.TextOut(mrEngEdit_OState.Left+L, mrEngEdit_OState.Top+T, mrEngEdit_OState.Text);  // State Owner
  if mrEngComboBox_PCountry.ItemIndex=0 then bm.Canvas.TextOut(mrEngComboBox_PCountry.Left+L, mrEngComboBox_PCountry.Top+T, '')
  else bm.Canvas.TextOut(mrEngComboBox_PCountry.Left+L, mrEngComboBox_PCountry.Top+T, mrEngComboBox_PCountry.Text);  // Country photographer
  if mrEngComboBox_OCountry.ItemIndex=0 then bm.Canvas.TextOut(mrEngComboBox_OCountry.Left+L, mrEngComboBox_OCountry.Top+T, '')
  else bm.Canvas.TextOut(mrEngComboBox_OCountry.Left+L, mrEngComboBox_OCountry.Top+T, mrEngComboBox_OCountry.Text);  // Country Owner
  bm.Canvas.TextOut(mrEngEdit_PZipCode.Left+L, mrEngEdit_PZipCode.Top+T, mrEngEdit_PZipCode.Text);  // ZipCode photographer
  bm.Canvas.TextOut(mrEngEdit_OZipCode.Left+L, mrEngEdit_OZipCode.Top+T, mrEngEdit_OZipCode.Text);  // ZipCode Owner
  bm.Canvas.TextOut(mrEngEdit_PPhone.Left+L, mrEngEdit_PPhone.Top+T, mrEngEdit_PPhone.Text);  // Phone photographer
  bm.Canvas.TextOut(mrEngEdit_OPhone.Left+L, mrEngEdit_OPhone.Top+T, mrEngEdit_OPhone.Text);  // Phone Owner
  bm.Canvas.TextOut(mrEngEdit_PEmail.Left+L, mrEngEdit_PEmail.Top+T, mrEngEdit_PEmail.Text);  // Email photographer
  bm.Canvas.TextOut(mrEngEdit_OEmail.Left+L, mrEngEdit_OEmail.Top+T, mrEngEdit_OEmail.Text);  // Email Owner
  bm.Canvas.TextOut(mrEngEdit_WName.Left+L, mrEngEdit_WName.Top+T, mrEngEdit_WName.Text);  // Name Witness

  bm.Canvas.TextOut(mrEngEdit_PShootLocation.Left+L, mrEngEdit_PShootLocation.Top+T, mrEngEdit_PShootLocation.Text);  // ShootLocation photographer
  bm.Canvas.TextOut(mrEngEdit_PShootDescription.Left+L, mrEngEdit_PShootDescription.Top+T, mrEngEdit_PShootDescription.Text);  // ShootDescription photographer


  ////Даты на форме
  if Form4.rCheckBox_UseDate.Checked then
    begin
      if Form4.rComboBoxDateFormat.ItemIndex>-1 then
        begin
          bm.Canvas.TextOut(mrEngEdit_PDate.Left+L, mrEngEdit_PDate.Top+T-2, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], mrEngEdit_PDate.Date));  // Date photographer
          bm.Canvas.TextOut(mrEngEdit_ODate.Left+L, mrEngEdit_ODate.Top+T-1, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], mrEngEdit_ODate.Date));  // Date Owner
          bm.Canvas.TextOut(mrEngEdit_ODateBirth.Left+L, mrEngEdit_ODateBirth.Top+T-1, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], mrEngEdit_ODateBirth.Date));  // DateBirth Owner
          bm.Canvas.TextOut(mrEngEdit_WDate.Left+L, mrEngEdit_WDate.Top+T+2, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], mrEngEdit_WDate.Date));  // Date Witness
          bm.Canvas.TextOut(mrEngEdit_PShootDate.Left+L, mrEngEdit_PShootDate.Top+T-2, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], mrEngEdit_PShootDate.Date));  // ShootDate photographer
        end;
    end;



  SetBkMode(bm.Canvas.Handle, OldBkMode);
  ImgFORM.Picture.Assign(bm);
  bm.Destroy;
end;

procedure TForm1.mrRusPrint;
var
  bm: TBitmap;
  ImgFORM: TImage;
  OldBkMode,L,T: integer;
begin
  ImgFORM:=mrImageFormRUS;
  OffVisible;
  ImgFORM.Canvas.Clear;
  ImgFORM.Canvas.Draw(0, 0, mrImageRus_temp.Picture.Graphic);
  mrScrollBoxRUS.Height:=ImgFORM.Picture.Height;
  L:=7;
  T:=2;

  bm := TBitmap.Create;
  bm.PixelFormat:=pf24bit;
  bm.Width := ImgFORM.Picture.Width;
  bm.Height := ImgFORM.Height;
  bm.Canvas.Draw(0, 0, mrImageRUS_temp.Picture.Graphic);
  OldBkMode := SetBkMode(bm.Canvas.Handle, TRANSPARENT);

  bm.Canvas.Draw(mrRusImage_PSign.Left,mrRusImage_PSign.Top,mrRusImage_PSign.Picture.Graphic);
  bm.Canvas.Draw(mrRusImage_OSign.Left,mrRusImage_OSign.Top,mrRusImage_OSign.Picture.Graphic);
  bm.Canvas.Draw(mrRusImage_WSign.Left,mrRusImage_WSign.Top,mrRusImage_WSign.Picture.Graphic);

  bm.Canvas.Font.Size:=12;
  bm.Canvas.Font.Style:=[fsBold];
  bm.Canvas.TextOut(105, 33, mrRusEdit_OName.Text);  // Name OName2  (Model)
  bm.Canvas.TextOut(mrRusEdit_PName2.Left+L+1, mrRusEdit_PName2.Top+T, mrRusEdit_PName2.Text);  // Name PName2  (Photographer)

  bm.Canvas.Font.Size:=12;
  bm.Canvas.TextOut(mrRusEdit_PName.Left+L+1, mrRusEdit_PName.Top+T, mrRusEdit_PName.Text);  // Name photographer
  bm.Canvas.TextOut(mrRusEdit_OName.Left+L+1, mrRusEdit_OName.Top+T, mrRusEdit_OName.Text);  // Name OwnerName

  bm.Canvas.Font.Style:=[];
  bm.Canvas.TextOut(mrRusEdit_PAddress.Left+L, mrRusEdit_PAddress.Top+T, mrRusEdit_PAddress.Text);  // Address photographer
  bm.Canvas.TextOut(mrRusEdit_OAddress.Left+L, mrRusEdit_OAddress.Top+T, mrRusEdit_OAddress.Text);  // Address Owner
  bm.Canvas.TextOut(mrRusEdit_PCity.Left+L, mrRusEdit_PCity.Top+T, mrRusEdit_PCity.Text);  // City photographer
  bm.Canvas.TextOut(mrRusEdit_OCity.Left+L, mrRusEdit_OCity.Top+T, mrRusEdit_OCity.Text);  // City Owner
  bm.Canvas.TextOut(mrRusEdit_PState.Left+L, mrRusEdit_PState.Top+T, mrRusEdit_PState.Text);  // State photographer
  bm.Canvas.TextOut(mrRusEdit_OState.Left+L, mrRusEdit_OState.Top+T, mrRusEdit_OState.Text);  // State Owner
  if mrRusComboBox_PCountry.ItemIndex=0 then bm.Canvas.TextOut(mrRusComboBox_PCountry.Left+L, mrRusComboBox_PCountry.Top+T, '')
  else bm.Canvas.TextOut(mrRusComboBox_PCountry.Left+L, mrRusComboBox_PCountry.Top+T, mrRusComboBox_PCountry.Text);  // Country photographer
  if mrRusComboBox_OCountry.ItemIndex=0 then bm.Canvas.TextOut(mrRusComboBox_OCountry.Left+L, mrRusComboBox_OCountry.Top+T, '')
  else bm.Canvas.TextOut(mrRusComboBox_OCountry.Left+L, mrRusComboBox_OCountry.Top+T, mrRusComboBox_OCountry.Text);  // Country Owner
  bm.Canvas.TextOut(mrRusEdit_PZipCode.Left+L, mrRusEdit_PZipCode.Top+T, mrRusEdit_PZipCode.Text);  // ZipCode photographer
  bm.Canvas.TextOut(mrRusEdit_OZipCode.Left+L, mrRusEdit_OZipCode.Top+T, mrRusEdit_OZipCode.Text);  // ZipCode Owner
  bm.Canvas.TextOut(mrRusEdit_PPhone.Left+L, mrRusEdit_PPhone.Top+T, mrRusEdit_PPhone.Text);  // Phone photographer
  bm.Canvas.TextOut(mrRusEdit_OPhone.Left+L, mrRusEdit_OPhone.Top+T, mrRusEdit_OPhone.Text);  // Phone Owner
  bm.Canvas.TextOut(mrRusEdit_PEmail.Left+L, mrRusEdit_PEmail.Top+T, mrRusEdit_PEmail.Text);  // Email photographer
  bm.Canvas.TextOut(mrRusEdit_OEmail.Left+L, mrRusEdit_OEmail.Top+T, mrRusEdit_OEmail.Text);  // Email Owner
  bm.Canvas.TextOut(mrRusEdit_WName.Left+L, mrRusEdit_WName.Top+T, mrRusEdit_WName.Text);  // Name Witness

  ////Даты на форме
  if Form4.rCheckBox_UseDate.Checked then
    begin
      if Form4.rComboBoxDateFormat.ItemIndex>-1 then
        begin
          bm.Canvas.TextOut(mrRusEdit_PDate.Left+L, mrRusEdit_PDate.Top+T-2, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], mrRusEdit_PDate.Date));  // Date photographer
          bm.Canvas.TextOut(mrRusEdit_ODate.Left+L, mrRusEdit_ODate.Top+T-1, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], mrRusEdit_ODate.Date));  // Date Owner
          bm.Canvas.TextOut(mrRusEdit_WDate.Left+L, mrRusEdit_WDate.Top+T+2, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], mrRusEdit_WDate.Date));  // Date Witness
        end;
    end;



  SetBkMode(bm.Canvas.Handle, OldBkMode);
  ImgFORM.Picture.Assign(bm);
  bm.Destroy;
end;



/////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////// PropertyRelease
procedure TForm1.prEngPrint;
var
  bm: TBitmap;
  ImgFORM: TImage;
  OldBkMode,i,n,m,L,T,desX,desY: integer;
begin
  ImgFORM:=prImageFormENG;

  ImgFORM.Canvas.Clear;
  ImgFORM.Canvas.Draw(0, 0, prImageENG_temp.Picture.Graphic);
  prScrollBoxENG.Height:=ImgFORM.Picture.Height;
  L:=7;
  T:=2;

  bm := TBitmap.Create;
  bm.PixelFormat:=pf24bit;
  bm.Width := ImgFORM.Picture.Width;
  bm.Height := ImgFORM.Height;
  bm.Canvas.Draw(0, 0, prImageENG_temp.Picture.Graphic);
  OldBkMode := SetBkMode(bm.Canvas.Handle, TRANSPARENT);

  bm.Canvas.Draw(prEngImage_PSign.Left,prEngImage_PSign.Top,prEngImage_PSign.Picture.Graphic);
  bm.Canvas.Draw(prEngImage_OSign.Left,prEngImage_OSign.Top,prEngImage_OSign.Picture.Graphic);
  bm.Canvas.Draw(prEngImage_WSign.Left,prEngImage_WSign.Top,prEngImage_WSign.Picture.Graphic);

  bm.Canvas.Font.Size:=12;
  bm.Canvas.Font.Style:=[fsBold];
  bm.Canvas.TextOut(90, 84, prEngEdit_OName.Text);  // Name OwnerName2

  //////////
  desX:= 510;
  desY:= 770;
  ChangeSizeBakeText(prListBoxFile, bm, desX, desY);
  //////////

  bm.Canvas.Font.Size:=12;
  bm.Canvas.TextOut(prEngEdit_PName.Left+L+1, prEngEdit_PName.Top+T, prEngEdit_PName.Text);  // Name photographer
  bm.Canvas.TextOut(prEngEdit_OName.Left+L+1, prEngEdit_OName.Top+T, prEngEdit_OName.Text);  // Name OwnerName

  bm.Canvas.Font.Style:=[];
  bm.Canvas.TextOut(prEngEdit_PAddress.Left+L, prEngEdit_PAddress.Top+T, prEngEdit_PAddress.Text);  // Address photographer
  bm.Canvas.TextOut(prEngEdit_OAddress.Left+L, prEngEdit_OAddress.Top+T, prEngEdit_OAddress.Text);  // Address Owner
  bm.Canvas.TextOut(prEngEdit_PCity.Left+L, prEngEdit_PCity.Top+T, prEngEdit_PCity.Text);  // City photographer
  bm.Canvas.TextOut(prEngEdit_OCity.Left+L, prEngEdit_OCity.Top+T, prEngEdit_OCity.Text);  // City Owner
  if prEngComboBox_PCountry.ItemIndex=0 then bm.Canvas.TextOut(prEngComboBox_PCountry.Left+L, prEngComboBox_PCountry.Top+T, '')
  else bm.Canvas.TextOut(prEngComboBox_PCountry.Left+L, prEngComboBox_PCountry.Top+T, prEngComboBox_PCountry.Text);  // Country photographer
  if prEngComboBox_OCountry.ItemIndex=0 then bm.Canvas.TextOut(prEngComboBox_OCountry.Left+L, prEngComboBox_OCountry.Top+T, '')
  else bm.Canvas.TextOut(prEngComboBox_OCountry.Left+L, prEngComboBox_OCountry.Top+T, prEngComboBox_OCountry.Text);  // Country Owner
  bm.Canvas.TextOut(prEngEdit_PZipCode.Left+L, prEngEdit_PZipCode.Top+T, prEngEdit_PZipCode.Text);  // ZipCode photographer
  bm.Canvas.TextOut(prEngEdit_OZipCode.Left+L, prEngEdit_OZipCode.Top+T, prEngEdit_OZipCode.Text);  // ZipCode Owner
  bm.Canvas.TextOut(prEngEdit_PPhone.Left+L, prEngEdit_PPhone.Top+T, prEngEdit_PPhone.Text);  // Phone photographer
  bm.Canvas.TextOut(prEngEdit_OPhone.Left+L, prEngEdit_OPhone.Top+T, prEngEdit_OPhone.Text);  // Phone Owner
  bm.Canvas.TextOut(prEngEdit_PEmail.Left+L, prEngEdit_PEmail.Top+T, prEngEdit_PEmail.Text);  // Email photographer
  bm.Canvas.TextOut(prEngEdit_OEmail.Left+L, prEngEdit_OEmail.Top+T, prEngEdit_OEmail.Text);  // Email Owner
  bm.Canvas.TextOut(prEngEdit_WName.Left+L, prEngEdit_WName.Top+T, prEngEdit_WName.Text);  // Name Witness

  ////Даты на форме
  if Form4.rCheckBox_UseDate.Checked then
    begin
      if Form4.rComboBoxDateFormat.ItemIndex>-1 then
        begin
          bm.Canvas.TextOut(prEngEdit_PDate.Left+L, prEngEdit_PDate.Top+T-2, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], prEngEdit_PDate.Date));  // Date photographer
          bm.Canvas.TextOut(prEngEdit_ODate.Left+L, prEngEdit_ODate.Top+T-1, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], prEngEdit_ODate.Date));  // Date Owner
          bm.Canvas.TextOut(prEngEdit_WDate.Left+L, prEngEdit_WDate.Top+T+2, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], prEngEdit_WDate.Date));  // Date Witness
        end;
    end;

  SetBkMode(bm.Canvas.Handle, OldBkMode);
  ImgFORM.Picture.Assign(bm);
  bm.Destroy;
end;

procedure TForm1.prRusPrint;
var
  bm: TBitmap;
  ImgFORM: TImage;
  OldBkMode,i,n,m,L,T,desX,desY: integer;
begin
  ImgFORM:=prImageFormRUS;
  OffVisible;
  ImgFORM.Canvas.Clear;
  ImgFORM.Canvas.Draw(0, 0, prImageRus_temp.Picture.Graphic);
  prScrollBoxRUS.Height:=ImgFORM.Picture.Height;
  L:=7;
  T:=2;

  bm := TBitmap.Create;
  bm.PixelFormat:=pf24bit;
  bm.Width := ImgFORM.Picture.Width;
  bm.Height := ImgFORM.Height;
  bm.Canvas.Draw(0, 0, prImageRUS_temp.Picture.Graphic);
  OldBkMode := SetBkMode(bm.Canvas.Handle, TRANSPARENT);

  bm.Canvas.Draw(prRusImage_PSign.Left,prRusImage_PSign.Top,prRusImage_PSign.Picture.Graphic);
  bm.Canvas.Draw(prRusImage_OSign.Left,prRusImage_OSign.Top,prRusImage_OSign.Picture.Graphic);
  bm.Canvas.Draw(prRusImage_WSign.Left,prRusImage_WSign.Top,prRusImage_WSign.Picture.Graphic);

  bm.Canvas.Font.Size:=12;
  bm.Canvas.Font.Style:=[fsBold];
  bm.Canvas.TextOut(548, 31, prRusEdit_OName.Text);  // Name OName2
  bm.Canvas.TextOut(prRusEdit_PName2.Left+L-2, prRusEdit_PName2.Top+T, prRusEdit_PName2.Text);  // Name PName2

  //////////
  desX:= 510;
  desY:= 495;
  ChangeSizeBakeText(prListBoxFile, bm, desX, desY);
  //////////

  bm.Canvas.Font.Size:=12;
  bm.Canvas.TextOut(prRusEdit_PName.Left+L+1, prRusEdit_PName.Top+T, prRusEdit_PName.Text);  // Name photographer
  bm.Canvas.TextOut(prRusEdit_OName.Left+L+1, prRusEdit_OName.Top+T, prRusEdit_OName.Text);  // Name OwnerName

  bm.Canvas.Font.Style:=[];
  bm.Canvas.TextOut(prRusEdit_PAddress.Left+L, prRusEdit_PAddress.Top+T, prRusEdit_PAddress.Text);  // Address photographer
  bm.Canvas.TextOut(prRusEdit_OAddress.Left+L, prRusEdit_OAddress.Top+T, prRusEdit_OAddress.Text);  // Address Owner
  bm.Canvas.TextOut(prRusEdit_PCity.Left+L, prRusEdit_PCity.Top+T, prRusEdit_PCity.Text);  // City photographer
  bm.Canvas.TextOut(prRusEdit_OCity.Left+L, prRusEdit_OCity.Top+T, prRusEdit_OCity.Text);  // City Owner
  if prRusComboBox_PCountry.ItemIndex=0 then bm.Canvas.TextOut(prRusComboBox_PCountry.Left+L, prRusComboBox_PCountry.Top+T, '')
  else bm.Canvas.TextOut(prRusComboBox_PCountry.Left+L, prRusComboBox_PCountry.Top+T, prRusComboBox_PCountry.Text);  // Country photographer
  if prRusComboBox_OCountry.ItemIndex=0 then bm.Canvas.TextOut(prRusComboBox_OCountry.Left+L, prRusComboBox_OCountry.Top+T, '')
  else bm.Canvas.TextOut(prRusComboBox_OCountry.Left+L, prRusComboBox_OCountry.Top+T, prRusComboBox_OCountry.Text);  // Country Owner
  bm.Canvas.TextOut(prRusEdit_PZipCode.Left+L, prRusEdit_PZipCode.Top+T, prRusEdit_PZipCode.Text);  // ZipCode photographer
  bm.Canvas.TextOut(prRusEdit_OZipCode.Left+L, prRusEdit_OZipCode.Top+T, prRusEdit_OZipCode.Text);  // ZipCode Owner
  bm.Canvas.TextOut(prRusEdit_PPhone.Left+L, prRusEdit_PPhone.Top+T, prRusEdit_PPhone.Text);  // Phone photographer
  bm.Canvas.TextOut(prRusEdit_OPhone.Left+L, prRusEdit_OPhone.Top+T, prRusEdit_OPhone.Text);  // Phone Owner
  bm.Canvas.TextOut(prRusEdit_PEmail.Left+L, prRusEdit_PEmail.Top+T, prRusEdit_PEmail.Text);  // Email photographer
  bm.Canvas.TextOut(prRusEdit_OEmail.Left+L, prRusEdit_OEmail.Top+T, prRusEdit_OEmail.Text);  // Email Owner
  bm.Canvas.TextOut(prRusEdit_WName.Left+L, prRusEdit_WName.Top+T, prRusEdit_WName.Text);  // Name Witness

  ////Даты на форме
  if Form4.rCheckBox_UseDate.Checked then
    begin
      if Form4.rComboBoxDateFormat.ItemIndex>-1 then
        begin
          bm.Canvas.TextOut(prRusEdit_PDate.Left+L, prRusEdit_PDate.Top+T-2, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], prRusEdit_PDate.Date));  // Date photographer
          bm.Canvas.TextOut(prRusEdit_ODate.Left+L, prRusEdit_ODate.Top+T-1, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], prRusEdit_ODate.Date));  // Date Owner
          bm.Canvas.TextOut(prRusEdit_WDate.Left+L, prRusEdit_WDate.Top+T+2, FormatDateTime(Form4.rComboBoxDateFormat.Items[Form4.rComboBoxDateFormat.ItemIndex], prRusEdit_WDate.Date));  // Date Witness
        end;
    end;



  SetBkMode(bm.Canvas.Handle, OldBkMode);
  ImgFORM.Picture.Assign(bm);
  bm.Destroy;
end;

///////////////// Person List
procedure TForm1.rListBox_dbNameListMouseLeave(Sender: TObject);
begin
  rListBox_dbNameList.Visible:=false;
end;
procedure TForm1.rListBox_dbNameListSelectionChange(Sender: TObject;
  User: boolean);
begin
  rListBox_dbNameList.Visible:=false;

  case rListBox_dbNameList.HelpKeyword of
  'mrP':
    FillBy_mrSB_dbPLoad(rListBox_dbNameList.GetSelectedText);
  'mrO':
    FillBy_mrSB_dbOLoad(rListBox_dbNameList.GetSelectedText);
  'mrW':
    FillBy_mrSB_dbWLoad(rListBox_dbNameList.GetSelectedText);
  'prP':
    FillBy_prSB_dbPLoad(rListBox_dbNameList.GetSelectedText);
  'prO':
    FillBy_prSB_dbOLoad(rListBox_dbNameList.GetSelectedText);
  'prW':
    FillBy_prSB_dbWLoad(rListBox_dbNameList.GetSelectedText)
  else begin end
  end;
  AllPrint;
end;

procedure TForm1.rPanel1Click(Sender: TObject);
begin

end;


procedure TForm1.FillBy_mrSB_dbPLoad(EngName: string);
begin
  mrEngEdit_PName.Text:=dbGetPersonValue(EngName, 'EngName');
  mrEngEdit_PAddress.Text:=dbGetPersonValue(EngName, 'EngAddress');
  mrEngEdit_PCity.Text:=dbGetPersonValue(EngName, 'EngCity');
  mrEngEdit_PState.Text:=dbGetPersonValue(EngName, 'EngState');
  mrEngComboBox_PCountry.ItemIndex:= mrEngComboBox_PCountry.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(EngName, 'EngCountry'))));
  mrEngComboBox_PCountryChange(mrEngComboBox_PCountry);
  mrEngEdit_PZipCode.Text:=dbGetPersonValue(EngName, 'EngZip');
  mrEngEdit_PPhone.Text:=dbGetPersonValue(EngName, 'EngPhone');
  mrEngEdit_PEmail.Text:=dbGetPersonValue(EngName, 'EngEmail');
  dbLoadSignature('person', 'EngName', EngName, 'EngSignature', mrEngImage_PSign);
  ///
  mrRusEdit_PName.Text:=dbGetPersonValue(EngName, 'RusName');
  mrRusEdit_PName2.Text:=dbGetPersonValue(EngName, 'RusName2');
  mrRusEdit_PAddress.Text:=dbGetPersonValue(EngName, 'RusAddress');
  mrRusEdit_PCity.Text:=dbGetPersonValue(EngName, 'RusCity');
  mrRusEdit_PState.Text:=dbGetPersonValue(EngName, 'RusState');
  mrRusComboBox_PCountry.ItemIndex:= mrRusComboBox_PCountry.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(EngName, 'RusCountry'))));
  mrRusComboBox_PCountryChange(mrRusComboBox_PCountry);
  mrRusEdit_PZipCode.Text:=dbGetPersonValue(EngName, 'RusZip');
  mrRusEdit_PPhone.Text:=dbGetPersonValue(EngName, 'RusPhone');
  mrRusEdit_PEmail.Text:=dbGetPersonValue(EngName, 'RusEmail');
  dbLoadSignature('person', 'EngName', EngName, 'RusSignature', mrRusImage_PSign);

  if rCheckBox_Self.Checked then FillBy_mrSB_dbOLoad(EngName);
end;
procedure TForm1.FillBy_mrSB_dbOLoad(EngName: string);
begin
  mrEngEdit_OName.Text:=dbGetPersonValue(EngName, 'EngName');
  mrEngEdit_OAddress.Text:=dbGetPersonValue(EngName, 'EngAddress');
  mrEngEdit_OCity.Text:=dbGetPersonValue(EngName, 'EngCity');
  mrEngEdit_OState.Text:=dbGetPersonValue(EngName, 'EngState');
  mrEngComboBox_OCountry.ItemIndex:= mrEngComboBox_OCountry.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(EngName, 'EngCountry'))));
  mrComboBox_ssEthnicity.ItemIndex:= mrComboBox_ssEthnicity.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(EngName, 'EngEthnicity'))));
  mrComboBox__ssGender.ItemIndex:= mrComboBox__ssGender.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(EngName, 'EngGender'))));
  mrEdit_ssModelPhoto.Text:=dbGetPersonValue(EngName, 'EngModelPhoto');
  mrEngEdit_OZipCode.Text:=dbGetPersonValue(EngName, 'EngZip');
  mrEngEdit_OPhone.Text:=dbGetPersonValue(EngName, 'EngPhone');
  mrEngEdit_OEmail.Text:=dbGetPersonValue(EngName, 'EngEmail');
  dbGetDate('person', 'EngName', EngName, 'EngDateBirth', mrEngEdit_ODateBirth);
  dbLoadSignature('person', 'EngName', EngName, 'EngSignature', mrEngImage_OSign);
  ///
  mrRusEdit_OName.Text:=dbGetPersonValue(EngName, 'RusName');
  mrRusEdit_OAddress.Text:=dbGetPersonValue(EngName, 'RusAddress');
  mrRusEdit_OCity.Text:=dbGetPersonValue(EngName, 'RusCity');
  mrRusEdit_OState.Text:=dbGetPersonValue(EngName, 'RusState');
  mrRusComboBox_OCountry.ItemIndex:= mrRusComboBox_OCountry.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(EngName, 'RusCountry'))));
  mrRusEdit_OZipCode.Text:=dbGetPersonValue(EngName, 'RusZip');
  mrRusEdit_OPhone.Text:=dbGetPersonValue(EngName, 'RusPhone');
  mrRusEdit_OEmail.Text:=dbGetPersonValue(EngName, 'RusEmail');
  dbLoadSignature('person', 'EngName', EngName, 'RusSignature', mrRusImage_OSign);
end;
procedure TForm1.FillBy_mrSB_dbWLoad(EngName: string);
begin
  mrEngEdit_WName.Text:=dbGetPersonValue(EngName, 'EngName');
  dbLoadSignature('person', 'EngName', EngName, 'EngSignature', mrEngImage_WSign);
  ///
  mrRusEdit_WName.Text:=dbGetPersonValue(EngName, 'RusName');
  dbLoadSignature('person', 'EngName', EngName, 'RusSignature', mrRusImage_WSign);
end;


procedure TForm1.FillBy_prSB_dbPLoad(EngName: string);
begin
  prEngEdit_PName.Text:=dbGetPersonValue(EngName, 'EngName');
  prEngEdit_PAddress.Text:=dbGetPersonValue(EngName, 'EngAddress');
  prEngEdit_PCity.Text:=dbGetPersonValue(EngName, 'EngCity');
  prEngComboBox_PCountry.ItemIndex:= prEngComboBox_PCountry.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(EngName, 'EngCountry'))));
  prEngComboBox_PCountryChange(prEngComboBox_PCountry);
  prEngEdit_PZipCode.Text:=dbGetPersonValue(EngName, 'EngZip');
  prEngEdit_PPhone.Text:=dbGetPersonValue(EngName, 'EngPhone');
  prEngEdit_PEmail.Text:=dbGetPersonValue(EngName, 'EngEmail');
  dbLoadSignature('person', 'EngName', EngName, 'EngSignature', prEngImage_PSign);
  ///
  prRusEdit_PName.Text:=dbGetPersonValue(EngName, 'RusName');
  prRusEdit_PName2.Text:=dbGetPersonValue(EngName, 'RusName2');
  prRusEdit_PNameChange(prRusEdit_PName);
  prRusEdit_PAddress.Text:=dbGetPersonValue(EngName, 'RusAddress');
  prRusEdit_PCity.Text:=dbGetPersonValue(EngName, 'RusCity');
  prRusComboBox_PCountry.ItemIndex:= prRusComboBox_PCountry.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(EngName, 'RusCountry'))));
  prRusComboBox_PCountryChange(prRusComboBox_PCountry);
  prRusEdit_PZipCode.Text:=dbGetPersonValue(EngName, 'RusZip');
  prRusEdit_PPhone.Text:=dbGetPersonValue(EngName, 'RusPhone');
  prRusEdit_PEmail.Text:=dbGetPersonValue(EngName, 'RusEmail');
  dbLoadSignature('person', 'EngName', EngName, 'RusSignature', prRusImage_PSign);

  if rCheckBox_Self.Checked then FillBy_prSB_dbOLoad(EngName);
end;
procedure TForm1.FillBy_prSB_dbOLoad(EngName: string);
begin
  prEngEdit_OName.Text:=dbGetPersonValue(EngName, 'EngName');
  prEngEdit_OAddress.Text:=dbGetPersonValue(EngName, 'EngAddress');
  prEngEdit_OCity.Text:=dbGetPersonValue(EngName, 'EngCity');
  prEngComboBox_OCountry.ItemIndex:= prEngComboBox_OCountry.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(EngName, 'EngCountry'))));
  prEngEdit_OZipCode.Text:=dbGetPersonValue(EngName, 'EngZip');
  prEngEdit_OPhone.Text:=dbGetPersonValue(EngName, 'EngPhone');
  prEngEdit_OEmail.Text:=dbGetPersonValue(EngName, 'EngEmail');
  dbLoadSignature('person', 'EngName', EngName, 'EngSignature', prEngImage_OSign);
  prEdit_ssModelPhoto.Text:=dbGetPersonValue(EngName, 'EngModelPhoto');
  ///
  prRusEdit_OName.Text:=dbGetPersonValue(EngName, 'RusName');
  prRusEdit_OAddress.Text:=dbGetPersonValue(EngName, 'RusAddress');
  prRusEdit_OCity.Text:=dbGetPersonValue(EngName, 'RusCity');
  prRusComboBox_OCountry.ItemIndex:= prRusComboBox_OCountry.Items.IndexOfObject(TObject(StrToInt(dbGetPersonValue(EngName, 'RusCountry'))));
  prRusEdit_OZipCode.Text:=dbGetPersonValue(EngName, 'RusZip');
  prRusEdit_OPhone.Text:=dbGetPersonValue(EngName, 'RusPhone');
  prRusEdit_OEmail.Text:=dbGetPersonValue(EngName, 'RusEmail');
  dbLoadSignature('person', 'EngName', EngName, 'RusSignature', prRusImage_OSign);
end;
procedure TForm1.FillBy_prSB_dbWLoad(EngName: string);
begin
  prEngEdit_WName.Text:=dbGetPersonValue(EngName, 'EngName');
  dbLoadSignature('person', 'EngName', EngName, 'EngSignature', prEngImage_WSign);
  ///
  prRusEdit_WName.Text:=dbGetPersonValue(EngName, 'RusName');
  dbLoadSignature('person', 'EngName', EngName, 'RusSignature', prRusImage_WSign);
end;

procedure TForm1.ShowPersonList(aSender: TObject);
begin
  rListBox_dbNameList.Parent:=(aSender as TControl).Parent;
  rListBox_dbNameList.Left:=(aSender as TControl).Left-rListBox_dbNameList.Width+(aSender as TControl).Width;
  if rListBox_dbNameList.Left<0 then rListBox_dbNameList.Left:=0;
  rListBox_dbNameList.Top:=(aSender as TControl).Top;
  rListBox_dbNameList.Visible:=true;
end;
//////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
///////////////////////////// prENG buttons photographer
procedure TForm1.prEngSB_PbuttonsMouseEnter(Sender: TObject);
begin
  prEngSB_PClear.Visible:=true;
  prEngSB_dbPLoad.Visible:=true;
  prEngSB_dbPUpdate.Visible:=true;
end;
procedure TForm1.prEngSB_PbuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(prEngSB_PClear)=false then prEngSB_PClear.Visible:=false;
  if MouseInSpeedButton(prEngSB_dbPLoad)=false then prEngSB_dbPLoad.Visible:=false;
  if MouseInSpeedButton(prEngSB_dbPUpdate)=false then prEngSB_dbPUpdate.Visible:=false;
end;
procedure TForm1.prEngSB_dbPLoadClick(Sender: TObject);
begin
  rListBox_dbNameList.HelpKeyword:='prP';
  ShowPersonList(Sender);
  (Sender as TSpeedButton).Visible:=false;
end;
procedure TForm1.prEngSB_dbPUpdateClick(Sender: TObject);
var
  EngName: string;
begin
  EngName:=prEngEdit_PName.Text;
  sqldb.BeginTransaction;
  try
    if not dbAddPerson(EngName) then
      Showmessage(Trl_FillNamefieldinENGform)
    else
      begin
        dbUpdPerson('EngName', EngName, 'EngAddress', prEngEdit_PAddress.Text);
        dbUpdPerson('EngName', EngName, 'EngCity', prEngEdit_PCity.Text);
        dbUpdPerson('EngName', EngName, 'EngCountry', IntToStr(Integer(prEngComboBox_PCountry.Items.Objects[prEngComboBox_PCountry.ItemIndex])));
        dbUpdPerson('EngName', EngName, 'EngZip', prEngEdit_PZipCode.Text);
        dbUpdPerson('EngName', EngName, 'EngPhone', prEngEdit_PPhone.Text);
        dbUpdPerson('EngName', EngName, 'EngEmail', prEngEdit_PEmail.Text);
        dbUpdPerson('EngName', EngName, 'EngSignature', prEngImage_PSign.HelpKeyword);

        dbUpdPerson('EngName', EngName, 'RusName', prRusEdit_PName.Text);
        dbUpdPerson('EngName', EngName, 'RusName2', prRusEdit_PName2.Text);
        dbUpdPerson('EngName', EngName, 'RusAddress', prRusEdit_PAddress.Text);
        dbUpdPerson('EngName', EngName, 'RusCity', prRusEdit_PCity.Text);
        dbUpdPerson('EngName', EngName, 'RusCountry', IntToStr(Integer(prRusComboBox_PCountry.Items.Objects[prRusComboBox_PCountry.ItemIndex])));
        dbUpdPerson('EngName', EngName, 'RusZip', prRusEdit_PZipCode.Text);
        dbUpdPerson('EngName', EngName, 'RusPhone', prRusEdit_PPhone.Text);
        dbUpdPerson('EngName', EngName, 'RusEmail', prRusEdit_PEmail.Text);
        dbUpdPerson('EngName', EngName, 'RusSignature', prRusImage_PSign.HelpKeyword);
      end;
  finally
    sqldb.Commit;
    dbGetPersonNameList(rListBox_dbNameList, Form4.rComboBox_dbNameList);
  end;

  if rCheckBox_Self.Checked then prEngSB_dbOUpdate.Click;
end;
procedure TForm1.prEngSB_PClearClick(Sender: TObject);
begin
  prEngEdit_PName.Clear;
  prEngEdit_PAddress.Clear;
  prEngEdit_PCity.Clear;
  prEngComboBox_PCountry.ItemIndex:=0;
  prEngComboBox_PCountryChange(prEngComboBox_PCountry);
  prRusComboBox_PCountryChange(prRusComboBox_PCountry);
  prEngEdit_PZipCode.Clear;
  prEngEdit_PPhone.Clear;
  prEngEdit_PEmail.Clear;
  prEngEdit_PDate.Date:=today;
  prEngImage_PSign.HelpKeyword:='';
  prEngImage_PSign.Picture.Clear;

  if rCheckBox_Self.Checked=true then prEngSB_OClear.Click;
  AllPrint;
end;
//////////

///////////////////////////// prENG buttons Owner
procedure TForm1.prEngSB_ObuttonsMouseEnter(Sender: TObject);
begin
  prEngSB_OClear.Visible:=true;
  prEngSB_dbOLoad.Visible:=true;
  prEngSB_dbOUpdate.Visible:=true;
end;
procedure TForm1.prEngSB_ObuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(prEngSB_OClear)=false then prEngSB_OClear.Visible:=false;
  if MouseInSpeedButton(prEngSB_dbOLoad)=false then prEngSB_dbOLoad.Visible:=false;
  if MouseInSpeedButton(prEngSB_dbOUpdate)=false then prEngSB_dbOUpdate.Visible:=false;
end;
procedure TForm1.prEngSB_dbOLoadClick(Sender: TObject);
begin
  rListBox_dbNameList.HelpKeyword:='prO';
  ShowPersonList(Sender);
  (Sender as TSpeedButton).Visible:=false;
end;
procedure TForm1.prEngSB_dbOUpdateClick(Sender: TObject);
var
  EngName: string;
begin
  EngName:=prEngEdit_OName.Text;
  sqldb.BeginTransaction;
  try
    if not dbAddPerson(EngName) then
      Showmessage(Trl_FillNamefieldinENGform)
    else
      begin
        dbUpdPerson('EngName', EngName, 'EngAddress', prEngEdit_OAddress.Text);
        dbUpdPerson('EngName', EngName, 'EngCity', prEngEdit_OCity.Text);
        dbUpdPerson('EngName', EngName, 'EngCountry', IntToStr(Integer(prEngComboBox_OCountry.Items.Objects[prEngComboBox_OCountry.ItemIndex])));
        dbUpdPerson('EngName', EngName, 'EngZip', prEngEdit_OZipCode.Text);
        dbUpdPerson('EngName', EngName, 'EngPhone', prEngEdit_OPhone.Text);
        dbUpdPerson('EngName', EngName, 'EngEmail', prEngEdit_OEmail.Text);
        dbUpdPerson('EngName', EngName, 'EngSignature', prEngImage_PSign.HelpKeyword);

        dbUpdPerson('EngName', EngName, 'RusName', prRusEdit_OName.Text);
        dbUpdPerson('EngName', EngName, 'RusAddress', prRusEdit_OAddress.Text);
        dbUpdPerson('EngName', EngName, 'RusCity', prRusEdit_OCity.Text);
        dbUpdPerson('EngName', EngName, 'RusCountry', IntToStr(Integer(prRusComboBox_OCountry.Items.Objects[prRusComboBox_OCountry.ItemIndex])));
        dbUpdPerson('EngName', EngName, 'RusZip', prRusEdit_OZipCode.Text);
        dbUpdPerson('EngName', EngName, 'RusPhone', prRusEdit_OPhone.Text);
        dbUpdPerson('EngName', EngName, 'RusEmail', prRusEdit_OEmail.Text);
        dbUpdPerson('EngName', EngName, 'RusSignature', prRusImage_OSign.HelpKeyword);
      end;
  finally
    sqldb.Commit;
    dbGetPersonNameList(rListBox_dbNameList, Form4.rComboBox_dbNameList);
  end;
end;

procedure TForm1.prEngSB_OClearClick(Sender: TObject);
begin
  prEngEdit_OName.Clear;
  prEngEdit_OAddress.Clear;
  prEngEdit_OCity.Clear;
  prEngComboBox_OCountry.ItemIndex:=0;
  prEngEdit_OZipCode.Clear;
  prEngEdit_OPhone.Clear;
  prEngEdit_OEmail.Clear;
  prEngEdit_ODate.Date:=today;
  prEngImage_OSign.HelpKeyword:='';
  prEngImage_OSign.Picture.Clear;

  prEdit_ssModelPhoto.Text:='';
  prEdit_ssNote.Text:='';
  AllPrint;
end;
//////////

///////////////////////////// prENG buttons Witness
procedure TForm1.prEngSB_WbuttonsMouseEnter(Sender: TObject);
begin
  prEngSB_WClear.Visible:=true;
  prEngSB_dbWLoad.Visible:=true;
  prEngSB_dbWUpdate.Visible:=true;
end;
procedure TForm1.prEngSB_WbuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(prEngSB_WClear)=false then prEngSB_WClear.Visible:=false;
  if MouseInSpeedButton(prEngSB_dbWLoad)=false then prEngSB_dbWLoad.Visible:=false;
  if MouseInSpeedButton(prEngSB_dbWUpdate)=false then prEngSB_dbWUpdate.Visible:=false;
end;
procedure TForm1.mmrEngSB_dbWLoadClick(Sender: TObject);
begin
  rListBox_dbNameList.HelpKeyword:='prW';
  ShowPersonList(Sender);
  (Sender as TSpeedButton).Visible:=false;
end;
procedure TForm1.prEngSB_dbWUpdateClick(Sender: TObject);
var
  EngName: string;
begin
  EngName:=prEngEdit_WName.Text;
  sqldb.BeginTransaction;
  try
    if not dbAddPerson(EngName) then
      Showmessage(Trl_FillNamefieldinENGform)
    else
      begin
        //dbUpdPerson('EngName', EngName, 'EngDate', ConvertToSettingDateFormat(prEngEdit_WDate.Date));
        dbUpdPerson('EngName', EngName, 'EngSignature', prEngImage_WSign.HelpKeyword);
        dbUpdPerson('EngName', EngName, 'RusName', prRusEdit_WName.Text);
        //dbUpdPerson('EngName', EngName, 'RusDate', ConvertToSettingDateFormat(prRusEdit_WDate.Date));
        dbUpdPerson('EngName', EngName, 'RusSignature', prRusImage_WSign.HelpKeyword);
      end;
  finally
    sqldb.Commit;
    dbGetPersonNameList(rListBox_dbNameList, Form4.rComboBox_dbNameList);
  end;
end;
procedure TForm1.prEngSB_WClearClick(Sender: TObject);
begin
  prEngEdit_WName.Clear;
  prEngEdit_WDate.Date:=today;
  prEngImage_WSign.HelpKeyword:='';
  prEngImage_WSign.Picture.Clear;
  AllPrint;
end;



//////////     for all controls
procedure TForm1.EnterKeyPress(Sender: TObject; var Key: char);
begin
  if (key=#13) then AllPrint;
end;

procedure TForm1.EditMouseLeave(Sender: TObject);
begin
  if (Sender is TEdit) then
    if (Sender as TEdit).Focused=false then AllPrint;
end;



///////////////////////////// prENG Name photographer
procedure TForm1.prEngEdit_PNameChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  prEngEdit_OName.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prENG Name Owner
procedure TForm1.prEngEdit_ONameChange(Sender: TObject);
begin
  prEdit_ssPropertyOwner.Text:=(Sender as TEdit).Text;
  //FillStockSubmitterfields;
end;
//////////

///////////////////////////// prENG Address photographer
procedure TForm1.prEngEdit_PAddressChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  prEngEdit_OAddress.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prENG City photographer
procedure TForm1.prEngEdit_PCityChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  prEngEdit_OCity.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prENG Country photographer
procedure TForm1.prEngComboBox_PCountryChange(Sender: TObject);
begin
  prRusComboBox_PCountry.ItemIndex:=(Sender as TComboBox).ItemIndex;
  ifSelf_ComboBox(Sender, prEngComboBox_OCountry);
  ifSelf_ComboBox(Sender, prRusComboBox_OCountry);
  AllPrint;
end;
procedure TForm1.prEngSB_PCountryClick(Sender: TObject);
begin
  prEngComboBox_PCountry.DroppedDown:=true;
end;
//////////

///////////////////////////// prENG Country Owner
procedure TForm1.prEngComboBox_OCountryChange(Sender: TObject);
begin
  prRusComboBox_OCountry.ItemIndex:=(Sender as TComboBox).ItemIndex;
  AllPrint;
end;
procedure TForm1.prEngSB_OCountryClick(Sender: TObject);
begin
  prEngComboBox_OCountry.DroppedDown:=true;
end;
//////////

///////////////////////////// prENG ZipCode photographer
procedure TForm1.prEngEdit_PZipCodeChange(Sender: TObject);
begin
  prRusEdit_PZipCode.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  prEngEdit_OZipCode.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prENG ZipCode Owner
procedure TForm1.prEngEdit_OZipCodeChange(Sender: TObject);
begin
  prRusEdit_OZipCode.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prENG Phone photographer
procedure TForm1.prEngEdit_PPhoneChange(Sender: TObject);
begin
  prRusEdit_PPhone.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  prEngEdit_OPhone.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prENG Phone Owner
procedure TForm1.prEngEdit_OPhoneChange(Sender: TObject);
begin
  prRusEdit_OPhone.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prENG Email photographer
procedure TForm1.prEngEdit_PEmailChange(Sender: TObject);
begin
  prRusEdit_PEmail.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  prEngEdit_OEmail.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prENG Email Owner
procedure TForm1.prEngEdit_OEmailChange(Sender: TObject);
begin
  prRusEdit_OEmail.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prENG Date photographer
procedure TForm1.prEngEdit_PDateChange(Sender: TObject);
begin
  prRusEdit_PDate.Date:=(Sender as TDateEdit).Date;
  prEngEdit_WDate.Date:=(Sender as TDateEdit).Date;  //если нужно потом выключить
  if rCheckBox_Self.Checked then
    prEngEdit_ODate.Date:=(Sender as TDateEdit).Date;
  AllPrint;
end;
procedure TForm1.prEngSB_PDateClick(Sender: TObject);
begin
  prEngEdit_PDate.Button.Click;
end;
//////////

///////////////////////////// prENG Date Owner
procedure TForm1.prEngEdit_ODateChange(Sender: TObject);
begin
  prRusEdit_ODate.Date:=(Sender as TDateEdit).Date;
  AllPrint;
end;
procedure TForm1.prEngSB_ODateClick(Sender: TObject);
begin
  prEngEdit_ODate.Button.Click;
end;
//////////

///////////////////////////// prENG Date Witness
procedure TForm1.prEngEdit_WDateChange(Sender: TObject);
begin
  prRusEdit_WDate.Date:=(Sender as TDateEdit).Date;
  AllPrint;
end;
procedure TForm1.prEngSB_WDateClick(Sender: TObject);
begin
  prEngEdit_WDate.Button.Click;
end;
//////////

/////////////////////////////// prENG Signature Photographer
procedure TForm1.prEngSB_PSignatureClick(Sender: TObject);
var
  f: string;
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_PSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   // 'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      f:= OpenDlg.FileName;
      prEngImage_PSign.Picture.LoadFromFile(f);
      prEngImage_PSign.HelpKeyword:=f;
      if rCheckBox_Self.Checked=true then
        begin
          prEngImage_OSign.Picture.LoadFromFile(f);
          prEngImage_OSign.HelpKeyword:=f;
        end;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.prEngImage_PSignDblClick(Sender: TObject);
begin
  (Sender as TImage).HelpKeyword:='';
  (Sender as TImage).Picture.Clear;
  if rCheckBox_Self.Checked then
    begin
      prEngImage_OSign.HelpKeyword:='';
      prEngImage_OSign.Picture.Clear;
    end;
  AllPrint;
end;
procedure TForm1.prEngImage_PSignPictureChanged(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
    prEngImage_OSign.Picture:=(Sender as TImage).Picture;
end;
///////////

/////////////////////////////// prENG Signature Owner
procedure TForm1.prEngSB_OSignatureClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_OSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   //  'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      prEngImage_OSign.Picture.LoadFromFile(OpenDlg.FileName);
      prEngImage_OSign.HelpKeyword:=OpenDlg.FileName;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.prEngImage_OSignDblClick(Sender: TObject);
begin
  if rCheckBox_Self.Checked=false then
    begin
      (Sender as TImage).HelpKeyword:='';
      (Sender as TImage).Picture.Clear;
      AllPrint;
    end;
end;
///////////

/////////////////////////////// prENG Signature Witness
procedure TForm1.prEngSB_WSignatureClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_WSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   //  'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      prEngImage_WSign.Picture.LoadFromFile(OpenDlg.FileName);
      prEngImage_WSign.HelpKeyword:=OpenDlg.FileName;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.prEngImage_WSignDblClick(Sender: TObject);
begin
  (Sender as TImage).HelpKeyword:='';
  (Sender as TImage).Picture.Clear;
  AllPrint;
end;
///////////




////////////////////////////////////////////////////////////////////////////////
///////////////////////////// prRus buttons photographer

procedure TForm1.prRusSB_PbuttonsMouseEnter(Sender: TObject);
begin
  prRusSB_PClear.Visible:=true;
  prRusSB_dbPLoad.Visible:=true;
  prRusSB_dbPUpdate.Visible:=true;
end;
procedure TForm1.prRusSB_PbuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(prRusSB_PClear)=false then prRusSB_PClear.Visible:=false;
  if MouseInSpeedButton(prRusSB_dbPLoad)=false then prRusSB_dbPLoad.Visible:=false;
  if MouseInSpeedButton(prRusSB_dbPUpdate)=false then prRusSB_dbPUpdate.Visible:=false;
end;
procedure TForm1.prRusSB_PClearClick(Sender: TObject);
begin
  prRusEdit_PName.Clear;
  prRusEdit_PName2.Clear;
  prRusEdit_PAddress.Clear;
  prRusEdit_PCity.Clear;
  prRusComboBox_PCountry.ItemIndex:=0;
  prRusComboBox_PCountryChange(prRusComboBox_PCountry);
  prEngComboBox_PCountryChange(prEngComboBox_PCountry);
  prRusEdit_PZipCode.Clear;
  prRusEdit_PPhone.Clear;
  prRusEdit_PEmail.Clear;
  prRusEdit_PDate.Date:=today;
  prRusImage_PSign.HelpKeyword:='';
  prRusImage_PSign.Picture.Clear;

  if rCheckBox_Self.Checked=true then prRusSB_OClear.Click;
  AllPrint;
end;

///////////////////////////// prRus buttons Owner
procedure TForm1.prRusSB_ObuttonsMouseEnter(Sender: TObject);
begin
  prRusSB_OClear.Visible:=true;
  prRusSB_dbOLoad.Visible:=true;
  prRusSB_dbOUpdate.Visible:=true;
end;
procedure TForm1.prRusSB_ObuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(prRusSB_OClear)=false then prRusSB_OClear.Visible:=false;
  if MouseInSpeedButton(prRusSB_dbOLoad)=false then prRusSB_dbOLoad.Visible:=false;
  if MouseInSpeedButton(prRusSB_dbOUpdate)=false then prRusSB_dbOUpdate.Visible:=false;
end;

procedure TForm1.prRusSB_OClearClick(Sender: TObject);
begin
  prRusEdit_OName.Clear;
  prRusEdit_OAddress.Clear;
  prRusEdit_OCity.Clear;
  prRusComboBox_OCountry.ItemIndex:=0;
  prRusEdit_OZipCode.Clear;
  prRusEdit_OPhone.Clear;
  prRusEdit_OEmail.Clear;
  prRusEdit_ODate.Date:=today;
  prRusImage_OSign.HelpKeyword:='';
  prRusImage_OSign.Picture.Clear;
  AllPrint;
end;

///////////////////////////// prRus buttons Witness
procedure TForm1.prRusSB_WbuttonsMouseEnter(Sender: TObject);
begin
  prRusSB_WClear.Visible:=true;
  prRusSB_dbWLoad.Visible:=true;
  prRusSB_dbWUpdate.Visible:=true;
end;
procedure TForm1.prRusSB_WbuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(prRusSB_WClear)=false then prRusSB_WClear.Visible:=false;
  if MouseInSpeedButton(prRusSB_dbWLoad)=false then prRusSB_dbWLoad.Visible:=false;
  if MouseInSpeedButton(prRusSB_dbWUpdate)=false then prRusSB_dbWUpdate.Visible:=false;
end;
procedure TForm1.prRusSB_WClearClick(Sender: TObject);
begin
  prRusEdit_WName.Clear;
  prRusEdit_WDate.Date:=today;
  prRusImage_WSign.HelpKeyword:='';
  prRusImage_WSign.Picture.Clear;
  AllPrint;
end;
////




////////////////////////////////////////////////////////////////////////////////
///////////////////////////// prRus Name photographer
procedure TForm1.prRusEdit_PNameChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  prRusEdit_OName.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prRus Name Owner
//////////

///////////////////////////// prRus Name Witness
//////////

///////////////////////////// prRus Address photographer
procedure TForm1.prRusEdit_PAddressChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  prRusEdit_OAddress.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prRus Address Owner
//////////

///////////////////////////// prRus City photographer
procedure TForm1.prRusEdit_PCityChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  prRusEdit_OCity.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prRus City Owner
//////////

///////////////////////////// prRus Country photographer
procedure TForm1.prRusComboBox_PCountryChange(Sender: TObject);
begin
  prEngComboBox_PCountry.ItemIndex:=(Sender as TComboBox).ItemIndex;
  ifSelf_ComboBox(Sender, prRusComboBox_OCountry);
  ifSelf_ComboBox(Sender, prEngComboBox_OCountry);
  AllPrint;
end;
procedure TForm1.prRusSB_PCountryClick(Sender: TObject);
begin
  prRusComboBox_PCountry.DroppedDown:=true;
end;
//////////

///////////////////////////// prRus Country Owner
procedure TForm1.prRusComboBox_OCountryChange(Sender: TObject);
begin
  prEngComboBox_OCountry.ItemIndex:=(Sender as TComboBox).ItemIndex;
  //prEngComboBox_OCountryChange(prEngComboBox_OCountry);
  AllPrint;
end;
procedure TForm1.prRusSB_OCountryClick(Sender: TObject);
begin
  prRusComboBox_OCountry.DroppedDown:=true;
end;
//////////

///////////////////////////// prRus ZipCode photographer
procedure TForm1.prRusEdit_PZipCodeChange(Sender: TObject);
begin
  prEngEdit_PZipCode.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  prRusEdit_OZipCode.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prRus ZipCode Owner
procedure TForm1.prRusEdit_OZipCodeChange(Sender: TObject);
begin
  prEngEdit_OZipCode.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prRus Phone photographer
procedure TForm1.prRusEdit_PPhoneChange(Sender: TObject);
begin
  prEngEdit_PPhone.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  prRusEdit_OPhone.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prRus Phone Owner
procedure TForm1.prRusEdit_OPhoneChange(Sender: TObject);
begin
  prEngEdit_OPhone.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prRus Email photographer
procedure TForm1.prRusEdit_PEmailChange(Sender: TObject);
begin
  prEngEdit_PEmail.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  prRusEdit_OEmail.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prRus Email Owner
procedure TForm1.prRusEdit_OEmailChange(Sender: TObject);
begin
  prEngEdit_OEmail.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// prRus Date photographer
procedure TForm1.prRusEdit_PDateChange(Sender: TObject);
begin
  prEngEdit_PDate.Date:=(Sender as TDateEdit).Date;
  prRusEdit_WDate.Date:=(Sender as TDateEdit).Date;  //если нужно потом выключить
  if rCheckBox_Self.Checked then
    prRusEdit_ODate.Date:=(Sender as TDateEdit).Date;
  AllPrint;
end;
procedure TForm1.prRusSB_PDateClick(Sender: TObject);
begin
  prRusEdit_PDate.Button.Click;
end;
//////////

///////////////////////////// prRus Date Owner
procedure TForm1.prRusEdit_ODateChange(Sender: TObject);
begin
  prEngEdit_ODate.Date:=(Sender as TDateEdit).Date;
  //ssShootingDate:=(Sender as TDateEdit).Text;
  //FillStockSubmitterfields;
  AllPrint;
end;
procedure TForm1.prRusSB_ODateClick(Sender: TObject);
begin
  prRusEdit_ODate.Button.Click;
end;
//////////

///////////////////////////// prRus Date Witness
procedure TForm1.prRusEdit_WDateChange(Sender: TObject);
begin
  prEngEdit_WDate.Date:=(Sender as TDateEdit).Date;
  AllPrint;
end;
procedure TForm1.prRusSB_WDateClick(Sender: TObject);
begin
  prRusEdit_WDate.Button.Click;
end;
//////////

/////////////////////////////// prRUS Signature Photographer
procedure TForm1.prRusSB_PSignatureClick(Sender: TObject);
var
  f: string;
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_prRusPSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';
  if OpenDlg.Execute then
    begin
      f:= OpenDlg.FileName;
      prRusImage_PSign.Picture.LoadFromFile(f);
      prRusImage_PSign.HelpKeyword:=f;
      if rCheckBox_Self.Checked=true then
        begin
          prRusImage_OSign.Picture.LoadFromFile(f);
          prRusImage_OSign.HelpKeyword:=f;
        end;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.prRusImage_PSignDblClick(Sender: TObject);
begin
  (Sender as TImage).HelpKeyword:='';
  (Sender as TImage).Picture.Clear;
  if rCheckBox_Self.Checked then
    begin
      prRusImage_OSign.HelpKeyword:='';
      prRusImage_OSign.Picture.Clear;
    end;
  AllPrint;
end;
procedure TForm1.prRusImage_PSignPictureChanged(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
    prRusImage_OSign.Picture:=(Sender as TImage).Picture;
end;
///////////

/////////////////////////////// prRus Signature Owner
procedure TForm1.prRusSB_OSignatureClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_prRusOSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';
  if OpenDlg.Execute then
    begin
      prRusImage_OSign.Picture.LoadFromFile(OpenDlg.FileName);
      prRusImage_OSign.HelpKeyword:=OpenDlg.FileName;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.prRusImage_OSignDblClick(Sender: TObject);
begin
  if rCheckBox_Self.Checked=false then
    begin
      (Sender as TImage).HelpKeyword:='';
      (Sender as TImage).Picture.Clear;
      AllPrint;
    end;
end;
///////////

/////////////////////////////// prRus Signature Witness
procedure TForm1.prRusSB_WSignatureClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_prRusWSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   //  'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      prRusImage_WSign.Picture.LoadFromFile(OpenDlg.FileName);
      prRusImage_WSign.HelpKeyword:=OpenDlg.FileName;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.prRusImage_WSignDblClick(Sender: TObject);
begin
  (Sender as TImage).HelpKeyword:='';
  (Sender as TImage).Picture.Clear;
  AllPrint;
end;
///////////


////////////////////////////////////////////////////////////////////////////////
///////////////////////////// mrEng buttons photographer
procedure TForm1.mrEngSB_PbuttonsMouseEnter(Sender: TObject);
begin
  mrEngSB_PClear.Visible:=true;
  mrEngSB_dbPLoad.Visible:=true;
  mrEngSB_dbPUpdate.Visible:=true;
end;
procedure TForm1.mrEngSB_PbuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(mrEngSB_PClear)=false then mrEngSB_PClear.Visible:=false;
  if MouseInSpeedButton(mrEngSB_dbPLoad)=false then mrEngSB_dbPLoad.Visible:=false;
  if MouseInSpeedButton(mrEngSB_dbPUpdate)=false then mrEngSB_dbPUpdate.Visible:=false;
end;
procedure TForm1.mrEngSB_dbPLoadClick(Sender: TObject);
begin
  rListBox_dbNameList.HelpKeyword:='mrP';
  ShowPersonList(Sender);
  (Sender as TSpeedButton).Visible:=false;
end;
procedure TForm1.mrEngSB_dbPUpdateClick(Sender: TObject);
var
  EngName: string;
begin
  EngName:=mrEngEdit_PName.Text;
  sqldb.BeginTransaction;
  try
    if not dbAddPerson(EngName) then
      Showmessage(Trl_FillNamefieldinENGform)
    else
      begin
        dbUpdPerson('EngName', EngName, 'EngAddress', mrEngEdit_PAddress.Text);
        dbUpdPerson('EngName', EngName, 'EngCity', mrEngEdit_PCity.Text);
        dbUpdPerson('EngName', EngName, 'EngState', mrEngEdit_PState.Text);
        dbUpdPerson('EngName', EngName, 'EngCountry', IntToStr(Integer(mrEngComboBox_PCountry.Items.Objects[mrEngComboBox_PCountry.ItemIndex])));
        dbUpdPerson('EngName', EngName, 'EngZip', mrEngEdit_PZipCode.Text);
        dbUpdPerson('EngName', EngName, 'EngPhone', mrEngEdit_PPhone.Text);
        dbUpdPerson('EngName', EngName, 'EngEmail', mrEngEdit_PEmail.Text);
        dbUpdPerson('EngName', EngName, 'EngSignature', mrEngImage_PSign.HelpKeyword);

        dbUpdPerson('EngName', EngName, 'RusName', mrRusEdit_PName.Text);
        dbUpdPerson('EngName', EngName, 'RusName2', mrRusEdit_PName2.Text);
        dbUpdPerson('EngName', EngName, 'RusAddress', mrRusEdit_PAddress.Text);
        dbUpdPerson('EngName', EngName, 'RusCity', mrRusEdit_PCity.Text);
        dbUpdPerson('EngName', EngName, 'RusState', mrRusEdit_PState.Text);
        dbUpdPerson('EngName', EngName, 'RusCountry', IntToStr(Integer(mrRusComboBox_PCountry.Items.Objects[mrRusComboBox_PCountry.ItemIndex])));
        dbUpdPerson('EngName', EngName, 'RusZip', mrRusEdit_PZipCode.Text);
        dbUpdPerson('EngName', EngName, 'RusPhone', mrRusEdit_PPhone.Text);
        dbUpdPerson('EngName', EngName, 'RusEmail', mrRusEdit_PEmail.Text);
        dbUpdPerson('EngName', EngName, 'RusSignature', mrRusImage_PSign.HelpKeyword);
      end;
  finally
    sqldb.Commit;
    dbGetPersonNameList(rListBox_dbNameList, Form4.rComboBox_dbNameList);
  end;

  if rCheckBox_Self.Checked then mrEngSB_dbOUpdate.Click;
end;
procedure TForm1.mrEngSB_PClearClick(Sender: TObject);
begin
  mrEngEdit_PName.Clear;
  mrEngEdit_PAddress.Clear;
  mrEngEdit_PCity.Clear;
  mrEngEdit_PState.Clear;
  mrEngComboBox_PCountry.ItemIndex:=0;
  mrEngComboBox_PCountryChange(mrEngComboBox_PCountry);
  mrRusComboBox_PCountryChange(mrRusComboBox_PCountry);
  mrEngEdit_PZipCode.Clear;
  mrEngEdit_PPhone.Clear;
  mrEngEdit_PEmail.Clear;
  mrEngEdit_PDate.Date:=today;
  mrEngImage_PSign.HelpKeyword:='';
  mrEngImage_PSign.Picture.Clear;

  if rCheckBox_Self.Checked=true then mrEngSB_OClear.Click;
  AllPrint;
end;
//////////

///////////////////////////// mrEng buttons Owner
procedure TForm1.mrEngSB_ObuttonsMouseEnter(Sender: TObject);
begin
  mrEngSB_OClear.Visible:=true;
  mrEngSB_dbOLoad.Visible:=true;
  mrEngSB_dbOUpdate.Visible:=true;
end;
procedure TForm1.mrEngSB_ObuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(mrEngSB_OClear)=false then mrEngSB_OClear.Visible:=false;
  if MouseInSpeedButton(mrEngSB_dbOLoad)=false then mrEngSB_dbOLoad.Visible:=false;
  if MouseInSpeedButton(mrEngSB_dbOUpdate)=false then mrEngSB_dbOUpdate.Visible:=false;
end;
procedure TForm1.mrEngSB_dbOLoadClick(Sender: TObject);
begin
  rListBox_dbNameList.HelpKeyword:='mrO';
  ShowPersonList(Sender);
  (Sender as TSpeedButton).Visible:=false;
end;
procedure TForm1.mrEngSB_dbOUpdateClick(Sender: TObject);
var
  EngName: string;
begin
  EngName:=mrEngEdit_OName.Text;
  sqldb.BeginTransaction;
  try
    if not dbAddPerson(EngName) then
      Showmessage(Trl_FillNamefieldinENGform)
    else
      begin
        dbUpdPerson('EngName', EngName, 'EngAddress', mrEngEdit_OAddress.Text);
        dbUpdPerson('EngName', EngName, 'EngCity', mrEngEdit_OCity.Text);
        dbUpdPerson('EngName', EngName, 'EngState', mrEngEdit_OState.Text);
        dbUpdPerson('EngName', EngName, 'EngCountry', IntToStr(Integer(mrEngComboBox_OCountry.Items.Objects[mrEngComboBox_OCountry.ItemIndex])));
        dbUpdPerson('EngName', EngName, 'EngZip', mrEngEdit_OZipCode.Text);
        dbUpdPerson('EngName', EngName, 'EngPhone', mrEngEdit_OPhone.Text);
        dbUpdPerson('EngName', EngName, 'EngEmail', mrEngEdit_OEmail.Text);
        dbUpdPerson('EngName', EngName, 'EngDateBirth', ConvertToSettingDateFormat(mrEngEdit_ODateBirth.Date));
        dbUpdPerson('EngName', EngName, 'EngSignature', mrEngImage_PSign.HelpKeyword);
        dbUpdPerson('EngName', EngName, 'EngGender', IntToStr(mrComboBox__ssGender.ItemIndex));
        dbUpdPerson('EngName', EngName, 'EngEthnicity', IntToStr(mrComboBox_ssEthnicity.ItemIndex));
        dbUpdPerson('EngName', EngName, 'EngModelPhoto', mrEdit_ssModelPhoto.Text);

        dbUpdPerson('EngName', EngName, 'RusName', mrRusEdit_OName.Text);
        dbUpdPerson('EngName', EngName, 'RusAddress', mrRusEdit_OAddress.Text);
        dbUpdPerson('EngName', EngName, 'RusCity', mrRusEdit_OCity.Text);
        dbUpdPerson('EngName', EngName, 'RusState', mrRusEdit_OState.Text);
        dbUpdPerson('EngName', EngName, 'RusCountry', IntToStr(Integer(mrRusComboBox_OCountry.Items.Objects[mrRusComboBox_OCountry.ItemIndex])));
        dbUpdPerson('EngName', EngName, 'RusZip', mrRusEdit_OZipCode.Text);
        dbUpdPerson('EngName', EngName, 'RusPhone', mrRusEdit_OPhone.Text);
        dbUpdPerson('EngName', EngName, 'RusEmail', mrRusEdit_OEmail.Text);
        dbUpdPerson('EngName', EngName, 'RusSignature', mrRusImage_OSign.HelpKeyword);
      end;
  finally
    sqldb.Commit;
    dbGetPersonNameList(rListBox_dbNameList, Form4.rComboBox_dbNameList);
  end;
end;
procedure TForm1.mrEngSB_OClearClick(Sender: TObject);
begin
  mrEngEdit_OName.Clear;
  mrEngEdit_OAddress.Clear;
  mrEngEdit_OCity.Clear;
  mrEngEdit_OState.Clear;
  mrEngComboBox_OCountry.ItemIndex:=0;
  mrEngEdit_OZipCode.Clear;
  mrEngEdit_OPhone.Clear;
  mrEngEdit_OEmail.Clear;
  mrEngEdit_ODate.Date:=today;
  mrEngEdit_ODateBirth.Date:=today;
  mrEngImage_OSign.HelpKeyword:='';
  mrEngImage_OSign.Picture.Clear;

  mrEdit_ssModelPhoto.Text:='';
  mrEdit_ssNote.Text:='';
  mrComboBox__ssGender.ItemIndex:=0;
  mrComboBox_ssEthnicity.ItemIndex:=16;
  AllPrint;
end;
//////////

///////////////////////////// mrEng buttons Witness
procedure TForm1.mrEngSB_WbuttonsMouseEnter(Sender: TObject);
begin
  mrEngSB_WClear.Visible:=true;
  mrEngSB_dbWLoad.Visible:=true;
  mrEngSB_dbWUpdate.Visible:=true;
end;
procedure TForm1.mrEngSB_WbuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(mrEngSB_WClear)=false then mrEngSB_WClear.Visible:=false;
  if MouseInSpeedButton(mrEngSB_dbWLoad)=false then mrEngSB_dbWLoad.Visible:=false;
  if MouseInSpeedButton(mrEngSB_dbWUpdate)=false then mrEngSB_dbWUpdate.Visible:=false;
end;
procedure TForm1.mrEngSB_dbWLoadClick(Sender: TObject);
begin
  rListBox_dbNameList.HelpKeyword:='mrW';
  ShowPersonList(Sender);
  (Sender as TSpeedButton).Visible:=false;
end;
procedure TForm1.mrEngSB_dbWUpdateClick(Sender: TObject);
var
  EngName: string;
begin
  EngName:=mrEngEdit_WName.Text;
  sqldb.BeginTransaction;
  try
    if not dbAddPerson(EngName) then
      Showmessage(Trl_FillNamefieldinENGform)
    else
      begin
        //dbUpdPerson('EngName', EngName, 'EngDate', ConvertToSettingDateFormat(mrEngEdit_WDate.Date));
        dbUpdPerson('EngName', EngName, 'EngSignature', mrEngImage_WSign.HelpKeyword);
        dbUpdPerson('EngName', EngName, 'RusName', mrRusEdit_WName.Text);
        //dbUpdPerson('EngName', EngName, 'RusDate', ConvertToSettingDateFormat(prRusEdit_WDate.Date));
        dbUpdPerson('EngName', EngName, 'RusSignature', mrRusImage_WSign.HelpKeyword);
      end;
  finally
    sqldb.Commit;
    dbGetPersonNameList(rListBox_dbNameList, Form4.rComboBox_dbNameList);
  end;
end;
procedure TForm1.mrEngSB_WClearClick(Sender: TObject);
begin
  mrEngEdit_WName.Clear;
  mrEngEdit_WDate.Date:=today;
  mrEngImage_WSign.HelpKeyword:='';
  mrEngImage_WSign.Picture.Clear;
  AllPrint;
end;
/////////////////////////
//////////////////////////////////////////////////




///////////////////////////// mrEng Name photographer
procedure TForm1.mrEngEdit_PNameChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  mrEngEdit_OName.Text:=(Sender as TEdit).Text;
end;

procedure TForm1.mrEngEdit_PNameMouseLeave(Sender: TObject);
begin

end;

//////////

///////////////////////////// mrEng Name Owner
procedure TForm1.mrEngEdit_ONameChange(Sender: TObject);
begin
  FillFirstLastNAME(mrEngEdit_OName.Text);
  mrAutoFill_MRname;
end;
//////////

///////////////////////////// mrEng Address photographer
procedure TForm1.mrEngEdit_PAddressChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  mrEngEdit_OAddress.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrEng City photographer
procedure TForm1.mrEngEdit_PCityChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  mrEngEdit_OCity.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrEng State photographer
procedure TForm1.mrEngEdit_PStateChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  mrEngEdit_OState.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrEng Country photographer
procedure TForm1.mrEngComboBox_PCountryChange(Sender: TObject);
begin
  mrRusComboBox_PCountry.ItemIndex:=(Sender as TComboBox).ItemIndex;
  ifSelf_ComboBox(Sender, mrEngComboBox_OCountry);
  ifSelf_ComboBox(Sender, mrRusComboBox_OCountry);
  AllPrint;
end;
procedure TForm1.mrEngSB_PCountryClick(Sender: TObject);
begin
  mrEngComboBox_PCountry.DroppedDown:=true;
end;
//////////

///////////////////////////// mrEng Country Owner
procedure TForm1.mrEngComboBox_OCountryChange(Sender: TObject);
begin
  mrRusComboBox_OCountry.ItemIndex:=mrEngComboBox_OCountry.ItemIndex;
  AllPrint;
end;
procedure TForm1.mrEngSB_OCountryClick(Sender: TObject);
begin
  mrEngComboBox_OCountry.DroppedDown:=true;
end;
//////////

///////////////////////////// mrEng ZipCode photographer
procedure TForm1.mrEngEdit_PZipCodeChange(Sender: TObject);
begin
  mrRusEdit_PZipCode.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  mrEngEdit_OZipCode.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrEng ZipCode Owner
procedure TForm1.mrEngEdit_OZipCodeChange(Sender: TObject);
begin
  mrRusEdit_OZipCode.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrEng Phone photographer
procedure TForm1.mrEngEdit_PPhoneChange(Sender: TObject);
begin
  mrRusEdit_PPhone.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  mrEngEdit_OPhone.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrEng Phone Owner
procedure TForm1.mrEngEdit_OPhoneChange(Sender: TObject);
begin
  mrRusEdit_OPhone.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrEng Email photographer
procedure TForm1.mrEngEdit_PEmailChange(Sender: TObject);
begin
  mrRusEdit_PEmail.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  mrEngEdit_OEmail.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrEng Email Owner
procedure TForm1.mrEngEdit_OEmailChange(Sender: TObject);
begin
  mrRusEdit_OEmail.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrEng Date photographer
procedure TForm1.mrEngEdit_PDateChange(Sender: TObject);
begin
  mrRusEdit_PDate.Date:=(Sender as TDateEdit).Date;
  mrEngEdit_WDate.Date:=(Sender as TDateEdit).Date;  //если нужно потом выключить
  if rCheckBox_Self.Checked then
    mrEngEdit_ODate.Date:=(Sender as TDateEdit).Date;
  AllPrint;
end;
procedure TForm1.mrEngSB_PDateClick(Sender: TObject);
begin
  mrEngEdit_PDate.Button.Click;
end;
//////////

///////////////////////////// mrEng ShootDate photographer
procedure TForm1.mrEngEdit_PShootDateChange(Sender: TObject);
begin
  AllPrint;
end;

procedure TForm1.mrEngEdit_PShootDescriptionChange(Sender: TObject);
begin
  mrAutoFill_MRname;
end;

procedure TForm1.mrEngSB_PShootDateClick(Sender: TObject);
begin
  mrEngEdit_PShootDate.Button.Click;
end;
//////////

///////////////////////////// mrEng Date Owner
procedure TForm1.mrEngEdit_ODateChange(Sender: TObject);
begin
  mrRusEdit_ODate.Date:=(Sender as TDateEdit).Date;
  //ssShootingDate:=(Sender as TDateEdit).Text;
  //FillStockSubmitterfields;
  AllPrint;
end;
procedure TForm1.mrEngSB_ODateClick(Sender: TObject);
begin
  mrEngEdit_ODate.Button.Click;
end;
//////////

///////////////////////////// mrEng DateBirth Owner
procedure TForm1.mrEngEdit_ODateBirthChange(Sender: TObject);
begin
  //ssShootingDate:=(Sender as TDateEdit).Text;
  //FillStockSubmitterfields;
  AllPrint;
end;
procedure TForm1.mrEngSB_ODateBirthClick(Sender: TObject);
begin
  mrEngEdit_ODateBirth.Button.Click;
end;
//////////

///////////////////////////// mrEng Date Witness
procedure TForm1.mrEngEdit_WDateChange(Sender: TObject);
begin
  mrRusEdit_WDate.Date:=(Sender as TDateEdit).Date;
  AllPrint;
end;
procedure TForm1.mrEngSB_WDateClick(Sender: TObject);
begin
  mrEngEdit_WDate.Button.Click;
end;
//////////


/////////////////////////////// mrEng Signature Photographer
procedure TForm1.mrEngSB_PSignatureClick(Sender: TObject);
var
  f: string;
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_PSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   // 'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      f:= OpenDlg.FileName;
      mrEngImage_PSign.Picture.LoadFromFile(f);
      mrEngImage_PSign.HelpKeyword:=f;
      if rCheckBox_Self.Checked=true then
        begin
          mrEngImage_OSign.Picture.LoadFromFile(f);
          mrEngImage_OSign.HelpKeyword:=f;
        end;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.mrEngImage_PSignDblClick(Sender: TObject);
begin
  (Sender as TImage).HelpKeyword:='';
  (Sender as TImage).Picture.Clear;
  if rCheckBox_Self.Checked then
    begin
      mrEngImage_OSign.HelpKeyword:='';
      mrEngImage_OSign.Picture.Clear;
    end;
  AllPrint;
end;

procedure TForm1.mrEngImage_PSignPictureChanged(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
    mrEngImage_OSign.Picture:=mrEngImage_PSign.Picture;
end;

///////////


/////////////////////////////// mrEng Signature Owner
procedure TForm1.mrEngSB_OSignatureClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_OSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   //  'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      mrEngImage_OSign.Picture.LoadFromFile(OpenDlg.FileName);
      mrEngImage_OSign.HelpKeyword:=OpenDlg.FileName;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.mrEngImage_OSignDblClick(Sender: TObject);
begin
  if rCheckBox_Self.Checked=false then
    begin
      (Sender as TImage).HelpKeyword:='';
      (Sender as TImage).Picture.Clear;
      AllPrint;
    end;
end;
///////////


/////////////////////////////// mrEng Signature Witness
procedure TForm1.mrEngSB_WSignatureClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_WSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   //  'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      mrEngImage_WSign.Picture.LoadFromFile(OpenDlg.FileName);
      mrEngImage_WSign.HelpKeyword:=OpenDlg.FileName;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.mrGroupBoxFileResize(Sender: TObject);
begin
  mrEditCustomTitle.Width:= mrGroupBoxFile.Width-20;
end;
procedure TForm1.mrEngImage_WSignDblClick(Sender: TObject);
begin
  (Sender as TImage).HelpKeyword:='';
  (Sender as TImage).Picture.Clear;
  AllPrint;
end;
///////////




////////////////////////////////////////////////////////////////////////////////
///////////////////////////// mrRus buttons photographer
procedure TForm1.mrRusSB_PbuttonsMouseEnter(Sender: TObject);
begin
  mrRusSB_PClear.Visible:=true;
  mrRusSB_dbPLoad.Visible:=true;
  mrRusSB_dbPUpdate.Visible:=true;
end;
procedure TForm1.mrRusSB_PbuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(mrRusSB_PClear)=false then mrRusSB_PClear.Visible:=false;
  if MouseInSpeedButton(mrRusSB_dbPLoad)=false then mrRusSB_dbPLoad.Visible:=false;
  if MouseInSpeedButton(mrRusSB_dbPUpdate)=false then mrRusSB_dbPUpdate.Visible:=false;
end;
procedure TForm1.mrRusSB_PClearClick(Sender: TObject);
begin
  mrRusEdit_PName.Clear;
  mrRusEdit_PName2.Clear;
  mrRusEdit_PAddress.Clear;
  mrRusEdit_PCity.Clear;
  mrRusEdit_PState.Clear;
  mrRusComboBox_PCountry.ItemIndex:=0;
  mrRusComboBox_PCountryChange(mrRusComboBox_PCountry);
  mrEngComboBox_PCountryChange(mrEngComboBox_PCountry);
  mrRusEdit_PZipCode.Clear;
  mrRusEdit_PPhone.Clear;
  mrRusEdit_PEmail.Clear;
  mrRusEdit_PDate.Date:=today;
  mrRusImage_PSign.HelpKeyword:='';
  mrRusImage_PSign.Picture.Clear;

  if rCheckBox_Self.Checked=true then mrRusSB_OClear.Click;
  AllPrint;
end;

///////////////////////////// mrRus buttons Owner
procedure TForm1.mrRusSB_ObuttonsMouseEnter(Sender: TObject);
begin
  mrRusSB_OClear.Visible:=true;
  mrRusSB_dbOLoad.Visible:=true;
  mrRusSB_dbOUpdate.Visible:=true;
end;
procedure TForm1.mrRusSB_ObuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(mrRusSB_OClear)=false then mrRusSB_OClear.Visible:=false;
  if MouseInSpeedButton(mrRusSB_dbOLoad)=false then mrRusSB_dbOLoad.Visible:=false;
  if MouseInSpeedButton(mrRusSB_dbOUpdate)=false then mrRusSB_dbOUpdate.Visible:=false;
end;
procedure TForm1.mrRusSB_OClearClick(Sender: TObject);
begin
  mrRusEdit_OName.Clear;
  mrRusEdit_OAddress.Clear;
  mrRusEdit_OCity.Clear;
  mrRusEdit_OState.Clear;
  mrRusComboBox_OCountry.ItemIndex:=0;
  mrRusEdit_OZipCode.Clear;
  mrRusEdit_OPhone.Clear;
  mrRusEdit_OEmail.Clear;
  mrRusEdit_ODate.Date:=today;
  mrRusImage_OSign.HelpKeyword:='';
  mrRusImage_OSign.Picture.Clear;
  AllPrint;
end;

///////////////////////////// mrRus buttons Witness
procedure TForm1.mrRusSB_WbuttonsMouseEnter(Sender: TObject);
begin
  mrRusSB_WClear.Visible:=true;
  mrRusSB_dbWLoad.Visible:=true;
  mrRusSB_dbWUpdate.Visible:=true;
end;
procedure TForm1.mrRusSB_WbuttonsMouseLeave(Sender: TObject);
begin
  if MouseInSpeedButton(mrRusSB_WClear)=false then mrRusSB_WClear.Visible:=false;
  if MouseInSpeedButton(mrRusSB_dbWLoad)=false then mrRusSB_dbWLoad.Visible:=false;
  if MouseInSpeedButton(mrRusSB_dbWUpdate)=false then mrRusSB_dbWUpdate.Visible:=false;
end;
procedure TForm1.mrRusSB_WClearClick(Sender: TObject);
begin
  mrRusEdit_WName.Clear;
  mrRusEdit_WDate.Date:=today;
  mrRusImage_WSign.HelpKeyword:='';
  mrRusImage_WSign.Picture.Clear;
  AllPrint;
end;
////






////////////////////////////////////////////////////////////////////////////////
///////////////////////////// mrRus Name photographer
procedure TForm1.mrRusEdit_PNameChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  mrRusEdit_OName.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrRus Name Owner
//////////

///////////////////////////// mrRus Name Witness
//////////

///////////////////////////// mrRus Address photographer
procedure TForm1.mrRusEdit_PAddressChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  mrRusEdit_OAddress.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrRus Address Owner
//////////

///////////////////////////// mrRus City photographer
procedure TForm1.mrRusEdit_PCityChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  mrRusEdit_OCity.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrRus City Owner
//////////

///////////////////////////// mrRus State photographer
procedure TForm1.mrRusEdit_PStateChange(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
  mrRusEdit_OState.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrRus Country photographer
procedure TForm1.mrRusComboBox_PCountryChange(Sender: TObject);
begin
  mrEngComboBox_PCountry.ItemIndex:=(Sender as TComboBox).ItemIndex;
  ifSelf_ComboBox(Sender, mrRusComboBox_OCountry);
  ifSelf_ComboBox(Sender, mrEngComboBox_OCountry);
  AllPrint;
end;
procedure TForm1.mrRusSB_PCountryClick(Sender: TObject);
begin
  mrRusComboBox_PCountry.DroppedDown:=true;
end;
//////////

///////////////////////////// mrRus Country Owner
procedure TForm1.mrRusComboBox_OCountryChange(Sender: TObject);
begin
  mrEngComboBox_OCountry.ItemIndex:=(Sender as TComboBox).ItemIndex;
  //mrEngComboBox_OCountryChange(mrEngComboBox_OCountry);
  AllPrint;
end;
procedure TForm1.mrRusSB_OCountryClick(Sender: TObject);
begin
  mrRusComboBox_OCountry.DroppedDown:=true;
end;
//////////

///////////////////////////// mrRus ZipCode photographer
procedure TForm1.mrRusEdit_PZipCodeChange(Sender: TObject);
begin
  mrEngEdit_PZipCode.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  mrRusEdit_OZipCode.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrRus ZipCode Owner
procedure TForm1.mrRusEdit_OZipCodeChange(Sender: TObject);
begin
  mrEngEdit_OZipCode.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrRus Phone photographer
procedure TForm1.mrRusEdit_PPhoneChange(Sender: TObject);
begin
  mrEngEdit_PPhone.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  mrRusEdit_OPhone.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrRus Phone Owner
procedure TForm1.mrRusEdit_OPhoneChange(Sender: TObject);
begin
  mrEngEdit_OPhone.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrRus Email photographer
procedure TForm1.mrRusEdit_PEmailChange(Sender: TObject);
begin
  mrEngEdit_PEmail.Text:=(Sender as TEdit).Text;
  if rCheckBox_Self.Checked=true then
  mrRusEdit_OEmail.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrRus Email Owner
procedure TForm1.mrRusEdit_OEmailChange(Sender: TObject);
begin
  mrEngEdit_OEmail.Text:=(Sender as TEdit).Text;
end;
//////////

///////////////////////////// mrRus Date photographer
procedure TForm1.mrRusEdit_PDateChange(Sender: TObject);
begin
  mrEngEdit_PDate.Date:=(Sender as TDateEdit).Date;
  mrRusEdit_WDate.Date:=(Sender as TDateEdit).Date;  //если нужно потом выключить
  if rCheckBox_Self.Checked then
    mrRusEdit_ODate.Date:=(Sender as TDateEdit).Date;
  AllPrint;
end;
procedure TForm1.mrRusSB_PDateClick(Sender: TObject);
begin
  mrRusEdit_PDate.Button.Click;
end;
//////////

///////////////////////////// mrRus Date Owner
procedure TForm1.mrRusEdit_ODateChange(Sender: TObject);
begin
  mrEngEdit_ODate.Date:=(Sender as TDateEdit).Date;
  AllPrint;
end;
procedure TForm1.mrRusSB_ODateClick(Sender: TObject);
begin
  mrRusEdit_ODate.Button.Click;
end;
//////////

///////////////////////////// mrRus Date Witness
procedure TForm1.mrRusEdit_WDateChange(Sender: TObject);
begin
  mrEngEdit_WDate.Date:=(Sender as TDateEdit).Date;
  AllPrint;
end;
procedure TForm1.mrRusSB_WDateClick(Sender: TObject);
begin
  mrRusEdit_WDate.Button.Click;
end;
//////////

/////////////////////////////// mrRus Signature Photographer
procedure TForm1.mrRusSB_PSignatureClick(Sender: TObject);
var
  f: string;
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_mrRusPSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';
  if OpenDlg.Execute then
    begin
      f:= OpenDlg.FileName;
      mrRusImage_PSign.Picture.LoadFromFile(f);
      mrRusImage_PSign.HelpKeyword:=f;
      if rCheckBox_Self.Checked=true then
        begin
          mrRusImage_OSign.Picture.LoadFromFile(f);
          mrRusImage_OSign.HelpKeyword:=f;
        end;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.mrRusImage_PSignDblClick(Sender: TObject);
begin
  (Sender as TImage).HelpKeyword:='';
  (Sender as TImage).Picture.Clear;
  if rCheckBox_Self.Checked then
    begin
      mrRusImage_OSign.HelpKeyword:='';
      mrRusImage_OSign.Picture.Clear;
    end;
  AllPrint;
end;
procedure TForm1.mrRusImage_PSignPictureChanged(Sender: TObject);
begin
  if rCheckBox_Self.Checked=true then
    mrRusImage_OSign.Picture:=(Sender as TImage).Picture;
end;

///////////

/////////////////////////////// mrRus Signature Owner
procedure TForm1.mrRusSB_OSignatureClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_mrRusOSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';
  if OpenDlg.Execute then
    begin
      mrRusImage_OSign.Picture.LoadFromFile(OpenDlg.FileName);
      mrRusImage_OSign.HelpKeyword:=OpenDlg.FileName;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.mrRusImage_OSignDblClick(Sender: TObject);
begin
  if rCheckBox_Self.Checked=false then
    begin
      (Sender as TImage).HelpKeyword:='';
      (Sender as TImage).Picture.Clear;
      AllPrint;
    end;
end;
///////////

/////////////////////////////// mrRus Signature Witness
procedure TForm1.mrRusSB_WSignatureClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_mrRusWSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   //  'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      mrRusImage_WSign.Picture.LoadFromFile(OpenDlg.FileName);
      mrRusImage_WSign.HelpKeyword:=OpenDlg.FileName;
      AllPrint;
    end;
  OpenDlg.Free;
end;
procedure TForm1.mrRusImage_WSignDblClick(Sender: TObject);
begin
  (Sender as TImage).HelpKeyword:='';
  (Sender as TImage).Picture.Clear;
  AllPrint;
end;
///////////



end.


