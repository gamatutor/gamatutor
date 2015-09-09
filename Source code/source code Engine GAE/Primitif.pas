unit Primitif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, jpeg, xtea;

type
  ListOfPointer=^ListPointer;
  ListPointer=record
    RectSize:Trect;
    PointerName:string;
    PointerFile:Tbitmap;
    PointerFirstPos:TPoint;
    PointerSecondPos:Tpoint;
    PointerText:TStringList;
  end;

  ListPos=^ListofPos;
  ListofPos=record
    x:integer;
    y:integer;
  end;

  ListOfImage=^ListImage;
  ListImage=record
    ImageName:string;
    ImageFile:Tbitmap;
    ImagePointer:Tlist;
    ImageText:TstringList;
    ImageSound : Tstringlist; // path ke file sound
  end;

 Image = class
 public
    
    procedure CreateBMP(var Bmp:TBitmap);
    procedure CreateJPG(var jpg:TJpegImage);
    function IsInnerBidang(Titik:TPoint;Rect:TRect):boolean;
    procedure PermanentImage(rect:TRect;bmp:Tbitmap;var paintbox:TPaintbox);
    procedure FocusImage(animasi:boolean;item:listofimage;var TtkTengah:TPoint;var rect,rect2:TRect;var paintbox1,paintbox2:Tpaintbox;var bmp:Tbitmap);
    Procedure Bmp2Jpg (Bmp:Tbitmap;FileJpg:String;Comp : Integer);
    procedure jpg2bmp(FileImage:string;var Bmp: Tbitmap);
    procedure ImageStatus(filename:string;var empty:boolean;var Image:TImage);
    procedure PaintBoxCheck(Count:integer;Empty1,EmpTy2:boolean;var speedbutton1,speedbutton2:Tspeedbutton);



 end;

 MousePointer = class
 public
   procedure MousePointing(animate:boolean;var x,y:integer;EventKe:integer;var rect:TRect;bmp:TBitmap;var paintbox:TPaintbox);
   function PointScreenToList(TrueRect:Trect;Xpaint,Ypaint:integer):TPoint;
   procedure ChoiceShape(var shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11:Tshape;var bitbtn:TBItbtn;choice:integer;var fileMouse:string);
   procedure SearchTitik(x,y:integer;ListPointer:Tlist;var PosisiKe:Integer;var found:boolean);
   function PointListToScreen(TrueRect:Trect;XList,YList:integer):TPoint;
   procedure ShapeNumber(fileMouse:string;var choice:integer);
   function createRect(x,y:integer):TRect;
   procedure MousePointingM(animasi:boolean;var x,y:integer;EventKe:integer;var paintbox:TPaintbox);
   procedure ShowTextRect(textrect:Trect;var x,y:integer);
   procedure TextToRect(paintbox1:Tpaintbox;var x,y:integer;text:Tstringlist;var textrect:Trect);
 end;


 FileOp =Class
 public
   procedure ExtractFile(OldFileName:string;var NewFileName:String);
   procedure SaveToFileAnimasi(filename:string;ListScenario:Tlist);
   procedure OpenFileAnimasi(var progress:TProgressbar;filename:string;var Listscenario:Tlist);
   Procedure EncryptFile (filename, password : string);
   Procedure DecryptFile (filename, password : string);
 end;

 PreviewAnim = class
 public
   procedure Line(x1, y1, x2, y2:integer;color: TColor;var paintbox1:TPaintbox);
   procedure MoveObject(geser:boolean;textstring:tstringlist;Region:Trect;eventke,x1, y1, x2, y2:integer;bmpmouse,bmp:Tbitmap;var objek: TRect;var paintbox1,paintbox2:TPaintbox);
   procedure MoveRegion(item:listofimage;itempointer:listofpointer;eventke,x1, y1, x2, y2:integer;var bmp:Tbitmap;var Rect1,rect2: TRect;var paintbox1,paintbox2:TPaintbox);
   procedure AnimationExecute(bergerak:boolean;var Rect1,rect2: TRect;var paintbox1,paintbox2:TPaintbox;var imageku:Timage;image1,image2:listofimage;firstpos,secondpos:integer);
   procedure InitCursor(var InitImage:listofimage;image:Tbitmap;mousefile:Tbitmap;Region:Trect;position:Tpoint;name:string);
   procedure getlengthmovie(listscenario:Tlist;var len:integer;var PosArray:Tlist);
   function SearchPosition(posArray:Tlist;animcount,counter:integer):integer;
   procedure ZoomAnimationExecute(intervalRect,intervalCur:integer;bergerak:boolean;var paintbox1:TPaintbox;var imageku:Timage;image1,image2:listofimage;firstpos,secondpos:integer);
   procedure ZoomMoveObject(interval:integer;geser:boolean;textstring:tstringlist;eventke,x1, y1, x2, y2:integer;bmpmouse,bmp:Tbitmap;var objek: TRect;var paintbox1:TPaintbox);
 end;

implementation
{**************************Implementation of Image Class***********************}

procedure Image.createBMP(var bmp:TBitmap);
begin
  bmp:=tbitmap.create;
  bmp.Width:=800;
  bmp.Height:=600;
  
end;

procedure Image.createJPG(var jpg:TJpegImage);
begin
  jpg:=tjpegimage.create;
 // jpg.JPEGNeeded;
end;

procedure Image.ImageStatus(filename:string;var empty:boolean;var Image:TImage);
begin
  if (filename=extractfilepath(paramstr(0))+'image\EmptyImage.JPG')then
  begin
    image.Picture.LoadFromFile(extractfilepath(paramstr(0))+'image\EmptyImage.JPG');
    empty:=true;
  end else
  begin
    image.Picture.LoadFromFile(filename);
    empty:=false;
  end;
end;

function Image.IsInnerBidang(Titik:TPoint;Rect:TRect):boolean;
begin
  if ((titik.X >= rect.Left)and(titik.Y >= rect.Top))
       and((titik.X <= rect.Right)and(titik.Y <= rect.Bottom)) then
  begin
    IsInnerBidang:=true;
  end else
  begin
    IsInnerBidang:=false;
  end;

end;

procedure image.PermanentImage(rect:TRect;bmp:Tbitmap;var paintbox:TPaintbox);
var
  rect2,rect3:Trect;
begin
 try
  rect2.Left:=rect.Left*4;
  rect2.Top:=rect.Top*4;
  rect2.Right:=rect2.Left + (bmp.Width div 2);//400
  rect2.Bottom:=rect2.top + (bmp.height div 2);//300;

  rect3.Left:=0;
  rect3.Top:=0;
  rect3.Right:=paintbox.Width;
  rect3.Bottom:=paintbox.Height;

 // paintbox1.Repaintku;

  paintbox.Canvas.CopyRect(rect3,bmp.Canvas,rect2);

 except
 end;
end;

procedure Image.FocusImage(animasi:boolean;item:listofimage;var TtkTengah:TPoint;var rect,rect2:TRect;var paintbox1,paintbox2:Tpaintbox;var bmp:TBitmap);
var
  panjang,lebar,i:integer;
  rect3:Trect;
  itempointer:listofpointer;
  xbawah,ybawah:integer;
  classpointer:mousepointer;
begin
 try
  panjang:=paintbox2.Width div 4;
  lebar:=paintbox2.Height div 4;

  rect.Left:=TtkTengah.X-panjang;
  rect.Top:=TtkTengah.Y-lebar;
  rect.Right:=TtkTengah.X+panjang;
  rect.Bottom:=TtkTengah.Y+lebar;

  if(rect.Left < 0)then
  begin
    //rect.Left:=0;
    TtkTengah.X:=TtkTengah.X + abs(rect.Left);
  end;
  if(rect.Top < 0)then
  begin
    TtkTengah.Y:=TtkTengah.Y + abs(rect.Top)
  end;
  if(rect.Right > paintbox2.Width)then
  begin
    TtkTengah.X:=TtkTengah.X - abs(Rect.Right - paintbox2.Width);
  end;
  if(rect.Bottom > paintbox2.Height)then
  begin
    TtkTengah.y:=TtkTengah.y - abs(Rect.Bottom - paintbox2.Height);
  end;
  rect.Left:=TtkTengah.X-panjang;
  rect.Top:=TtkTengah.Y-lebar;
  rect.Right:=TtkTengah.X+panjang;
  rect.Bottom:=TtkTengah.Y+lebar;

  paintbox2.Canvas.MoveTo(rect.Left,rect.Top);
  paintbox2.Canvas.LineTo(rect.Right,rect.Top);
  paintbox2.Canvas.LineTo(rect.Right,rect.Bottom);
  paintbox2.Canvas.LineTo(rect.Left,rect.Bottom);
  paintbox2.Canvas.lineTo(rect.Left,rect.Top);



  rect2.Left:=rect.Left*4;
  rect2.Top:=rect.Top*4;
  rect2.Right:=rect2.Left + 400;
  rect2.Bottom:=rect2.top + 300;



  rect3.Left:=0;
  rect3.Top:=0;
  rect3.Right:=paintbox1.Width;
  rect3.Bottom:=paintbox1.Height;

  if (animasi=false)then
  begin
    if (item<>nil)then
    begin
      new(itemPointer);
      for i:=0 to item.ImagePointer.Count-1 do
      begin
        itemPointer:=item.ImagePointer.Items[i];
        xbawah:= itempointer.PointerFirstPos.X div 4;
        ybawah:= itempointer.PointerFirstPos.Y div 4;
        classPointer.MousePointingM(false,xbawah,ybawah,i+1,paintbox2);
      end;
    end;
  end;
  {paintbox1.Refresh;}

  paintbox1.Canvas.CopyRect(rect3,bmp.Canvas,rect2);

 except
 end;
