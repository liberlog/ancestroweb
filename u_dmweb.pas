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
  fonctions_system,
{$ENDIF}
  IBQuery, Dialogs, Forms, functions_html;

var gt_TabSheets : TaHTMLULTabSheet;
    gi_FilesPerPage : Integer = 15 ;
    gi_FilesPerList : Integer = 60 ;


const IBQDLLNOM='NOM';
      IBQDLLPRENOM='PRENOM';
      IBQDLLDOSSIER='dll_DOSSIER';
      NOM_DOSSIER = 'NOM_DOSSIER';

      EQUAL       = '=' ;

      CST_AUTHOR = 'LIBERLOG 2011' ;

      CST_PROGRESS_COUNTER_TITLE    = 1;
      CST_PROGRESS_COUNTER_NAMES    = 1;
      CST_PROGRESS_COUNTER_SEARCH   = 1;
      CST_PROGRESS_COUNTER_AGES     = 1;
      CST_PROGRESS_COUNTER_JOBS     = 1;
      CST_PROGRESS_COUNTER_TREE     = 4;
      CST_PROGRESS_COUNTER_CONTACT  = 1;
      CST_PROGRESS_COUNTER_HOME     = 1;
      CST_PROGRESS_COUNTER_FILES    = 4;
      CST_PROGRESS_COUNTER_LIST     = 1;
      CST_PROGRESS_COUNTER_COPY     = 2;
      SQL_OR      = ' OR ' ;
      CST_AncestroWeb = 'AncestroWeb' ;
      CST_AncestroWeb_WithLicense = CST_AncestroWeb + ' GPL' ;

      IBQ_CLE_FICHE = 'CLE_FICHE' ;
      IBQ_CLE_PERE='CLE_PERE';
      IBQ_CLE_MERE='CLE_MERE';
      IBQ_ANNEE_NAISSANCE='ANNEE_NAISSANCE';
      IBQ_ANNEE_DECES    ='ANNEE_DECES';
      IBQ_SOSA       = 'NUM_SOSA' ;
      IBQ_SEXE       = 'SEXE' ;
      IBQ_SEXE_MAN   = 1 ;
      IBQ_SEXE_WOMAN = 2 ;

      IBQ_EV_IND_DESCRIPTION ='EV_IND_DESCRIPTION';
      IBQ_EV_IND_VILLE       ='EV_IND_VILLE';
      IBQ_EV_IND_DATE        ='EV_IND_DATE';
      IBQ_EV_IND_PAYS        ='EV_IND_PAYS';

      FICHE_DATE_NAISSANCE = 'DATE_NAISSANCE';
      FICHE_LIEU_NAISSANCE = 'LIEU_NAISSANCE';
      FICHE_DATE_DECES     = 'DATE_DECES';
      FICHE_LIEU_DECES     = 'LIEU_DECES';

      IBQ_COUNTER = 'COUNTER' ;

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
      IBQ_DATE_NAISSANCE='DATE_NAISSANCE';
      IBQ_DATE_DECES='DATE_DECES';
      IBQ_AGE_AU_DECES='AGE_AU_DECES';
      IBQ_NIVEAU='TQ_NIVEAU';
      IBQ_TQ_SOSA  ='tq_sosa';
      IBQ_NUM_SOSA  ='num_sosa';

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
      CST_FILE_AGES         = 'Ages';
      CST_FILE_AGES_LINE    = 'AgesLine';
      CST_FILE_JOBS         = 'Jobs';
      CST_FILE_JOB          = 'Job';
      CST_FILE_JOBS_LINE    = 'JobsLine';
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

      // Search page word replace
      CST_SEARCH_SEARCH     = 'Search';
      CST_SEARCH_SEARCH_TOOL= 'SearchTool';
      CST_SEARCH_SEARCH_QUER= 'SearchQuery';
      CST_SEARCH_DOMAIN     = 'Domain';

      // Ages words' replace
      CST_AGES_LINES       = 'Ages_Lines';
      CST_AGES_AN_AGE      = 'Age';
      CST_AGES_MEN_COUNT   = 'Count_Ages_Men';
      CST_AGES_WOMEN_COUNT = 'Count_Ages_Women';
      CST_AGES_COUNT       = 'Count_Ages';

      // Jobs words' replace
      CST_JOBS_LINES       = 'Jobs_Lines';
      CST_JOBS_A_JOB       = 'Job';
      CST_JOBS_COUNT       = 'Count_Jobs';
      CST_JOBS_CITY        = 'City';

      CST_ZERO             = '0';


      // contact page word replace
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

      // letters' sheet
      CST_FILES_BEGIN_LETTER = 'A';
      CST_FILES_END_LETTER   = 'Z';

