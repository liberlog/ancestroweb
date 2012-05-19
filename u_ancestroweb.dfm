object F_AncestroWeb: TF_AncestroWeb
  Left = 291
  Top = 302
  ActiveControl = PCPrincipal
  BorderIcons = []
  Caption = 'AncestroWeb :'#160'G'#233'n'#233'rer un Site Web G'#233'n'#233'alogique Statique'
  ClientHeight = 396
  ClientWidth = 640
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object spSkinPanel1: TPanel
    Left = 0
    Top = 366
    Width = 640
    Height = 30
    Align = alBottom
    TabOrder = 0
    object pb_ProgressInd: TFlatGauge
      Left = 144
      Top = 1
      Width = 144
      Height = 28
      AdvColorBorder = 0
      ColorBorder = 8623776
      Progress = 25
      Align = alLeft
    end
    object pb_ProgressAll: TFlatGauge
      Left = 1
      Top = 1
      Width = 143
      Height = 28
      AdvColorBorder = 0
      ColorBorder = 8623776
      Progress = 25
      Align = alLeft
    end
    object lb_Comments: TLabel
      Left = 296
      Top = 10
      Width = 3
      Height = 13
      Color = clBtnFace
      ParentColor = False
    end
    object FWClose1: TFWClose
      Left = 534
      Top = 2
      Width = 98
      Height = 26
      Caption = 'Fermer'
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object PCPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 640
    Height = 366
    ActivePage = ts_Gen
    Align = alClient
    TabOrder = 1
    OnChange = PCPrincipalChange
    object ts_Gen: TTabSheet
      Caption = 'G'#233'n'#233'rer'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 338
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 275
          Top = 0
          Width = 1
          Height = 338
          ExplicitHeight = 340
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 275
          Height = 338
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            275
            338)
          object Label1: TLabel
            Left = 3
            Top = 80
            Width = 215
            Height = 13
            Caption = 'R'#233'pertoire du site web g'#233'n'#233'alogique '#224' cr'#233'er :'
            Color = clBtnFace
            ParentColor = False
          end
          object Label7: TLabel
            Left = 8
            Top = 133
            Width = 39
            Height = 13
            Caption = 'Th'#232'me :'
            Color = clBtnFace
            ParentColor = False
          end
          object Label9: TLabel
            Left = 8
            Top = 197
            Width = 53
            Height = 13
            Caption = 'GEDCOM :'
            Color = clBtnFace
            ParentColor = False
          end
          object Label44: TLabel
            Left = 9
            Top = 163
            Width = 45
            Height = 13
            Caption = 'Sources :'
            Color = clBtnFace
            ParentColor = False
          end
          object LabelBase: TLabel
            Left = 4
            Top = 5
            Width = 98
            Height = 13
            Caption = 'Base de donn'#233'es:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = 13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object btnSelectBase: TFWLoad
            Left = 250
            Top = 22
            Width = 23
            Height = 22
            Anchors = [akTop, akRight]
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              20000000000000040000640000006400000000000000000000002C86D8D12D88
              D8F72D87D8F72D88D8F72D88D8F72D88D8F72D88D8F72D88D8F72D88D8F72D88
              D8F72D88D8F72D87D8F72D88D8F72C86D8D1FFFFFF00FFFFFF00338ED9FBDCF0
              FAFF98E1F6FF95E0F6FF92DFF6FF8EDEF5FF89DCF5FF85DAF4FF80D9F4FF7AD7
              F3FF74D5F3FF70D3F2FFC2EAF8FF3594DAFFFFFFFF00FFFFFF003594DAF7EFFA
              FEFF93E5F8FF8FE4F8FF89E3F8FF82E1F7FF7ADFF7FF71DEF6FF67DBF5FF5BD8
              F4FF4DD4F3FF40D1F2FFCAF2FBFF3594DAFFFFFFFF00FFFFFF00369ADAF8F2FA
              FDFF94E6F8FF92E5F8FF90E5F8FF8BE3F8FF86E2F7FF7FE1F7FF77DEF6FF6CDC
              F6FF5ED9F4FF4FD5F3FFCCF2FBFF3594DAFFFFFFFF00FFFFFF0036A1DAF9F6FC
              FEFF94E5F8FF93E5F8FF93E5F8FF91E5F8FF93DBE9FF93D7E3FF93D2DCFF90CE
              D7FF8CC8CFFF86C1C6FFC9D8D6FF3594DAFFC57444E8CA7F53F137A6DAFAFEFF
              FFFFF8FDFFFFF6FDFFFFF5FCFFFFF3FCFEFF9AE4F4FF9AE6F7FF9BE6F6FF9DE5
              F5FF9EE5F5FF9FE5F4FFDAF3F8FF3594DAFFFDF4EEFFCA8054F935ABDAFAE8F6
              FBFF70BCE7FF55AAE2FF4DA5E0FF91C9EBFFFAF3EFFFFDFEFDFFFFFDFCFFFFFD
              FCFFFEFDFCFFFEFCFBFFFEFEFDFF3594DAFFEFF2E8FFCE8156FF36AADAF2F1FA
              FDFF94DEF5FF93DCF4FF64BCE9FF3594DAFF3594DAFF3594DAFF3594DAFF3594
              DAFF3594DAFF3594DAFF3594DAFF3594DAFFFBF6EFFFCC8355FE35AFDAF0F7FC
              FEFF8EE4F8FF91DEF5FF9FE0F5FFACE1F6FFCA8452FFFFF7F1FFFFE9D9FFFFEA
              DBFFFFE9D9FFFFE7D7FFFFE5D2FFFFE2CBFFFFF7F1FFCB8555FE36B3DAF8FDFE
              FEFFFEFFFFFFFEFEFFFFFDFEFFFFFEFFFFFFE4BA91FFFFF7F0FFFFE7D5FFFDE7
              D6FFFDE6D4FFFCE4D0FFFBE3CBFFFADCC2FFFEF3E8FFCC8656FE34B4D9D05EC2
              E1FA60C3E2FA60C3E2FA60C3E2FA5FC3E2FAE4BB91FFFFF7F2FFFEE7D5FFFEE7
              D5FFFDE5D1FFFAE0CAFFF9DEC4FFF7D9BCFFFDF2E7FFCC8757FEFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4BB92FFFEF7F1FFFCE5D2FFFCE4
              D1FFFBE2CCFFF9DDC4FFF6D7BBFFF3D1AFFFFAEFE4FFCC8758FEFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4BB92FFFEF6F0FFFCE2CDFFFCE3
              CDFFFADFC8FFF7D9BCFFF5E9DDFFFAF3EBFFFBF8F3FFCA8353FEFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4BB93FFFEF5EDFFFCDEC5FFFBE0
              C7FFF9DCC2FFF5D3B4FFFEF9F3FFFAE2C4FFECC193FFC37D4893FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5BE96FFFFFFFEFFFDF3E9FFFDF3
              EAFFFCF2E8FFFAEFE3FFFAF2E7FFEABB88FFCF8555B3B4693D0CFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAC39DFFE6BF96FFE4BB92FFE4BB
              92FFD1A06CF5D09E6DF6CC965FDAC479427EB2673C09FFFFFF00}
            OnClick = btnSelectBaseClick
          end
          object Label45: TLabel
            Left = 4
            Top = 51
            Width = 47
            Height = 13
            Caption = 'Dossier:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object de_ExportWeb: TDirectoryEdit
            Left = 3
            Top = 100
            Width = 240
            Height = 21
            Color = clBtnFace
            NumGlyphs = 1
            ButtonWidth = 23
            TabOrder = 2
          end
          object cb_Themes: TFlatComboBox
            Left = 67
            Top = 128
            Width = 199
            Height = 21
            Color = clBtnFace
            ItemHeight = 13
            TabOrder = 3
            Text = 'default'
            ItemIndex = -1
          end
          object GedcomEdit: TFilenameEdit
            Left = 67
            Top = 193
            Width = 173
            Height = 21
            FilterIndex = 0
            DialogOptions = []
            Color = clBtnFace
            ButtonWidth = 23
            NumGlyphs = 1
            TabOrder = 5
          end
          object FWEraseGedcom: TJvXPButton
            Left = 246
            Top = 193
            Width = 22
            Height = 22
            TabOrder = 6
            Glyph.Data = {
              0E54496D6167696E674269746D617046050000424D4605000000000000360000
              00280000001200000012000000010020000000000010050000130B0000130B00
              000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9797
              FF000000FF111010FF585758FF6C6C6CFF656565FF656565FF666666FF666666
              FF555555FFA2A2A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFA39D9DFF022E2EFF90CACAFF494243FF181715FF5B5A5AFF6C6C6DFF656565
              FF666666FF666666FF686868FF414141FFA5A5A5FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFEFEFFA5A2A2FF002E2EFF85E7E7FF77BBBBFF7CBDC0FF414D46FF27251C
              FF616266FF696969FF636363FF636363FF636363FF676767FF373737FFC3C3C3
              FFFFFFFFFFFFFFFFFFACA8A8FF154141FF74CFCFFF92E0E0FFA6FFFFFF98FFFF
              FF8FC388FF3C3000FF201D25FF636466FF69696AFF636363FF636363FF636363
              FF666666FF4E4E4EFFFFFFFFFFB6B1B1FF214B4BFF61B5B5FF90E1E1FFA0FFFF
              FF97FFFFFF9AFFFFFFA9DCA1FF644510FF1B0B00FF595C4EFFC2C2C6FFCDCDCD
              FFC5C5C5FFC5C5C5FFC5C5C5FFC6C6C6FFD8D7D7FF1D4343FF58A8A8FF90E6E6
              FF9FFFFFFF98FFFFFF97FFFFFF99E8CAFFA6B36FFF835E2DFF766714FF474B0C
              FF999895FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1DFF5DB9B9
              FF8FE3E3FF9CFFFFFF99FFFFFF98FFFFFF99EDD4FFA3B46FFF926E31FFA18758
              FFC8C987FF8E8F32FF242400FF8B8B91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000FF9DF5F5FF9EFFFFFF99FFFFFF97FFFFFF99F6E7FFA2B771FF927131
              FF997D4DFFCAC998FFD3D5A7FFCACA88FF898926FF212000FF999CA0FFFFFFFF
              FFFFFFFFFFFFFFFFFF6E6767FF408181FFB1FFFFFF97FFFFFF96FAF4FFA0B770
              FF9A7935FF957748FFC6C491FFCFD19EFFCCCC99FFD1D1A4FFCDCE89FF7D7C18
              FF11150CFFAAACB3FFFFFFFFFFFFFFFFFFFFFFFFFF485050FF68B7B9FFA4FFFF
              FF9FBB73FFA07C34FF917245FFC1BE8BFFD1D4A1FFCBCB98FFCBCB98FFCBCB98
              FFD5D7ABFFCCCD84FF290E01FF222516FFC3C3C8FFFFFFFFFFFFFFFFFFE6DFDF
              FF4C5D5FFF749159FFAA8F40FF8B673DFFBEB884FFD2D6A3FFCCCB98FFCBCB98
              FFCCCC99FFCBCB98FFD3D7A3FFC4BE90FF7B4D1DFF242300FF8A8A92FFFFFFFF
              FFFFFFFFFFFFFFFFFFCEC9CBFF483D2BFF614028FFCAC28AFFD2D6A3FFCCCB98
              FFCBCB98FFCCCC99FFCBCB98FFD2D4A1FFC4C18DFF8B693AFFAC9A4DFF353600
              FFA8A8AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEC6FF453E3BFFB5B783
              FFDEDEA8FFCACA97FFCCCC99FFCBCB98FFD1D3A0FFC3BF8BFF8F6F42FFAF9B54
              FF5A5B1AFF7D7D76FFEEEEF1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFBCBDC0FF545443FFB2B27FFFDCDCA5FFCACA97FFD0D29FFFC5C490FF94774C
              FFB6A05AFF575611FF6E6F67FFEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8FF5F5F4AFFBCBC87FFDADCA6FFCBCC99
              FF987E50FFB19853FF575614FF66685EFFE6E6ECFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A6FF646449
              FFD3D8A1FF9A8153FFA4884AFF6A671CFF595A49FFE0E0E5FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF91959AFF2C1000FFBC964EFF8C8B35FF4C5034FFD4D4D9FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF898A8CFF000000FF2D2E32FFD6D6D8
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = FWEraseImage2Click
          end
          object cb_Files: TFlatComboBox
            Left = 67
            Top = 160
            Width = 199
            Height = 21
            Color = clBtnFace
            ItemHeight = 13
            TabOrder = 4
            Text = 'default'
            ItemIndex = -1
          end
          object cb_Base: TFlatComboBox
            Left = 4
            Top = 21
            Width = 244
            Height = 21
            Color = clBtnFace
            DropDownCount = 10
            ItemHeight = 13
            TabOrder = 0
            ItemIndex = -1
            OnChange = cb_BaseChange
          end
          object cbDossier: TFlatComboBox
            Left = 60
            Top = 48
            Width = 206
            Height = 21
            Style = csDropDownList
            Color = clBtnFace
            ItemHeight = 13
            TabOrder = 1
            ItemIndex = -1
            OnChange = cbDossierChange
          end
        end
        object Panel4: TPanel
          Left = 276
          Top = 0
          Width = 356
          Height = 338
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter2: TSplitter
            Left = 0
            Top = 252
            Width = 356
            Height = 5
            Cursor = crVSplit
            Align = alBottom
            ExplicitTop = 254
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 356
            Height = 252
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBGrid1: TDBGrid
              Left = 0
              Top = 43
              Width = 356
              Height = 209
              Align = alClient
              DataSource = ds_Individu
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGrid1CellClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NOM'
                  Title.Caption = 'Nom'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRENOM'
                  Title.Caption = 'Pr'#233'nom'
                  Width = 168
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ANNEE_NAISSANCE'
                  Title.Caption = 'N'#233'(e)'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ANNEE_DECES'
                  Title.Caption = 'D'#233'c'#232's'
                  Width = 40
                  Visible = True
                end>
            end
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 356
              Height = 43
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object ch_ancestors: TFlatCheckBox
                Left = 5
                Top = 25
                Width = 333
                Height = 17
                Caption = 'Ascendance'
                Checked = True
                TabOrder = 0
                TabStop = True
              end
              object ch_Filtered: TFlatCheckBox
                Left = 5
                Top = 1
                Width = 344
                Height = 17
                Caption = 'Filtrer par l'#39'individu :'
                TabOrder = 1
                TabStop = True
                OnClick = ch_FilteredClick
              end
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 257
            Width = 356
            Height = 81
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Label43: TLabel
              Left = 4
              Top = 3
              Width = 44
              Height = 13
              Caption = 'Importer :'
              Color = clBtnFace
              ParentColor = False
            end
            object bt_gen: TFWSaveAs
              Left = 250
              Top = 50
              Width = 96
              Height = 29
              Caption = 'G'#233'n'#233'rer'
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2171169
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = bt_genClick
            end
            object fne_Export: TFilenameEdit
              Left = 98
              Top = 26
              Width = 225
              Height = 21
              FilterIndex = 0
              DialogOptions = [ofCreatePrompt]
              Color = clBtnFace
              ButtonWidth = 23
              NumGlyphs = 1
              TabOrder = 1
            end
            object fne_import: TFilenameEdit
              Left = 98
              Top = 0
              Width = 226
              Height = 21
              FilterIndex = 0
              DialogOptions = [ofFileMustExist]
              Color = clBtnFace
              ButtonWidth = 23
              NumGlyphs = 1
              TabOrder = 2
            end
            object bt_export: TFWSaveAs
              Left = 2
              Top = 26
              Width = 90
              Height = 22
              Caption = 'Exporter'
              TabOrder = 3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2171169
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = bt_exportClick
            end
            object FWPreview1: TFWPreview
              Left = 144
              Top = 50
              Width = 97
              Height = 29
              Caption = 'Voir'
              TabOrder = 4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = FWPreview1Click
            end
          end
        end
      end
    end
    object ts_needed: TTabSheet
      Caption = 'G'#233'n'#233'ral'
      object pc_needed: TPageControl
        Left = 0
        Top = 0
        Width = 632
        Height = 338
        ActivePage = ts_home
        Align = alClient
        TabOrder = 0
        object ts_home: TTabSheet
          Caption = 'Accueil'
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 310
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label2: TLabel
              Left = 4
              Top = 5
              Width = 37
              Height = 13
              Caption = 'Auteur :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label3: TLabel
              Left = 4
              Top = 25
              Width = 59
              Height = 13
              Caption = 'Description :'
              Color = clBtnFace
              ParentColor = False
            end
            object lb_Images: TLabel
              Left = 4
              Top = 145
              Width = 40
              Height = 13
              Caption = 'Images :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label10: TLabel
              Left = 300
              Top = 5
              Width = 74
              Height = 13
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object ExtImage1: TExtImage
              Left = 6
              Top = 168
              Width = 194
              Height = 162
              Center = True
              Proportional = True
            end
            object ExtImage2: TExtImage
              Left = 214
              Top = 168
              Width = 194
              Height = 162
              Center = True
              Proportional = True
            end
            object ExtImage3: TExtImage
              Left = 422
              Top = 168
              Width = 194
              Height = 162
              Center = True
              Proportional = True
            end
            object ed_Author: TFlatEdit
              Left = 60
              Top = 1
              Width = 224
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 0
            end
            object me_Description: TFlatMemo
              Left = 4
              Top = 41
              Width = 622
              Height = 74
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 1
            end
            object ImageEdit1: TFilenameEdit
              Left = 60
              Top = 137
              Width = 96
              Height = 21
              Filter = '*'
              FilterIndex = 0
              DialogOptions = []
              ButtonWidth = 23
              NumGlyphs = 1
              TabOrder = 2
              OnChange = ImageEdit1Change
            end
            object ImageEdit2: TFilenameEdit
              Left = 212
              Top = 136
              Width = 152
              Height = 21
              FilterIndex = 0
              DialogOptions = []
              ButtonWidth = 23
              NumGlyphs = 1
              TabOrder = 3
              OnChange = ImageEdit2Change
            end
            object ImageEdit3: TFilenameEdit
              Left = 420
              Top = 137
              Width = 152
              Height = 21
              FilterIndex = 0
              DialogOptions = []
              ButtonWidth = 23
              NumGlyphs = 1
              TabOrder = 4
              OnChange = ImageEdit3Change
            end
            object FWEraseImage: TFWErase
              Left = 184
              Top = 137
              Width = 20
              TabOrder = 5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2171169
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = FWEraseImageClick
            end
            object FWEraseImage2: TFWErase
              Left = 392
              Top = 137
              Width = 20
              TabOrder = 6
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2171169
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = FWEraseImage2Click
            end
            object FWEraseImage3: TFWErase
              Left = 600
              Top = 136
              Width = 20
              TabOrder = 7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2171169
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = FWEraseImage3Click
            end
            object ed_IndexName: TFlatEdit
              Left = 402
              Top = 1
              Width = 224
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 8
              Text = 'index'
            end
            object ch_Comptage: TFlatCheckBox
              Left = 4
              Top = 120
              Width = 223
              Height = 13
              Caption = 'Statistiques sur les individus'
              Checked = True
              TabOrder = 9
              TabStop = True
            end
          end
        end
        object ts_Files: TTabSheet
          Caption = 'Fiches'
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 310
            Align = alClient
            TabOrder = 0
            object Label13: TLabel
              Left = 244
              Top = 6
              Width = 129
              Height = 13
              Caption = 'Nom du d'#233'but des fichiers :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label14: TLabel
              Left = 4
              Top = 29
              Width = 59
              Height = 13
              Caption = 'Description :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label31: TLabel
              Left = 211
              Top = 29
              Width = 155
              Height = 13
              Caption = 'Nom du d'#233'but des fichiers listes :'
              Color = clBtnFace
              ParentColor = False
            end
            object ed_FileBeginName: TFlatEdit
              Left = 404
              Top = 1
              Width = 224
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 0
              Text = 'Files'
            end
            object me_FilesHead: TFlatMemo
              Left = 4
              Top = 49
              Width = 622
              Height = 74
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 1
            end
            object ch_Images: TFlatCheckBox
              Left = 4
              Top = 129
              Width = 161
              Height = 17
              Caption = 'Joindre les images'
              Checked = True
              TabOrder = 2
              TabStop = True
            end
            object ed_ListsBeginName: TFlatEdit
              Left = 404
              Top = 25
              Width = 224
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 3
              Text = 'List'
            end
            object ch_ShowMainFile: TFlatCheckBox
              Left = 211
              Top = 129
              Width = 161
              Height = 17
              Caption = 'Montrer l'#39'onglet Fiches'
              TabOrder = 4
              TabStop = True
            end
          end
        end
        object ts_global: TTabSheet
          Caption = 'Global'
          object Panel15: TPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 310
            Align = alClient
            TabOrder = 0
            object Label6: TLabel
              Left = 4
              Top = 240
              Width = 120
              Height = 13
              Caption = 'En bas de chaque page :'
              Color = clBtnFace
              ParentColor = False
            end
            object cb_CityAccents: TFlatComboBox
              Left = 412
              Top = 102
              Width = 204
              Height = 21
              Color = clBtnFace
              ItemHeight = 13
              Items.Strings = (
                'Sans accent avec une majuscule'
                'Sans accent sans majuscule'
                'Sans accent en majuscules'
                'Avec accents avec une majuscule'
                'Avec accents sans majuscule'
                'Avec accents en majuscules'
                'Tel quel')
              TabOrder = 0
              Text = 'Sans accent avec une majuscule'
              ItemIndex = 0
            end
            object ed_BaseCities: TFlatEdit
              Left = 212
              Top = 103
              Width = 194
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 1
              Text = 'http://fr.wikipedia.org/wiki/'
            end
            object ch_CitiesLink: TFlatCheckBox
              Left = 4
              Top = 108
              Width = 200
              Height = 17
              Caption = 'Lier '#224' une base de villes :'
              Checked = True
              TabOrder = 2
              TabStop = True
            end
            object ch_SurnamesLink: TFlatCheckBox
              Left = 4
              Top = 82
              Width = 200
              Height = 17
              Caption = 'Lier '#224' une base de noms :'
              Checked = True
              TabOrder = 3
              TabStop = True
            end
            object ch_NamesLink: TFlatCheckBox
              Left = 4
              Top = 54
              Width = 200
              Height = 17
              Caption = 'Lier '#224' une base de pr'#233'noms :'
              Checked = True
              TabOrder = 4
              TabStop = True
            end
            object ed_BaseNames: TFlatEdit
              Left = 212
              Top = 49
              Width = 194
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 5
              Text = 'http://www.behindthename.com/name/'
            end
            object ed_BaseSurnames: TFlatEdit
              Left = 212
              Top = 77
              Width = 194
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 6
              Text = 'http://www.geneanet.org/nom-de-famille/'
            end
            object cb_SurnamesAccents: TFlatComboBox
              Left = 412
              Top = 75
              Width = 204
              Height = 21
              Color = clBtnFace
              ItemHeight = 13
              Items.Strings = (
                'Sans accent avec une majuscule'
                'Sans accent sans majuscule'
                'Sans accent en majuscules'
                'Avec accents avec une majuscule'
                'Avec accents sans majuscule'
                'Avec accents en majuscules'
                'Tel quel')
              TabOrder = 7
              Text = 'Sans accent sans majuscule'
              ItemIndex = 1
            end
            object cb_NamesAccents: TFlatComboBox
              Left = 412
              Top = 48
              Width = 204
              Height = 21
              Color = clBtnFace
              ItemHeight = 13
              Items.Strings = (
                'Sans accent avec une majuscule'
                'Sans accent sans majuscule'
                'Sans accent en majuscules'
                'Avec accents avec une majuscule'
                'Avec accents sans majuscule'
                'Avec accents en majuscules'
                'Tel quel')
              TabOrder = 8
              Text = 'Sans accent sans majuscule'
              ItemIndex = 1
            end
            object ch_HideLessThan100: TFlatCheckBox
              Left = 4
              Top = 3
              Width = 253
              Height = 17
              Caption = 'Cacher les dates de moins de 100'#160'ans'
              Checked = True
              TabOrder = 9
              TabStop = True
              OnClick = ch_FilteredClick
            end
            object me_Bottom: TFlatMemo
              Left = 4
              Top = 256
              Width = 620
              Height = 37
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 10
            end
            object ch_JobsLink: TFlatCheckBox
              Left = 4
              Top = 27
              Width = 200
              Height = 17
              Caption = 'Lier '#224' une base de m'#233'tiers :'
              Checked = True
              TabOrder = 11
              TabStop = True
            end
            object ed_BaseJobs: TFlatEdit
              Left = 212
              Top = 23
              Width = 194
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 12
              Text = 'http://fr.wikipedia.org/wiki/'
            end
            object cb_JobsAccents: TFlatComboBox
              Left = 412
              Top = 21
              Width = 204
              Height = 21
              Color = clBtnFace
              ItemHeight = 13
              Items.Strings = (
                'Sans accent avec une majuscule'
                'Sans accent sans majuscule'
                'Sans accent en majuscules'
                'Avec accents avec une majuscule'
                'Avec accents sans majuscule'
                'Avec accents en majuscules'
                'Tel quel')
              TabOrder = 13
              Text = 'Sans accent avec une majuscule'
              ItemIndex = 0
            end
          end
        end
      end
    end
    object ts_options: TTabSheet
      Caption = 'Options'
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 632
        Height = 338
        ActivePage = ts_tree
        Align = alClient
        TabOrder = 0
        object ts_tree: TTabSheet
          Caption = 'Arbre'
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 310
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label8: TLabel
              Left = 4
              Top = 25
              Width = 37
              Height = 13
              Caption = 'Ent'#234'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label11: TLabel
              Left = 300
              Top = 5
              Width = 74
              Height = 13
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object ch_genTree: TFlatCheckBox
              Left = 4
              Top = 6
              Width = 256
              Height = 17
              Caption = 'G'#233'n'#233'rer l'#39'arbre'
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object me_HeadTree: TFlatMemo
              Left = 4
              Top = 41
              Width = 622
              Height = 74
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 1
            end
            object ed_TreeName: TFlatEdit
              Left = 404
              Top = 1
              Width = 224
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 2
              Text = 'Tree'
            end
          end
        end
        object ts_Surnames: TTabSheet
          Caption = 'Patronymes'
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 310
            Align = alClient
            TabOrder = 0
            object Label29: TLabel
              Left = 340
              Top = 6
              Width = 119
              Height = 13
              Caption = 'Nom du d'#233'but du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label30: TLabel
              Left = 4
              Top = 24
              Width = 59
              Height = 13
              Caption = 'Description :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label50: TLabel
              Left = 340
              Top = 120
              Width = 119
              Height = 13
              Caption = 'Nom du d'#233'but du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label51: TLabel
              Left = 32
              Top = 53
              Width = 59
              Height = 13
              Caption = 'Description :'
              Color = clBtnFace
              ParentColor = False
            end
            object lb_DescribeMap: TLabel
              Left = 4
              Top = 144
              Width = 59
              Height = 13
              Caption = 'Description :'
              Color = clBtnFace
              ParentColor = False
            end
            object ch_genSurnames: TFlatCheckBox
              Left = 4
              Top = 6
              Width = 320
              Height = 17
              Caption = 'G'#233'n'#233'rer les patronymes'
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object ed_SurnamesFileName: TFlatEdit
              Left = 492
              Top = 1
              Width = 136
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 1
              Text = 'Surnames'
            end
            object me_SurnamesHead: TFlatMemo
              Left = 4
              Top = 41
              Width = 622
              Height = 74
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 2
            end
            object ch_genMap: TFlatCheckBox
              Left = 4
              Top = 120
              Width = 328
              Height = 17
              Caption = 'G'#233'n'#233'rer la carte des patronymes (n'#233'cessite PHP)'
              Checked = True
              TabOrder = 3
              TabStop = True
            end
            object ed_MapFileName: TFlatEdit
              Left = 492
              Top = 116
              Width = 134
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 4
              Text = 'Map'
            end
            object me_MapHead: TFlatMemo
              Left = 4
              Top = 160
              Width = 622
              Height = 74
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 5
            end
          end
        end
        object ts_search: TTabSheet
          Caption = 'Recherche'
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 310
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label15: TLabel
              Left = 4
              Top = 1
              Width = 492
              Height = 13
              Caption = 
                'Cette fiche g'#233'n'#232're une recherche, qui fontionne 1 mois apr'#232's avo' +
                'ir inscrit votre site sur un site r'#233'f'#233'renc'#233'.'
              Color = clBtnFace
              ParentColor = False
            end
            object Label16: TLabel
              Left = 298
              Top = 27
              Width = 74
              Height = 13
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label17: TLabel
              Left = 4
              Top = 49
              Width = 37
              Height = 13
              Caption = 'Ent'#234'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label18: TLabel
              Left = 4
              Top = 149
              Width = 301
              Height = 13
              Caption = 'Domaine de votre site web (compte et fin d'#39'adresse h'#233'bergeur) :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label32: TLabel
              Left = 268
              Top = 177
              Width = 90
              Height = 13
              Caption = 'Site de recherche :'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label33: TLabel
              Left = 4
              Top = 177
              Width = 106
              Height = 13
              Caption = 'Identifiant de requ'#234'te :'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object ch_genSearch: TFlatCheckBox
              Left = 4
              Top = 25
              Width = 257
              Height = 17
              Caption = 'G'#233'n'#233'rer la recherche'
              TabOrder = 0
              TabStop = True
            end
            object ed_SearchName: TFlatEdit
              Left = 402
              Top = 23
              Width = 224
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 1
              Text = 'Recherche'
            end
            object me_searchHead: TFlatMemo
              Left = 4
              Top = 65
              Width = 622
              Height = 74
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 2
            end
            object ed_SearchSite: TFlatEdit
              Left = 380
              Top = 145
              Width = 248
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 3
            end
            object ed_SearchTool: TFlatEdit
              Left = 380
              Top = 173
              Width = 248
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 4
              Text = 'http://www.google.fr/search'
            end
            object ed_SearchQuery: TFlatEdit
              Left = 140
              Top = 173
              Width = 112
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 5
              Text = 'q'
            end
          end
        end
        object ts_contact: TTabSheet
          Caption = 'Contact'
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 310
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label4: TLabel
              Left = 4
              Top = 1
              Width = 387
              Height = 13
              Caption = 
                'Cette fiche utilise le langage PHP, afin de cacher votre mail de' +
                's publicit'#233's du web.'
              Color = clBtnFace
              ParentColor = False
            end
            object Label5: TLabel
              Left = 4
              Top = 49
              Width = 37
              Height = 13
              Caption = 'Ent'#234'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label12: TLabel
              Left = 298
              Top = 27
              Width = 74
              Height = 13
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label34: TLabel
              Left = 322
              Top = 177
              Width = 59
              Height = 13
              Caption = 'Sa s'#233'curit'#233' :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label35: TLabel
              Left = 4
              Top = 149
              Width = 25
              Height = 13
              Caption = 'Mail :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label36: TLabel
              Left = 4
              Top = 176
              Width = 67
              Height = 13
              Caption = 'Serveur h'#244'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label37: TLabel
              Left = 4
              Top = 245
              Width = 52
              Height = 13
              Caption = 'Utilisateur :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label38: TLabel
              Left = 322
              Top = 245
              Width = 70
              Height = 13
              Caption = 'Mot de passe :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label39: TLabel
              Left = 324
              Top = 273
              Width = 79
              Height = 13
              Caption = 'Mot de passe 2 :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label40: TLabel
              Left = 4
              Top = 204
              Width = 78
              Height = 13
              Caption = 'Port du serveur :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label41: TLabel
              Left = 322
              Top = 149
              Width = 37
              Height = 13
              Caption = 'Auteur :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label42: TLabel
              Left = 322
              Top = 205
              Width = 68
              Height = 13
              Caption = 'Outil de mails :'
              Color = clBtnFace
              ParentColor = False
            end
            object me_ContactHead: TFlatMemo
              Left = 4
              Top = 65
              Width = 622
              Height = 74
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 0
            end
            object ch_genContact: TFlatCheckBox
              Left = 4
              Top = 25
              Width = 265
              Height = 17
              Caption = 'G'#233'n'#233'rer la fiche de contact'
              Checked = True
              TabOrder = 1
              TabStop = True
            end
            object ed_ContactName: TFlatEdit
              Left = 402
              Top = 23
              Width = 224
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 2
              Text = 'Contact'
            end
            object cb_ContactSecurity: TFlatComboBox
              Left = 418
              Top = 169
              Width = 208
              Height = 21
              Color = clBtnFace
              ItemHeight = 13
              Items.Strings = (
                'ssl')
              TabOrder = 3
              Text = 'ssl'
              ItemIndex = 0
            end
            object ed_ContactMail: TFlatEdit
              Left = 100
              Top = 145
              Width = 208
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 4
            end
            object ed_ContactHost: TFlatEdit
              Left = 100
              Top = 172
              Width = 208
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 5
              Text = 'localhost'
            end
            object ed_ContactUser: TFlatEdit
              Left = 100
              Top = 241
              Width = 208
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 6
            end
            object ed_ContactPassword: TFlatEdit
              Left = 418
              Top = 241
              Width = 208
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              PasswordChar = '*'
              TabOrder = 7
            end
            object ch_ContactIdentify: TFlatCheckBox
              Left = 4
              Top = 225
              Width = 233
              Height = 17
              Caption = 'S'#39'identifier sur ce serveur :'
              Checked = True
              TabOrder = 8
              TabStop = True
            end
            object ed_ContactPassword2: TFlatEdit
              Left = 418
              Top = 269
              Width = 208
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              PasswordChar = '*'
              TabOrder = 9
            end
            object se_ContactPort: TSpinEdit
              Left = 100
              Top = 201
              Width = 210
              Height = 22
              MaxValue = 65536
              MinValue = 0
              TabOrder = 10
              Value = 25
            end
            object ed_ContactAuthor: TFlatEdit
              Left = 418
              Top = 145
              Width = 208
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 11
            end
            object cb_ContactTool: TFlatComboBox
              Left = 418
              Top = 198
              Width = 208
              Height = 21
              Color = clBtnFace
              ItemHeight = 13
              Items.Strings = (
                'qmail'
                'sendmail'
                'mail')
              TabOrder = 12
              Text = 'qmail'
              ItemIndex = 0
            end
          end
        end
        object ts_jobs: TTabSheet
          Caption = 'M'#233'tiers'
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 310
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label48: TLabel
              Left = 4
              Top = 25
              Width = 37
              Height = 13
              Caption = 'Ent'#234'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label49: TLabel
              Left = 300
              Top = 5
              Width = 74
              Height = 13
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object ch_genjobs: TFlatCheckBox
              Left = 4
              Top = 6
              Width = 288
              Height = 17
              Caption = 'G'#233'n'#233'rer les statistiques sur les professions'
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object me_HeadJobs: TFlatMemo
              Left = 4
              Top = 41
              Width = 622
              Height = 74
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 1
            end
            object ed_JobsName: TFlatEdit
              Left = 404
              Top = 1
              Width = 224
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 2
              Text = 'Jobs'
            end
          end
        end
        object ts_ages: TTabSheet
          Caption = #194'ges'
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 310
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label46: TLabel
              Left = 4
              Top = 25
              Width = 37
              Height = 13
              Caption = 'Ent'#234'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label47: TLabel
              Left = 300
              Top = 5
              Width = 74
              Height = 13
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object ch_genages: TFlatCheckBox
              Left = 4
              Top = 6
              Width = 288
              Height = 17
              Caption = 'G'#233'n'#233'rer les statistiques sur les '#226'ges'
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object me_HeadAges: TFlatMemo
              Left = 4
              Top = 41
              Width = 622
              Height = 74
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 1
            end
            object ed_AgesName: TFlatEdit
              Left = 404
              Top = 1
              Width = 224
              Height = 19
              ColorFlat = clBtnFace
              ParentColor = True
              TabOrder = 2
              Text = 'Ages'
            end
          end
        end
      end
    end
    object ts_about: TTabSheet
      Caption = #192' propos'
      object pa_About: TScrollBox
        Left = 0
        Top = 0
        Width = 632
        Height = 338
        Align = alClient
        TabOrder = 0
        object Label19: TLabel
          Left = 17
          Top = 35
          Width = 438
          Height = 13
          Caption = 
            'Le plugin AncestroWeb GPL permet de cr'#233'er un site Web sur Ancest' +
            'rologie et Freelogy GPL.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label20: TLabel
          Left = 17
          Top = 53
          Width = 409
          Height = 13
          Caption = 
            'La licence GPL est libre et permet '#224' Matthieu GIROUX, l'#39'auteur, ' +
            'de donner son logiciel.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label21: TLabel
          Left = 17
          Top = 69
          Width = 479
          Height = 13
          Caption = 
            'Une licence libre vous permet de participer au projet, mais elle' +
            ' demande de donner votre participation.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label22: TLabel
          Left = 17
          Top = 3
          Width = 215
          Height = 24
          Caption = 'AncestroWeb et Freelogy'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label23: TLabel
          Left = 18
          Top = 91
          Width = 148
          Height = 24
          Caption = 'Site Web Statique'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label24: TLabel
          Left = 18
          Top = 123
          Width = 492
          Height = 13
          Caption = 
            'Cr'#233'er un site web statique vous permet de gagner en rapidit'#233' sur' +
            ' les serveurs web gratuits sans publicit'#233'.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label25: TLabel
          Left = 18
          Top = 141
          Width = 467
          Height = 13
          Caption = 
            'Par contre un site web statique n'#233'cessite l'#39'utilsation r'#233'guli'#232're' +
            ' d'#39'un client FTP gratuit comme Filezilla.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label26: TLabel
          Left = 17
          Top = 170
          Width = 486
          Height = 13
          Caption = 
            'Des h'#233'bergeurs gratuits comme Free et son abonnement t'#233'l'#233'phone g' +
            'ratuit, vous permettent de diffuser.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label27: TLabel
          Left = 17
          Top = 184
          Width = 493
          Height = 13
          Caption = 
            'Pour diffuser le site web n'#39'est pas suffisant. T'#233'l'#233'chargez vos d' +
            'ocuments '#224' diffuser dans une zone priv'#233'e.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label28: TLabel
          Left = 18
          Top = 154
          Width = 421
          Height = 13
          Caption = 
            'Comme votre site web est '#224' 2 endroits, il est sauvegard'#233'. Cela p' +
            'ermet d'#39#234'tre ind'#233'pendant.'
          Color = clBtnFace
          ParentColor = False
        end
        object JvXPButton1: TJvXPButton
          Left = 220
          Top = 238
          Width = 176
          Height = 32
          Caption = 'Composition de l'#39'application'
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = JvXPButton1Click
        end
      end
    end
  end
  object IBQ_Individu: TIBQuery
    SQL.Strings = (
      'select  CLE_FICHE,NUM_SOSA,'
      '              b.EV_IND_VILLE as VILLE_BIRTH,'
      '              d.EV_IND_VILLE as VILLE_DEATH,'
      
        'CLE_PERE,CLE_MERE,NOM,PRENOM,SEXE, ANNEE_NAISSANCE,ANNEE_DECES f' +
        'rom INDIVIDU left join EVENEMENTS_IND b on b.EV_IND_KLE_FICHE=cl' +
        'e_fiche and b.EV_IND_TYPE='#39'BIRT'#39' left join EVENEMENTS_IND d on d' +
        '.EV_IND_KLE_FICHE=cle_fiche and d.EV_IND_TYPE='#39'DEAT'#39
      'WHERE KLE_DOSSIER=:KLE_DOSSIER '
      'ORDER BY '
      'NOM,PRENOM,ANNEE_NAISSANCE DESC,ANNEE_DECES DESC')
    Left = 572
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'KLE_DOSSIER'
        ParamType = ptInput
      end>
  end
  object ds_Individu: TDataSource
    DataSet = IBQ_Individu
    Left = 472
    Top = 256
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'Bases Firebird/Interbase (*.fdb,*.gdb)|*.fdb;*.gdb|Tous les fich' +
      'iers (*.*)|*.*'
    FilterIndex = 0
    Title = 'Fichier de la base de donn'#233'es'
    Left = 56
    Top = 48
  end
  object OnFormInfoIni: TOnFormInfoIni
    AutoLoad = False
    SauvePosObjects = True
    SauveEditObjets = [feTEdit, feTCheck, feTComboValue, feTDirectoryEdit, feTFileNameEdit, feTMemo, feTPageControl, feTRadio, feTSpinEdit]
    SauvePosForm = True
    OnIniLoad = OnFormInfoIniIniLoad
    OnIniWrite = OnFormInfoIniIniWrite
    Freeini = False
    Left = 320
    Top = 48
  end
  object FileCopy: TExtFileCopy
    Errors = 0
    OnFailure = FileCopyFailure
    Mask = '*'
    FileOptions = [cpUseFilter, cpCreateDestination]
    DoEraseDir = FileCopyDoEraseDir
    Left = 384
    Top = 104
  end
  object TraduceImage: TTraduceFile
    Errors = 0
    OnFailure = TraduceImageFailure
    TraduceOptions = [cpDestinationIsFile, cpCreateDestination]
    ResizeWidth = 200
    Left = 224
    Top = 88
  end
  object FileIniCopy: TExtFileCopy
    Errors = 0
    Mask = '*'
    FileOptions = [cpUseFilter, cpDestinationIsFile, cpCreateDestination]
    DoEraseDir = FileCopyDoEraseDir
    Left = 312
    Top = 104
  end
end