object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 553
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 464
    Top = 19
    Width = 90
    Height = 48
    Caption = 'Zettel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Old English Text MT'
    Font.Style = []
    ParentFont = False
  end
  object myMemo: TMemo
    Left = 8
    Top = 16
    Width = 337
    Height = 497
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object btnZuKasse: TButton
    Left = 552
    Top = 488
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Zur Kasse'
    TabOrder = 1
    OnClick = btnZuKasseClick
  end
  object btnZeigZetel: TButton
    Left = 384
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Zeig Zettel'
    TabOrder = 2
    OnClick = btnZeigZetelClick
  end
  object btnClrZettel: TButton
    Left = 384
    Top = 488
    Width = 75
    Height = 25
    Caption = 'Clear Zettel'
    TabOrder = 3
    OnClick = btnClrZettelClick
  end
end
