unit PointerMouse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, jpeg;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    procedure Image1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
 

implementation
uses desainer,primitif,delUpdatePointer;
{$R *.dfm}

{**********************Private Declaration***************************}

{********************************************************************}
procedure TForm1.Image1Click(Sender: TObject);

begin
   // shape1.Brush.Color:=clskyblue;
   ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,1,filemouse);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  itemPointer,itemlast:listofpointer;
  itemImage:listofimage;
  i,PosKe:integer;
begin
 savefile:=false;
 if (updatean=false)then
 begin
  new(itemImage);
  itemImage:=listframe.Items[count];
  new(itemPointer);
  itemPointer.RectSize:=trueRect;
  if (filemouse<>'') then
  begin
    itemPointer.PointerName:=filemouse;
  end;
  itemPointer.PointerFile:=Tbitmap.Create;
  if (filemouse<>'') then
  begin
    itemPointer.PointerFile.LoadFromFile(itemPointer.PointerName);
  end;
  itemPointer.PointerFirstPos:=ClassPointer.PointScreenToList(TrueRect,titikmouse.X,titikmouse.Y);
  itemPointer.PointerSecondPos.X:=-999;
  itemPointer.PointerSecondPos.Y:=-999;
  itempointer.PointerText:=Tstringlist.Create;
  for i:=0 to form1.Memo1.Lines.Count-1 do
  begin
    if (form1.Memo1.Lines.Strings[i]<>'')then
    begin
      itemPointer.PointerText.Add(memo1.Lines.Strings[i]);
    end;
  end;
  if (itemimage.ImagePointer.Count<>0) then
  begin
    new(itemlast);
    itemlast:=itemImage.ImagePointer.Last;
    if((itemlast.PointerSecondPos.X<>-999)and(itemlast.PointerSecondPos.Y<>-999))then
    begin
      if (combobox1.ItemIndex-1=itemimage.ImagePointer.IndexOf(itemlast))then
      begin
        itemImage.ImagePointer.Insert(combobox1.ItemIndex-1,itemPointer);
      end else
      begin
        itemImage.ImagePointer.Insert(combobox1.ItemIndex,itemPointer);
      end;
    end else
    begin
      itemImage.ImagePointer.Insert(combobox1.ItemIndex,itemPointer);
    end;
  end else
  begin
    itemImage.ImagePointer.Insert(combobox1.ItemIndex,itemPointer);
  end;
  form1.Hide;
 end else
 if (updatean=true) then
 begin
   if (filemouse<>'') then
   begin
     itemUpdate.PointerName:=filemouse;
   end;
   itemUpdate.PointerFile:=Tbitmap.Create;
   if (filemouse<>'') then
   begin
     itemUpdate.PointerFile.LoadFromFile(itemUpdate.PointerName);
   end;
   itemUpdate.PointerText:=Tstringlist.Create;
   itemUpdate.PointerText.Clear;
   for i:=0 to form1.Memo1.Lines.Count-1 do
   begin
    if (form1.Memo1.Lines.Strings[i]<>'')then
    begin
      itemUpdate.PointerText.Add(memo1.Lines.Strings[i]);
    end;
   end;
   new(itemlast);
   itemlast:=itemdelete.ImagePointer.Last;

   PosKe:=itemdelete.ImagePointer.IndexOf(itemupdate);
   if ((itemupdate.PointerSecondPos.X=-999)
       and(itemupdate.PointerSecondPos.y=-999)
       and(itemlast.PointerSecondPos.X<>-999)
       and(itemlast.PointerSecondPos.Y<>-999))then
   begin
    // itemdelete.ImagePointer.Exchange(poske,combobox1.ItemIndex);
     if (combobox1.ItemIndex=itemdelete.ImagePointer.IndexOf(itemlast))then
     begin
       itemdelete.ImagePointer.Exchange(poske,combobox1.ItemIndex-1);
     end else
     begin
       itemdelete.ImagePointer.Exchange(poske,combobox1.ItemIndex);
     end;
   end else
   if ((itemupdate.PointerSecondPos.X=-999)
       and(itemupdate.PointerSecondPos.y=-999)
       and(itemlast.PointerSecondPos.X=-999)
       and(itemlast.PointerSecondPos.Y=-999))then
   begin
     itemdelete.ImagePointer.Exchange(poske,combobox1.ItemIndex);
   end else
   begin
     itemdelete.ImagePointer.Exchange(poske,poske);
   end;
 end;
 form1.Hide;
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
var
 temp,i:integer;
 kosong:boolean;