type

  { TDMWeb }

  TDMWeb = class(TDataModule)
    IBQSources_Record: TIBQuery;
    IBQ_Jobs: TIBQuery;
    IBQ_Compte: TIBQuery;
    IBQ_Fiche: TIBQuery;
    IBQ_JobsInd: TIBQuery;
    IBQ_Names: TIBQuery;
    IBQ_ConjointSources: TIBQuery;
    IBQ_Conjoint: TIBQuery;
    IBQ_Medias: TIBQuery;
    IBQ_Ages: TIBQuery;
    IBQ_TreeAsc: TIBQuery;
    IBQ_TreeByNames: TIBQuery;
    IBQ_TreeNames: TIBQuery;
    IBQ_TreeDesc: TIBQuery;
    IBT_BASE: TIBTransaction;
    ibd_BASE: TIBDatabase;
    IBQDLL: TIBQuery;
    IBQUpdateDLL: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Déclarations privées }
    s_User_Name, s_PassWord: string;

  public
    { Déclarations publiques }
    function doOpenDatabase(const sBase: string):boolean;
    function LitDllDossier:boolean;

  end;

var
  DMWeb: TDMWeb;
  sDataBaseName: string;
  fNom_Dossier:string;
  fCleFiche: integer;
  fCleDossier: integer;
  fNomIndi: string;
  fPrenomIndi: string;
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
     AncestroWeb_strings_delphi,
{$ELSE}
     AncestroWeb_strings,
{$ENDIF}
    fonctions_init,fonctions_string;

procedure TDMWeb.DataModuleCreate(Sender: TObject);
begin
  s_User_Name := 'SYSDBA';
  s_PassWord := 'masterkey';
end;

function TDMWeb.doOpenDatabase(const sBase: string):boolean;
begin
  Result:=True;
  //f_GetMemIniFile();  on verra sous Linux mais IniFile est déjà initialisé dans le FormCreate
  if IBT_BASE.Active then
    IBT_BASE.Commit;
  if ibd_BASE.Connected then
    ibd_BASE.Close;
  ibd_BASE.DatabaseName := sBase;

  ibd_BASE.Params.Clear;
  ibd_BASE.Params.Add('user_name='+s_User_Name);
  ibd_BASE.Params.Add('password='+s_PassWord);
  {$IFDEF FPC}
  ibd_BASE.Params.Add('lc_ctype=UTF8');//attention avec champs iso8859_1 "corrompus" dans les bases Ancestro
  {$ENDIF} //delphi: dépend de la version
  try
    ibd_BASE.Open;
    IBT_Base.StartTransaction;
    sDataBaseName := sBase;
  except
    On E:Exception do
    begin
      ShowMessage( fs_getCorrectString ( gs_ANCESTROWEB_cantConnect ) + sDataBaseName+#13#10+E.Message);
      Result:=False;
    end;
  end;
end;

function TDMWeb.LitDllDossier:boolean;
begin
  Result:=True;
  try
    IBQDLL.Open;
    fCleFiche := IBQDLL.FieldByName(IBQ_CLE_FICHE).AsInteger;
    fCleDossier := IBQDLL.FieldByName(IBQDLLDOSSIER).AsInteger;
    fNomIndi := fs_getCorrectString ( IBQDLL.FieldByName(IBQDLLNOM).AsString );
    fPrenomIndi := fs_getCorrectString ( IBQDLL.FieldByName(IBQDLLPRENOM).AsString );
    fNom_Dossier:=fs_getCorrectString(IBQDLL.FieldByName(NOM_DOSSIER).AsString);
    IBQDLL.Close;
  except
    On E:Exception do
    begin
      ShowMessage( fs_getCorrectString('Erreur lecture table Dll_Dossier')+#13#10+E.Message);
      Result:=False; //chaine à ajouter dans AncestroWeb_strings
    end;
  end;
end;

procedure TDMWeb.DataModuleDestroy(Sender: TObject);
begin
  //enregistrement du retour dans la table GESTION_DLL inutilisé
  if IBT_BASE.Active then
  try
    IBT_Base.Commit
  except
    IBT_BASE.Rollback;
  end;
  if ibd_BASE.Connected then
    ibd_BASE.Close;
end;

end.