end;

Procedure Image.Bmp2Jpg (Bmp:Tbitmap;fileJpg:string;Comp : Integer);
{1 = low quality , 100 good quality}
var
  jpg:TjpegImage;
begin
  createjpg(jpg);
  try
    if comp < 1 then exit;
    if comp > 100 then exit;
    Jpg.CompressionQuality := Comp;
    Jpg.Assign(bmp);
    jpg.SaveToFile(filejpg);

  finally
    jpg.Free;
   // bmp.Free;
  end;
end;

procedure Image.jpg2bmp(FileImage:string;var Bmp: Tbitmap);
var
  jpg:TjpegImage;
  bmptemp:Tbitmap;
  rectBMP:Trect;
begin
  createBMP(bmp);
  createjpg(jpg);
  createbmp(bmptemp);
  try
    jpg.LoadFromFile(fileImage);
    bmptemp.Assign(jpg);
    RectBMP.Left:=0;
    RectBMP.Top:=0;
    RectBMP.Right:=bmptemp.Width;
    RectBMP.Bottom:=bmptemp.Height;
    bmp.Canvas.CopyRect(rectBMP,bmptemp.Canvas,rectBMP);
  finally
    jpg.Free;
    bmptemp.Free;
  end;
end;

procedure Image.PaintBoxCheck(Count:integer;Empty1,EmpTy2:boolean;var speedbutton1,speedbutton2:Tspeedbutton);
begin
  if (count=0) then
  begin
    if (empty2=true)then
    begin
     speedbutton1.Enabled:=false;
     speedbutton2.Enabled:=false;
    end else
    if (empty2=false)then
    begin
      if(empty1=false)then
      begin
        speedbutton1.Enabled:=false;
        speedbutton2.Enabled:=true;
      end else
      begin
        speedbutton1.Enabled:=false;
        speedbutton2.Enabled:=false;
      end;
    end;
  end else
  begin
    if (empty2=true)then
    begin
     if(empty1=false)then
     begin
       speedbutton1.Enabled:=true;
       speedbutton2.Enabled:=false;
     end else
     begin
       speedbutton1.Enabled:=false;
       speedbutton2.Enabled:=false;
     end;
    end else
    if (empty2=false)then
    begin
      if(empty1=false)then
      begin
        speedbutton1.Enabled:=true;
        speedbutton2.Enabled:=true;
      end else
      begin
        speedbutton1.Enabled:=false;
        speedbutton2.Enabled:=false;
      end;
    end;
  end;
end;

//procedure Image.RefreshGambar(bmp:Tbitmap;var paintbox:Tpaintbox;Rect1,rect2:Trect);
//begin
//  Paintbox.Canvas.CopyRect(rect2,bmp.canvas,rect1);
//end;
{**************************Implementation of Pointer Class***********************}
procedure Mousepointer.MousePointing(animate:boolean;var x,y:integer;EventKe:integer;var rect:TRect;bmp:TBitmap;var paintbox:TPaintbox);
var
  i,j:integer;
  TextRect:TRect;
begin
 try

   
   bmp.Width:=25;
   bmp.Height:=25;

    for i:=0 to bmp.Width-1 do
    begin
      for j:=0 to bmp.Height-1 do
      begin
        if(bmp.Canvas.Pixels[i,j]<>clwhite)then
        begin
          paintbox.Canvas.Pixels[x+i,y+j]:=bmp.Canvas.Pixels[i,j];
        end;
      end;
    end;
    Rect.Left:=x;
    Rect.Top:=y;
    Rect.Right:=Rect.Left + bmp.Width;
    Rect.Bottom:=Rect.Top + bmp.Height;
    if (animate=false)then
    begin
      paintbox.Canvas.MoveTo(rect.Left,rect.Top);
      paintbox.Canvas.LineTo(rect.Right,rect.Top);
      paintbox.Canvas.LineTo(rect.Right,rect.Bottom);
      paintbox.Canvas.LineTo(rect.Left,rect.Bottom);
      paintbox.Canvas.lineTo(rect.Left,rect.Top);

      TextRect.Left:=x-1;
      TextRect.Top:=y-paintbox.Canvas.TextHeight(inttostr(eventKe))-1;
      TextRect.Right:=TextRect.Left+paintbox.Canvas.TextWidth(inttostr(eventKe))+3;
      TextRect.Bottom:=y+1;
      paintbox.Canvas.Rectangle(TextRect);
      Paintbox.Canvas.TextOut(x,y-paintbox.Canvas.TextHeight(inttostr(eventKe)),inttostr(eventKe));
    end;
 except
 end;
end;

procedure Mousepointer.MousePointingM(animasi:boolean;var x,y:integer;EventKe:integer;var paintbox:TPaintbox);
var
  TextRect:TRect;
begin
 try
    TextRect.Left:=x-3;
    TextRect.Top:=y-3;
    if (animasi=false) then
    begin
      TextRect.Right:=TextRect.Left+paintbox.Canvas.TextWidth(inttostr(eventKe))+7;
      TextRect.Bottom:=TextRect.Top+paintbox.Canvas.TextHeight(inttostr(eventKe))+5;
      paintbox.Canvas.Rectangle(TextRect);
      Paintbox.Canvas.TextOut(x,y,inttostr(eventKe));
    end else
    if(animasi=true)then
    begin
      TextRect.Right:=TextRect.Left+paintbox.Canvas.TextWidth(inttostr(1))+7;
      TextRect.Bottom:=TextRect.Top+paintbox.Canvas.TextHeight(inttostr(1))+5;
      paintbox.Canvas.Rectangle(TextRect);
    end;
 except
 end;
end;

function MousePointer.PointScreenToList(TrueRect:Trect;Xpaint,Ypaint:integer):TPoint;
begin
   PointScreenToList.X:=TrueRect.Left+Xpaint;
   PointScreenToList.Y:=trueRect.Top+Ypaint;
end;
function MousePointer.PointListToScreen(TrueRect:Trect;XList,YList:integer):TPoint;
begin
   PointListToScreen.X:=XList-TrueRect.Left;
   PointListToScreen.Y:=YList-TrueRect.Top;
