unit Preview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ExtCtrls, ComCtrls, StdCtrls, Buttons, Menus, jpeg,primitif,
  FileCtrl;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    RichEdit1: TRichEdit;
    TrackBar1: TTrackBar;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    PaintBox1: TPaintBox;
    Image1: TImage;
    Image2: TImage;
    PaintBox2: TPaintBox;
    Timer1: TTimer;
    Image3: TImage;
    MediaPlayer1: TMediaPlayer;
    Timer2: TTimer;
    SpeedButton6: TSpeedButton;
    checkbox1: TCheckBox;
   
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure checkbox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure MoveFrame(prevanimcount,prevanimcursor:integer;var rect2:Trect);
    procedure CheckAllowNextPrev(prevanimcount,prevanimcursor:integer;scenario:Tlist);

  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  previewku:previewAnim;
  pointku:TPoint;
  rect1,rect2:Trect;
  animcount,counter:integer;
  AnimImage:Image;
  nextitem:listofimage;
  animstatus:boolean;
  prevAnimCount:integer;
  prevAnimCursor:integer;
  posArray:Tlist;
  audacitycommand : string;
  mediaplayer1pos :integer;
  filepath,filesound:string;
  invalrect,invalcur:integer;

implementation
uses PointerMouse,desainer,ShellAPI;
{$R *.dfm}
{***********************Deklaraasi Privat Preview***********************}

procedure Tform2.CheckAllowNextPrev(prevanimcount,prevanimcursor:integer;scenario:Tlist);
var
  item:listofimage;
begin
   new(item);
   item:=scenario.Items[prevanimcount];

   if(prevanimcount=scenario.Count-1)then
   begin
     if (prevanimcursor>=item.ImagePointer.Count-1)then
     begin
       speedbutton4.Enabled:=false;
     end else
     begin
       speedbutton4.Enabled:=true;
     end;
   end else
   if(prevanimcount>scenario.Count-1)then
   begin
     speedbutton4.Enabled:=false;
   end else
   begin
     speedbutton4.Enabled:=true;
   end;


   if(prevanimcount=0)then
   begin
     if (prevanimcursor<=0)then
     begin
       speedbutton5.Enabled:=false;
     end else
     begin
       speedbutton5.Enabled:=true;
     end;
   end else
   if(prevanimcount<0)then
   begin
     speedbutton5.Enabled:=false;
   end else
   begin
     speedbutton5.Enabled:=true;
   end;

end;




procedure Tform2.MoveFrame(prevanimcount,prevanimcursor:integer;var rect2:Trect);
var
  temp,itemku:listofimage;
  itempointerku:listofpointer;
  middleku:Tpoint;
  rect3,rect4,rectku,myrect:Trect;
  screenpoint:Tpoint;
  xbawah,ybawah:integer;
