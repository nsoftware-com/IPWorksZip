object FormCreatesevenzip: TFormCreatesevenzip
  Left = 192
  Top = 107
  BorderStyle = bsSingle
  Caption = 'Create SevenZip Demo'
  ClientHeight = 380
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 705
    Height = 13
    Caption = 
      'This demo allows you to create a .7z file. Select the files you ' +
      'would like to zip in the listview, set the filename and password' +
      ' (optional), and click "Zip!".'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object label2: TLabel
    Left = 8
    Top = 40
    Width = 77
    Height = 13
    Caption = 'Local Directory: '
  end
  object Label3: TLabel
    Left = 8
    Top = 320
    Width = 63
    Height = 13
    Caption = 'Archive Files:'
  end
  object Label4: TLabel
    Left = 472
    Top = 319
    Width = 49
    Height = 13
    Caption = 'Password:'
  end
  object lblDirectory: TLabel
    Left = 96
    Top = 40
    Width = 10
    Height = 13
    Caption = 'C:'
  end
  object btnOpenFolder: TButton
    Left = 616
    Top = 32
    Width = 89
    Height = 25
    Caption = 'Browse ...'
    TabOrder = 0
    OnClick = btnOpenFolderClick
  end
  object lstLocalFiles: TListView
    Left = 8
    Top = 64
    Width = 697
    Height = 249
    Columns = <
      item
        Caption = 'FileName'
        Width = 300
      end
      item
        Caption = 'Size'
        Width = 200
      end
      item
        Caption = 'Date'
        Width = 150
      end>
    MultiSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object txtArchiveFile: TEdit
    Left = 80
    Top = 320
    Width = 153
    Height = 21
    TabOrder = 2
    Text = 'test.7z'
  end
  object btnSaveFile: TButton
    Left = 240
    Top = 320
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = btnSaveFileClick
  end
  object txtPassword: TEdit
    Left = 528
    Top = 319
    Width = 105
    Height = 21
    PasswordChar = '*'
    TabOrder = 4
  end
  object btnZip: TButton
    Left = 648
    Top = 320
    Width = 57
    Height = 25
    Caption = 'Zip!'
    TabOrder = 5
    OnClick = btnZipClick
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 352
    Width = 697
    Height = 17
    TabOrder = 6
  end
  object SaveDialog1: TSaveDialog
    Left = 272
    Top = 320
  end
  object SevenZip1: TipzSevenZip
    OnProgress = SevenZip1Progress
    Left = 520
    Top = 32
  end
end