end;
procedure MousePointer.ChoiceShape(var shape1,shape2,shape3,shape4,shape5,shape6,shape7,shape8,shape9,shape10,shape11:Tshape;var bitbtn:TBItbtn;choice:integer;var fileMouse:string);
begin
  case choice of
   1:begin
       shape1.Brush.Color:=clskyblue;
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
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse2.bmp';
       bitbtn.Enabled:=true;
     end;
   2:begin
       shape1.Brush.Color:=clwhite;
       shape2.Brush.Color:=clskyblue;
       shape3.Brush.Color:=clwhite;
       shape4.Brush.Color:=clwhite;
       shape5.Brush.Color:=clwhite;
       shape6.Brush.Color:=clwhite;
       shape7.Brush.Color:=clwhite;
       shape8.Brush.Color:=clwhite;
       shape9.Brush.Color:=clwhite;
       shape10.Brush.Color:=clwhite;
       shape11.Brush.Color:=clwhite;
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse6.bmp';
       bitbtn.Enabled:=true;
     end;
   3:begin
       shape1.Brush.Color:=clwhite;
       shape2.Brush.Color:=clwhite;
       shape3.Brush.Color:=clskyblue;
       shape4.Brush.Color:=clwhite;
       shape5.Brush.Color:=clwhite;
       shape6.Brush.Color:=clwhite;
       shape7.Brush.Color:=clwhite;
       shape8.Brush.Color:=clwhite;
       shape9.Brush.Color:=clwhite;
       shape10.Brush.Color:=clwhite;
       shape11.Brush.Color:=clwhite;
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse7.bmp';
       bitbtn.Enabled:=true;
     end;
   4:begin
       shape1.Brush.Color:=clwhite;
       shape2.Brush.Color:=clwhite;
       shape3.Brush.Color:=clwhite;
       shape4.Brush.Color:=clskyblue;
       shape5.Brush.Color:=clwhite;
       shape6.Brush.Color:=clwhite;
       shape7.Brush.Color:=clwhite;
       shape8.Brush.Color:=clwhite;
       shape9.Brush.Color:=clwhite;
       shape10.Brush.Color:=clwhite;
       shape11.Brush.Color:=clwhite;
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse8.bmp';
       bitbtn.Enabled:=true;
     end;
   5:begin
       shape1.Brush.Color:=clwhite;
       shape2.Brush.Color:=clwhite;
       shape3.Brush.Color:=clwhite;
       shape4.Brush.Color:=clwhite;
       shape5.Brush.Color:=clskyblue;
       shape6.Brush.Color:=clwhite;
       shape7.Brush.Color:=clwhite;
       shape8.Brush.Color:=clwhite;
       shape9.Brush.Color:=clwhite;
       shape10.Brush.Color:=clwhite;
       shape11.Brush.Color:=clwhite;
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse10.bmp';
       bitbtn.Enabled:=true;
     end;
   6:begin
       shape1.Brush.Color:=clwhite;
       shape2.Brush.Color:=clwhite;
       shape3.Brush.Color:=clwhite;
       shape4.Brush.Color:=clwhite;
       shape5.Brush.Color:=clwhite;
       shape6.Brush.Color:=clskyblue;
       shape7.Brush.Color:=clwhite;
       shape8.Brush.Color:=clwhite;
       shape9.Brush.Color:=clwhite;
       shape10.Brush.Color:=clwhite;
       shape11.Brush.Color:=clwhite;
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse11.bmp';
       bitbtn.Enabled:=true;
     end;
   7:begin
       shape1.Brush.Color:=clwhite;
       shape2.Brush.Color:=clwhite;
       shape3.Brush.Color:=clwhite;
       shape4.Brush.Color:=clwhite;
       shape5.Brush.Color:=clwhite;
       shape6.Brush.Color:=clwhite;
       shape7.Brush.Color:=clskyblue;
       shape8.Brush.Color:=clwhite;
       shape9.Brush.Color:=clwhite;
       shape10.Brush.Color:=clwhite;
       shape11.Brush.Color:=clwhite;
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse12.bmp';
       bitbtn.Enabled:=true;
     end;
   8:begin
       shape1.Brush.Color:=clwhite;
       shape2.Brush.Color:=clwhite;
       shape3.Brush.Color:=clwhite;
       shape4.Brush.Color:=clwhite;
       shape5.Brush.Color:=clwhite;
       shape6.Brush.Color:=clwhite;
       shape7.Brush.Color:=clwhite;
       shape8.Brush.Color:=clskyblue;
       shape9.Brush.Color:=clwhite;
       shape10.Brush.Color:=clwhite;
       shape11.Brush.Color:=clwhite;
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse13.bmp';
       bitbtn.Enabled:=true;
     end;
   9:begin
       shape1.Brush.Color:=clwhite;
       shape2.Brush.Color:=clwhite;
       shape3.Brush.Color:=clwhite;
       shape4.Brush.Color:=clwhite;
       shape5.Brush.Color:=clwhite;
       shape6.Brush.Color:=clwhite;
       shape7.Brush.Color:=clwhite;
       shape8.Brush.Color:=clwhite;
       shape9.Brush.Color:=clskyblue;
       shape10.Brush.Color:=clwhite;
       shape11.Brush.Color:=clwhite;
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse14.bmp';
       bitbtn.Enabled:=true;
     end;
   10:begin
       shape1.Brush.Color:=clwhite;
       shape2.Brush.Color:=clwhite;
       shape3.Brush.Color:=clwhite;
       shape4.Brush.Color:=clwhite;
       shape5.Brush.Color:=clwhite;
       shape6.Brush.Color:=clwhite;
       shape7.Brush.Color:=clwhite;
       shape8.Brush.Color:=clwhite;
       shape9.Brush.Color:=clwhite;
       shape10.Brush.Color:=clskyblue;
       shape11.Brush.Color:=clwhite;
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse15.bmp';
       bitbtn.Enabled:=true;
     end;
   11:begin
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
       shape11.Brush.Color:=clskyblue;
       filemouse:=extractfilepath(paramstr(0))+'mouse shape\pointermouse16.bmp';
       bitbtn.Enabled:=true;
     end;
  end;
end;

procedure MousePointer.ShapeNumber(fileMouse:string;var choice:integer);
begin
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse2.bmp') then
   begin
    choice:=1;
   end else
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse6.bmp') then
   begin
    choice:=2;
   end else
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse7.bmp') then
   begin
    choice:=3;
   end else
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse8.bmp') then
   begin
    choice:=4;
   end else
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse10.bmp') then
   begin
    choice:=5;
   end else
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse11.bmp') then
   begin
    choice:=6;
   end else
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse12.bmp') then
   begin
    choice:=7;
   end else
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse13.bmp') then
   begin
    choice:=8;
   end else
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse14.bmp') then
   begin
    choice:=9;
   end else
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse15.bmp') then
   begin
    choice:=10;
   end else
   if (filemouse=extractfilepath(paramstr(0))+'mouse shape\pointermouse16.bmp') then
   begin
    choice:=11;
   end;
end;
function mousepointer.createRect(x,y:integer):TRect;
begin
  createRect.Left:=x;
  createRect.Right:=x+25;
  createRect.Top:=y;
  createrect.Bottom:=y+25;
end;

procedure mousepointer.ShowTextRect(textrect:Trect;var x,y:integer);
var
  width,height:integer;
  temprect:TRect;
begin

  temprect.Left:=0;
  temprect.Top:=0;
  temprect.Right:=400;
  temprect.Bottom:=300;

  width:=abs(textrect.Right-textrect.Left);
  height:=abs(textrect.Bottom-textrect.Top);

  if(textrect.Right>temprect.Right)then
  begin
    x:=(x-25)-width;
    y:=y;
  end;
  if(textrect.Bottom>temprect.Bottom)then
  begin
    x:=x;
    y:=(y-height)+25;
  end;
end;

