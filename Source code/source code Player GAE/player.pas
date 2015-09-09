unit player;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, FileCtrl, Buttons, ComCtrls, Menus,primitifplayer,aboutpalyer,zooming,
  jpeg, MPlayer;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Image2: TImage;
    PaintBox1: TPaintBox;
    Panel2: TPanel;
    Image1: TImage;
    PaintBox2: TPaintBox;
    RichEdit1: TRichEdit;
    TrackBar1: TTrackBar;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Setting1: TMenuItem;
    CursorSpeed1: TMenuItem;
    File1: TMenuItem;
    ManualsDirectory1: TMenuItem;
    About1: TMenuItem;
    ProgressBar1: TProgressBar;
    Zoom1: TMenuItem;
    Exit1: TMenuItem;
    Timer2: TTimer;
    checkbox1: TCheckBox;
    MediaPlayer1: TMediaPlayer;
    FileListBox1: TFileListBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure ManualsDirectory1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure CursorSpeed1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Zoom1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure checkbox1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure MoveFrame(prevanimcount,prevanimcursor:integer;var rect2:Trect);
    procedure CheckAllowNextPrev(prevanimcount,prevanimcursor:integer;scenario:Tlist);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  listframe:Tlist;
  previewku:previewAnim;
//  pointku:TPoint;
  rect1,rect2:Trect;
  animcount,counter:integer;
  AnimImage:Image;
  nextitem:listofimage;
  animstatus:boolean;
  prevAnimCount:integer;
  prevAnimCursor:integer;
  posArray:Tlist;
  classpointer:mousepointer;
  fileop1:fileop;
  invalrect,invalcur:integer;
  mediaplayer1pos :integer;
  filepath,filesound:string;
implementation

uses DirConfig, speedconfig,shellapi;
{$R *.dfm}

{***********************Deklaraasi Privat Preview***********************}

procedure Tform1.CheckAllowNextPrev(prevanimcount,prevanimcursor:integer;scenario:Tlist);
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




procedure Tform1.MoveFrame(prevanimcount,prevanimcursor:integer;var rect2:Trect);
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
     {if (itemku<>listframe.Last)then
     begin
       itemku:=listframe.Items[prevanimcount+1];
     end else
     begin}
       itemku:=listframe.Items[prevanimcount];
     //end;

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
       classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
       {*************************************************************}
     end else
     begin
       ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
       classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
       classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
       {********************tampilkan pointer di frame bawah***********************}
       xbawah:= itempointerku.PointerSecondPos.X div 4;
       ybawah:= itempointerku.PointerSecondPos.Y div 4;
       classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
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
         classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
         {*************************************************************}
       end else
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerSecondPos.X div 4;
         ybawah:= itempointerku.PointerSecondPos.Y div 4;
         classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
        {*************************************************************}
       end;
     end else
     if(itempointerku=temp.ImagePointer.last)then
     begin
       middleku.X:=(rect2.Left+rect2.Right) div 8;
       middleku.y:=(rect2.Bottom+rect2.Top) div 8;
       {if (itemku<>listframe.Last)then
       begin
         itemku:=listframe.Items[prevanimcount+1];
       end else
       begin}
         itemku:=listframe.Items[prevanimcount];
       //end;

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
         classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
         {*************************************************************}
       end else
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerSecondPos.X div 4;
         ybawah:= itempointerku.PointerSecondPos.Y div 4;
         classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
        {*************************************************************}
       end;
     end ;
   end;

end;
{***********************************************************************}
procedure TForm1.SpeedButton1Click(Sender: TObject);
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

procedure TForm1.SpeedButton2Click(Sender: TObject);
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
   
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
  sounditem:listofimage;
begin
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

procedure TForm1.SpeedButton4Click(Sender: TObject);
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

procedure TForm1.SpeedButton5Click(Sender: TObject);
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

