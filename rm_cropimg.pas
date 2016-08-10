unit RM_CropImg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm2 }
  TForm2 = class(TForm)
    prImageCrop: TImage;
    prSelShape: TShape;
    procedure FormResize(Sender: TObject);
    procedure prImageCropMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure prImageCropMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure prImageCropMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;
  PrevX, PrevY: Integer;
  MouseIsDown: Boolean;
  Bmp2: TBitmap;

implementation

uses RM_main, RM_Additional;

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormResize(Sender: TObject);
var
  W1,H1,W2,H2: Integer;
begin
  W1:= prImageCrop.Picture.Bitmap.Width;
  H1:= prImageCrop.Picture.Bitmap.Height;
  W2:= prImageCrop.Width;
  H2:= prImageCrop.Height;
  if (W2>W1) and (H2>H1) then
    begin
      Form2.Width:= W1;
      Form2.Height:=H1;
    end;
end;

procedure TForm2.prImageCropMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then begin
    MouseIsDown:=True;
    PrevX:=X;
    PrevY:=Y;
    prSelShape.Visible:=True;
    prImageCropMouseMove(Sender,Shift,X,Y);
  end;
end;

procedure TForm2.prImageCropMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  tempX,tempY: integer;
begin
  if MouseIsDown = true then
    begin
      tempX:=PrevX;
      tempY:=PrevY;
      SwapIfMinus(tempX,X);
      SwapIfMinus(tempY,Y);
      prSelShape.SetBounds(tempX,tempY,abs(X-tempX),abs(y-tempY));
    end;
end;

procedure TForm2.prImageCropMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  rect1, rect2: TRect;
  destwidth, destheight,W1,H1,W2,H2: Integer;
  IndexResize: Real;
begin
  Bmp2:=TBitmap.Create;
  Bmp2.Width:=Screen.Width;
  Bmp2.Height:=Screen.Height;
  Bmp2.Canvas.Brush.Color:=clWhite;
  Bmp2.Canvas.FillRect(0,0, Bmp2.Canvas.Width, Bmp2.Canvas.Height);

  MouseIsDown:=False;
  prSelShape.Visible:=False;
  prImageCrop.Refresh;
  destwidth:=abs(X-PrevX);
  destheight:=abs(Y-PrevY);

  W1:= prImageCrop.Picture.Bitmap.Width;
  H1:= prImageCrop.Picture.Bitmap.Height;
  W2:= prImageCrop.Width;
  H2:= prImageCrop.Height;
  if (W1/W2)<(H1/H2) then IndexResize:=H1/H2;
  if (H1/H2)<(W1/W2) then IndexResize:=W1/W2;
  if (H1/H2)=(W1/W2) then IndexResize:=W1/W2;
  Bmp2.SetSize(Round(destwidth*IndexResize), Round(destheight*IndexResize));

  with rect1 do
    begin
      Left:=0;
      Top:=0;
      Right:=Left+destwidth;
      Bottom:=Top+destheight;
    end;

  with rect2 do
    begin
      Left:=prSelShape.Left;
      Top:=prSelShape.Top;
      Right:=Left+destwidth;
      Bottom:=Top+destheight;
    end;

    temporaryImg.SetBounds(
      temporaryImg.Left+(temporaryImg.Width div 2)-(destwidth div 2),
      temporaryImg.Top+(temporaryImg.Height div 2)-(destheight div 2),
      destwidth,destheight);
    Bmp2.Canvas.CopyRect(RectReSize(rect1, IndexResize),
      prImageCrop.Picture.Bitmap.Canvas, RectReSize(rect2, IndexResize));
    temporaryImg.Picture.Bitmap:= Bmp2;

    form2.Close;
    Form1.AllPrint;
    FreeAndNil(bmp2);
end;

end.

