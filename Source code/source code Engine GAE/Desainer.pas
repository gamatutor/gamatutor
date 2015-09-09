unit Desainer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Menus, StdCtrls, ComCtrls, ImgList, ActnList,
  ToolWin,ClipBrd,Buttons,primitif,jpeg, OleCtnrs, ExtDlgs;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    Panel3: TPanel;
    Panel4: TPanel;
    DrawGrid1: TDrawGrid;
    Image1: TImage;
    PaintBox3: TPaintBox;
    StandardToolBar: TToolBar;
    FontName: TComboBox;
    ToolButton11: TToolButton;
    FontSize: TEdit;
    UpDown1: TUpDown;
    ToolButton2: TToolButton;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    BulletsButton: TToolButton;
    ActionList1: TActionList;
    FileNewCmd: TAction;
    FileOpenCmd: TAction;
    FileSaveCmd: TAction;
    FilePrintCmd: TAction;
    FileExitCmd: TAction;
    FileSaveAsCmd: TAction;
    ActionList2: TActionList;
    EditUndoCmd: TAction;
    EditCutCmd: TAction;
    EditCopyCmd: TAction;
    EditPasteCmd: TAction;
    EditFontCmd: TAction;
    ToolbarImages: TImageList;
    FontDialog1: TFontDialog;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    StatusBar: TStatusBar;
    Editor: TRichEdit;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    N1: TMenuItem;
    FilePrintItem: TMenuItem;
    N4: TMenuItem;
    FileExitItem: TMenuItem;
    EditMenu: TMenuItem;
    LanguageMenu: TMenuItem;
    HelpMenu: TMenuItem;
    HelpAboutItem: TMenuItem;
    Ruler: TPanel;
    FirstInd: TLabel;
    LeftInd: TLabel;
    RulerLine: TBevel;
    Bevel1: TBevel;
    RightInd: TLabel;
    PopupMenu1: TPopupMenu;
    Undo1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Font1: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    PopupMenu2: TPopupMenu;
    LoadFromClipBoard1: TMenuItem;
    LoadFromFile1: TMenuItem;
    SpeedButton1: TSpeedButton;
    Copy2: TMenuItem;
    Paste2: TMenuItem;
    N7: TMenuItem;
    SpeedButton2: TSpeedButton;
    Delete1: TMenuItem;
    estAnimation1: TMenuItem;
    OleContainer1: TOleContainer;
    Image2: TImage;
    Image3: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    PopupMenu3: TPopupMenu;
    LoadFromClipboard2: TMenuItem;
    LoadFromFile2: TMenuItem;
    N2: TMenuItem;
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    SpeedButton3: TSpeedButton;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    ConverttoFlash1: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FileNewItemClick(Sender: TObject);
    procedure FileOpenItemClick(Sender: TObject);
    procedure FileSaveItemClick(Sender: TObject);
    procedure FileSaveAsItemClick(Sender: TObject);
    procedure FilePrintItemClick(Sender: TObject);
    procedure FileExitItemClick(Sender: TObject);
    procedure EditUndoItemClick(Sender: TObject);
    procedure EditCutItemClick(Sender: TObject);
    procedure miEditFontClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure CenterAlignClick(Sender: TObject);
    procedure RightAlignClick(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure RulerResize(Sender: TObject);
    procedure EditorChange(Sender: TObject);
    procedure EditorSelectionChange(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure SelectionChange(Sender: TObject);
    procedure RichEditChange(Sender: TObject);
    procedure FirstIndMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure ActionList2Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure HelpAboutItemClick(Sender: TObject);
    procedure estAnimation1Click(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Demos1Click(Sender: TObject);
    procedure Configuration1Click(Sender: TObject);
    procedure LoadFromFile1Click(Sender: TObject);
    procedure DrawGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LoadFromClipBoard1Click(Sender: TObject);
    procedure EditFontCmdExecute(Sender: TObject);
    procedure LoadFromFile2Click(Sender: TObject);
    procedure PaintBox3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox3Paint(Sender: TObject);
    procedure PaintBox3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure LoadFromClipboard2Click(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DrawGrid1TopLeftChanged(Sender: TObject);
    procedure DrawGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Copy2Click(Sender: TObject);
    procedure Paste2Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ScreenRecording1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure When1Click(Sender: TObject);
    procedure OnlywithPrintScreenKeypressed1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LanguageMenuClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EditMenuClick(Sender: TObject);
    procedure HelpMenuClick(Sender: TObject);
    procedure ConverttoFlash1Click(Sender: TObject);
    //procedure PaintBox1Click(Sender: TObject);


  private
    { Private declarations }
    FFileName: string;
    FUpdating: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;
   {*****************************************************}
    FileAnimasi:textfile;
    AnimFileName,FileTemp:string;
    FileName:string;
    CopyPasteBMP:Tbitmap;
    EmptyImage1,EmptyImage2,EmptyImage3:boolean;
   {*****************************************************}
    function CurrText: TTextAttributes;
    procedure GetFontNames;
    procedure SetFileName(const FileName: String);
    procedure CheckFileSave;
    procedure SetupRuler;
    procedure SetEditRect;
    procedure UpdateCursorPos;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure PerformFileOpen(const AFileName: string);
    procedure SetModified(Value: Boolean);
    {***********primitif untuk editor animasi***************}
    Procedure SelectFrame(count:integer);
    procedure InitNewScenario(var count:integer;var ListScenario:Tlist);

  public
    { Public declarations }
  end;

{--------------------------------------additional routines------------------------------}
//procedure ScreenShot;
procedure GetResolution(var XRes, YRes: DWord);
procedure SetResolution(XRes, YRes: DWord);
function KeyboardHookProc(Code: Integer; WordParam: Word; LongParam: LongInt) : LongInt;stdcall;


{---------------------------------------------------------------------------------------}

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
var
  MainForm: TMainForm;
  ListFrame:TList;
  count:integer;
  ClassImage:image;

  fileop1:fileop;
  PointAwal,Titikmouse,mousePoint:TPoint;
  didalam,moving,moving2:boolean;
  BigRect,TrueRect:Trect;
  ClassPointer:MousePointer;
  FileMouse:string;
  movingpointer,itemPointer2,ItemUpdate:ListofPointer;
  itemDelete:ListofImage;
  posisiDelete:integer;
  savefile:boolean;
  IsPreview:boolean;
  PrevX,PrevY:cardinal;


implementation



uses richedit,ShellAPI,reabout,Preview,pointerMouse,config,DelUpdatePointer,screenrecord,
  ConverttoFlash;

resourcestring
  sSaveChanges = 'Save changes to %s?';
  sOverWrite = 'OK to overwrite %s';
  sUntitled = 'Untitled';
  sModified = 'Modified';
  sColRowInfo = 'Line: %3d   Col: %3d';

const
  RulerAdj = 4/3;
  GutterWid = 6;

{$R *.dfm}


{--------------------------------------additional routines------------------------------}
{procedure ScreenShot;
var
  ScreenDC: HDC;
  ScreenHandle: HWnd;
begin
  try
      ScreenHandle := GetDeskTopWindow;
      ScreenDC := GetDC(ScreenHandle);
  finally
        ReleaseDC(ScreenHandle, ScreenDC)
  end ;
end;  }

(********************updated on November 1, 2008*********)
procedure GetResolution(var XRes, YRes: DWord);
var
   lpDevMode : TDeviceMode;
begin
     EnumDisplaySettings(nil, 0, lpDevMode);

     lpDevMode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
     XRes:=lpDevMode.dmPelsWidth;
     YRes:=lpDevMode.dmPelsHeight;
end;
(*********************************************************)
procedure SetResolution(XRes, YRes: DWord);
var
   lpDevMode : TDeviceMode;
begin
     EnumDisplaySettings(nil, 0, lpDevMode);

     lpDevMode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
     lpDevMode.dmPelsWidth := XRes;
     lpDevMode.dmPelsHeight := YRes;

     ChangeDisplaySettings(lpDevMode, 0);
end;

{----------------keyboard and mouse processing-------------------------}

function KeyboardHookProc(Code: Integer; WordParam: Word; LongParam: LongInt) : LongInt;stdcall;

var
  item:ListOfImage;
  myrect1,myrect2:Trect;
  tempbitmap:Tbitmap;
  MyPointer:ListOfPointer;

 //  ScreenDC: HDC;
 //  ScreenHandle: HWnd;

begin
 case WordParam of
  VK_ESCAPE: {erase battle ship's path}
   begin
       mainform.WindowState:=wsmaximized;
   end;

  {vk_Left:
   begin
   end;  }

 end; {case}


 if WordParam = VK_SNAPSHOT then
 begin
   //ScreenShot;

  savefile:=false;

  {--------------------------------------------------------------------------------}
  try
    new(item);
    item.ImageName:= inttostr(count);

    item.ImageText:=tstringlist.Create;

    classImage.CreateBMP(item.ImageFile);
    myrect1.Left:=0;
    myrect1.Top:=0;
    myrect1.Right:=800;
    myrect1.Bottom:=600;


    {-------------------------------------------------------------}

    {ScreenHandle := GetDeskTopWindow;
    ScreenDC := GetDC(ScreenHandle); }


    tempbitmap:=Tbitmap.Create;
    tempbitmap.Assign(clipboard);
    {  try
          tempbitmap.Width := Screen.Width;
          tempbitmap.Height := Screen.Height;

          BitBlt(tempbitmap.Canvas.Handle, 0, 0,
              Screen.Width, Screen.Height, ScreenDC, 0, 0, SRCCOPY);
          Clipboard.Assign(tempbitmap);

          //tempbitmap.Free ;

      finally
        ReleaseDC(ScreenHandle, ScreenDC);
      end;    }

    {--------------------------------------------------------------}

    myrect2.Left:=0;
    myrect2.Top:=0;
    myrect2.Right:=tempbitmap.Width;
    myrect2.Bottom:=tempbitmap.Height;
    item^.ImageFile.Canvas.CopyRect(myrect1,tempbitmap.Canvas,myrect2);

    item^.ImagePointer:=Tlist.Create;

    listframe.Insert(count,item);
   {------------------------------------------------------------------------------}
   item:=listframe.Items[count];
   mainform.image2.Picture:=nil;
   mainform.image1.Picture.Assign(item.ImageFile);

   EmptyImage2:=false;
   EmptyImage1:=false;
   if (count = 0) then
   begin
     new(item);
     item:=listframe.Items[count];
     if (item.ImagePointer.Count=0)then
     begin
       PointAwal.X:=0;
       PointAwal.Y:=0;
     end else
     begin
       new(MyPointer);
       MyPointer:=item^.ImagePointer.First;
       PointAwal.X:=(MyPointer.RectSize.Left+MyPointer.RectSize.Right)div 8;
       PointAwal.Y:=(MyPointer.RectSize.Top+MyPointer.RectSize.Bottom)div 8;
     end;
   end else
   begin
     new(item);
     item:=listFrame.Items[count-1];
     {********************************************************}
     if (item.ImagePointer.Count=0)then
     begin
       PointAwal.X:=0;
       PointAwal.Y:=0;
     end else
     begin
       new(MyPointer);
       MyPointer:=item^.ImagePointer.Last;
       PointAwal.X:=(MyPointer.RectSize.Left+MyPointer.RectSize.Right)div 8;
       PointAwal.Y:=(MyPointer.RectSize.Top+MyPointer.RectSize.Bottom)div 8;
     end;
     {********************************************************}

   end;
  except
    showmessage('You Have no Screen Capture !'+char(13)+
                'Please Press Print Screen Key');
  end;
   {-----------------------------------------------------------------------------------}
   // count:=count+1;

 end;


 Result:=0;

{To prevent Windows from passing the keystrokes
 to the target window, the Result value must
 be a nonzero value.}
end;

{---------------------------------------------------------------------------------------}



{****************Deklarasi Privat untuk Editor Teks********************}

procedure TMainForm.CheckFileSave;
var
  SaveResp: Integer;

begin
  if not Editor.Modified then Exit;
 { if (listframe.count=0)then Exit;
  //SaveResp := MessageDlg(Format(sSaveChanges, [FFileName]),
  //mtConfirmation, mbYesNoCancel, 0);
  SaveResp := MessageDlg(Format(sSaveChanges, [FileTemp]),
  mtConfirmation, mbYesNoCancel, 0);
  case SaveResp of
    idYes: FileSaveItemClick(Self);
    idNo: {Nothing};
  {  idCancel: Abort;
  end;}
end;

function TMainForm.CurrText: TTextAttributes;
begin
  if Editor.SelLength > 0 then Result := Editor.SelAttributes
  else Result := Editor.DefAttributes;
end;

procedure TMainForm.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TMainForm.PerformFileOpen(const AFileName: string);
begin
if (fileexists(AfileName))then
begin
//  Editor.Lines.LoadFromFile(AFileName);
  SetFileName(AFileName);
  Editor.SetFocus;
  Editor.Modified := False;
  SetModified(False);
end;
end;

procedure TMainForm.SetEditRect;
var
  R: TRect;
begin
  with Editor do
  begin
    R := Rect(GutterWid, 0, ClientWidth-GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;
end;

procedure TMainForm.SetFileName(const FileName: String);
var
  temp:string;
begin
  FFileName := FileName;
  if (FileName=sUntitled)then
  begin
    FileTemp:=FileName;
  end else
  begin
    fileop1.ExtractFile(FileName,temp);
    FileTemp:=temp+'.ANM';
  end;
  //FFileName := FileName;
  //Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
  Caption := Format('%s - %s', [ExtractFileName(FileTemp), uppercase(Application.Title)]);
end;

procedure TMainForm.SetModified(Value: Boolean);
begin
  if Value then StatusBar.Panels[1].Text := sModified
  else StatusBar.Panels[1].Text := '';
end;

procedure TMainForm.SetupRuler;
var
  I: Integer;
  S: String;
begin
  SetLength(S, 201);
  I := 1;
  while I < 200 do
  begin
    S[I] := #9;
    S[I+1] := '|';
    Inc(I, 2);
  end;
  Ruler.Caption := S;
end;

procedure TMainForm.UpdateCursorPos;
var
  CharPos: TPoint;
begin
  CharPos.Y := SendMessage(Editor.Handle, EM_EXLINEFROMCHAR, 0,
    Editor.SelStart);
  CharPos.X := (Editor.SelStart -
    SendMessage(Editor.Handle, EM_LINEINDEX, CharPos.Y, 0));
  Inc(CharPos.Y);
  Inc(CharPos.X);
  StatusBar.Panels[0].Text := Format(sColRowInfo, [CharPos.Y, CharPos.X]);
end;

procedure TMainForm.WMDropFiles(var Msg: TWMDropFiles);
var
  CFileName: array[0..MAX_PATH] of Char;
begin
  try
    if DragQueryFile(Msg.Drop, 0, CFileName, MAX_PATH) > 0 then
    begin
      CheckFileSave;
      PerformFileOpen(CFileName);
      Msg.Result := 0;
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;
{**********************************************************************}

{****************************Fungsi untuk Editor Teks******************}

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;
{****************Fungsi Privat untuk Editor Animasi********************}

Procedure TMainForm.SelectFrame(count:integer);
var
  item,item2,sounditem:listofimage;
  RectAwal:Trect;

begin
  if(listframe.Count<>0)then
  begin
    new(item);
    item:=listframe.Items[count];

    {*************************update May 23, 2008****************}
    new(sounditem);
    sounditem:=listframe.Items[0];

     if (sounditem.ImageSound.Count > 0) then
     begin
       edit1.Text:= sounditem.ImageSound.Strings[0];
       edit2.Text:= sounditem.ImageSound.Strings[1];
     end else
     begin
       edit1.Text:= '';
       edit2.Text:= '';
     end;
    {****************************************************}

    image2.Picture:=nil;
    image1.Picture.Assign(item.ImageFile);
    EmptyImage2:=false;
    EmptyImage1:=false;

    if ((item.ImageText<>nil)and
        (fileexists(extractfilepath(paramstr(0))+'ImageText.rtf')))then
    begin
      item.ImageText.SaveToFile(extractfilepath(paramstr(0))+'ImageText.rtf');
      Editor.Lines.LoadFromFile(extractfilepath(paramstr(0))+'ImageText.rtf');
    end;

    if ((count+1)=listframe.Count) then
    begin
      ClassImage.ImageStatus(extractfilepath(paramstr(0))+'image\EmptyImage.JPG',EmptyImage3,image3);
     // showmessage('ada isinya');
    end else
    begin
      new(item2);
      item2:=listframe.Items[count+1];
   // image3.Picture.Assign(item2.ImageFile);
      image3.Picture:=nil;
      EmptyImage3:=false;
    end;
  end else
  begin
    ClassImage.ImageStatus(extractfilepath(paramstr(0))+'image\EmptyImage.JPG',EmptyImage1,image1);
    ClassImage.ImageStatus(extractfilepath(paramstr(0))+'image\EmptyImage.JPG',EmptyImage2,image2);
    ClassImage.ImageStatus(extractfilepath(paramstr(0))+'image\EmptyImage.JPG',EmptyImage3,image3);
    statusbar1.Panels.Items[2].Text:='';
    RectAwal:=drawgrid1.CellRect(0,0);
    drawgrid1.Canvas.Rectangle(RectAwal);
  end;
end;

{*************************Inisialisasi Editor Animasi*********************}
procedure Tmainform.InitNewScenario(var count:integer;var ListScenario:Tlist);
var
  RectAwal:TRect;
  B:integer;
  item:ListofImage;
begin
 if (listscenario<>nil)then
 begin
   //listscenario.Clear;
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
 ListScenario:=Tlist.Create;
 count:=0;
 ClassImage.ImageStatus(extractfilepath(paramstr(0))+'image\EmptyImage.JPG',EmptyImage1,image1);
 ClassImage.ImageStatus(extractfilepath(paramstr(0))+'image\EmptyImage.JPG',EmptyImage2,image2);
 ClassImage.ImageStatus(extractfilepath(paramstr(0))+'image\EmptyImage.JPG',EmptyImage3,image3);
 if(EmptyImage2)and(EmptyImage3)then
 begin
   speedbutton1.Enabled:=false;
   speedbutton2.Enabled:=false;
 end;
  drawgrid1.ColCount:=0;
  statusbar1.Panels.Items[2].Text:='';
  RectAwal:=drawgrid1.CellRect(0,0);
  drawgrid1.Canvas.Rectangle(RectAwal);
end;
{********************Deklarasi Publik untuk Editor Teks****************}
procedure TMainForm.ShowHint(Sender: TObject);
begin
  if Length(Application.Hint) > 0 then
  begin
    StatusBar.SimplePanel := True;
    StatusBar.SimpleText := Application.Hint;
  end
  else StatusBar.SimplePanel := False;
end;

procedure TMainForm.SelectionChange(Sender: TObject);
begin
  with Editor.Paragraph do
  try
    FUpdating := True;
    FirstInd.Left := Trunc(FirstIndent*RulerAdj)-4+GutterWid;
    LeftInd.Left := Trunc((LeftIndent+FirstIndent)*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((RightIndent+GutterWid)*RulerAdj);
    BoldButton.Down := fsBold in Editor.SelAttributes.Style;
    ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
    BulletsButton.Down := Boolean(Numbering);
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.Text := Editor.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
    UpdateCursorPos;
  finally
    FUpdating := False;
  end;
end;

procedure TMainForm.RichEditChange(Sender: TObject);
begin
  SetModified(Editor.Modified);
end;

{**********************************************************************}
procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  SaveResp: Integer;
begin
  try
   // CheckFileSave;
    if (listframe.count=0)then Exit;
    if (savefile=true)then Exit;
    SaveResp := MessageDlg(Format(sSaveChanges, [FileTemp]),
    mtConfirmation, mbYesNoCancel, 0);
    case SaveResp of
      idYes: FileSaveItemClick(Self);
      idNo: {Nothing};
      idCancel: Abort;
    end;

  except
    CanClose := False;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);

begin

 {------------------hook the keyboard--------------------}

   { KBHook:=SetWindowsHookEx(WH_KEYBOARD,
           @KeyboardHookProc,
                          HInstance,
                          GetCurrentThreadId()) ;  }

 {------------------------------------------------------}


  savefile:=true;
{*************Inisialisasi Editor Teks*******************}
  Application.OnHint := ShowHint;
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  SetFileName(sUntitled);
  GetFontNames;
  SetupRuler;

  SelectionChange(Self);

  CurrText.Name := DefFontData.Name;
  CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);

  fontname.Text:='MS Sans Serif';

{**************Inisialisasi Editor Animasi***************}


 ListFrame:=Tlist.Create;
 count:=0;
 ClassImage.ImageStatus(extractfilepath(paramstr(0))+'image\EmptyImage.JPG',EmptyImage1,image1);
 ClassImage.ImageStatus(extractfilepath(paramstr(0))+'image\EmptyImage.JPG',EmptyImage2,image2);
 ClassImage.ImageStatus(extractfilepath(paramstr(0))+'image\EmptyImage.JPG',EmptyImage3,image3);
 if(EmptyImage2)and(EmptyImage3)then
 begin
   speedbutton1.Enabled:=false;
   speedbutton2.Enabled:=false;
 end;
 openpicturedialog1.InitialDir:=extractfilepath(paramstr(0));
 {****************inisialisasi BMP untuk copy paste*******************}
 CopyPasteBMP:=Tbitmap.Create;
 {********************************************************************}
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
    SetEditRect;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  SetEditRect;
  SelectionChange(Sender);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin



  UpdateCursorPos;
  DragAcceptFiles(Handle, True);
  RichEditChange(nil);
  Editor.SetFocus;
  { Check if we should load a file from the command line }
  if (ParamCount > 0) and FileExists(ParamStr(1)) then
    PerformFileOpen(ParamStr(1));

   
end;

procedure TMainForm.FileNewItemClick(Sender: TObject);
begin
  savefile:=true;
  SetFileName(sUntitled);
  Editor.Lines.Clear;
  Editor.Modified := False;
  SetModified(False);
  InitNewScenario(count,listframe);
end;

procedure TMainForm.FileOpenItemClick(Sender: TObject);
begin
  savefile:=true;
  progressbar1.Min:=0;
  progressbar1.Max:=100;
  progressbar1.Position:=0;
  CheckFileSave;
  if OpenDialog.Execute then
  begin
    
  {**************************open animation file*******************}

    fileop1.OpenFileAnimasi(progressbar1,opendialog.FileName,listframe);
    count:=0;
    selectframe(count);
  {*************************open text file***********************}
    fileop1.ExtractFile(opendialog.FileName,Filename);

    PerformFileOpen(FileName+'.ANM');
    Editor.ReadOnly := ofReadOnly in OpenDialog.Options;

  end;
end;

procedure TMainForm.FileSaveItemClick(Sender: TObject);
begin
  if FFileName = sUntitled then
    FileSaveAsItemClick(Sender)
  else
  begin
    savefile:=true;
    {*************Save animation file*******************}
    fileop1.SaveToFileAnimasi(FileTemp,Listframe);
    {***************Save text file**********************}
 //   Editor.Lines.SaveToFile(FFileName);
    Editor.Modified := False;
    SetModified(False);
  end;

end;

procedure TMainForm.FileSaveAsItemClick(Sender: TObject);

begin

  if SaveDialog.Execute then
  begin
    savefile:=true;
    {*************Save animation file*******************}

    {***************Save text file**********************}
    fileop1.ExtractFile(savedialog.FileName,Filename);


    if FileExists(Filename+'.ANM') then
      if MessageDlg(Format(sOverWrite, [Filename+'.ANM']),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    {******************************************}

//   Editor.Lines.SaveToFile(Filename+'.rtf');

    fileop1.SaveToFileAnimasi(savedialog.FileName,Listframe);
    SetFileName(Filename+'.ANM');
    Editor.Modified := False;
    SetModified(False);
  end;
end;

procedure TMainForm.FilePrintItemClick(Sender: TObject);
begin
    if PrintDialog.Execute then
    begin
    //  fileop1.ExtractFile(ffilename,printfile);
      Editor.Print(ffilename);
    end;
end;

procedure TMainForm.FileExitItemClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.EditUndoItemClick(Sender: TObject);
begin
    with Editor do
      if HandleAllocated then
      begin
        SendMessage(Handle, EM_UNDO, 0, 0);
      end;
end;

procedure TMainForm.EditCutItemClick(Sender: TObject);
begin
   Editor.CutToClipboard;
end;

procedure TMainForm.miEditFontClick(Sender: TObject);
begin
  FontDialog1.Font.Assign(Editor.SelAttributes);
  if FontDialog1.Execute then
    CurrText.Assign(FontDialog1.Font);
  SelectionChange(Self);
  Editor.SetFocus;
end;

procedure TMainForm.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Name := FontName.Items[FontName.ItemIndex];
end;

procedure TMainForm.FontSizeChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

procedure TMainForm.BoldButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if BoldButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TMainForm.ItalicButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if ItalicButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TMainForm.UnderlineButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if UnderlineButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TMainForm.LeftAlignClick(Sender: TObject);
begin
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TMainForm.CenterAlignClick(Sender: TObject);
begin
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TMainForm.RightAlignClick(Sender: TObject);
begin
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TMainForm.BulletsButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  Editor.Paragraph.Numbering := TNumberingStyle(BulletsButton.Down);
end;

procedure TMainForm.RulerResize(Sender: TObject);
begin
    RulerLine.Width := Ruler.ClientWidth - (RulerLine.Left*2);
end;

procedure TMainForm.EditorChange(Sender: TObject);

begin
   SetModified(Editor.Modified);
end;

procedure TMainForm.EditorSelectionChange(Sender: TObject);
begin
  with Editor.Paragraph do
  try
    FUpdating := True;
    FirstInd.Left := Trunc(FirstIndent*RulerAdj)-4+GutterWid;
    LeftInd.Left := Trunc((LeftIndent+FirstIndent)*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((RightIndent+GutterWid)*RulerAdj);
    BoldButton.Down := fsBold in Editor.SelAttributes.Style;
    ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
    BulletsButton.Down := Boolean(Numbering);
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.Text := Editor.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
    UpdateCursorPos;
  finally
    FUpdating := False;
  end;
end;

procedure TMainForm.FirstIndMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TMainForm.FirstIndMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   if FDragging then
    TLabel(Sender).Left :=  TLabel(Sender).Left+X-FDragOfs
end;

procedure TMainForm.FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TMainForm.LeftIndMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TMainForm.LeftIndMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   if FDragging then
    TLabel(Sender).Left :=  TLabel(Sender).Left+X-FDragOfs
end;

procedure TMainForm.LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Editor.Paragraph.FirstIndent;
  SelectionChange(Sender);
end;

procedure TMainForm.RightIndMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TMainForm.RightIndMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if FDragging then
    TLabel(Sender).Left :=  TLabel(Sender).Left+X-FDragOfs
end;

procedure TMainForm.RightIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
  SelectionChange(Sender);
end;

procedure TMainForm.Cut1Click(Sender: TObject);
begin
   Editor.CutToClipboard;
end;

procedure TMainForm.Copy1Click(Sender: TObject);
begin
   Editor.CopyToClipboard;
  
end;

procedure TMainForm.Paste1Click(Sender: TObject);
begin
    Editor.PasteFromClipboard;
end;

procedure TMainForm.Font1Click(Sender: TObject);
begin
  FontDialog1.Font.Assign(Editor.SelAttributes);
  if FontDialog1.Execute then
    CurrText.Assign(FontDialog1.Font);
  SelectionChange(Self);
  Editor.SetFocus;
end;

procedure TMainForm.ActionList2Update(Action: TBasicAction;
  var Handled: Boolean);
begin
{ Update the status of the edit commands }
  EditCutCmd.Enabled := Editor.SelLength > 0;
  EditCopyCmd.Enabled := EditCutCmd.Enabled;
  if Editor.HandleAllocated then
  begin
    EditUndoCmd.Enabled := Editor.Perform(EM_CANUNDO, 0, 0) <> 0;
    EditPasteCmd.Enabled := Editor.Perform(EM_CANPASTE, 0, 0) <> 0;
  end;
 
end;



procedure TMainForm.HelpAboutItemClick(Sender: TObject);
begin
  {with TAboutBox.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;}
end;

procedure TMainForm.estAnimation1Click(Sender: TObject);
begin
   form2.Show;
end;

procedure TMainForm.PaintBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  found:boolean;
  item:listofImage;
  TempPoint:TPoint;
  posisike:integer;
  innerrect:Trect;
begin
 if (EmptyImage2=false)then
 begin
  new(item);
  item:=listframe.Items[count];

  TempPoint:=ClassPointer.PointScreenToList(truerect,x,y);
  ClassPointer.SearchTitik(temppoint.X,temppoint.Y,item.ImagePointer,posisike,found);
 // ClassPointer.SearchTitik(X,Y,item.ImagePointer,posisike,found);
  if (found=false) then
  begin
    if (ssLeft in shift) then
    begin
      form1.Left:=x;
      form1.Top:=42+y;
      form1.Show;
      titikmouse.x:=x;
      titikmouse.y:=y;
    end;
  end else
  begin
    if (ssDouble in shift)then
    begin
      form4.Left:=x;
      form4.Top:=42+y;
      form4.Show;
      new(ItemUpdate);
      ItemUpdate:=item.imagepointer.items[posisike];

      posisiDelete:=posisiKe;
      new(itemdelete);
      itemdelete:=item;
    end else
    if (ssleft in shift) then
    begin
      moving:=true;
      new(MovingPointer);
      MovingPointer:=item.ImagePointer.Items[posisike];
      movingpointer.RectSize:=truerect;
      TempPoint:=ClassPointer.PointScreenToList(truerect,x,y);
      movingPointer.PointerFirstPos.X:=TempPoint.X;
      movingpointer.PointerFirstPos.Y:=TempPoint.Y;
      if (itempointer2<>nil) then
      begin
        paintbox2.Refresh;

        {***********************************************}
        InnerRect:=classpointer.createRect(mousepoint.X,mousepoint.y);
        if (classimage.IsInnerBidang(innerrect.TopLeft,itempointer2.RectSize))
          and(classimage.IsInnerBidang(innerrect.BottomRight,itempointer2.RectSize))then
        begin
         itemPointer2.PointerSecondPos:=MousePoint;
        end else
        begin
         if ((mousepoint.X=-999)and(mousepoint.Y=-999))then
         begin
           itemPointer2.PointerSecondPos:=mousepoint;
         end else
         begin
           itemPointer2.PointerSecondPos:=itempointer2.PointerFirstPos;
         end;
        end;
      end;
     { edit1.Text:= inttostr(movingpointer.RectSize.left);
      edit2.Text:= inttostr(movingpointer.RectSize.Right);
      edit3.Text:= inttostr(movingpointer.RectSize.top);
      edit4.Text:= inttostr(movingpointer.RectSize.bottom);
     }
    end;
  end;
  paintbox3.Refresh;
 end;
 //form4.Show;
end;

procedure TMainForm.PaintBox2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  TempX:integer;
  item:listofimage;
  screenpoint:TPoint;
  RectMouse,rect,InnerRect:TRect;
begin
 if (emptyimage3=false)then
 begin
  savefile:=false;
  if (ssleft in shift) then
  begin
    new(item);
    item:=listframe.Items[count];
    if item.ImagePointer.Count=0 then
    begin
      showmessage('You Have No Cursor Object on Previous Image !');
    end else
    begin
      new(itempointer2);
      itempointer2:=item.ImagePointer.Last;

      MousePoint:=classPointer.PointScreenToList(truerect,x,y);

      RectMouse.Left:=itemPointer2.PointerSecondPos.X;
      RectMouse.Top:=itemPointer2.PointerSecondPos.Y;
      RectMouse.Right:=RectMouse.Left+25;
      RectMouse.Bottom:=RectMouse.Top+25;

      InnerRect:=classPointer.createRect(mousepoint.X,mousepoint.y);

      if (ClassImage.IsInnerBidang(MousePoint,RectMouse))then
      begin
        moving2:=true;

        if (classimage.IsInnerBidang(innerrect.TopLeft,itempointer2.RectSize))
            and(classimage.IsInnerBidang(innerrect.BottomRight,itempointer2.RectSize))then
        begin
          itemPointer2.PointerSecondPos:=MousePoint;
        end else
        begin
         if ((mousepoint.X=-999)and(mousepoint.Y=-999))then
         begin
           itemPointer2.PointerSecondPos:=mousepoint;
         end else
         begin
           itemPointer2.PointerSecondPos:=itempointer2.PointerFirstPos;
         end;
        end;

      end else
      begin
        //if classimage.IsInnerBidang(mousepoint,itempointer2.RectSize)then
        if (classimage.IsInnerBidang(innerrect.TopLeft,itempointer2.RectSize))
            and(classimage.IsInnerBidang(innerrect.BottomRight,itempointer2.RectSize))then
        begin
          itemPointer2.PointerSecondPos:=MousePoint;
        end else
        begin
         if ((mousepoint.X=-999)and(mousepoint.Y=-999))then
         begin
           itemPointer2.PointerSecondPos:=mousepoint;
         end else
         begin
           itemPointer2.PointerSecondPos:=itempointer2.PointerFirstPos;
         end;
        end;
      end;
      paintbox2.Refresh;

      {*******************************************************}
      //point2.x:=x;
      //point2.y:=y;
    end;
  end;
 end;
 if (ssright in shift) then
 begin
   if (EmptyImage2=true)then
   begin
     paintbox2.PopupMenu:=nil;
   end else
   begin
     paintbox2.PopupMenu:=popupmenu3;
   end;
 end;
 //form4.Show;
end;

procedure TMainForm.Demos1Click(Sender: TObject);
var
  settingfile:textfile;
  settingfilename,s:string;
begin
  SettingFileName:=extractfilepath(paramstr(0))+'SettingEditor.txt';
  Assignfile(SettingFile,SettingFileName);
  reset(SettingFile);
  readln(Settingfile,s);
  closefile(settingfile);

  olecontainer1.CreateObjectFromFile(s,true);
  olecontainer1.DoVerb(0);
end;

procedure TMainForm.Configuration1Click(Sender: TObject);
begin
   //form3.show;
end;

procedure TMainForm.LoadFromFile1Click(Sender: TObject);
var
  item:ListOfImage;
  //Myrect:listofrect;
  MyPointer:ListOfPointer;
  Myrect1,myrect2:Trect;
  tempbitmap:TBitmap;
  ext:string;
  tempjpg:Tjpegimage;
begin
  try
    if(openpicturedialog1.Execute)then
    begin
     savefile:=false;
     ext:=extractfileext(openpicturedialog1.FileName);
     if(emptyimage2=true)then
     begin
      new(item);
      item.ImageName:= inttostr(count);

      item.ImageText:=tstringlist.Create;
      {****************update April 10, 2008****************}
      item.ImageSound:=tstringlist.Create;

      classImage.CreateBMP(item^.ImageFile);
      myrect1.Left:=0;
      myrect1.Top:=0;
      myrect1.Right:=800;
      myrect1.Bottom:=600;
      tempbitmap:=Tbitmap.Create;
      if ((ext='.jpg')or(ext='.jpeg'))then
      begin
        tempjpg:=Tjpegimage.Create;
        tempjpg.LoadFromFile(openpicturedialog1.FileName);
        tempbitmap.Assign(tempjpg);
      end else
      if(ext='.bmp')then
      begin
        tempbitmap.LoadFromFile(openpicturedialog1.FileName);
      end;
      myrect2.Left:=0;
      myrect2.Top:=0;
      myrect2.Right:=tempbitmap.Width;
      myrect2.Bottom:=tempbitmap.Height;

      item.ImageFile.Canvas.CopyRect(myrect1,tempbitmap.Canvas,myrect2);

    //  item.ImageFile.Assign(tempbitmap);
      item.ImagePointer:=Tlist.Create;
      {*********************************************}
      listframe.Insert(count,item);
     end else
     begin
       item:=listframe.Items[count];
       myrect1.Left:=0;
       myrect1.Top:=0;
       myrect1.Right:=800;
       myrect1.Bottom:=600;

       tempbitmap:=Tbitmap.Create;
       if ((ext='.jpg')or(ext='.jpeg'))then
       begin
         tempjpg:=Tjpegimage.Create;
         tempjpg.LoadFromFile(openpicturedialog1.FileName);
         tempbitmap.Assign(tempjpg);
       end else
       if(ext='.bmp')then
       begin
         tempbitmap.LoadFromFile(openpicturedialog1.FileName);
       end;

       myrect2.Left:=0;
       myrect2.Top:=0;
       myrect2.Right:=tempbitmap.Width;
       myrect2.Bottom:=tempbitmap.Height;


       item.ImageFile.Canvas.CopyRect(myrect1,tempbitmap.Canvas,myrect2);

       //item.ImageFile.Assign(clipboard);
     end;

     item:=listframe.Items[count];
     image2.Picture:=nil;
     image1.Picture.Assign(item.ImageFile);
     EmptyImage2:=false;
     EmptyImage1:=false;
     if (count = 0) then
     begin
      new(item);
      item:=listframe.Items[count];
      if (item.ImagePointer.Count=0)then
      begin
        PointAwal.X:=0;
        PointAwal.Y:=0;
      end else
      begin
        new(MyPointer);
        MyPointer:=item^.ImagePointer.First;
        PointAwal.X:=(MyPointer.RectSize.Left+MyPointer.RectSize.Right)div 8;
        PointAwal.Y:=(MyPointer.RectSize.Top+MyPointer.RectSize.Bottom)div 8;
      end;
     end else
     begin
      new(item);
      item:=listFrame.Items[count-1];
      {********************************************************}
      if (item.ImagePointer.Count=0)then
      begin
        PointAwal.X:=0;
        PointAwal.Y:=0;
      end else
      begin
        new(MyPointer);
        MyPointer:=item^.ImagePointer.Last;
        PointAwal.X:=(MyPointer.RectSize.Left+MyPointer.RectSize.Right)div 8;
        PointAwal.Y:=(MyPointer.RectSize.Top+MyPointer.RectSize.Bottom)div 8;
      end;
       {********************************************************}
     end;
     //tempbitmap.Free;
     //tempjpg.Free;
    end;
  except
  end;
end;

procedure TMainForm.DrawGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Acol,Arow:integer;
begin
    drawgrid1.MouseToCell(x,y,Acol,Arow);
   // showmessage(inttostr(Acol)+''+inttostr(Arow));
    if (acol >=0) then
    begin
      count:=acol;
      if (listframe.Count<>0) then
      begin
        selectframe(count);
      end;
    end;
end;

procedure TMainForm.LoadFromClipBoard1Click(Sender: TObject);
var
  item:ListOfImage;
  //Myrect:listofrect;
  MyPointer:ListOfPointer;
  Myrect1,myrect2:Trect;
  tempbitmap:TBitmap;
begin
  try
   savefile:=false;
   if(emptyimage2=true)then
   begin
    new(item);
    item.ImageName:= inttostr(count);

    item.ImageText:=tstringlist.Create;
    {****************update April 10, 2008****************}
    item.ImageSound:=tstringlist.Create;

    classImage.CreateBMP(item.ImageFile);
    myrect1.Left:=0;
    myrect1.Top:=0;
    myrect1.Right:=800;
    myrect1.Bottom:=600;

    tempbitmap:=Tbitmap.Create;

    if Clipboard.HasFormat(CF_BITMAP) then
    begin
      tempbitmap.Assign(clipboard);
    end;
    

    myrect2.Left:=0;
    myrect2.Top:=0;
    myrect2.Right:=tempbitmap.Width;
    myrect2.Bottom:=tempbitmap.Height;
    item^.ImageFile.Canvas.CopyRect(myrect1,tempbitmap.Canvas,myrect2);
   // item^.ImageFile.Assign(clipboard);
    item^.ImagePointer:=Tlist.Create;
   {*********************************************}
    listframe.Insert(count,item);
   end else
   begin
     item:=listframe.Items[count];
     myrect1.Left:=0;
     myrect1.Top:=0;
     myrect1.Right:=800;
     myrect1.Bottom:=600;


     tempbitmap:=Tbitmap.Create;
     
     if Clipboard.HasFormat(CF_BITMAP) then
     begin
       tempbitmap.Assign(clipboard);
     end;


     myrect2.Left:=0;
     myrect2.Top:=0;
     myrect2.Right:=tempbitmap.Width;
     myrect2.Bottom:=tempbitmap.Height;

     item^.ImageFile.Canvas.CopyRect(myrect1,tempbitmap.Canvas,myrect2);


     //item.ImageFile.Assign(clipboard);
   end;
   item:=listframe.Items[count];
   image2.Picture:=nil;
   image1.Picture.Assign(item.ImageFile);
   EmptyImage2:=false;
   EmptyImage1:=false;
   if (count = 0) then
   begin
     new(item);
     item:=listframe.Items[count];
     if (item.ImagePointer.Count=0)then
     begin
       PointAwal.X:=0;
       PointAwal.Y:=0;
     end else
     begin
       new(MyPointer);
       MyPointer:=item^.ImagePointer.First;
       PointAwal.X:=(MyPointer.RectSize.Left+MyPointer.RectSize.Right)div 8;
       PointAwal.Y:=(MyPointer.RectSize.Top+MyPointer.RectSize.Bottom)div 8;
     end;
   end else
   begin
     new(item);
     item:=listFrame.Items[count-1];
     {********************************************************}
     if (item.ImagePointer.Count=0)then
     begin
       PointAwal.X:=0;
       PointAwal.Y:=0;
     end else
     begin
       new(MyPointer);
       MyPointer:=item^.ImagePointer.Last;
       PointAwal.X:=(MyPointer.RectSize.Left+MyPointer.RectSize.Right)div 8;
       PointAwal.Y:=(MyPointer.RectSize.Top+MyPointer.RectSize.Bottom)div 8;
     end;
     {********************************************************}

   end;
   tempbitmap.Free;
  except
    showmessage('You Have no Screen Capture !'+char(13)+
                'Please Press Print Screen Key');
  end;
end;

procedure TMainForm.EditFontCmdExecute(Sender: TObject);
begin
  FontDialog1.Font.Assign(Editor.SelAttributes);
  if FontDialog1.Execute then
    CurrText.Assign(FontDialog1.Font);
  SelectionChange(Self);
  Editor.SetFocus;
end;

procedure TMainForm.LoadFromFile2Click(Sender: TObject);
var
  item:ListOfImage;
  myrect1,myrect2:Trect;
  tempbitmap:Tbitmap;
  MyPointer:ListOfPointer;
  ext:string;
  tempjpg:Tjpegimage;
begin
 try
  if(openpicturedialog1.Execute)then
  begin
   savefile:=false;
   ext:=extractfileext(openpicturedialog1.FileName);
   if(emptyimage3=true)then
   begin
    new(item);
    item.ImageName:= inttostr(count+1);
    item.ImageText:=tstringlist.Create;
    {****************update April 10, 2008****************}
    item.ImageSound:=tstringlist.Create;

    classImage.CreateBMP(item.ImageFile);
    myrect1.Left:=0;
    myrect1.Top:=0;
    myrect1.Right:=800;
    myrect1.Bottom:=600;

    tempbitmap:=Tbitmap.Create;
    if ((ext='.jpg')or(ext='.jpeg'))then
    begin
      tempjpg:=Tjpegimage.Create;
      tempjpg.LoadFromFile(openpicturedialog1.FileName);
      tempbitmap.Assign(tempjpg);
    end else
    if(ext='.bmp')then
    begin
      tempbitmap.LoadFromFile(openpicturedialog1.FileName);
    end;
    myrect2.Left:=0;
    myrect2.Top:=0;
    myrect2.Right:=tempbitmap.Width;
    myrect2.Bottom:=tempbitmap.Height;
    item^.ImageFile.Canvas.CopyRect(myrect1,tempbitmap.Canvas,myrect2);

    //item^.ImageFile.Assign(clipboard);
    item^.ImagePointer:=Tlist.Create;
    listframe.Insert(count+1,item);
   end else
   begin
     item:=listframe.Items[count+1];
     myrect1.Left:=0;
     myrect1.Top:=0;
     myrect1.Right:=800;
     myrect1.Bottom:=600;

     tempbitmap:=Tbitmap.Create;
     if ((ext='.jpg')or(ext='.jpeg'))then
     begin
       tempjpg:=Tjpegimage.Create;
       tempjpg.LoadFromFile(openpicturedialog1.FileName);
       tempbitmap.Assign(tempjpg);
     end else
     if(ext='.bmp')then
     begin
       tempbitmap.LoadFromFile(openpicturedialog1.FileName);
     end;

     myrect2.Left:=0;
     myrect2.Top:=0;
     myrect2.Right:=tempbitmap.Width;
     myrect2.Bottom:=tempbitmap.Height;
     item^.ImageFile.Canvas.CopyRect(myrect1,tempbitmap.Canvas,myrect2);
     //item.ImageFile.Assign(clipboard);
   end;
   item:=listframe.Items[count+1];
   image3.Picture:=nil;

   EmptyImage3:=false;

     new(item);
     item:=listFrame.Items[count];
     if item.ImagePointer.Count=0 then
     begin
       PointAwal.X:=0;
       PointAwal.Y:=0;
     end else
     begin
       new(MyPointer);
       MyPointer:=item^.ImagePointer.Last;
       PointAwal.X:=(MyPointer.RectSize.Left+MyPointer.RectSize.Right)div 8;
       PointAwal.Y:=(MyPointer.RectSize.Top+MyPointer.RectSize.Bottom)div 8;
     end;
    //tempbitmap.Free;
    //tempjpg.Free;
  end;
 except
 end;
end;

procedure TMainForm.PaintBox3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  awal:Tpoint;
begin
   if (EmptyImage1=False) then
   begin
     awal.X:=x;
     awal.Y:=y;
     didalam:=ClassImage.IsInnerBidang(awal,Bigrect);
   end;

end;

procedure TMainForm.PaintBox3Paint(Sender: TObject);
var
  PrevItem,item,item2:ListofImage;
  itempointer:listofPointer;
  i:integer;
  rect,myrect:Trect;
  ScreenPoint:Tpoint;
begin
 if (emptyImage1=false)then
  begin
   new(item);
   item:=listframe.Items[count];
   classimage.FocusImage(false,item,PoinTawal,BigRect,trueRect,paintbox1,paintbox3,item.ImageFile);
   {********tampilkan list of pointer***************}
   new(itemPointer);
   for i:=0 to item.ImagePointer.Count-1 do
   begin
     itemPointer:=item.ImagePointer.Items[i];

     ScreenPoint:=ClassPointer.PointListToScreen(trueRect,itempointer.PointerFirstPos.X,itempointer.PointerFirstPos.Y);
     classPointer.MousePointing(false,screenPoint.X,screenPoint.Y,i+1,rect,itempointer.PointerFile,paintbox1);
     classPointer.TextToRect(paintbox1,rect.Right,rect.Top,itempointer.PointerText,myrect);
   end;

   {********tampilkan list of pointer***************}
   if (emptyimage3=false)then
   begin
     {***********************************************}
     new(item2);
     item2:=listframe.Items[count+1];
     classimage.FocusImage(false,item,PoinTawal,BigRect,trueRect,paintbox2,paintbox3,item2.ImageFile);
     {***********************************************}
     new(previtem);
     Previtem:=listframe.Items[count];
     new(itemPointer);
     for i:=0 to Previtem.ImagePointer.Count-1 do
     begin
       itemPointer:=Previtem.ImagePointer.Items[i];
       if (itempointer.PointerSecondPos.x<>-999) and (itempointer.PointerSecondPos.y<>-999) then
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(trueRect,itempointer.PointerSecondPos.X,itempointer.PointerSecondPos.Y);
         classPointer.MousePointing(false,screenPoint.X,screenPoint.Y,i+1,rect,itempointer.PointerFile,paintbox2);
         classPointer.TextToRect(paintbox2,rect.Right,rect.Top,itempointer.PointerText,myrect);
       end;
     end;
   end;
 end;
end;

procedure TMainForm.PaintBox3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   if ((ssleft in shift)and(Didalam)) then
   begin
     paintbox3.Refresh;
     PointAwal.X:=x;
     PointAwal.Y:=y;
   end;
end;

procedure TMainForm.PaintBox3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   didalam:=false;
   PointAwal.x:=x;
   PointAwal.y:=y;
end;

procedure TMainForm.PaintBox1Paint(Sender: TObject);
var
  PrevItem,item,itemGambar:ListOfImage;
  itemPointer:ListOfPointer;
  i,xbawah,ybawah:integer;
  ScreenPoint:Tpoint;
  rect,RectDaftar,myrect:Trect;
begin
 {******************************************}
 if (listframe<>nil) then
 begin
   statusbar1.Panels.Items[1].Text:='Total Image in List = '+inttostr(listframe.Count);
   if (listframe.Count<>0)then
   begin
     statusbar1.Panels.Items[2].Text:='Image Index = '+inttostr(count+1);
   end;
 end;
 {******************************************}
 classImage.PaintBoxCheck(count,emptyImage2,emptyImage3,speedbutton2,speedbutton1);
 if (emptyImage2=false) then
 begin

   new(item);
   item:=listframe.Items[count];
   ClassImage.PermanentImage(BigRect,item.ImageFile,paintbox1);
  {*********************daftar gambar******************}
   drawgrid1.ColCount:=listframe.Count;
   new(itemGambar);
   for i:=0 to listframe.Count-1 do
   begin
    RectDaftar:=drawgrid1.CellRect(i,0);
    itemGambar:=listframe.Items[i];
    drawgrid1.canvas.StretchDraw(RectDaftar,itemGambar.ImageFile);
   end;

   {********tampilkan list of pointer***************}
   new(itemPointer);
   for i:=0 to item.ImagePointer.Count-1 do
   begin
     itemPointer:=item.ImagePointer.Items[i];

     ScreenPoint:=ClassPointer.PointListToScreen(trueRect,itempointer.PointerFirstPos.X,itempointer.PointerFirstPos.Y);
     classPointer.MousePointing(false,screenPoint.X,screenPoint.Y,i+1,rect,itempointer.PointerFile,paintbox1);
     classPointer.TextToRect(paintbox1,rect.Right,rect.Top,itempointer.PointerText,myrect);
   end;

   {********************tampilkan list of pointer di frame bawah***********************}
   new(itemPointer);
   for i:=0 to item.ImagePointer.Count-1 do
   begin
     itemPointer:=item.ImagePointer.Items[i];
     xbawah:= itempointer.PointerFirstPos.X div 4;
     ybawah:= itempointer.PointerFirstPos.Y div 4;
     classPointer.MousePointingM(false,xbawah,ybawah,i+1,paintbox3);
   end;
   {******************************************************************}

   {****************************************************}
   if(emptyimage3=false)then begin
     new(previtem);
     Previtem:=listframe.Items[count];
     new(itemPointer);
     for i:=0 to Previtem.ImagePointer.Count-1 do
     begin
       itemPointer:=Previtem.ImagePointer.Items[i];
       if (itempointer.PointerSecondPos.x<>-999) and (itempointer.PointerSecondPos.y<>-999) then
       begin
         ScreenPoint:=ClassPointer.PointListToScreen(trueRect,itempointer.PointerSecondPos.X,itempointer.PointerSecondPos.Y);
         classPointer.MousePointing(false,screenPoint.X,screenPoint.Y,i+1,rect,itempointer.PointerFile,paintbox2);
         classPointer.TextToRect(paintbox2,rect.Right,rect.Top,itempointer.PointerText,myrect);
       end;
     end;
   end;
  {********************************************************}
 end;
end;

procedure TMainForm.PaintBox2Paint(Sender: TObject);
var
  PrevItem,item,itemGambar:ListOfImage;
  itemPointer:ListOfPointer;
  i:integer;
  ScreenPoint:Tpoint;
  rect,RectDaftar,myrect:Trect;
begin
 {******************************************}
 if (listframe<>nil) then
 begin
   statusbar1.Panels.Items[1].Text:='Total Image in List = '+inttostr(listframe.Count);
   if (listframe.Count<>0)then
   begin
     statusbar1.Panels.Items[2].Text:='Image Index = '+inttostr(count+1);
   end;
 end;
 {******************************************}
 classImage.PaintBoxCheck(count,emptyImage2,emptyImage3,speedbutton2,speedbutton1);
 if (emptyImage3=false) then
 begin
   new(item);
   item:=listframe.Items[count+1];
   ClassImage.PermanentImage(BigRect,item.ImageFile,paintbox2);
  {*********************daftar gambar******************}
   drawgrid1.ColCount:=listframe.Count;
   new(itemGambar);
   for i:=0 to listframe.Count-1 do
   begin
    RectDaftar:=drawgrid1.CellRect(i,0);
    itemGambar:=listframe.Items[i];
    drawgrid1.canvas.StretchDraw(RectDaftar,itemGambar.ImageFile);
   end;

   {****************************************************}
   {********tampilkan list of pointer***************}
   new(previtem);
   Previtem:=listframe.Items[count];
   new(itemPointer);
   for i:=0 to Previtem.ImagePointer.Count-1 do
   begin
     itemPointer:=Previtem.ImagePointer.Items[i];
     if (itempointer.PointerSecondPos.x<>-999) and (itempointer.PointerSecondPos.y<>-999) then
     begin
       ScreenPoint:=ClassPointer.PointListToScreen(trueRect,itempointer.PointerSecondPos.X,itempointer.PointerSecondPos.Y);
       classPointer.MousePointing(false,screenPoint.X,screenPoint.Y,i+1,rect,itempointer.PointerFile,paintbox2);
       classPointer.TextToRect(paintbox2,rect.Right,rect.Top,itempointer.PointerText,myrect);
     end;
   end;
 end;

end;

procedure TMainForm.LoadFromClipboard2Click(Sender: TObject);
var
  item:ListOfImage;
  myrect1,myrect2:Trect;
  tempbitmap:Tbitmap;
  MyPointer:ListOfPointer;
begin
  try
   savefile:=false;
   if(emptyimage3=true)then
   begin
    new(item);
    item.ImageName:= inttostr(count+1);
    item.ImageText:=tstringlist.Create;
    {****************update April 10, 2008****************}
    item.ImageSound:=tstringlist.Create;

    classImage.CreateBMP(item^.ImageFile);
    myrect1.Left:=0;
    myrect1.Top:=0;
    myrect1.Right:=800;
    myrect1.Bottom:=600;

    tempbitmap:=Tbitmap.Create;
    
    if Clipboard.HasFormat(CF_BITMAP) then
    begin
       tempbitmap.Assign(clipboard);
    end;

    myrect2.Left:=0;
    myrect2.Top:=0;
    myrect2.Right:=tempbitmap.Width;
    myrect2.Bottom:=tempbitmap.Height;
    item^.ImageFile.Canvas.CopyRect(myrect1,tempbitmap.Canvas,myrect2);

    //item^.ImageFile.Assign(clipboard);
    item^.ImagePointer:=Tlist.Create;
    listframe.Insert(count+1,item);
   end else
   begin
     item:=listframe.Items[count+1];
     myrect1.Left:=0;
     myrect1.Top:=0;
     myrect1.Right:=800;
     myrect1.Bottom:=600;

     tempbitmap:=Tbitmap.Create;

     if Clipboard.HasFormat(CF_BITMAP) then
     begin
       tempbitmap.Assign(clipboard);
     end;

     myrect2.Left:=0;
     myrect2.Top:=0;
     myrect2.Right:=tempbitmap.Width;
     myrect2.Bottom:=tempbitmap.Height;
     item^.ImageFile.Canvas.CopyRect(myrect1,tempbitmap.Canvas,myrect2);
     //item.ImageFile.Assign(clipboard);
   end;
   item:=listframe.Items[count+1];
   image3.Picture:=nil;

   EmptyImage3:=false;

     new(item);
     item:=listFrame.Items[count];
     if item.ImagePointer.Count=0 then
     begin
       PointAwal.X:=0;
       PointAwal.Y:=0;
     end else
     begin
       new(MyPointer);
       MyPointer:=item^.ImagePointer.Last;
       PointAwal.X:=(MyPointer.RectSize.Left+MyPointer.RectSize.Right)div 8;
       PointAwal.Y:=(MyPointer.RectSize.Top+MyPointer.RectSize.Bottom)div 8;
     end;
     
     tempbitmap.Free;
  //end;
  except
    showmessage('You Have no Screen Capture !'+char(13)+
                'Please Press Print Screen Key');
  end;
 // showmessage(inttostr(count));
end;

procedure TMainForm.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  temppoint:Tpoint;
  innerrect:Trect;
begin
   if ((ssleft in shift)and(moving=true)) then
   begin
     savefile:=false;
     paintbox1.Refresh;
     movingpointer.RectSize:=truerect;
     TempPoint:=ClassPointer.PointScreenToList(truerect,x,y);
     movingPointer.PointerFirstPos.X:=TempPoint.X;
     movingpointer.PointerFirstPos.Y:=TempPoint.Y;
     if (itempointer2<>nil) then
     begin
       paintbox2.Refresh;

       {***********************************************}

       InnerRect:=classpointer.createRect(mousepoint.X,mousepoint.y);
       if (classimage.IsInnerBidang(innerrect.TopLeft,itempointer2.RectSize))
          and(classimage.IsInnerBidang(innerrect.BottomRight,itempointer2.RectSize))then
       begin
         itemPointer2.PointerSecondPos:=MousePoint;
       end else
       begin
         if ((mousepoint.X=-999)and(mousepoint.Y=-999))then
         begin
           itemPointer2.PointerSecondPos:=mousepoint;
         end else
         begin
           itemPointer2.PointerSecondPos:=itempointer2.PointerFirstPos;
         end;
       end;

     end;

    { edit1.Text:= inttostr(movingpointer.RectSize.left);
     edit2.Text:= inttostr(movingpointer.RectSize.Right);
     edit3.Text:= inttostr(movingpointer.RectSize.top);
     edit4.Text:= inttostr(movingpointer.RectSize.bottom); }
     paintbox3.Refresh;
   end;
end;

procedure TMainForm.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  tempPoint:TPoint;
  innerrect:Trect;
begin
 if (moving=true)then
 begin
   savefile:=false;
   moving:=false;
   movingpointer.RectSize:=truerect;
   TempPoint:=ClassPointer.PointScreenToList(truerect,x,y);
   movingPointer.PointerFirstPos.X:=TempPoint.X;
   movingpointer.PointerFirstPos.Y:=TempPoint.Y;

   if (itempointer2<>nil) then
   begin
     paintbox2.Refresh;

     {***********************************************}

     InnerRect:=classpointer.createRect(mousepoint.X,mousepoint.y);
     if (classimage.IsInnerBidang(innerrect.TopLeft,itempointer2.RectSize))
         and(classimage.IsInnerBidang(innerrect.BottomRight,itempointer2.RectSize))then
     begin
       itemPointer2.PointerSecondPos:=MousePoint;
     end else
     begin
       if ((mousepoint.X=-999)and(mousepoint.Y=-999))then
       begin
         itemPointer2.PointerSecondPos:=mousepoint;
       end else
       begin
         itemPointer2.PointerSecondPos:=itempointer2.PointerFirstPos;
       end;
    end;

   end;

 {  edit1.Text:= inttostr(movingpointer.RectSize.left);
   edit2.Text:= inttostr(moving|ointer.^ectSize.Right);
   edit3.Text:= inttostr(movingpointer.RectSize.top);
   edit4.Text:= inttostr(movingpointer.RectSize.bottom);  }
   paintbox3.Refresh;
 end;
end;

procedure TMainForm.PaintBox2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  innerrect:Trect;

begin

   if ((ssleft in shift)and(moving2=true)) then
   begin
     savefile:=false;
     paintbox2.Refresh;

     {***********************************************}
     MousePoint:=ClassPointer.PointScreenToList(truerect,x,y);

     InnerRect:=classpointer.createRect(mousepoint.X,mousepoint.y);
     if (classimage.IsInnerBidang(innerrect.TopLeft,itempointer2.RectSize))
         and(classimage.IsInnerBidang(innerrect.BottomRight,itempointer2.RectSize))then
     begin
       itemPointer2.PointerSecondPos:=MousePoint;
     end else
     begin
       if ((mousepoint.X=-999)and(mousepoint.Y=-999))then
       begin
         itemPointer2.PointerSecondPos:=mousepoint;
       end else
       begin
         itemPointer2.PointerSecondPos:=itempointer2.PointerFirstPos;
       end;
     end;

   end;
end;

procedure TMainForm.PaintBox2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  prevpointlist:Tpoint;
  innerrect:Trect;
begin

 if (moving2=true)then
 begin
   savefile:=false;
   moving2:=false;
   MousePoint:=ClassPointer.PointScreenToList(truerect,x,y);
   InnerRect:=classpointer.createRect(mousepoint.X,mousepoint.y);
   if (classimage.IsInnerBidang(innerrect.TopLeft,itempointer2.RectSize))
         and(classimage.IsInnerBidang(innerrect.BottomRight,itempointer2.RectSize))then
   begin
     itemPointer2.PointerSecondPos:=MousePoint;
   end else
   begin
     showmessage('Please Move Your Cursor close enough'+char(13)+
                 'from Last Cursor on Previous Image !');

     if ((mousepoint.X=-999)and(mousepoint.Y=-999))then
     begin
       itemPointer2.PointerSecondPos:=mousepoint;
     end else
     begin
       itemPointer2.PointerSecondPos:=itempointer2.PointerFirstPos;
     end;
   end;

 end;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
  item:listofimage;
begin
  new(item);
  item:=listframe.Items[count];
  if fileexists(extractfilepath(paramstr(0))+'ImageText.rtf')then
  begin
    Editor.Lines.SaveToFile(extractfilepath(paramstr(0))+'ImageText.rtf');
    item.ImageText.LoadFromFile(extractfilepath(paramstr(0))+'ImageText.rtf');
  end;
  editor.Lines.Clear;
  count:=count+1;
  selectFrame(count);
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
var
  item:listofimage;
begin
  new(item);
  item:=listframe.Items[count];
  if fileexists(extractfilepath(paramstr(0))+'ImageText.rtf')then
  begin
    Editor.Lines.SaveToFile(extractfilepath(paramstr(0))+'ImageText.rtf');
    item.ImageText.LoadFromFile(extractfilepath(paramstr(0))+'ImageText.rtf');
  end;
  editor.Lines.Clear;
  count:=count-1;
  selectFrame(count);
end;

procedure TMainForm.DrawGrid1TopLeftChanged(Sender: TObject);
var
  itemgambar:listofimage;
  i:integer;
  RectDaftar:TRect;
begin
  {*********************daftar gambar******************}
   drawgrid1.ColCount:=listframe.Count;
   new(itemGambar);
   for i:=0 to listframe.Count-1 do
   begin
    RectDaftar:=drawgrid1.CellRect(i,0);
    itemGambar:=listframe.Items[i];
    drawgrid1.canvas.StretchDraw(RectDaftar,itemGambar.ImageFile);
   end;
   {***************************************************}
end;

procedure TMainForm.DrawGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  itemgambar:listofimage;
  i:integer;
  RectDaftar:TRect;
begin
  {*********************daftar gambar******************}
   drawgrid1.ColCount:=listframe.Count;
   new(itemGambar);
   for i:=0 to listframe.Count-1 do
   begin
    RectDaftar:=drawgrid1.CellRect(i,0);
    itemGambar:=listframe.Items[i];
    drawgrid1.canvas.StretchDraw(RectDaftar,itemGambar.ImageFile);
   end;
   {***************************************************}
end;

procedure TMainForm.Copy2Click(Sender: TObject);
var
  item:ListofImage;
begin
  if (emptyimage2=false)then
  begin
   new(item);
   item:=listframe.Items[count];
   copypasteBMP.Assign(item.ImageFile);
  end;
end;

procedure TMainForm.Paste2Click(Sender: TObject);
var
  item:ListofImage;
begin
  if (emptyimage2=false) then
  begin
   new(item);
   item:=listframe.Items[count];
   item.ImageFile.Assign(copypasteBMP);
   selectframe(count);
  end;
end;

procedure TMainForm.Delete1Click(Sender: TObject);
var
  item,itemrefresh:listofimage;
  itempointer:listofpointer;
  i:integer;
begin
   if ((listframe<>nil)and(listframe.Count<>0))then
   begin
     savefile:=false;
     if(count<>listframe.Count-1)then
     begin
       if(count>0)then
       begin
         new(item);
         item:=listframe.Items[count-1];

         if(item.ImagePointer.Count>0)then
         begin
           new(itempointer);
           itempointer:=item.ImagePointer.Last;
           itempointer.PointerSecondPos.X:=-999;
           itempointer.PointerSecondPos.Y:=-999;
         end;
       end;
       listframe.Delete(count);
       selectFrame(count);
     end else
     begin
       if(count>0)then
       begin
         new(item);
         item:=listframe.Items[count-1];

         if(item.ImagePointer.Count>0)then
         begin
           new(itempointer);
           itempointer:=item^.ImagePointer.Last;
           itempointer.PointerSecondPos.X:=-999;
           itempointer.PointerSecondPos.Y:=-999;
         end;
       end;

       listframe.Delete(count);
       count:=count-1;
       if (count<0)then
       begin
         count:=0;
       end;
       selectFrame(count);
     end;
     mousepoint.X:=-999;
     mousepoint.Y:=-999;

     {**************Refresh List Skenario****************}
     new(itemrefresh);
     for i:=0 to listframe.Count-1 do
     begin
       itemrefresh:=listframe.Items[i];
       itemrefresh.ImageName:=inttostr(i);
     end;
     {***************************************************}
   end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
 B:integer;
 item:listofimage;
begin
  {if (listframe<>nil) then
  begin
    ListFrame.Clear;
  end;  }

  if (listframe<>nil) then
  begin
      //Listscenario.Clear;
      {********update March 02,2008****************************}
    Try
      for B := 0 to (listframe.Count - 1) do
      begin
        item := listframe.Items[B];
        item.ImageFile.Free;
        Dispose(item);
      end;
    finally
      listframe.Free;
    end;
  end;

 { classimage.SetResolution(1024,768);  }

end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
var
  item:listofimage;
begin
  if(listframe.Count>0)then
  begin
    new(item);
    item:=listframe.Items[count];
    if fileexists(extractfilepath(paramstr(0))+'ImageText.rtf')then
    begin
      Editor.Lines.SaveToFile(extractfilepath(paramstr(0))+'ImageText.rtf');
      item.ImageText.LoadFromFile(extractfilepath(paramstr(0))+'ImageText.rtf');
    end;
  end;
end;

procedure TMainForm.ScreenRecording1Click(Sender: TObject);
begin
   form5.Show;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  { classimage.SetResolution(800,600);  }
end;



procedure TMainForm.FormDestroy(Sender: TObject);
begin
{--------------------unhook keyboard-----------------}

 {unhook the keyboard interception}
 { UnHookWindowsHookEx(KBHook) ;    }
{----------------------------------------------------}
end;

procedure TMainForm.When1Click(Sender: TObject);
begin
   mainform.WindowState:=wsminimized;
end;

procedure TMainForm.OnlywithPrintScreenKeypressed1Click(Sender: TObject);
begin
    mainform.WindowState:=wsminimized;
end;

procedure TMainForm.Button1Click(Sender: TObject);
var

  item:ListOfImage;
  myrect1,myrect2:Trect;
  tempbitmap:Tbitmap;
  MyPointer:ListOfPointer;

  ScreenDC: HDC;
  ScreenHandle: HWnd;

begin

 //ScreenShot;

  {--------------------------------------------------------------------------------}
  try
    new(item);
    item.ImageName:= inttostr(count);

    item.ImageText:=tstringlist.Create;

    classImage.CreateBMP(item.ImageFile);
    myrect1.Left:=0;
    myrect1.Top:=0;
    myrect1.Right:=800;
    myrect1.Bottom:=600;


    {-------------------------------------------------------------}

    ScreenHandle := GetDeskTopWindow;
    ScreenDC := GetDC(ScreenHandle);


    tempbitmap:=Tbitmap.Create;
    //tempbitmap.Assign(clipboard);
    //clipboard.assign(tempbitmap);
      try
          tempbitmap.Width := Screen.Width;
          tempbitmap.Height := Screen.Height;

          BitBlt(tempbitmap.Canvas.Handle, 0, 0,
              Screen.Width, Screen.Height, ScreenDC, 0, 0, SRCCOPY);
          Clipboard.Assign(tempbitmap);

          //tempbitmap.Free ;

      finally
        ReleaseDC(ScreenHandle, ScreenDC);
      end; 

    {--------------------------------------------------------------}

    myrect2.Left:=0;
    myrect2.Top:=0;
    myrect2.Right:=tempbitmap.Width;
    myrect2.Bottom:=tempbitmap.Height;
    item^.ImageFile.Canvas.CopyRect(myrect1,tempbitmap.Canvas,myrect2);

    item^.ImagePointer:=Tlist.Create;

    listframe.Insert(count,item);
   {------------------------------------------------------------------------------}
   item:=listframe.Items[count];
   mainform.image2.Picture:=nil;
   mainform.image1.Picture.Assign(item.ImageFile);

   EmptyImage2:=false;
   EmptyImage1:=false;
   if (count = 0) then
   begin
     new(item);
     item:=listframe.Items[count];
     if (item.ImagePointer.Count=0)then
     begin
       PointAwal.X:=0;
       PointAwal.Y:=0;
     end else
     begin
       new(MyPointer);
       MyPointer:=item^.ImagePointer.First;
       PointAwal.X:=(MyPointer.RectSize.Left+MyPointer.RectSize.Right)div 8;
       PointAwal.Y:=(MyPointer.RectSize.Top+MyPointer.RectSize.Bottom)div 8;
     end;
   end else
   begin
     new(item);
     item:=listFrame.Items[count-1];
     {********************************************************}
     if (item.ImagePointer.Count=0)then
     begin
       PointAwal.X:=0;
       PointAwal.Y:=0;
     end else
     begin
       new(MyPointer);
       MyPointer:=item^.ImagePointer.Last;
       PointAwal.X:=(MyPointer.RectSize.Left+MyPointer.RectSize.Right)div 8;
       PointAwal.Y:=(MyPointer.RectSize.Top+MyPointer.RectSize.Bottom)div 8;
     end;
     {********************************************************}

   end;
  except
    showmessage('You Have no Screen Capture !'+char(13)+
                'Please Press Print Screen Key');
  end;
   {-----------------------------------------------------------------------------------}
 //count:=count+1;



 //Result:=0;


end;

procedure TMainForm.LanguageMenuClick(Sender: TObject);

begin
   // ShellExecute(Self.Handle,nil, 'C:\Program Files\Audacity\audacity.exe', nil, nil, SW_SHOWNORMAL);

   //ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\audacity record automation.exe'), nil, nil, SW_SHOWNORMAL);
   form2.Caption:= 'Record Sound';
   isPreview:=false;
   form2.Show;

end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
var
  item:listofimage;
begin
  if (listframe <> nil) and (listframe.Count > 0) then
  begin
    if opendialog1.Execute then
    begin
      new(item);
      //item:=listframe.Items[count];
      item:=listframe.Items[0];
      item.ImageSound := tstringlist.Create;
      item.ImageSound.Add(extractfilepath(opendialog1.FileName));
      item.ImageSound.Add(extractfilename(opendialog1.FileName));
      edit1.Text:= item.ImageSound.Strings[0];
      edit1.Hint:=edit1.Text;
      edit2.Text:= item.ImageSound.Strings[1];
      edit2.Hint:=edit2.Text;
    end;
  end;

end;

procedure TMainForm.BitBtn2Click(Sender: TObject);
var
  item:listofimage;
  B : integer;
  
begin
  if (listframe <> nil) and (listframe.Count > 0) then
  begin
    new(item);
    //item:=listframe.Items[count];
    item:=listframe.Items[0];

    if (item.ImageSound<>nil)and(item.ImageSound.Count > 0) then
    begin
    {********update April 10,2008****************************}
    {  for B := 0 to (item.ImageSound.Count - 1) do
      begin
        item.ImageSound.Strings[B]:= '';
      end;   }
    {***********************************************************}
      item.ImageSound.Delete(1);
      item.ImageSound.Delete(0);
      if (item.ImageSound.Count = 0) then
      begin
        edit1.Text:= '';
        edit1.Hint:=edit1.Text;
        edit2.Text:= '';
        edit2.Hint:=edit2.Text;
      end;
    end;
  end;
end;


procedure TMainForm.EditMenuClick(Sender: TObject);
begin
   form2.Caption:= 'Preview Animation';
   isPreview:=true;
   form2.Show;
end;

procedure TMainForm.HelpMenuClick(Sender: TObject);
begin
  with TAboutBox.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.ConverttoFlash1Click(Sender: TObject);
begin
  //getresolution(PrevX,PrevY);
  //ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\Open Camstudio.exe'), nil, nil, SW_SHOWMINIMIZED);
  if ((listframe <> Nil) and (listframe.Count > 0)) then
  begin
    setresolution(800,600);
    flash.Show;
  end;
end;

end.