procedure TForm1.Timer1Timer(Sender: TObject);
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
     {*****************************************************************}
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
         if(bolehzooming=false)then
         begin
           previewku.AnimationExecute(invalRect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
         end else
         {************************************************************}
         if(bolehzooming=true)then
         begin
           previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,temp,animateitem,0,counter);
         end;
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
               if(bolehzooming=false)then
               begin
                  previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
               end else
               {************************************************************}
               if(bolehzooming=true)then
               begin
                 previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,nextItem,counter,counter);
               end;
               {************************************************************}
             end else
             begin
               if(bolehzooming=false)then
               begin
                 previewku.AnimationExecute(invalrect,invalcur,false,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
               end else
               {************************************************************}
               if(bolehzooming=true)then
               begin
                 previewku.ZoomAnimationExecute(invalRect,invalcur,false,form5.PaintBox1,form5.image1,animateitem,nextItem,counter,counter);
               end;
               {************************************************************}
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
         end;
         {***********************************************************************}
       end else
       if(animateitem.ImagePointer.Count>1)then
       begin
         animcursor:=animateitem.ImagePointer.Items[counter];
         if(animcursor=animateitem.ImagePointer.First)then
         begin
           temppoint.X:=(animcursor.RectSize.Left+animcursor.RectSize.Right) div 2;
           temppoint.Y:=(animcursor.RectSize.Top+animcursor.RectSize.Bottom) div 2;
           previewku.InitCursor(temp,animateitem.ImageFile,animcursor.PointerFile,animcursor.RectSize,temppoint,'0');
           if(bolehzooming=false)then
           begin
             previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
           end else
           {************************************************************}
           if(bolehzooming=true)then
           begin
             previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,temp,animateitem,0,counter);
           end;
           {************************************************************}
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
                 if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
                 end else
                 {************************************************************}
                 if(bolehzooming=true)then
                 begin
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,animateitem,counter-1,counter);
                 end;
                 {************************************************************}
                 if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
                 end else
                 {************************************************************}
                 if(bolehzooming=true)then
                 begin
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,nextItem,counter,counter);
                 end;
                 {************************************************************}
               end else
               begin
                 if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter-1,counter);
                 end else
                 {************************************************************}
                 if(bolehzooming=true)then
                 begin
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,nextItem,counter-1,counter);
                 end;
                 {************************************************************}
               end;
               counter:=0;
               animcount:=animcount+1;

             end;
           end else
           begin
             if(bolehzooming=false)then
             begin
               previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
             end else
             {************************************************************}
             if(bolehzooming=true)then
             begin
               previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,animateitem,counter-1,counter);
             end;
             {************************************************************}
             timer1.Enabled:=false;
             timer2.Enabled:=false;
             mediaplayer1pos :=0;
             counter:=0;
             animcount:=0;
           end;
         end else
         begin
           if(bolehzooming=false)then
           begin
             previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
           end else
           {************************************************************}
           if(bolehzooming=true)then
           begin
             previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,animateitem,counter-1,counter);
           end;
           {************************************************************}
           counter:=counter+1;

         end;
       end else
       begin
         timer1.Enabled:=false;
         timer2.Enabled:=false;
         mediaplayer1pos :=0;
         counter:=0;
         animcount:=0;
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
         if(bolehzooming=false)then
         begin
           previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
         end else
         {************************************************************}
         if(bolehzooming=true)then
         begin
           previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,temp,animateitem,0,counter);
         end;
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
               if(bolehzooming=false)then
               begin
                 previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
               end else
               {************************************************************}
               if(bolehzooming=true)then
               begin
                 previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,nextItem,counter,counter);
               end;
               {************************************************************}
             end else
             begin
               if(bolehzooming=false)then
               begin
                 previewku.AnimationExecute(invalrect,invalcur,false,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
               end else
               {************************************************************}
               if(bolehzooming=true)then
               begin
                 previewku.ZoomAnimationExecute(invalRect,invalcur,false,form5.PaintBox1,form5.image1,animateitem,nextItem,counter,counter);
               end;
               {************************************************************}
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
         end;
         {***********************************************************************}
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
           if(bolehzooming=false)then
           begin
             previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
           end else
           {************************************************************}
           if(bolehzooming=true)then
           begin
              previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,temp,animateitem,0,counter);
           end;
           {************************************************************}

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
                 if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
                 end else
                 {************************************************************}
                 if(bolehzooming=true)then
                 begin
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,animateitem,counter-1,counter);
                 end;
                 {************************************************************}
                 if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
                 end else
                 {************************************************************}
                 if(bolehzooming=true)then
                 begin
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,nextItem,counter,counter);
                 end;
                 {************************************************************}
               end else
               begin
                 if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter-1,counter);
                 end else
                 {************************************************************}
                 if(bolehzooming=true)then
                 begin
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,nextItem,counter-1,counter);
                 end;
                 {************************************************************}
               end;
               counter:=0;
               animcount:=animcount+1;

             end;
           end else
           begin
             if(bolehzooming=false)then
             begin
               previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
             end else
             {************************************************************}
             if(bolehzooming=true)then
             begin
               previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,animateitem,counter-1,counter);
             end;
             {************************************************************}
             timer1.Enabled:=false;
             timer2.Enabled:=false;
             mediaplayer1pos :=0;
             counter:=0;
             animcount:=0;
           end;
         end else
         begin
           if(bolehzooming=false)then
           begin
             previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
           end else
           {************************************************************}
           if(bolehzooming=true)then
           begin
             previewku.ZoomAnimationExecute(invalRect,invalcur,true,form5.PaintBox1,form5.image1,animateitem,animateitem,counter-1,counter);
           end;
           {************************************************************}
           counter:=counter+1;

         end;
       end else
       begin
         timer1.Enabled:=false;
         timer2.Enabled:=false;
         mediaplayer1pos :=0;
         counter:=0;
         animcount:=0;
       end;
     end else
     begin
       timer1.Enabled:=false;
       timer2.Enabled:=false;
       mediaplayer1pos :=0;
       counter:=0;
       animcount:=0;
     end;
   end else
   begin
     timer1.Enabled:=false;
     timer2.Enabled:=false;
     mediaplayer1pos :=0;
     counter:=0;
     animcount:=0;
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

