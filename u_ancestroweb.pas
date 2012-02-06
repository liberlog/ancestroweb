unit U_AncestroWeb;

{$IFDEF FPC}
  {$mode Delphi}{$H+}
{$ENDIF}

////////////////////////////////////////////////////////////////////////////////
// AncestroWeb
// Plugin libre de création d'un site web généalogique statique en HTML et PHP
// Pour Freelogy et Ancestrologie
// Licence : LGPL
// LIBERLOG 2011
// Auteur : Matthieu GIROUX
// Descriptions
// Création d'un arbre complet, d'une page de contact en PHP, de fiches, etc.
////////////////////////////////////////////////////////////////////////////////

interface

uses
{$ifdef unix}
  BaseUnix,
{$endif}

{$IFNDEF FPC}
  Mask,  rxToolEdit, JvExControls,  Windows,
{$ELSE}
  LCLIntf, LCLType, EditBtn,
{$ENDIF}
{$ifdef windows}
  Windows,
{$endif}
{$IFDEF WIN32}
  Registry,
{$ENDIF}
  U_DMWeb, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DB,
  IBQuery, DBCtrls, ExtCtrls, Buttons, ComCtrls, DBGrids,
  functions_html, JvXPCheckCtrls, Spin, FileUtil, U_OnFormInfoIni,
  U_ExtImage, u_buttons_appli, U_ExtFileCopy, u_traducefile,u_extabscopy,
  JvXPButtons;

type

  { TF_AncestroWeb }

  TF_AncestroWeb = class(TForm)
    btnSelectBase: TSpeedButton;
    bt_export: TFWSaveAs;
    cb_ContactTool: TComboBox;
    ch_ancestors: TJvXPCheckBox;
    ch_Filtered: TJvXPCheckBox;
    ch_ContactIdentify: TJvXPCheckbox;
    ch_genNames: TJvXPCheckbox;
    ch_genSearch: TJvXPCheckbox;
    ch_genages: TJvXPCheckbox;
    ch_Images: TJvXPCheckbox;
    ch_genTree: TJvXPCheckBox;
    cb_Themes: TComboBox;
    ch_genContact: TJvXPCheckbox;
    cb_ContactSecurity: TComboBox;
    ch_Comptage: TJvXPCheckbox;
    cbDossier: TComboBox;
    DBGrid1: TDBGrid;
    de_ExportWeb: TDirectoryEdit;
    ds_Individu: TDatasource;
    edNomBase: TComboBox;
    ed_Author: TEdit;
    ed_ContactMail: TEdit;
    ed_ContactHost: TEdit;
    ed_ContactAuthor: TEdit;
    ed_ContactPassword2: TEdit;
    ed_ContactUser: TEdit;
    ed_ContactPassword: TEdit;
    ed_ListsBeginName: TEdit;
    ed_NamesFileName: TEdit;
    ed_SearchName: TEdit;
    ed_IndexName: TEdit;
    ed_SearchSite: TEdit;
    ed_SearchTool: TEdit;
    ed_SearchQuery: TEdit;
    ed_TreeName: TEdit;
    ed_ContactName: TEdit;
    ed_FileBeginName: TEdit;
    ed_AgesName: TEdit;
    ExtImage1: TExtImage;
    ExtImage2: TExtImage;
    ExtImage3: TExtImage;
    FileCopy: TExtFileCopy;
    FileIniCopy: TExtFileCopy;
    fne_Export: TFileNameEdit;
    fne_import: TFileNameEdit;
    FWEraseImage: TFWErase;
    FWEraseImage3: TFWErase;
    FWEraseImage2: TFWErase;
    FWEraseGedcom: TJvXPButton;
    ImageEdit1: TFileNameEdit;
    ImageEdit2: TFileNameEdit;
    ImageEdit3: TFileNameEdit;
    FWClose1: TFWClose;
    bt_gen: TFWSaveAs;
    IBQ_Individu: TIBQuery;
    GedcomEdit: TFileNameEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    LabelBase: TLabel;
    lb_Comments: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lb_Images: TLabel;
    me_Description: TMemo;
    me_FilesHead: TMemo;
    me_HeadAges: TMemo;
    me_NamesHead: TMemo;
    me_ContactHead: TMemo;
    me_searchHead: TMemo;
    me_HeadTree: TMemo;
    OnFormInfoIni: TOnFormInfoIni;
    OpenDialog: TOpenDialog;
    Panel13: TPanel;
    PCPrincipal: TPageControl;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    pa_About: TScrollbox;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    pb_ProgressInd: TProgressBar;
    pb_ProgressAll: TProgressBar;
    se_ContactPort: TSpinEdit;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    spSkinPanel1: TPanel;
    TraduceImage: TTraduceFile;
    ts_Ages: TTabSheet;
    ts_Names: TTabSheet;
    ts_about: TTabSheet;
    ts_Referring: TTabSheet;
    ts_Files: TTabSheet;
    ts_Contact: TTabSheet;
    ts_Home: TTabSheet;
    ts_tree: TTabSheet;
    ts_Gen: TTabSheet;
    me_Bottom: TMemo;
    Label6: TLabel;
    cb_Files: TComboBox;
    Label44: TLabel;
    procedure btnSelectBaseClick(Sender: TObject);
    procedure bt_exportClick(Sender: TObject);
    procedure bt_genClick(Sender: TObject);
    procedure cbDossierChange(Sender: TObject);
    procedure ch_FilteredClick(Sender: TObject);
    procedure ch_genagesClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure de_ExportWebAcceptDirectory(Sender: TObject;{$IFDEF FPC} var Value: string{$ELSE} var Name: string;
    var Action: Boolean{$ENDIF});
    procedure edNomBaseExit(Sender: TObject);
    procedure FileCopyDoEraseDir(Sender: TObject; var Continue: boolean);
    procedure FileCopyFailure(Sender: TObject; const ErrorCode: integer;
      var ErrorMessage: string; var ContinueCopy: boolean);
    procedure fne_ExportAcceptFileName(Sender: TObject; var Value: String);
    procedure fne_importAcceptFileName(Sender: TObject; var Value: String);
    procedure FWEraseImage3Click(Sender: TObject);
    procedure FWEraseImage2Click(Sender: TObject);
    procedure FWEraseImageClick(Sender: TObject);
    procedure ImageEdit2AcceptFileName(Sender: TObject; var Value: string);
    procedure ImageEdit2Change(Sender: TObject);
    procedure ImageEdit3AcceptFileName(Sender: TObject; var Value: string);
    procedure ImageEdit3Change(Sender: TObject);
    procedure ImageEdit1AcceptFileName(Sender: TObject; var Value: string);
    procedure ImageEdit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TraduceImageFailure(Sender: TObject; const ErrorCode: integer;
      var ErrorMessage: string; var ContinueCopy: boolean);
  private
    { Déclarations privées }
    PremiereOuverture:boolean;
    procedure DoAfterInit;
    function DoOpenBase(sBase: string):boolean;
    function OuvreDossier(NumDossier:integer):boolean;
    function fb_getMediaFile ( const IBQ_Media : TIBQuery;
                               const as_FilePath: string): Boolean;
    function fb_OpenMedias( const ai_CleFiche: Longint;
                            const ai_Type: integer;
                            const ab_Identite: Boolean = False;
                            const ach_table : Char = MEDIAS_TABLE_ARCHIV): Boolean;
    function fi_ImageEditCount(const as_FileName: string): integer;
    function fs_AddImage(const as_ImageFile: string): string;
    function fs_AddImageTable(const as_HtmlImage: string; const as_alt: string=''
      ): string;
    function fs_AddPhoto( const ai_cleFiche: longint;
                          const as_FileAltName, as_ImagesDir: string ;
                          const ai_ResizeWidth : Integer = 180 ): string;
    function fs_CreatePrevNext ( const ai_PreviousNext: Longint;
                                 const as_PreviousNext: String=CST_PAGE_PREVIOUS;
                                 const as_Subdir: String='';
                                       as_BeginLinkFiles: String=CST_SUBDIR_HTML_FILES+'/'): String;
    function fs_getaltPhoto(const IBQ_IndividuFiltered: TIBQuery): String;
    function fs_getNameAndSurName(const ibq_Query: TIBQuery): String;
    function fs_GetTitleTree(const as_NameOfTree: String;
                             const ai_generations: Longint): String;
    procedure p_CopyStructure;
    procedure p_CreateAHtmlFile(const astl_Destination: TStringList;
      const as_BeginingFile, as_Describe, as_Title, as_LittleTitle, as_LongTitle: string;
      as_BottomHTML: string;
      const as_Subdir: string = '';
      const as_ExtFile: string = CST_EXTENSION_HTML;
      const as_BeforeHTML: string = '');
    function fi_CreateHTMLTree(const IBQ_Tree: TIBQuery;
      const astl_HTMLTree: TStrings;
      const ai_Clefiche: longint;
      const ab_Link: boolean = True;
      const ab_Progress: boolean = True;
      const ab_NotFirst: boolean = False;
      const as_IdSosa: string = IBQ_Tq_SOSA;
      const ab_Asc: boolean = True;
      const ai_Limit: longint = 0): longint;
    function fi_CreateSheets: integer;
    procedure p_createLettersSheets (var at_SheetsLetters : TAHTMLULTabSheet;
                                     const IBQ_FilesFiltered: TIBQuery;
                                     const ai_PerPage : Integer;
                                     const as_BeginFile : String);
    procedure p_genHtmlAges;
    procedure p_genHtmlFiles(const IBQ_FilesFiltered: TIBQuery);
    procedure p_genHtmlList(const IBQ_FilesFiltered: TIBQuery);
    procedure p_genHtmlNames(const IBQ_FilesFiltered: TIBQuery);
    procedure p_genHtmlSearch;
    procedure p_genPhpContact;
    procedure p_genHtmlHome;
    procedure p_genHTMLTitle;
    procedure p_genHTMLTree;
    procedure p_ImageEditChange(const aei_Image: TExtImage; const Sender: TObject);
    procedure p_ImageEditErase(const afne_EditImage: TFileNameEdit);
    procedure p_IncPrgressBar;
    procedure p_IncPrgressInd;
    procedure p_iniWriteKey;
    function fb_OpenTree(const AIBQ_Tree: TIBQuery; const ai_Cle: longint;
      const ai_Niveau: integer = 0;const ai_Sexe: integer = 0): boolean;
    procedure p_Setcomments(const as_Comment: String);
    function ChaineUTF8EnNomVariable(Chaine:String):String;
    procedure ListerDossiers;
  public
    { Déclarations publiques }
    procedure DoInit(sBase: string);
  end;

var
  F_AncestroWeb: TF_AncestroWeb;
  gs_HTMLTitle: string = '';
  gb_EraseExport: boolean = True;
  gb_Generate : boolean = False;
  gi_CleFiche: integer = 0;
  gs_LinkGedcom: string;
  gt_SheetsLetters: TAHTMLULTabSheet;


implementation

uses  fonctions_init,
  functions_html_tree,
  IniFiles,IBSQL,
{$IFNDEF FPC}
  AncestroWeb_strings_delphi,
  fonctions_system, windirs,
{$ELSE}
  AncestroWeb_strings,UniqueInstanceRaw,
{$ENDIF}
{$IFDEF WIN32}
//  windirs,
{$ENDIF}
  fonctions_string,
  fonctions_languages,
  fonctions_images,
  fonctions_file;

{$IFNDEF FPC}
  {$R *.dfm}

{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TF_AncestroWeb.FormDestroy(Sender: TObject);
begin
  if Assigned(DMWeb)then
    DMWeb.Free;
end;

procedure TF_AncestroWeb.DBGrid1CellClick(Column: TColumn);
begin
  fCleFiche := IBQ_Individu.FieldByName(IBQ_CLE_FICHE).AsInteger;
  p_iniWriteKey;
end;

procedure TF_AncestroWeb.p_iniWriteKey;
begin
  p_IniWriteSectionInt(CST_INI_ANCESTROWEB_SECTION, IBQ_CLE_FICHE, fCleFiche);
end;

procedure TF_AncestroWeb.de_ExportWebAcceptDirectory(Sender: TObject;
 {$IFDEF FPC} var Value: string{$ELSE} var Name: string;
    var Action: Boolean{$ENDIF});
begin
  gb_EraseExport := False;
end;

procedure TF_AncestroWeb.edNomBaseExit(Sender: TObject);
var
  NumDossier:Integer;
begin
  if (edNomBase.Caption<>'')
  and ((edNomBase.Caption<>DMWeb.ibd_BASE.DatabaseName) or (DMWeb.ibd_BASE.Connected=false)) then
    if DoOpenBase(edNomBase.Caption) then
    begin
      NumDossier:=StrToInt(trim(copy(cbDossier.Caption,1,2)));
      if OuvreDossier(NumDossier) then
      begin
       fNom_Dossier:=fs_getCorrectString(copy(cbDossier.Caption,5,250));
       DoAfterInit;
      end;
    end;
end;

procedure TF_AncestroWeb.FileCopyDoEraseDir(Sender: TObject; var Continue: boolean);
begin
  Continue := gb_EraseExport or
    (MessageDlg({$IFDEF FPC}CST_AncestroWeb_WithLicense,{$ENDIF}
    fs_getCorrectString ( gs_AnceSTROWEB_DoEraseOldExport ) +
    FileCopy.Destination + ' ?', mtWarning, [mbYes,mbNo], 0) = mrYes);
end;

procedure TF_AncestroWeb.FileCopyFailure(Sender: TObject;
  const ErrorCode: integer; var ErrorMessage: string; var ContinueCopy: boolean);
begin
  ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_ExportErrorCreate ) + FileCopy.Source + CST_ENDOFLINE + ErrorMessage);
  Abort;