{procedure MousePointer.TextToRect(paintbox1:Tpaintbox;var x,y:integer;text:Tstringlist;var textrect:Trect);
var
  temp:TPoint;
  i,max:integer;
begin
   if (text.Count>0)then
   begin
     temp.X:=x+5;
     temp.Y:=y;
     max:=0;

     for i:=0 to text.Count-1 do
     begin
       if (text.Strings[i]<>'')then
       begin
         temp.Y:=temp.Y+15;
         if(max < paintbox1.Canvas.TextWidth(text.Strings[i]))then
         begin
           max:=paintbox1.Canvas.TextWidth(text.Strings[i]);
         end;
       end;
     end;

     textrect.Left:=x;
     textrect.Top:=y;
     textrect.Right:=x+max+10;
     textrect.Bottom:=temp.y+10;

     showtextrect(textrect,x,y);

     {************************************************************}
{     temp.X:=x+5;
     temp.Y:=y;
     max:=0;

     for i:=0 to text.Count-1 do
     begin
       if (text.Strings[i]<>'')then
       begin
         temp.Y:=temp.Y+15;
         if(max < paintbox1.Canvas.TextWidth(text.Strings[i]))then
         begin
           max:=paintbox1.Canvas.TextWidth(text.Strings[i]);
         end;
       end;
     end;

     {************************************************************}
{     textrect.Left:=x;
     textrect.Top:=y;
     textrect.Right:=x+max+10;
     textrect.Bottom:=temp.y+10;

     paintbox1.Canvas.Rectangle(textrect);

     temp.X:=x+5;
     temp.Y:=y+5;
     for i:=0 to text.Count-1 do
     begin
       if (text.Strings[i]<>'')then
       begin
         paintbox1.Canvas.TextOut(temp.X,temp.Y,text.Strings[i]);
         temp.Y:=temp.Y+15;
       end;
     end;
   end;
end;
}

procedure MousePointer.TextToRect(paintbox1:Tpaintbox;var x,y:integer;text:Tstringlist;var textrect:Trect);
var
  temp:TPoint;
  i,max:integer;

begin
   if (text.Count>0)then
   begin
     temp.X:=x+5;
     temp.Y:=y;
     max:=0;

     for i:=0 to text.Count-1 do
     begin
       if (text.Strings[i]<>'')then
       begin
         temp.Y:=temp.Y+15;
         if(max < paintbox1.Canvas.TextWidth(text.Strings[i]))then
         begin
           max:=paintbox1.Canvas.TextWidth(text.Strings[i]);
         end;
       end;
     end;

     textrect.Left:=x;
     textrect.Top:=y;
     textrect.Right:=x+max+10;
     textrect.Bottom:=temp.y+10;

     showtextrect(textrect,x,y);

     {************************************************************}
     temp.X:=x+5;
     temp.Y:=y;
     max:=0;

     for i:=0 to text.Count-1 do
     begin
       if (text.Strings[i]<>'')then
       begin
         temp.Y:=temp.Y+15;
         if(max < paintbox1.Canvas.TextWidth(text.Strings[i]))then
         begin
           max:=paintbox1.Canvas.TextWidth(text.Strings[i]);
         end;
       end;
     end;

     {************************************************************}

     temp.X:=x+5;
     temp.Y:=y+5;
     for i:=0 to text.Count-1 do
     begin
       if (text.Strings[i]<>'')then
       begin
         paintbox1.Canvas.TextOut(temp.X,temp.Y,text.Strings[i]);
         temp.Y:=temp.Y+15;
       end;
     end;

     {************************************************************}
     {with icTextC1.Create(nil) do
     try
       icTextC1.Enabled:=true;
       icTextC1.Auto_Size:=true;

       icTextC1.Text := text;
       icTextC1.Color:=clyellow;
       icTextC1.Left:= x;
       icTextC1.Top:= y;
     finally
       //Free;
     end;

     {**********updated on september 9, 2008******************}

     paintbox1.Canvas.Brush.Color:=clyellow;

     textrect.Left:=x;
     textrect.Top:=y;
     textrect.Right:=x+max+10;
     textrect.Bottom:=temp.y+10;

     paintbox1.Canvas.FrameRect(textrect);
     paintbox1.Canvas.FloodFill(abs(textrect.Left - textrect.Right) div 2, abs(textrect.Top - textrect.Bottom) div 2,clblack,fssurface);

     //paintbox1.Canvas.Brush.Style:=bsclear;

     //paintbox1.Canvas.Polygon([point(textrect.left,textrect.Top),point(textrect.Left,textrect.Bottom),point(textrect.Right,textrect.Bottom),point(textrect.Right,textrect.Top)]);
     //paintbox1.Canvas.Polygon([point(textrect.left,textrect.Top),point(textrect.Right,textrect.Bottom)]);


     //paintbox1.Canvas.Brush.Style:=bsclear;

     //paintbox1.Canvas.Brush.Color:=clyellow;

     //paintbox1.Canvas.RoundRect(textrect.Left,textrect.Top,textrect.Right,textrect.Bottom,abs((textrect.Right - textrect.Left)) div 2,abs((textrect.Bottom - textrect.Top))div 2);

     //paintbox1.Canvas.TextRect(textrect,textrect.Left,textrect.Top,text.DelimitedText);

   end;
end;

procedure MousePointer.SearchTitik(x,y:integer;ListPointer:Tlist;var PosisiKe:Integer;var found:boolean);
var
  i:integer;
  TempRect:TRect;
  point:TPoint;
  Image1:Image;
  item:listofpointer;
begin
  i:=0;
  found:=false;
  point.x:=x;
  point.Y:=y;
  while((i<listpointer.Count)and(not found))do
  begin
    new(item);
    item:=listpointer.Items[i];
    TempRect.Left:=item.PointerFirstPos.X;
    TempRect.Top:=item.PointerFirstPos.Y;
    TempRect.Right:=TempRect.Left+25;
    TempRect.Bottom:=TempRect.Top+25;
    if(Image1.isInnerbidang(point,TempRect))then
    begin
      found:=true;
      posisike:=i;
    end else
    begin
      i:=i+1;
    end;
  end;
  if found=false then
  begin
    found:=false;
    posisike:=-999;
  end;
end;


{**********************Implementation of Preview Class*************************}
(* BRESLINE ALGORITHM : prosedure umum menggambar garis *)
procedure previewAnim.Line(x1, y1, x2, y2:integer;color: TColor;var paintbox1:TPaintbox);
(*I.S : x1,y1,y2,y2,tb,color terdefinisi        *)
(*F.S : garis dengan titik awal (x1,y1) dan ti- *)
(*      tik akhir (x2,y2) tergambar di layar de-*)
(*      color color                             *)
(*Proses : adaptasi algoritma bresenham         *)
var
 (*Kamus lokal*)
    i, deltax, deltay, numpixels,
    d, dinc1, dinc2,
    x, xinc1, xinc2,
    y, yinc1, yinc2 : integer;
begin
  (*Algoritma*)

  (*Hitung deltax and deltay untuk inisialisasi*)
  deltax := abs(x2 - x1);
  deltay := abs(y2 - y1);

  (*Inisialisasi semua variabel berdasar nilai acuan*)

  if (deltax >= deltay) then
    begin

      (*nilai acuan menggambar adalah nilai x*)
      numpixels := deltax + 1;
      d := (2 * deltay) - deltax;
      dinc1 := deltay Shl 1;
      dinc2 := (deltay - deltax) shl 1;
      xinc1 := 1;
      xinc2 := 1;
      yinc1 := 0;
      yinc2 := 1;
    end
  else (*deltax < deltay*)
    begin

      (*nilai acuan menggambar adalah nilai x*)
      numpixels := deltay + 1;
      d := (2 * deltax) - deltay;
      dinc1 := deltax Shl 1;
      dinc2 := (deltax - deltay) shl 1;
      xinc1 := 0;
      xinc2 := 1;
      yinc1 := 1;
      yinc2 := 1;
    end;

  (*Memilih langkah selanjutnya pada arah yang benar*)
  if x1 > x2 then
    begin
      xinc1 := - xinc1;
      xinc2 := - xinc2;
    end;
  if y1 > y2 then
    begin
      yinc1 := - yinc1;
      yinc2 := - yinc2;
    end;

  (*titik awal menggambar*)
  x := x1;
  y := y1;

  (*colori pixels yang ditentukan*)
  for i := 1 to numpixels do
    begin
        PaintBox1.Canvas.Pixels[x, y]:=color;

      (*langkah selanjutnya*)
      if d < 0 then
        begin
          d := d + dinc1;
          x := x + xinc1;
          y := y + yinc1;
         
        end
      else
        begin
          d := d + dinc2;
          x := x + xinc2;
          y := y + yinc2;


        end;
    end;(*endfor*)

end;

(* BRESLINE ALGORITHM : prosedure umum menggambar garis *)
procedure previewAnim.MoveObject(geser:boolean;textstring:tstringlist;Region:Trect;eventke,x1, y1, x2, y2:integer;bmpmouse,bmp:Tbitmap;var objek: TRect;var paintbox1,paintbox2:TPaintbox);
(*I.S : x1,y1,y2,y2,tb,color terdefinisi        *)
(*F.S : garis dengan titik awal (x1,y1) dan ti- *)
(*      tik akhir (x2,y2) tergambar di layar de-*)
(*      color color                             *)
(*Proses : adaptasi algoritma bresenham         *)
var
 (*Kamus lokal*)
    i, deltax, deltay, numpixels,
    d, dinc1, dinc2,
    x, xinc1, xinc2,
    y, yinc1, yinc2 : integer;
    xprev,yprev:integer;
    objek2,RectBit,rectbawah,objekprev:TRect;
    classCursor:Mousepointer;
    TempBitmap,BitmapBawah:Tbitmap;
    xbawah,ybawah,xbawahprev,ybawahprev:integer;
    listpoint,listpointprev:Tpoint;
    BMPRect,rect2:Trect;
    myrect:Trect;

begin
  (*Algoritma*)
  {********inisialisasi bitmap dan region******************}
  tempbitmap:=Tbitmap.Create;
  tempbitmap.Width:=400;
  tempbitmap.Height:=300;
  {*************************}
  Rectbit.Left:=0;
  Rectbit.Top:=0;
  Rectbit.Right:=tempbitmap.Width;
  Rectbit.Bottom:=tempbitmap.Height;
  Tempbitmap.Canvas.CopyRect(Rectbit,bmp.Canvas,region);

  {********inisialisasi bitmap dan region di layar bawah*************}
  bitmapbawah:=Tbitmap.Create;
  bitmapbawah.Width:=200;
  bitmapbawah.Height:=150;
  {*************************}
  bmprect.Left:=0;
  bmprect.Top:=0;
  bmprect.Right:=bmp.Width;
  bmprect.Bottom:=bmp.Height;

  Rectbawah.Left:=0;
  Rectbawah.Top:=0;
  Rectbawah.Right:=bitmapbawah.Width;
  Rectbawah.Bottom:=bitmapbawah.Height;

  bitmapbawah.Canvas.CopyRect(Rectbawah,bmp.Canvas,bmprect);

  (*Hitung deltax and deltay untuk inisialisasi*)
  deltax := abs(x2 - x1);
  deltay := abs(y2 - y1);

  (*Inisialisasi semua variabel berdasar nilai acuan*)

  if (deltax >= deltay) then
    begin

      (*nilai acuan menggambar adalah nilai x*)
      numpixels := deltax + 1;
      d := (2 * deltay) - deltax;
      dinc1 := deltay Shl 1;
      dinc2 := (deltay - deltax) shl 1;
      xinc1 := 1;
      xinc2 := 1;
      yinc1 := 0;
      yinc2 := 1;
    end
  else (*deltax < deltay*)
    begin

      (*nilai acuan menggambar adalah nilai x*)
      numpixels := deltay + 1;
      d := (2 * deltax) - deltay;
      dinc1 := deltax Shl 1;
      dinc2 := (deltax - deltay) shl 1;
      xinc1 := 0;
      xinc2 := 1;
      yinc1 := 1;
      yinc2 := 1;
    end;

  (*Memilih langkah selanjutnya pada arah yang benar*)
  if x1 > x2 then
    begin
      xinc1 := - xinc1;
      xinc2 := - xinc2;
    end;
  if y1 > y2 then
    begin
      yinc1 := - yinc1;
      yinc2 := - yinc2;
    end;

  (*titik awal menggambar*)
  x := x1;
  y := y1;

  (*colori pixels yang ditentukan*)
  for i := 1 to numpixels do
    begin
        //paintbox1.Canvas.Rectangle(objek);
        //paintbox1.Refresh;
        classCursor.MousePointing(true,X,Y,eventke,objek,bmpmouse,paintbox1);
        if(geser=true)then
        begin
          classcursor.TextToRect(paintbox1,objek.Right,objek.Top,textstring,myrect);
        end;
        //paintbox2.Refresh;

        ListPoint:=ClassCursor.PointScreenToList(region,X,Y);

        xbawah:= listpoint.X div 4;
        ybawah:= listpoint.Y div 4;
        classCursor.MousePointingM(true,xbawah,ybawah,eventke+1,paintbox2);
        {************************************************************}

         rect2.Left:=region.Left div 4;
         rect2.Top:=region.Top div 4;
         rect2.Right:=rect2.Left + 100;
         rect2.Bottom:=rect2.top + 75;
         paintbox2.Canvas.MoveTo(rect2.Left,rect2.Top);
         paintbox2.Canvas.LineTo(rect2.Right,rect2.Top);
         paintbox2.Canvas.LineTo(rect2.Right,rect2.Bottom);
         paintbox2.Canvas.LineTo(rect2.Left,rect2.Bottom);
         paintbox2.Canvas.lineTo(rect2.Left,rect2.Top);


        {************************************************************}
        sleep(5);
      (*langkah selanjutnya*)

      if d < 0 then
        begin
          d := d + dinc1;
          xprev:=x;
          yprev:=y;
          x := x + xinc1;
          y := y + yinc1;
        end
      else
        begin
          d := d + dinc2;
          xprev:=x;
          yprev:=y;
          x := x + xinc2;
          y := y + yinc2;
        end;
      {**********************}
      //ScreenPoint:=ClassCursor.PointScreenToList(region,xprev,yprev);
      objek2.Left:=Xprev;
      objek2.Top:=Yprev;
      objek2.Right:=objek2.Left+25;
      objek2.Bottom:=objek2.Top+25;
      {******************************************************}
      paintbox1.Canvas.CopyRect(objek2,tempbitmap.Canvas,objek2);
      if(geser=true)then
      begin
        paintbox1.Canvas.CopyRect(myrect,tempbitmap.Canvas,myrect);
      end;
      {**************************************************************}

      ListPointprev:=ClassCursor.PointScreenToList(region,Xprev,Yprev);

      xbawahprev:= listpointprev.X div 4;
      ybawahprev:= listpointprev.Y div 4;
      objekprev.Left:=xbawahprev-3;
      objekprev.Top:=ybawahprev-3;
      objekprev.Right:=objekprev.Left+paintbox2.Canvas.TextWidth(inttostr(eventKe))+7;
      objekprev.Bottom:=objekprev.Top+paintbox2.Canvas.TextHeight(inttostr(eventKe))+5;

      paintbox2.Canvas.CopyRect(objekprev,bitmapbawah.Canvas,objekprev);

      {******************************************************}

    end;(*endfor*)

    classCursor.MousePointing(true,X,Y,eventke,objek,bmpmouse,paintbox1);
    classcursor.TextToRect(paintbox1,objek.Right,objek.Top,textstring,myrect);
    classCursor.MousePointingM(true,xbawah,ybawah,eventke+1,paintbox2);
    if ((geser=false)and(textstring.Count>0))then
    begin
      sleep(1000*textstring.Count);
    end;
end;

procedure previewAnim.MoveRegion(item:listofimage;itempointer:listofpointer;eventke,x1, y1, x2, y2:integer;var bmp:Tbitmap;var Rect1,rect2: TRect;var paintbox1,paintbox2:TPaintbox);
(*I.S : x1,y1,y2,y2,tb,color terdefinisi        *)
(*F.S : garis dengan titik awal (x1,y1) dan ti- *)
(*      tik akhir (x2,y2) tergambar di layar de-*)
(*      color color                             *)
(*Proses : adaptasi algoritma bresenham         *)
var
 (*Kamus lokal*)
    i, deltax, deltay, numpixels,
    d, dinc1, dinc2,
    x, xinc1, xinc2,
    y, yinc1, yinc2 : integer;
    classimage:image;
    pointawal,ScreenPoint:TPoint;
    classpointer:mousepointer;
    objek:Trect;
    xbawah,ybawah:integer;
begin
  (*Algoritma*)

  (*Hitung deltax and deltay untuk inisialisasi*)
  deltax := abs(x2 - x1);
  deltay := abs(y2 - y1);

  (*Inisialisasi semua variabel berdasar nilai acuan*)

  if (deltax >= deltay) then
    begin

      (*nilai acuan menggambar adalah nilai x*)
      numpixels := deltax + 1;
      d := (2 * deltay) - deltax;
      dinc1 := deltay Shl 1;
      dinc2 := (deltay - deltax) shl 1;
      xinc1 := 1;
      xinc2 := 1;
      yinc1 := 0;
      yinc2 := 1;
    end
  else (*deltax < deltay*)
    begin

      (*nilai acuan menggambar adalah nilai x*)
      numpixels := deltay + 1;
      d := (2 * deltax) - deltay;
      dinc1 := deltax Shl 1;
      dinc2 := (deltax - deltay) shl 1;
      xinc1 := 0;
      xinc2 := 1;
      yinc1 := 1;
      yinc2 := 1;
    end;

  (*Memilih langkah selanjutnya pada arah yang benar*)
  if x1 > x2 then
    begin
      xinc1 := - xinc1;
      xinc2 := - xinc2;
    end;
  if y1 > y2 then
    begin
      yinc1 := - yinc1;
      yinc2 := - yinc2;
    end;

  (*titik awal menggambar*)
  x := x1;
  y := y1;

  (*colori pixels yang ditentukan*)
  for i := 1 to numpixels do
    begin
        pointawal.X:=x;
        pointawal.Y:=y;
        //paintbox1.Refresh;
        paintbox2.Refresh;
        classimage.FocusImage(true,item,Pointawal,rect1,rect2,paintbox1,paintbox2,bmp);
        if (itempointer<>nil) then
        begin
          ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointer.PointerFirstPos.X,itempointer.PointerFirstPos.Y);
          classPointer.MousePointing(true,screenpoint.x,screenpoint.y,eventke,objek,itempointer.PointerFile,paintbox1);
          xbawah:= itempointer.PointerFirstPos.X div 4;
          ybawah:= itempointer.PointerFirstPos.Y div 4;
          classPointer.MousePointingM(true,xbawah,ybawah,eventke+1,paintbox2);
        end;
        sleep(10);
      (*langkah selanjutnya*)

      if d < 0 then
        begin
          d := d + dinc1;

          x := x + xinc1;
          y := y + yinc1;
        end
      else
        begin
          d := d + dinc2;

          x := x + xinc2;
          y := y + yinc2;
        end;


    end;(*endfor*)


end;

procedure PreviewAnim.InitCursor(var InitImage:listofimage;image:Tbitmap;mousefile:Tbitmap;Region:Trect;position:Tpoint;name:string);
var
  cursor:listofpointer;
begin
  new(InitImage);
  InitImage.ImageName:=name;

  InitImage.ImageFile:=tbitmap.Create;
  initImage.ImageFile.Assign(image);

  initimage.ImagePointer:=tlist.Create;

  new(cursor);
  cursor.RectSize:=Region;

  cursor.PointerFile:=tbitmap.Create;
  cursor.PointerFile.Assign(mousefile);

  cursor.PointerText:=tstringlist.Create;

  cursor.PointerFirstPos:=position;
  InitImage.ImagePointer.Add(cursor);
end;

function Previewanim.SearchPosition(posArray:Tlist;animcount,counter:integer):integer;
var
  ketemu:boolean;
  i:integer;
  itempos:listpos;
begin
 if ((posarray<>nil) and(posarray.Count>0))then
 begin
    ketemu:=false;
    i:=0;
    new(itempos);
    while((not ketemu)and(i<posarray.Count))do
    begin
      itempos:=posarray.Items[i];
      if((itempos.x=animcount)and(itempos.y=counter))then
      begin
        ketemu:=true;
        searchposition:=i;
      end else
      begin
        i:=i+1;
      end;
    end;
    if (ketemu=false)then
    begin
      searchposition:=-999;
    end;
 end;
end;
procedure Previewanim.getlengthmovie(listscenario:Tlist;var len:integer;var PosArray:Tlist);
var
  i,j:integer;
  item:listofimage;
  itempos:listPos;
begin
  if (listscenario<>nil)then
  begin
    if(posarray<>nil)then
    begin
      posarray.Clear;
    end;
    PosArray:=Tlist.Create;
    len:=0;
    new(item);
    for i:=0 to listscenario.Count-1 do
    begin
      item:=listscenario.Items[i];
      if (item.ImagePointer.Count>0)then
      begin
        for j:=0 to item.ImagePointer.Count-1 do
        begin
          new(itempos);
          itempos.x:=i;
          itempos.y:=j;
          posArray.Add(itempos);
          len:=len+1;
        end;
      end;
    end;
    len:=len-1;
  end;
end;
procedure PreviewAnim.AnimationExecute(bergerak:boolean;var Rect1,rect2: TRect;var paintbox1,paintbox2:TPaintbox;var imageku:Timage;image1,image2:listofimage;firstpos,secondpos:integer);
var
  itempointer1,itempointer2:listofpointer;
  middle1,middle2,screenpoint1,screenpoint2,screenpoint:Tpoint;
  classpointer:Mousepointer;
  classimage:image;
  rectku:Trect;
  xbawah,ybawah:integer;
  myrect:Trect;
begin


 if (bergerak=true) then
 begin
   new(itempointer1);
   new(itempointer2);
   if (image1.ImageName=image2.ImageName)then
   begin
     itempointer1:=image1.ImagePointer.Items[firstpos];
     itempointer2:=image2.ImagePointer.Items[secondpos];
     {********************************************************}
     middle1.X:=(itempointer1.RectSize.Left+itempointer1.RectSize.Right) div 8;
     middle1.y:=(itempointer1.RectSize.Bottom+itempointer1.RectSize.Top) div 8;
     middle2.X:=(itempointer2.RectSize.Left+itempointer2.RectSize.Right) div 8;
     middle2.y:=(itempointer2.RectSize.Bottom+itempointer2.RectSize.Top) div 8;


     imageku.Picture.Assign(image1.ImageFile);

     MoveRegion(image1,itempointer1,firstpos,middle1.X,middle1.y,middle2.X,middle2.Y,image1.imagefile,rect1,rect2,paintbox1,paintbox2);
     ScreenPoint1:=Classpointer.PointListToScreen(rect2,itempointer1.PointerFirstPos.X,itempointer1.PointerFirstPos.Y);
     ScreenPoint2:=Classpointer.PointListToScreen(rect2,itempointer2.PointerFirstPos.X,itempointer2.PointerFirstPos.Y);
     MoveObject(false,itempointer2.PointerText,rect2,firstpos,screenpoint1.X,screenpoint1.Y,screenpoint2.X,screenpoint2.Y,itempointer2.PointerFile,image1.ImageFile,rectku,paintbox1,paintbox2);
   end else
   begin
     if((firstpos=secondpos)and
     (firstpos=image1.ImagePointer.IndexOf(image1.ImagePointer.Last)))then
     begin
       if((itempointer1.PointerSecondPos.x<>-999)
         and(itempointer2.PointerSecondPos.Y<>-999))then
       begin
         {********************************************************}
         itempointer1:=image1.ImagePointer.Items[firstpos];
         itempointer2:=image1.ImagePointer.Items[secondpos];

         middle1.X:=(itempointer1.RectSize.Left+itempointer1.RectSize.Right) div 8;
         middle1.y:=(itempointer1.RectSize.Bottom+itempointer1.RectSize.Top) div 8;
         middle2.X:=(itempointer2.RectSize.Left+itempointer2.RectSize.Right) div 8;
         middle2.y:=(itempointer2.RectSize.Bottom+itempointer2.RectSize.Top) div 8;

         imageku.Picture.Assign(image1.ImageFile);

         MoveRegion(image1,itempointer1,firstpos,middle1.X,middle1.y,middle2.X,middle2.Y,image1.imagefile,rect1,rect2,paintbox1,paintbox2);
         ScreenPoint1:=Classpointer.PointListToScreen(rect2,itempointer1.PointerFirstPos.X,itempointer1.PointerFirstPos.Y);
         ScreenPoint2:=Classpointer.PointListToScreen(rect2,itempointer2.PointerSecondPos.X,itempointer2.PointerSecondPos.Y);
         MoveObject(true,itempointer1.PointerText,rect2,firstpos,screenpoint1.X,screenpoint1.Y,screenpoint2.X,screenpoint2.Y,itempointer1.PointerFile,image1.ImageFile,rectku,paintbox1,paintbox2);

         sleep(500);

         imageku.Picture.Assign(image2.ImageFile);
         paintbox2.Refresh;
         classimage.FocusImage(true,image2,middle2,rect1,rect2,paintbox1,paintbox2,image2.imagefile);
         if itempointer2<>nil then
         begin
           ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointer2.PointerSecondPos.X,itempointer2.PointerSecondPos.Y);
           classPointer.MousePointing(true,screenpoint.x,screenpoint.y,secondpos,rectku,itempointer1.PointerFile,paintbox1);
           classPointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointer1.PointerText,myrect);
           xbawah:= itempointer2.PointerSecondPos.X div 4;
           ybawah:= itempointer2.PointerSecondPos.Y div 4;
           classPointer.MousePointingM(true,xbawah,ybawah,secondpos+1,paintbox2);
         end; 
       end;
     end else
     if((firstpos<>secondpos)
     and(firstpos=image1.ImagePointer.IndexOf(image1.ImagePointer.Last)-1))then
     begin
       itempointer1:=image1.ImagePointer.Items[firstpos];
       itempointer2:=image1.ImagePointer.Items[secondpos];

       middle1.X:=(itempointer1.RectSize.Left+itempointer1.RectSize.Right) div 8;
       middle1.y:=(itempointer1.RectSize.Bottom+itempointer1.RectSize.Top) div 8;
       middle2.X:=(itempointer2.RectSize.Left+itempointer2.RectSize.Right) div 8;
       middle2.y:=(itempointer2.RectSize.Bottom+itempointer2.RectSize.Top) div 8;

       imageku.Picture.Assign(image1.ImageFile);

       MoveRegion(image1,itempointer1,firstpos,middle1.X,middle1.y,middle2.X,middle2.Y,image1.imagefile,rect1,rect2,paintbox1,paintbox2);
       ScreenPoint1:=Classpointer.PointListToScreen(rect2,itempointer1.PointerFirstPos.X,itempointer1.PointerFirstPos.Y);
       ScreenPoint2:=Classpointer.PointListToScreen(rect2,itempointer2.PointerFirstPos.X,itempointer2.PointerFirstPos.Y);
       MoveObject(false,itempointer2.PointerText,rect2,firstpos,screenpoint1.X,screenpoint1.Y,screenpoint2.X,screenpoint2.Y,itempointer2.PointerFile,image1.ImageFile,rectku,paintbox1,paintbox2);
       sleep(500);

       imageku.Picture.Assign(image2.ImageFile);
       paintbox2.Refresh;
       classimage.FocusImage(true,image2,middle2,rect1,rect2,paintbox1,paintbox2,image2.imagefile);
       if itempointer2<>nil then
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointer2.PointerFirstPos.X,itempointer2.PointerFirstPos.Y);
         classPointer.MousePointing(true,screenpoint.x,screenpoint.y,secondpos,rectku,itempointer2.PointerFile,paintbox1);
         classPointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointer2.PointerText,myrect);
         xbawah:= itempointer2.PointerFirstPos.X div 4;
         ybawah:= itempointer2.PointerFirstPos.Y div 4;
         classPointer.MousePointingM(true,xbawah,ybawah,secondpos+1,paintbox2);
       end;
       {********************************************************}
     end;
   end;
 end else
 if(bergerak=false)then
 begin
   new(itempointer2);
   itempointer2:=image1.ImagePointer.Items[secondpos];

   middle2.X:=(itempointer2.RectSize.Left+itempointer2.RectSize.Right) div 8;
   middle2.y:=(itempointer2.RectSize.Bottom+itempointer2.RectSize.Top) div 8;
   sleep(300);

   imageku.Picture.Assign(image2.ImageFile);

   paintbox2.Refresh;
   classimage.FocusImage(true,image2,middle2,rect1,rect2,paintbox1,paintbox2,image2.imagefile);
   if (itempointer2<>nil) then
   begin
     ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointer2.PointerFirstPos.X,itempointer2.PointerFirstPos.Y);
     classPointer.MousePointing(true,screenpoint.x,screenpoint.y,secondpos,rectku,itempointer2.PointerFile,paintbox1);
     classPointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointer2.PointerText,myrect);
     xbawah:= itempointer2.PointerFirstPos.X div 4;
     ybawah:= itempointer2.PointerFirstPos.Y div 4;
     classPointer.MousePointingM(true,xbawah,ybawah,secondpos+1,paintbox2);
   end;
   {********************************************************}
 end;