procedure TForm1.TrackBar1Change(Sender: TObject);
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

procedure TForm1.PaintBox2Paint(Sender: TObject);
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
     {if (itemku<>listframe.Last)then
     begin
       itemku:=listframe.Items[prevanimcount+1];
     end else
     begin}
       itemku:=listframe.Items[prevanimcount];
     //end;

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
       classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
       {*************************************************************}
     end else
     begin
       ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
       classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
       classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
       {********************tampilkan pointer di frame bawah***********************}
       xbawah:= itempointerku.PointerSecondPos.X div 4;
       ybawah:= itempointerku.PointerSecondPos.Y div 4;
       classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
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
         classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
         {*************************************************************}
       end else
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerSecondPos.X div 4;
         ybawah:= itempointerku.PointerSecondPos.Y div 4;
         classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
        {*************************************************************}
       end;
     end else
     if(itempointerku=temp.ImagePointer.last)then
     begin
       middleku.X:=(rect2.Left+rect2.Right) div 8;
       middleku.y:=(rect2.Bottom+rect2.Top) div 8;
       {if (itemku<>listframe.Last)then
       begin
         itemku:=listframe.Items[prevanimcount+1];
       end else
       begin}
         itemku:=listframe.Items[prevanimcount];
       //end;

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
         classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
         {*************************************************************}
       end else
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(rect2,itempointerku.PointerSecondPos.X,itempointerku.PointerSecondPos.Y);
         classPointer.MousePointing(true,screenPoint.X,screenPoint.Y,prevanimcursor,rectku,itempointerku.PointerFile,paintbox1);
         classpointer.TextToRect(paintbox1,rectku.Right,rectku.Top,itempointerku.PointerText,myrect);
         {********************tampilkan pointer di frame bawah***********************}
         xbawah:= itempointerku.PointerSecondPos.X div 4;
         ybawah:= itempointerku.PointerSecondPos.Y div 4;
         classPointer.MousePointingM(xbawah,ybawah,prevanimcursor+1,paintbox2);
        {*************************************************************}
       end;
     end ;
   end;
 end;
end;

procedure TForm1.ManualsDirectory1Click(Sender: TObject);
begin
   form2.show;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  s,sum:string;
  settingfilename:string;
  settingfile:textfile;  