end;

procedure TF_AncestroWeb.fne_ExportAcceptFileName(Sender: TObject;
  var Value: String);
begin
  bt_exportClick(bt_export);
end;

procedure TF_AncestroWeb.fne_importAcceptFileName(Sender: TObject;
  var Value: String);
var ls_FileImport : String;
begin
  ls_FileImport := {$IFDEF FPC}Value{$ELSE}fne_import.Text{$ENDIF};
  if not DirectoryExistsUTF8(ls_FileImport) { *Converted from DirectoryExists*  }
    and FileExistsUTF8(ls_FileImport) { *Converted from FileExists*  } Then
  Begin
    FIniFile.Free;
    FIniFile:=nil;
    try
      FIniFile:=TIniFile.Create(ls_FileImport);
      DoAfterInit;
      FIniFile.Free;
      FIniFile:=nil;
      f_GetMainMemIniFile(nil,nil,nil,CST_AncestroWeb);
      OnFormInfoIni.p_ExecuteEcriture(Self);
    Except
      On E:Exception do
        ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantOpenFile ) +CST_ENDOFLINE+e.Message);
    end;
  end;
end;

procedure TF_AncestroWeb.FWEraseImage3Click(Sender: TObject);
begin
  p_ImageEditErase(ImageEdit3);
end;

procedure TF_AncestroWeb.FWEraseImage2Click(Sender: TObject);
begin
  p_ImageEditErase(ImageEdit2);
end;

procedure TF_AncestroWeb.FWEraseImageClick(Sender: TObject);
begin
  p_ImageEditErase(ImageEdit1);
end;

procedure TF_AncestroWeb.ImageEdit2AcceptFileName(Sender: TObject; var Value: string);
begin
  p_IniWriteSectionStr(CST_INI_ANCESTROWEB_SECTION, CST_INI_ANCESTROWEB_Image +
    '2', ImageEdit2.FileName);

end;

procedure TF_AncestroWeb.ImageEdit2Change(Sender: TObject);
begin
  p_ImageEditChange(ExtImage2, Sender);

end;

procedure TF_AncestroWeb.ImageEdit3AcceptFileName(Sender: TObject; var Value: string);
begin
  p_IniWriteSectionStr(CST_INI_ANCESTROWEB_SECTION, CST_INI_ANCESTROWEB_Image +
    '3', ImageEdit3.FileName);
end;

procedure TF_AncestroWeb.ImageEdit3Change(Sender: TObject);
begin
  p_ImageEditChange(ExtImage3, Sender);

end;

procedure TF_AncestroWeb.ImageEdit1AcceptFileName(Sender: TObject; var Value: string);
begin
  p_IniWriteSectionStr(CST_INI_ANCESTROWEB_SECTION, CST_INI_ANCESTROWEB_Image +
    '1', ImageEdit1.FileName);
end;

procedure TF_AncestroWeb.ImageEdit1Change(Sender: TObject);
begin
  p_ImageEditChange(ExtImage1, Sender);
end;

procedure TF_AncestroWeb.p_ImageEditChange(const aei_Image: TExtImage;
  const Sender: TObject);
var
  ls_FileName: string;
begin
  ls_FileName := (Sender as TFileNameEdit).FileName;
  if not DirectoryExistsUTF8(ls_FileName) { *Converted from DirectoryExists*  } and FileExistsUTF8(ls_FileName) { *Converted from FileExists*  } then
    aei_Image.LoadFromFile(ls_FileName)
  else
    aei_Image.Picture.Assign(nil);
end;

function TF_AncestroWeb.fi_ImageEditCount(const as_FileName: string): integer;
begin
  if not DirectoryExistsUTF8(as_FileName) { *Converted from DirectoryExists*  } and FileExistsUTF8(as_FileName) { *Converted from FileExists*  } then
    Result := 1
  else
    Result := 0;
end;

procedure TF_AncestroWeb.p_ImageEditErase(const afne_EditImage: TFileNameEdit);
begin
  afne_EditImage.FileName := '';
end;

procedure TF_AncestroWeb.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  p_FreeProperties;
  p_FreeKeyWords;
end;

procedure TF_AncestroWeb.bt_genClick(Sender: TObject);
begin
  if length(FileCopy.Destination) < 6 then
  begin
    ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_ExportMoreThan5Chars));
    Exit;
  end;
  if (cb_Files.Items.Count = 0) then
  begin
    ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_ErrorFiles ) + gs_Root + CST_SUBDIR_SOURCES);
    Abort;
  end;
  if (cb_Files.ItemIndex = -1) then
    cb_Files.ItemIndex := 0;
  gs_html_source_file := CST_SUBDIR_SOURCES+DirectorySeparator+cb_files.Items[cb_files.ItemIndex]+DirectorySeparator;
  if not fb_LoadProperties(gs_Root + gs_html_source_file,
    LowerCase(CST_AncestroWeb), gs_Lang, True)
  or IBQ_Individu.IsEmpty
  or gb_Generate then
    Exit;

  gb_Generate := True;
  IBQ_Individu.DisableControls;
  pb_ProgressAll.Position := 0;
  pb_ProgressInd.Position := 0;
  pb_ProgressAll.Max := CST_PROGRESS_COUNTER_COPY + CST_PROGRESS_COUNTER_TITLE + fi_CreateSheets;

  try
    p_CopyStructure;
    p_genHTMLTitle;
    p_genHtmlHome;
    if ch_Filtered.Checked then
    begin
      if fb_OpenTree(DmWeb.IBQ_TreeByNames, gi_CleFiche) then
        p_createLettersSheets( gt_SheetsLetters, DmWeb.IBQ_TreeByNames, gi_FilesPerPage, ed_FileBeginName.Text);
    end
    else
      p_createLettersSheets( gt_SheetsLetters, IBQ_Individu, gi_FilesPerPage, ed_FileBeginName.Text);

    if ch_genTree.Checked then
      p_genHTMLTree;
    if ch_genages.Checked then
      p_genHtmlAges;
    if ch_genSearch.Checked then
      p_genHtmlSearch;
    if ch_Filtered.Checked
    then p_genHtmlFiles(DmWeb.IBQ_TreeByNames)
    else p_genHtmlFiles(IBQ_Individu);

    if ch_genNames.Checked then
    begin
      if ch_Filtered.Checked
      then
       Begin
         if fb_OpenTree(DmWeb.IBQ_TreeNames, gi_CleFiche) Then
           p_genHtmlNames(DmWeb.IBQ_TreeNames);
       end
      else
       Begin
         DmWeb.IBQ_Names.Close;
         DmWeb.IBQ_Names.ParamByName(I_DOSSIER).AsInteger:=fCleDossier;
         DmWeb.IBQ_Names.Open;
         p_genHtmlNames(DmWeb.IBQ_Names);

       end;
    end;
    if ch_genContact.Checked then
      p_genPhpContact;
  finally
    gb_Generate := False;
    p_Setcomments (( gs_AnceSTROWEB_Finished ));
    IBQ_Individu.Locate(IBQ_CLE_FICHE, gi_CleFiche, []);
    IBQ_Individu.EnableControls;
  end;
end;

procedure TF_AncestroWeb.cbDossierChange(Sender: TObject);
var
  NumDossier:integer;
begin
  NumDossier:=StrToInt(trim(copy(cbDossier.Caption,1,2)));
  if NumDossier<>fCleDossier then
    if OuvreDossier(NumDossier) then
    begin
      fNom_Dossier:=fs_getCorrectString(copy(cbDossier.Caption,5,250));
      DoAfterInit;
    end;
end;

procedure TF_AncestroWeb.bt_exportClick(Sender: TObject);
begin
  f_GetMainMemIniFile(nil,nil,nil,CST_AncestroWeb);
  if fb_iniWriteFile(FIniFile,True)
   Then
     try
       FileIniCopy.Destination:=fne_Export.FileName;
       FileIniCopy.Source:=FIniFile.FileName;
       FileIniCopy.CopySourceToDestination;
     Except
       On E:Exception do
         ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantSaveFile )+CST_ENDOFLINE+e.Message);
     end;
end;

procedure TF_AncestroWeb.btnSelectBaseClick(Sender: TObject);
begin
  OpenDialog.FileName:='';
  //préparation de la boite mOpenDialog
  if DirectoryExistsUTF8(edNomBase.Text) then
  begin
    OpenDialog.InitialDir:=edNomBase.Text;
  end
  else
  begin
    if DirectoryExistsUTF8(ExtractFilePath(edNomBase.Text)) then
    begin
      OpenDialog.InitialDir:=ExtractFilePath(edNomBase.Text);
      if FileExistsUTF8(edNomBase.Text) then
        OpenDialog.FileName:=edNomBase.Text;
    end;
  end;

  if OpenDialog.Execute then
  begin
    edNomBase.Text:=OpenDialog.FileName;
  end;
end;

procedure TF_AncestroWeb.ch_FilteredClick(Sender: TObject);
begin
  p_iniWriteKey;
end;

procedure TF_AncestroWeb.ch_genagesClick(Sender: TObject);
begin

end;

function TF_AncestroWeb.fi_CreateSheets: integer;

  procedure p_setCorrectFileName(const aed_NameFile: TEdit;
  const as_NameFile: string);
  begin
    if aed_NameFile.Text = '' then
      aed_NameFile.Text := as_NameFile;
  end;

begin
  Result := CST_PROGRESS_COUNTER_HOME+fi_ImageEditCount(ImageEdit1.FileName)+fi_ImageEditCount(ImageEdit2.FileName)+fi_ImageEditCount(ImageEdit3.FileName);
  Finalize(gt_TabSheets);
  p_setCorrectFileName(ed_IndexName, CST_FILE_Home);
  p_AddTabSheet(gt_TabSheets, gs_AnceSTROWEB_Home, ed_IndexName.Text +
    CST_EXTENSION_HTML);
  if ch_genTree.Checked then
  begin
    Inc(Result, CST_PROGRESS_COUNTER_TREE);
    p_setCorrectFileName(ed_TreeName, CST_FILE_TREE);
    p_AddTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_FullTree ), CST_FILE_TREE +
      DirectorySeparator + ed_TreeName.Text + CST_EXTENSION_HTML);
  end;
  if ch_genNames.Checked then
  begin
    Inc(Result, CST_PROGRESS_COUNTER_NAMES);
    p_setCorrectFileName(ed_NamesFileName, CST_FILE_NAMES);
    p_AddTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_Names ), ed_NamesFileName.Text + CST_EXTENSION_HTML);
  end;
  if ch_genSearch.Checked then
  begin
    Inc(Result, CST_PROGRESS_COUNTER_SEARCH);
    p_setCorrectFileName(ed_SearchName, CST_FILE_SEARCH);
    p_AddTabSheet(gt_TabSheets, ( gs_ANCESTROWEB_Search ), ed_SearchName.Text + CST_EXTENSION_HTML);
  end;
  if ch_genages.Checked then
  begin
    Inc(Result, CST_PROGRESS_COUNTER_AGES);
    p_setCorrectFileName(ed_AgesName, CST_FILE_AGES);
    p_AddTabSheet(gt_TabSheets, ( gs_ANCESTROWEB_Ages ), ed_AgesName.Text + CST_EXTENSION_HTML);
  end;
  Inc(Result, CST_PROGRESS_COUNTER_FILES+CST_PROGRESS_COUNTER_LIST);
  p_setCorrectFileName(ed_FileBeginName, CST_FILE_FILES);
  p_setCorrectFileName(ed_ListsBeginName, CST_FILE_LIST);
  p_AddTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_List ), CST_SUBDIR_HTML_LISTS + '/' + ed_ListsBeginName.Text + '0' + CST_EXTENSION_HTML);
  p_AddTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_Files ), ed_FileBeginName.Text +       CST_EXTENSION_HTML);
  if ch_genContact.Checked then
  begin
    Inc(Result, CST_PROGRESS_COUNTER_CONTACT);
    p_setCorrectFileName(ed_ContactName, CST_FILE_Contact);
    p_AddTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_Contact ),
      ed_ContactName.Text + CST_EXTENSION_PHP);
  end;
end;

procedure TF_AncestroWeb.p_CopyStructure;
var
  ls_Destination: string;
  lt_arg : array [0..0] of string;