begin
   {*******************************************************}
   new(itemku);
   itemku:=listframe.Items[prevAnimCount];
   {*****************************************************************}
   if ((itemku.ImageText.Count>0)and
      (fileexists(extractfilepath(paramstr(0))+'ImageText.rtf')))then
   begin
     itemku.ImageText.SaveToFile(extractfilepath(paramstr(0))+'ImageText.rtf');
     Richedit1.Lines.LoadFromFile(extractfilepath(paramstr(0))+'ImageText.rtf');
   end;
   {*****************************************************************}
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
     middleku.X:=(rect2.Left+rect2.Right) div 8;
     middleku.y:=(rect2.Bottom+rect2.Top) div 8;
    { if (itemku<>listframe.Last)then
     begin
       itemku:=listframe.Items[prevanimcount+1];
     end else
     begin }
       itemku:=listframe.Items[prevanimcount];
  //   end;

     AnimImage.FocusImage(true,itemku,middleku,rect3,rect4,paintbox1,paintbox2,itemku.ImageFile);
     {************************************************************}
     rect2.Left:=itempointerku.RectSize.Left;
     rect2.Top:=itempointerku.RectSize.Top;
     rect2.Right:=itempointerku.RectSize.Right;
     rect2.Bottom:=itempointerku.RectSize.Bottom;
     image1.Picture.Assign(itemku.ImageFile);
     //paintbox2.Repaint;
     {************************************************************}
     if((itempointerku.PointerSecondPos.X=-999)
        and(itempointerku.PointerSecondPos.Y=-999))then
     begin
       ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerFirstPos.X,itempointerku.PointerFirstPos.Y);
       classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
       classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
       {********************tampilkan pointer di frame bawah***********************}
       xbawah:= itempointerku.PointerFirstPos.X div 4;
       ybawah:= itempointerku.PointerFirstPos.Y div 4;
       classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
       {*************************************************************}
     end else
     begin
       ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
       classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
       classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
       {********************tampilkan pointer di frame bawah***********************}
       xbawah:= itempointerku.PointerSecondPos.X div 4;
       ybawah:= itempointerku.PointerSecondPos.Y div 4;
       classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
       {*************************************************************}
     end;
   end else
   begin
     if(itempointerku<>temp.ImagePointer.Last)then
     begin
       middleku.X:=(rect2.Left+rect2.Right) div 8;
       middleku.y:=(rect2.Bottom+rect2.Top) div 8;
     //itemku:=listframe.Items[TempAnim+1];

       AnimImage.FocusImage(true,itemku,middleku,rect3,rect4,paintbox1,paintbox2,itemku.ImageFile);
       {************************************************************}
       rect2.Left:=itempointerku.RectSize.Left;
       rect2.Top:=itempointerku.RectSize.Top;
       rect2.Right:=itempointerku.RectSize.Right;
       rect2.Bottom:=itempointerku.RectSize.Bottom;
       image1.Picture.Assign(itemku.ImageFile);
       //paintbox2.Repaint;
       {************************************************************}
       if((itempointerku.PointerSecondPos.X=-999)
          and(itempointerku.PointerSecondPos.Y=-999))then
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerFirstPos.X,itempointerku.PointerFirstPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerFirstPos.X div 4;
         ybawah:= itempointerku.PointerFirstPos.Y div 4;
         classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
         {*************************************************************}
       end else
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerSecondPos.X div 4;
         ybawah:= itempointerku.PointerSecondPos.Y div 4;
         classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
        {*************************************************************}
       end;
     end else
     if(itempointerku=temp.ImagePointer.last)then
     begin
       middleku.X:=(rect2.Left+rect2.Right) div 8;
       middleku.y:=(rect2.Bottom+rect2.Top) div 8;
    {   if (itemku<>listframe.Last)then
       begin
         itemku:=listframe.Items[prevanimcount+1];
       end else
       begin }
         itemku:=listframe.Items[prevanimcount];
    //   end;

       AnimImage.FocusImage(true,itemku,middleku,rect3,rect4,paintbox1,paintbox2,itemku.ImageFile);
       {************************************************************}
       rect2.Left:=itempointerku.RectSize.Left;
       rect2.Top:=itempointerku.RectSize.Top;
       rect2.Right:=itempointerku.RectSize.Right;
       rect2.Bottom:=itempointerku.RectSize.Bottom;
       image1.Picture.Assign(itemku.ImageFile);
       //paintbox2.Repaint;
       {************************************************************}


       {********tampilkan list of pointer***************}
       if((itempointerku.PointerSecondPos.X=-999)
          and(itempointerku.PointerSecondPos.Y=-999))then
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerFirstPos.X,itempointerku.PointerFirstPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerFirstPos.X div 4;
         ybawah:= itempointerku.PointerFirstPos.Y div 4;
         classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
         {*************************************************************}
       end else
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerSecondPos.X div 4;
         ybawah:= itempointerku.PointerSecondPos.Y div 4;
         classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
        {*************************************************************}
       end;
     end ;
   end;

end;
{***********************************************************************}


procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  item,sounditem:listofimage;
begin
try
 if (listframe.Count>0) then
 begin
  new(item);
  item:=listframe.Items[prevanimcount];

  if(((prevanimcount>=listframe.Count-1)and(prevanimcursor>=item.ImagePointer.Count-1))
      or(trackbar1.Position>=trackbar1.Max))then
  begin
    richedit1.Lines.Clear;
    AnimCount:=0;
    counter:=0;
    prevanimcount:=0;
    prevanimcursor:=0;
    trackbar1.Position:=0;
  end;
  animstatus:=true;

  {***************play audio**************************}
  new(sounditem);
  sounditem:=listframe.Items[0];

  if (sounditem.ImageSound.Count > 0) then
  begin
    mediaplayer1.FileName:= sounditem.ImageSound.Strings[0] + sounditem.ImageSound.Strings[1];
    if (mediaplayer1pos = 0) then
    begin
      mediaplayer1.Open;
    end;
    //mediaplayer1.Play;
    timer2.Enabled:=true;
  end;
  {***************************************************}
  timer1.Enabled:=true;
 end;
 except
  showmessage('Your Scenario is not valid');
 end;
end;
procedure TForm2.FormShow(Sender: TObject);
var
  item:listofimage;
  len:integer;