end;

procedure PreviewAnim.ZoomMoveObject(interval:integer;geser:boolean;textstring:tstringlist;eventke,x1, y1, x2, y2:integer;bmpmouse,bmp:Tbitmap;var objek: TRect;var paintbox1:TPaintbox);
var
 (*Kamus lokal*)
    i, deltax, deltay, numpixels,
    d, dinc1, dinc2,
    x, xinc1, xinc2,
    y, yinc1, yinc2 : integer;
    xprev,yprev:integer;
    objek2:TRect;
    classCursor:Mousepointer;
    myrect:Trect;

begin
  (*Algoritma*)

  (*Hitung deltax and deltay untuk inisialisasi*)
  deltax := abs(x2 - x1);
  deltay := abs(y2 - y1);

  (*Inisialisasi semua variabel berdasar nilai acuan*)

  if (deltax >= deltay) then
    begin

      (*nilai acuan menggambar adalah nilai x*)
      numpixels := deltax + 1;
      d := (2 * deltay) - deltax;
      dinc1 := deltay Shl 1;
      dinc2 := (deltay - deltax) shl 1;
      xinc1 := 1;
      xinc2 := 1;
      yinc1 := 0;
      yinc2 := 1;
    end
  else (*deltax < deltay*)
    begin

      (*nilai acuan menggambar adalah nilai x*)
      numpixels := deltay + 1;
      d := (2 * deltax) - deltay;
      dinc1 := deltax Shl 1;
      dinc2 := (deltax - deltay) shl 1;
      xinc1 := 0;
      xinc2 := 1;
      yinc1 := 1;
      yinc2 := 1;
    end;

  (*Memilih langkah selanjutnya pada arah yang benar*)
  if x1 > x2 then
    begin
      xinc1 := - xinc1;
      xinc2 := - xinc2;
    end;
  if y1 > y2 then
    begin
      yinc1 := - yinc1;
      yinc2 := - yinc2;
    end;

  (*titik awal menggambar*)
  x := x1;
  y := y1;

  (*colori pixels yang ditentukan*)
  for i := 1 to numpixels do
    begin
        classCursor.MousePointing(true,X,Y,eventke,objek,bmpmouse,paintbox1);
        if(geser=true)then
        begin
          classcursor.TextToRect(paintbox1,objek.Right,objek.Top,textstring,myrect);
        end;
        //paintbox2.Refresh;

        {************************************************************}
        sleep(interval);
      (*langkah selanjutnya*)

      if d < 0 then
        begin
          d := d + dinc1;
          xprev:=x;
          yprev:=y;
          x := x + xinc1;
          y := y + yinc1;
        end
      else
        begin
          d := d + dinc2;
          xprev:=x;
          yprev:=y;
          x := x + xinc2;
          y := y + yinc2;
        end;
      {**********************}
      //ScreenPoint:=ClassCursor.PointScreenToList(region,xprev,yprev);
      objek2.Left:=Xprev;
      objek2.Top:=Yprev;
      objek2.Right:=objek2.Left+25;
      objek2.Bottom:=objek2.Top+25;
      {******************************************************}
      paintbox1.Canvas.CopyRect(objek2,bmp.Canvas,objek2);
      if(geser=true)then
      begin
        paintbox1.Canvas.CopyRect(myrect,bmp.Canvas,myrect);
      end;


    end;(*endfor*)

    classCursor.MousePointing(true,X,Y,eventke,objek,bmpmouse,paintbox1);
    classcursor.TextToRect(paintbox1,objek.Right,objek.Top,textstring,myrect);
    if ((geser=false)and(textstring.Count>0))then
    begin
      sleep(1000*textstring.Count);
    end;
