unit U_DMWeb;

{$IFDEF FPC}
  {$MODE Delphi}
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

{--------------------------------------------------------------------------------------------------------
Ce module permets de se connecter a la base d Ancestrologie
Il recois en parametre depuis FMain, le chemin et nom de la base de donnée

Le Query IBQDLL, vous permet de récuperer
Dossier
Identifiant
Nom
Prenom
de l individu actif dans Ancestrologie
Ancestrologie, mets a jour la table GESTION_DLL à chaque changement d individu

A partir de la vous pouvez faire toutes vos requetes sur la base
--------------------------------------------------------------------------------------------------------}

interface

uses
  SysUtils, Classes, IBDatabase,
{$IFNDEF FPC}
  fonctions_system, IBScript,
{$ENDIF}
  IBQuery, Dialogs, Forms, functions_html;

var gt_TabSheets : TaHTMLULTabSheet;
    gi_FilesPerPage : Integer = 15 ;
    gi_FilesPerList : Integer = 60 ;
    gs_Soft         : String ;


const IBQDLLNOM='NOM';
      IBQDLLPRENOM='PRENOM';
      IBQDLLDOSSIER='DOSSIER';

      EQUAL       = '=' ;
      DOSSIER_BASE = 'DS_BASE_PATH';

      CST_AUTHOR = 'LIBERLOG 2011' ;

      CST_PROGRESS_COUNTER_TITLE    = 1;
      CST_PROGRESS_COUNTER_NAMES    = 1;
      CST_PROGRESS_COUNTER_SEARCH   = 1;
      CST_PROGRESS_COUNTER_TREE     = 4;
      CST_PROGRESS_COUNTER_CONTACT  = 1;
      CST_PROGRESS_COUNTER_HOME     = 1;
      CST_PROGRESS_COUNTER_FILES    = 4;
      CST_PROGRESS_COUNTER_LIST     = 1;
      CST_PROGRESS_COUNTER_COPY     = 2;
      SQL_OR      = ' OR ' ;
      CST_AncestroWeb = 'AncestroWeb' ;
      CST_AncestroWeb_WithLicense = CST_AncestroWeb + ' GPL' ;

      INDIVIDU_CLE_FICHE = 'CLE_FICHE' ;
      INDIVIDU_CLE_PERE='CLE_PERE';
      INDIVIDU_CLE_MERE='CLE_MERE';
      INDIVIDU_ANNEE_NAISSANCE='ANNEE_NAISSANCE';
      INDIVIDU_ANNEE_DECES    ='ANNEE_DECES';
      INDIVIDU_SOSA       = 'NUM_SOSA' ;
      INDIVIDU_SEXE       = 'SEXE' ;
      INDIVIDU_SEXE_MAN   = 1 ;
      INDIVIDU_SEXE_WOMAN = 2 ;

      FICHE_DATE_NAISSANCE = 'DATE_NAISSANCE';
      FICHE_LIEU_NAISSANCE = 'LIEU_NAISSANCE';
      FICHE_DATE_DECES     = 'DATE_DECES';
      FICHE_LIEU_DECES     = 'LIEU_DECES';

      NAMES_COUNTER = 'COUNTER' ;

      UNION_DATE_MARIAGE = 'DATE_MARIAGE' ;
      UNION_CP           = 'EV_FAM_CP' ;
      UNION_CITY         = 'EV_FAM_VILLE' ;

      UNION_CLEF         = 'UNION_CLEF' ;

      CONJOINT_CLE_ID_UNKNOWN = 'CLE_ID_UNKNOWN' ;

      MEDIAS_MULTI_MEDIA   = 'MULTI_MEDIA' ;
      MEDIAS_MP_IDENTITE   = 'MP_IDENTITE' ;
      MEDIAS_MP_POINTE_SUR = 'MP_POINTE_SUR' ;
      MEDIAS_PATH          = 'MULTI_PATH' ;
      MEDIAS_NOM           = 'MULTI_NOM' ;
      MEDIAS_TABLE         = 'MP_TABLE' ;
      MEDIAS_MEDIA         = 'MP_MEDIA' ;
      MEDIAS_TYPE          = 'MULTI_IMAGE_RTF';

      MEDIAS_TABLE_SOURCE= 'S' ;
      MEDIAS_TABLE_PERSON= 'I' ;
      MEDIAS_TABLE_ARCHIV= 'A' ;
      MEDIAS_TABLE_UNION = 'F' ;
      MEDIAS_TYPE_IMAGE  = 0 ;
      MEDIAS_TYPE_DOCU   = 1 ;
      MEDIAS_TYPE_VIDEO  = 3 ;
      MEDIAS_TYPE_SON    = 2 ;

      COUNTING_LABEL    = 'LIBELLE' ;
      COUNTING_COUNTING = 'COMPTAGE' ;

      CST_INI_ANCESTROWEB_SECTION = 'AncestroWeb' ;
      CST_INI_ANCESTROWEB_Image   = 'Image' ;
      IBQ_TREE_DATE_NAISSANCE='DATE_NAISSANCE';
      IBQ_TREE_SEXE='SEXE';
      IBQ_TREE_DATE_DECES='DATE_DECES';
      IBQ_TREE_AGE_AU_DECES='AGE_AU_DECES';
      IBQ_TREE_NIVEAU='TQ_NIVEAU';
      IBQ_TREE_SOSA  ='tq_sosa';
      IBQ_TREE_NUM_SOSA  ='num_sosa';

      CST_LOGIE = 'Ancestrologie';
      CST_MANIA = 'Ancestromania';


      I_CLEF      ='I_CLEF';
      I_CLEF_MULTI='I_CLEF_MULTI';
      I_NIVEAU    ='I_NIVEAU';
      I_DOSSIER   ='I_DOSSIER';
      I_PARQUI    ='I_PARQUI';
      I_CLEF_UNION      ='I_CLEF_UNION';
      CST_SUBDIR_THEMES       = 'Themes' ;
      CST_SUBDIR_CLASSES      = 'Classes' ;
      CST_SUBDIR_EXPORT       = 'HTML'  ;
      CST_SUBDIR_SAVE         = 'Sauve'  ;
      CST_SUBDIR_SOURCES      = 'Files'  ;
      CST_SUBDIR_HTML_FILES   = 'Files' ;
      CST_SUBDIR_HTML_LISTS   = 'Lists' ;
      CST_SUBDIR_HTML_ARCHIVE = 'Archive' ;
      CST_SUBDIR_HTML_IMAGES  = 'Images' ;
      CST_SUBDIR_HTML_CSS     = 'Css' ;
      CST_SUBDIR_HTML_MAILER  = 'PhpMailer' ;
      CST_SUBDIR_HTML_SCRIPTS = 'Scripts' ;
      CST_SUBDIR_HTML_TREE    = 'Tree' ;
      KLE_DOSSIER = 'KLE_DOSSIER';
      CST_FILE_Home         = 'index';
      CST_FILE_Contact      = 'Contact';
      CST_FILE_ContactInBody= 'ContactInsideBody';
      CST_FILE_ContactBefore= 'ContactBeforeHTML';
      CST_FILE_SearchInBody = 'SearchInsideBody';
      CST_FILE_FILES        = 'Files';
      CST_FILE_LIST         = 'Liste';
      CST_FILE_SUBFILES     = 'SubFiles';
      CST_FILE_SEARCH       = 'Search';
      CST_FILE_NAMES        = 'Names' ;
      CST_FILE_Number       = ' no';
      CST_FILE_UNION        = 'union';
      CST_FILE_COUNTING     = 'counting';
      CST_FILE_MAN          = 'man';
      CST_FILE_WOMAN        = 'woman';
      CST_FILE_PERSON       = 'person';
      CST_PAGE_PREVIOUS     = 'previous';
      CST_PAGE_NEXT         = 'next';

      CST_TABLE_TITLE       = 'title';
      CST_TABLE_CENTER      = 'center';

      CST_SEARCH_SEARCH     = 'Search';
      CST_SEARCH_SEARCH_TOOL= 'SearchTool';
      CST_SEARCH_SEARCH_QUER= 'SearchQuery';
      CST_SEARCH_DOMAIN     = 'Domain';

      CST_CONTACT_MAIL     = 'Mail';
      CST_CONTACT_MAILER   = 'Mailer';
      CST_CONTACT_PASSWORD = 'Password';
      CST_CONTACT_USERNAME = 'Username';
      CST_CONTACT_HOST     = 'Host';
      CST_CONTACT_LANG     = 'Lang';
      CST_CONTACT_SECURITY = 'Security';
      CST_CONTACT_IDENTIFY = 'Identify';
      CST_CONTACT_FILE     = 'File';
      CST_CONTACT_PORT     = 'Port';
      CST_CONTACT_AUTHOR   = 'Author';
      CST_HTML_CONTACT_IN_LANG     :Array [0..9] of String= ('Name','Surname','MailFrom','MailSubject','Message','Send','Reset','SendMessage','MailSentMessage','Lang');

      CST_FILES_BEGIN_LETTER = 'A';
      CST_FILES_END_LETTER   = 'Z';