begin
{*************inisialisasi untuk sound***************}
 filepath:= mainform.Edit1.Text;
 filesound:= mainform.Edit2.Text;
{******************update May 23, 2008***************}
 mediaplayer1pos :=0;

 audacitycommand :='';
 richedit1.Lines.Clear;
 if (listframe.Count>0) then
 begin
 {***mengecek apakah akan preview animasi atau sound recording***}
   new(item);
   item:=listframe.Items[0];
   if ispreview = true then
   begin

     speedbutton1.visible:=true;
     speedbutton2.visible:=true;
     speedbutton3.visible:=true;

     if (item.ImageSound.Count > 0) then
     begin
       speedbutton4.visible:=false;
       speedbutton5.visible:=false;
       checkbox1.Visible:=true;
       checkbox1.Checked:=true;
     end else
     begin
       speedbutton4.visible:=true;
       speedbutton5.visible:=true;
       checkbox1.Visible:=false;
     end;
     speedbutton6.visible:=false;
   end else
   begin

     checkbox1.Visible:=false;
     speedbutton1.visible:=false;
     speedbutton2.visible:=true;
     speedbutton3.visible:=true;
     speedbutton4.visible:=false;
     speedbutton5.visible:=false;
     speedbutton6.visible:=true;
     speedbutton6.Left:= 0;
     speedbutton6.Top:=8;
   end;
 {*****inisialisasi**********}
  speedbutton1.Enabled:=true;
  speedbutton2.Enabled:=true;
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
  trackbar1.Enabled:=true;
  {**************************}
  checkallownextprev(animcount,counter,listframe);

  trackbar1.Position:=0;
  counter:=0;
  AnimCount:=0;
  prevanimcount:=0;
  prevanimcursor:=0;

  //new(item);
  //item:=listframe.Items[0];
  image2.Picture.Assign(item.ImageFile);
  image1.Picture.Assign(item.ImageFile);

  animstatus:=false;
  previewku.getlengthmovie(listframe,len,posArray);
  //showmessage(inttostr(len));
  trackbar1.Min:=0;
  trackbar1.Max:=len;
 end else
 begin
   speedbutton1.Enabled:=false;
   speedbutton2.Enabled:=false;
   speedbutton3.Enabled:=false;
   speedbutton4.Enabled:=false;
   speedbutton5.Enabled:=false;
   speedbutton6.Enabled:=false;
   trackbar1.Enabled:=false;
 end;
 timer1.Enabled:=false;
end;

procedure TForm2.PaintBox2Paint(Sender: TObject);
var
  temp,itemku:listofimage;
  itempointerku:listofpointer;
  middleku:Tpoint;
  rect3,rect4,rectku,myrect:Trect;
  screenpoint:Tpoint;
  xbawah,ybawah:integer;

