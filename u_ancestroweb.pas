unit U_AncestroWeb;

{$IFDEF FPC}
{$mode objfpc}{$H+}
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
// Historique
// 1.1.4.1 : Gestion de versions
// 1.1.4.0 : Plus de TIBSQL, copie de l'archive originale fonctionnel, moins de bugs
// 1.1.3.1 : Professions dans la fiche de l'individu, Possibilité de descendre son arbre familial
// 1.1.1.2 : Plus de tests
// 1.1.1.1 : Métiers et âges
// 1.0.0.0 : Intégration dans Freelogy
// 0.9.9.0 : première version publiée
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
  fonctions_string,
{$ifdef windows}
  Windows,
{$endif}
{$IFDEF WIN32}
  Registry,
{$ENDIF}
  fonctions_version,
  U_DMWeb, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DB,
  IBQuery, DBCtrls, ExtCtrls, Buttons, ComCtrls, DBGrids,
  functions_html, JvXPCheckCtrls, Spin, FileUtil, U_OnFormInfoIni,
  U_ExtImage, u_buttons_appli, IBSQL, U_ExtFileCopy, u_traducefile,
  JvXPButtons, IniFiles;

  const
    gVer_AncestroWeb : T_Version = ( Component : 'Application Ancestroweb' ;
                                               FileUnit : 'U_AncestroWeb' ;
                                               Owner : 'Matthieu Giroux' ;
                                               Comment : 'Composant de copie multi-platformes.' ;
                                               BugsStory : '1.2.2.1 : Link to jobs'' base' +#13#10
                                                         + '1.2.2.0 : Link to cities, names, surnames base' +#13#10
                                                         + '1.2.1.1 : Hide dates lesser than 100 years' +#13#10
                                                         + '1.2.1.0 : Better look and interactivity' +#13#10
                                                         + '1.2.0.0 : Adding Map' +#13#10
                                                         + '1.1.5.0 : Adding versioning' +#13#10
                                                         + '1.1.4.0 : More of TIBSQL, copy original media, less bugs' +#13#10
                                                         + '1.1.3.1 : Jobs in Person''s file, Tree descending' +#13#10
                                                         + '1.1.1.2 : More tests' +#13#10
                                                         + '1.1.1.1 : Jobs and ages' +#13#10
                                                         + '1.0.0.0 : Integrating in Freelogy' +#13#10
                                                         + '0.9.9.0 : First published version' ;
                                               UnitType : CST_TYPE_UNITE_APPLI ;
                                               Major : 1 ; Minor : 2 ; Release : 2 ; Build : 1 );


type

  { TF_AncestroWeb }

  TF_AncestroWeb = class(TForm)
    btnSelectBase: TSpeedButton;
    bt_export: TFWSaveAs;
    cb_CityAccents: TComboBox;
    cb_ContactSecurity: TComboBox;
    cb_ContactTool: TComboBox;
    cb_NamesAccents: TComboBox;
    cb_JobsAccents: TComboBox;
    cb_SurnamesAccents: TComboBox;
    ch_ancestors: TJvXPCheckBox;
    ch_CitiesLink: TJvXPCheckbox;
    ch_Comptage: TJvXPCheckbox;
    ch_ContactIdentify: TJvXPCheckbox;
    ch_Filtered: TJvXPCheckBox;
    ch_genages: TJvXPCheckbox;
    ch_genContact: TJvXPCheckbox;
    ch_genjobs: TJvXPCheckbox;
    ch_gensurnames: TJvXPCheckbox;
    cb_Themes: TComboBox;
    cbDossier: TComboBox;
    ch_genMap: TJvXPCheckbox;
    ch_genSearch: TJvXPCheckbox;
    ch_genTree: TJvXPCheckbox;
    ch_HideLessThan100: TJvXPCheckbox;
    ch_Images: TJvXPCheckbox;
    ch_NamesLink: TJvXPCheckbox;
    ch_JobsLink: TJvXPCheckbox;
    ch_ShowMainFile: TJvXPCheckbox;
    ch_SurnamesLink: TJvXPCheckbox;
    DBGrid1: TDBGrid;
    de_ExportWeb: TDirectoryEdit;
    ds_Individu: TDatasource;
    edNomBase: TComboBox;
    ed_AgesName: TEdit;
    ed_Author: TEdit;
    ed_BaseCities: TEdit;
    ed_BaseNames: TEdit;
    ed_BaseJobs: TEdit;
    ed_BaseSurnames: TEdit;
    ed_ContactAuthor: TEdit;
    ed_ContactHost: TEdit;
    ed_ContactMail: TEdit;
    ed_ContactName: TEdit;
    ed_ContactPassword: TEdit;
    ed_ContactPassword2: TEdit;
    ed_ContactUser: TEdit;
    ed_FileBeginName: TEdit;
    ed_IndexName: TEdit;
    ed_JobsName: TEdit;
    ed_ListsBeginName: TEdit;
    ed_SurnamesFileName: TEdit;
    ed_MapFileName: TEdit;
    ed_SearchName: TEdit;
    ed_SearchQuery: TEdit;
    ed_SearchSite: TEdit;
    ed_SearchTool: TEdit;
    ed_TreeName: TEdit;
    ExtImage1: TExtImage;
    ExtImage2: TExtImage;
    ExtImage3: TExtImage;
    FileCopy: TExtFileCopy;
    FileIniCopy: TExtFileCopy;
    fne_Export: TFileNameEdit;
    fne_import: TFileNameEdit;
    FWEraseGedcom: TJvXPButton;
    FWEraseImage: TFWErase;
    FWEraseImage2: TFWErase;
    FWEraseImage3: TFWErase;
    FWPreview1: TFWPreview;
    FWClose1: TFWClose;
    bt_gen: TFWSaveAs;
    IBQ_Individu: TIBQuery;
    GedcomEdit: TFileNameEdit;
    ImageEdit1: TFileNameEdit;
    ImageEdit2: TFileNameEdit;
    ImageEdit3: TFileNameEdit;
    JvXPButton1: TJvXPButton;
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
    Label2: TLabel;
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
    Label3: TLabel;
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
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    LabelBase: TLabel;
    lb_Comments: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    lb_DescribeMap: TLabel;
    lb_Images: TLabel;
    me_Bottom: TMemo;
    me_ContactHead: TMemo;
    me_MapHead: TMemo;
    me_Description: TMemo;
    me_FilesHead: TMemo;
    me_HeadAges: TMemo;
    me_HeadJobs: TMemo;
    me_HeadTree: TMemo;
    me_surnamesHead: TMemo;
    me_searchHead: TMemo;
    OnFormInfoIni: TOnFormInfoIni;
    OpenDialog: TOpenDialog;
    PageControl1: TPageControl;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel2: TPanel;
    Panel9: TPanel;
    pc_needed: TPageControl;
    Panel10: TPanel;
    Panel8: TPanel;
    PCPrincipal: TPageControl;
    Panel1: TPanel;
    pa_About: TScrollbox;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    pb_ProgressInd: TProgressBar;
    pb_ProgressAll: TProgressBar;
    se_ContactPort: TSpinEdit;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    spSkinPanel1: TPanel;
    ts_global: TTabSheet;
    ts_ages: TTabSheet;
    ts_jobs: TTabSheet;
    ts_contact: TTabSheet;
    ts_tree: TTabSheet;
    ts_search: TTabSheet;
    ts_surnames: TTabSheet;
    ts_options: TTabSheet;
    ts_Files: TTabSheet;
    ts_home: TTabSheet;
    ts_needed: TTabSheet;
    TraduceImage: TTraduceFile;
    ts_about: TTabSheet;
    ts_Gen: TTabSheet;
    cb_Files: TComboBox;
    Label44: TLabel;
    procedure btnSelectBaseClick(Sender: TObject);
    procedure bt_exportClick(Sender: TObject);
    procedure bt_genClick(Sender: TObject);
    procedure cbDossierChange(Sender: TObject);
    procedure ch_FilteredClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure de_ExportWebAcceptDirectory(Sender: TObject;{$IFDEF FPC} var Value: string{$ELSE} var Name: string;
    var Action: Boolean{$ENDIF});
    procedure edNomBaseChange(Sender: TObject);
    procedure edNomBaseOpen;
    procedure FileCopyDoEraseDir(Sender: TObject; var Continue: boolean);
    procedure FileCopyFailure(Sender: TObject; const ErrorCode: integer;
      var ErrorMessage: string; var ContinueCopy: boolean);
    procedure fne_ExportAcceptFileName(Sender: TObject; var Value: String);
    procedure fne_importAcceptFileName(Sender: TObject; var Value: String);
    procedure FWEraseImage3Click(Sender: TObject);
    procedure FWEraseImage2Click(Sender: TObject);
    procedure FWEraseImageClick(Sender: TObject);
    procedure FWPreview1Click(Sender: TObject);
    procedure ImageEdit2Change(Sender: TObject);
    procedure ImageEdit3Change(Sender: TObject);
    procedure ImageEdit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JvXPButton1Click(Sender: TObject);
    procedure OnFormInfoIniIniLoad(const AInifile: TCustomInifile;
      var Continue: Boolean);
    procedure OnFormInfoIniIniWrite(const AInifile: TCustomInifile;
      var Continue: Boolean);
    procedure PCPrincipalChange(Sender: TObject);
    procedure TraduceImageFailure(Sender: TObject; const ErrorCode: integer;
      var ErrorMessage: string; var ContinueCopy: boolean);
  private
    { Déclarations privées }
    PremiereOuverture:boolean;
    procedure DoAfterInit( const ab_Ini : Boolean = True );
    function DoOpenBase(sBase: string):boolean;
    function fb_Showdate(const adt_Date: TDateTime): Boolean;
    function fb_ShowYear(const ai_Year: Integer): Boolean;
    function fs_getLinkedBase(const as_Texte: String;
      const as_Link: String; const ai_ComboIndex: Integer ): String;
    function fs_getLinkedCity(const as_Texte: String ): String;
    function fs_getLinkedJob(const as_Texte: String): String;
    function fs_getLinkedName(const as_Texte: String; var aa_listWords : TUArray ): String;
    function fs_getLinkedSurName(const as_Texte: String ): String;
    function fs_GetNameLink( as_name : String ; const as_Showed : String ; const as_SubDir : String = ''):String ;
    function OuvreDossier(NumDossier:integer):boolean;
    function fb_getMediaFile ( const IBQ_Media : TIBQuery;
                               const as_FilePath: string ;
                               var as_FileNameBegin : String ): Boolean;
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
    function fs_getaltPhoto(const IBQ_IndividuFiltered: TIBQuery): String; virtual; overload;
    function fs_getaltPhoto(const IBQ_IndividuFiltered: TIBSQL): String; virtual; overload;
    function fs_getNameAndSurName(const ibq_Query: TIBQuery): String; virtual; overload;
    function fs_getNameAndSurName(const ibq_Query: TIBSQL): String; virtual; overload;
    function fs_GetTitleTree(const as_NameOfTree: String;
                             const ai_generations: Longint): String;
    procedure p_AddABase(const as_Base: String; const ab_SetIndex :Boolean = True);
    procedure p_CopyStructure;
    procedure p_CreateAHtmlFile(const astl_Destination: TStringList;
      const as_BeginingFile, as_Describe, as_Title, as_LittleTitle, as_LongTitle: string;
      as_BottomHTML: string;
      const as_Subdir: string = '';
      const as_ExtFile: string = CST_EXTENSION_HTML;
      const as_BeforeHTML: string = ''; const astl_Body : TStringList = nil );
    function fi_CreateHTMLTree(const IBQ_Tree: TIBQuery;
      const astl_HTMLTree: TStrings;
      const ai_Clefiche: longint;
      const ab_Link: boolean = True;
      const ab_Progress: boolean = True;
      const ab_NotFirst: boolean = False;
      const as_IdSosa: string = IBQ_TQ_SOSA;
      const ab_Asc: boolean = True): longint;
    function fi_CreateSheets: integer;
    procedure p_createLettersSheets (var at_SheetsLetters : TAHTMLULTabSheet;
                                     const IBQ_FilesFiltered: TIBQuery;
                                     const ai_PerPage : Integer;
                                     const as_BeginFile : String);
    procedure p_genHtmlAges;
    procedure p_genHtmlFiles(const IBQ_FilesFiltered: TIBQuery);
    procedure p_genHtmlJobs;
    procedure p_genHtmlList(const IBQ_FilesFiltered: TIBQuery);
    procedure p_genHtmlsurnames(const IBS_FilesFiltered: TIBSQL);
    procedure p_genHtmlSearch;
    procedure p_genPhpContact;
    procedure p_genHtmlHome;
    procedure p_genHTMLTitle;
    procedure p_genHTMLTree ( const IBQ_tree : TIBQuery );
    procedure p_ImageEditChange(const aei_Image: TExtImage; const Sender: TObject);
    procedure p_ImageEditErase(const afne_EditImage: TFileNameEdit);
    procedure p_IncProgressBar;
    procedure p_IncProgressInd;
    procedure p_iniReadKey;
    procedure p_iniWriteKey;
    function fb_OpenTree(const AIBQ_Tree: TIBQuery; const ai_Cle: longint;
      const ai_Niveau: integer = 0;const ai_Sexe: integer = 0): boolean; virtual; overload;
    function fb_OpenTree(const AIBQ_Tree: TIBSQL; const ai_Cle: longint;
      const ai_Niveau: integer = 0;const ai_Sexe: integer = 0): boolean; virtual; overload;
    procedure p_Setcomments(const as_Comment: String);
    procedure ListerDossiers;
  public
    { Déclarations publiques }
    function DoInit(const sBase: string):Boolean;
    function DoInitBase(const AedNomBase: TCustomComboBox):Boolean;
  end;

var
  F_AncestroWeb: TF_AncestroWeb;
  gs_HTMLTitle: string = '';
  gb_EraseExport: boolean = True;
  gb_Generate : boolean = False;
  gi_CleFiche: integer = 0;
  gs_LinkGedcom: string;
  gs_RootPathForExport: string;
  gt_SheetsLetters: TAHTMLULTabSheet;
  gt_ExistingPersons : Array of Longint;

function fs_AddComma ( const as_Chaine : String ) : String ;

implementation

uses  fonctions_init,
  functions_html_tree,
  u_extabscopy,
{$IFNDEF FPC}
  AncestroWeb_strings_delphi,
  windirs,
{$ELSE}
  AncestroWeb_strings,UniqueInstanceRaw,
{$ENDIF}
{$IFDEF WIN32}
//  windirs,
{$ENDIF}
  fonctions_system,
  fonctions_db,
  fonctions_languages,
  fonctions_images,
  fonctions_components,
  fonctions_file;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

var lw_CurrentYear  : Word = 0;
    ldt_100YearData : TDateTime = 0;

function fs_AddComma ( const as_Chaine : String ) : String ;
Begin
  if as_Chaine <> ''
   Then  Result := ' (' +as_Chaine+')'
   Else  Result := '';
End;

// function GetCurrentYear
// Get Current Year
function GetCurrentYear: word;
var
  d,m,y: word;
begin
  if lw_CurrentYear = 0 Then
    DecodeDate(Now, lw_CurrentYear, m, d);
  Result := lw_CurrentYear;
end;

// function Get100YearDated
// Get now - 100 Year
function Get100YearDated: TDateTime;
var
  d,m,y: word;
begin
  if ldt_100YearData = 0 Then
    ldt_100YearData := EncodeDate(GetCurrentYear-100,1,1);
  Result:=ldt_100YearData;
end;

// function TF_AncestroWeb.fb_ShowYear
// show date or not
function TF_AncestroWeb.fb_ShowYear ( const ai_Year : Integer ): Boolean ;
Begin
  Result :=  not ch_HideLessThan100.Checked
    or ( ai_Year <  GetCurrentYear - 100 );
//  ShowMessage ( IntToStr(GetCurrentYear) + ' ' + FormatDateTime( 'yyyy', Get100YearDated)  + ' ' + DateToStr( Get100YearDated)) ;
end;

// function TF_AncestroWeb.fb_Showdate
// show date or not
function TF_AncestroWeb.fb_Showdate ( const adt_Date : TDateTime ): Boolean ;
Begin
  Result :=  not ch_HideLessThan100.Checked
    or ( adt_Date < Get100YearDated );
end;
// procedure TF_AncestroWeb.FormDestroy
// Freeing data objects on destroy event
procedure TF_AncestroWeb.FormDestroy(Sender: TObject);
begin
  DMWeb.Free;
  DMWeb := nil;
end;


// procedure TF_AncestroWeb.p_createLettersSheets
// creating a HTML list of letters
procedure p_createExistingPersons (const IBQ_FilesFiltered: TIBQuery; const ab_DisableControls : Boolean = True);
Begin
  Finalize(gt_ExistingPersons);
  with IBQ_FilesFiltered do
  if not IsEmpty Then
    Begin
      if ab_DisableControls Then
        DisableControls;
      First;
      while not EOF do
        try
          SetLength(gt_ExistingPersons, high ( gt_ExistingPersons ) + 2);
          gt_ExistingPersons [ high ( gt_ExistingPersons )] := FieldByName(IBQ_CLE_FICHE).AsInteger;
          Next;
        finally
        end;
      if ab_DisableControls Then
        EnableControls;
    end;
end;

function fb_IsCreatedPerson ( const ai_Key : Longint ):Boolean;
var li_i : Longint;
Begin
  Result := False;
  for li_i := 0 to high ( gt_ExistingPersons ) do
    if gt_ExistingPersons [ li_i ] = ai_Key Then
      Begin
        Result := True;
        Exit;
      end;
end;

// procedure TF_AncestroWeb.DBGrid1CellClick
// Writeng ini on dbgrid click
procedure TF_AncestroWeb.DBGrid1CellClick(Column: TColumn);
begin
  p_iniWriteKey;
end;