begin
  p_IncPrgressBar;
  FileCopy.Destination := de_ExportWeb.Text;
  ls_Destination := FileCopy.Destination+ DirectorySeparator;
  if DirectoryExistsUTF8(ls_Destination ) { *Converted from DirectoryExists*  } Then
   Begin
    lt_arg [0] := ls_Destination;
    if ( MessageDlg(fs_RemplaceMsg(gs_ANCESTROWEB_ExportDelete, lt_arg), mtWarning, mbYesNo, 0 ) = mrYes ) then
      try
        fb_EraseDir(ls_Destination, False);
        fb_EraseDir(ls_Destination + CST_SUBDIR_HTML_CSS, True);
        fb_EraseDir(ls_Destination + CST_SUBDIR_HTML_IMAGES, True);
        fb_EraseDir(ls_Destination + CST_SUBDIR_HTML_LISTS , True);
        fb_EraseDir(ls_Destination + CST_SUBDIR_HTML_MAILER, True);
        fb_EraseDir(ls_Destination + CST_SUBDIR_HTML_SCRIPTS, True);
        fb_EraseDir(ls_Destination + CST_SUBDIR_HTML_ARCHIVE, True);
        fb_EraseDir(ls_Destination + CST_SUBDIR_HTML_FILES, True);
        fb_EraseDir(ls_Destination+ CST_SUBDIR_HTML_TREE, True);
      except
        on E: Exception do
        begin
          ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_ExportErrorErase ) + ls_Destination + CST_ENDOFLINE + E.Message);
          Abort;
        end;
      end
    Else
     Abort;
    End;
  p_IncPrgressBar;
  if (cb_Themes.Items.Count = 0) then
  begin
    ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_ErrorThemes ) + gs_Root + CST_SUBDIR_THEMES);
    Abort;
  end;
  if (cb_Themes.ItemIndex = -1) then
    cb_Themes.ItemIndex := 0;
  FileCopy.Source := gs_Root + CST_SUBDIR_THEMES +DirectorySeparator+cb_Themes.Items[cb_Themes.ItemIndex];
  FileCopy.CopySourceToDestination;
  FileCopy.Source := gs_Root + CST_SUBDIR_CLASSES;
  FileCopy.CopySourceToDestination;
  if fi_ImageEditCount(GedcomEdit.FileName) > 0 then
  begin
    FileCopy.Source := GedcomEdit.FileName;
    FileCopy.CopySourceToDestination;
    gs_LinkGedcom := ExtractFileName(GedcomEdit.FileName);
  end
  else
    gs_LinkGedcom := '';
end;

procedure TF_AncestroWeb.p_IncPrgressBar;
begin
  pb_ProgressAll.Position := pb_ProgressAll.Position + 1;
  Application.ProcessMessages;
end;

procedure TF_AncestroWeb.p_IncPrgressInd;
begin
  pb_ProgressInd.Position := pb_ProgressInd.Position + 1;
  Application.ProcessMessages;
end;
function TF_AncestroWeb.fs_GetTitleTree ( const as_NameOfTree : String ; const ai_generations : Longint ): String;
Begin
  Result := as_NameOfTree + ' (' + IntToStr(ai_generations) ;
  if ai_generations <= 1
    Then AppendStr(Result, ( gs_AnceSTROWEB_Generation  ) + ')')
    Else AppendStr(Result, ( gs_AnceSTROWEB_Generations ) + ')');
end;

// procedure TF_AncestroWeb.p_CreateHTMLTree
// Création de l'arbre dans une TStringList puis Sauvegarde
function TF_AncestroWeb.fi_CreateHTMLTree(const IBQ_Tree: TIBQuery;
  const astl_HTMLTree: TStrings;
  const ai_Clefiche: longint;
  const ab_Link: boolean = True;
  const ab_Progress: boolean = True;
  const ab_NotFirst: boolean = False;
  const as_IdSosa: string = IBQ_TQ_SOSA;
  const ab_Asc: boolean = True;
  const ai_Limit: longint = 0): longint;
var
  li_LocalLevel, li_LocalPreLevel: integer;
  ls_Tempo, ls_Barres, ls_NodeLink, ls_NameSurname, ls_Image: string;
  li_Counter : longint;

  function fs_getText: string;
  begin
    Result := '';
    if not IBQ_Tree.FieldByName(IBQ_DATE_NAISSANCE).IsNull then
      AppendStr(Result, ( gs_AnceSTROWEB_EXPORT_WEB_BORN ) + IBQ_Tree.FieldByName(
        IBQ_DATE_NAISSANCE).AsString);
    if not IBQ_Tree.FieldByName(IBQ_DATE_DECES).IsNull then
      AppendStr(Result, ( gs_AnceSTROWEB_EXPORT_WEB_DIED ) +
        IBQ_Tree.FieldByName(IBQ_DATE_DECES).AsString);
    if not IBQ_Tree.FieldByName(IBQ_AGE_AU_DECES).IsNull then
      AppendStr(Result, ' (' + IBQ_Tree.FieldByName(IBQ_AGE_AU_DECES).AsString +
        ( gs_AnceSTROWEB_Years ) + ')');
    p_addKeyWord(IBQ_Tree.FieldByName(IBQDLLNOM).AsString, '-');
    p_addKeyWord(IBQ_Tree.FieldByName(IBQDLLPRENOM).AsString);
  end;


  procedure p_AddLine ( const ab_IsTheEnd, ab_OldNext, ab_IsSisBrother : boolean );
  var ls_Link: string;
  Begin
    if not ab_IsSisBrother
    or ab_asc
    or not ch_Filtered.Checked Then
      Begin
        ls_NameSurname:= fs_RemplaceEspace ( ls_NameSurname, '_' );
        if ls_NameSurname = '' Then ls_NameSurname := ' ';
        ls_Link := CST_HTML_AHREF;

        if ab_Link Then
          AppendStr(ls_Link, '../' + CST_SUBDIR_HTML_FILES + CST_HTML_DIR_SEPARATOR );
        AppendStr ( ls_Link, fs_GetSheetLink ( gt_SheetsLetters, ls_NameSurname[1], ls_NameSurname)
                  + '#' + ls_NameSurname + '">');
        ls_Image:=ls_Link+ls_Image+CST_HTML_A_END;
      end;
    p_setEndLine(ls_Tempo, ls_Image, ls_NodeLink, ab_OldNext,
      ab_IsTheEnd, li_LocalPreLevel, li_LocalLevel, ab_Link);

    astl_HTMLTree.Add(ls_Tempo);
  end;

  procedure p_CreateChilds(const af_Sosa: double; const as_Aboville: string;
  const ab_HasNext, ab_OldNext, ab_IsFirst, ab_IsSecond, ab_IsSisBrother: boolean );
  var
    li_Sexe: integer;
    lf_SosaPere, lf_SosaMere, lf_NewSosa: double;
    ls_newAboville: string;
  begin
    if (ab_Asc and IBQ_Tree.Locate(as_IdSosa, af_Sosa, [])) or
      (not ab_Asc and IBQ_Tree.Locate(as_IdSosa, as_Aboville, [])) then
    begin
      Inc(li_Counter);
      if not ab_NotFirst
      or not ab_IsFirst
      or ab_IsSecond
       Then
        Begin
          li_LocalPreLevel := li_LocalLevel;
          li_LocalLevel := abs(IBQ_Tree.FieldByName(IBQ_NIVEAU).AsInteger);
          if not ab_Asc then
            Dec(li_LocalLevel);
          if ab_NotFirst then
            Dec(li_LocalLevel);
          if ( li_LocalLevel > Result )
           Then
            Result := li_LocalLevel;
          if li_LocalPreLevel <> -1 then
            p_AddLine ( False, ab_OldNext, ab_IsSisBrother );

          if ab_Progress then
            p_IncPrgressInd;
          // Nommage des noeuds
          ls_NodeLink := fs_GetNodeLink(ls_NodeLink, li_LocalLevel);

          // Création du début de Division
          p_setLevel(astl_HTMLTree, ls_NodeLink, ab_IsFirst or ab_IsSecond and ab_NotFirst, li_LocalLevel, li_LocalPreLevel, ab_Link);

          li_Sexe := IBQ_Tree.FieldByName(IBQ_SEXE).AsInteger;

          ls_NameSurname:=fs_getNameAndSurName(IBQ_Tree);

          ls_Image := ls_NameSurname +  fs_getText;
          ls_Barres := fs_NewLineImages(ls_Barres, ab_HasNext, li_LocalLevel);
          ls_Tempo := fs_CreateLineImages(ls_Barres, li_LocalLevel);
          case li_sexe of
            IBQ_SEXE_MAN : ls_Image := fs_Create_Tree_Image('g' + CST_TREE_GIF_EXT) + ls_Image;
            IBQ_SEXE_WOMAN : ls_Image := fs_Create_Tree_Image('f' + CST_TREE_GIF_EXT) + ls_Image;
          end;
        end;
      if ab_Asc then
      begin
        lf_SosaPere := af_Sosa * 2;
        lf_SosaMere := af_Sosa * 2 + 1;
        p_CreateChilds(lf_SosaPere, as_aboville, IBQ_Tree.Locate(
          as_IdSosa, lf_SosaMere, []), ab_HasNext, False, ab_IsFirst, False );
        p_CreateChilds(lf_SosaMere, as_aboville, False, ab_HasNext, False, False, False );
      end
      else
      begin
        IBQ_Tree.Next;
        ls_newAboville :=
          copy(as_aboville, 1, Length(as_aboville) - 1) + chr(
          Ord(as_aboville[Length(as_aboville)]) + 1);
        if IBQ_Tree.FieldByName(as_IdSosa).AsString = ls_newAboville then
        begin
          IBQ_Tree.Next;
          p_CreateChilds(lf_NewSosa, ls_newAboville,
            IBQ_Tree.FieldByName(as_IdSosa).AsString = copy(
            as_aboville, 1, Length(as_aboville) - 1) + chr(
            Ord(as_aboville[Length(as_aboville)]) + 1),
            ab_HasNext, False, False, True );
        end
        else
        begin
          if (ai_Limit > 0) and (li_Counter >= ai_Limit)
          then
            Exit;
          ls_newAboville := as_aboville + '1';
          if IBQ_Tree.Locate(as_IdSosa, ls_newAboville, []) then
          begin
            IBQ_Tree.Next;
            p_CreateChilds(lf_NewSosa, ls_newAboville,
              IBQ_Tree.FieldByName(as_IdSosa).AsString = copy(as_aboville, 1,
              Length(as_aboville) - 1) + chr(Ord(as_aboville[Length(as_aboville)]) + 1),
              ab_HasNext, False, ab_IsFirst, False );
          end;
        end;
      end;
    end;
  end;

begin
  li_LocalLevel := -1;
  Result := -1;
  ls_NodeLink := '';
  li_Counter := 0;
  ls_Tempo := '';
  gs_HTMLTreeNodeLink := '';
  ls_Barres := '';
  try
    IBQ_Tree.Locate(IBQ_CLE_FICHE, ai_Clefiche, []);
    p_CreateChilds(IBQ_Tree.FieldByName(as_IdSosa).AsFloat,
      IBQ_Tree.FieldByName(as_IdSosa).AsString, False, False, True, False, False);
    p_AddLine ( True, False, True );
  except
    On E: Exception do
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateATree ) + CST_ENDOFLINE + E.Message);
  end;
  if ab_Progress then
    p_IncPrgressBar;
  Inc(Result);
end;

procedure TF_AncestroWeb.p_genHTMLTitle;
var
  li_ClePere, li_CleMere: integer;
  gf_Sosa: double;
begin
  p_IncPrgressBar;
  if ch_Filtered.Checked then
    gi_CleFiche := fCleFiche
  else
  begin
    gf_Sosa := 1;
    if IBQ_Individu.Locate(IBQ_SOSA, gf_Sosa, []) then
      gi_CleFiche := IBQ_Individu.FieldByName(IBQ_CLE_FICHE).AsInteger
    else
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_ErrorCreateSOSA ));
      Abort;
    end;
  end;

  gs_HTMLTitle := '';
  if IBQ_Individu.Locate(IBQ_CLE_FICHE, gi_CleFiche, []) then
  begin //AL il serait préférable de laisser le titre à l'initiative de l'utilisateur! Ce n'est pas forcément les noms du père et de la mère de l'individu sélectionner, surtout s'il n'y a pas de filtrage
    li_ClePere := IBQ_Individu.FieldByName(IBQ_CLE_PERE).AsInteger;
    li_CleMere := IBQ_Individu.FieldByName(IBQ_CLE_MERE).AsInteger;
    if IBQ_Individu.Locate(IBQ_CLE_FICHE, li_ClePere, []) then
      AppendStr(gs_HTMLTitle, ' ' + IBQ_Individu.FieldByName(IBQDLLNOM).AsString);
    if IBQ_Individu.Locate(IBQ_CLE_FICHE, li_CleMere, []) then
      AppendStr(gs_HTMLTitle, ' & ' + IBQ_Individu.FieldByName(IBQDLLNOM).AsString);
  end;
  gs_HTMLTitle := StringReplace( ( gs_AnceSTROWEB_HTMLTitle ), '@ARG',
    gs_HTMLTitle, [rfReplaceAll]);
end;

function TF_AncestroWeb.fb_OpenTree(const AIBQ_Tree: TIBQuery;
  const ai_Cle: longint; const ai_Niveau: integer = 0;
  const ai_Sexe: integer = 0): boolean;
