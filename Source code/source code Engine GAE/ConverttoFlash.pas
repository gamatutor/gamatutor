unit ConverttoFlash;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls,desainer,primitif,Dialogs, MPlayer;

type
  TFlash = class(TForm)
    Image1: TImage;
    PaintBox1: TPaintBox;
    zoomTimer1: TTimer;
    zoomTimer2: TTimer;
    procedure PaintBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zoomTimer1Timer(Sender: TObject);
    procedure zoomTimer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flash: TFlash;

implementation
uses shellAPI, PointerMouse,preview;

{$R *.dfm}

procedure TFlash.PaintBox1Click(Sender: TObject);
begin
   {flash.Close;
   timer1.Enabled:=false;
   ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Stop Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
   setresolution(PrevX,PrevY);  }
end;

procedure TFlash.FormShow(Sender: TObject);
var
  item,sounditem:listofimage;

begin

 {*************inisialisasi untuk sound***************}
 filepath:= mainform.Edit1.Text;
 filesound:= mainform.Edit2.Text;
 {******************update May 23, 2008***************}
 mediaplayer1pos :=0;

 {************************update on March 17, 2009********************}
 try
  //if(form1.speedbutton1.Enabled=true)then
  //begin
    if (listframe.Count>0) then
    begin
      //bolehzooming:=true;
      new(item);
      item:=listframe.Items[prevanimcount];

      if((prevanimcount>=listframe.Count-1)and(prevanimcursor>=item.ImagePointer.Count-1)) then
         //or(form1.trackbar1.Position>=form1.trackbar1.Max))then
      begin
        //form1.richedit1.Lines.Clear;
        AnimCount:=0;
        counter:=0;
        prevanimcount:=0;
        prevanimcursor:=0;
        //form1.trackbar1.Position:=0;
      end;

      {***************play audio - Update on March 18, 2009**************************}
      new(sounditem);
      sounditem:=listframe.Items[0];
      if (sounditem.ImageSound.Count > 0) then
      begin
        form2.mediaplayer1.FileName:= sounditem.ImageSound.Strings[0] + sounditem.ImageSound.Strings[1];
        if (mediaplayer1pos = 0) then
        begin
          form2.mediaplayer1.Open;
        end;
        //mediaplayer1.Play;
        zoomtimer2.Enabled:=true;
      end;
  {***************************************************}
      animstatus:=true;
      ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Open Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
      zoomtimer1.Enabled:=true;
    end;
  //end;
 except
 end;
end;

procedure TFlash.zoomTimer1Timer(Sender: TObject);
var
  previtem,animateitem:listofimage;
  animcursor,prevpointer:listofpointer;
  temp:listofimage;
  temppoint:Tpoint;
