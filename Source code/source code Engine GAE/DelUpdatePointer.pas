unit DelUpdatePointer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, jpeg;

type
  TForm4 = class(TForm)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  updatean: boolean;
implementation
uses desainer, PointerMouse;
{$R *.dfm}

procedure TForm4.BitBtn1Click(Sender: TObject);
var
  ScreenPoint:TPoint;
begin
   savefile:=false;
   form4.Hide;
   if radiogroup1.ItemIndex=0 then
   begin
     itemdelete.ImagePointer.Delete(posisidelete);
   end else
   begin
   //  showmessage('Update');
     updatean:=true;
     ScreenPoint:=ClassPointer.PointListToScreen(trueRect,itemUpdate.PointerFirstPos.X,itemUpdate.PointerFirstPos.Y);
     form1.Left:=ScreenPoint.x;
     form1.Top:=67+ScreenPoint.y;
     form1.Show;
   end;
end;

procedure TForm4.FormHide(Sender: TObject);

begin
   mainform.PaintBox1.Refresh;
   mainform.PaintBox2.Refresh;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
   updatean:=false;
end;

end.