type

  { TDMWeb }

  TDMWeb = class(TDataModule)
    IBQSources_Record: TIBQuery;
    IBQ_Compte: TIBQuery;
    IBQ_Fiche: TIBQuery;
    IBQ_Names: TIBQuery;
    IBQ_ConjointSources: TIBQuery;
    IBQ_Conjoint: TIBQuery;
    IBQ_Medias: TIBQuery;
    IBQ_TreeAsc: TIBQuery;
    IBQ_TreeByNames: TIBQuery;
    IBQ_TreeNames: TIBQuery;
    IBQ_TreeDesc: TIBQuery;
    IBT_BASE: TIBTransaction;
    ibd_BASE: TIBDatabase;
    IBQDLL: TIBQuery;
    {
    CLE_FICHE: TIntegerField;
    IBQDLLNOM: TIBStringField;
    IBQDLLPRENOM: TIBStringField;
    IBQDLLDOSSIER: TIntegerField;
    }
    IBQUpdateDLL: TIBQuery;
    IBQ_Dossier: TIBQuery;
    {$IFNDEF FPC}
    IBS_Temp: TIBScript;
    {$ENDIF}
    IBQ_AscExists: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Déclarations privées }
    s_User_Name, s_PassWord: string;
    fDatabase: Boolean;
  public


    property Database: Boolean read fDatabase write fDatabase;

    procedure doOpenDatabase(const sBase: string);
  end;