begin
  Result := False;
  with AIBQ_Tree.Params do
    try
      AIBQ_Tree.Close;
      ParamByName(I_CLEF).AsInteger := ai_Cle;
      ParamByName(I_NIVEAU).AsInteger := ai_Niveau;
      if (FindParam(I_PARQUI) <> nil) Then
        ParamByName(I_PARQUI).AsInteger := ai_Sexe;
      if (FindParam(I_DOSSIER) <> nil) Then
        ParamByName(I_DOSSIER).AsInteger := fCleDossier;
      AIBQ_Tree.Open;
      Result := not AIBQ_Tree.IsEmpty;
    except
      On E: Exception do
        ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantOpenData ) + sDataBaseName + CST_ENDOFLINE + E.Message);
    end;
end;

procedure TF_AncestroWeb.p_genHTMLTree;
var
  lstl_HTMLTree: TStringList;
  ls_destination: string;
  li_generation: longint;
begin
  p_Setcomments (( gs_AnceSTROWEB_FamilyTree ));
  lstl_HTMLTree := TStringList.Create;
  p_CreateKeyWords;
  pb_ProgressInd.Position := 0;
  if fb_OpenTree(DMWeb.IBQ_TreeAsc, gi_CleFiche) then
    try
      pb_ProgressInd.Max := DMWeb.IBQ_TreeAsc.RecordCount;
      p_IncPrgressBar;
      if not ch_Filtered.Checked and not
        DMWeb.IBQ_TreeAsc.Locate(IBQ_CLE_FICHE, gi_CleFiche, []) then
        Exit;
      li_generation := fi_CreateHTMLTree(DMWeb.IBQ_TreeAsc, lstl_HTMLTree, gi_CleFiche);
      lstl_HTMLTree.Insert(0, fs_Replace_EndLines(me_HeadTree.Lines.Text));
      p_CreateAHtmlFile(lstl_HTMLTree, CST_FILE_TREE, me_Description.Lines.Text,
        ( gs_AnceSTROWEB_FamilyTree ), gs_AnceSTROWEB_FullTree, fs_GetTitleTree ( gs_AnceSTROWEB_Ancestry, li_generation), gs_LinkGedcom, '../');
      p_IncPrgressBar;
    except
      On E: Exception do
        ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantUseData ) + sDataBaseName + CST_ENDOFLINE + E.Message);
    end;
  ls_destination := FileCopy.Destination + DirectorySeparator +
    CST_SUBDIR_HTML_TREE + DirectorySeparator + ed_TreeName.Text + CST_EXTENSION_HTML;
  try
    if fb_CreateDirectoryStructure(FileCopy.Destination + DirectorySeparator + CST_SUBDIR_HTML_TREE + DirectorySeparator) then
      lstl_HTMLTree.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantSaveTree ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  lstl_HTMLTree.Free;
  p_IncPrgressBar;
end;

function TF_AncestroWeb.fs_AddImage(const as_ImageFile: string): string;
var
  ls_Destination, ls_HtmlFileName: string;
begin
  Result := '';
  p_IncPrgressBar;
  if fi_ImageEditCount(as_ImageFile) = 0 then
    Exit;
  ls_HtmlFileName := ExtractFileName(as_ImageFile);
  ls_HtmlFileName := Copy(ls_HtmlFileName, 1, Length(ls_HtmlFileName) -
    Length(ExtractFileExt(ls_HtmlFileName))) + CST_EXTENSION_JPEG;
  ls_Destination := FileCopy.Destination + DirectorySeparator +
    CST_SUBDIR_HTML_IMAGES + DirectorySeparator + ls_HtmlFileName;
  TraduceImage.FileSource := as_ImageFile;
  TraduceImage.FileDestination := ls_Destination;
  TraduceImage.CopySourceToDestination;
  AppendStr ( Result, ' ' + fs_AddImageTable(fs_Create_Image(CST_SUBDIR_HTML_IMAGES + CST_HTML_DIR_SEPARATOR + ls_HtmlFileName)));
end;

function TF_AncestroWeb.fs_AddImageTable(const as_HtmlImage : string ; const as_alt: string = ''): string;
begin
  if as_HtmlImage = ''
   Then Result := ''
   Else Result := CST_HTML_TD_BEGIN + '<' + CST_HTML_TABLE +
    CST_HTML_ID_EQUAL + '"image">' + CST_HTML_TR_BEGIN + CST_HTML_TD_BEGIN +
    as_HtmlImage + CST_HTML_TD_END + CST_HTML_TR_END +
    CST_HTML_TABLE_END + CST_HTML_TD_END + ' ';
end;

procedure TF_AncestroWeb.p_genHtmlHome;
var
  lstl_HTMLHome: TStringList;
  ls_destination: string;
  ls_Images: string;
  li_Count: integer;

  function fs_AddImages(const as_Image1, as_Image2, as_Image3: string): string;
  begin
    Result := '';
    li_Count := fi_ImageEditCount(as_Image1) + fi_ImageEditCount(
      as_Image2) + fi_ImageEditCount(as_Image3);
    if li_Count = 0 then
      Exit;
    TraduceImage.ResizeWidth := 630 div li_Count;
    Result := fs_AddImage(ImageEdit1.FileName);
    AppendStr(Result, fs_AddImage(ImageEdit2.FileName));
    AppendStr(Result, fs_AddImage(ImageEdit3.FileName));

  end;

begin
  p_Setcomments (( gs_AnceSTROWEB_Home ));
  lstl_HTMLHome := TStringList.Create;
  lstl_HTMLHome.Text := CST_HTML_CENTER_BEGIN + '<' + CST_HTML_Paragraph +
    CST_HTML_ID_EQUAL + '"head">' + fs_Replace_EndLines(
    me_Description.Text) + CST_HTML_Paragraph_END;

  ls_Images := fs_AddImages(ImageEdit1.FileName, ImageEdit2.FileName,
    ImageEdit3.FileName);
  if ls_Images <> '' then
    lstl_HTMLHome.Add(' <' + CST_HTML_TABLE + CST_HTML_ID_EQUAL +
      '"images">' + CST_HTML_TR_BEGIN + ls_Images + CST_HTML_TR_END + CST_HTML_TABLE_END);
  lstl_HTMLHome.Add(CST_HTML_CENTER_END);
  p_CreateKeyWords;
  pb_ProgressInd.Position := 0;
  p_CreateAHtmlFile(lstl_HTMLHome, CST_FILE_Home, me_Description.Lines.Text,
    ( gs_AnceSTROWEB_Home ), ( gs_AnceSTROWEB_Home ), gs_ANCESTROWEB_Welcome, gs_LinkGedcom);
  p_IncPrgressBar;
  ls_destination := FileCopy.Destination + DirectorySeparator + ed_IndexName.Text +
    CST_EXTENSION_HTML;
  try
    lstl_HTMLHome.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateHome ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  lstl_HTMLHome.Free;
end;


procedure TF_AncestroWeb.p_Setcomments (const as_Comment : String);
Begin
  if as_Comment = ''
    Then lb_Comments.Caption:= ''
    Else lb_Comments.Caption:= fs_getCorrectString ( gs_AnceSTROWEB_Generating ) + as_Comment;

end;

function TF_AncestroWeb.fb_OpenMedias(const ai_CleFiche: Longint;
                                      const ai_Type: integer;
                                      const ab_Identite: Boolean = False;
                                      const ach_table : Char = MEDIAS_TABLE_ARCHIV):Boolean;
Begin
  Result := False;
  try
    DMWeb.IBQ_Medias.Close;
    DMWeb.IBQ_Medias.ParamByName(IBQ_CLE_FICHE   ).AsInteger := ai_CleFiche;
    DMWeb.IBQ_Medias.ParamByName(MEDIAS_TYPE          ).AsInteger := ai_Type ;
    DMWeb.IBQ_Medias.ParamByName(MEDIAS_TABLE         ).AsString  := ach_table ;
    DMWeb.IBQ_Medias.ParamByName(MEDIAS_MP_IDENTITE   ).AsInteger := Integer ( ab_Identite ) ;
    DMWeb.IBQ_Medias.Open;
    Result := not DMWeb.IBQ_Medias.IsEmpty;

  Except
    on E : Exception do
     Begin
       ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantOpenData + gs_AnceSTROWEB_The_Medias ) +CST_ENDOFLINE+e.Message);
     end;
  end;
end;

function TF_AncestroWeb.fs_getNameAndSurName ( const ibq_Query : TIBQuery ) : String;
Begin
  Result:=ibq_Query.FieldByName(IBQDLLNOM).AsString+' ' + ibq_Query.FieldByName(IBQDLLPRENOM).AsString;
End;

function TF_AncestroWeb.fs_CreatePrevNext ( const ai_PreviousNext : Longint ;
                                            const as_PreviousNext : String = CST_PAGE_PREVIOUS;
                                            const as_Subdir : String = '';
                                                  as_BeginLinkFiles : String = CST_SUBDIR_HTML_FILES + '/' ) : String;
Begin
  Result := CST_HTML_AHREF + as_BeginLinkFiles + IntToStr(ai_PreviousNext) + CST_EXTENSION_HTML + '">'
                + fs_Create_Image( as_Subdir + CST_SUBDIR_HTML_IMAGES + '/'+as_PreviousNext +'.gif', as_PreviousNext ) + CST_HTML_A_END
End;

function TF_AncestroWeb.fb_getMediaFile ( const IBQ_Media : TIBQuery;
                                          const as_FilePath : string ) : Boolean;
Begin
  Result := False;

  if IBQ_Media.FieldByName(MEDIAS_MULTI_MEDIA).IsNull Then
    Begin
      Exit;
    End;
  if   FileExistsUTF8(as_FilePath ) { *Converted from FileExists*  } Then
    Begin
      Result := True;
      Exit;
    end;
  try
    if not IBQ_Media.FieldByName ( MEDIAS_NOM ).IsNull
    and FileExistsUTF8(fBasePath+DirectorySeparator+IBQ_Media.FieldByName ( MEDIAS_NOM ).AsString) { *Converted from FileExists*  }
     Then Result := fb_CopyFile(fBasePath+DirectorySeparator+IBQ_Media.FieldByName ( MEDIAS_NOM ).AsString,as_FilePath,False,False)=0
    Else
    if {$IFNDEF FPC}( GetDriveType( Pchar(ExtractFileDrive ( IBQ_Media.FieldByName ( MEDIAS_PATH ).AsString ))) >0 )
    and{$ENDIF} FileExistsUTF8(IBQ_Media.FieldByName ( MEDIAS_PATH ).AsString ) { *Converted from FileExists*  }
      Then Result := fb_CopyFile(IBQ_Media.FieldByName(MEDIAS_PATH ).AsString,as_FilePath,False,False)=0
      Else Result := fb_ImageFieldToFile(IBQ_Media.FieldByName(MEDIAS_MULTI_MEDIA), as_FilePath);
  Except
   Result:=False;
  end;
End;

procedure TF_AncestroWeb.p_createLettersSheets ( var at_SheetsLetters : TAHTMLULTabSheet;
                                                 const IBQ_FilesFiltered: TIBQuery;
                                                 const ai_PerPage : Integer;
                                                 const as_BeginFile : String );
var li_Counter, li_OldCounterPages,  li_i,  li_modulo: Longint;
    lch_i: char;
Begin
  li_Counter := 0;
  li_OldCounterPages := 0;
  Finalize(at_SheetsLetters);
  for lch_i := CST_FILES_BEGIN_LETTER to CST_FILES_END_LETTER do
  if IBQ_FilesFiltered.Locate(IBQDLLNOM, lch_i,
    [loPartialKey, loCaseInsensitive]) then
    begin
      li_OldCounterPages := li_Counter;
      li_Counter:=(IBQ_FilesFiltered.RecNo - 1) div ai_PerPage;
      if (IBQ_FilesFiltered.RecNo - 1) mod ai_PerPage = 0
       Then li_modulo := 0
       Else li_modulo := 1;

      if li_Counter + li_OldCounterPages > 1 Then
        for li_i := li_OldCounterPages to li_Counter + li_modulo -1 do
         Begin
          IBQ_FilesFiltered.RecNo:= li_i * ai_PerPage + 1 ;
          p_AddTabSheetPage(at_SheetsLetters, high ( at_SheetsLetters ), as_BeginFile + IntToStr(li_i) + CST_EXTENSION_HTML, fs_RemplaceEspace (fs_getNameAndSurName(IBQ_FilesFiltered), '_' ));
         end;
      p_AddTabSheet(at_SheetsLetters, lch_i,
        as_BeginFile + IntToStr(li_Counter) + CST_EXTENSION_HTML );
    end;
end;

procedure TF_AncestroWeb.p_genHtmlNames (const IBQ_FilesFiltered: TIBQuery);
var
  lstl_HTMLAFolder: TStringList;
  ls_NewName, ls_Name, ls_destination: string;