begin
   kosong:=true;
   i:=0;
   while ((kosong)and(i<=memo1.Lines.Count-1))do
   begin
     if(memo1.Lines.Strings[i]<>'')then
     begin
       kosong:=false;
     end else
     begin
       i:=i+1;
     end;
   end;
   if (kosong=true) then
   begin
     memo1.SelLength:=100;
     statusbar1.panels[2].text:=inttostr(100-memo1.GetTextLen);
   end;

   temp:=integer(key);

    if (strtoint(statusbar1.Panels[2].text)<=0)and(temp<>8)then
    begin
      memo1.ReadOnly:=true;

      statusbar1.Panels[2].Text:='0';

    end else
    if (strtoint(statusbar1.Panels[2].text)<=0)and(temp=8)then
    begin
      memo1.ReadOnly:=false;

    end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    statusbar1.Panels[2].Text:='100';
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  if (memo1.GetTextLen=1)or(memo1.GetTextLen=2) then
  begin
    statusbar1.panels[2].text:=inttostr(100-memo1.GetTextLen);
  end else
  begin
    statusbar1.panels[2].text:=inttostr(98-(memo1.GetTextLen-2));
  end;

end;

procedure TForm1.Image2Click(Sender: TObject);
begin
   ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,2,filemouse);
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
    ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,3,filemouse);
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
    ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,4,filemouse);
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
   ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,5,filemouse);
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
    ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,6,filemouse);
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
    ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,7,filemouse);
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
    ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,8,filemouse);
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
    ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,9,filemouse);
end;

procedure TForm1.Image10Click(Sender: TObject);
begin
    ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,10,filemouse);
end;

procedure TForm1.Image11Click(Sender: TObject);
begin
    ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,11,filemouse);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  item:ListofImage;
  i,choice,sum:integer;
begin
  memo1.ReadOnly:=false;
  new(item);
  item:= listframe.Items[count];
  if (updatean=false)then
  begin
    {**********inisialisasi awal**************************}
    bitbtn1.Enabled:=false;
    combobox1.Items.Clear;
    statusbar1.panels[2].text:='100';
    shape1.Brush.Color:=clwhite;
    shape2.Brush.Color:=clwhite;
    shape3.Brush.Color:=clwhite;
    shape4.Brush.Color:=clwhite;
    shape5.Brush.Color:=clwhite;
    shape6.Brush.Color:=clwhite;
    shape7.Brush.Color:=clwhite;
    shape8.Brush.Color:=clwhite;
    shape9.Brush.Color:=clwhite;
    shape10.Brush.Color:=clwhite;
    shape11.Brush.Color:=clwhite;
    {*****************************************************}
    if (item.ImagePointer.Count=0)then
    begin
      combobox1.Items.Add(inttostr(item.ImagePointer.count+1));
      combobox1.ItemIndex:=0;
    end else
    begin
      for i:=0 to item.ImagePointer.Count-1 do
      begin
        combobox1.Items.Add(inttostr(i+1));
      end;
      combobox1.Items.Add(inttostr(i+1));
      Combobox1.ItemIndex:=i;
    end;
  end else
  if (updatean=true)then
  begin
    classPointer.ShapeNumber(itemUpdate.PointerName,choice);
    ClassPointer.ChoiceShape(shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11,bitbtn1,choice,filemouse);

    combobox1.Items.Clear;
    for i:=0 to item.ImagePointer.Count-1 do
    begin
      combobox1.Items.Add(inttostr(i+1));
    end;
    combobox1.ItemIndex:=item.ImagePointer.IndexOf(itemUpdate);
    sum:=0;
    for i:=0 to itemUpdate.PointerText.Count-1 do
    begin
      Memo1.Lines.Add(itemUpdate.PointerText.Strings[i]);
      sum:=sum+2;
    end;
    if (itemUpdate.PointerText.Count=0) then
    begin
      statusbar1.panels[2].text:='100';
    end else
    begin
      statusbar1.panels[2].text:=inttostr(100-memo1.GetTextLen+sum);
    end;
  end;
end;

procedure TForm1.FormHide(Sender: TObject);
begin
   updatean:=false;
   memo1.Clear;
   mainform.PaintBox1.Refresh;
end;

end.