var
  DMWeb: TDMWeb;
      { Déclarations publiques }
    sDataBaseName: string;

    fCleFiche: integer;
    fCleDossier: integer;
    fNomIndi: string;
    fPrenomIndi: string;
    fRetourDll: string;
    fBasePath: string;
    gs_Root: string;


implementation

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
uses
{$IFNDEF FPC}
     AncestroWeb_strings,
{$ELSE}
     AncestroWeb_strings,
{$ENDIF}
    fonctions_init,fonctions_string;

procedure TDMWeb.DataModuleCreate(Sender: TObject);
begin
  s_User_Name := 'SYSDBA';
  s_PassWord := 'masterkey';

  // Mettez cette variable a False si vous ne voulez pas de bse de donnée reliée a celle d Ancestrologie
  fDatabase := True;
end;

procedure TDMWeb.doOpenDatabase(const sBase: string);
{--------------------------------------------------------------------------------------------------------
COnnection a la base
--------------------------------------------------------------------------------------------------------}

begin

  f_GetMemIniFile();

  if fDatabase then
    begin
      sDataBaseName := sBase;

      ibd_BASE.Connected := False;
      ibd_BASE.DatabaseName := sDataBaseName;

      ibd_BASE.Params.Clear;
      ibd_BASE.Params.Add('user_name=' + s_User_Name);
      ibd_BASE.Params.Add('password=' + s_PassWord);
      {$IFDEF FPC}
      ibd_BASE.Params.Add('lc_ctype=UTF8');
      {$ENDIF}

      try
        ibd_BASE.Connected := True;
        IBT_Base.Active := True;

        //-- Ici on recupere les infos du dossier et de l individu actif dans Ancestrologie -----------------
        IBQDLL.Open;

        fCleFiche := IBQDLL.FieldByName(INDIVIDU_CLE_FICHE).AsInteger;
        fCleFiche := f_IniReadSectionInt(CST_INI_ANCESTROWEB_SECTION,INDIVIDU_CLE_FICHE,fCleFiche);
        fCleDossier := IBQDLL.FieldByName(IBQDLLDOSSIER).AsInteger;
        fNomIndi := fs_getCorrectString ( IBQDLL.FieldByName(IBQDLLNOM).AsString );
        fPrenomIndi := fs_getCorrectString ( IBQDLL.FieldByName(IBQDLLPRENOM).AsString );

        IBQDLL.Close;

        IBQ_Dossier.Close;
        IBQ_Dossier.ParamByName(I_CLEF).AsInteger := fCleDossier;
        IBQ_Dossier.Open;
        fBasePath:= IBQ_Dossier.FieldByName ( DOSSIER_BASE ).AsString;
        IBQ_Dossier.Close;
        //---------------------------------------------------------------------------------------------------

        Application.ProcessMessages;

      except
       On E:Exception do
         ShowMessage( fs_getCorrectString ( gs_ANCESTROWEB_cantConnect ) + sDataBaseName+#13#10+E.Message);
      end;

    end
    else
      begin
        fNomIndi := gs_ANCESTROWEB_NoData;
        fPrenomIndi := '';
      end;
end;

procedure TDMWeb.DataModuleDestroy(Sender: TObject);
{--------------------------------------------------------------------------------------------------------
On libere la base la base
--------------------------------------------------------------------------------------------------------}
begin
  if fDatabase then
    begin
      // -- Ici on enregistre l information de retour dans la table GESTION_DLL, une Varchar(220)------------
      with IBQUpdateDLL do
        begin
          Params[0].AsString := fRetourDLL;
          Open;
          IBT_BASE.CommitRetaining;
          close;
        end;

      IBQUpdateDLL.Free;
      IBQDLL.Close;
      IBQDLL.Free;
      IBT_Base.Free;
      ibd_BASE.Close;
      ibd_BASE.Free;
    end;
end;

end.