begin
  p_CreateKeyWords;
  ls_name := '';
  pb_ProgressInd.Position:=0;
  pb_ProgressInd.Max:=IBQ_FilesFiltered.RecordCount;
  lstl_HTMLAFolder := TStringList.Create;
  lstl_HTMLAFolder.Add ( fs_CreateULTabseets ( gt_SheetsLetters, '', CST_HTML_SUBMENU, False, True ));
  lstl_HTMLAFolder.Add ( fs_CreateElementWithId(CST_HTML_TABLE, 'names') + CST_HTML_TR_BEGIN + CST_HTML_TD_BEGIN  );
  while not IBQ_FilesFiltered.EOF do
  begin
    p_IncPrgressInd;
    ls_NewName := IBQ_FilesFiltered.FieldByName(IBQDLLNOM).AsString;
    if (ls_NewName <> ls_Name) Then
     Begin
      if ((length(ls_Name) = 0) or
        (ls_NewName[1] <> ls_Name[1])) then
        lstl_HTMLAFolder.Add ( CST_HTML_TD_END +CST_HTML_TR_END + CST_HTML_TR_BEGIN + CST_HTML_TD_BEGIN +
                               CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"' + ls_NewName[1] + '" />'+
                               CST_HTML_H4_BEGIN + ls_NewName[1]+ CST_HTML_H4_END + CST_HTML_TD_END +CST_HTML_TD_BEGIN)
        Else lstl_HTMLAFolder.Add ( ' - ' );
      lstl_HTMLAFolder.Add ( CST_HTML_AHREF + CST_SUBDIR_HTML_FILES + CST_HTML_DIR_SEPARATOR
                           + fs_GetSheetLink ( gt_SheetsLetters, ls_NewName[1], ls_NewName ) + '#' + ls_NewName + '">'
                           + ls_NewName + CST_HTML_A_END +' ('+ IBQ_FilesFiltered.FieldByName( IBQ_COUNTER ).AsString + ')' );
     end;
    ls_Name := IBQ_FilesFiltered.FieldByName(IBQDLLNOM).AsString;
    p_addKeyWord(ls_Name, '-');
    IBQ_FilesFiltered.Next;

  end;
  lstl_HTMLAFolder.Add ( CST_HTML_TD_END +CST_HTML_TR_END + CST_HTML_TABLE_END );
  p_CreateAHtmlFile(lstl_HTMLAFolder, CST_FILE_NAMES, me_NamesHead.Lines.Text,
     ( gs_AnceSTROWEB_Names ), gs_AnceSTROWEB_Names, gs_ANCESTROWEB_Names_Long, gs_LinkGedcom);
  ls_destination := FileCopy.Destination + DirectorySeparator + ed_NamesFileName.Text + CST_EXTENSION_HTML;
  try
    lstl_HTMLAFolder.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateHome ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  lstl_HTMLAFolder.Free;
  p_IncPrgressBar;
end;


procedure TF_AncestroWeb.p_genHtmlList(const IBQ_FilesFiltered: TIBQuery);
var
  ls_Name, ls_destination: string;
  lt_SheetsLists : TAHTMLULTabSheet;
  ls_ImagesDir: string;
  li_CounterPages : Longint;

  procedure p_AddAList;
  var
    lstl_HTMLAList: TStringList;
    ls_NewName, ls_Sexe, ls_NameBegin, ls_NameEnd: string;
    li_i, li_CleFiche: longint;
    lb_next : Boolean ;
  begin
    p_CreateKeyWords;
    lstl_HTMLAList := TStringList.Create;
    ls_NameBegin := IBQ_FilesFiltered.FieldByName(IBQDLLNOM).AsString;
    if (ls_NameBegin <> '') then
      p_SelectTabSheet(lt_SheetsLists,ls_NameBegin[1],ls_NameBegin);
    lstl_HTMLAList.Text :=
      fs_CreateULTabseets(lt_SheetsLists, '', CST_HTML_SUBMENU);
    if (ls_NameBegin <> '') then
      p_SelectTabSheet(lt_SheetsLists,ls_NameBegin[1],ls_NameBegin, False);
    lb_next := True;
    lstl_HTMLAList.Add( CST_HTML_CENTER_BEGIN + fs_CreateElementWithId ( CST_HTML_TABLE , 'list' ));
    lstl_HTMLAList.Add( fs_CreateElementWithId ( CST_HTML_TR , CST_TABLE_TITLE )+
                         fs_Create_TD ( CST_FILE_PERSON, CST_HTML_ID_EQUAL, 3 )+CST_HTML_H2_BEGIN+ ( gs_AnceSTROWEB_Person ) +CST_HTML_H2_END+CST_HTML_TD_END+
                        CST_HTML_TD_BEGIN+CST_HTML_H2_BEGIN+ ( gs_AnceSTROWEB_Born ) +CST_HTML_H2_END+CST_HTML_TD_END+
                        CST_HTML_TD_BEGIN+CST_HTML_H2_BEGIN+ ( gs_AnceSTROWEB_Died ) +CST_HTML_H2_END+CST_HTML_TD_END+
                        CST_HTML_TR_END);
    for li_i := 1 to gi_FilesPerList do
    begin
      p_IncPrgressInd;
      p_addKeyWord(IBQ_FilesFiltered.FieldByName(IBQDLLNOM).AsString, '-');
      p_addKeyWord(IBQ_FilesFiltered.FieldByName(IBQDLLPRENOM).AsString);
      li_CleFiche := IBQ_FilesFiltered.FieldByName(IBQ_CLE_FICHE).AsInteger;
      ls_NewName := IBQ_FilesFiltered.FieldByName(IBQDLLNOM).AsString;
      case IBQ_FilesFiltered.FieldByName(IBQ_SEXE).AsInteger of
       IBQ_SEXE_MAN   : ls_Sexe := CST_FILE_MAN;
       IBQ_SEXE_WOMAN : ls_Sexe := CST_FILE_WOMAN;
       else
         ls_Sexe := 'file';
      end;

      lstl_HTMLAList.Add( fs_CreateElementWithId ( CST_HTML_TR, ls_Sexe + CST_FILE_Number + IntToStr(li_i), CST_HTML_CLASS_EQUAL ) + CST_HTML_TD_BEGIN );
      if (ls_NewName <> ls_Name) Then
       Begin
        if (ls_name = '') or ((length(ls_NewName) > 0) and
          (ls_NewName[1] <> ls_Name[1])) then
          lstl_HTMLAList.Add(CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"' + ls_NewName[1] + '" />');
       end;
      ls_Name := ls_NewName;
      ls_Name:= ls_Name + ' ' + IBQ_FilesFiltered.FieldByName(IBQDLLPRENOM).AsString ;
      lstl_HTMLAList.Add(   fs_AddPhoto(li_CleFiche, fs_getaltPhoto(IBQ_FilesFiltered), ls_ImagesDir, 24) +
                            CST_HTML_TD_END + CST_HTML_TD_BEGIN +
                            CST_HTML_IMAGE_SRC + '../' + CST_SUBDIR_HTML_IMAGES + '/' + ls_Sexe + CST_EXTENSION_GIF + '" />' +
                            CST_HTML_TD_END + CST_HTML_TD_BEGIN + CST_HTML_AHREF + '../' + CST_SUBDIR_HTML_FILES + '/' +
                            fs_GetSheetLink ( gt_SheetsLetters, ls_name[1], ls_Name ) + '#' + fs_RemplaceEspace(ls_name, '_' )+ '">' +ls_name +
                                 CST_HTML_TD_END + fs_Create_TD(CST_TABLE_CENTER) + IBQ_FilesFiltered.FieldByName(IBQ_ANNEE_NAISSANCE).AsString +
                            CST_HTML_TD_END + fs_Create_TD(CST_TABLE_CENTER) + ' ' + IBQ_FilesFiltered.FieldByName(IBQ_ANNEE_DECES).AsString+ CST_HTML_TR_END);
      ls_NameEnd := IBQ_FilesFiltered.FieldByName(IBQDLLNOM).AsString;
      IBQ_FilesFiltered.Next;
      if IBQ_FilesFiltered.EOF then
       Begin
        lb_next:=False;
        Break;
       end ;
    end;
    lstl_HTMLAList.Add( CST_HTML_TABLE_END + CST_HTML_BR);
    if li_CounterPages - 1 > 0 Then
      lstl_HTMLAList.Add ( fs_CreatePrevNext ( li_CounterPages - 1, CST_PAGE_PREVIOUS, '../', ed_ListsBeginName.Text ));
    if lb_next Then
      lstl_HTMLAList.Add ( fs_CreatePrevNext ( li_CounterPages + 1, CST_PAGE_NEXT, '../', ed_ListsBeginName.Text ));
    lstl_HTMLAList.Add ( CST_HTML_CENTER_END );
    p_CreateAHtmlFile(lstl_HTMLAList, CST_FILE_SUBFILES, me_Description.Lines.Text,
      ( gs_AnceSTROWEB_List ) + ' - ' + ls_NameBegin +
      ( gs_AnceSTROWEB_At ) + ls_NameEnd, '', '', gs_LinkGedcom, '..' + CST_HTML_DIR_SEPARATOR);
    ls_destination := FileCopy.Destination + DirectorySeparator +
      CST_SUBDIR_HTML_LISTS + DirectorySeparator + ed_ListsBeginName.Text + IntToStr(
      li_CounterPages) + CST_EXTENSION_HTML;
    try
      lstl_HTMLAList.SaveToFile(ls_destination);
    except
      On E: Exception do
      begin
        ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateHome ) + ls_destination + CST_ENDOFLINE + E.Message);
        Abort;
      end;
    end;
    lstl_HTMLAList.Free;
    Inc(li_CounterPages);
  end;

begin
  p_Setcomments ( gs_AnceSTROWEB_List );
  p_createLettersSheets ( lt_SheetsLists, IBQ_FilesFiltered, gi_FilesPerList, ed_ListsBeginName.Text );
  li_CounterPages := 0;
  pb_ProgressInd.Position := 0;
  ls_ImagesDir := FileCopy.Destination + DirectorySeparator + CST_SUBDIR_HTML_LISTS + DirectorySeparator + CST_SUBDIR_HTML_IMAGES + DirectorySeparator ;
  fb_CreateDirectoryStructure(ls_ImagesDir);
  fb_CreateDirectoryStructure(FileCopy.Destination + DirectorySeparator + CST_SUBDIR_HTML_LISTS);
  pb_ProgressInd.Max := IBQ_FilesFiltered.RecordCount;
  IBQ_FilesFiltered.First;
  p_SelectTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_List ), '');
  ls_Name := '';
  p_IncPrgressBar;
  while not IBQ_FilesFiltered.EOF do
    p_AddAList;
  p_SelectTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_List ), '', False);
end;
function TF_AncestroWeb.fs_getaltPhoto(const IBQ_IndividuFiltered : TIBQuery):String;
Begin
  Result:=IBQ_IndividuFiltered.FieldByName(
      IBQ_ANNEE_NAISSANCE).AsString + '-' +
      IBQ_IndividuFiltered.FieldByName(
      IBQ_ANNEE_DECES).AsString + ' ' +
      IBQ_IndividuFiltered.FieldByName(
      IBQDLLNOM).AsString + ' ' +
      IBQ_IndividuFiltered.FieldByName(
      IBQDLLPRENOM).AsString;
end;
function TF_AncestroWeb.fs_AddPhoto( const ai_cleFiche: longint;
const as_FileAltName, as_ImagesDir: string; const ai_ResizeWidth : Integer = 180 ): string;
var li_i : Integer;
begin
  if not fb_OpenMedias(ai_cleFiche, MEDIAS_TYPE_IMAGE, True, MEDIAS_TABLE_PERSON )
  or DMWeb.IBQ_Medias.FieldByName(MEDIAS_MULTI_MEDIA).IsNull
  then
   Begin
    Result := '';
    Exit;
   end;

  li_i := 1;
  Result := fs_RemplaceEspace(as_FileAltName, '_') + '-' + IntToStr(
    ai_cleFiche) + CST_EXTENSION_JPEG;
  while FileExistsUTF8(Result) { *Converted from FileExists*  } do
  Begin
    inc ( li_i );
    Result := fs_RemplaceEspace(as_FileAltName, '_') + '-' + IntToStr(
    ai_cleFiche)+'-'+ IntToStr(li_i) + CST_EXTENSION_JPEG;
  end;

  if not fb_ImageFieldToFile(DMWeb.IBQ_Medias.FieldByName(MEDIAS_MULTI_MEDIA),
    as_ImagesDir + Result, ai_ResizeWidth) then
  begin
    Result := '';
    Exit;
  end;

  Result := fs_Create_Image ( CST_SUBDIR_HTML_IMAGES + CST_HTML_DIR_SEPARATOR + Result, as_FileAltName);

