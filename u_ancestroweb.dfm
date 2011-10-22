object F_AncestroWeb: TF_AncestroWeb
  Left = 520
  Top = 325
  BorderIcons = []
  Caption = 'AncestroWeb : -'#160'G'#233'n'#233'rer un Site Web G'#233'n'#233'alogique Statique'
  ClientHeight = 400
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
    Top = 370
    Width = 640
    Height = 30
    Align = alBottom
    TabOrder = 0
    object lb_Comments: TLabel
      Left = 384
      Top = 6
      Width = 3
      Height = 13
      Color = clBtnFace
      ParentColor = False
    end
    object pb_ProgressInd: TProgressBar
      Left = 144
      Top = 1
      Width = 231
      Height = 28
      Align = alLeft
      TabOrder = 0
    end
    object pb_ProgressAll: TProgressBar
      Left = 1
      Top = 1
      Width = 143
      Height = 28
      Align = alLeft
      TabOrder = 1
    end
    object FWClose1: TFWClose
      Left = 552
      Top = 6
      Caption = 'Fermer'
      TabOrder = 2
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 640
    Height = 370
    ActivePage = ts_Gen
    Align = alClient
    TabOrder = 1
    object ts_Gen: TTabSheet
      Caption = 'G'#233'n'#233'rer'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 342
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 297
          Top = 0
          Width = 5
          Height = 342
          ExplicitLeft = 275
          ExplicitHeight = 339
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 297
          Height = 342
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 6
            Top = 8
            Width = 215
            Height = 13
            Caption = 'R'#233'pertoire du site web g'#233'n'#233'alogique '#224' cr'#233'er :'
            Color = clBtnFace
            ParentColor = False
          end
          object Label7: TLabel
            Left = 11
            Top = 54
            Width = 39
            Height = 13
            Caption = 'Th'#232'me :'
            Color = clBtnFace
            ParentColor = False
          end
          object Label9: TLabel
            Left = 11
            Top = 110
            Width = 53
            Height = 13
            Caption = 'GEDCOM :'
            Color = clBtnFace
            ParentColor = False
          end
          object Label6: TLabel
            Left = 6
            Top = 131
            Width = 120
            Height = 13
            Caption = 'En bas de chaque page :'
            Color = clBtnFace
            ParentColor = False
          end
          object Label44: TLabel
            Left = 11
            Top = 80
            Width = 45
            Height = 13
            Caption = 'Sources :'
            Color = clBtnFace
            ParentColor = False
          end
          object de_ExportWeb: TDirectoryEdit
            Left = 6
            Top = 27
            Width = 263
            Height = 21
            OnAfterDialog = de_ExportWebAcceptDirectory
            NumGlyphs = 1
            ButtonWidth = 23
            TabOrder = 0
          end
          object cb_Themes: TComboBox
            Left = 70
            Top = 51
            Width = 199
            Height = 21
            ItemHeight = 13
            TabOrder = 1
            Text = 'default'
          end
          object GedcomEdit: TFilenameEdit
            Left = 70
            Top = 104
            Width = 173
            Height = 21
            FilterIndex = 0
            DialogOptions = []
            ButtonWidth = 23
            NumGlyphs = 1
            TabOrder = 2
          end
          object FWEraseGedcom: TFWErase
            Left = 249
            Top = 104
            Width = 20
            TabOrder = 3
            OnClick = FWEraseImage2Click
          end
          object me_Bottom: TMemo
            Left = 6
            Top = 146
            Width = 263
            Height = 74
            TabOrder = 4
          end
          object cb_Files: TComboBox
            Left = 70
            Top = 77
            Width = 199
            Height = 21
            ItemHeight = 13
            TabOrder = 5
            Text = 'default'
          end
        end
        object Panel4: TPanel
          Left = 302
          Top = 0
          Width = 330
          Height = 342
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter2: TSplitter
            Left = 0
            Top = 259
            Width = 330
            Height = 5
            Cursor = crVSplit
            Align = alBottom
            ExplicitTop = 188
            ExplicitWidth = 356
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 330
            Height = 259
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBGrid1: TDBGrid
              Left = 0
              Top = 43
              Width = 330
              Height = 216
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
                  Width = 195
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
                  Title.Caption = 'D'#233'c'#195#168's'
                  Width = 40
                  Visible = True
                end>
            end
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 330
              Height = 43
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object ch_ancestors: TJvXPCheckbox
                Left = 7
                Top = 27
                Width = 159
                Height = 17
                Caption = 'Ascendance'
                TabOrder = 0
                Checked = True
                State = cbChecked
              end
              object ch_Filtered: TJvXPCheckbox
                Left = 7
                Top = 3
                Width = 344
                Height = 17
                Caption = 'Filtrer par l'#39'individu :'
                TabOrder = 1
                OnClick = ch_FilteredClick
              end
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 264
            Width = 330
            Height = 78
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Label43: TLabel
              Left = 6
              Top = 5
              Width = 44
              Height = 13
              Caption = 'Importer :'
              Color = clBtnFace
              ParentColor = False
            end
            object bt_gen: TFWSaveAs
              Left = 246
              Top = 55
              Caption = 'G'#233'n'#233'rer'
              TabOrder = 3
              OnClick = bt_genClick
            end
            object fne_Export: TFilenameEdit
              Left = 85
              Top = 28
              Width = 240
              Height = 21
              FilterIndex = 0
              DialogOptions = [ofCreatePrompt]
              ButtonWidth = 23
              NumGlyphs = 1
              TabOrder = 0
            end
            object fne_import: TFilenameEdit
              Left = 84
              Top = 4
              Width = 241
              Height = 21
              OnAfterDialog = de_ExportWebAcceptDirectory
              FilterIndex = 0
              DialogOptions = [ofFileMustExist]
              ButtonWidth = 23
              NumGlyphs = 1
              TabOrder = 1
            end
            object bt_export: TFWSaveAs
              Left = 4
              Top = 28
              Caption = 'Exporter'
              TabOrder = 2
              OnClick = bt_exportClick
            end
          end
        end
      end
    end
    object ts_Home: TTabSheet
      Caption = 'Accueil'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 342
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label2: TLabel
          Left = 6
          Top = 7
          Width = 37
          Height = 13
          Caption = 'Auteur :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label3: TLabel
          Left = 6
          Top = 27
          Width = 59
          Height = 13
          Caption = 'Description :'
          Color = clBtnFace
          ParentColor = False
        end
        object ExtImage1: TExtImage
          Left = 6
          Top = 163
          Width = 200
          Height = 170
          Center = True
          Proportional = True
        end
        object ExtImage2: TExtImage
          Left = 214
          Top = 163
          Width = 200
          Height = 170
          Center = True
          Proportional = True
        end
        object ExtImage3: TExtImage
          Left = 422
          Top = 163
          Width = 200
          Height = 170
          Center = True
          Proportional = True
        end
        object lb_Images: TLabel
          Left = 6
          Top = 147
          Width = 40
          Height = 13
          Caption = 'Images :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label10: TLabel
          Left = 302
          Top = 7
          Width = 74
          Height = 13
          Caption = 'Nom du fichier :'
          Color = clBtnFace
          ParentColor = False
        end
        object ed_Author: TEdit
          Left = 62
          Top = 3
          Width = 224
          Height = 21
          TabOrder = 0
        end
        object me_Description: TMemo
          Left = 6
          Top = 43
          Width = 622
          Height = 74
          TabOrder = 1
        end
        object ImageEdit1: TFilenameEdit
          Left = 62
          Top = 139
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
          Left = 214
          Top = 138
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
          Left = 422
          Top = 139
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
          Left = 186
          Top = 139
          Width = 20
          TabOrder = 5
          OnClick = FWEraseImageClick
        end
        object FWEraseImage2: TFWErase
          Left = 394
          Top = 139
          Width = 20
          TabOrder = 6
          OnClick = FWEraseImage2Click
        end
        object FWEraseImage3: TFWErase
          Left = 602
          Top = 138
          Width = 20
          TabOrder = 7
          OnClick = FWEraseImage3Click
        end
        object ed_IndexName: TEdit
          Left = 406
          Top = 3
          Width = 224
          Height = 21
          TabOrder = 8
          Text = 'Index'
        end
      end
    end
    object ts_Files: TTabSheet
      Caption = 'Fiches'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 342
        Align = alClient
        TabOrder = 0
        object Label13: TLabel
          Left = 246
          Top = 8
          Width = 129
          Height = 13
          Caption = 'Nom du d'#233'but des fichiers :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label14: TLabel
          Left = 6
          Top = 31
          Width = 59
          Height = 13
          Caption = 'Description :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label31: TLabel
          Left = 213
          Top = 31
          Width = 155
          Height = 13
          Caption = 'Nom du d'#233'but des fichiers listes :'
          Color = clBtnFace
          ParentColor = False
        end
        object ed_FileBeginName: TEdit
          Left = 406
          Top = 3
          Width = 224
          Height = 21
          TabOrder = 0
          Text = 'Files'
        end
        object me_FilesHead: TMemo
          Left = 6
          Top = 51
          Width = 622
          Height = 74
          TabOrder = 1
        end
        object ch_Images: TJvXPCheckbox
          Left = 6
          Top = 131
          Width = 161
          Height = 17
          Caption = 'Joindre les images'
          TabOrder = 2
          Checked = True
          State = cbChecked
        end
        object ed_ListsBeginName: TEdit
          Left = 406
          Top = 27
          Width = 224
          Height = 21
          TabOrder = 3
          Text = 'List'
        end
        object ch_Comptage: TJvXPCheckbox
          Left = 6
          Top = 154
          Width = 227
          Height = 17
          Caption = 'Joindre le comptage des diff'#233'rents individus'
          TabOrder = 4
          Checked = True
          State = cbChecked
        end
      end
    end
    object ts_tree: TTabSheet
      Caption = 'Arbre'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 342
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label8: TLabel
          Left = 6
          Top = 27
          Width = 37
          Height = 13
          Caption = 'Ent'#234'te :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label11: TLabel
          Left = 302
          Top = 7
          Width = 74
          Height = 13
          Caption = 'Nom du fichier :'
          Color = clBtnFace
          ParentColor = False
        end
        object ch_genTree: TJvXPCheckbox
          Left = 6
          Top = 8
          Width = 161
          Height = 17
          Caption = 'G'#233'n'#233'rer l'#39'arbre'
          TabOrder = 0
          Checked = True
          State = cbChecked
        end
        object me_HeadTree: TMemo
          Left = 6
          Top = 43
          Width = 622
          Height = 74
          TabOrder = 1
        end
        object ed_TreeName: TEdit
          Left = 406
          Top = 3
          Width = 224
          Height = 21
          TabOrder = 2
          Text = 'Tree'
        end
      end
    end
    object ts_Names: TTabSheet
      Caption = 'Patronymes'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 342
        Align = alClient
        TabOrder = 0
        object Label29: TLabel
          Left = 254
          Top = 7
          Width = 119
          Height = 13
          Caption = 'Nom du d'#233'but du fichier :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label30: TLabel
          Left = 6
          Top = 27
          Width = 59
          Height = 13
          Caption = 'Description :'
          Color = clBtnFace
          ParentColor = False
        end
        object ch_genNames: TJvXPCheckbox
          Left = 6
          Top = 8
          Width = 161
          Height = 17
          Caption = 'G'#233'n'#233'rer les patronymes'
          TabOrder = 0
          Checked = True
          State = cbChecked
        end
        object ed_NamesFileName: TEdit
          Left = 406
          Top = 3
          Width = 224
          Height = 21
          TabOrder = 1
          Text = 'Names'
        end
        object me_NamesHead: TMemo
          Left = 6
          Top = 43
          Width = 622
          Height = 74
          TabOrder = 2
        end
      end
    end
    object ts_Referring: TTabSheet
      Caption = 'Recherche'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 342
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label15: TLabel
          Left = 6
          Top = 3
          Width = 492
          Height = 13
          Caption = 
            'Cette fiche g'#233'n'#232're une recherche, qui fontionne 1 mois apr'#232's avo' +
            'ir inscrit votre site sur un site r'#233'f'#233'renc'#233'.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label16: TLabel
          Left = 300
          Top = 29
          Width = 74
          Height = 13
          Caption = 'Nom du fichier :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label17: TLabel
          Left = 6
          Top = 51
          Width = 37
          Height = 13
          Caption = 'Ent'#234'te :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label18: TLabel
          Left = 6
          Top = 151
          Width = 301
          Height = 13
          Caption = 'Domaine de votre site web (compte et fin d'#39'adresse h'#233'bergeur) :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label32: TLabel
          Left = 270
          Top = 179
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
          Left = 6
          Top = 179
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
        object ch_genSearch: TJvXPCheckbox
          Left = 6
          Top = 27
          Width = 161
          Height = 17
          Caption = 'G'#233'n'#233'rer la recherche'
          TabOrder = 0
        end
        object ed_SearchName: TEdit
          Left = 404
          Top = 25
          Width = 224
          Height = 21
          TabOrder = 1
          Text = 'Recherche'
        end
        object me_searchHead: TMemo
          Left = 6
          Top = 67
          Width = 622
          Height = 74
          TabOrder = 2
        end
        object ed_SearchSite: TEdit
          Left = 382
          Top = 147
          Width = 248
          Height = 21
          TabOrder = 3
        end
        object ed_SearchTool: TEdit
          Left = 382
          Top = 175
          Width = 248
          Height = 21
          TabOrder = 4
          Text = 'http://www.google.fr/search'
        end
        object ed_SearchQuery: TEdit
          Left = 142
          Top = 175
          Width = 112
          Height = 21
          TabOrder = 5
          Text = 'q'
        end
      end
    end
    object ts_Contact: TTabSheet
      Caption = 'Contact'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 342
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          Left = 6
          Top = 3
          Width = 387
          Height = 13
          Caption = 
            'Cette fiche utilise le langage PHP, afin de cacher votre mail de' +
            's publicit'#233's du web.'
          Color = clBtnFace
          ParentColor = False
        end
        object Label5: TLabel
          Left = 6
          Top = 51
          Width = 37
          Height = 13
          Caption = 'Ent'#234'te :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label12: TLabel
          Left = 300
          Top = 29
          Width = 74
          Height = 13
          Caption = 'Nom du fichier :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label34: TLabel
          Left = 324
          Top = 179
          Width = 59
          Height = 13
          Caption = 'Sa s'#233'curit'#233' :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label35: TLabel
          Left = 6
          Top = 151
          Width = 25
          Height = 13
          Caption = 'Mail :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label36: TLabel
          Left = 6
          Top = 178
          Width = 67
          Height = 13
          Caption = 'Serveur h'#244'te :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label37: TLabel
          Left = 6
          Top = 247
          Width = 52
          Height = 13
          Caption = 'Utilisateur :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label38: TLabel
          Left = 324
          Top = 247
          Width = 70
          Height = 13
          Caption = 'Mot de passe :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label39: TLabel
          Left = 326
          Top = 275
          Width = 79
          Height = 13
          Caption = 'Mot de passe 2 :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label40: TLabel
          Left = 6
          Top = 206
          Width = 78
          Height = 13
          Caption = 'Port du serveur :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label41: TLabel
          Left = 324
          Top = 151
          Width = 37
          Height = 13
          Caption = 'Auteur :'
          Color = clBtnFace
          ParentColor = False
        end
        object Label42: TLabel
          Left = 324
          Top = 207
          Width = 68
          Height = 13
          Caption = 'Outil de mails :'
          Color = clBtnFace
          ParentColor = False
        end
        object me_ContactHead: TMemo
          Left = 6
          Top = 67
          Width = 622
          Height = 74
          TabOrder = 0
        end
        object ch_genContact: TJvXPCheckbox
          Left = 6
          Top = 27
          Width = 233
          Height = 17
          Caption = 'G'#233'n'#233'rer la fiche de contact'
          TabOrder = 1
          Checked = True
          State = cbChecked
        end
        object ed_ContactName: TEdit
          Left = 404
          Top = 25
          Width = 224
          Height = 21
          TabOrder = 2
          Text = 'Contact'
        end
        object cb_ContactSecurity: TComboBox
          Left = 420
          Top = 171
          Width = 208
          Height = 21
          ItemHeight = 0
          ItemIndex = 0
          TabOrder = 3
          Text = 'ssl'
          Items.Strings = (
            'ssl')
        end
        object ed_ContactMail: TEdit
          Left = 102
          Top = 147
          Width = 208
          Height = 21
          TabOrder = 4
          Text = '@'
        end
        object ed_ContactHost: TEdit
          Left = 102
          Top = 174
          Width = 208
          Height = 21
          TabOrder = 5
          Text = 'localhost'
        end
        object ed_ContactUser: TEdit
          Left = 102
          Top = 243
          Width = 208
          Height = 21
          TabOrder = 6
        end
        object ed_ContactPassword: TEdit
          Left = 420
          Top = 243
          Width = 208
          Height = 21
          PasswordChar = '*'
          TabOrder = 7
        end
        object ch_ContactIdentify: TJvXPCheckbox
          Left = 6
          Top = 227
          Width = 233
          Height = 17
          Caption = 'S'#39'identifier sur ce serveur :'
          TabOrder = 8
          Checked = True
          State = cbChecked
        end
        object ed_ContactPassword2: TEdit
          Left = 420
          Top = 271
          Width = 208
          Height = 21
          PasswordChar = '*'
          TabOrder = 9
        end
        object se_ContactPort: TSpinEdit
          Left = 102
          Top = 203
          Width = 90
          Height = 22
          MaxValue = 65536
          MinValue = 0
          TabOrder = 10
          Value = 25
        end
        object ed_ContactAuthor: TEdit
          Left = 420
          Top = 147
          Width = 208
          Height = 21
          TabOrder = 11
        end
        object cb_ContactTool: TComboBox
          Left = 420
          Top = 200
          Width = 208
          Height = 21
          ItemHeight = 0
          ItemIndex = 0
          TabOrder = 12
          Text = 'qmail'
          Items.Strings = (
            'qmail')
        end
      end
    end
    object ts_about: TTabSheet
      Caption = #192#160'propos'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pa_About: TScrollBox
        Left = 0
        Top = 0
        Width = 632
        Height = 342
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
          Width = 427
          Height = 13
          Caption = 
            'La licence GPL est libre et permettent '#224' Matthieu GIROUX, l'#39'aute' +
            'ur, de donner son logiciel.'
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
      end
    end
  end
  object OnFormInfoIni: TOnFormInfoIni
    AutoLoad = False
    SauvePosObjects = True
    SauveEditObjets = [feTEdit, feTCheck, feTComboValue, feTDirectoryEdit, feTFileNameEdit, feTMemo, feTPageControl, feTRadio, feTSpinEdit]
    Freeini = False
    Left = 544
    Top = 40
  end
  object IBQ_Individu: TIBQuery
    SQL.Strings = (
      
        'select  CLE_FICHE,NUM_SOSA,CLE_PERE,CLE_MERE,NOM,PRENOM,SEXE,ANN' +
        'EE_NAISSANCE,ANNEE_DECES from INDIVIDU WHERE KLE_DOSSIER=:KLE_DO' +
        'SSIER '
      'ORDER BY NOM,PRENOM,ANNEE_NAISSANCE DESC,ANNEE_DECES DESC')
    Left = 572
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'KLE_DOSSIER'
        ParamType = ptUnknown
      end>
  end
  object ds_Individu: TDataSource
    DataSet = IBQ_Individu
    Left = 472
    Top = 256
  end
  object FileCopy: TExtFileCopy
    Errors = 0
    OnFailure = FileCopyFailure
    Mask = '*'
    FileOptions = [cpCreateDestination]
    DoEraseDir = FileCopyDoEraseDir
    Left = 476
    Top = 104
  end
  object TraduceImage: TTraduceFile
    Errors = 0
    OnFailure = TraduceImageFailure
    TraduceOptions = [cpDestinationIsFile, cpCreateDestination]
    ResizeWidth = 200
    Left = 576
    Top = 104
  end
  object FileIniCopy: TExtFileCopy
    Errors = 0
    OnFailure = FileCopyFailure
    Mask = '*'
    FileOptions = [cpCreateDestination]
    DoEraseDir = FileCopyDoEraseDir
    Left = 472
    Top = 160
  end
end
