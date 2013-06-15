object F_AncestroWeb: TF_AncestroWeb
  Left = 291
  Top = 302
  ActiveControl = PCPrincipal
  BorderIcons = []
  Caption = 'AncestroWeb :'#160'G'#233'n'#233'rer un Site Web G'#233'n'#233'alogique Statique'
  ClientHeight = 487
  ClientWidth = 788
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object spSkinPanel1: TPanel
    Left = 0
    Top = 450
    Width = 788
    Height = 37
    Align = alBottom
    TabOrder = 0
    object pb_ProgressInd: TFlatGauge
      Left = 177
      Top = 1
      Width = 177
      Height = 35
      AdvColorBorder = 0
      ColorBorder = 8623776
      Progress = 25
      Align = alLeft
    end
    object pb_ProgressAll: TFlatGauge
      Left = 1
      Top = 1
      Width = 176
      Height = 35
      AdvColorBorder = 0
      ColorBorder = 8623776
      Progress = 25
      Align = alLeft
    end
    object lb_Comments: TLabel
      Left = 364
      Top = 12
      Width = 3
      Height = 16
      Color = clBtnFace
      ParentColor = False
    end
    object FWClose1: TFWClose
      Left = 657
      Top = 2
      Width = 121
      Height = 32
      Caption = 'Fermer'
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object PCPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 788
    Height = 450
    ActivePage = ts_Gen
    Align = alClient
    TabOrder = 1
    OnChange = PCPrincipalChange
    object ts_Gen: TTabSheet
      Caption = 'G'#233'n'#233'rer'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 780
        Height = 419
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 338
          Top = 0
          Width = 2
          Height = 419
          ExplicitHeight = 412
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 338
          Height = 419
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            338
            419)
          object Label1: TLabel
            Left = 4
            Top = 98
            Width = 272
            Height = 16
            Caption = 'R'#233'pertoire du site web g'#233'n'#233'alogique '#224' cr'#233'er :'
            Color = clBtnFace
            ParentColor = False
          end
          object Label7: TLabel
            Left = 10
            Top = 164
            Width = 49
            Height = 16
            Caption = 'Th'#232'me :'
            Color = clBtnFace
            ParentColor = False
          end
          object Label9: TLabel
            Left = 10
            Top = 242
            Width = 65
            Height = 16
            Caption = 'GEDCOM :'
            Color = clBtnFace
            ParentColor = False
          end
          object Label44: TLabel
            Left = 11
            Top = 201
            Width = 56
            Height = 16
            Caption = 'Sources :'
            Color = clBtnFace
            ParentColor = False
          end
          object LabelBase: TLabel
            Left = 5
            Top = 6
            Width = 122
            Height = 17
            Caption = 'Base de donn'#233'es:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = 17
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label45: TLabel
            Left = 5
            Top = 63
            Width = 59
            Height = 16
            Caption = 'Dossier:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object btnSelectBase: TFWLoad
            Left = 308
            Top = 27
            Width = 28
            Height = 27
            TabOrder = 7
            Anchors = [akTop, akRight]
            OnClick = btnSelectBaseClick
          end
          object de_ExportWeb: TDirectoryEdit
            Left = 4
            Top = 123
            Width = 295
            Height = 24
            Color = clBtnFace
            NumGlyphs = 1
            ButtonWidth = 28
            TabOrder = 2
          end
          object cb_Themes: TComboBox
            Left = 82
            Top = 158
            Width = 245
            Height = 24
            Color = clBtnFace
            ItemHeight = 16
            TabOrder = 3
            Text = 'default'
          end
          object GedcomEdit: TFilenameEdit
            Left = 82
            Top = 238
            Width = 213
            Height = 24
            FilterIndex = 0
            DialogOptions = []
            Color = clBtnFace
            ButtonWidth = 28
            NumGlyphs = 1
            TabOrder = 5
          end
          object FWEraseGedcom: TFWErase
            Left = 303
            Top = 237
            Width = 27
            Height = 27
            TabOrder = 6
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = FWEraseImage2Click
          end
          object cb_Files: TComboBox
            Left = 82
            Top = 197
            Width = 245
            Height = 24
            Color = clBtnFace
            ItemHeight = 16
            TabOrder = 4
            Text = 'default'
          end
          object cb_Base: TComboBox
            Left = 5
            Top = 26
            Width = 300
            Height = 24
            Color = clBtnFace
            DropDownCount = 10
            ItemHeight = 16
            TabOrder = 0
            OnChange = cb_BaseChange
          end
          object cbDossier: TComboBox
            Left = 74
            Top = 59
            Width = 253
            Height = 24
            Style = csDropDownList
            Color = clBtnFace
            ItemHeight = 16
            TabOrder = 1
            OnChange = cbDossierChange
          end
        end
        object Panel4: TPanel
          Left = 340
          Top = 0
          Width = 440
          Height = 419
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter2: TSplitter
            Left = 0
            Top = 313
            Width = 440
            Height = 7
            Cursor = crVSplit
            Align = alBottom
            ExplicitTop = 306
            ExplicitWidth = 438
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 440
            Height = 313
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBGrid1: TDBGrid
              Left = 0
              Top = 73
              Width = 440
              Height = 240
              Align = alClient
              DataSource = ds_Individu
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -14
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
              Width = 440
              Height = 73
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              DesignSize = (
                440
                73)
              object Label54: TLabel
                Left = 5
                Top = 50
                Width = 49
                Height = 16
                Caption = 'Origine :'
                Color = clBtnFace
                ParentColor = False
              end
              object ch_ancestors: TJvXPCheckbox
                Left = 6
                Top = 23
                Width = 410
                Height = 21
                Caption = 'Ascendance'
                TabOrder = 0
                Checked = True
                State = cbChecked
              end
              object ch_Filtered: TJvXPCheckbox
                Left = 6
                Top = 1
                Width = 424
                Height = 21
                Caption = 'Filtrer par l'#39'individu :'
                TabOrder = 1
                Checked = True
                State = cbChecked
                OnClick = ch_FilteredClick
              end
              object se_Nom: TExtSearchDBEdit
                Left = 58
                Top = 43
                Width = 383
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                Color = 11184810
                TabOrder = 2
                SearchDisplay = 'NOM'
                SearchList = 'NOM,PRENOM'
                SearchSource = ds_Individu
              end
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 320
            Width = 440
            Height = 99
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Label43: TLabel
              Left = 5
              Top = 4
              Width = 55
              Height = 16
              Caption = 'Importer :'
              Color = clBtnFace
              ParentColor = False
            end
            object bt_gen: TFWSaveAs
              Left = 308
              Top = 62
              Width = 118
              Height = 35
              Caption = 'G'#233'n'#233'rer'
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2171169
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = bt_genClick
            end
            object fne_Export: TFilenameEdit
              Left = 121
              Top = 32
              Width = 277
              Height = 24
              FilterIndex = 0
              DialogOptions = [ofCreatePrompt]
              Color = clBtnFace
              ButtonWidth = 28
              NumGlyphs = 1
              TabOrder = 1
            end
            object fne_import: TFilenameEdit
              Left = 121
              Top = 0
              Width = 278
              Height = 24
              FilterIndex = 0
              DialogOptions = [ofFileMustExist]
              Color = clBtnFace
              ButtonWidth = 28
              NumGlyphs = 1
              TabOrder = 2
              OnChange = fne_importChange
            end
            object bt_export: TFWSaveAs
              Left = 2
              Top = 32
              Width = 111
              Height = 27
              Caption = 'Exporter'
              TabOrder = 3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2171169
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = bt_exportClick
            end
            object FWPreview1: TFWPreview
              Left = 177
              Top = 62
              Width = 120
              Height = 35
              Caption = 'Voir'
              TabOrder = 4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -18
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
        Width = 780
        Height = 419
        ActivePage = ts_home
        Align = alClient
        TabOrder = 0
        object ts_home: TTabSheet
          Caption = 'Accueil'
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 772
            Height = 388
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label2: TLabel
              Left = 5
              Top = 6
              Width = 44
              Height = 16
              Caption = 'Auteur :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label3: TLabel
              Left = 5
              Top = 31
              Width = 74
              Height = 16
              Caption = 'Description :'
              Color = clBtnFace
              ParentColor = False
            end
            object lb_Images: TLabel
              Left = 5
              Top = 178
              Width = 51
              Height = 16
              Caption = 'Images :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label10: TLabel
              Left = 369
              Top = 6
              Width = 91
              Height = 16
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object ExtImage1: TExtImage
              Left = 7
              Top = 207
              Width = 239
              Height = 199
              Center = True
              Proportional = True
            end
            object ExtImage2: TExtImage
              Left = 263
              Top = 207
              Width = 239
              Height = 199
              Center = True
              Proportional = True
            end
            object ExtImage3: TExtImage
              Left = 519
              Top = 207
              Width = 239
              Height = 199
              Center = True
              Proportional = True
            end
            object ed_Author: TEdit
              Left = 74
              Top = 1
              Width = 276
              Height = 24
              ParentColor = True
              TabOrder = 0
            end
            object me_Description: TMemo
              Left = 5
              Top = 50
              Width = 765
              Height = 92
              ParentColor = True
              TabOrder = 1
            end
            object ImageEdit1: TFilenameEdit
              Left = 74
              Top = 169
              Width = 118
              Height = 24
              Filter = '*'
              FilterIndex = 0
              DialogOptions = []
              ButtonWidth = 28
              NumGlyphs = 1
              TabOrder = 2
              OnChange = ImageEdit1Change
            end
            object ImageEdit2: TFilenameEdit
              Left = 261
              Top = 167
              Width = 187
              Height = 24
              FilterIndex = 0
              DialogOptions = []
              ButtonWidth = 28
              NumGlyphs = 1
              TabOrder = 3
              OnChange = ImageEdit2Change
            end
            object ImageEdit3: TFilenameEdit
              Left = 517
              Top = 169
              Width = 187
              Height = 24
              FilterIndex = 0
              DialogOptions = []
              ButtonWidth = 28
              NumGlyphs = 1
              TabOrder = 4
              OnChange = ImageEdit3Change
            end
            object FWEraseImage: TFWErase
              Left = 226
              Top = 169
              Width = 25
              Height = 30
              TabOrder = 5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2171169
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = FWEraseImageClick
            end
            object FWEraseImage2: TFWErase
              Left = 482
              Top = 169
              Width = 25
              Height = 30
              TabOrder = 6
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2171169
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = FWEraseImage2Click
            end
            object FWEraseImage3: TFWErase
              Left = 738
              Top = 167
              Width = 25
              Height = 31
              TabOrder = 7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2171169
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = FWEraseImage3Click
            end
            object ed_IndexName: TEdit
              Left = 495
              Top = 1
              Width = 275
              Height = 24
              ParentColor = True
              TabOrder = 8
              Text = 'index'
            end
            object ch_Comptage: TJvXPCheckbox
              Left = 5
              Top = 148
              Width = 274
              Height = 16
              Caption = 'Statistiques sur les individus'
              TabOrder = 9
            end
          end
        end
        object ts_Files: TTabSheet
          Caption = 'Fiches'
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 772
            Height = 388
            Align = alClient
            TabOrder = 0
            object Label13: TLabel
              Left = 300
              Top = 7
              Width = 161
              Height = 16
              Caption = 'Nom du d'#233'but des fichiers :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label14: TLabel
              Left = 5
              Top = 36
              Width = 74
              Height = 16
              Caption = 'Description :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label31: TLabel
              Left = 260
              Top = 36
              Width = 195
              Height = 16
              Caption = 'Nom du d'#233'but des fichiers listes :'
              Color = clBtnFace
              ParentColor = False
            end
            object ed_FileBeginName: TEdit
              Left = 497
              Top = 1
              Width = 276
              Height = 24
              ParentColor = True
              TabOrder = 0
              Text = 'Files'
            end
            object me_FilesHead: TMemo
              Left = 5
              Top = 60
              Width = 765
              Height = 91
              ParentColor = True
              TabOrder = 1
            end
            object ch_Images: TJvXPCheckbox
              Left = 5
              Top = 159
              Width = 198
              Height = 21
              Caption = 'Joindre les images'
              TabOrder = 2
              Checked = True
              State = cbChecked
            end
            object ed_ListsBeginName: TEdit
              Left = 497
              Top = 31
              Width = 276
              Height = 24
              ParentColor = True
              TabOrder = 3
              Text = 'List'
            end
            object ch_ShowMainFile: TJvXPCheckbox
              Left = 260
              Top = 159
              Width = 198
              Height = 21
              Caption = 'Montrer l'#39'onglet Fiches'
              TabOrder = 4
            end
          end
        end
        object ts_global: TTabSheet
          Caption = 'Global'
          object Panel15: TPanel
            Left = 0
            Top = 0
            Width = 772
            Height = 388
            Align = alClient
            TabOrder = 0
            DesignSize = (
              772
              388)
            object Label56: TLabel
              Left = 5
              Top = 155
              Width = 512
              Height = 16
              Caption = 
                'Pour les bases, le libell'#233' s'#39'ajoute par d'#233'faut '#224' la fin. Sinon p' +
                'lacez [first_letter] ou [label].'
              Color = clBtnFace
              ParentColor = False
            end
            object Label6: TLabel
              Left = 5
              Top = 177
              Width = 150
              Height = 16
              Caption = 'En bas de chaque page :'
              Color = clBtnFace
              ParentColor = False
            end
            object ch_JobsLink: TJvXPCheckbox
              Left = 4
              Top = 26
              Width = 200
              Height = 17
              Caption = 'Lier '#224' une base de m'#233'tiers :'
              TabOrder = 0
              Checked = True
              State = cbChecked
            end
            object ed_BaseJobs: TEdit
              Left = 212
              Top = 23
              Width = 194
              Height = 24
              ParentColor = True
              TabOrder = 1
              Text = 'http://www.vieuxmetiers.org/lettre_[first_letter].htm#[label]'
            end
            object cb_JobsAccents: TComboBox
              Left = 412
              Top = 22
              Width = 212
              Height = 24
              Color = clBtnFace
              ItemHeight = 16
              ItemIndex = 1
              TabOrder = 2
              Text = 'Sans accent sans majuscule'
              Items.Strings = (
                'Sans accent avec une majuscule'
                'Sans accent sans majuscule'
                'Sans accent en majuscules'
                'Avec accents avec une majuscule'
                'Avec accents sans majuscule'
                'Avec accents en majuscules'
                'Tel quel')
            end
            object cb_ImagesJobsAccents: TComboBox
              Left = 412
              Top = 48
              Width = 212
              Height = 24
              Color = clBtnFace
              ItemHeight = 16
              ItemIndex = 1
              TabOrder = 3
              Text = 'Sans accent sans majuscule'
              Items.Strings = (
                'Sans accent avec une majuscule'
                'Sans accent sans majuscule'
                'Sans accent en majuscules'
                'Avec accents avec une majuscule'
                'Avec accents sans majuscule'
                'Avec accents en majuscules'
                'Tel quel')
            end
            object ed_ImagesJobs: TEdit
              Left = 212
              Top = 49
              Width = 194
              Height = 24
              ParentColor = True
              TabOrder = 4
              Text = 
                'http://www.gifsmaniac.com/data/gif/metiers/[label]/metiers-[labe' +
                'l]-1.gif'
            end
            object ch_JobsImages: TJvXPCheckbox
              Left = 5
              Top = 52
              Width = 200
              Height = 17
              Caption = 'Lier '#224' des images de m'#233'tiers :'
              TabOrder = 5
              Checked = True
              State = cbChecked
            end
            object ch_NamesLink: TJvXPCheckbox
              Left = 4
              Top = 79
              Width = 200
              Height = 17
              Caption = 'Lier '#224' une base de pr'#233'noms :'
              TabOrder = 6
              Checked = True
              State = cbChecked
            end
            object ed_BaseNames: TEdit
              Left = 212
              Top = 75
              Width = 194
              Height = 24
              ParentColor = True
              TabOrder = 7
              Text = 'http://www.behindthename.com/name/'
            end
            object cb_NamesAccents: TComboBox
              Left = 412
              Top = 74
              Width = 212
              Height = 24
              Color = clBtnFace
              ItemHeight = 16
              ItemIndex = 1
              TabOrder = 8
              Text = 'Sans accent sans majuscule'
              Items.Strings = (
                'Sans accent avec une majuscule'
                'Sans accent sans majuscule'
                'Sans accent en majuscules'
                'Avec accents avec une majuscule'
                'Avec accents sans majuscule'
                'Avec accents en majuscules'
                'Tel quel')
            end
            object cb_SurnamesAccents: TComboBox
              Left = 412
              Top = 100
              Width = 212
              Height = 24
              Color = clBtnFace
              ItemHeight = 16
              ItemIndex = 1
              TabOrder = 9
              Text = 'Sans accent sans majuscule'
              Items.Strings = (
                'Sans accent avec une majuscule'
                'Sans accent sans majuscule'
                'Sans accent en majuscules'
                'Avec accents avec une majuscule'
                'Avec accents sans majuscule'
                'Avec accents en majuscules'
                'Tel quel')
            end
            object ed_BaseSurnames: TEdit
              Left = 212
              Top = 103
              Width = 194
              Height = 24
              ParentColor = True
              TabOrder = 10
              Text = 'http://www.geneanet.org/nom-de-famille/'
            end
            object ch_SurnamesLink: TJvXPCheckbox
              Left = 4
              Top = 106
              Width = 200
              Height = 17
              Caption = 'Lier '#224' une base de noms :'
              TabOrder = 11
              Checked = True
              State = cbChecked
            end
            object ch_CitiesLink: TJvXPCheckbox
              Left = 4
              Top = 133
              Width = 200
              Height = 17
              Caption = 'Lier '#224' une base de villes :'
              TabOrder = 12
              Checked = True
              State = cbChecked
            end
            object ed_BaseCities: TEdit
              Left = 212
              Top = 129
              Width = 194
              Height = 24
              ParentColor = True
              TabOrder = 13
              Text = 'http://fr.wikipedia.org/wiki/'
            end
            object cb_CityAccents: TComboBox
              Left = 412
              Top = 126
              Width = 212
              Height = 24
              Color = clBtnFace
              ItemHeight = 16
              ItemIndex = 0
              TabOrder = 14
              Text = 'Sans accent avec une majuscule'
              Items.Strings = (
                'Sans accent avec une majuscule'
                'Sans accent sans majuscule'
                'Sans accent en majuscules'
                'Avec accents avec une majuscule'
                'Avec accents sans majuscule'
                'Avec accents en majuscules'
                'Tel quel')
            end
            object me_Bottom: TMemo
              Left = 5
              Top = 193
              Width = 616
              Height = 45
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentColor = True
              TabOrder = 16
            end
            object ch_HideLessThan100: TJvXPCheckbox
              Left = 4
              Top = 3
              Width = 576
              Height = 17
              Caption = 'Cacher les informations de moins de 100'#160'ans'
              TabOrder = 15
              Checked = True
              State = cbChecked
              OnClick = ch_FilteredClick
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
        Width = 780
        Height = 419
        ActivePage = ts_tree
        Align = alClient
        TabOrder = 0
        object ts_tree: TTabSheet
          Caption = 'Arbre'
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 772
            Height = 388
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label8: TLabel
              Left = 5
              Top = 31
              Width = 44
              Height = 16
              Caption = 'Ent'#234'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label11: TLabel
              Left = 369
              Top = 6
              Width = 91
              Height = 16
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label52: TLabel
              Left = 198
              Top = 147
              Width = 82
              Height = 16
              Caption = 'g'#233'n'#233'ration(s).'
              Color = clBtnFace
              ParentColor = False
            end
            object ch_genTree: TJvXPCheckbox
              Left = 5
              Top = 7
              Width = 315
              Height = 21
              Caption = 'G'#233'n'#233'rer l'#39'arbre'
              TabOrder = 0
              Checked = True
              State = cbChecked
            end
            object me_HeadTree: TMemo
              Left = 5
              Top = 50
              Width = 765
              Height = 91
              ParentColor = True
              TabOrder = 1
            end
            object ed_TreeName: TEdit
              Left = 497
              Top = 1
              Width = 276
              Height = 24
              ParentColor = True
              TabOrder = 2
              Text = 'Tree'
            end
            object cb_treeWithoutJavascript: TJvXPCheckbox
              Left = 304
              Top = 147
              Width = 333
              Height = 17
              Caption = 'All'#233'ger l'#39'arbre en enlevant la partie dynamique'
              TabOrder = 3
            end
            object ch_SeparateTree: TJvXPCheckbox
              Left = 5
              Top = 147
              Width = 177
              Height = 17
              Caption = 'S'#233'parer l'#39'arbre selon '
              TabOrder = 4
            end
            object sp_gentree: TSpinEdit
              Left = 154
              Top = 143
              Width = 40
              Height = 26
              MaxValue = 50
              MinValue = 1
              TabOrder = 5
              Value = 1
            end
          end
        end
        object ts_Surnames: TTabSheet
          Caption = 'Patronymes'
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 772
            Height = 388
            Align = alClient
            TabOrder = 0
            object Label29: TLabel
              Left = 418
              Top = 7
              Width = 146
              Height = 16
              Caption = 'Nom du d'#233'but du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label30: TLabel
              Left = 5
              Top = 30
              Width = 74
              Height = 16
              Caption = 'Description :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label50: TLabel
              Left = 418
              Top = 148
              Width = 146
              Height = 16
              Caption = 'Nom du d'#233'but du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label51: TLabel
              Left = 39
              Top = 65
              Width = 74
              Height = 16
              Caption = 'Description :'
              Color = clBtnFace
              ParentColor = False
            end
            object lb_DescribeMap: TLabel
              Left = 5
              Top = 177
              Width = 74
              Height = 16
              Caption = 'Description :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label53: TLabel
              Left = 198
              Top = 276
              Width = 53
              Height = 16
              Caption = 'groupes.'
              Color = clBtnFace
              ParentColor = False
            end
            object ch_SeparateMap: TJvXPCheckbox
              Left = 5
              Top = 276
              Width = 141
              Height = 17
              Caption = 'S'#233'parer la carte en '
              TabOrder = 6
            end
            object sp_groupMap: TSpinEdit
              Left = 152
              Top = 272
              Width = 40
              Height = 26
              MaxValue = 50
              MinValue = 2
              TabOrder = 7
              Value = 2
            end
            object ch_genSurnames: TJvXPCheckbox
              Left = 5
              Top = 7
              Width = 394
              Height = 21
              Caption = 'G'#233'n'#233'rer les patronymes'
              TabOrder = 0
              Checked = True
              State = cbChecked
            end
            object ed_SurnamesFileName: TEdit
              Left = 606
              Top = 1
              Width = 167
              Height = 24
              ParentColor = True
              TabOrder = 1
              Text = 'Surnames'
            end
            object me_SurnamesHead: TMemo
              Left = 5
              Top = 50
              Width = 765
              Height = 92
              ParentColor = True
              TabOrder = 2
            end
            object ch_genMap: TJvXPCheckbox
              Left = 5
              Top = 148
              Width = 404
              Height = 21
              Caption = 'G'#233'n'#233'rer la carte des patronymes (n'#233'cessite PHP)'
              TabOrder = 3
              Checked = True
              State = cbChecked
            end
            object ed_MapFileName: TEdit
              Left = 606
              Top = 143
              Width = 164
              Height = 24
              ParentColor = True
              TabOrder = 4
              Text = 'Map'
            end
            object me_MapHead: TMemo
              Left = 5
              Top = 197
              Width = 765
              Height = 73
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
            Width = 772
            Height = 388
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label15: TLabel
              Left = 5
              Top = 1
              Width = 609
              Height = 16
              Caption = 
                'Cette fiche g'#233'n'#232're une recherche, qui fontionne 1 mois apr'#232's avo' +
                'ir inscrit votre site sur un site r'#233'f'#233'renc'#233'.'
              Color = clBtnFace
              ParentColor = False
            end
            object Label16: TLabel
              Left = 367
              Top = 33
              Width = 91
              Height = 16
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label17: TLabel
              Left = 5
              Top = 60
              Width = 44
              Height = 16
              Caption = 'Ent'#234'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label18: TLabel
              Left = 5
              Top = 183
              Width = 380
              Height = 16
              Caption = 'Domaine de votre site web (compte et fin d'#39'adresse h'#233'bergeur) :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label32: TLabel
              Left = 330
              Top = 218
              Width = 111
              Height = 16
              Caption = 'Site de recherche :'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label33: TLabel
              Left = 5
              Top = 218
              Width = 130
              Height = 16
              Caption = 'Identifiant de requ'#234'te :'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object ch_genSearch: TJvXPCheckbox
              Left = 5
              Top = 31
              Width = 316
              Height = 21
              Caption = 'G'#233'n'#233'rer la recherche'
              TabOrder = 0
            end
            object ed_SearchName: TEdit
              Left = 495
              Top = 28
              Width = 275
              Height = 24
              ParentColor = True
              TabOrder = 1
              Text = 'Recherche'
            end
            object me_searchHead: TMemo
              Left = 5
              Top = 80
              Width = 765
              Height = 91
              ParentColor = True
              TabOrder = 2
            end
            object ed_SearchSite: TEdit
              Left = 468
              Top = 178
              Width = 305
              Height = 24
              ParentColor = True
              TabOrder = 3
            end
            object ed_SearchTool: TEdit
              Left = 468
              Top = 213
              Width = 305
              Height = 24
              ParentColor = True
              TabOrder = 4
              Text = 'http://www.google.fr/search'
            end
            object ed_SearchQuery: TEdit
              Left = 172
              Top = 213
              Width = 138
              Height = 24
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
            Width = 772
            Height = 388
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label4: TLabel
              Left = 5
              Top = 1
              Width = 483
              Height = 16
              Caption = 
                'Cette fiche utilise le langage PHP, afin de cacher votre mail de' +
                's publicit'#233's du web.'
              Color = clBtnFace
              ParentColor = False
            end
            object Label5: TLabel
              Left = 5
              Top = 60
              Width = 44
              Height = 16
              Caption = 'Ent'#234'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label12: TLabel
              Left = 367
              Top = 33
              Width = 91
              Height = 16
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label34: TLabel
              Left = 396
              Top = 218
              Width = 73
              Height = 16
              Caption = 'Sa s'#233'curit'#233' :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label35: TLabel
              Left = 5
              Top = 183
              Width = 31
              Height = 16
              Caption = 'Mail :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label36: TLabel
              Left = 5
              Top = 217
              Width = 82
              Height = 16
              Caption = 'Serveur h'#244'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label37: TLabel
              Left = 5
              Top = 302
              Width = 65
              Height = 16
              Caption = 'Utilisateur :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label38: TLabel
              Left = 396
              Top = 302
              Width = 88
              Height = 16
              Caption = 'Mot de passe :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label39: TLabel
              Left = 399
              Top = 336
              Width = 98
              Height = 16
              Caption = 'Mot de passe 2 :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label40: TLabel
              Left = 5
              Top = 251
              Width = 96
              Height = 16
              Caption = 'Port du serveur :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label41: TLabel
              Left = 396
              Top = 183
              Width = 44
              Height = 16
              Caption = 'Auteur :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label42: TLabel
              Left = 396
              Top = 252
              Width = 86
              Height = 16
              Caption = 'Outil de mails :'
              Color = clBtnFace
              ParentColor = False
            end
            object me_ContactHead: TMemo
              Left = 5
              Top = 80
              Width = 765
              Height = 91
              ParentColor = True
              TabOrder = 0
            end
            object ch_genContact: TJvXPCheckbox
              Left = 5
              Top = 31
              Width = 326
              Height = 21
              Caption = 'G'#233'n'#233'rer la fiche de contact'
              TabOrder = 1
              Checked = True
              State = cbChecked
            end
            object ed_ContactName: TEdit
              Left = 495
              Top = 28
              Width = 275
              Height = 24
              ParentColor = True
              TabOrder = 2
              Text = 'Contact'
            end
            object cb_ContactSecurity: TComboBox
              Left = 514
              Top = 208
              Width = 256
              Height = 24
              Color = clBtnFace
              ItemHeight = 16
              ItemIndex = 0
              TabOrder = 3
              Text = 'ssl'
              Items.Strings = (
                'ssl')
            end
            object ed_ContactMail: TEdit
              Left = 123
              Top = 178
              Width = 256
              Height = 24
              ParentColor = True
              TabOrder = 4
            end
            object ed_ContactHost: TEdit
              Left = 123
              Top = 212
              Width = 256
              Height = 24
              ParentColor = True
              TabOrder = 5
              Text = 'localhost'
            end
            object ed_ContactUser: TEdit
              Left = 123
              Top = 297
              Width = 256
              Height = 24
              ParentColor = True
              TabOrder = 6
            end
            object ed_ContactPassword: TEdit
              Left = 514
              Top = 297
              Width = 256
              Height = 24
              ParentColor = True
              PasswordChar = '*'
              TabOrder = 7
            end
            object ch_ContactIdentify: TJvXPCheckbox
              Left = 5
              Top = 277
              Width = 287
              Height = 21
              Caption = 'S'#39'identifier sur ce serveur :'
              TabOrder = 8
              Checked = True
              State = cbChecked
            end
            object ed_ContactPassword2: TEdit
              Left = 514
              Top = 331
              Width = 256
              Height = 24
              ParentColor = True
              PasswordChar = '*'
              TabOrder = 9
            end
            object se_ContactPort: TSpinEdit
              Left = 123
              Top = 247
              Width = 259
              Height = 26
              MaxValue = 65536
              MinValue = 0
              TabOrder = 10
              Value = 25
            end
            object ed_ContactAuthor: TEdit
              Left = 514
              Top = 178
              Width = 256
              Height = 24
              ParentColor = True
              TabOrder = 11
            end
            object cb_ContactTool: TComboBox
              Left = 514
              Top = 244
              Width = 256
              Height = 24
              Color = clBtnFace
              ItemHeight = 16
              ItemIndex = 0
              TabOrder = 12
              Text = 'qmail'
              Items.Strings = (
                'qmail'
                'sendmail'
                'mail')
            end
          end
        end
        object ts_jobs: TTabSheet
          Caption = 'M'#233'tiers'
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 772
            Height = 388
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label48: TLabel
              Left = 5
              Top = 31
              Width = 44
              Height = 16
              Caption = 'Ent'#234'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label49: TLabel
              Left = 369
              Top = 6
              Width = 91
              Height = 16
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object ch_genjobs: TJvXPCheckbox
              Left = 5
              Top = 7
              Width = 354
              Height = 21
              Caption = 'G'#233'n'#233'rer les statistiques sur les professions'
              TabOrder = 0
              Checked = True
              State = cbChecked
            end
            object me_HeadJobs: TMemo
              Left = 5
              Top = 50
              Width = 765
              Height = 92
              ParentColor = True
              TabOrder = 1
            end
            object ed_JobsName: TEdit
              Left = 497
              Top = 1
              Width = 276
              Height = 24
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
            Width = 772
            Height = 388
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label46: TLabel
              Left = 5
              Top = 31
              Width = 44
              Height = 16
              Caption = 'Ent'#234'te :'
              Color = clBtnFace
              ParentColor = False
            end
            object Label47: TLabel
              Left = 369
              Top = 6
              Width = 91
              Height = 16
              Caption = 'Nom du fichier :'
              Color = clBtnFace
              ParentColor = False
            end
            object ch_genages: TJvXPCheckbox
              Left = 5
              Top = 7
              Width = 354
              Height = 21
              Caption = 'G'#233'n'#233'rer les statistiques sur les '#226'ges'
              TabOrder = 0
              Checked = True
              State = cbChecked
            end
            object me_HeadAges: TMemo
              Left = 5
              Top = 50
              Width = 765
              Height = 92
              ParentColor = True
              TabOrder = 1
            end
            object ed_AgesName: TEdit
              Left = 497
              Top = 1
              Width = 276
              Height = 24
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
        Width = 780
        Height = 419
        Align = alClient
        TabOrder = 0
        object Label19: TLabel
          Left = 21
          Top = 43
          Width = 549
          Height = 16
          Caption = 
            'Le plugin AncestroWeb GPL permet de cr'#233'er un site Web sur Ancest' +
            'rologie et Freelogy GPL.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label20: TLabel
          Left = 21
          Top = 65
          Width = 507
          Height = 16
          Caption = 
            'La licence GPL est libre et permet '#224' Matthieu GIROUX, l'#39'auteur, ' +
            'de donner son logiciel.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label21: TLabel
          Left = 21
          Top = 85
          Width = 607
          Height = 16
          Caption = 
            'Une licence libre vous permet de participer au projet, mais elle' +
            ' demande de donner votre participation.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label22: TLabel
          Left = 21
          Top = 4
          Width = 272
          Height = 29
          Caption = 'AncestroWeb et Freelogy'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label23: TLabel
          Left = 22
          Top = 112
          Width = 192
          Height = 29
          Caption = 'Site Web Statique'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label24: TLabel
          Left = 22
          Top = 151
          Width = 619
          Height = 16
          Caption = 
            'Cr'#233'er un site web statique vous permet de gagner en rapidit'#233' sur' +
            ' les serveurs web gratuits sans publicit'#233'.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label25: TLabel
          Left = 22
          Top = 174
          Width = 587
          Height = 16
          Caption = 
            'Par contre un site web statique n'#233'cessite l'#39'utilsation r'#233'guli'#232're' +
            ' d'#39'un client FTP gratuit comme Filezilla.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label26: TLabel
          Left = 21
          Top = 209
          Width = 610
          Height = 16
          Caption = 
            'Des h'#233'bergeurs gratuits comme Free et son abonnement t'#233'l'#233'phone g' +
            'ratuit, vous permettent de diffuser.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label27: TLabel
          Left = 21
          Top = 226
          Width = 615
          Height = 16
          Caption = 
            'Pour diffuser le site web n'#39'est pas suffisant. T'#233'l'#233'chargez vos d' +
            'ocuments '#224' diffuser dans une zone priv'#233'e.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label28: TLabel
          Left = 22
          Top = 190
          Width = 531
          Height = 16
          Caption = 
            'Comme votre site web est '#224' 2 endroits, il est sauvegard'#233'. Cela p' +
            'ermet d'#39#234'tre ind'#233'pendant.'
          Color = clBtnFace
          ParentColor = False
        end
        object JvXPButton1: TJvXPButton
          Left = 271
          Top = 293
          Width = 216
          Height = 39
          Caption = 'Composition de l'#39'application'
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -15
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
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'KLE_DOSSIER'
        ParamType = ptInput
      end>
  end
  object ds_Individu: TDataSource
    DataSet = IBQ_Individu
    Left = 440
    Top = 272
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
    SaveEdits = [feTEdit, feTCheck, feTComboValue, feTDirectoryEdit, feTFileNameEdit, feTGrid, feTMemo, feTPageControl, feTRadio, feTRadioGroup, feTSpinEdit]
    SaveForm = [sfSavePos, sfSaveSizes]
    Options = [loAutoUpdate, loAutoWrite]
    OnIniLoad = OnFormInfoIniIniLoad
    OnIniWrite = OnFormInfoIniIniWrite
    Left = 392
    Top = 184
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