end;
procedure TF_AncestroWeb.p_genHtmlFiles(const IBQ_FilesFiltered: TIBQuery);
var
  lstl_HTMLPersons: TStringList;
  ls_Name, ls_destination: string;
  ls_ImagesDir, ls_ArchivesDir: string;
  li_CounterPages : Longint;

  function fs_CreateMarried (  const as_Date : String ; const ai_ClefUnion : Longint ): String;
  var ls_FileName : String ;
      li_i : Integer ;
  Begin
    if ( as_Date = '' ) Then
      Begin
        Result := '';
        Exit;
      end;
    DMWeb.IBQ_ConjointSources.Close;
    DMWeb.IBQ_ConjointSources.ParamByName ( I_CLEF_UNION  ).AsInteger:=ai_ClefUnion;
    DMWeb.IBQ_ConjointSources.Open;
    Result := ' (' + ( gs_AnceSTROWEB_Married_On )+ as_Date ;
    if ch_Images.Checked
    and not DMWeb.IBQ_ConjointSources.IsEmpty Then
      Begin
        if DMWeb.IBQ_Conjoint.FieldByName(IBQ_SEXE).AsInteger = IBQ_SEXE_WOMAN
        Then ls_FileName := fs_getNameAndSurName (DMWeb.IBQ_Conjoint)+'&'+fs_getNameAndSurName (IBQ_FilesFiltered)
        Else ls_FileName := fs_getNameAndSurName (IBQ_FilesFiltered )+'&'+fs_getNameAndSurName (DMWeb.IBQ_Conjoint);
        ls_FileName := fs_RemplaceEspace(DMWeb.IBQ_Conjoint.FieldByName(UNION_CLEF).AsString + ls_FileName+'-'+as_Date,'_')
                     + '-'+DMWeb.IBQ_Conjoint.FieldByName(UNION_CP).AsString+'-'+DMWeb.IBQ_Conjoint.FieldByName(UNION_CITY).AsString+ '-';
        li_i := 1 ;

        while not DMWeb.IBQ_ConjointSources.EOF do
          Begin
            if fb_getMediaFile ( DMWeb.IBQ_ConjointSources, ls_ArchivesDir + ls_FileName + IntToStr(li_i) +CST_EXTENSION_JPEG ) Then
              Begin
                AppendStr( Result, ' - ' +fs_Create_Link ( CST_HTML_OUTDIR_SEPARATOR + CST_SUBDIR_HTML_ARCHIVE + CST_HTML_DIR_SEPARATOR + ls_FileName + IntToStr(li_i)+CST_EXTENSION_JPEG,
                                                           IntToStr(li_i),CST_HTML_TARGET_BLANK ));
                inc ( li_i );
              End;

            DMWeb.IBQ_ConjointSources.Next;
          End
      end;
     AppendStr( Result, ')' );
  end;

  function fs_addDateAndCity ( const IBQ_FicheInfos : TIBQuery ; const as_date, as_City, as_manon, as_womanon : String ):String ;
  begin

    if not IBQ_FicheInfos.FieldByName(as_date).IsNull Then
      Begin
        if IBQ_FicheInfos.FieldByName(IBQ_SEXE).AsInteger = IBQ_SEXE_WOMAN
         Then Result := as_womanon
         Else Result := as_manon   ;
        AppendStr ( Result, IBQ_FicheInfos.FieldByName(as_date).AsString ) ;
        if IBQ_FicheInfos.FieldByName(as_City).AsString <> '' Then
          AppendStr ( Result, ( gs_AnceSTROWEB_At ) + IBQ_FicheInfos.FieldByName(as_City).AsString );
        AppendStr ( Result, CST_HTML_BR );
        End
       Else Result := '';
  end;

  procedure p_AddInfos ( const astl_HTMLAFolder : TStringList ; const ai_CleFiche, ai_NoInPage : LongInt  );
  Begin
    try
      DMWeb.IBQ_Fiche.Close;
      DMWeb.IBQ_Fiche.ParamByName(I_CLEF).AsInteger := IBQ_FilesFiltered.FieldByName(IBQ_CLE_FICHE).AsInteger;
      DMWeb.IBQ_Fiche.Open;
      DMWeb.IBQ_Conjoint.Close;
      DMWeb.IBQ_Conjoint.ParamByName ( I_CLEF    ).AsInteger:=ai_CleFiche;
//      DMWeb.IBQ_Conjoint.ParamByName ( I_DOSSIER ).AsInteger:=fCleDossier;
      DMWeb.IBQ_Conjoint.Open;
      astl_HTMLAFolder.Add ( fs_addDateAndCity ( DMWeb.IBQ_Fiche, FICHE_DATE_NAISSANCE, FICHE_LIEU_NAISSANCE, ( gs_AnceSTROWEB_WomanBornOn ), ( gs_AnceSTROWEB_ManBornOn )));
      astl_HTMLAFolder.Add ( fs_addDateAndCity ( DMWeb.IBQ_Fiche, FICHE_DATE_DECES, FICHE_LIEU_DECES, ( gs_AnceSTROWEB_WomanDiedOn ), ( gs_AnceSTROWEB_ManDiedOn )) + CST_HTML_BR);
      if not DMWeb.IBQ_Conjoint.IsEmpty Then
        Begin
         astl_HTMLAFolder.Add ( fs_CreateElementWithId ( CST_HTML_H3    , CST_FILE_UNION + 's'
                                                            + CST_FILE_Number + IntToStr( ai_NoInPage ),CST_HTML_CLASS_EQUAL));
         if DMWeb.IBQ_Conjoint.RecordCount = 1
          Then astl_HTMLAFolder.Add (( gs_AnceSTROWEB_Union   ))
          else astl_HTMLAFolder.Add (( gs_AnceSTROWEB_Unions  ));
         astl_HTMLAFolder.Add ( CST_HTML_H3_END );
         astl_HTMLAFolder.Add ( fs_CreateElementWithId ( CST_HTML_UL, CST_FILE_UNION + 's'
                                                            + CST_FILE_Number + IntToStr( ai_NoInPage ),CST_HTML_CLASS_EQUAL));
         while not DMWeb.IBQ_Conjoint.EOF do
          Begin
           astl_HTMLAFolder.Add ( fs_CreateElementWithId ( CST_HTML_LI, CST_FILE_UNION + CST_FILE_Number + IntToStr( ai_NoInPage ),CST_HTML_CLASS_EQUAL)
                                + DMWeb.IBQ_Conjoint.FieldByName(IBQDLLNOM).AsString + ' ' + DMWeb.IBQ_Conjoint.FieldByName(IBQDLLPRENOM).AsString );
           astl_HTMLAFolder.Add ( fs_CreateMarried ( DMWeb.IBQ_Conjoint.FieldByName(UNION_DATE_MARIAGE).AsString, DMWeb.IBQ_Conjoint.FieldByName(UNION_CLEF).AsInteger ));
           astl_HTMLAFolder.Add ( CST_HTML_LI_END);
           DMWeb.IBQ_Conjoint.Next;
          end;

         astl_HTMLAFolder.Add ( CST_HTML_UL_END );
        end;
    finally
    end;
  end;

  procedure p_AddCounting ( const astl_HTML : TStringList  );
  Begin
   if ch_Comptage.Checked then
    try
      DMWeb.IBQ_Compte.Close;
      DMWeb.IBQ_Compte.ParamByName ( I_DOSSIER    ).AsInteger:=fCleDossier;
      DMWeb.IBQ_Compte.Open;
      if not DMWeb.IBQ_Compte.IsEmpty Then
        Begin
         astl_HTML.Add ( fs_CreateElementWithId ( CST_HTML_H3    ,CST_FILE_COUNTING));
         astl_HTML.Add (( gs_AnceSTROWEB_Statistics   ));
         astl_HTML.Add ( CST_HTML_H3_END );
         astl_HTML.Add ( fs_CreateElementWithId ( CST_HTML_TABLE, CST_FILE_COUNTING));
         while not DMWeb.IBQ_Compte.EOF do
          Begin
           astl_HTML.Add (CST_HTML_TR_BEGIN + CST_HTML_TD_BEGIN  + CST_HTML_H4_BEGIN +
                         fs_GetLabelCaption ( DMWeb.IBQ_Compte.FieldByName(COUNTING_LABEL).AsString ) +
                         CST_HTML_H4_END  + CST_HTML_TD_END + CST_HTML_TD_BEGIN +
                         DMWeb.IBQ_Compte.FieldByName(COUNTING_COUNTING).AsString +
                         CST_HTML_TD_END + CST_HTML_TR_END);
           DMWeb.IBQ_Compte.Next;
          end;

         astl_HTML.Add ( CST_HTML_TABLE_END );
        end;
    finally
    end;
  end;

  procedure p_AddTrees ( const astl_HTMLAFolder : TStringList ; const ai_CleFiche, ai_NoInPage : LongInt );
  var
    lstl_Tree: TStringList;
    li_generations: longint;
  begin
    astl_HTMLAFolder.Add(CST_HTML_TR_BEGIN + CST_HTML_TD_BEGIN );
    lstl_Tree := TStringList.Create;
    if fb_OpenTree(DMWeb.IBQ_TreeDesc, ai_CleFiche, 4)
    and ( DMWeb.IBQ_TreeDesc.RecordCount > 1 ) then
    begin
      li_generations :=
        fi_CreateHTMLTree(DMWeb.IBQ_TreeDesc, lstl_Tree, ai_CleFiche,
        False, False, True, IBQ_NUM_SOSA, False, 7);
      lstl_Tree.Insert(0, fs_Create_DIV('descent' + CST_FILE_Number + IntToStr(ai_NoInPage), CST_HTML_CLASS_EQUAL) + fs_GetTitleTree (( gs_AnceSTROWEB_Descent ), li_generations ));
      astl_HTMLAFolder.AddStrings(lstl_Tree);
      astl_HTMLAFolder.Add(CST_HTML_DIV_End);
    end;
    if fb_OpenTree(DMWeb.IBQ_TreeAsc, ai_CleFiche, 3)
    and ( DMWeb.IBQ_TreeAsc.RecordCount > 1 ) then
    begin
      lstl_Tree.Clear;
      li_generations :=
        fi_CreateHTMLTree(DMWeb.IBQ_TreeAsc, lstl_Tree, ai_CleFiche, False, False, True);
      lstl_Tree.Insert(0, fs_Create_DIV('ancestry' + CST_FILE_Number + IntToStr(ai_NoInPage),CST_HTML_CLASS_EQUAL) + fs_GetTitleTree (( gs_AnceSTROWEB_Ancestry ), li_generations ));
      astl_HTMLAFolder.AddStrings(lstl_Tree);
      astl_HTMLAFolder.Add(CST_HTML_DIV_End);
    end;
    astl_HTMLAFolder.Add(CST_HTML_TD_END + CST_HTML_TR_END);
    lstl_Tree.Free;
  end;

  procedure p_AddAFolder;
  var
    lstl_HTMLAFolder: TStringList;
    ls_NewName, ls_NameBegin, ls_NameSurname, ls_NameEnd: string;
    li_i, li_CleFiche: longint;
    lb_next : Boolean ;
  begin
    p_CreateKeyWords;
    lstl_HTMLAFolder := TStringList.Create;
    ls_NameBegin := IBQ_FilesFiltered.FieldByName(IBQDLLNOM).AsString;
    ls_NameSurname := fs_RemplaceEspace ( fs_getNameAndSurName(IBQ_FilesFiltered), '_' );
    if (ls_NameBegin <> '') then
      p_SelectTabSheet(gt_SheetsLetters,ls_NameSurname[1],ls_NameSurname);
    lstl_HTMLAFolder.Text :=
      fs_CreateULTabseets(gt_SheetsLetters, '', CST_HTML_SUBMENU);
    if (ls_NameBegin <> '') then
      p_SelectTabSheet(gt_SheetsLetters,ls_NameSurname[1],ls_NameSurname, False);
    lb_next := True;
    lstl_HTMLAFolder.Add( CST_HTML_CENTER_BEGIN );
    for li_i := 1 to gi_FilesPerPage do
    begin
      p_IncPrgressInd;
      ls_NameSurname := fs_RemplaceEspace ( fs_getNameAndSurName(IBQ_FilesFiltered), '_' );
      p_addKeyWord(IBQ_FilesFiltered.FieldByName(IBQDLLNOM).AsString, '-');
      p_addKeyWord(IBQ_FilesFiltered.FieldByName(IBQDLLPRENOM).AsString);
      li_CleFiche := IBQ_FilesFiltered.FieldByName(IBQ_CLE_FICHE).AsInteger;
      ls_NewName := IBQ_FilesFiltered.FieldByName(IBQDLLNOM).AsString;
      if (ls_NewName <> ls_Name) Then
       Begin
        if (ls_name = '') or ((length(ls_NewName) > 0) and
          (ls_NewName[1] <> ls_Name[1])) then
          lstl_HTMLAFolder.Add(CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"' + ls_NewName[1] + '" />')
        else if (ls_name = '') then
          lstl_HTMLAFolder.Add(CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"A" />');
        if length ( ls_NewName ) > 1 Then
          lstl_HTMLAFolder.Add(CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"' + ls_NewName + '" />');
       end;
      ls_Name := ls_NewName;
      case IBQ_FilesFiltered.FieldByName(IBQ_SEXE).AsInteger of
       IBQ_SEXE_MAN   : ls_NewName := CST_FILE_MAN;
       IBQ_SEXE_WOMAN : ls_NewName := CST_FILE_WOMAN;
       else
         ls_NewName := 'file';
      end;
      lstl_HTMLAFolder.Add(CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"' + ls_NameSurname + '" />');
      lstl_HTMLAFolder.Add(CST_HTML_BR + fs_CreateElementWithId ( CST_HTML_TABLE , ls_NewName + CST_FILE_Number + IntToStr(li_i) , CST_HTML_CLASS_EQUAL ) +
        CST_HTML_TR_BEGIN + fs_Create_TD ( ls_NewName + CST_FILE_Number + IntToStr(li_i), CST_HTML_CLASS_EQUAL, 2 ));
      lstl_HTMLAFolder.Add( CST_HTML_DIV_BEGIN + '<' + CST_HTML_H2 + CST_HTML_ID_EQUAL +'"subtitle">' + CST_HTML_IMAGE_SRC + '../' + CST_SUBDIR_HTML_IMAGES + '/' + ls_NewName + CST_EXTENSION_GIF + '" />' + ls_name +
        ' ' + IBQ_FilesFiltered.FieldByName(IBQDLLPRENOM).AsString + CST_HTML_H2_BEGIN + CST_HTML_DIV_END);
      lstl_HTMLAFolder.Add(CST_HTML_TD_END + CST_HTML_TR_END  + CST_HTML_TR_BEGIN  + CST_HTML_TD_BEGIN);
      p_AddInfos ( lstl_HTMLAFolder, li_CleFiche, li_i );
      lstl_HTMLAFolder.Add(CST_HTML_TD_END);
      lstl_HTMLAFolder.Add( fs_AddImageTable(fs_AddPhoto( li_CleFiche, fs_getaltPhoto(IBQ_FilesFiltered), ls_ImagesDir)));
      lstl_HTMLAFolder.Add( CST_HTML_TR_END );
      p_AddTrees ( lstl_HTMLAFolder, li_CleFiche, li_i );
      lstl_HTMLAFolder.Add( CST_HTML_TABLE_END + CST_HTML_BR);
      ls_NameEnd := IBQ_FilesFiltered.FieldByName(IBQDLLNOM).AsString;
      IBQ_FilesFiltered.Next;
      if IBQ_FilesFiltered.EOF then
       Begin
        lb_next:=False;
        Break;
       end ;
    end;
    if li_CounterPages - 1 > 0 Then
      lstl_HTMLAFolder.Add ( fs_CreatePrevNext ( li_CounterPages - 1, CST_PAGE_PREVIOUS, '../', ed_FileBeginName.Text ));
    if lb_next Then
      lstl_HTMLAFolder.Add ( fs_CreatePrevNext ( li_CounterPages + 1, CST_PAGE_NEXT, '../', ed_FileBeginName.Text ));
    lstl_HTMLAFolder.Add ( CST_HTML_CENTER_END );
    p_CreateAHtmlFile(lstl_HTMLAFolder, CST_FILE_SUBFILES, me_Description.Lines.Text,
      ( gs_AnceSTROWEB_Files ) + ' - ' + ls_NameBegin +
      ( gs_AnceSTROWEB_At ) + ls_NameEnd, '', '', gs_LinkGedcom, '..' + CST_HTML_DIR_SEPARATOR);
    ls_destination := FileCopy.Destination + DirectorySeparator +
      CST_SUBDIR_HTML_FILES + DirectorySeparator + ed_FileBeginName.Text + IntToStr(
      li_CounterPages) + CST_EXTENSION_HTML;
    try
      lstl_HTMLAFolder.SaveToFile(ls_destination);
    except
      On E: Exception do
      begin
        ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateHome ) + ls_destination + CST_ENDOFLINE + E.Message);
        Abort;
      end;
    end;
    lstl_HTMLAFolder.Free;
    Inc(li_CounterPages);
  end;

begin
  p_IncPrgressBar;
  p_Setcomments (( gs_AnceSTROWEB_Files ));
  li_CounterPages := 0;
  pb_ProgressInd.Position := 0;
  ls_ImagesDir := FileCopy.Destination + DirectorySeparator + CST_SUBDIR_HTML_FILES +
    DirectorySeparator + CST_SUBDIR_HTML_IMAGES + DirectorySeparator;
  ls_ArchivesDir := FileCopy.Destination + DirectorySeparator + CST_SUBDIR_HTML_ARCHIVE +
    DirectorySeparator ;
  fb_CreateDirectoryStructure(ls_ImagesDir);
  fb_CreateDirectoryStructure(ls_ArchivesDir);
  pb_ProgressInd.Max := IBQ_FilesFiltered.RecordCount;
  IBQ_FilesFiltered.First;
  p_SelectTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_Files ), '', False);
  ls_Name := '';
  p_IncPrgressBar;
  while not IBQ_FilesFiltered.EOF do
    p_AddAFolder;
  lstl_HTMLPersons := TStringList.Create;
  lstl_HTMLPersons.Text := fs_CreateULTabseets(gt_SheetsLetters,
    CST_SUBDIR_HTML_FILES + CST_HTML_DIR_SEPARATOR, CST_HTML_SUBMENU) +
    CST_HTML_CENTER_BEGIN + '<' + CST_HTML_Paragraph +
    CST_HTML_ID_EQUAL + '"head">' + fs_Replace_EndLines(
    me_FilesHead.Text) + CST_HTML_Paragraph_END;
  p_AddCounting ( lstl_HTMLPersons );
  lstl_HTMLPersons.Add(CST_HTML_CENTER_END);
  p_CreateKeyWords;
  pb_ProgressInd.Position := 0;
  p_IncPrgressBar;
  p_CreateAHtmlFile(lstl_HTMLPersons, CST_FILE_FILES, me_FilesHead.Lines.Text,
    ( gs_AnceSTROWEB_Files ), gs_AnceSTROWEB_Files, gs_ANCESTROWEB_Files_Long, gs_LinkGedcom);
  p_IncPrgressBar;
  ls_destination := FileCopy.Destination + DirectorySeparator +
    ed_FileBeginName.Text + CST_EXTENSION_HTML;
  try
    lstl_HTMLPersons.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateHome ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  lstl_HTMLPersons.Free;
  p_genHtmlList(IBQ_FilesFiltered);
