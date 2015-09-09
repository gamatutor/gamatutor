unit zooming;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,primitifplayer, Menus;

type
  TForm5 = class(TForm)
    PaintBox1: TPaintBox;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  bolehzooming:boolean;
implementation
uses player;
{$R *.dfm}

procedure TForm5.FormShow(Sender: TObject);
var
  item:listofimage;
begin
 try
  if(form1.speedbutton1.Enabled=true)then
  begin
    if (listframe.Count>0) then
    begin
      bolehzooming:=true;
      new(item);
      item:=listframe.Items[prevanimcount];

      if(((prevanimcount>=listframe.Count-1)and(prevanimcursor>=item.ImagePointer.Count-1))
         or(form1.trackbar1.Position>=form1.trackbar1.Max))then
      begin
        form1.richedit1.Lines.Clear;
        AnimCount:=0;
        counter:=0;
        prevanimcount:=0;
        prevanimcursor:=0;
        form1.trackbar1.Position:=0;
      end;
      animstatus:=true;
      form1.timer1.Enabled:=true;
    end;
  end;
 except
 end;
 form1.hide;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
   bolehzooming:=false;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    bolehzooming:=false;
    form1.Show;
end;

procedure TForm5.PaintBox1Paint(Sender: TObject);
var
  temp,itemku:listofimage;
  itempointerku:listofpointer;
 // middleku:Tpoint;
  rect3,rect4,rectku,myrect:Trect;
 // screenpoint:Tpoint;
  xbawah,ybawah:integer;
begin
 if((form1.timer1.Enabled=false)and(animstatus=true)and(listframe.Count>0))then
 begin
   new(itemku);
   itemku:=listframe.Items[prevAnimCount];
   new(itempointerku);
   if(itemku.ImagePointer.Count=0)then
   begin
     if (itemku=listframe.First) then
     begin
       animstatus:=false;
       exit;
     end else
     begin
       new(temp);
       temp:=listframe.Items[prevanimcount-1];
       itempointerku:=temp.ImagePointer.Last;
     end;
   end else
   begin
     new(temp);
     temp:=listframe.Items[prevanimcount];
     itempointerku:=temp.ImagePointer.Items[PrevAnimcursor];
   end;
   if (temp.ImagePointer.Count=1)then
   begin

     if (itemku<>listframe.Last)then
     begin
       itemku:=listframe.Items[prevanimcount+1];
     end else
     begin
       itemku:=listframe.Items[prevanimcount];
     end;

     paintbox1.Canvas.Draw(0,0,itemku.ImageFile);
     {********tampilkan list of pointer***************}
     if((itempointerku.PointerSecondPos.X=-999)
        and(itempointerku.PointerSecondPos.Y=-999))then
     begin

       classPointer.MousePointing(true,itempointerku.PointerFirstPos.X,itempointerku.PointerFirstPos.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
       classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);

     end else
     begin

       classPointer.MousePointing(true,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
       classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);

     end;
   end else
   begin

     if(itempointerku<>temp.ImagePointer.Last)then
     begin
       paintbox1.Canvas.Draw(0,0,itemku.ImageFile);

       if((itempointerku.PointerSecondPos.X=-999)
          and(itempointerku.PointerSecondPos.Y=-999))then
       begin

         classPointer.MousePointing(true,itempointerku.PointerFirstPos.X,itempointerku.PointerFirstPos.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);

       end else
       begin

         classPointer.MousePointing(true,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);

       end;
     end else
     if(itempointerku=temp.ImagePointer.last)then
     begin

       if (itemku<>listframe.Last)then
       begin
         itemku:=listframe.Items[prevanimcount+1];
       end else
       begin
         itemku:=listframe.Items[prevanimcount];
       end;

       paintbox1.Canvas.Draw(0,0,itemku.ImageFile);
       if((itempointerku.PointerSecondPos.X=-999)
          and(itempointerku.PointerSecondPos.Y=-999))then
       begin
         classPointer.MousePointing(true,itempointerku.PointerFirstPos.X,itempointerku.PointerFirstPos.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);

       end else
       begin

         classPointer.MousePointing(true,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);

       end;
     end ;
   end;

 end;
end;

procedure TForm5.PaintBox1Click(Sender: TObject);
begin
   form5.Close;
end;

end.
