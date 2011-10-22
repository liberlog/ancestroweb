unit U_DM;
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
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBQuery, Dialogs, Forms;

type
  TDM = class(TDataModule)
    IBT_BASE: TIBTransaction;
    ibd_BASE: TIBDatabase;
    IBQDLL: TIBQuery;
    IBQDLLCLE_FICHE: TIntegerField;
    IBQDLLNOM: TIBStringField;
    IBQDLLPRENOM: TIBStringField;
    IBQDLLDOSSIER: TIntegerField;
    IBQUpdateDLL: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Déclarations privées }
    s_User_Name, s_PassWord: string;
    fDatabase: Boolean;
  public
    { Déclarations publiques }
    sDataBaseName: string;

    fCleFiche: integer;
    fCleDossier: integer;
    fNomIndi: string;
    fPrenomIndi: string;
    fRetourDll: string;

    property Database: Boolean read fDatabase write fDatabase;

    procedure doOpenDatabase(sBase: string);
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  s_User_Name := 'SYSDBA';
  s_PassWord := 'masterkey';

  // Mettez cette variable a False si vous ne voulez pas de bse de donnée reliée a celle d Ancestrologie
  fDatabase := True;
end;

procedure Tdm.doOpenDatabase(sBase: string);
{--------------------------------------------------------------------------------------------------------
COnnection a la base
--------------------------------------------------------------------------------------------------------}
begin
  if fDatabase then
    begin
      sDataBaseName := sBase;

      ibd_BASE.Connected := False;
      ibd_BASE.DatabaseName := sDataBaseName;

      ibd_BASE.Params.Clear;
      ibd_BASE.Params.Add('user_name=' + s_User_Name);
      ibd_BASE.Params.Add('password=' + s_PassWord);

      try
        ibd_BASE.Connected := True;
        IBT_Base.Active := True;

        //-- Ici on recupere les infos du dossier et de l individu actif dans Ancestrologie -----------------
        IBQDLL.Open;

        fCleFiche := IBQDLLCLE_FICHE.AsInteger;
        fCleDossier := IBQDLLDOSSIER.AsInteger;
        fNomIndi := IBQDLLNOM.AsString;
        fPrenomIndi := IBQDLLPRENOM.AsString;

        IBQDLL.Close;
        //---------------------------------------------------------------------------------------------------

        Application.ProcessMessages;

      except
        ShowMessage('Impossible de se connecter à la base : ' + sDataBaseName);
      end;

    end
    else
    begin
            fNomIndi := 'Pas de base de données ouverte';
        fPrenomIndi := '';
    end


end;

procedure TDM.DataModuleDestroy(Sender: TObject);
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