// procedure TF_AncestroWeb.p_iniWriteKey
// Writing the DBGrid ini key
procedure TF_AncestroWeb.p_iniWriteKey;
begin
  if IBQ_Individu.Active Then
    fCleFiche := IBQ_Individu.FieldByName(IBQ_CLE_FICHE).AsInteger;
  p_IniWriteSectionInt(CST_INI_ANCESTROWEB_SECTION, IBQ_CLE_FICHE, fCleFiche);
end;

// procedure TF_AncestroWeb.p_iniReadKey
// Reading the DBGrid ini key
procedure TF_AncestroWeb.p_iniReadKey;
begin
  fCleFiche := f_IniReadSectionInt(CST_INI_ANCESTROWEB_SECTION, IBQ_CLE_FICHE, fCleFiche);
  if IBQ_Individu.Active Then
    IBQ_Individu.Locate(IBQ_CLE_FICHE,fCleFiche,[]);
end;

// procedure TF_AncestroWeb.de_ExportWebAcceptDirectory
// Web site export : Simplifying user's interactivity
procedure TF_AncestroWeb.de_ExportWebAcceptDirectory(Sender: TObject;
 {$IFDEF FPC} var Value: string{$ELSE} var Name: string;
    var Action: Boolean{$ENDIF});
begin
  gb_EraseExport := False;
end;

procedure TF_AncestroWeb.edNomBaseChange(Sender: TObject);
begin
  edNomBaseOpen;
end;

// procedure TF_AncestroWeb.edNomBaseExit
// Database's folder opening on Nombaseedit's Exit
procedure TF_AncestroWeb.edNomBaseOpen;
var
  NumDossier:Integer;
begin
  if  DoInitBase(edNomBase)
  and fb_AutoComboInit(cbDossier)
   then
    begin
      NumDossier:=StrToInt(trim(copy(cbDossier.Caption,1,2)));
      if OuvreDossier(NumDossier) then
      begin
       fNom_Dossier:=fs_getCorrectString(copy(cbDossier.Caption,5,250));
       DoAfterInit ( False );
      end;
    end;
end;

// procedure TF_AncestroWeb.FileCopyDoEraseDir
// Erasing directory : event
procedure TF_AncestroWeb.FileCopyDoEraseDir(Sender: TObject; var Continue: boolean);
begin
  Continue := gb_EraseExport or
    (MessageDlg({$IFDEF FPC}CST_AncestroWeb_WithLicense,{$ENDIF}
    fs_getCorrectString ( gs_AnceSTROWEB_DoEraseOldExport ) +
    FileCopy.Destination + ' ?', mtWarning, [mbYes,mbNo], 0) = mrYes);
end;

// procedure TF_AncestroWeb.FileCopyFailure
// Failure on copy : Event
procedure TF_AncestroWeb.FileCopyFailure(Sender: TObject;
  const ErrorCode: integer; var ErrorMessage: string; var ContinueCopy: boolean);
begin
  ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_ExportErrorCreate ) + FileCopy.Source + CST_ENDOFLINE + ErrorMessage);
  Abort;
end;

// procedure TF_AncestroWeb.fne_ExportAcceptFileName
// Exporting ini on filename's accept
procedure TF_AncestroWeb.fne_ExportAcceptFileName(Sender: TObject;
  var Value: String);
begin
  bt_exportClick(bt_export);
end;

// procedure TF_AncestroWeb.fne_importAcceptFileName
// Importing ini on filename's accept
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

// procedure TF_AncestroWeb.FWEraseImage3Click
// filename's edit erase's button event
procedure TF_AncestroWeb.FWEraseImage3Click(Sender: TObject);
begin
  p_ImageEditErase(ImageEdit3);
end;

// procedure TF_AncestroWeb.FWEraseImage2Click
// filename's edit erase's button event
procedure TF_AncestroWeb.FWEraseImage2Click(Sender: TObject);
begin
  p_ImageEditErase(ImageEdit2);
end;

// procedure TF_AncestroWeb.FWEraseImageClick
// filename's edit erase's button event
procedure TF_AncestroWeb.FWEraseImageClick(Sender: TObject);
begin
  p_ImageEditErase(ImageEdit1);
end;

procedure TF_AncestroWeb.FWPreview1Click(Sender: TObject);
begin
  with DMWeb.Execute do
    Begin
      CommandLine :=
      {$IFDEF LINUX}
      'xdg-open'
      {$ELSE}
      'explorer'
      {$ENDIF}
      +' "' + de_ExportWeb.Directory + '"';
      Execute;
    end;

end;

// procedure TF_AncestroWeb.ImageEdit2Change
// filename's edit change event
procedure TF_AncestroWeb.ImageEdit2Change(Sender: TObject);
begin
  p_ImageEditChange(ExtImage2, Sender);

end;
// procedure TF_AncestroWeb.ImageEdit3Change
// filename's edit change event

procedure TF_AncestroWeb.ImageEdit3Change(Sender: TObject);
begin
  p_ImageEditChange(ExtImage3, Sender);

end;
// procedure TF_AncestroWeb.ImageEdit1Change
// filename's edit change event
procedure TF_AncestroWeb.ImageEdit1Change(Sender: TObject);
begin
  p_ImageEditChange(ExtImage1, Sender);
end;

// procedure TF_AncestroWeb.p_ImageEditChange
// setting image from Filename edit
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

// function TF_AncestroWeb.fi_ImageEditCount
// Progress bar counter increment
function TF_AncestroWeb.fi_ImageEditCount(const as_FileName: string): integer;
begin
  if not DirectoryExistsUTF8(as_FileName) { *Converted from DirectoryExists*  } and FileExistsUTF8(as_FileName) { *Converted from FileExists*  } then
    Result := 1
  else
    Result := 0;
end;

// procedure TF_AncestroWeb.p_ImageEditErase
// Generic Image's edit erasing
procedure TF_AncestroWeb.p_ImageEditErase(const afne_EditImage: TFileNameEdit);
begin
  afne_EditImage.FileName := '';
end;

// procedure TF_AncestroWeb.FormClose
// Freeing on close
procedure TF_AncestroWeb.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  p_FreeProperties;
  p_FreeKeyWords;
end;

// procedure TF_AncestroWeb.bt_genClick
// Main Web Site Generation
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

  gs_RootPathForExport := de_ExportWeb.Directory + DirectorySeparator;
  gb_Generate := True;
  IBQ_Individu.DisableControls;
  pb_ProgressAll.Position := 0;
  pb_ProgressInd.Position := 0; // initing not needed user value
  pb_ProgressAll.Max := CST_PROGRESS_COUNTER_COPY + CST_PROGRESS_COUNTER_TITLE + fi_CreateSheets;

  try
    p_CopyStructure;
    p_genHTMLTitle;
    p_genHtmlHome;
    if ch_Filtered.Checked then
    begin
      if ch_ancestors.Checked Then
        Begin
          if fb_OpenTree(DmWeb.IBQ_TreeBysurnames, gi_CleFiche )
             then
               Begin
                p_createLettersSheets( gt_SheetsLetters, DmWeb.IBQ_TreeBysurnames, gi_FilesPerPage, ed_FileBeginName.Text);
                p_createExistingPersons ( DmWeb.IBQ_TreeBysurnames );
               end;
        end
       Else
       Begin
         if fb_OpenTree(DmWeb.IBQ_TreeDescBysurnames, gi_CleFiche ) then
           Begin
             p_createLettersSheets( gt_SheetsLetters, DmWeb.IBQ_TreeDescBysurnames, gi_FilesPerPage, ed_FileBeginName.Text);
             p_createExistingPersons ( DmWeb.IBQ_TreeBysurnames );
           end;
       end;
    end
    else
     Begin
      IBQ_Individu.First;
      p_createLettersSheets( gt_SheetsLetters, IBQ_Individu, gi_FilesPerPage, ed_FileBeginName.Text);
     end;

    if ch_genTree.Checked then
      if ch_ancestors.Checked
       Then p_genHTMLTree ( DMWeb.IBQ_TreeAsc  )
       Else p_genHTMLTree ( DMWeb.IBQ_TreeDesc );
    if ch_genages.Checked then
      p_genHtmlAges;
    if ch_genjobs.Checked then
      p_genHtmlJobs;
    if ch_genSearch.Checked then
      p_genHtmlSearch;
    if ch_Filtered.Checked
    then
      begin
        if ch_ancestors.Checked
          Then p_genHtmlFiles(DmWeb.IBQ_TreeBySurnames)
          Else p_genHtmlFiles(DmWeb.IBQ_TreeDescBySurnames);
      end
    else p_genHtmlFiles(IBQ_Individu);

    if ch_genSurnames.Checked then
    begin
      if ch_Filtered.Checked
      then
       Begin
         if ch_ancestors.Checked Then
           Begin
             if fb_OpenTree(DmWeb.IBS_TreeSurnames,gi_CleFiche) Then
               p_genHtmlSurnames(DmWeb.IBS_TreeSurnames);
           end
          else
           Begin
             if fb_OpenTree(DmWeb.IBS_TreeSurnamesDesc, gi_CleFiche) Then
               p_genHtmlSurnames(DmWeb.IBS_TreeSurnamesDesc);
           end;
       end
      else
       Begin
         DmWeb.IBS_Surnames.Close;
         DmWeb.IBS_Surnames.ParamByName(I_DOSSIER).AsInteger:=DMWeb.CleDossier;
         DmWeb.IBS_Surnames.ExecQuery;
         p_genHtmlSurnames(DmWeb.IBS_Surnames);

       end;
    end;
    if ch_genContact.Checked then
      p_genPhpContact;
  finally
    gb_Generate := False;
    p_Setcomments (( gs_AnceSTROWEB_Finished )); // advert for user
    IBQ_Individu.Locate(IBQ_CLE_FICHE, gi_CleFiche, []);
    IBQ_Individu.EnableControls;
  end;
end;

// procedure TF_AncestroWeb.cbDossierChange
// database's folder change event
procedure TF_AncestroWeb.cbDossierChange(Sender: TObject);
var
  NumDossier:integer;
begin
  NumDossier:=StrToInt(trim(copy(cbDossier.Caption,1,2)));
  if NumDossier<>DMWeb.CleDossier then
    if OuvreDossier(NumDossier) then
    begin
      fNom_Dossier:=fs_getCorrectString(copy(cbDossier.Caption,5,250));
      DoAfterInit;
    end;
end;

// procedure TF_AncestroWeb.bt_exportClick
// Export ini click event
procedure TF_AncestroWeb.bt_exportClick(Sender: TObject);
begin
  f_GetMainMemIniFile(nil,nil,nil,CST_AncestroWeb);
  OnFormInfoIni.p_ExecuteEcriture(Self);
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

procedure TF_AncestroWeb.p_AddABase ( const as_Base : String ; const ab_SetIndex :Boolean = True);
var li_i : Integer;
    lb_found : Boolean;
Begin
  lb_found:=False;
  for li_i := 0 to edNomBase.Items.Count - 1 do
    if edNomBase.Items [ li_i ] = as_Base Then
      Begin
        lb_found:=True;
        if ab_SetIndex Then
          edNomBase.ItemIndex:=li_i;
        Break;
      end;
  if not lb_found  then
    Begin
      edNomBase.Items.Add(as_Base);
      if ab_SetIndex Then
        edNomBase.ItemIndex:=edNomBase.Items.Count-1;
    end;
End;

// procedure TF_AncestroWeb.btnSelectBaseClick
// Database select on button's click event
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
    p_AddABase(OpenDialog.FileName);
    p_writeComboBoxItems(edNomBase,edNomBase.Items);
    edNomBaseOpen;
  end;
end;

// procedure TF_AncestroWeb.ch_FilteredClick
// "Filter from name" checkbox click event
procedure TF_AncestroWeb.ch_FilteredClick(Sender: TObject);
begin
  p_iniWriteKey;
end;

// function TF_AncestroWeb.fi_CreateSheets
// creating sheets from external options
// setting the main progress bar total
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
  if ch_genSurnames.Checked then
  begin
    Inc(Result, CST_PROGRESS_COUNTER_Surnames);
    p_setCorrectFileName(ed_SurnamesFileName, CST_FILE_Surnames);
    p_AddTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_Surnames ), ed_SurnamesFileName.Text + CST_EXTENSION_HTML);
    if ch_genMap.Checked then
    begin
      Inc(Result, CST_PROGRESS_COUNTER_MAP);
      p_setCorrectFileName(ed_MapFileName, CST_FILE_MAP);
      p_AddTabSheet(gt_TabSheets, ( gs_ANCESTROWEB_Map ), ed_MapFileName.Text + CST_EXTENSION_PHP);
    end;
  end;
  Inc(Result, CST_PROGRESS_COUNTER_FILES+CST_PROGRESS_COUNTER_LIST);
  p_setCorrectFileName(ed_FileBeginName, CST_FILE_FILES);
  p_setCorrectFileName(ed_ListsBeginName, CST_FILE_LIST);
  p_AddTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_List ), CST_SUBDIR_HTML_LISTS + '/' + ed_ListsBeginName.Text + '0' + CST_EXTENSION_HTML);
  if ch_ShowMainFile.Checked Then
    p_AddTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_Files ), ed_FileBeginName.Text +       CST_EXTENSION_HTML);
  if ch_genages.Checked then
  begin
    Inc(Result, CST_PROGRESS_COUNTER_AGES);
    p_setCorrectFileName(ed_AgesName, CST_FILE_AGES);
    p_AddTabSheet(gt_TabSheets, ( gs_ANCESTROWEB_Ages ), ed_AgesName.Text + CST_EXTENSION_HTML);
  end;
  if ch_genjobs.Checked then
  begin
    Inc(Result, CST_PROGRESS_COUNTER_JOBS);
    p_setCorrectFileName(ed_JobsName, CST_FILE_JOBS);
    p_AddTabSheet(gt_TabSheets, ( gs_ANCESTROWEB_Jobs ), ed_JobsName.Text + CST_EXTENSION_HTML);
  end;
  if ch_genSearch.Checked then
  begin
    Inc(Result, CST_PROGRESS_COUNTER_SEARCH);
    p_setCorrectFileName(ed_SearchName, CST_FILE_SEARCH);
    p_AddTabSheet(gt_TabSheets, ( gs_ANCESTROWEB_Search ), ed_SearchName.Text + CST_EXTENSION_HTML);
  end;
  if ch_genContact.Checked then
  begin
    Inc(Result, CST_PROGRESS_COUNTER_CONTACT);
    p_setCorrectFileName(ed_ContactName, CST_FILE_Contact);
    p_AddTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_Contact ),
      ed_ContactName.Text + CST_EXTENSION_PHP);
  end;
end;

// procedure TF_AncestroWeb.p_CopyStructure
// Copy default structure from options
procedure TF_AncestroWeb.p_CopyStructure;
var
  ls_Destination: string;
  lt_arg : array [0..0] of string;
begin
  p_IncProgressBar;  // growing the counter
  FileCopy.Destination := gs_RootPathForExport;
  ls_Destination := FileCopy.Destination;
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
  p_IncProgressBar;   // growing the counter
  if (cb_Themes.Items.Count = 0) then
  begin
    ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_ErrorThemes ) + gs_Root + CST_SUBDIR_THEMES);
    Abort;
  end;
  if (cb_Themes.ItemIndex = -1) then
    cb_Themes.ItemIndex := 0;
  FileCopy.Source := gs_Root + CST_SUBDIR_THEMES +DirectorySeparator+cb_Themes.Items[cb_Themes.ItemIndex];
  FileCopy.Destination := gs_RootPathForExport;
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

// procedure TF_AncestroWeb.p_IncProgressInd
// increments main progress bar
procedure TF_AncestroWeb.p_IncProgressBar;
begin
  pb_ProgressAll.Position := pb_ProgressAll.Position + 1; // growing
  Application.ProcessMessages;
end;

// procedure TF_AncestroWeb.p_IncProgressInd
// increments specialized progress bar
procedure TF_AncestroWeb.p_IncProgressInd;
begin
  pb_ProgressInd.Position := pb_ProgressInd.Position + 1; // growing
  Application.ProcessMessages;
end;

// function TF_AncestroWeb.fs_GetTitleTree
// Title of HTML trees
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
  const ab_Asc: boolean = True): longint;
