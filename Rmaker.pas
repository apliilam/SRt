program Rmaker;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, RM_main, lazcontrols, RM_Additional, RM_CropImg, RM_ProgressForm, 
  RM_Options, RM_Translate, rSQL;

{$R *.res}

begin
  Application.Title:='StockRelease';
  //Application.Title:='Release maker 0.1';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  //Application.CreateForm(TForm4, Form4);
  Application.Run;
end.