begin
    invalrect:=10;
    invalcur:=5;
    SettingFileName:=extractfilepath(paramstr(0))+'settingplayer.txt';
    Assignfile(SettingFile,SettingFileName);
    reset(SettingFile);
    sum:='';
    while(not eof(SettingFile))do
    begin
      readln(Settingfile,s);
      sum:=sum+s;
    end;
    closefile(settingfile);
    if (sum='')then
    begin
      filelistbox1.Directory:=extractfilepath(paramstr(0));
    end else

    if (sum<>'')then
    begin
      {*open file to read*}
      Assignfile(SettingFile,SettingFileName);
      reset(SettingFile);
      readln(Settingfile,s);
      filelistbox1.Directory:=s;
      closefile(Settingfile);
    end;

    {**************************************}
    //filelistbox1.Directory:=extractfilepath(paramstr(0));

    speedbutton1.Enabled:=false;
    speedbutton2.Enabled:=false;
    speedbutton3.Enabled:=false;
    speedbutton4.Enabled:=false;
    speedbutton5.Enabled:=false;
    trackbar1.Enabled:=false;
    richedit1.Lines.Clear;
    {**************************************}
end;
procedure TForm1.FileListBox1Click(Sender: TObject);
var
  item:listofimage;
  len:integer;
 // fileteks:string;
begin
 {******************update May 23, 2008***************}
 mediaplayer1pos :=0;
 {****************************************************}

 filelistbox1.Hint:= extractfilename(filelistbox1.FileName);
 progressbar1.Min:=0;
 progressbar1.Max:=100;
 progressbar1.Position:=0;
 trackbar1.Position:=0;
 {fileop1.ExtractFile(filelistbox1.FileName,fileteks);
 if fileexists(fileteks+'.rtf')then
 begin
   richedit1.Lines.LoadFromFile(fileteks+'.rtf');
 end;}
 fileop1.OpenFileAnimasi(progressbar1,filelistbox1.FileName,listframe,filepath,filesound);

 if (listframe.Count>0) then
 begin
 {***************pengecekan untuk sound**************}
   new(item);
   item:=listframe.Items[0];
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
 {*****inisialisasi**********}
  speedbutton1.Enabled:=true;
  speedbutton2.Enabled:=true;
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  trackbar1.Enabled:=true;
  richedit1.Lines.Clear;
  {**************************}

  timer1.Enabled:=false;
  counter:=0;
  AnimCount:=0;
  prevanimcount:=0;
  prevanimcursor:=0;

  {**************************update May 23, 2008********}
   if (mediaplayer1.Mode = mpOpen) or (mediaplayer1.Mode = mpPlaying) then
   begin
    //new(sounditem);
    //sounditem:=listframe.Items[0];
    if (item.ImageSound.Count > 0) then
    begin
     //if (mediaplayer1.Mode = mpOpen) or (mediaplayer1.Mode = mpPlaying) then
     //begin
       mediaplayer1.Position:=0;
       mediaplayer1pos := mediaplayer1.Position;
       timer2.Enabled:=false;
     //end;
    end else
    begin
      mediaplayer1.Stop;
      timer2.Enabled:=false;
    end;
   end;

  checkallownextprev(animcount,counter,listframe);
  //new(item);
  //item:=listframe.Items[0];
  image2.Picture.Assign(item.ImageFile);
  image1.Picture.Assign(item.ImageFile);

  form5.Image1.Picture.Assign(item.ImageFile);

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
   trackbar1.Enabled:=false;
   richedit1.Lines.Clear;
 end;
end;

procedure TForm1.CursorSpeed1Click(Sender: TObject);
begin
  form3.show;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  with Tform4.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TForm1.Zoom1Click(Sender: TObject);
begin
   form5.Show;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
   close;
end;

procedure TForm1.checkbox1Click(Sender: TObject);
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
   {*********mengecek apakah ingin menggunakan sound********}
   if checkbox1.Checked then
   begin
    speedbutton4.Visible:=false;
    speedbutton5.Visible:=false;
    if (sounditem.ImageSound.Count = 0) then
    begin
      sounditem.ImageSound.Add(filepath);
      sounditem.ImageSound.Add(filesound);
    end;
   end else
   begin
    speedbutton4.Visible:=true;
    speedbutton5.Visible:=true;
    if (sounditem.ImageSound.Count > 0) then
    begin
      sounditem.ImageSound.Delete(1);
      sounditem.ImageSound.Delete(0);
    end;
   end;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  mediaplayer1.Play;
  mediaplayer1pos :=mediaplayer1.Position;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'howto\BakpiaPlayerHelp.exe'), nil, nil, SW_SHOWNORMAL);
end;

end.