begin

 if((timer1.Enabled=false)and(animstatus=true)and(listframe.Count>0))then
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
     middleku.X:=(rect2.Left+rect2.Right) div 8;
     middleku.y:=(rect2.Bottom+rect2.Top) div 8;
    { if (itemku<>listframe.Last)then
     begin
       itemku:=listframe.Items[prevanimcount+1];
     end else
     begin }
       itemku:=listframe.Items[prevanimcount];
    // end;

     AnimImage.FocusImage(true,itemku,middleku,rect3,rect4,paintbox1,paintbox2,itemku.ImageFile);
     {********tampilkan list of pointer***************}
     if((itempointerku.PointerSecondPos.X=-999)
        and(itempointerku.PointerSecondPos.Y=-999))then
     begin
       ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerFirstPos.X,itempointerku.PointerFirstPos.Y);
       classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
       classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
       {********************tampilkan pointer di frame bawah***********************}
       xbawah:= itempointerku.PointerFirstPos.X div 4;
       ybawah:= itempointerku.PointerFirstPos.Y div 4;
       classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
       {*************************************************************}
     end else
     begin
       ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
       classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
       classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
       {********************tampilkan pointer di frame bawah***********************}
       xbawah:= itempointerku.PointerSecondPos.X div 4;
       ybawah:= itempointerku.PointerSecondPos.Y div 4;
       classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
       {*************************************************************}
     end;
   end else
   begin
     if(itempointerku<>temp.ImagePointer.Last)then
     begin
       middleku.X:=(rect2.Left+rect2.Right) div 8;
       middleku.y:=(rect2.Bottom+rect2.Top) div 8;
     //itemku:=listframe.Items[TempAnim+1];

       AnimImage.FocusImage(true,itemku,middleku,rect3,rect4,paintbox1,paintbox2,itemku.ImageFile);
       {********tampilkan list of pointer***************}
       if((itempointerku.PointerSecondPos.X=-999)
          and(itempointerku.PointerSecondPos.Y=-999))then
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerFirstPos.X,itempointerku.PointerFirstPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerFirstPos.X div 4;
         ybawah:= itempointerku.PointerFirstPos.Y div 4;
         classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
         {*************************************************************}
       end else
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerSecondPos.X div 4;
         ybawah:= itempointerku.PointerSecondPos.Y div 4;
         classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
        {*************************************************************}
       end;
     end else
     if(itempointerku=temp.ImagePointer.last)then
     begin
       middleku.X:=(rect2.Left+rect2.Right) div 8;
       middleku.y:=(rect2.Bottom+rect2.Top) div 8;
      { if (itemku<>listframe.Last)then
       begin
         itemku:=listframe.Items[prevanimcount+1];
       end else
       begin  }
         itemku:=listframe.Items[prevanimcount];
     //  end;

       AnimImage.FocusImage(true,itemku,middleku,rect3,rect4,paintbox1,paintbox2,itemku.ImageFile);
       {********tampilkan list of pointer***************}
       if((itempointerku.PointerSecondPos.X=-999)
          and(itempointerku.PointerSecondPos.Y=-999))then
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerFirstPos.X,itempointerku.PointerFirstPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerFirstPos.X div 4;
         ybawah:= itempointerku.PointerFirstPos.Y div 4;
         classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
         {*************************************************************}
       end else
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerSecondPos.X div 4;
         ybawah:= itempointerku.PointerSecondPos.Y div 4;
         classPointer.MousePointingM(true,xbawah,ybawah,prevanimcursor+1,paintbox2);
        {*************************************************************}
       end;
     end ;
   end;
 end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
var
  previtem,animateitem:listofimage;
  animcursor,prevpointer:listofpointer;
  temp:listofimage;
  temppoint:Tpoint;
