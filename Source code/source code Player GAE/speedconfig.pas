unit speedconfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses player;
{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
 if((strtoint(combobox1.Text)>0)and(strtoint(combobox2.Text)>0))then
 begin
   invalrect:=strtoint(combobox1.Text);
   invalcur:=strtoint(combobox2.Text);
 end;
 form3.Hide;
end;

end.