end;

procedure TF_AncestroWeb.p_genPhpContact;
var
  lstl_HTMLContact: TStringList;
  lstl_HTMLContactBeforeHTML: TStringList;
  ls_destination: string;
begin
  p_Setcomments (( gs_AnceSTROWEB_Contact ));
  lstl_HTMLContact := TStringList.Create;
  lstl_HTMLContactBeforeHTML := TStringList.Create;
  p_LoadStringList(lstl_HTMLContact, gs_Root, CST_FILE_ContactInBody + CST_EXTENSION_PHP);
  p_ReplaceLanguageString(lstl_HTMLContact,CST_HTML_CAPTION,gs_ANCESTROWEB_MailCaption);
  p_ReplaceLanguageString(lstl_HTMLContact,CST_HTML_HEAD_DESCRIBE,StringReplace (me_ContactHead.Lines.Text, CST_ENDOFLINE, CST_HTML_BR, [rfReplaceAll]));
  p_ReplaceLanguagesStrings ( lstl_HTMLContact, CST_HTML_CONTACT_IN_LANG );
  p_LoadStringList(lstl_HTMLContactBeforeHTML, gs_Root, CST_FILE_ContactBefore + CST_EXTENSION_PHP);
  if cb_ContactSecurity.ItemIndex >= 0 Then
    p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_SECURITY,cb_ContactSecurity.Items[cb_ContactSecurity.ItemIndex]);
  if cb_ContactTool.ItemIndex >= 0 Then
    p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_MAILER,cb_ContactTool.Items[cb_ContactTool.ItemIndex]);
  p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_HOST,ed_ContactHost.Text);
  p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_FILE,ed_ContactName.Text+CST_EXTENSION_PHP);
  p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_LANG,gs_Lang);
  p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_PASSWORD,ed_ContactPassword.Text);
  p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_AUTHOR,ed_ContactAuthor.Text);
  p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_IDENTIFY,LowerCase(BoolToStr(ch_ContactIdentify.Checked)));
  p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_MAIL,ed_ContactMail.Text);
  p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_USERNAME,ed_ContactUser.Text);
  p_ReplaceLanguageString(lstl_HTMLContactBeforeHTML,CST_CONTACT_PORT,se_ContactPort.Text);
  p_CreateKeyWords;
  pb_ProgressInd.Position := 0;
  p_CreateAHtmlFile(lstl_HTMLContact, CST_FILE_Contact, me_ContactHead.Lines.Text,
    ( gs_AnceSTROWEB_Contact ), gs_AnceSTROWEB_Contact, gs_ANCESTROWEB_MailCaption, gs_LinkGedcom,
    '', CST_EXTENSION_PHP, lstl_HTMLContactBeforeHTML.Text);
  p_IncPrgressBar;
  ls_destination := FileCopy.Destination + DirectorySeparator + ed_ContactName.Text + CST_EXTENSION_PHP;
  try
    lstl_HTMLContact.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateContact ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  lstl_HTMLContact.Free;
  lstl_HTMLContactBeforeHTML.Free;
end;


procedure TF_AncestroWeb.p_genHtmlSearch;
var
  lstl_HTMLSearch: TStringList;
  ls_destination, ls_AfterHead: string;
begin
  p_Setcomments (( gs_AnceSTROWEB_Search ));
  pb_ProgressInd.Position := 0;
  lstl_HTMLSearch := TStringList.Create;
  ls_AfterHead := lstl_HTMLSearch.Text;
  p_CreateAHtmlFile(lstl_HTMLSearch, CST_FILE_SEARCH, me_searchHead.Lines.Text,
        ( gs_AnceSTROWEB_Search ), gs_AnceSTROWEB_Search, gs_ANCESTROWEB_SearchLong, gs_LinkGedcom, '');

  p_ReplaceLanguageString(lstl_HTMLSearch,CST_HTML_HEAD_DESCRIBE, StringReplace(me_searchHead.Text,CST_ENDOFLINE,'<BR />',[]));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_HTML_SEND      , ( gs_AnceSTROWEB_Send  ));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_HTML_RESET     , ( gs_AnceSTROWEB_Reset ));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_SEARCH_DOMAIN  ,Trim(ed_SearchSite.Text));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_SEARCH_SEARCH  , ( gs_AnceSTROWEB_Search ));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_SEARCH_SEARCH  , ( gs_AnceSTROWEB_Search ));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_SEARCH_SEARCH_QUER  ,ed_SearchQuery.Text);
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_SEARCH_SEARCH_TOOL  ,ed_SearchTool.Text);

  ls_destination := FileCopy.Destination + DirectorySeparator + ed_SearchName.Text  + CST_EXTENSION_HTML;
  try
    lstl_HTMLSearch.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateContact ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  lstl_HTMLSearch.Free;
  p_IncPrgressBar;
end;

procedure TF_AncestroWeb.p_genHtmlAges;
var
  lstl_HTMLAges ,
  lstl_HTMLLines: TStringList;
  ls_destination, ls_AfterHead: string;
  li_Age, li_count, li_countTotal, li_MenTotal, li_WomenTotal : Longint;
  procedure p_setHtmlReplaceValues;
  Begin
    p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_COUNT      , IntToStr(li_count),[]);
    p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_MEN_COUNT  , CST_ZERO          ,[]);
    p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_WOMEN_COUNT, CST_ZERO          ,[]);
  end;