end;

procedure PreviewAnim.ZoomAnimationExecute(intervalRect,intervalCur:integer;bergerak:boolean;var paintbox1:TPaintbox;var imageku:Timage;image1,image2:listofimage;firstpos,secondpos:integer);
var
  itempointer1,itempointer2:listofpointer;
 // middle1,middle2,screenpoint1,screenpoint2,screenpoint:Tpoint;
  classpointer:Mousepointer;
  classimage:image;
  rectku:Trect;
  xbawah,ybawah:integer;
  myrect:Trect;
begin
 if (bergerak=true) then
 begin
   new(itempointer1);
   new(itempointer2);
   if (image1.ImageName=image2.ImageName)then
   begin
     itempointer1:=image1.ImagePointer.Items[firstpos];
     itempointer2:=image2.ImagePointer.Items[secondpos];

   //  imageku.Picture.Assign(image1.ImageFile);
     paintbox1.Canvas.Draw(0,0,image1.ImageFile);

     ZoomMoveObject(intervalcur,false,itempointer2.PointerText,firstpos,itempointer1.PointerFirstPos.X,itempointer1.PointerFirstPos.Y,itempointer2.PointerFirstPos.X,itempointer2.PointerFirstPos.Y,itempointer2.PointerFile,image1.ImageFile,rectku,paintbox1);
   end else
   begin
     if((firstpos=secondpos)and
     (firstpos=image1.ImagePointer.IndexOf(image1.ImagePointer.Last)))then
     begin
       if((itempointer1.PointerSecondPos.x<>-999)
         and(itempointer2.PointerSecondPos.Y<>-999))then
       begin
         {********************************************************}
         itempointer1:=image1.ImagePointer.Items[firstpos];
         itempointer2:=image1.ImagePointer.Items[secondpos];

        // imageku.Picture.Assign(image1.ImageFile);
        //  imageku.Picture.Assign(image1.ImageFile);
         paintbox1.Canvas.Draw(0,0,image1.ImageFile);

         ZoomMoveObject(intervalcur,true,itempointer1.PointerText,firstpos,itempointer1.PointerFirstPos.X,itempointer1.PointerFirstPos.Y,itempointer2.PointerSecondPos.X,itempointer2.PointerSecondPos.Y,itempointer1.PointerFile,image1.ImageFile,rectku,paintbox1);

        // sleep(500);

        // imageku.Picture.Assign(image2.ImageFile);
        // paintbox1.Refresh;

         paintbox1.Canvas.Draw(0,0,image2.ImageFile);

         if itempointer2<>nil then
         begin
           classPointer.MousePointing(true,itempointer2.PointerSecondPos.X,itempointer2.PointerSecondPos.Y,secondpos,rectku,itempointer1.PointerFile,paintbox1);
           classPointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointer1.PointerText,myrect);
         end;
       end;
     end else
     if((firstpos<>secondpos)
     and(firstpos=image1.ImagePointer.IndexOf(image1.ImagePointer.Last)-1))then
     begin
       itempointer1:=image1.ImagePointer.Items[firstpos];
       itempointer2:=image1.ImagePointer.Items[secondpos];


      // imageku.Picture.Assign(image1.ImageFile);
       paintbox1.Canvas.Draw(0,0,image1.ImageFile);

       ZoomMoveObject(intervalcur,false,itempointer2.PointerText,firstpos,itempointer1.PointerFirstPos.X,itempointer1.PointerFirstPos.Y,itempointer2.PointerFirstPos.X,itempointer2.PointerFirstPos.Y,itempointer2.PointerFile,image1.ImageFile,rectku,paintbox1);
   //    sleep(500);

     //  imageku.Picture.Assign(image2.ImageFile);
     //  paintbox1.Refresh;
       paintbox1.Canvas.Draw(0,0,image2.ImageFile);

       if itempointer2<>nil then
       begin

         classPointer.MousePointing(true,itempointer2.PointerFirstPos.X,itempointer2.PointerFirstPos.Y,secondpos,rectku,itempointer2.PointerFile,paintbox1);
         classPointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointer2.PointerText,myrect);

       end;
       {********************************************************}
     end;
   end;
 end else
 if(bergerak=false)then
 begin
   new(itempointer2);
   itempointer2:=image1.ImagePointer.Items[secondpos];


   // sleep(300);

   // imageku.Picture.Assign(image2.ImageFile);
   // paintbox1.Refresh;
   paintbox1.Canvas.Draw(0,0,image2.ImageFile);

   if (itempointer2<>nil) then
   begin
     classPointer.MousePointing(true,itempointer2.PointerFirstPos.X,itempointer2.PointerFirstPos.Y,secondpos,rectku,itempointer2.PointerFile,paintbox1);
     classPointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointer2.PointerText,myrect);
   end;
   {********************************************************}
 end;