var
  li_LocalLevel, li_LocalPreLevel, li_Clefiche: integer;
  ls_Tempo, ls_Barres, ls_NodeLink, ls_NameSurname, ls_Image: string;

  function fs_getText: string;
  begin
    Result := '';
    with IBQ_Tree do
      Begin
        if not FieldByName(IBQ_DATE_NAISSANCE).IsNull
        and fb_ShowYear(FieldByName(IBQ_ANNEE_NAISSANCE).AsInteger)  then
          AppendStr(Result, ' ' + fs_Create_Image ( '..'+CST_HTML_DIR_SEPARATOR+CST_SUBDIR_HTML_IMAGES+CST_HTML_DIR_SEPARATOR+CST_FILE_BIRTH, gs_AnceSTROWEB_EXPORT_WEB_BORN ) +
          ' ' + FieldByName( IBQ_DATE_NAISSANCE).AsString);
        if not FieldByName(IBQ_DATE_DECES).IsNull
        and fb_ShowYear(FieldByName(IBQ_ANNEE_DECES).AsInteger)  then
          AppendStr(Result, ' ' + fs_Create_Image ( '..'+CST_HTML_DIR_SEPARATOR+CST_SUBDIR_HTML_IMAGES+CST_HTML_DIR_SEPARATOR+CST_FILE_DEATH, gs_AnceSTROWEB_EXPORT_WEB_DIED ) +
            ' ' + FieldByName(IBQ_DATE_DECES).AsString);
        if not FieldByName(IBQ_AGE_AU_DECES).IsNull then
          AppendStr(Result, fs_AddComma( FieldByName(IBQ_AGE_AU_DECES).AsString + gs_AnceSTROWEB_Years ));
        p_addKeyWord(FieldByName(IBQ_NOM).AsString, '-'); // adding a head's meta keyword
        p_addKeyWord(FieldByName(IBQ_PRENOM).AsString); // adding a head's meta keyword
      end;
  end;


  procedure p_AddLine ( const ai_Key : Longint ; const ab_IsTheEnd, ab_OldNext, ab_IsFirst : boolean );
  Begin
    if not ch_Filtered.Checked
    or ( ab_IsFirst )
    or ( ab_asc = ch_ancestors.Checked ) // filtered by the correct direction ?
    or fb_IsCreatedPerson(ai_Key)
    Then
      Begin
        if ab_Link Then
          ls_Image := fs_GetNameLink ( fs_RemplaceEspace ( ls_NameSurname, '_' ),ls_Image, '../' + CST_SUBDIR_HTML_FILES + CST_HTML_DIR_SEPARATOR )
        else
          ls_Image := fs_GetNameLink ( fs_RemplaceEspace ( ls_NameSurname, '_' ),ls_Image, '' );
      end;
    p_setEndLine(ls_Tempo, ls_Image, ls_NodeLink, ab_OldNext,
      ab_IsTheEnd, li_LocalPreLevel, li_LocalLevel, ab_Link);

    astl_HTMLTree.Add(ls_Tempo);
  end;

  procedure p_CreateChilds(const af_Sosa: double; const as_Aboville: string; const ab_HasNext, ab_OldNext, ab_IsFirst, ab_IsSecond, ab_IsSisBrother: boolean );
  var
    li_Sexe : integer;
    lf_SosaPere, lf_SosaMere, lf_NewSosa: double;
    ls_newAboville: string;
  begin
    if (ab_Asc and IBQ_Tree.Locate(as_IdSosa, af_Sosa, [])) or
      (not ab_Asc and IBQ_Tree.Locate(as_IdSosa, as_Aboville, [])) then
    begin
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
            p_AddLine ( li_Clefiche, False, ab_OldNext, ab_IsFirst or ab_IsSecond );

          li_Clefiche := IBQ_Tree.FieldByName(IBQ_CLE_FICHE).AsInteger;
          if ab_Progress then
            p_IncProgressInd; // growing the second counter
          // Nommage des noeuds
          if li_LocalPreLevel <> li_LocalLevel Then  // a div by level
            ls_NodeLink := fs_GetNodeLink(ls_NodeLink, li_LocalLevel);

          // Création du début de Division
          p_setLevel(astl_HTMLTree, ls_NodeLink, ab_IsFirst or ab_IsSecond and ab_NotFirst, li_LocalLevel, li_LocalPreLevel, ab_Link);

          li_Sexe := IBQ_Tree.FieldByName(IBQ_SEXE).AsInteger;

          ls_NameSurname:=fs_getNameAndSurName(IBQ_Tree);

          ls_Image := ls_NameSurname +  fs_getText;
          ls_Barres := fs_NewLineImages(ls_Barres, ab_HasNext, li_LocalLevel);
          ls_Tempo := fs_CreateLineImages(ls_Barres, li_LocalLevel);
          case li_sexe of
            IBQ_SEXE_MAN   : ls_Image := fs_Create_Tree_Image('g' + CST_TREE_GIF_EXT) + ls_Image;
            IBQ_SEXE_WOMAN : ls_Image := fs_Create_Tree_Image('f' + CST_TREE_GIF_EXT) + ls_Image;
          end;
        end;
      lf_NewSosa := 0;
      if ab_Asc then
      begin    // next parents
        lf_SosaPere := af_Sosa * 2;
        lf_SosaMere := af_Sosa * 2 + 1;
        p_CreateChilds(lf_SosaPere, as_aboville, IBQ_Tree.Locate(
          as_IdSosa, lf_SosaMere, []), ab_HasNext, False, ab_IsFirst, False );
        p_CreateChilds(lf_SosaMere, as_aboville, False, ab_HasNext, False, False, False );
      end
      else
      begin
        IBQ_Tree.Next;  // next record for next tests
        ls_newAboville :=
          copy(as_aboville, 1, Length(as_aboville) - 1) + chr(
          Ord(as_aboville[Length(as_aboville)]) + 1);
        if IBQ_Tree.FieldByName(as_IdSosa).AsString = ls_newAboville then // next record of sister or brother
        begin
          p_CreateChilds(lf_NewSosa, ls_newAboville,
            IBQ_Tree.Locate(as_IdSosa,copy(ls_newAboville, 1, Length(ls_newAboville) - 1) + chr(Ord(ls_newAboville[Length(ls_newAboville)]) + 1),[]),
            ab_HasNext, False, False, True );
        end
        else
        begin
          ls_newAboville := as_aboville + '1';
          if IBQ_Tree.FieldByName(as_IdSosa).AsString = ls_newAboville then  // next record of childs
            begin
              p_CreateChilds(lf_NewSosa, ls_newAboville,
                 IBQ_Tree.Locate(as_IdSosa,copy(ls_newAboville, 1, Length(ls_newAboville) - 1) + chr(Ord(ls_newAboville[Length(ls_newAboville)]) + 1),[]),
                 ab_HasNext, False, ab_IsFirst, False );
              // verify if there is another sister or brother
              ls_newAboville :=
                copy(as_aboville, 1, length ( as_Aboville ) - 1) + chr(
                Ord(as_aboville[length ( as_Aboville )]) + 1);
              if IBQ_Tree.Locate(as_IdSosa,ls_newAboville,[]) then
              begin
                p_CreateChilds(lf_NewSosa, ls_newAboville,
                  IBQ_Tree.Locate(as_IdSosa,copy(ls_newAboville, 1, Length(ls_newAboville) - 1) + chr(Ord(ls_newAboville[Length(ls_newAboville)]) + 1),[]),
                  ab_HasNext, False, False, True );
              end
           End;
        end;
      end;
    end;
  end;

begin
  li_LocalLevel := -1;
  Result := -1;
  ls_NodeLink := '';
  ls_Tempo := '';
  gs_HTMLTreeNodeLink := '';
  ls_Barres := '';
  try
    // first node
    IBQ_Tree.Locate(IBQ_CLE_FICHE, ai_Clefiche, []);
    li_Clefiche:=ai_Clefiche;
    // create the tree
    p_CreateChilds(IBQ_Tree.FieldByName(as_IdSosa).AsFloat,
      IBQ_Tree.FieldByName(as_IdSosa).AsString, False, False, True, False, False);
    p_AddLine ( li_Clefiche, True, False, False );
  except
    On E: Exception do
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateATree ) + CST_ENDOFLINE + E.Message);
  end;
  if ab_Progress then
    p_IncProgressBar; // growing the counter
  Inc(Result);
end;

// procedure TF_AncestroWeb.p_genHTMLTitle
// HTML Main title
procedure TF_AncestroWeb.p_genHTMLTitle;
var
  li_ClePere, li_CleMere: integer;
  gf_Sosa: double;
begin
  p_IncProgressBar; // growing the counter
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
      AppendStr(gs_HTMLTitle, ' ' + IBQ_Individu.FieldByName(IBQ_NOM).AsString);
    if IBQ_Individu.Locate(IBQ_CLE_FICHE, li_CleMere, []) then
      AppendStr(gs_HTMLTitle, ' & ' + IBQ_Individu.FieldByName(IBQ_NOM).AsString);
  end;
  gs_HTMLTitle := StringReplace( ( gs_AnceSTROWEB_HTMLTitle ), '@ARG',
    gs_HTMLTitle, [rfReplaceAll]);
end;

// function TF_AncestroWeb.fb_OpenTree
// open a tree from parameters
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
        ParamByName(I_DOSSIER).AsInteger := DMWeb.CleDossier;
      AIBQ_Tree.Open;
      Result := not AIBQ_Tree.IsEmpty;
    except
      On E: Exception do
        ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantOpenData ) + sDataBaseName + CST_ENDOFLINE + E.Message);
    end;
end;

// function TF_AncestroWeb.fb_OpenTree
// open a tree from parameters
function TF_AncestroWeb.fb_OpenTree(const AIBQ_Tree: TIBSQL;
  const ai_Cle: longint; const ai_Niveau: integer = 0;
  const ai_Sexe: integer = 0): boolean;
begin
  Result := False;
  with AIBQ_Tree do
    try
      Close;
      ParamByName(I_CLEF).AsInteger := ai_Cle;
      ParamByName(I_NIVEAU).AsInteger := ai_Niveau;
      ParamByName(I_PARQUI).AsInteger := ai_Sexe;
      ExecQuery;
      Result := not Eof;
    except
      On E: Exception do
        ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantOpenData ) + sDataBaseName + CST_ENDOFLINE + E.Message);
    end;
end;

// procedure TF_AncestroWeb.p_genHTMLTree
// creating the main interactive HTML Tree
procedure TF_AncestroWeb.p_genHTMLTree ( const IBQ_tree : TIBQuery );
var
  lstl_HTMLTree: TStringList;
  ls_destination: string;
  li_generation: longint;
begin
  p_Setcomments (( gs_AnceSTROWEB_FamilyTree )); // advert for user
  lstl_HTMLTree := TStringList.Create;
  p_CreateKeyWords;
  pb_ProgressInd.Position := 0; // initing not needed user value
  if fb_OpenTree(IBQ_Tree, gi_CleFiche)
   then
    try
      pb_ProgressInd.Max := IBQ_Tree.RecordCount;
      p_IncProgressBar; // growing the counter
      if not ch_Filtered.Checked and not
        IBQ_Tree.Locate(IBQ_CLE_FICHE, gi_CleFiche, []) then
        Exit;
      if ch_ancestors.Checked
        Then li_generation := fi_CreateHTMLTree(IBQ_Tree, lstl_HTMLTree, gi_CleFiche)
        Else li_generation := fi_CreateHTMLTree(IBQ_Tree, lstl_HTMLTree, gi_CleFiche,True,True,False,IBQ_TQ_NUM_SOSA,False);
      lstl_HTMLTree.Insert(0, fs_Format_Lines(me_HeadTree.Lines.Text));
      p_CreateAHtmlFile(lstl_HTMLTree, CST_FILE_TREE, me_Description.Lines.Text,
        ( gs_AnceSTROWEB_FamilyTree ), gs_AnceSTROWEB_FullTree, fs_GetTitleTree ( gs_AnceSTROWEB_Ancestry, li_generation), gs_LinkGedcom, '../');
      p_IncProgressBar; // growing the counter
    except
      On E: Exception do
        ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantUseData ) + sDataBaseName + CST_ENDOFLINE + E.Message);
    end;

    // saving the page
  ls_destination := gs_RootPathForExport +
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
  p_IncProgressBar;  // growing the counter
end;

// function TF_AncestroWeb.fs_AddImage
// creating a HTML image from image's path
function TF_AncestroWeb.fs_AddImage(const as_ImageFile: string): string;
var
  ls_Destination, ls_HtmlFileName: string;
begin
  Result := '';
  p_IncProgressBar; // growing the counter
  if fi_ImageEditCount(as_ImageFile) = 0 then
    Exit;
  ls_HtmlFileName := ExtractFileName(as_ImageFile);
  ls_HtmlFileName := fs_TextToFileName(Copy(ls_HtmlFileName, 1, Length(ls_HtmlFileName) -
    Length(ExtractFileExt(ls_HtmlFileName)))) + CST_EXTENSION_JPEG;
  // saving the picture
  ls_destination := gs_RootPathForExport +
    CST_SUBDIR_HTML_IMAGES + DirectorySeparator + ls_HtmlFileName;
  TraduceImage.FileSource := as_ImageFile;
  TraduceImage.FileDestination := ls_Destination;
  TraduceImage.CopySourceToDestination;
  AppendStr ( Result, ' ' + fs_AddImageTable(fs_Create_Image(CST_SUBDIR_HTML_IMAGES + CST_HTML_DIR_SEPARATOR + ls_HtmlFileName)));
end;

// function TF_AncestroWeb.fs_AddImageTable
// add an image in the current HTML TABLE
function TF_AncestroWeb.fs_AddImageTable(const as_HtmlImage : string ; const as_alt: string = ''): string;
begin
  if as_HtmlImage = ''
   Then Result := ''
   Else Result := CST_HTML_TD_BEGIN + '<' + CST_HTML_TABLE +
    CST_HTML_ID_EQUAL + '"image">' + CST_HTML_TR_BEGIN + CST_HTML_TD_BEGIN +
    as_HtmlImage + CST_HTML_TD_END + CST_HTML_TR_END +
    CST_HTML_TABLE_END + CST_HTML_TD_END + ' ';
end;

// procedure TF_AncestroWeb.p_genHtmlHome
// Default HTML page
procedure TF_AncestroWeb.p_genHtmlHome;
var
  lstl_HTMLHome: TStringList;
  ls_destination: string;
  ls_Images: string;
  li_Count: integer;


  // stats
  procedure p_AddCounting ( const astl_HTML : TStringList  );
  Begin
   if ch_Comptage.Checked then
    try
      // loading the request
      DMWeb.IBS_Compte.Close;
      DMWeb.IBS_Compte.ParamByName ( I_DOSSIER    ).AsInteger:=DMWeb.CleDossier;
      DMWeb.IBS_Compte.ExecQuery;
      if not DMWeb.IBS_Compte.Eof Then
        Begin
         // stats' title
         astl_HTML.Add ( CST_HTML_BR + fs_CreateElementWithId ( CST_HTML_H3    ,CST_FILE_COUNTING));
         astl_HTML.Add (( gs_AnceSTROWEB_Statistics   ));
         astl_HTML.Add ( CST_HTML_H3_END );
         // stats' table
         astl_HTML.Add ( fs_CreateElementWithId ( CST_HTML_TABLE, CST_FILE_COUNTING));
         while not DMWeb.IBS_Compte.EOF do
          Begin    // adding the stats
           astl_HTML.Add (CST_HTML_TR_BEGIN + CST_HTML_TD_BEGIN  + CST_HTML_H4_BEGIN +
                         fs_GetLabelCaption ( DMWeb.IBS_Compte.FieldByName(COUNTING_LABEL).AsString ) +
                         CST_HTML_H4_END  + CST_HTML_TD_END + CST_HTML_TD_BEGIN +
                         DMWeb.IBS_Compte.FieldByName(COUNTING_COUNTING).AsString +
                         CST_HTML_TD_END + CST_HTML_TR_END);
           DMWeb.IBS_Compte.Next;
          end;

         astl_HTML.Add ( CST_HTML_TABLE_END );
        end;
    Except
      ShowMessage(gs_ANCESTROWEB_Unset_Stats);
    end;
  end;


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
  p_Setcomments (( gs_AnceSTROWEB_Home )); // advert for user
  lstl_HTMLHome := TStringList.Create;
  lstl_HTMLHome.Text := CST_HTML_CENTER_BEGIN + '<' + CST_HTML_Paragraph +
    CST_HTML_ID_EQUAL + '"head">' + fs_Format_Lines(
    me_Description.Text) + CST_HTML_Paragraph_END;

  ls_Images := fs_AddImages(ImageEdit1.FileName, ImageEdit2.FileName,
    ImageEdit3.FileName);
  if ls_Images <> '' then
    lstl_HTMLHome.Add(' <' + CST_HTML_TABLE + CST_HTML_ID_EQUAL +
      '"images">' + CST_HTML_TR_BEGIN + ls_Images + CST_HTML_TR_END + CST_HTML_TABLE_END  + CST_HTML_BR);
  p_AddCounting ( lstl_HTMLHome );
  lstl_HTMLHome.Add(CST_HTML_CENTER_END);
  p_CreateKeyWords;
  pb_ProgressInd.Position := 0; // initing not needed user value
  p_CreateAHtmlFile(lstl_HTMLHome, CST_FILE_Home, me_Description.Lines.Text,
    ( gs_AnceSTROWEB_Home ), ( gs_AnceSTROWEB_Home ), gs_ANCESTROWEB_Welcome, gs_LinkGedcom);
  p_IncProgressBar; // growing the counter
  // saving the page
  ls_destination := gs_RootPathForExport + ed_IndexName.Text +
    CST_EXTENSION_HTML;
  try
    lstl_HTMLHome.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_ANCESTROWEB_cantCreateHere ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  lstl_HTMLHome.Free;
end;

// procedure TF_AncestroWeb.p_Setcomments
// infos for user
procedure TF_AncestroWeb.p_Setcomments (const as_Comment : String);
Begin
  if as_Comment = ''
    Then lb_Comments.Caption:= ''
    Else lb_Comments.Caption:= fs_getCorrectString ( gs_AnceSTROWEB_Generating ) + as_Comment;

end;

// function TF_AncestroWeb.fb_OpenMedias
// Open a media data stream
function TF_AncestroWeb.fb_OpenMedias(const ai_CleFiche: Longint;
                                      const ai_Type: integer;
                                      const ab_Identite: Boolean = False;
                                      const ach_table : Char = MEDIAS_TABLE_ARCHIV):Boolean;
Begin
  Result := False;
  try
    DMWeb.IBQ_Medias.Close;
    DMWeb.IBQ_Medias.ParamByName(IBQ_CLE_FICHE     ).AsInteger := ai_CleFiche;
    DMWeb.IBQ_Medias.ParamByName(MEDIAS_TYPE       ).AsInteger := ai_Type ;
    DMWeb.IBQ_Medias.ParamByName(MEDIAS_TABLE      ).AsString  := ach_table ;
    DMWeb.IBQ_Medias.ParamByName(MEDIAS_MP_IDENTITE).AsInteger := Integer ( ab_Identite ) ;
    DMWeb.IBQ_Medias.Open;
    Result := not DMWeb.IBQ_Medias.Eof;

  Except
    on E : Exception do
     Begin
       ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantOpenData + gs_AnceSTROWEB_The_Medias ) +CST_ENDOFLINE+e.Message);
     end;
  end;
end;

// function TF_AncestroWeb.fs_getNameAndSurName
// Getting name and surname
function TF_AncestroWeb.fs_getNameAndSurName ( const ibq_Query : TIBQuery ) : String;
Begin
  Result:=ibq_Query.FieldByName(IBQ_NOM).AsString+' ' + ibq_Query.FieldByName(IBQ_PRENOM).AsString;
End;

// function TF_AncestroWeb.fs_getNameAndSurName
// Getting name and surname
function TF_AncestroWeb.fs_getNameAndSurName ( const ibq_Query : TIBSQL ) : String;
Begin
  Result:=ibq_Query.FieldByName(IBQ_NOM).AsString+' ' + ibq_Query.FieldByName(IBQ_PRENOM).AsString;