begin
  try
   prevAnimCount:=animcount;
   prevAnimCursor:=counter;

   if ((listframe<>nil)and(listframe.Count > 0))then
   begin
     new(animateitem);
     animateitem:=listframe.Items[animcount];

     {*****************************testing update on april 10, 2008***************************}
     {**********play the audio**********************
     new(sounditem);
     sounditem:=listframe.Items[0];
     if (sounditem.ImageSound.Count > 0) then
     begin


       mediaplayer1.FileName:= sounditem.ImageSound.Strings[0] + sounditem.ImageSound.Strings[1];

       mediaplayer1.Open;
       timer2.Enabled:=true;
       //mediaplayer1.Play;

     end;
     *****************************************************************}
     if ((counter=0)and(animateitem.ImageText.Count>0)and
        (fileexists(extractfilepath(paramstr(0))+'ImageText.rtf')))then
     begin
       sleep(300);
       animateitem.ImageText.SaveToFile(extractfilepath(paramstr(0))+'ImageText.rtf');
       Richedit1.Lines.LoadFromFile(extractfilepath(paramstr(0))+'ImageText.rtf');
     end;
     {*****************************************************************}

     if((animcount=0)and(animateitem<>nil))then
     begin
       new(animcursor);

       if(animateitem.ImagePointer.Count=1)then
       begin
         animcursor:=animateitem.ImagePointer.Items[counter];
         temppoint.X:=(animcursor.RectSize.Left+animcursor.RectSize.Right) div 2;
         temppoint.Y:=(animcursor.RectSize.Top+animcursor.RectSize.Bottom) div 2;
         previewku.InitCursor(temp,animateitem.ImageFile,animcursor.PointerFile,animcursor.RectSize,temppoint,'0');

         previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);

         {************************************************************}
         if(animateitem<>listframe.Last)then
         begin
           new(nextitem);
           nextitem:=listframe.Items[animcount+1];
           if(nextitem<>nil)then
           begin
             if ((animcursor.PointerSecondPos.X<>-999)
                and(animcursor.PointerSecondPos.Y<>-999))then
             begin
               previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);

             end else
             begin
               previewku.AnimationExecute(false,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);

             end;
             counter:=0;
             animcount:=animcount+1;

           end;
         end else
         begin
           timer1.Enabled:=false;
           timer2.Enabled:=false;
           mediaplayer1pos :=0;
           counter:=0;
           animcount:=0;
           {*******************launch audacity********************}
           if (audacitycommand <> '') then
           begin
             ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\save audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
             audacitycommand := 'save';
             //audacitycommand := '';
           end;
           {******************************************************}

         end;

       end else
       if(animateitem.ImagePointer.Count>1)then
       begin
         animcursor:=animateitem.ImagePointer.Items[counter];
         if(animcursor=animateitem.ImagePointer.First)then
         begin
           temppoint.X:=(animcursor.RectSize.Left+animcursor.RectSize.Right) div 2;
           temppoint.Y:=(animcursor.RectSize.Top+animcursor.RectSize.Bottom) div 2;
           previewku.InitCursor(temp,animateitem.ImageFile,animcursor.PointerFile,animcursor.RectSize,temppoint,'0');

           previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
           counter:=counter+1;

         end else
         if(animcursor=animateitem.ImagePointer.Last)then
         begin
           if(animateitem<>listframe.Last)then
           begin
             new(nextitem);
             nextitem:=listframe.Items[animcount+1];
             if(nextitem<>nil)then
             begin
               if ((animcursor.PointerSecondPos.X<>-999)
                  and(animcursor.PointerSecondPos.Y<>-999))then
               begin
                 previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
                 previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
               end else
               begin
                 previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter-1,counter);
               end;
               counter:=0;
               animcount:=animcount+1;

             end;
           end else
           begin
             previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
             timer1.Enabled:=false;
             timer2.Enabled:=false;
             mediaplayer1pos :=0;
             counter:=0;
             animcount:=0;
             {*******************launch audacity********************}
             if (audacitycommand <> '') then
             begin
               ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\save audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
               audacitycommand := 'save';
               //audacitycommand := '';
             end;
             {******************************************************}
           end;
         end else
         begin
           previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
           counter:=counter+1;

         end;
       end else
       begin
         timer1.Enabled:=false;
         timer2.Enabled:=false;
         mediaplayer1pos :=0;
         counter:=0;
         animcount:=0;
         {*******************launch audacity********************}
         if (audacitycommand <> '') then
         begin
           ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\save audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
           audacitycommand := 'save';
           //audacitycommand := '';
         end;
         {******************************************************}
       end;
     end else
     if((animcount>0)and(animateitem<>nil))then
     begin
       new(animcursor);
       if(animateitem.ImagePointer.Count=1)then
       begin
         animcursor:=animateitem.ImagePointer.Items[counter];
         new(previtem);
         previtem:=listframe.Items[animcount-1];
         new(prevpointer);
         prevpointer:=previtem.ImagePointer.Last;


         if ((prevpointer.PointerSecondPos.X<>-999)
            and(prevpointer.PointerSecondPos.Y<>-999))then
         begin
           previewku.InitCursor(temp,animateitem.ImageFile,prevpointer.PointerFile,prevpointer.RectSize,prevpointer.PointerSecondPos,animateitem.ImageName);
         end else
         begin
           previewku.InitCursor(temp,animateitem.ImageFile,prevpointer.PointerFile,prevpointer.RectSize,prevpointer.PointerFirstPos,animateitem.ImageName);
         end;

         previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
         {************************************************************}
         if(animateitem<>listframe.Last)then
         begin
           new(nextitem);
           nextitem:=listframe.Items[animcount+1];
           if(nextitem<>nil)then
           begin
             if ((animcursor.PointerSecondPos.X<>-999)
                and(animcursor.PointerSecondPos.Y<>-999))then
             begin
               previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
             end else
             begin
               previewku.AnimationExecute(false,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
             end;
             counter:=0;
             animcount:=animcount+1;

           end;
         end else
         begin
           timer1.Enabled:=false;
           timer2.Enabled:=false;
           mediaplayer1pos :=0;
           counter:=0;
           animcount:=0;
           {*******************launch audacity********************}
           if (audacitycommand <> '') then
           begin
             ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\save audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
             audacitycommand := 'save';
             //audacitycommand := '';
           end;
           {******************************************************}

         end;

       end else
       if(animateitem.ImagePointer.Count>1)then
       begin
         animcursor:=animateitem.ImagePointer.Items[counter];
         if(animcursor=animateitem.ImagePointer.First)then
         begin
           new(previtem);
           previtem:=listframe.Items[animcount-1];
           new(prevpointer);
           prevpointer:=previtem.ImagePointer.Last;


           if ((prevpointer.PointerSecondPos.X<>-999)
            and(prevpointer.PointerSecondPos.Y<>-999))then
           begin
             previewku.InitCursor(temp,animateitem.ImageFile,prevpointer.PointerFile,prevpointer.RectSize,prevpointer.PointerSecondPos,animateitem.ImageName);
           end else
           begin
             previewku.InitCursor(temp,animateitem.ImageFile,prevpointer.PointerFile,prevpointer.RectSize,prevpointer.PointerFirstPos,animateitem.ImageName);
           end;

           previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
           counter:=counter+1;

         end else
         if(animcursor=animateitem.ImagePointer.Last)then
         begin
           if(animateitem<>listframe.Last)then
           begin
             new(nextitem);
             nextitem:=listframe.Items[animcount+1];
             if(nextitem<>nil)then
             begin
               if ((animcursor.PointerSecondPos.X<>-999)
                  and(animcursor.PointerSecondPos.Y<>-999))then
               begin
                 previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
                 previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
               end else
               begin
                 previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter-1,counter);
               end;
               counter:=0;
               animcount:=animcount+1;

             end;
           end else
           begin
             previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
             timer1.Enabled:=false;
             timer2.Enabled:=false;
             mediaplayer1pos :=0;
             counter:=0;
             animcount:=0;
             {*******************launch audacity********************}
             if (audacitycommand <> '') then
             begin
               ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\save audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
               audacitycommand := 'save';
               //audacitycommand := '';
             end;
             {******************************************************}
           end;
         end else
         begin
           previewku.AnimationExecute(true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
           counter:=counter+1;

         end;
       end else
       begin
         timer1.Enabled:=false;
         timer2.Enabled:=false;
         mediaplayer1pos :=0;
         counter:=0;
         animcount:=0;
         {*******************launch audacity********************}
         if (audacitycommand <> '') then
         begin
           ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\save audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
           audacitycommand := 'save';
           //audacitycommand := '';
         end;
        {******************************************************}
       end;
     end else
     begin
       timer1.Enabled:=false;
       timer2.Enabled:=false;
       mediaplayer1pos :=0;
       counter:=0;
       animcount:=0;
       {*******************launch audacity********************}
       if (audacitycommand <> '') then
       begin
         ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\save audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
         audacitycommand := 'save';
         //audacitycommand := '';
       end;
      {******************************************************}
     end;
   end else
   begin
     timer1.Enabled:=false;
     timer2.Enabled:=false;
     mediaplayer1pos :=0;
     counter:=0;
     animcount:=0;
     {*******************launch audacity********************}
     if (audacitycommand <> '') then
     begin
       ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\save audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
       audacitycommand := 'save';
       //audacitycommand := '';
     end;
    {******************************************************}
   end;

   {***************************************}
   trackbar1.Position:=trackbar1.Position+1;
   {***************************************}
  //  trackbar1.Position:=previewku.SearchPosition(posarray,prevanimcount,prevanimcursor);
   checkallownextPrev(prevanimcount,prevanimcursor,listframe);
  except
   showmessage('Your Scenario is not valid');
   application.Terminate;
  end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
var
  sounditem:listofimage;
begin
   timer1.Enabled:=false;
   {**************************update May 23, 2008********}
   if (mediaplayer1.Mode = mpOpen) or (mediaplayer1.Mode = mpPlaying) then
   begin
    new(sounditem);
    sounditem:=listframe.Items[0];
    if (sounditem.ImageSound.Count > 0) then
    begin
     //if (mediaplayer1.Mode = mpOpen) or (mediaplayer1.Mode = mpPlaying) then
     //begin
       timer2.Enabled:=false;
       mediaplayer1.stop;
     //end;
    end;
   end;
   {*******************launch audacity********************}
   if (audacitycommand <> '') then
   begin
     if audacitycommand <> 'pause' then
     begin
       ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\pause audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
       audacitycommand := 'pause';
     end else
     begin
       audacitycommand := 'pause';
     end;
   end;

   {******************************************************}
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
var
   sounditem:listofimage;
begin
  if(listframe.Count>0)then
  begin
   {*******************launch audacity********************}
   if (audacitycommand <> '') then
   begin
     ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\stop audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
     audacitycommand := 'stop';
   end;

   {******************************************************}
   richedit1.Lines.Clear;
   counter:=0;
   AnimCount:=0;
   prevanimcount:=0;
   prevanimcursor:=0;
   trackbar1.Position:=0;
   timer1.enabled:=false;
   {**************************update May 23, 2008********}
   if (mediaplayer1.Mode = mpOpen) or (mediaplayer1.Mode = mpPlaying) then
   begin
    new(sounditem);
    sounditem:=listframe.Items[0];
    if (sounditem.ImageSound.Count > 0) then
    begin
     //if (mediaplayer1.Mode = mpOpen) or (mediaplayer1.Mode = mpPlaying) then
     //begin
       mediaplayer1.Position:=0;
       mediaplayer1pos := mediaplayer1.Position;
       timer2.Enabled:=false;
     //end;
    end;
   end;
  end;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
var
  itemku:listofimage;
begin
try
  if((timer1.Enabled=false)and(listframe.Count>0))then
  begin
    {*******************************************************}
    animstatus:=true;

    prevAnimCount:=animcount;
    prevAnimCursor:=counter;

    new(Itemku);
    itemku:=listframe.Items[animcount];

    if(animcount < listframe.Count-1)then
    begin
      if (counter=itemku.ImagePointer.Count-1)then
      begin
        animcount:=animcount+1;
        counter:=0;
      end else
      begin
        counter:=counter+1;
      end;
    end else
    if(animcount=listframe.Count-1)then
    begin
      if (counter<itemku.ImagePointer.Count-1)then
      begin
        counter:=counter+1;
      end else
      begin
        speedbutton4.Enabled:=false;
      end;
    end else
    begin
      speedbutton4.Enabled:=false;
    end;

    trackbar1.Position:=previewku.SearchPosition(posarray,prevanimcount,prevanimcursor);
    checkallownextPrev(prevanimcount,prevanimcursor,listframe);
    moveframe(prevanimcount,prevanimcursor,rect2);

  end;
except
  showmessage('Your Scenario is not valid');
end;
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
var
  temp:listofimage;
begin
try
  if((timer1.Enabled=false)and(listframe.Count>0))then
  begin
    {*******************************************************}
    animstatus:=true;

    AnimCount:=prevanimcount;
    counter:=prevanimcursor;

    if(prevanimcount=0)then
    begin
      if (prevanimcursor>0)then
      begin
        prevanimcursor:=prevanimcursor-1;
   //     trackbar1.Position:=trackbar1.Position-1;
      end else
      begin
        speedbutton5.Enabled:=false;

      end;
    end else
    if(prevanimcount>0)then
    begin
      if (prevanimcursor=0)then
      begin
        prevanimcount:=prevanimcount-1;

        new(temp);
        temp:=listframe.Items[prevanimcount];
        prevanimcursor:=temp.ImagePointer.Count-1;
    //    trackbar1.Position:=trackbar1.Position-1;
      end else
      if(prevanimcursor > 0)then
      begin
        prevanimcursor:=prevanimcursor-1;
    //    trackbar1.Position:=trackbar1.Position-1;
      end;
    end else
    begin

      speedbutton5.Enabled:=false;

    end;
    trackbar1.Position:=previewku.SearchPosition(posarray,prevanimcount,prevanimcursor);
    moveframe(prevanimcount,prevanimcursor,rect2);
    checkallownextPrev(prevanimcount,prevanimcursor,listframe);
  end;
except
  showmessage('Your Scenario is not valid');
end;
end;

procedure TForm2.TrackBar1Change(Sender: TObject);
var
  temp,temp2:listpos;
begin

try
 {*******************************************************}
  if((timer1.Enabled=false)and(listframe.Count>0))then
  begin

    animstatus:=true;
    new(temp);
    new(temp2);
    temp:=posArray.Items[trackbar1.position];
    if((temp<>posarray.Last)and(trackbar1.Position < trackbar1.Max))then
    begin
      temp2:=posArray.Items[trackbar1.position+1];
    end else
    begin
      temp2:=posArray.Items[trackbar1.position];
    end;

    prevanimcount:=temp.x;
    prevanimcursor:=temp.y;

    animcount:=temp2.x;
    counter:=temp2.y;

    moveframe(prevanimcount,prevanimcursor,rect2);
    checkallownextPrev(prevanimcount,prevanimcursor,listframe);
  //  checkallownextPrev(animcount,counter,listframe);
  end;
except
  showmessage('Your Scenario is not valid');
end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  sounditem : listofimage;
begin
   if (listframe.Count > 0) then
   begin
     new(sounditem);
     sounditem:=listframe.Items[0];
     if ((sounditem.ImageSound.Count = 0) and (filepath <> '')and (filesound<>''))then
     begin
       sounditem.ImageSound.Add(filepath);
       sounditem.ImageSound.Add(filesound);
     end;
   end;
   {***************untuk stop audio************************}
   if (mediaplayer1.Mode = mpOpen) or (mediaplayer1.Mode = mpPlaying) then
   begin
     mediaplayer1.Position:=0;
     mediaplayer1pos := mediaplayer1.Position;
     timer2.Enabled:=false;
   end;

    trackbar1.Position:=0;
    prevanimcount:=0;
    prevanimcursor:=0;
    animcount:=0;
    counter:=0;
    image1.Picture:=nil;
    image2.Picture:=nil;
    timer1.Enabled:=false;
    //timer2.Enabled:=false;
    mainform.Edit1.Text:= filepath;
    mainform.Edit2.Text:=filesound;
    
end;

procedure TForm2.Timer2Timer(Sender: TObject);
{var
  animateitem : listofimage; }
begin

    mediaplayer1.Play;
    mediaplayer1pos :=mediaplayer1.Position;


    {if (mediaplayer1.Position = mediaplayer1.Length) then
    begin
      mediaplayer1.Close;
      timer2.Enabled := False;
      timer1.Enabled:=true;
    end;}

    {new(animateitem);
    animateitem:=listframe.Items[animcount];

    if (counter =(animateitem.ImagePointer.Count - 1))and (trackbar1.Position>=trackbar1.Max) then
    begin
      counter:=0;
      animcount:=0;
      timer1.Enabled:=false;
      timer2.Enabled:=false;
    end;}

end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
var
  item:listofimage;
begin
try
 if (listframe.Count>0) then
 begin
  {*******************launch audacity********************}
  if audacitycommand = '' then
  begin
    ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\open audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
    audacitycommand:='openrecord';
  end else
  if (audacitycommand ='openrecord') or (audacitycommand ='stop') then
  begin
    ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\record audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
    audacitycommand:='record';
  end else
  if audacitycommand = 'pause' then
  begin
    ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\pause audacity.exe'), nil, nil, SW_SHOWMINIMIZED);
    audacitycommand:='repause';
  end;
  {******************************************************}
  new(item);
  item:=listframe.Items[prevanimcount];

  if(((prevanimcount>=listframe.Count-1)and(prevanimcursor>=item.ImagePointer.Count-1))
      or(trackbar1.Position>=trackbar1.Max))then
  begin
    richedit1.Lines.Clear;
    AnimCount:=0;
    counter:=0;
    prevanimcount:=0;
    prevanimcursor:=0;
    trackbar1.Position:=0;

    {*******************launch audacity********************}

    audacitycommand := 'stop';

    {******************************************************}
  end;
  animstatus:=true;
  timer1.Enabled:=true;
 end;
except
  showmessage('Your Scenario is not valid');
end;
end;
procedure TForm2.checkbox1Click(Sender: TObject);
var
  sounditem:listofimage;

begin
  {******************************************************}
  if(listframe.Count>0)then
  begin
     richedit1.Lines.Clear;
     counter:=0;
     AnimCount:=0;
     prevanimcount:=0;
     prevanimcursor:=0;
     trackbar1.Position:=0;
     timer1.enabled:=false;
     {**************************update May 23, 2008********}
     new(sounditem);
     sounditem:=listframe.Items[0];
     if (mediaplayer1.Mode = mpOpen) or (mediaplayer1.Mode = mpPlaying) then
     begin
      if (sounditem.ImageSound.Count > 0) then
      begin
       //if (mediaplayer1.Mode = mpOpen) or (mediaplayer1.Mode = mpPlaying) then
       //begin
         mediaplayer1.Position:=0;
         mediaplayer1pos := mediaplayer1.Position;
         timer2.Enabled:=false;
       //end;
      end;
     end;
   {*********mengecek apakah ingin menggunakan sound********}
   if checkbox1.Checked then
   begin
    speedbutton4.Visible:=false;
    speedbutton5.Visible:=false;
    if (sounditem.ImageSound.Count = 0) then
    begin
      sounditem.ImageSound.Add(filepath);
      sounditem.ImageSound.Add(filesound);

      mainform.Edit1.Text:=sounditem.ImageSound.Strings[0];
      mainform.edit1.Hint:=mainform.edit1.Text;
      mainform.Edit2.Text:=sounditem.ImageSound.Strings[1];
      mainform.edit2.Hint:=mainform.edit2.Text;
    end;
   end else
   begin
    speedbutton4.Visible:=true;
    speedbutton5.Visible:=true;
    if (sounditem.ImageSound.Count > 0) then
    begin
      sounditem.ImageSound.Delete(1);
      sounditem.ImageSound.Delete(0);

      mainform.edit1.Text:= '';
      mainform.edit1.Hint:=mainform.edit1.Text;
      mainform.edit2.Text:= '';
      mainform.edit2.Hint:=mainform.edit2.Text;
    end;
   end;
  end;
end;

end.