begin
   {*********************************update on March 17, 2009*****************************************}
   try
   prevAnimCount:=animcount;
   prevAnimCursor:=counter;

   if ((listframe<>nil)and(listframe.Count > 0))then
   begin
     new(animateitem);
     animateitem:=listframe.Items[animcount];
     {*****************************************************************}
     if ((counter=0)and(animateitem.ImageText.Count>0)) then
        //and (fileexists(extractfilepath(paramstr(0))+'ImageText.rtf')))then
     begin
       sleep(300);
       //animateitem.ImageText.SaveToFile(extractfilepath(paramstr(0))+'ImageText.rtf');
       //Richedit1.Lines.LoadFromFile(extractfilepath(paramstr(0))+'ImageText.rtf');
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
         //if(bolehzooming=false)then
         //begin
         //  previewku.AnimationExecute(invalRect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
         //end else
         {************************************************************}
         //if(bolehzooming=true)then
         //begin
           previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,temp,animateitem,0,counter);
         //end;
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
               {if(bolehzooming=false)then
               begin
                  previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
               end else
               {************************************************************}
               {if(bolehzooming=true)then
               begin }
                 previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,nextItem,counter,counter);
               //end;
               {************************************************************}
             end else
             begin
               {if(bolehzooming=false)then
               begin
                 previewku.AnimationExecute(invalrect,invalcur,false,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
               end else
               {************************************************************}
               {if(bolehzooming=true)then
               begin  }
                 previewku.ZoomAnimationExecute(invalRect,invalcur,false,flash.PaintBox1,flash.image1,animateitem,nextItem,counter,counter);
               //end;
               {************************************************************}
             end;
             counter:=0;
             animcount:=animcount+1;

           end;
         end else
         begin
           ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Stop Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
           zoomtimer1.Enabled:=false;
           zoomtimer2.Enabled:=false;

           setresolution(PrevX,PrevY);
           mediaplayer1pos :=0;
           counter:=0;
           animcount:=0;
           flash.Close;
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
           {if(bolehzooming=false)then
           begin
             previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
           end else
           {************************************************************}
           {if(bolehzooming=true)then
           begin }
             previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,temp,animateitem,0,counter);
           //end;
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
                 {if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
                 end else
                 {************************************************************}
                 {if(bolehzooming=true)then
                 begin }
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,animateitem,counter-1,counter);
                 //end;
                 {************************************************************}
                 {if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
                 end else
                 {************************************************************}
                 {if(bolehzooming=true)then
                 begin  }
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,nextItem,counter,counter);
                 //end;
                 {************************************************************}
               end else
               begin
                 {if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter-1,counter);
                 end else
                 {************************************************************}
                 {if(bolehzooming=true)then
                 begin  }
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,nextItem,counter-1,counter);
                 //end;
                 {************************************************************}
               end;
               counter:=0;
               animcount:=animcount+1;

             end;
           end else
           begin
             {if(bolehzooming=false)then
             begin
               previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
             end else
             {************************************************************}
             {if(bolehzooming=true)then
             begin }
               previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,animateitem,counter-1,counter);
             //end;
             {************************************************************}
             ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Stop Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
             zoomtimer1.Enabled:=false;
             zoomtimer2.Enabled:=false;

             setresolution(PrevX,PrevY);

             mediaplayer1pos :=0;
             counter:=0;
             animcount:=0;
             flash.Close;
           end;
         end else
         begin
           {if(bolehzooming=false)then
           begin
             previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
           end else
           {************************************************************}
           {if(bolehzooming=true)then
           begin   }
             previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,animateitem,counter-1,counter);
           //end;
           {************************************************************}
           counter:=counter+1;

         end;
       end else
       begin
         ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Stop Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
         zoomtimer1.Enabled:=false;
         zoomtimer2.Enabled:=false;
         setresolution(PrevX,PrevY);

         mediaplayer1pos :=0;
         counter:=0;
         animcount:=0;
         flash.Close;
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
         {if(bolehzooming=false)then
         begin
           previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
         end else
         {************************************************************}
         {if(bolehzooming=true)then
         begin   }
           previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,temp,animateitem,0,counter);
         //end;
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
               {if(bolehzooming=false)then
               begin
                 previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
               end else
               {************************************************************}
               {if(bolehzooming=true)then
               begin }
                 previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,nextItem,counter,counter);
               //end;
               {************************************************************}
             end else
             begin
               {if(bolehzooming=false)then
               begin
                 previewku.AnimationExecute(invalrect,invalcur,false,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
               end else
               {************************************************************}
               {if(bolehzooming=true)then
               begin }
                 previewku.ZoomAnimationExecute(invalRect,invalcur,false,flash.PaintBox1,flash.image1,animateitem,nextItem,counter,counter);
               //end;
               {************************************************************}
             end;
             counter:=0;
             animcount:=animcount+1;

           end;
         end else
         begin
           ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Stop Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
           zoomtimer1.Enabled:=false;
           zoomtimer2.Enabled:=false;
           setresolution(PrevX,PrevY);

           mediaplayer1pos :=0;
           counter:=0;
           animcount:=0;
           flash.Close;
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
           {if(bolehzooming=false)then
           begin
             previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,temp,animateitem,0,counter);
           end else
           {************************************************************}
           {if(bolehzooming=true)then
           begin }
              previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,temp,animateitem,0,counter);
           //end;
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
                 {if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
                 end else
                 {************************************************************}
                 {if(bolehzooming=true)then
                 begin  }
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,animateitem,counter-1,counter);
                 //end;
                 {************************************************************}
                 {if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter,counter);
                 end else
                 {************************************************************}
                 {if(bolehzooming=true)then
                 begin  }
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,nextItem,counter,counter);
                 //end;
                 {************************************************************}
               end else
               begin
                 {if(bolehzooming=false)then
                 begin
                   previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,nextItem,counter-1,counter);
                 end else
                 {************************************************************}
                 {if(bolehzooming=true)then
                 begin    }
                   previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,nextItem,counter-1,counter);
                 //end;
                 {************************************************************}
               end;
               counter:=0;
               animcount:=animcount+1;

             end;
           end else
           begin
             {if(bolehzooming=false)then
             begin
               previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
             end else
             {************************************************************}
             {if(bolehzooming=true)then
             begin }
               previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,animateitem,counter-1,counter);
             //end;
             {************************************************************}
             ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Stop Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
             zoomtimer1.Enabled:=false;
             zoomtimer2.Enabled:=false;
             setresolution(PrevX,PrevY);

             mediaplayer1pos :=0;
             counter:=0;
             animcount:=0;
             flash.Close;
           end;
         end else
         begin
           {if(bolehzooming=false)then
           begin
             previewku.AnimationExecute(invalrect,invalcur,true,rect1,rect2,paintbox1,paintbox2,image1,animateitem,animateitem,counter-1,counter);
           end else
           {************************************************************}
           {if(bolehzooming=true)then
           begin }
             previewku.ZoomAnimationExecute(invalRect,invalcur,true,flash.PaintBox1,flash.image1,animateitem,animateitem,counter-1,counter);
           //end;
           {************************************************************}
           counter:=counter+1;

         end;
       end else
       begin
         ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Stop Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
         zoomtimer1.Enabled:=false;
         zoomtimer2.Enabled:=false;
         setresolution(PrevX,PrevY);

         mediaplayer1pos :=0;
         counter:=0;
         animcount:=0;
         flash.Close;
       end;
     end else
     begin
       ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Stop Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
       zoomtimer1.Enabled:=false;
       zoomtimer2.Enabled:=false;

       setresolution(PrevX,PrevY);
       mediaplayer1pos :=0;
       counter:=0;
       animcount:=0;
       flash.Close;
     end;
   end else
   begin
     ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Stop Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
     zoomtimer1.Enabled:=false;
     zoomtimer2.Enabled:=false;

     setresolution(PrevX,PrevY);
     mediaplayer1pos :=0;
     counter:=0;
     animcount:=0;
     flash.Close;
   end;

   {***************************************}
   //trackbar1.Position:=trackbar1.Position+1;
   {***************************************}
 //  trackbar1.Position:=previewku.SearchPosition(posarray,prevanimcount,prevanimcursor);
 //  checkallownextPrev(prevanimcount,prevanimcursor,listframe);
 except
   showmessage('Your Scenario is not valid');
   application.Terminate;
 end;
end;

procedure TFlash.zoomTimer2Timer(Sender: TObject);
begin
  form2.mediaplayer1.Play;
  mediaplayer1pos :=form2.mediaplayer1.Position;
end;

procedure TFlash.FormClose(Sender: TObject; var Action: TCloseAction);
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
   if (form2.mediaplayer1.Mode = mpOpen) or (form2.mediaplayer1.Mode = mpPlaying) then
   begin
     form2.mediaplayer1.Position:=0;
     mediaplayer1pos := form2.mediaplayer1.Position;
     zoomtimer2.Enabled:=false;
   end;

    //trackbar1.Position:=0;
    prevanimcount:=0;
    prevanimcursor:=0;
    animcount:=0;
    counter:=0;
    image1.Picture:=nil;
    //image2.Picture:=nil;
    zoomtimer1.Enabled:=false;
    //timer2.Enabled:=false;
    mainform.Edit1.Text:= filepath;
    mainform.Edit2.Text:=filesound;
end;

end.