End;

// function TF_AncestroWeb.fs_CreatePrevNext
// // creating previous or next image link
function TF_AncestroWeb.fs_CreatePrevNext ( const ai_PreviousNext : Longint ;
                                            const as_PreviousNext : String = CST_PAGE_PREVIOUS;
                                            const as_Subdir : String = '';
                                                  as_BeginLinkFiles : String = CST_SUBDIR_HTML_FILES + '/' ) : String;
Begin
  Result := CST_HTML_AHREF + as_BeginLinkFiles + IntToStr(ai_PreviousNext) + CST_EXTENSION_HTML + '">'
                + fs_Create_Image( as_Subdir + CST_SUBDIR_HTML_IMAGES + CST_HTML_DIR_SEPARATOR+as_PreviousNext + CST_EXTENSION_GIF, as_PreviousNext ) + CST_HTML_A_END
End;

// function TF_AncestroWeb.fb_getMediaFile
// creating a non-existing Media File
function TF_AncestroWeb.fb_getMediaFile ( const IBQ_Media : TIBQuery;
                                          const as_FilePath : string ;
                                          var as_FileNameBegin : String ) : Boolean;
var ls_Path : String;
Begin
  Result := False;

  if IBQ_Media.FieldByName(MEDIAS_MULTI_MEDIA).IsNull Then
    Begin
      Exit;
    End;
  // verifying existing file copy
  if FileExistsUTF8(as_FilePath + as_FileNameBegin + CST_EXTENSION_JPEG ) Then
    Begin
      Result := True;
      Exit;
    end;
  // verifying existing original file copy
  if FileExistsUTF8(as_FilePath + as_FileNameBegin + gs_ANCESTROWEB_FileName_NotACopy + CST_EXTENSION_JPEG ) Then
    Begin
      AppendStr ( as_FileNameBegin, gs_ANCESTROWEB_FileName_NotACopy ); // setting correct link name
      Result := True;
      Exit;
    end;
  try
    // Searching original copy with partial name
    if IBQ_Media.FieldByName ( MEDIAS_NOM ).AsString <> '' Then
     Begin
      ls_Path := DirectorySeparator + fs_GetCorrectPath ( IBQ_Media.FieldByName ( MEDIAS_NOM ).AsString );
      // simple copy ?
      if not IBQ_Media.FieldByName ( MEDIAS_NOM ).IsNull
      and (   FileExistsUTF8(fFolderBasePath+ls_Path)
           or FileExistsUTF8(fSoftUserPath  +ls_Path))
       Then
         Begin
           if FileExistsUTF8(fSoftUserPath+ls_Path)
            Then FileCopy.Source:=fSoftUserPath  +ls_Path
            Else FileCopy.Source:=fFolderBasePath+ls_Path;
           AppendStr ( as_FileNameBegin, gs_ANCESTROWEB_FileName_NotACopy );
           FileCopy.Destination:=as_FilePath + as_FileNameBegin + CST_EXTENSION_JPEG;
           FileCopy.CopySourceToDestination;
           Result:=True;
           Exit;
         end;
      End;
    // Searching original copy with full name
    if IBQ_Media.FieldByName ( MEDIAS_PATH ).AsString <> '' Then
      if {$IFNDEF FPC}( GetDriveType( Pchar(ExtractFileDrive ( IBQ_Media.FieldByName ( MEDIAS_PATH ).AsString ))) >0 )
      and{$ENDIF} FileExistsUTF8(IBQ_Media.FieldByName ( MEDIAS_PATH ).AsString )
        Then
          Begin
           ls_Path := IBQ_Media.FieldByName(MEDIAS_PATH ).AsString;
           FileCopy.Source:= ls_Path;
           AppendStr ( as_FileNameBegin, gs_ANCESTROWEB_FileName_NotACopy );
           FileCopy.Destination:=as_FilePath+as_FileNameBegin+CST_EXTENSION_JPEG;
           FileCopy.CopySourceToDestination;
           if ( pos ( fFolderBasePath, ls_Path ) = 1 ) Then
            try // updating the partial name
              DMWeb.IBS_Temp.SQL.Text := 'UPDATE MULTIMEDIA SET ' + MEDIAS_NOM + '='''
                                      + fs_stringDbQuote(copy ( ls_Path, length ( fFolderBasePath ) + 1, length ( ls_Path ) - length ( fFolderBasePath )))
                                      + ''' WHERE ' + MEDIAS_CLEF + '=' + IBQ_Media.FieldByName(MEDIAS_CLEF ).AsString;
              DMWeb.IBS_Temp.ExecQuery;
            Except
              on e:Exception do
               Begin
                writeln ( E.Message + ' : ' + #10 + DMWeb.IBS_Temp.SQL.Text );
               end;
            end;
           Result:=True;
           Exit;
          end;
    // unless creating file from database
     Result := fb_ImageFieldToFile(IBQ_Media.FieldByName(MEDIAS_MULTI_MEDIA), as_FilePath + as_FileNameBegin + CST_EXTENSION_JPEG);
  Except
   Result:=False;
  end;
End;

// procedure TF_AncestroWeb.p_createLettersSheets
// creating a HTML list of letters
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
  if IBQ_FilesFiltered.Locate(IBQ_NOM, lch_i,
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
//           if pos ( 'GOURDEL', fs_getNameAndSurName(IBQ_FilesFiltered) ) > 0 Then
  //           Showmessage ( fs_RemplaceEspace (fs_getNameAndSurName(IBQ_FilesFiltered), '_' ) + ' ' + IntToStr(li_i) );
          p_AddTabSheetPage(at_SheetsLetters, high ( at_SheetsLetters ), as_BeginFile + IntToStr(li_i) + CST_EXTENSION_HTML, fs_RemplaceEspace (fs_getNameAndSurName(IBQ_FilesFiltered), '_' ));
         end;
      p_AddTabSheet(at_SheetsLetters, lch_i,
        as_BeginFile + IntToStr(li_Counter) + CST_EXTENSION_HTML );
    end;
end;

// function fs_GetNameLink
// Creates a link from a name and a showed info
function TF_AncestroWeb.fs_GetNameLink ( as_name : String ; const as_Showed : String ; const as_SubDir : String = ''):String ;
Begin
  as_name := StringReplace( StringReplace(as_name, '"', '\"',[rfReplaceAll]), '\', '\\',[rfReplaceAll]);
  Result := CST_HTML_AHREF + as_SubDir + fs_GetSheetLink ( gt_SheetsLetters, as_name[1], as_name ) + '#' + as_name + '">'
          + as_Showed + CST_HTML_A_END ;
End;

// procedure TF_AncestroWeb.p_genHtmlSurnames
// generating HTML Surnames' page
procedure TF_AncestroWeb.p_genHtmlSurnames (const IBS_FilesFiltered: TIBSQL);
var
  lstl_HTMLAFolder: TStringList;
  ls_NewSurname, ls_ASurname, ls_destination: string;

  // for map
  lt_Surnames : Array of Record
                        Name : String;
                        Minlatitude  ,
                        Minlongitude ,
                        Maxlatitude  ,
                        Maxlongitude : Double;
                        MaxCounter   : Int64;
                      end;

const CST_DUMMY_COORD = 2000000;
      CST_NB_DOTS     = 5;
  //  function fi_findName
  // search a name in the array lt_Surnames
  function fi_findName ( const as_Name : string ): Integer;
  var li_i : LongInt;
  Begin
    for li_i := 0 to high ( lt_Surnames ) do
     if lt_Surnames [ li_i ].Name = as_Name Then
      Begin
        Result := li_i;
        Exit;
      end;
    Result := -1;
  End;
  // procedure p_getGlobalMinMax
  // Min and max for global map
  procedure p_getGlobalMinMax (var ad_Minlatitude, ad_Maxlatitude, ad_Minlongitude , ad_Maxlongitude : Double ; var ai_MaxCounter  : Int64 );
  var li_i : LongInt;
  Begin
    for li_i := 0 to high ( lt_Surnames ) do
     with lt_Surnames [ li_i ] do
      Begin
        if Minlatitude < ad_Minlatitude Then
          ad_Minlatitude := Minlatitude;
        if Maxlatitude > ad_Maxlatitude Then
          ad_Maxlatitude := Maxlatitude;
        if Minlongitude < ad_Minlongitude Then
          ad_Minlongitude := Minlongitude;
        if Maxlongitude > ad_Maxlongitude Then
          ad_Maxlongitude := Maxlongitude;
        if MaxCounter > ai_MaxCounter Then
          ai_MaxCounter := MaxCounter;
      end;
  End;

  // procedure p_getCityLastInfos
  // last try to get correct city infos
  procedure p_getCityLastInfos ( const as_Pays : String; as_city : String; var ad_latitude , ad_longitude : Double);
  Begin
    ad_latitude :=CST_DUMMY_COORD;
    ad_longitude:=CST_DUMMY_COORD;
    as_city     := Trim ( as_city );
    if ( as_city = '' ) Then
      Begin
        p_Setcomments(gs_ANCESTROWEB_MapProblemNoCity);
        Exit;
      end;
    with DMWeb.IBS_City do
      Begin
        Close;
        ParamByName(I_CITY).AsString:=as_city;
        ParamByName(I_PAYS).AsString:=as_Pays;
        ExecQuery;
        if Bof Then
          Exit;
        ad_latitude := FieldByName(IBQ_CP_LATITUDE ).AsFloat;
        ad_longitude:= FieldByName(IBQ_CP_LONGITUDE).AsFloat;
        Close;
      end;
  end;
  // procedure p_getCityInfos
  // try to get correct city infos
  procedure p_getCityInfos ( as_codepostal, as_Pays, as_city : String; var ad_latitude , ad_longitude : Double);
  Begin
    ad_latitude :=CST_DUMMY_COORD;
    ad_longitude:=CST_DUMMY_COORD;
    as_codepostal := Trim ( as_codepostal );
    as_Pays       := Trim ( as_Pays       );
    if ( as_pays = '' ) Then
     as_pays := gs_ANCESTROWEB_MapCountry;
    if ( as_codepostal = '' )
    or ( Length(as_codepostal)>8) Then
      Begin
        p_getCityLastInfos ( as_Pays, as_city, ad_latitude , ad_longitude );
        p_Setcomments(gs_ANCESTROWEB_MapProblemNoPostalCode);
        Exit;
      end;
    with DMWeb.IBS_CityCPost do
      Begin
        Close;
        ParamByName(I_CP  ).AsString:=as_codepostal;
        ParamByName(I_PAYS).AsString:=as_Pays;
        ExecQuery;
        if RecordCount = 0 Then
         if as_Pays = gs_ANCESTROWEB_MapCountry
          Then Exit
          Else p_getCityInfos ( as_codepostal, gs_ANCESTROWEB_MapCountry, as_city, ad_latitude, ad_longitude );
        as_city:=UpperCase(as_city);
        while not eof do
         Begin
           if Trim(UpperCase(FieldByName(IBQ_CP_VILLE).AsString))=as_city Then Break;
           Next;
         end;
        ad_latitude := FieldByName(IBQ_CP_LATITUDE ).AsFloat;
        ad_longitude:= FieldByName(IBQ_CP_LONGITUDE).AsFloat;
        Close;
      end;
  end;


    // procedure p_createMinMaxMap
    // creating min and max on Surnames
    procedure p_createMinMaxMap ( const IBS_MapFiltered :TIBSQL);
    var
        li_i : LongInt;
        ld_latitude  ,
        ld_longitude : Double;
        ld_counter   : Int64;
        ls_City ,
        ls_AName : String;
    Begin
      ld_longitude := 0;
      ld_latitude  := 0;
      ls_City      := '';
      with IBS_MapFiltered do
      while not Eof do
        Begin
          ls_AName := FieldByName(IBQ_NOM).AsString;
          if ls_AName <> '' Then
            Begin
              ls_City:= Trim ( FieldByName(IBQ_EV_IND_VILLE).AsString );
              p_getCityInfos ( FieldByName(IBQ_EV_IND_CP).AsString, FieldByName(IBQ_EV_IND_PAYS).AsString, ls_City, ld_latitude, ld_longitude );
              ld_counter :=  FieldByName(IBQ_COUNTER ).AsInt64;
              if  ( ld_latitude <> CST_DUMMY_COORD ) Then
                begin
                  li_i := fi_findName ( ls_AName );
                  if li_i <> -1 Then
                   with lt_Surnames [ li_i ] do
                   // mise à jour des max
                    Begin
                      if ld_latitude  < Minlatitude then
                       Minlatitude:= ld_latitude;
                      if ld_latitude  > Maxlatitude then
                       Maxlatitude:= ld_latitude;
                      if ld_longitude  < Minlongitude then
                       Minlongitude:= ld_longitude;
                      if ld_longitude  > Maxlongitude then
                        Maxlongitude:= ld_longitude;
                      if ld_counter  > MaxCounter then
                        MaxCounter:=ld_counter;
                    end
                  else
                   Begin
                     SetLength(lt_Surnames, high ( lt_Surnames ) + 2);
                     with lt_Surnames [ high ( lt_Surnames )] do
                      Begin
                        Name := ls_AName;
                        Minlatitude :=ld_latitude;
                        Maxlatitude :=ld_latitude;
                        Minlongitude:=ld_longitude;
                        Maxlongitude:=ld_longitude;
                        MaxCounter := ld_counter;
                      end;
                   end;
                end;
            end;
          Next;
        end;
    end;

  // function fs_MapZoom
  // creating zoom for map
  function fs_MapZoom ( const ad_Minlatitude, ad_Maxlatitude, ad_Minlongitude , ad_Maxlongitude  : Double ): String;
  var ld_Longitude, ld_Zoom : Double;
  Begin
    ld_Zoom      := 90  + ad_Maxlatitude  - ad_Minlatitude  ;
    ld_Longitude := ( 180 + ad_Maxlongitude - ad_Minlongitude ) / 2 ;
    if ld_Longitude > ld_Zoom Then
     ld_Zoom:=ld_Longitude;
    ld_Zoom := 1.25 - ld_Zoom / 180;
    try
      // apating initial zoom to max lattitud and longitud
      Result := IntToStr ( trunc ( StrToInt(gs_ANCESTROWEB_MapMaxZoom) * ld_Zoom ));
    except
    end;
  End;
  // procedure p_setACase
  // creating a now switching case
  procedure p_setACase ( const astl_ACase, astl_ACaseSource : TStringList; var ai_Name : Integer);
  Begin
    ai_Name := fi_findName(ls_NewSurname);
    if ai_Name <> -1 Then
     Begin
      p_ReplaceLanguageString ( astl_ACase, CST_MAP_LINE, '' ,[rfReplaceAll]);
      p_ReplaceLanguageString ( astl_ACase, CST_MAP_CASE, astl_ACaseSource.Text );
      with lt_Surnames [ ai_Name ] do
        Begin
          p_ReplaceLanguageString ( astl_ACase, CST_MAP_NAME    , Name ,[rfReplaceAll]);
          p_ReplaceLanguageString ( astl_ACase, CST_MAP_LATITUD , FloatToStr((Maxlatitude  + MinLatitude ) /2),[rfReplaceAll]);
          p_ReplaceLanguageString ( astl_ACase, CST_MAP_LONGITUD, FloatToStr((MinLongitude + Maxlongitude) /2),[rfReplaceAll]);
          p_ReplaceLanguageString ( astl_ACase, CST_MAP_MIN_LATITUD , FloatToStr(MinLatitude ),[rfReplaceAll]);
          p_ReplaceLanguageString ( astl_ACase, CST_MAP_MIN_LONGITUD, FloatToStr(MinLongitude),[rfReplaceAll]);
          p_ReplaceLanguageString ( astl_ACase, CST_MAP_MAX_LATITUD , FloatToStr(MaxLatitude ),[rfReplaceAll]);
          p_ReplaceLanguageString ( astl_ACase, CST_MAP_MAX_LONGITUD, FloatToStr(MaxLongitude),[rfReplaceAll]);
          p_ReplaceLanguageString ( astl_ACase, CST_MAP_MAX_ZOOM, gs_ANCESTROWEB_MapMaxZoom,[rfReplaceAll]);
          p_ReplaceLanguageString ( astl_ACase, CST_MAP_ZOOM    , fs_MapZoom ( Minlatitude, Maxlatitude, Minlongitude , Maxlongitude ),[rfReplaceAll]);
        end;
     end;
    ls_ASurname := ls_NewSurname;

  end;

  // procedure p_setAline
  // creating a new case line
  procedure p_setAline ( const astl_Aline, astl_Line : TStringList; const IBS_MapFiltered :TIBSQL; const ai_MaxCounter : Int64 ; const ab_IsNamedMap : Boolean );
  var li_i, li_dot : Integer ;
      ld_latitude, ld_longitude : Double;
      li_counter : Int64;
      ls_City, ls_link : String;
  Begin
    with IBS_MapFiltered do
     Begin
       ls_City:=Trim(FieldByName(IBQ_EV_IND_VILLE).AsString);
       p_getCityInfos ( FieldByName(IBQ_EV_IND_CP).AsString, FieldByName(IBQ_EV_IND_PAYS).AsString, ls_City, ld_latitude, ld_longitude );
       if not ab_IsNamedMap Then
         ls_City:=FieldByName(IBQ_NOM).AsString + ' - ' + ls_City;
       li_counter:= FieldByName(IBQ_COUNTER).AsInt64;
     end;
    if ( ld_latitude  = CST_DUMMY_COORD) Then
     Exit;
    ls_City:=StringReplace(ls_City, '''', '\\\''',[rfReplaceAll]);
    p_ReplaceLanguageString ( astl_Aline, CST_MAP_LINE, astl_Line.Text );
    p_addKeyWord(ls_City); // adding a head's meta keywords
    ls_link := ls_City + ' - ' + IntToStr(li_counter) + ' ' ;
    if li_counter > 1
     Then AppendStr ( ls_link, gs_ANCESTROWEB_FamilyPersons )
     Else AppendStr ( ls_link, gs_ANCESTROWEB_FamilyPerson  );
    p_ReplaceLanguageString ( astl_Aline, CST_MAP_NAME_CITY ,
                              StringReplace ( fs_GetNameLink ( IBS_MapFiltered.FieldByName(IBQ_NOM).AsString
                              , ls_link, CST_SUBDIR_HTML_FILES + CST_HTML_DIR_SEPARATOR), '"', '\"',[rfReplaceAll]),[rfReplaceAll]);
    p_ReplaceLanguageString ( astl_Aline, CST_MAP_LATITUD   , FloatToStr(ld_latitude ),[rfReplaceAll]);
    p_ReplaceLanguageString ( astl_Aline, CST_MAP_LONGITUD  , FloatToStr(ld_longitude),[rfReplaceAll]);
    li_dot := CST_NB_DOTS;
    for li_i := 1 to CST_NB_DOTS do
      if li_counter <= ai_MaxCounter / li_i Then
       li_dot := CST_NB_DOTS - li_i + 1;
    case li_dot of
     1 :  p_ReplaceLanguageString ( astl_Aline, CST_MAP_ICON, CST_MAP_LITTLE_DOT  ,[rfReplaceAll]);
     2 :  p_ReplaceLanguageString ( astl_Aline, CST_MAP_ICON, CST_MAP_LI_MID_DOT  ,[rfReplaceAll]);
     3 :  p_ReplaceLanguageString ( astl_Aline, CST_MAP_ICON, CST_MAP_MIDDLE_DOT  ,[rfReplaceAll]);
     4 :  p_ReplaceLanguageString ( astl_Aline, CST_MAP_ICON, CST_MAP_BIG_MID_DOT ,[rfReplaceAll]);
     else p_ReplaceLanguageString ( astl_Aline, CST_MAP_ICON, CST_MAP_BIG_DOT     ,[rfReplaceAll]);
    end;
    with IBS_MapFiltered do
  end;

  // procedure p_createAMap
  // creating a map with persons frpm IBS_MapFiltered
  procedure p_createAMap ( const IBS_MapFiltered :TIBSQL);
  var ld_MinLatitude, ld_MaxLatitude, ld_MinLongitude, ld_MaxLongitude : Double;
    li_MaxCounter : Int64;
    lstl_AllSurnames ,
    lstl_ACase    ,
    lstl_ALine    : TStringList;
    li_Name       ,
    li_i          : Integer ;
  Begin
    Finalize ( lt_Surnames );
    p_createMinMaxMap ( IBS_MapFiltered );
    IBS_MapFiltered.Close;
    IBS_MapFiltered.ExecQuery;
    // initing global values
    ld_Minlatitude := CST_DUMMY_COORD;
    ld_Maxlatitude := -CST_DUMMY_COORD;
    ld_Minlongitude  := CST_DUMMY_COORD;
    ld_Maxlongitude  := -CST_DUMMY_COORD;
    li_MaxCounter  := 0;
    p_getGlobalMinMax ( ld_Minlatitude, ld_Maxlatitude, ld_Minlongitude , ld_Maxlongitude, li_MaxCounter );
    p_CreateKeyWords;
    ls_ASurname := '';
    li_Name := -1;
    pb_ProgressInd.Position:=0;  // initing user value
    pb_ProgressInd.Max:=IBS_FilesFiltered.RecordCount;
    lstl_AllSurnames := TStringList.Create;
    lstl_ACase    := TStringList.Create;
    lstl_ALine    := TStringList.Create;
    ls_NewSurname := '';
    ls_ASurname := 'Z123><';  // for a good test
    // loading files
    p_LoadStringList(lstl_HTMLAFolder, gs_Root, CST_FILE_MAP     + CST_EXTENSION_PHP);
    p_LoadStringList(lstl_AllSurnames   , gs_Root, CST_FILE_MapCase + CST_EXTENSION_PHP);
    p_LoadStringList(lstl_ACase      , gs_Root, CST_FILE_MapCase + CST_EXTENSION_PHP);
    p_LoadStringList(lstl_ALine      , gs_Root, CST_FILE_MapLine + CST_EXTENSION_PHP);
    p_ReplaceLanguageString ( lstl_HTMLAFolder, CST_HTML_CAPTION, gs_ANCESTROWEB_Map_Long,[rfReplaceAll] );
    // Full Map
    p_ReplaceLanguageString ( lstl_HTMLAFolder, CST_MAP_CAPTIONS, gs_ANCESTROWEB_MapCaptions ,[rfReplaceAll]);
    p_ReplaceLanguageString ( lstl_HTMLAFolder, CST_MAP_TO      , gs_ANCESTROWEB_Map_To      ,[rfReplaceAll]);
    p_ReplaceLanguageString ( lstl_AllSurnames, CST_MAP_CASE    , '' ,[rfReplaceAll]);
    p_ReplaceLanguageString ( lstl_AllSurnames, CST_MAP_NAME    , '' ,[rfReplaceAll]);
    p_ReplaceLanguageString ( lstl_AllSurnames, CST_MAP_LATITUD , FloatToStr(ld_MinLatitude ),[rfReplaceAll]);
    p_ReplaceLanguageString ( lstl_AllSurnames, CST_MAP_LONGITUD, FloatToStr(ld_MinLongitude),[rfReplaceAll]);
    p_ReplaceLanguageString ( lstl_AllSurnames, CST_MAP_MAX_ZOOM, gs_ANCESTROWEB_MapMaxZoom,[rfReplaceAll]);
    p_ReplaceLanguageString ( lstl_AllSurnames, CST_MAP_ZOOM    , fs_MapZoom ( ld_Minlatitude, ld_Maxlatitude, ld_Minlongitude , ld_Maxlongitude ),[rfReplaceAll]);
    li_i := 0;
    with IBS_MapFiltered do
    while not EOF do
      begin
        p_IncProgressInd; // growing the second counter
        ls_NewSurname := FieldByName(IBQ_NOM).AsString;
        if  ( ls_NewSurname <> ls_ASurname )
        and ( ls_NewSurname <> '' )
         Then // Setting new case for a new named map
           p_setACase(lstl_HTMLAFolder, lstl_ACase, li_Name);
        if  ( li_Name <> -1 )
        and ( ls_NewSurname <> '' ) Then
         Begin  // adding lines in the full and named map
           inc (li_i);
           p_setAline(lstl_HTMLAFolder, lstl_ALine,IBS_MapFiltered,lt_Surnames [ li_Name ].MaxCounter,True);
           p_ReplaceLanguageString ( lstl_HTMLAFolder, CST_MAP_N, IntToStr(li_i),[rfReplaceAll] );
           inc (li_i);
           p_setAline(lstl_AllSurnames, lstl_ALine,IBS_MapFiltered,li_MaxCounter,False);
           p_ReplaceLanguageString ( lstl_AllSurnames, CST_MAP_N, IntToStr(li_i),[rfReplaceAll] );
           p_addKeyWord(ls_ASurname, '-'); // adding a head's meta keywords
         end;
        Next;

      end;
    // Finishing
    p_ReplaceLanguageString ( lstl_HTMLAFolder, CST_MAP_LINE, '' );
    p_ReplaceLanguageString ( lstl_AllSurnames   , CST_MAP_LINE, '' );
    p_ReplaceLanguageString ( lstl_HTMLAFolder, CST_MAP_CASE, lstl_AllSurnames.Text );
    // creating PHP file
    p_CreateAHtmlFile(lstl_HTMLAFolder, CST_FILE_MAP, me_MapHead.Lines.Text,
       gs_ANCESTROWEB_Map, gs_ANCESTROWEB_Map, gs_ANCESTROWEB_Map_Long, gs_LinkGedcom,'',CST_EXTENSION_PHP);
    // saving the page
    ls_destination := gs_RootPathForExport + ed_MapFileName.Text + CST_EXTENSION_PHP;
    try
      lstl_HTMLAFolder.SaveToFile(ls_destination);
    except
      On E: Exception do
      begin
        ShowMessage(fs_getCorrectString ( gs_ANCESTROWEB_cantCreateHere ) + ls_destination + CST_ENDOFLINE + E.Message);
        Abort;
      end;
    end;
    lstl_HTMLAFolder.Clear;
    p_IncProgressBar;
  end;

  // procedure p_createMap
  // create filtered map ?
  procedure p_createMap;
  Begin
    if ch_genMap.Checked Then
    begin
      if ch_Filtered.Checked
      then
       Begin
         if ch_ancestors.Checked Then
           Begin
             if fb_OpenTree(DmWeb.IBS_TreeMap,gi_CleFiche) Then
               p_createAMap (DmWeb.IBS_TreeMap);
           end
          else
           Begin
             if fb_OpenTree(DmWeb.IBS_TreeMapDes, gi_CleFiche) Then
               p_createAMap (DmWeb.IBS_TreeMapDes);
           end;
       end
      else
       Begin
         DmWeb.IBS_MapAll.Close;
         DmWeb.IBS_MapAll.ParamByName(I_DOSSIER).AsInteger:=DMWeb.CleDossier;
         DmWeb.IBS_MapAll.ExecQuery;
         p_createAMap (DmWeb.IBS_MapAll);

       end;
    end;
  end;
begin
  lstl_HTMLAFolder := TStringList.Create;
  p_createMap;
  p_CreateKeyWords;
  ls_ASurname := '';
  pb_ProgressInd.Position:=0;  // initing user value
  pb_ProgressInd.Max:=IBS_FilesFiltered.RecordCount;
  lstl_HTMLAFolder.Add ( fs_CreateULTabsheets ( gt_SheetsLetters, '', CST_HTML_SUBMENU, False, True ));
  lstl_HTMLAFolder.Add ( fs_CreateElementWithId(CST_HTML_TABLE, 'Surnames') + CST_HTML_TR_BEGIN + CST_HTML_TD_BEGIN  );
  while not IBS_FilesFiltered.EOF do
  begin
    p_IncProgressInd; // growing the second counter
    ls_NewSurname := IBS_FilesFiltered.FieldByName(IBQ_NOM).AsString;
    if (ls_NewSurname <> ls_ASurname) Then
     Begin
      if (length(ls_NewSurname) = 0) Then
        ls_NewSurname:=' ';
      if ((length(ls_ASurname) = 0) or
        (ls_NewSurname[1] <> ls_ASurname[1])) then // Anchor
        lstl_HTMLAFolder.Add ( CST_HTML_TD_END +CST_HTML_TR_END + CST_HTML_TR_BEGIN + CST_HTML_TD_BEGIN +
                               CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"' + ls_NewSurname[1] + '" />'+
                               CST_HTML_H4_BEGIN + ls_NewSurname[1] + CST_HTML_H4_END + CST_HTML_TD_END +CST_HTML_TD_BEGIN)
        Else lstl_HTMLAFolder.Add ( ' - ' );
      // Name and its link
      lstl_HTMLAFolder.Add ( fs_GetNameLink ( ls_NewSurname, ls_NewSurname, CST_SUBDIR_HTML_FILES + CST_HTML_DIR_SEPARATOR ) +' ( '+ IBS_FilesFiltered.FieldByName( IBQ_COUNTER ).AsString );
      if  ch_genMap.Checked // Creating optionnal map button
      and ( fi_findName(ls_NewSurname)<>-1)
       Then
        lstl_HTMLAFolder.Add ( ' - ' + fs_Create_Link(ed_MapFileName.Text+CST_EXTENSION_PHP + '?name=' +ls_NewSurname,
                               fs_Create_Image(CST_SUBDIR_HTML_IMAGES+CST_HTML_DIR_SEPARATOR+CST_FILE_MAP
                               +CST_HTML_DIR_SEPARATOR+CST_FILE_MAP+CST_FILE_Button+CST_EXTENSION_GIF,gs_ANCESTROWEB_Map)));
      lstl_HTMLAFolder.Add ( ')' );
     end;
    ls_ASurname := IBS_FilesFiltered.FieldByName(IBQ_NOM).AsString;
    p_addKeyWord(ls_ASurname, '-'); // adding a head's meta keyword
    IBS_FilesFiltered.Next;

  end;
  lstl_HTMLAFolder.Add ( CST_HTML_TD_END +CST_HTML_TR_END + CST_HTML_TABLE_END );
  p_CreateAHtmlFile(lstl_HTMLAFolder, CST_FILE_Surnames, me_SurnamesHead.Lines.Text,
     ( gs_AnceSTROWEB_Surnames ), gs_AnceSTROWEB_Surnames, gs_ANCESTROWEB_Surnames_Long, gs_LinkGedcom);
  // saving the page
  ls_destination := gs_RootPathForExport + ed_SurnamesFileName.Text + CST_EXTENSION_HTML;
  try
    lstl_HTMLAFolder.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_ANCESTROWEB_cantCreateHere ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  lstl_HTMLAFolder.Free;
  p_IncProgressBar; // growing the counter
end;

// procedure TF_AncestroWeb.p_genHtmlList
// creating persons' list
procedure TF_AncestroWeb.p_genHtmlList(const IBQ_FilesFiltered: TIBQuery);
var
  ls_ASurname, ls_destination: string;
  lt_SheetsLists : TAHTMLULTabSheet;
  ls_ImagesDir: string;
  li_CounterPages : Longint;

  function fs_addYear ( const as_yearField, as_CityField : String ) : String;
  Begin
    with IBQ_FilesFiltered do
      if fb_ShowYear(FieldByName(as_yearField).AsInteger)
       then
        Begin
          Result := FieldByName(as_yearField).AsString+fs_AddComma ( fs_getLinkedCity ( Trim (  FieldByName(as_CityField).AsString )));
        end
       Else Result := '';
  end;

  procedure p_AddAList;
  var
    lstl_HTMLAList: TStringList;
    ls_NewSurname, ls_Sexe, ls_ASurnameBegin, ls_ASurnameEnd: string;
    li_i, li_CleFiche: longint;
    lb_next : Boolean ;
  begin
    p_CreateKeyWords;
    lstl_HTMLAList := TStringList.Create;
    ls_ASurnameBegin := IBQ_FilesFiltered.FieldByName(IBQ_NOM).AsString;
    if (ls_ASurnameBegin <> '') then
      p_SelectTabSheet(lt_SheetsLists,ls_ASurnameBegin[1],ls_ASurnameBegin); // current letter sheet
    lstl_HTMLAList.Text :=
      fs_CreateULTabsheets(lt_SheetsLists, '', CST_HTML_SUBMENU);
    if (ls_ASurnameBegin <> '') then
      p_SelectTabSheet(lt_SheetsLists,ls_ASurnameBegin[1],ls_ASurnameBegin, False);  // reiniting for next page
    lb_next := True;
    lstl_HTMLAList.Add( CST_HTML_CENTER_BEGIN + fs_CreateElementWithId ( CST_HTML_TABLE , 'list' ));
    lstl_HTMLAList.Add( fs_CreateElementWithId ( CST_HTML_TR , CST_TABLE_TITLE )+
                         fs_Create_TD ( CST_FILE_PERSON, CST_HTML_ID_EQUAL, 2 )+CST_HTML_TD_END+
                         fs_Create_TD ( CST_FILE_PERSON, CST_HTML_ID_EQUAL )+CST_HTML_H2_BEGIN+ ( gs_AnceSTROWEB_Person ) +CST_HTML_H2_END+CST_HTML_TD_END+
                        CST_HTML_TD_BEGIN+CST_HTML_H2_BEGIN+ ( gs_AnceSTROWEB_Born ) +CST_HTML_H2_END+CST_HTML_TD_END+
                        CST_HTML_TD_BEGIN+CST_HTML_H2_BEGIN+ ( gs_AnceSTROWEB_Died ) +CST_HTML_H2_END+CST_HTML_TD_END+
                        CST_HTML_TR_END);
    for li_i := 1 to gi_FilesPerList do
    with IBQ_FilesFiltered do
      begin
        p_IncProgressInd; // growing the second counter
        p_addKeyWord( FieldByName(IBQ_NOM).AsString, '-'); // adding a head's meta keyword
        p_addKeyWord( FieldByName(IBQ_PRENOM).AsString); // adding a head's meta keyword
        li_CleFiche :=  FieldByName(IBQ_CLE_FICHE).AsInteger;
        ls_NewSurname :=  FieldByName(IBQ_NOM).AsString;
        case  FieldByName(IBQ_SEXE).AsInteger of
         IBQ_SEXE_MAN   : ls_Sexe := CST_FILE_MAN;
         IBQ_SEXE_WOMAN : ls_Sexe := CST_FILE_WOMAN;
         else
           ls_Sexe := 'file';
        end;

        lstl_HTMLAList.Add( fs_CreateElementWithId ( CST_HTML_TR, ls_Sexe + CST_FILE_Number + IntToStr(li_i), CST_HTML_CLASS_EQUAL ) + CST_HTML_TD_BEGIN );
        if (ls_NewSurname <> ls_ASurname) Then
         Begin
          if (ls_ASurname = '') or ((length(ls_NewSurname) > 0) and
            (ls_NewSurname[1] <> ls_ASurname[1])) then
            lstl_HTMLAList.Add(CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"' + ls_NewSurname[1] + '" />');
         end;
        ls_ASurname := ls_NewSurname;
        ls_ASurname:= ls_ASurname + ' ' +  FieldByName(IBQ_PRENOM).AsString ; // showed name
        lstl_HTMLAList.Add(   fs_AddPhoto(li_CleFiche, fs_getaltPhoto(IBQ_FilesFiltered), ls_ImagesDir, 24) +   // mini photo
                              CST_HTML_TD_END + CST_HTML_TD_BEGIN +
                              CST_HTML_IMAGE_SRC + '../' + CST_SUBDIR_HTML_IMAGES + '/' + ls_Sexe + CST_EXTENSION_GIF + '" />' +
                              CST_HTML_TD_END + CST_HTML_TD_BEGIN +
                              fs_GetNameLink ( fs_RemplaceChar ( ls_ASurname, ' ', '_' ), ls_ASurname, '../' + CST_SUBDIR_HTML_FILES + '/' ) +
                              CST_HTML_TD_END + fs_Create_TD(CST_TABLE_CENTER) +  fs_addYear (IBQ_ANNEE_NAISSANCE,IBQ_VILLE_NAISSANCE) + // birth
                              CST_HTML_TD_END + fs_Create_TD(CST_TABLE_CENTER) +  fs_addYear (IBQ_ANNEE_DECES,IBQ_VILLE_DECES)+   // death
                              CST_HTML_TR_END); // city of death
        ls_ASurnameEnd :=  FieldByName(IBQ_NOM).AsString;
         Next;
        if  EOF then
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
      ( gs_AnceSTROWEB_List ) + ' - ' + ls_ASurnameBegin +
      ( gs_AnceSTROWEB_At ) + ls_ASurnameEnd, '', '', gs_LinkGedcom, '..' + CST_HTML_DIR_SEPARATOR);
    // saving the page
    ls_destination := gs_RootPathForExport +
      CST_SUBDIR_HTML_LISTS + DirectorySeparator + ed_ListsBeginName.Text + IntToStr(
      li_CounterPages) + CST_EXTENSION_HTML;
    try
      lstl_HTMLAList.SaveToFile(ls_destination);
    except
      On E: Exception do
      begin
        ShowMessage(fs_getCorrectString ( gs_ANCESTROWEB_cantCreateHere ) + ls_destination + CST_ENDOFLINE + E.Message);
        Abort;
      end;
    end;
    lstl_HTMLAList.Free;
    Inc(li_CounterPages);
  end;

begin
  try
    p_Setcomments ( gs_AnceSTROWEB_List ); // advert for user
    Finalize ( lt_SheetsLists );
    p_createLettersSheets ( lt_SheetsLists, IBQ_FilesFiltered, gi_FilesPerList, ed_ListsBeginName.Text );
    li_CounterPages := 0;
    pb_ProgressInd.Position := 0; // initing user value
    ls_ImagesDir := gs_RootPathForExport + CST_SUBDIR_HTML_LISTS + DirectorySeparator + CST_SUBDIR_HTML_IMAGES + DirectorySeparator ;
    fb_CreateDirectoryStructure(ls_ImagesDir);
    fb_CreateDirectoryStructure(gs_RootPathForExport + CST_SUBDIR_HTML_LISTS);
    pb_ProgressInd.Max := IBQ_FilesFiltered.RecordCount;
    IBQ_FilesFiltered.First;
    p_SelectTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_List ), ''); // current page sheet
    ls_ASurname := '';
    p_IncProgressBar; // growing the counter
    while not IBQ_FilesFiltered.EOF do
      p_AddAList;

  finally
  end;
  p_SelectTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_List ), '', False);  // reiniting for next page
end;
function TF_AncestroWeb.fs_getaltPhoto(const IBQ_IndividuFiltered : TIBQuery):String;
Begin
  Result:=IBQ_IndividuFiltered.FieldByName(
      IBQ_ANNEE_NAISSANCE).AsString + '-' +
      IBQ_IndividuFiltered.FieldByName(
      IBQ_ANNEE_DECES).AsString + ' ' +
      IBQ_IndividuFiltered.FieldByName(
      IBQ_NOM).AsString + ' ' +
      IBQ_IndividuFiltered.FieldByName(
      IBQ_PRENOM).AsString;
end;
function TF_AncestroWeb.fs_getaltPhoto(const IBQ_IndividuFiltered : TIBSQL):String;
Begin
  Result:=IBQ_IndividuFiltered.FieldByName(
      IBQ_ANNEE_NAISSANCE).AsString + '-' +
      IBQ_IndividuFiltered.FieldByName(
      IBQ_ANNEE_DECES).AsString + ' ' +
      IBQ_IndividuFiltered.FieldByName(
      IBQ_NOM).AsString + ' ' +
      IBQ_IndividuFiltered.FieldByName(
      IBQ_PRENOM).AsString;
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
  Result := fs_TextToFileName(as_FileAltName ) + '-' + IntToStr(
    ai_cleFiche) + CST_EXTENSION_JPEG;
  while FileExistsUTF8(Result) { *Converted from FileExists*  } do
  Begin
    inc ( li_i );
    Result := fs_TextToFileName(as_FileAltName ) + '-' + IntToStr(
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

// procedure TF_AncestroWeb.p_genHtmlFiles
// HTML persons' Files generation
procedure TF_AncestroWeb.p_genHtmlFiles(const IBQ_FilesFiltered: TIBQuery);
var
  lstl_HTMLPersons: TStringList;
  ls_ASurname, ls_destination: string;
  ls_ImagesDir, ls_ArchivesDir: string;
  li_CounterPages : Longint;
  lstl_listWords, lstl_listSeparat : TUArray;

  // Marriages with source
  function fs_CreateMarried (  const as_Date, as_dateWriten : String ; const ai_ClefUnion : Longint ): String;
  var ls_FileName, ls_FileNameBegin : String ;
      li_i : Integer ;
      lb_showdate : Boolean;
  Begin
    if ( as_Date = '' ) Then
      Begin
        Result := '';
        Exit;
      end;
    // getting source
    DMWeb.IBQ_ConjointSources.Close;
    DMWeb.IBQ_ConjointSources.ParamByName ( I_CLEF_UNION  ).AsInteger:=ai_ClefUnion;
    DMWeb.IBQ_ConjointSources.Open;
    try
      lb_showdate := fb_Showdate(StrToDate(as_Date,'yyyy-mm-dd', '-')) ;
    except
      lb_showdate := False;
    end;
    if not lb_Showdate
      Then
        Exit;
    Result := ' (' ;
    AppendStr ( Result, gs_ANCESTROWEB_Family_On + as_dateWriten );
    if ch_Images.Checked
    and not DMWeb.IBQ_ConjointSources.EOF Then
      Begin
         // adding source
        if DMWeb.IBS_Conjoint.FieldByName(IBQ_SEXE).AsInteger = IBQ_SEXE_WOMAN
        Then ls_FileNameBegin := fs_getNameAndSurName (IBQ_FilesFiltered )+'&'+fs_getNameAndSurName (DMWeb.IBS_Conjoint)
        Else ls_FileNameBegin := fs_getNameAndSurName (DMWeb.IBS_Conjoint)+'&'+fs_getNameAndSurName (IBQ_FilesFiltered);
        ls_FileNameBegin := as_Date + '_ID'+fs_TextToFileName(DMWeb.IBS_Conjoint.FieldByName(UNION_CLEF).AsString + '_' + ls_FileNameBegin+'_'+
                            DMWeb.IBS_Conjoint.FieldByName(UNION_CP).AsString+'_'+DMWeb.IBS_Conjoint.FieldByName(UNION_CITY).AsString )+ '_';
        li_i := 1 ;

        // medias
        while not DMWeb.IBQ_ConjointSources.EOF do
          Begin
            ls_FileName := ls_FileNameBegin + IntToStr(li_i);
            if fb_getMediaFile ( DMWeb.IBQ_ConjointSources, ls_ArchivesDir, ls_FileName ) Then
              Begin
                AppendStr( Result, ' - ' +fs_Create_Link ( CST_HTML_OUTDIR_SEPARATOR + CST_SUBDIR_HTML_ARCHIVE + CST_HTML_DIR_SEPARATOR + ls_FileName +CST_EXTENSION_JPEG,
                                                           gs_ANCESTROWEB_ArchiveLinkBegin + IntToStr(li_i),CST_HTML_TARGET_BLANK ));
                inc ( li_i );
              End;

            DMWeb.IBQ_ConjointSources.Next;
          End
      end;
    AppendStr( Result, ')' );
  end;

  // add an event date with city
  function fs_addDateAndCity ( const IBQ_FicheInfos : TIBSQL ; const as_date,as_year, as_City, as_manon, as_womanon : String ):String ;
  begin

    // is there an info
    with IBQ_FicheInfos do
    if not FieldByName(as_date).IsNull and fb_ShowYear(FieldByName(as_year).AsInteger) Then
      Begin
        if FieldByName(IBQ_SEXE).AsInteger = IBQ_SEXE_WOMAN
         Then Result := as_womanon
         Else Result := as_manon   ;
        AppendStr ( Result, FieldByName(as_date).AsString ) ;
        if FieldByName(as_City).AsString <> '' Then
          AppendStr ( Result, ( gs_AnceSTROWEB_At ) + fs_getLinkedCity(FieldByName(as_City).AsString));
        AppendStr ( Result, CST_HTML_BR );
        End
       Else Result := '';
  end;

  // person's infos
  procedure p_AddJobs ( const astl_HTMLAFolder : TStringList ; const ai_CleFiche, ai_NoInPage : LongInt  );
  var ls_Line : String ;
  Begin
    with DMWeb.IBS_JobsInd do
     Begin
      Close;
      ParamByName ( IBQ_CLE_FICHE ).AsInteger:=ai_CleFiche;
      ExecQuery;
      if not Eof Then  // Job(s) ?
        Begin
          // title
         astl_HTMLAFolder.Add ( fs_CreateElementWithId ( CST_HTML_H3    , CST_FILE_JOBS
                                                            + CST_FILE_Number + IntToStr( ai_NoInPage ),CST_HTML_CLASS_EQUAL));
         if RecordCount = 1  // 1 or more jobs ?
          Then astl_HTMLAFolder.Add (( gs_ANCESTROWEB_Job   ))
          else astl_HTMLAFolder.Add (( gs_ANCESTROWEB_Jobs  ));
         astl_HTMLAFolder.Add ( CST_HTML_H3_END );  // title end
         astl_HTMLAFolder.Add ( fs_CreateElementWithId ( CST_HTML_UL, CST_FILE_JOBS
                                                            + CST_FILE_Number + IntToStr( ai_NoInPage ),CST_HTML_CLASS_EQUAL));
         while not EOF do  // adding all jobs
          Begin
           astl_HTMLAFolder.Add ( fs_CreateElementWithId ( CST_HTML_LI, CST_FILE_JOB + CST_FILE_Number + IntToStr( ai_NoInPage ),CST_HTML_CLASS_EQUAL)
                                + fs_getLinkedJob( FieldByName(IBQ_EV_IND_DESCRIPTION).AsString ));
           if FieldByName(IBQ_EV_IND_VILLE).AsString <> '' Then
           astl_HTMLAFolder.Add ( ' ' + gs_ANCESTROWEB_At + ' '
                                + fs_getLinkedCity(FieldByName(IBQ_EV_IND_VILLE).AsString));
           if ( FieldByName(IBQ_EV_IND_PAYS).AsString <> '' )
           or (( FieldByName(IBQ_EV_IND_DATE).AsString <> '' ) and fb_Showdate(FieldByName(IBQ_EV_IND_DATE).AsDateTime))
             Then
              Begin
               ls_Line := '(' ;
               if FieldByName(IBQ_EV_IND_PAYS).AsString <> '' Then
                AppendStr ( ls_line, FieldByName(IBQ_EV_IND_PAYS).AsString );
               if  ( FieldByName(IBQ_EV_IND_PAYS).AsString <> '' )
               and (( FieldByName(IBQ_EV_IND_DATE).AsString <> '' ) and fb_Showdate(FieldByName(IBQ_EV_IND_DATE).AsDateTime)) Then
                 AppendStr ( ls_line,  ' - ' );
               if not FieldByName(IBQ_EV_IND_DATE).IsNull and fb_Showdate(FieldByName(IBQ_EV_IND_DATE).AsDateTime) Then
                AppendStr ( ls_line, FormatDateTime(gs_ANCESTROWEB_LittleDateFormat,FieldByName(IBQ_EV_IND_DATE).AsDateTime));
               astl_HTMLAFolder.Add ( ls_line + ')' );
              end;
           astl_HTMLAFolder.Add ( CST_HTML_LI_END);
           Next;
          end;

         astl_HTMLAFolder.Add ( CST_HTML_UL_END );  // list end
        end;
     end;
  End;
  procedure p_AddInfos ( const astl_HTMLAFolder : TStringList ; const ai_CleFiche, ai_NoInPage : LongInt  );
  var ls_ASurname : String ;
  Begin
    try
      // getting file
      DMWeb.IBS_Fiche.Close;
      DMWeb.IBS_Fiche.ParamByName(I_CLEF).AsInteger := ai_CleFiche;
      DMWeb.IBS_Fiche.ExecQuery;
      // Married ?
      DMWeb.IBS_Conjoint.Close;
      DMWeb.IBS_Conjoint.ParamByName ( I_CLEF    ).AsInteger:=ai_CleFiche;
      DMWeb.IBS_Conjoint.ExecQuery;
      // Jobs ?
      // birthday
      astl_HTMLAFolder.Add ( fs_addDateAndCity ( DMWeb.IBS_Fiche, IBQ_DATE_NAISSANCE, IBQ_ANNEE_NAISSANCE, IBQ_LIEU_NAISSANCE, ( gs_ANCESTROWEB_ManBornOn ), ( gs_ANCESTROWEB_WomanBornOn )));
      // deathday
      astl_HTMLAFolder.Add ( fs_addDateAndCity ( DMWeb.IBS_Fiche, IBQ_DATE_DECES, IBQ_ANNEE_DECES, IBQ_LIEU_DECES, ( gs_ANCESTROWEB_ManDiedOn ), ( gs_ANCESTROWEB_WomanDiedOn )) + CST_HTML_BR);
      p_AddJobs ( astl_HTMLAFolder, ai_CleFiche, ai_NoInPage );
      if not DMWeb.IBS_Conjoint.Eof Then  // Husband
        Begin
          // title
         astl_HTMLAFolder.Add ( fs_CreateElementWithId ( CST_HTML_H3    , CST_FILE_UNION + 's'
                                                            + CST_FILE_Number + IntToStr( ai_NoInPage ),CST_HTML_CLASS_EQUAL));
         if DMWeb.IBS_Conjoint.RecordCount = 1  // 1 or more husbands and ex ?
          Then astl_HTMLAFolder.Add (( gs_AnceSTROWEB_Union   ))
          else astl_HTMLAFolder.Add (( gs_AnceSTROWEB_Unions  ));
         astl_HTMLAFolder.Add ( CST_HTML_H3_END );  // title end
         astl_HTMLAFolder.Add ( fs_CreateElementWithId ( CST_HTML_UL, CST_FILE_UNION + 's'
                                                            + CST_FILE_Number + IntToStr( ai_NoInPage ),CST_HTML_CLASS_EQUAL));
         while not DMWeb.IBS_Conjoint.EOF do  // adding all husbands
         with DMWeb.IBS_Conjoint do
          Begin
           ls_ASurname := FieldByName(IBQ_NOM).AsString + ' ' + FieldByName(IBQ_PRENOM).AsString;
           astl_HTMLAFolder.Add ( fs_CreateElementWithId ( CST_HTML_LI, CST_FILE_UNION + CST_FILE_Number + IntToStr( ai_NoInPage ),CST_HTML_CLASS_EQUAL)
                                + fs_GetNameLink ( fs_RemplaceChar(ls_ASurname,' ', '_'), ls_ASurname));
           astl_HTMLAFolder.Add ( fs_CreateMarried ( FieldByName(UNION_DATE_MARIAGE).AsString ,
                                                     FieldByName(UNION_MARIAGE_WRITEN).AsString ,
                                                     FieldByName(UNION_CLEF).AsInteger));
           astl_HTMLAFolder.Add ( CST_HTML_LI_END);
           Next;
          end;

         astl_HTMLAFolder.Add ( CST_HTML_UL_END );  // list end
        end;
    finally
    end;
  end;
  // ancestry and descent trees
  procedure p_AddTrees ( const astl_HTMLAFolder : TStringList ; const ai_CleFiche, ai_NoInPage : LongInt );
  var
    lstl_Tree: TStringList;
    li_generations: longint;
    lb_AddAncestry : Boolean ;
  begin
   // adding a line and cell in the table
    astl_HTMLAFolder.Add(CST_HTML_TR_BEGIN + CST_HTML_TD_BEGIN );
    lstl_Tree := TStringList.Create;
    if fb_OpenTree(DMWeb.IBQ_TreeAsc, ai_CleFiche, 3)
     Then lb_AddAncestry := DMWeb.IBQ_TreeAsc.RecordCount > 1
     Else lb_AddAncestry := False;
     // descent
    if fb_OpenTree(DMWeb.IBQ_TreeDesc, ai_CleFiche, 3)
    and ( DMWeb.IBQ_TreeDesc.RecordCount > 1 ) then
    begin
      li_generations :=
        fi_CreateHTMLTree(DMWeb.IBQ_TreeDesc, lstl_Tree, ai_CleFiche,
        False, False, True, IBQ_TQ_NUM_SOSA, False);
      lstl_Tree.Insert(0, fs_Create_DIV('descent' + CST_FILE_Number + IntToStr(ai_NoInPage), CST_HTML_CLASS_EQUAL) + fs_GetTitleTree (( gs_AnceSTROWEB_Descent ), li_generations ));
      astl_HTMLAFolder.AddStrings(lstl_Tree);
      astl_HTMLAFolder.Add(CST_HTML_DIV_End);
      if lb_AddAncestry then
        astl_HTMLAFolder.Add(CST_HTML_BR);
    end;
    // ancestry
    if lb_AddAncestry then
    begin
      lstl_Tree.Clear;
      li_generations :=
        fi_CreateHTMLTree(DMWeb.IBQ_TreeAsc, lstl_Tree, ai_CleFiche, False, False, True);
      lstl_Tree.Insert(0, fs_Create_DIV('ancestry' + CST_FILE_Number + IntToStr(ai_NoInPage),CST_HTML_CLASS_EQUAL) + fs_GetTitleTree (( gs_AnceSTROWEB_Ancestry ), li_generations ));
      astl_HTMLAFolder.AddStrings(lstl_Tree);
      astl_HTMLAFolder.Add(CST_HTML_DIV_End);
    end;
    // line end
    astl_HTMLAFolder.Add(CST_HTML_TD_END + CST_HTML_TR_END);
    lstl_Tree.Free;
  end;

  // procedure p_AddAFolder
  // adding persons' folder page
  procedure p_AddAFolder;
  var
    lstl_HTMLAFolder: TStringList;
    ls_NewSurname, ls_ASurnameBegin, ls_ASurnameSurname, ls_ASurnameEnd: string;
    li_i, li_CleFiche: longint;
    lb_next : Boolean ;
  begin
    p_CreateKeyWords;
    lstl_HTMLAFolder := TStringList.Create;
    ls_ASurnameBegin := IBQ_FilesFiltered.FieldByName(IBQ_NOM).AsString;
    ls_ASurnameSurname := fs_RemplaceEspace ( fs_getNameAndSurName(IBQ_FilesFiltered), '_' );
    if (ls_ASurnameBegin <> '') then
      p_SelectTabSheet(gt_SheetsLetters,ls_ASurnameSurname[1],ls_ASurnameSurname); // current letter sheet
    lstl_HTMLAFolder.Text := fs_CreateULTabsheets(gt_SheetsLetters, '', CST_HTML_SUBMENU); // Creating the letters' sheets
    if (ls_ASurnameBegin <> '') then
      p_SelectTabSheet(gt_SheetsLetters,ls_ASurnameSurname[1],ls_ASurnameSurname, False);  // reiniting for next page
    lb_next := True;
    lstl_HTMLAFolder.Add( CST_HTML_CENTER_BEGIN );
    for li_i := 1 to gi_FilesPerPage do
    begin
      p_IncProgressInd; // growing the second counter
      ls_ASurnameSurname := fs_RemplaceEspace ( fs_getNameAndSurName(IBQ_FilesFiltered), '_' );
      // adding html head's meta-keywords
      p_addKeyWord(IBQ_FilesFiltered.FieldByName(IBQ_NOM).AsString, '-'); // adding a head's meta keyword
      p_addKeyWord(IBQ_FilesFiltered.FieldByName(IBQ_PRENOM).AsString); // adding a head's meta keyword
      li_CleFiche := IBQ_FilesFiltered.FieldByName(IBQ_CLE_FICHE).AsInteger;
      ls_NewSurname := IBQ_FilesFiltered.FieldByName(IBQ_NOM).AsString;
      if (ls_NewSurname <> ls_ASurname) Then
       Begin
        if (ls_ASurname = '') or ((length(ls_NewSurname) > 0) and
          (ls_NewSurname[1] <> ls_ASurname[1])) then
          lstl_HTMLAFolder.Add(CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"' + ls_NewSurname[1] + '" />')
        else if (ls_ASurname = '') then
          lstl_HTMLAFolder.Add(CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"A" />');
        if length ( ls_NewSurname ) > 1 Then
          lstl_HTMLAFolder.Add(CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"' + ls_NewSurname + '" />');
       end;
      ls_ASurname := ls_NewSurname;
      case IBQ_FilesFiltered.FieldByName(IBQ_SEXE).AsInteger of
       IBQ_SEXE_MAN   : ls_NewSurname := CST_FILE_MAN;
       IBQ_SEXE_WOMAN : ls_NewSurname := CST_FILE_WOMAN;
       else
         ls_NewSurname := 'file';
      end;
      lstl_HTMLAFolder.Add(CST_HTML_A_BEGIN + CST_HTML_NAME_EQUAL + '"' + ls_ASurnameSurname + '" />');
      lstl_HTMLAFolder.Add(CST_HTML_BR + fs_CreateElementWithId ( CST_HTML_TABLE , ls_NewSurname + CST_FILE_Number + IntToStr(li_i) , CST_HTML_CLASS_EQUAL ) +
        CST_HTML_TR_BEGIN + fs_Create_TD ( ls_NewSurname + CST_FILE_Number + IntToStr(li_i), CST_HTML_CLASS_EQUAL, 2 ));
      lstl_HTMLAFolder.Add( CST_HTML_DIV_BEGIN + '<' + CST_HTML_H2 + CST_HTML_ID_EQUAL +'"subtitle">' + CST_HTML_IMAGE_SRC + '../'
                           + CST_SUBDIR_HTML_IMAGES + '/' + ls_NewSurname + CST_EXTENSION_GIF + '" />' + fs_getLinkedSurName ( ls_ASurname ) +
        ' ' + fs_getLinkedName ( IBQ_FilesFiltered.FieldByName(IBQ_PRENOM).AsString, lstl_listWords ) + CST_HTML_H2_BEGIN + CST_HTML_DIV_END);
      lstl_HTMLAFolder.Add(CST_HTML_TD_END + CST_HTML_TR_END  + CST_HTML_TR_BEGIN  + CST_HTML_TD_BEGIN);
      p_AddInfos ( lstl_HTMLAFolder, li_CleFiche, li_i );
      lstl_HTMLAFolder.Add(CST_HTML_TD_END);
      lstl_HTMLAFolder.Add( fs_AddImageTable(fs_AddPhoto( li_CleFiche, fs_getaltPhoto(IBQ_FilesFiltered), ls_ImagesDir)));
      lstl_HTMLAFolder.Add( CST_HTML_TR_END );
      p_AddTrees ( lstl_HTMLAFolder, li_CleFiche, li_i );
      lstl_HTMLAFolder.Add( CST_HTML_TABLE_END + CST_HTML_BR);
      ls_ASurnameEnd := IBQ_FilesFiltered.FieldByName(IBQ_NOM).AsString;
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
      ( gs_AnceSTROWEB_Files ) + ' - ' + ls_ASurnameBegin +
      ( gs_AnceSTROWEB_At ) + ls_ASurnameEnd, '', '', gs_LinkGedcom, '..' + CST_HTML_DIR_SEPARATOR);

    // saving the page
    ls_destination := gs_RootPathForExport +
      CST_SUBDIR_HTML_FILES + DirectorySeparator + ed_FileBeginName.Text + IntToStr(
      li_CounterPages) + CST_EXTENSION_HTML;
    try
      lstl_HTMLAFolder.SaveToFile(ls_destination);
    except
      On E: Exception do
      begin
        ShowMessage(fs_getCorrectString ( gs_ANCESTROWEB_cantCreateHere ) + ls_destination + CST_ENDOFLINE + E.Message);
        Abort;
      end;
    end;
    lstl_HTMLAFolder.Free;
    Inc(li_CounterPages);
  end;

begin
  p_IncProgressBar; // growing the counter
  p_Setcomments (( gs_AnceSTROWEB_Files )); // advert for user
  li_CounterPages := 0;
  pb_ProgressInd.Position := 0; // initing not needed user value
  ls_ImagesDir := gs_RootPathForExport + CST_SUBDIR_HTML_FILES +
    DirectorySeparator + CST_SUBDIR_HTML_IMAGES + DirectorySeparator;
  ls_ArchivesDir := gs_RootPathForExport + CST_SUBDIR_HTML_ARCHIVE +
    DirectorySeparator ;
  fb_CreateDirectoryStructure(ls_ImagesDir);
  fb_CreateDirectoryStructure(ls_ArchivesDir);
  pb_ProgressInd.Max := IBQ_FilesFiltered.RecordCount;
  IBQ_FilesFiltered.First;
  p_SelectTabSheet(gt_TabSheets, ( gs_AnceSTROWEB_Files ), '', False); // current page sheet
  ls_ASurname := '';
  p_IncProgressBar; // growing the counter
  with FileCopy do
    Begin
      FileOptions:=FileOptions+[cpDestinationIsFile];
      while not IBQ_FilesFiltered.EOF do
        p_AddAFolder;
      FileOptions:=FileOptions-[cpDestinationIsFile];
    end;
  lstl_HTMLPersons := TStringList.Create;
  lstl_HTMLPersons.Text := fs_CreateULTabsheets(gt_SheetsLetters,
    CST_SUBDIR_HTML_FILES + CST_HTML_DIR_SEPARATOR, CST_HTML_SUBMENU) +
    CST_HTML_CENTER_BEGIN + '<' + CST_HTML_Paragraph +
    CST_HTML_ID_EQUAL + '"head">' + fs_Format_Lines(
    me_FilesHead.Text) + CST_HTML_Paragraph_END;
  lstl_HTMLPersons.Add(CST_HTML_CENTER_END);
  p_CreateKeyWords;
  pb_ProgressInd.Position := 0; // initing not needed user value
  p_IncProgressBar; // growing the counter
  p_CreateAHtmlFile(lstl_HTMLPersons, CST_FILE_FILES, me_FilesHead.Lines.Text,
    ( gs_AnceSTROWEB_Files ), gs_AnceSTROWEB_Files, gs_ANCESTROWEB_Files_Long, gs_LinkGedcom);
  p_IncProgressBar; // growing the counter

  // saving the page
  ls_destination := gs_RootPathForExport +
    ed_FileBeginName.Text + CST_EXTENSION_HTML;
  try
    lstl_HTMLPersons.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_ANCESTROWEB_cantCreateHere ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  lstl_HTMLPersons.Free;
  p_genHtmlList(IBQ_FilesFiltered);
end;

// procedure TF_AncestroWeb.p_genPhpContact
// HTML page form sending mail
procedure TF_AncestroWeb.p_genPhpContact;
var
  lstl_HTMLContact: TStringList;
  lstl_HTMLContactBeforeHTML: TStringList;
  ls_destination: string;
begin
  p_Setcomments (( gs_AnceSTROWEB_Contact )); // advert for user
  lstl_HTMLContact := TStringList.Create;
  lstl_HTMLContactBeforeHTML := TStringList.Create;
  p_LoadStringList(lstl_HTMLContact, gs_Root, CST_FILE_ContactInBody + CST_EXTENSION_PHP);

  // setting begining HTML page values
  p_ReplaceLanguageString(lstl_HTMLContact,CST_HTML_CAPTION,gs_ANCESTROWEB_MailCaption);
  p_ReplaceLanguageString(lstl_HTMLContact,CST_HTML_HEAD_DESCRIBE,StringReplace (me_ContactHead.Lines.Text, CST_ENDOFLINE, CST_HTML_BR, [rfReplaceAll]));
  p_ReplaceLanguagesStrings ( lstl_HTMLContact, CST_HTML_CONTACT_IN_LANG );
  // loading PHP page
  p_LoadStringList(lstl_HTMLContactBeforeHTML, gs_Root, CST_FILE_ContactBefore + CST_EXTENSION_PHP);

  // setting PHP page
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

  // Head key words
  p_CreateKeyWords;
  pb_ProgressInd.Position := 0; // initing not needed user value

  // finishing creating the page
  p_CreateAHtmlFile(lstl_HTMLContact, CST_FILE_Contact, me_ContactHead.Lines.Text,
    ( gs_AnceSTROWEB_Contact ), gs_AnceSTROWEB_Contact, gs_ANCESTROWEB_MailCaption, gs_LinkGedcom,
    '', CST_EXTENSION_PHP, lstl_HTMLContactBeforeHTML.Text);

  // growing the counter
  p_IncProgressBar; // growing the counter

  // saving the page
  ls_destination := gs_RootPathForExport + ed_ContactName.Text + CST_EXTENSION_PHP;
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

// procedure TF_AncestroWeb.p_genHtmlSearch
// Search engine HTML page request
procedure TF_AncestroWeb.p_genHtmlSearch;
var
  lstl_HTMLSearch: TStringList;
  ls_destination: string;
begin
  p_Setcomments (( gs_AnceSTROWEB_Search )); // advert for user
  pb_ProgressInd.Position := 0; // initing not needed user value
  lstl_HTMLSearch := TStringList.Create;
  p_CreateAHtmlFile(lstl_HTMLSearch, CST_FILE_SEARCH, me_searchHead.Lines.Text,
        ( gs_AnceSTROWEB_Search ), gs_AnceSTROWEB_Search, gs_ANCESTROWEB_SearchLong, gs_LinkGedcom, '');

  // setting page values from Tabsheet
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_HTML_HEAD_DESCRIBE, StringReplace(me_searchHead.Text,CST_ENDOFLINE,'<BR />',[]));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_HTML_SEND      , ( gs_AnceSTROWEB_Send  ));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_HTML_RESET     , ( gs_AnceSTROWEB_Reset ));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_SEARCH_DOMAIN  ,Trim(ed_SearchSite.Text));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_SEARCH_SEARCH  , ( gs_AnceSTROWEB_Search ));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_SEARCH_SEARCH  , ( gs_AnceSTROWEB_Search ));
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_SEARCH_SEARCH_QUER  ,ed_SearchQuery.Text);
  p_ReplaceLanguageString(lstl_HTMLSearch,CST_SEARCH_SEARCH_TOOL  ,ed_SearchTool.Text);

  // saving the page
  ls_destination := gs_RootPathForExport + ed_SearchName.Text  + CST_EXTENSION_HTML;
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
  // growing the counter
  p_IncProgressBar; // growing the counter
end;

// function TF_AncestroWeb.fs_getLinkedBase
// Optional link to external site
function TF_AncestroWeb.fs_getLinkedBase ( const as_Texte : String; const as_Link : String; const ai_ComboIndex : Integer ) : String;
Begin
//  if pos ( 'Fran', as_Texte ) > 0 Then
//         ShowMessage(as_Texte );
  case ai_ComboIndex of
   0, 3 : Result:=fs_FormatText(as_Texte,ai_ComboIndex<3,False,False,True); // Sans accent ou avec accents avec une majuscule
   1, 4 : Result:=fs_FormatText(as_Texte,ai_ComboIndex<3,False,True); // Sans accent ou avec accents sans majuscule
   2, 5 : Result:=fs_FormatText(as_Texte,ai_ComboIndex<3,True); // Sans accent ou avec accents en majuscules
  end;
  Result := fs_Create_Link(as_Link+Result,as_Texte, CST_HTML_TARGET_BLANK );
End;

// function TF_AncestroWeb.fs_getLinkedName
// Optional link to Name site
function TF_AncestroWeb.fs_getLinkedName ( const as_Texte : String ; var aa_listWords : TUArray ) :  String;
var
    li_i : Integer;
Begin
  if not ch_NamesLink.Checked
  or ( Trim ( as_Texte ) = '' ) Then
   Begin
    Result := as_Texte;
    Exit;
   end;
  Result := '';
  Finalize ( aa_listWords );
  fb_stringConstruitListe(as_texte,aa_listWords);
  for li_i := 0 to high ( aa_listWords ) do
   Begin
     AppendStr ( Result, fs_getLinkedBase ( Trim ( copy ( as_Texte, aa_listWords [ li_i ][0], aa_listWords [ li_i ][1] )), ed_BaseNames.Text, cb_NamesAccents.ItemIndex ));
//       if pos ( 'Fran', copy ( as_Texte, aa_listWords [ li_i ][0], aa_listWords [ li_i ][1] ) ) > 0 Then
//       ShowMessage( copy ( as_Texte, aa_listWords [ li_i ][0], aa_listWords [ li_i ][1] ));
     if  ( aa_listWords [ li_i ][2] <> 0 )
      Then AppendStr(Result, '-' )
      Else AppendStr(Result, ' ' );
   end;
End;

// function TF_AncestroWeb.fs_getLinkedSurName
// Optional link to SurName site
function TF_AncestroWeb.fs_getLinkedSurName ( const as_Texte : String ) : String;
Begin
  if not ch_SurNamesLink.Checked
  or ( Trim ( as_Texte ) = '' ) Then
   Begin
    Result := as_Texte;
    Exit;
   end;
  Result := fs_getLinkedBase (Trim ( as_Texte ), ed_BaseSurnames.Text, cb_SurnamesAccents.ItemIndex );
End;

// function TF_AncestroWeb.fs_getLinkedCity
// Optional link to City site
function TF_AncestroWeb.fs_getLinkedCity ( const as_Texte : String ) : String;
Begin
  if not ch_CitiesLink.Checked
  or ( Trim ( as_Texte ) = '' ) Then
   Begin
    Result := as_Texte;
    Exit;
   end;
  Result := fs_getLinkedBase ( Trim ( as_Texte ), ed_BaseCities.Text, cb_CityAccents.ItemIndex );
End;

// function TF_AncestroWeb.fs_getLinkedJob
// Optional link to job site
function TF_AncestroWeb.fs_getLinkedJob ( const as_Texte : String ) : String;
Begin
  if not ch_JobsLink.Checked
  or ( Trim ( as_Texte ) = '' ) Then
   Begin
    Result := as_Texte;
    Exit;
   end;
  Result := fs_getLinkedBase ( Trim ( as_Texte ), ed_BaseJobs.Text, cb_JobsAccents.ItemIndex );
End;

// procedure TF_AncestroWeb.p_genHtmlAges
// Ages : HTML page creating
procedure TF_AncestroWeb.p_genHtmlAges;
var
  lstl_HTMLAges ,
  lstl_HTMLAges2,
  lstl_HTMLLines: TStringList;
  ls_destination: string;

  procedure p_addLines;
    var
      li_Age, li_Linecounter, li_countTotal, li_MenTotal, li_WomenTotal : Longint;

      // Setting not replaced values
      procedure p_setHtmlReplaceValues;
      Begin
        p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_COUNT      , IntToStr(li_Linecounter),[]);
        p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_MEN_COUNT  , CST_ZERO          ,[]);
        p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_WOMEN_COUNT, CST_ZERO          ,[]);
      end;
      procedure p_setLine;
      begin
        with DMWeb.IBS_Ages do
          Begin
          // first and next line
          if li_Age <> FieldByName(IBQ_AGE_AU_DECES).AsInteger Then
            Begin
              p_setHtmlReplaceValues ;
              p_ReplaceLanguageString(lstl_HTMLAges,CST_AGES_LINES  ,lstl_HTMLLines.Text+'['+CST_AGES_LINES+']');
              li_Age:= FieldByName(IBQ_AGE_AU_DECES).AsInteger ;
              p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_AN_AGE, IntToStr(li_Age)  ,[]);
              li_Linecounter := 0;
            end;
          // growing
          inc ( li_Linecounter, FieldByName ( IBQ_COUNTER ).AsInteger );
          inc ( li_countTotal, li_Linecounter );
          // men or women
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
          end;
      end;

  Begin
    li_Age := -1;
    li_countTotal :=0;
    li_MenTotal   :=0;
    li_WomenTotal :=0;

    // setting data
    with DMWeb.IBS_Ages do
      try
        Close;
        ParamByName(I_DOSSIER).Value:=DMWeb.CleDossier;
        ExecQuery;
        while not Eof do
          Begin
            if FieldByName(IBQ_AGE_AU_DECES).IsNull Then
              Begin
               Next;
               Continue;
              end;

            p_setLine;

            Next;
          end;
      except
        On E: Exception do
        begin
          ShowMessage(fs_getCorrectString ( gs_ANCESTROWEB_cantOpenData ) + DMWeb.IBS_Ages.Database.DatabaseName + CST_ENDOFLINE + E.Message);
          Abort;
        end;
      end;
    p_setHtmlReplaceValues;

    // adding last line
    p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_LINES      ,lstl_HTMLLines.Text);
    // last total line
    p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_AN_AGE     , gs_ANCESTROWEB_TotalAgeDead,[]);
    p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_COUNT      , IntToStr(li_countTotal),[]);
    p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_MEN_COUNT  , IntToStr(li_MenTotal)  ,[]);
    p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_WOMEN_COUNT, IntToStr(li_WomenTotal),[]);
    DMWeb.IBS_Ages.Close;
  end;

begin
  p_Setcomments ( gs_ANCESTROWEB_Ages ); // advert for user
  pb_ProgressInd.Position := 0; // initing not needed user value
  // strings from files
  lstl_HTMLAges  := TStringList.Create;
  lstl_HTMLAges2 := TStringList.Create;
  lstl_HTMLLines := TStringList.Create;
  p_CreateKeyWords;
  // loading a simple not inited line
  p_LoadStringList ( lstl_HTMLLines, gs_Root, CST_FILE_AGES_LINE + CST_EXTENSION_HTML );
  p_LoadStringList ( lstl_HTMLAges , gs_Root, CST_FILE_AGES + '3' + CST_EXTENSION_HTML );
  // Customizing the page
  p_ReplaceLanguageString(lstl_HTMLAges,CST_HTML_HEAD_DESCRIBE, StringReplace(me_HeadAges.Text,CST_ENDOFLINE,'<BR />',[]));

  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_AN_AGE     , gs_ANCESTROWEB_AnAge         ,[]);
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_COUNT      , gs_ANCESTROWEB_Persons_Count ,[]);
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_MEN_COUNT  , gs_ANCESTROWEB_Men_Count     ,[]);
  p_ReplaceLanguageString ( lstl_HTMLAges, CST_AGES_WOMEN_COUNT, gs_ANCESTROWEB_Women_Count   ,[]);

  p_addLines;

  // creating and initing the ages page
  p_CreateAHtmlFile(lstl_HTMLAges2, CST_FILE_AGES, me_HeadAges.Lines.Text,
        ( gs_ANCESTROWEB_Ages ), gs_ANCESTROWEB_Ages, gs_ANCESTROWEB_Ages_Long, gs_LinkGedcom, '', CST_EXTENSION_HTML, '', lstl_HTMLAges);


  // saving the page
  ls_destination := gs_RootPathForExport + ed_AgesName.Text  + CST_EXTENSION_HTML;
  try
    lstl_HTMLAges2.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateContact ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  // freeing
  lstl_HTMLAges .Free;
  lstl_HTMLAges2.Free;
  lstl_HTMLLines.Free;
  p_IncProgressBar;// ages growing
end;
// procedure TF_AncestroWeb.p_genHtmlJobs
// Jobs : HTML page creating
procedure TF_AncestroWeb.p_genHtmlJobs;
var
  lstl_HTMLJobs ,
  lstl_HTMLJobs2,
  lstl_HTMLLines: TStringList;
  ls_destination: string;
  // Setting not replaced values
  procedure p_setHtmlReplaceValues;
  Begin
    p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_CITY      , '',[]);
    p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_COUNT  , CST_ZERO          ,[]);
  end;

  // procedure p_CreateLines
  // setting a job line
  procedure p_CreateLines ;
  var
    ls_City,ls_Job: string;
    li_Linecounter, li_countTotal, li_CitiesTotal : Longint;
    procedure p_setline;
    Begin
      with DMWeb.IBS_Jobs do
        Begin
          p_setHtmlReplaceValues;
          p_ReplaceLanguageString(lstl_HTMLJobs,CST_JOBS_LINES  ,lstl_HTMLLines.Text+'['+CST_JOBS_LINES+']');
          if FieldByName(IBQ_EV_IND_DESCRIPTION).AsString <> ls_Job Then
             Begin
              ls_Job := FieldByName(IBQ_EV_IND_DESCRIPTION).AsString ;
              p_addKeyWord(ls_Job); // adding a head's meta keyword
             end;
          ls_City:= FieldByName(IBQ_EV_IND_VILLE      ).AsString ;
          if ls_City <> '' Then
            Begin
              p_addKeyWord(ls_City); // adding a head's meta keyword
              ls_City:=fs_getLinkedCity(ls_city);
            end;
          ls_Job:=fs_getLinkedJob(ls_Job);
          // growing
          li_Linecounter := FieldByName ( IBQ_COUNTER ).AsInteger ;
          // showing job ant city
          p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_A_JOB, ls_Job ,[]);
          p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_CITY , ls_City ,[]);
          // showing jobs'count
          p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_COUNT , IntToStr(li_Linecounter),[]);
          inc ( li_countTotal, li_Linecounter );
          if ( ls_City <> '' ) Then
            inc ( li_CitiesTotal, li_Linecounter );
        end;
    end;

  Begin
    ls_City := '';
    ls_Job  := '';
    li_countTotal :=0;
    li_CitiesTotal:=0;

    // setting data
    with DMWeb.IBS_Jobs do
      try
        Close;
        ParamByName(I_DOSSIER).Value:=DMWeb.CleDossier;
        ExecQuery;
        while not Eof do
          Begin
            if FieldByName(IBQ_EV_IND_DESCRIPTION).AsString = '' Then
              Begin
               Next;
               Continue;
              end;
            // setting a line
            p_setline;
            Next;
          end;
      except
        On E: Exception do
        begin
          ShowMessage(fs_getCorrectString ( gs_ANCESTROWEB_cantOpenData ) + DMWeb.IBS_Ages.Database.DatabaseName + CST_ENDOFLINE + E.Message);
          Abort;
        end;
      end;
    p_setHtmlReplaceValues;

    // adding last line
    p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_LINES      ,lstl_HTMLLines.Text);
    // last total line
    p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_A_JOB      , gs_ANCESTROWEB_Jobs_Total,[]);
    p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_COUNT      , IntToStr(li_countTotal),[]);
    p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_CITY       , IntToStr(li_CitiesTotal)  ,[]);
    DMWeb.IBS_Ages.Close;
  end;

begin
  p_Setcomments ( gs_ANCESTROWEB_Jobs ); // advert for user
  pb_ProgressInd.Position := 0; // initing not needed user value
  // strings from files
  lstl_HTMLJobs  := TStringList.Create;
  lstl_HTMLJobs2 := TStringList.Create;
  lstl_HTMLLines := TStringList.Create;

  p_CreateKeyWords;
  // loading a simple not inited line
  p_LoadStringList ( lstl_HTMLLines, gs_Root, CST_FILE_JOBS_LINE + CST_EXTENSION_HTML );
  p_LoadStringList ( lstl_HTMLJobs , gs_Root, CST_FILE_JOBS + '3' + CST_EXTENSION_HTML );

  // Customizing the page
  p_ReplaceLanguageString(lstl_HTMLJobs,CST_HTML_HEAD_DESCRIBE, StringReplace(me_HeadJobs.Text,CST_ENDOFLINE,'<BR />',[]));

  p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_A_JOB  , gs_ANCESTROWEB_A_Job        ,[]);
  p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_COUNT  , gs_ANCESTROWEB_Jobs_Count   ,[]);
  p_ReplaceLanguageString ( lstl_HTMLJobs, CST_JOBS_CITY   , gs_ANCESTROWEB_Jobs_Cities  ,[]);

  p_CreateLines;

  // creating and initing the ages page
  p_CreateAHtmlFile(lstl_HTMLJobs2, CST_FILE_JOBS, me_HeadJobs.Lines.Text,
        gs_ANCESTROWEB_Jobs, gs_ANCESTROWEB_Jobs, gs_ANCESTROWEB_Jobs_Long, gs_LinkGedcom, '',CST_EXTENSION_HTML,'',lstl_HTMLJobs);

  // saving the page
  ls_destination := gs_RootPathForExport + ed_JobsName.Text  + CST_EXTENSION_HTML;
  try
    lstl_HTMLJobs2.SaveToFile(ls_destination);
  except
    On E: Exception do
    begin
      ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateContact ) + ls_destination + CST_ENDOFLINE + E.Message);
      Abort;
    end;
  end;
  // freeing
  lstl_HTMLJobs.Free;
  lstl_HTMLLines.Free;
  p_IncProgressBar;// jobs growing
end;

// procedure TF_AncestroWeb.p_CreateAHtmlFile
// Creating a HTML page from parameters
procedure TF_AncestroWeb.p_CreateAHtmlFile(const astl_Destination: TStringList;
  const as_BeginingFile,
  as_Describe, as_Title, as_LittleTitle, as_LongTitle: string;
  as_BottomHTML: string;
  const as_Subdir: string = '';
  const as_ExtFile: string =
  CST_EXTENSION_HTML;
  const as_BeforeHTML: string = ''; const astl_Body : TStringList = nil );
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
    p_SelectTabSheet(gt_TabSheets, as_LittleTitle); // current page sheet
  p_CreateHTMLFile(gt_TabSheets, astl_Destination, as_BottomHTML,
    gs_Root, as_Describe, gstl_HeadKeyWords.Text, gs_HTMLTitle + ' - ' +
    as_Title, as_LongTitle, 'main', as_BeginingFile + '1' + as_ExtFile, as_BeginingFile + '2' +
    as_ExtFile, as_BeginingFile + '3' + as_ExtFile, as_BeginingFile +
    '4' + as_ExtFile, as_Subdir, as_BeforeHTML, astl_Body );
  if as_LittleTitle <> '' then
    p_SelectTabSheet(gt_TabSheets, as_LittleTitle, '', False);  // reiniting for next page
end;

// procedure TF_AncestroWeb.DoInit
// creating database objects and initing
function TF_AncestroWeb.DoInit(const sBase: string):Boolean;
var
  Save_Cursor: TCursor;
begin
  Result := False;
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass; { Affiche le curseur en forme de sablier }
  try
    if not Assigned(DMWeb) then
    begin
      DMWeb := TDMWeb.Create(self);
      IBQ_Individu.Database:=DMWeb.ibd_BASE;
    end;
    Result:=True;
    Result:=DoOpenBase(sBase);
    if Result then
      Result:=OuvreDossier(DMWeb.CleDossier);
    if Result then
      DoAfterInit;
    PremiereOuverture:=False;
  finally
    Screen.Cursor := Save_Cursor; { Revient toujours à normal }
  end;
end;

function TF_AncestroWeb.DoInitBase(const AedNomBase: TCustomComboBox): Boolean;
begin
  if fb_AutoComboInit(AedNomBase)
  and (   (DMWeb=nil)
       or (aedNomBase.Text<>DMWeb.ibd_BASE.DatabaseName)
       or (DMWeb.ibd_BASE.Connected=false))
   Then Result := DoInit(AedNomBase.Text)
   Else Result := False;
end;

// function TF_AncestroWeb.DoOpenBase
// database opening
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
        s:=IntToStr(DMWeb.CleDossier);
        if Length(s)<2 then
          s:=s+' ';
        cbDossier.Caption:=s+', '+fNom_Dossier;
      end;
    end;
  end;
end;

// function TF_AncestroWeb.OuvreDossier
// database folder opening
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
    DMWeb.CleDossier:=NumDossier;
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
procedure TF_AncestroWeb.DoAfterInit( const ab_Ini : Boolean = True );
begin
  fNom_Dossier:=fs_TextToFileName(fNom_Dossier);
  fSoftUserPath := GetUserDir;
  {$IFNDEF FPC}
  de_ExportWeb.RootDir:=GetWindowsSpecialDir(CSIDL_DESKTOPDIRECTORY);
  {$ENDIF}
  fSoftUserPath:=fSoftUserPath+CST_AncestroWeb+DirectorySeparator+fNom_Dossier;
  FileCopy.Destination := fSoftUserPath + DirectorySeparator + CST_SUBDIR_EXPORT ;
  fb_CreateDirectoryStructure( FileCopy.Destination );
  fb_CreateDirectoryStructure( fSoftUserPath + DirectorySeparator + CST_SUBDIR_SAVE );
  de_ExportWeb.Directory := fSoftUserPath+DirectorySeparator+CST_SUBDIR_EXPORT;
  fne_Import.FileName := fSoftUserPath + DirectorySeparator + CST_SUBDIR_SAVE ;
  fne_Export.FileName := fSoftUserPath + DirectorySeparator + CST_SUBDIR_SAVE ;

  // Reading ini
  if not ab_Ini Then
    Exit;
  f_GetMainMemIniFile(nil,nil,nil,CST_AncestroWeb);
  OnFormInfoIni.p_ExecuteLecture(Self);
  p_iniReadKey;
end;

procedure TF_AncestroWeb.FormCreate(Sender: TObject);
var
  fbddpath:String;
{$IFDEF WINDOWS}
  lb_Logie : Boolean ;
  gs_Ancestro : String;
  lreg_Registry : TRegistry;
  fKeyRegistry,s: string;
  i:Integer;
  function fb_ReadAncestroKey ( const as_Soft : String ): boolean;
    Begin
      fKeyRegistry:='\SOFTWARE\'+as_Soft+'\Path';
      with lreg_Registry do
        if OpenKeyReadOnly(fKeyRegistry) then
        begin
          Result := True;
          fbddpath:=ReadString('PathFileNameBdd');
          edNomBase.Text:=fs_getCorrectString(fbddpath);
          CloseKey;
          Exit;
        end;
      Result := False;
    end;
{$ENDIF}
  procedure p_updateBase ( const as_FileUpdate : String );
  Begin
    if FileExists (gs_Root + as_FileUpdate) then
    with DMWeb do
     Begin
       if not IBT_BASE.Active
        then IBT_BASE.StartTransaction;
       IBS_Temp.SQL.LoadFromFile( gs_Root + as_FileUpdate);
       ShowMessage(gs_ANCESTROWEB_StartUpdate
          +gs_Root+as_FileUpdate);
       try
         IBS_Temp.ExecQuery;
         IBT_BASE.CommitRetaining;
         ShowMessage ( gs_ANCESTROWEB_Please_Restart );
       Except
         IBT_BASE.RollbackRetaining;
       End;
     End;
  end;

begin
  f_GetMainMemIniFile(nil,nil,nil,CST_AncestroWeb);
  OnFormInfoIni.p_ExecuteLecture(Self);
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
  lb_Logie := False;
  lreg_Registry := TRegistry.create;
  with lreg_Registry do
  try
    RootKey := HKEY_CURRENT_USER;
    if not fb_ReadAncestroKey (CST_MANIA) Then
     Begin
       gs_Ancestro := CST_LOGIE;
       if fb_ReadAncestroKey (CST_LOGIE ) Then
         lb_Logie:=True;
     End
     else gs_Ancestro := CST_MANIA;
    fKeyRegistry:='\SOFTWARE\'+gs_Ancestro+'\Settings';
    if OpenKeyReadOnly(fKeyRegistry) then
    begin
      for i:=0 to edNomBase.DropDownCount-1 do
      begin //bizarre, cette boucle ne fonctionne pas avec un TRegIniFile, ou il faudrait fermer la clé entre chaque lecture
        s:=ReadString('NomBase'+IntToStr(i));
        if s>'' then
          p_AddABase(fs_getCorrectString(s), False);
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
  p_AddABase(fbddpath);
  DoInitBase(edNomBase);
end;

procedure TF_AncestroWeb.JvXPButton1Click(Sender: TObject);
begin
  fb_AfficheApropos ( True, CST_AncestroWeb, '' );
end;

procedure TF_AncestroWeb.OnFormInfoIniIniLoad(const AInifile: TCustomInifile;
  var Continue: Boolean);
begin
  p_ReadComboBoxItems(edNomBase,edNomBase.Items);
  p_iniReadKey;
end;

procedure TF_AncestroWeb.OnFormInfoIniIniWrite(const AInifile: TCustomInifile;
  var Continue: Boolean);
begin
  p_writeComboBoxItems(edNomBase,edNomBase.Items);
  p_iniWriteKey;
end;

procedure TF_AncestroWeb.PCPrincipalChange(Sender: TObject);
begin

end;

// procedure TF_AncestroWeb.TraduceImageFailure
// Failure on picture's convert
procedure TF_AncestroWeb.TraduceImageFailure(Sender: TObject;
  const ErrorCode: integer; var ErrorMessage: string; var ContinueCopy: boolean);
begin
  ShowMessage(fs_getCorrectString ( gs_AnceSTROWEB_cantCreateImage ) + ErrorMessage);
end;

//  Procedure TF_AncestroWeb.ListerDossiers
// Database Folder list
Procedure TF_AncestroWeb.ListerDossiers;
var
  s:string;
begin
  with DMWeb.IBQ_Dossier do
  begin
    try
      Open;
      First;
      cbDossier.Items.Clear;
      while not EOF do
      begin
        s:=Fields[0].AsString;
        if Length(s)<2 then
          s:=s+' ';
        cbDossier.Items.Add(s+', '+fs_getCorrectString(Fields[1].AsString));
        if cbDossier.Items.Count=1 then
        begin
          DMWeb.CleDossier:=Fields[0].AsInteger;
          with F_AncestroWeb.cbDossier do
            Caption:=Items[0];
        end;
        Next;
      end;
      Close;
    finally
    end;
  end;
end;

initialization
  p_ConcatVersion ( gVer_AncestroWeb );
end.

