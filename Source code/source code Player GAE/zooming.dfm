object Form5: TForm5
  Left = 247
  Top = 129
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Zoom'
  ClientHeight = 534
  ClientWidth = 790
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 800
    Height = 600
  end
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 800
    Height = 600
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    OnClick = PaintBox1Click
    OnPaint = PaintBox1Paint
  end
end