end;
{*********************Implementation of FileOp Class***************************}

procedure Fileop.ExtractFile(OldFileName:string;var NewFileName:String);
var
  i:integer;
  stop:boolean;
begin
  if (OldfileName<>'')then
  begin
    i:=1;
    stop:=false;
    while(not stop)do
    begin
      if (OldFileName[i]='.')then
      begin
        stop:=true;
      end else
      begin
        i:=i+1;
      end;
    end;
    newfilename:=copy(oldfilename,0,i-1);
  end;
end;

procedure fileop.SaveToFileAnimasi(filename:string;ListScenario:Tlist);
var
  fileAnimasi:TextFile;
  i,j,k,l:integer;
  folderImage,NamaImage:string;
  item:listofimage;
  image1:image;
  itemPointer:Listofpointer;
  s:string;
begin
    extractfile(extractfilename(filename),FolderImage);
    NamaImage:=extractfilepath(filename)+FolderImage+'\';
    if fileexists(filename)then
    begin
      Assignfile(FileAnimasi,FileName);
      reset(FileAnimasi);
      readln(fileanimasi,s);
      closefile(FileAnimasi);
      //xtea.XTeaDecryptStr(s,password); // dekripsi
      {*****************************read number of file********************}
      for l:=0 to strtoint(s)-1 do
      begin
        deletefile(NamaImage+FolderImage+inttostr(l)+'.jpg');
        deletefile(NamaImage+FolderImage+inttostr(l)+'.rtf');
      end;
      {********************************************************************}
    end;

    createdirectory(Pchar(extractfilepath(filename)+FolderImage),nil);
    Assignfile(FileAnimasi,filename);
    rewrite(FileAnimasi);
    //xtea.XTeaCryptStr(inttostr(listscenario.count),password); // enkripsi
    writeln(fileanimasi,inttostr(listscenario.count));

    new(item);
    {*******************khusus untuk menyimpan audio********************}
    item := listscenario.Items[0];
    if (item.ImageSound.Count>0) then
    begin
      if ((strcomp(pchar(item.ImageSound.Strings[0] + item.ImageSound.Strings[1]),pchar(NamaImage+FolderImage +'.mp3'))<> 0)or(fileexists(NamaImage+FolderImage +'.mp3')=false)) then
      begin
        try
          //deletefile(NamaImage+FolderImage +'.mp3');
          copyfile(pchar(item.ImageSound.Strings[0] + item.ImageSound.Strings[1]),pchar(NamaImage+FolderImage +'.mp3'),false);
        except
        end;
        //showmessage('dicopy');
      end;

      //writeln(fileanimasi,NamaImage+FolderImage +'.mp3');
      writeln(fileanimasi,FolderImage+'\');
      writeln(fileanimasi,FolderImage +'.mp3');
    end else
    begin
      if (FileExists(NamaImage+FolderImage +'.mp3') = true) then
      begin
        deletefile(pchar(NamaImage+FolderImage +'.mp3'));
      end;
    end;
    {*********************************************************************}
    for i:=0 to ListScenario.Count-1 do
    begin
      item:=listscenario.Items[i];
      image1.bmp2jpg(item.ImageFile,NamaImage+FolderImage+inttostr(i)+'.jpg',100);
      {**************************************}
      if(item.ImageText.Count>0)then
      begin
        item.ImageText.SaveToFile(NamaImage+FolderImage+inttostr(i)+'.rtf');
      end;
      {**************************************}
      writeln(fileAnimasi,'-');
      writeln(fileAnimasi,FolderImage+'\'+FolderImage+inttostr(i)+'.jpg');

      if(item.ImagePointer.Count<>0)then begin
        new(itempointer);
        for j:=0 to item.ImagePointer.Count-1 do
        begin
          itempointer:=item.ImagePointer.Items[j];
          writeln(fileAnimasi,';');
          writeln(fileAnimasi,inttostr(itempointer.RectSize.Left));
          writeln(fileAnimasi,inttostr(itempointer.RectSize.Top));
          writeln(fileAnimasi,inttostr(itempointer.RectSize.Right));
          writeln(fileAnimasi,inttostr(itempointer.RectSize.Bottom));
          writeln(fileanimasi,extractfilename(itempointer.pointername));
          writeln(fileanimasi,inttostr(itempointer.PointerFirstPos.X));
          writeln(fileanimasi,inttostr(itempointer.PointerFirstPos.y));
          writeln(fileanimasi,inttostr(itempointer.PointerSecondPos.X));
          writeln(fileanimasi,inttostr(itempointer.PointerSecondPos.Y));
          writeln(fileanimasi,';-');
          for k:=0 to itempointer.PointerText.Count-1 do
          begin
            writeln(fileanimasi,itempointer.pointertext.strings[k]);
          end;
        end;
      end;
    end;
    writeln(fileanimasi,'.');
    closefile(FileAnimasi);
end;

procedure fileop.OpenFileAnimasi(var progress:TProgressbar;filename:string;var Listscenario:Tlist);
var
  fileAnimasi:TextFile;
  s:string;
  item,sounditem:ListofImage;
  itempointer:ListofPointer;
  count:integer;
  image1:image;
  file1:fileop;
  TeksImage:string;
  B : integer;
  filepath,filesound:string;
begin
    if (listscenario<>nil) then
    begin
      //Listscenario.Clear;
      {********update March 02,2008****************************}
     Try
      for B := 0 to (listscenario.Count - 1) do
      begin
        item := listscenario.Items[B];
        item.ImageFile.Free;
        Dispose(item);
      end;
     finally
      listscenario.Free;
     end;

      //Listscenario.Clear;

   {***********************************************************}
    end;
    listscenario:=Tlist.Create;

    Assignfile(FileAnimasi,FileName);
    reset(FileAnimasi);
    readln(fileanimasi,s);
    count:=0;
    readln(fileanimasi,s);
    {*******************untuk upload sound ke animasi *****************}
    if (s <> '-') then
    begin
      filepath := extractfilepath(filename)+s;
      readln(fileanimasi,s);
      filesound:=s;
      readln(fileanimasi,s);
    end;
    while(s<>'.')do
    begin
      if(s='-')then
      begin
        new(item);
        readln(fileanimasi,s);
        item.ImageName:=inttostr(count);
        image1.jpg2bmp(extractfilepath(filename)+s,item.imagefile);
        {***********************update March 13, 2008***************}
         item.ImageSound:=tstringlist.Create;
        {***********************************************************}
        item.ImageText:=tstringlist.Create;
        file1.ExtractFile(extractfilepath(filename)+s,TeksImage);
        if fileexists(TeksImage+'.rtf')then
        begin
          item.ImageText.LoadFromFile(TeksImage+'.rtf');
        end;
       // item.ImageFile:=Tbitmap.Create;
       // item.ImageFile.LoadFromFile(s);
        item.ImagePointer:=tlist.Create;
        listscenario.Add(item);
        readln(fileanimasi,s);
        while(s=';')do
        begin
         new(itempointer);
         {*************read rectangle**************}
         readln(fileanimasi,s);
         itempointer.RectSize.Left:=strtoint(s);
         readln(fileanimasi,s);
         itempointer.RectSize.Top:=strtoint(s);
         readln(fileanimasi,s);
         itempointer.RectSize.Right:=strtoint(s);
         readln(fileanimasi,s);
         itempointer.RectSize.Bottom:=strtoint(s);
         {***************read cursor shape*********}
         readln(fileanimasi,s);
         itempointer.PointerName:=extractfilepath(paramstr(0))+'mouse shape\'+s;
         itempointer.PointerFile:=Tbitmap.Create;
         itemPointer.PointerFile.LoadFromFile(itemPointer.PointerName);
         {**************read cursor position*******}
         readln(fileanimasi,s);
         itempointer.PointerFirstPos.X:=strtoint(s);
         readln(fileanimasi,s);
         itempointer.PointerFirstPos.Y:=strtoint(s);
         readln(fileanimasi,s);
         itempointer.PointerSecondPos.X:=strtoint(s);
         readln(fileanimasi,s);
         itempointer.PointerSecondPos.Y:=strtoint(s);
         {*************read cursor text*************}
         readln(fileanimasi,s);
         if(s=';-')then
         begin
           readln(fileanimasi,s);
           itempointer.PointerText:=Tstringlist.Create;
           while((s<>';')and(s<>'-')and(s<>'.'))do
           begin
             itemPointer.PointerText.Add(s);
             readln(fileanimasi,s);
           end;
         end;
         item.ImagePointer.Add(itempointer);
        end;
      end;
      count:=count+1;
      progress.StepBy(10);
    end;
    {********************item list untuk sound************}
    item := listscenario.Items[0];
    if (filepath <> '') and (filesound<>'')then
    begin
      item.ImageSound.Add(filepath);
      item.ImageSound.Add(filesound);
    end;
    closefile(FileAnimasi);
    progress.Max:=count;
end;

Procedure fileop.EncryptFile (filename,password : string);
var
  fileAnimasi:TextFile;
  s:string;
begin
  Assignfile(FileAnimasi,FileName);
  reset(FileAnimasi);
  readln(fileanimasi,s);
  while(s<>'.')do
  begin
      
  end;
end;
Procedure fileop.DecryptFile (filename, password : string);
begin
end;

end.