begin
  p_Setcomments ( gs_ANCESTROWEB_Ages );
  pb_ProgressInd.Position := 0;
  lstl_HTMLAges  := TStringList.Create;
  lstl_HTMLLines := TStringList.Create;
  p_LoadStringList ( lstl_HTMLLines, gs_Root, CST_FILE_AGES_LINE + CST_EXTENSION_HTML );
  ls_AfterHead := lstl_HTMLAges.Text;
  p_CreateAHtmlFile(lstl_HTMLAges, CST_FILE_AGES, me_HeadAges.Lines.Text,
        ( gs_ANCESTROWEB_Ages ), gs_ANCESTROWEB_Ages, gs_ANCESTROWEB_Ages_Long, gs_LinkGedcom, '');

  p_ReplaceLanguageString(lstl_HTMLAges,CST_HTML_HEAD_DESCRIBE, StringReplace(me_HeadAges.Text,CST_ENDOFLINE,'<BR />',[]));

  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_AN_AGE     , gs_ANCESTROWEB_AnAge    ,[]);
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_COUNT      , gs_ANCESTROWEB_Persons_Count    ,[]);
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_MEN_COUNT  , gs_ANCESTROWEB_Men_Count    ,[]);
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_WOMEN_COUNT, gs_ANCESTROWEB_Women_Count    ,[]);
  li_Age := -1;
  li_countTotal :=0;
  li_MenTotal   :=0;
  li_WomenTotal :=0;
  with DMWeb.IBQ_Ages do
    try
      Close;
      ParamByName(I_DOSSIER).Value:=fCleDossier;
      Open;
      while not Eof do
        Begin
          if FieldByName(IBQ_AGE_AU_DECES).IsNull Then
            Begin
             Next;
             Continue;
            end;
          if li_Age <> FieldByName(IBQ_AGE_AU_DECES).AsInteger Then
            Begin
              p_setHtmlReplaceValues;
              p_ReplaceLanguageString(lstl_HTMLAges,CST_AGES_LINES  ,lstl_HTMLLines.Text+'['+CST_AGES_LINES+']');
              li_Age:= FieldByName(IBQ_AGE_AU_DECES).AsInteger ;
              p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_AN_AGE, IntToStr(li_Age)  ,[]);
              li_count := 0;
            end;
          inc ( li_count, FieldByName ( IBQ_COUNTER ).AsInteger );
          inc ( li_countTotal, li_count );
          if FieldByName(IBQ_SEXE).AsInteger = IBQ_SEXE_MAN Then
           Begin
             p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_MEN_COUNT  , FieldByName ( IBQ_COUNTER ).AsString,[]);
             inc ( li_MenTotal, FieldByName ( IBQ_COUNTER ).AsInteger );
           end
          Else
           if FieldByName(IBQ_SEXE).AsInteger = IBQ_SEXE_WOMAN Then
             Begin
               p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_WOMEN_COUNT  , FieldByName ( IBQ_COUNTER ).AsString,[]);
               inc ( li_WomenTotal, FieldByName ( IBQ_COUNTER ).AsInteger );
             end;
          Next;
        end;
    except
      On E: Exception do
      begin
        ShowMessage(fs_getCorrectString ( gs_ANCESTROWEB_cantOpenData ) + DMWeb.IBQ_Ages.Database.DatabaseName + CST_ENDOFLINE + E.Message);
        Abort;
      end;
    end;
  p_setHtmlReplaceValues;
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_LINES      ,lstl_HTMLLines.Text);
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_AN_AGE     , gs_ANCESTROWEB_TotalAgeDead,[]);
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_COUNT      , IntToStr(li_countTotal),[]);
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_MEN_COUNT  , IntToStr(li_MenTotal)  ,[]);
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_WOMEN_COUNT, IntToStr(li_WomenTotal),[]);
  DMWeb.IBQ_Ages.Close;

  ls_destination := FileCopy.Destination + DirectorySeparator + ed_AgesName.Text  + CST_EXTENSION_HTML;
  try
    lstl_HTMLAges.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateContact ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  lstl_HTMLAges.Free;
  lstl_HTMLLines.Free;
  p_IncPrgressBar;
end;

procedure TF_AncestroWeb.p_CreateAHtmlFile(const astl_Destination: TStringList;
  const as_BeginingFile,
  as_Describe, as_Title, as_LittleTitle, as_LongTitle: string;
  as_BottomHTML: string;
  const as_Subdir: string = '';
  const as_ExtFile: string =
  CST_EXTENSION_HTML;
  const as_BeforeHTML: string = '');
var
  lstl_Head: TStringList;
begin
  if as_BottomHTML <> '' then
    as_BottomHTML := '<' + CST_HTML_Paragraph + CST_HTML_ID_EQUAL + '"gedcom">' +
      CST_HTML_AHREF + as_Subdir + as_BottomHTML + '">' + ( gs_AnceSTROWEB_DownloadGedcom ) +
      CST_HTML_A_END + CST_HTML_Paragraph_END;
  as_BottomHTML := '<' + CST_HTML_DIV + CST_HTML_ID_EQUAL + '"bottomDIV">' +
    '<' + CST_HTML_Paragraph + CST_HTML_ID_EQUAL + '"bottom">' +
    me_Bottom.Lines.Text + CST_HTML_Paragraph_END +
    as_BottomHTML + '<' + CST_HTML_Paragraph + CST_HTML_ID_EQUAL + '"bottom">' +
    ( gs_AnceSTROWEB_CreatedBy ) + ' ' + CST_HTML_STRONG_BEGIN +
    CST_AncestroWeb_WithLicense + ' - ' + CST_HTML_AHREF +
    'http://www.liberlog.fr">' + CST_AUTHOR +
    CST_HTML_A_END + CST_HTML_STRONG_END + CST_HTML_Paragraph_END + CST_HTML_DIV_End;
  if as_LittleTitle <> '' then
    p_SelectTabSheet(gt_TabSheets, as_LittleTitle);
  p_CreateHTMLFile(gt_TabSheets, astl_Destination, as_BottomHTML,
    gs_Root, as_Describe, gstl_HeadKeyWords.Text, gs_HTMLTitle + ' - ' +
    as_Title, as_LongTitle, 'main', as_BeginingFile + '1' + as_ExtFile, as_BeginingFile + '2' +
    as_ExtFile, as_BeginingFile + '3' + as_ExtFile, as_BeginingFile +
    '4' + as_ExtFile, as_Subdir, as_BeforeHTML);
  if as_LittleTitle <> '' then
    p_SelectTabSheet(gt_TabSheets, as_LittleTitle, '', False);
end;

procedure TF_AncestroWeb.DoInit(sBase: string);
var
  Save_Cursor: TCursor;
  Ok:Boolean;
begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass; { Affiche le curseur en forme de sablier }
  try
    if not Assigned(DMWeb) then
    begin
      DMWeb := TDMWeb.Create(self);
    end;
    Ok:=True;
    if not DMWeb.IBT_BASE.Active then
      Ok:=DoOpenBase(sBase);
    if Ok then
      Ok:=OuvreDossier(fCleDossier);
    if Ok then
      DoAfterInit;
    PremiereOuverture:=False;
  finally
    Screen.Cursor := Save_Cursor; { Revient toujours à normal }
  end;
end;

function TF_AncestroWeb.DoOpenBase(sBase: string):boolean;
var //ouvre la base, liste les dossiers et sélectionne le premier ou celui de la table dll à la première ouverture
  s:string;
begin
  Result:=DMWeb.doOpenDatabase(sBase);
  if Result then
  begin
    ListerDossiers;
    if PremiereOuverture then
    begin
      Result:=DMWeb.LitDllDossier;
      if Result then
      begin
        s:=IntToStr(fCleDossier);
        if Length(s)<2 then
          s:=s+' ';
        cbDossier.Caption:=s+', '+fNom_Dossier;
      end;
    end;
  end;
end;

function TF_AncestroWeb.OuvreDossier(NumDossier:integer):boolean;
begin
  Result:=True;
  try
    IBQ_Individu.Close;
    IBQ_Individu.ParamByName(KLE_DOSSIER).AsInteger:=NumDossier;
    IBQ_Individu.Open;
    if PremiereOuverture then
      IBQ_Individu.Locate(IBQ_CLE_FICHE,fCleFiche,[])
    else
    begin
      fCleFiche:=IBQ_Individu.FieldByName(IBQ_CLE_FICHE).AsInteger;
      fNomIndi:=IBQ_Individu.FieldByName('nom').AsString;
      fPrenomIndi:=IBQ_Individu.FieldByName('prenom').AsString;
    end;
    fCleDossier:=NumDossier;
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantOpenData ) +
        sDataBaseName + CST_ENDOFLINE + E.Message);
      Result:=False;
    end;
  end;
end;

// procedure TF_AncestroWeb.DoAfterInit
// initing components and ini
procedure TF_AncestroWeb.DoAfterInit;
begin
  fNom_Dossier:=ChaineUTF8EnNomVariable(fNom_Dossier);
  fBasePath := GetUserDir;
  {$IFNDEF FPC}
  de_ExportWeb.RootDir:=GetWindowsSpecialDir(CSIDL_DESKTOPDIRECTORY);
  {$ELSE}
  fBasePath := GetUserDir;
  {$ENDIF}
  fBasePath:=fBasePath+CST_AncestroWeb+DirectorySeparator+fNom_Dossier;
  FileCopy.Destination := fBasePath + DirectorySeparator + CST_SUBDIR_EXPORT ;
  fb_CreateDirectoryStructure( FileCopy.Destination );
  fb_CreateDirectoryStructure( fBasePath + DirectorySeparator + CST_SUBDIR_SAVE );
  de_ExportWeb.Directory := fBasePath+DirectorySeparator+CST_SUBDIR_EXPORT;
  fne_Import.FileName := fBasePath + DirectorySeparator + CST_SUBDIR_SAVE ;
  fne_Export.FileName := fBasePath + DirectorySeparator + CST_SUBDIR_SAVE ;

  // Reading ini
  OnFormInfoIni.p_ExecuteLecture(Self);
end;

procedure TF_AncestroWeb.FormCreate(Sender: TObject);
var
  fbddpath:String;
{$IFDEF WINDOWS}
  fKeyRegistry,s: string;
  i:Integer;
{$ENDIF}
begin
{$IFDEF FPC}//à faire une version Delphi
  if InstanceRunning(CST_AncestroWeb) then
  begin
    ShowMessage('Vous ne devez exécuter qu''une seule session d''AncestroWeb');
    {$ifdef unix}
    FpKill(FpGetpid, 9);
    {$endif}
    {$ifdef windows}
    TerminateProcess(GetCurrentProcess, 0);
    {$endif}
  end;
{$ENDIF}
  PremiereOuverture:=True;
  f_GetMainMemIniFile(nil,nil,nil,CST_AncestroWeb);


{$IFDEF WINDOWS}
  edNomBase.Clear;
  with TRegistry.create do
  try
    RootKey := HKEY_CURRENT_USER;
    fKeyRegistry:='\SOFTWARE\'+CST_MANIA+'\Path';
    if OpenKeyReadOnly(fKeyRegistry) then
    begin
      fbddpath:=ReadString('PathFileNameBdd');
      edNomBase.Text:=fs_getCorrectString(fbddpath);
      CloseKey;
    end;
    fKeyRegistry:='\SOFTWARE\'+CST_MANIA+'\Settings';
    if OpenKeyReadOnly(fKeyRegistry) then
    begin
      for i:=0 to edNomBase.DropDownCount-1 do
      begin //bizarre, cette boucle ne fonctionne pas avec un TRegIniFile, ou il faudrait fermer la clé entre chaque lecture
        s:=ReadString('NomBase'+IntToStr(i));
        if s>'' then
          edNomBase.Items.Add(fs_getCorrectString(s));
      end;
    end;
  finally
    Free;
  end;
  gs_Root:=ExtractFilePath(Application.ExeName); //l'application doit être dans le même répertoire qu'Ancestromania pour utiliser le même gds32.dll
{$ELSE}
  gs_Root:=f_IniReadSectionStr('Path','PathAppli','')+DirectorySeparator;
  if Length(gs_Root)<=1 then
    gs_Root:=ExtractFilePath(Application.ExeName);
  fbddpath := '/var/lib/firebird/2.5/data/Ancestro.fdb'; //valable pour tests, mais il faudra trouver autre chose
{$ENDIF}
  gs_Root:=gs_Root+CST_AncestroWeb+DirectorySeparator;//pas dans plugins pour l'exe

  try
    cb_Themes.Items.Clear;
    fb_FindFiles(cb_Themes.Items, gs_Root + CST_SUBDIR_THEMES, False);
  except

  end;
  try
    cb_Files.Items.Clear;
    fb_FindFiles(cb_Files.Items, gs_Root + CST_SUBDIR_SOURCES, False);
  except

  end;

  // ici mettre la taille initiale car avec les skins, les fenetres se resize
  Width := 640;
  Height := 400;
  PCPrincipal.ActivePage:=ts_Gen;
  Caption := fs_getCorrectString(CST_AncestroWeb_WithLicense+' : '+gs_AnceSTROWEB_FORM_CAPTION);
  DoInit(fbddpath);
end;

procedure TF_AncestroWeb.TraduceImageFailure(Sender: TObject;
  const ErrorCode: integer; var ErrorMessage: string; var ContinueCopy: boolean);
begin
  ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateImage ) + ErrorMessage);
end;

function TF_AncestroWeb.ChaineUTF8EnNomVariable(Chaine:String):String;
var
  n:integer;
  c:Char;
begin
{$IFDEF FPC}
  Chaine:=Utf8ToAnsi(Chaine);
{$ENDIF}
  Result:=Chaine;
  for n:=1 to Length(Chaine) do
  begin
    c:=Result[n];
    if not ((c in ['0'..'9'])or(c in ['A'..'z'])) then
      Result[n]:='_';
  end;
end;

Procedure TF_AncestroWeb.ListerDossiers;
var
  s:string;
begin
  with TIBSQL.Create(self) do
  begin
    try
      Database:=DMWeb.ibd_BASE;
      ParamCheck:=False;
      SQL.Text:='select CLE_DOSSIER,NOM_DOSSIER FROM DOSSIER ORDER BY CLE_DOSSIER';
      ExecQuery;
      cbDossier.Items.Clear;
      while not EOF do
      begin
        s:=Fields[0].AsString;
        if Length(s)<2 then
          s:=s+' ';
        cbDossier.Items.Add(s+', '+fs_getCorrectString(Fields[1].AsString));
        if cbDossier.Items.Count=1 then
        begin
          fCleDossier:=Fields[0].AsInteger;
          fNom_Dossier:=fs_getCorrectString(Fields[1].AsString);
          cbDossier.Caption:=cbDossier.Items[0];
        end;
        Next;
      end;
      Close;
    finally
      Free;
    end;
  end;
end;

end.

