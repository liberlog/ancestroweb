unit U_Form_Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, IBCustomDataSet, IBQuery, Mask, DBCtrls, SkinData, Registry,
  DynamicSkinForm, SkinCtrls;

type
  TFMain = class(TForm)
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    IBQuery2: TIBQuery;
    IBQuery2CLE_FICHE: TIntegerField;
    IBQuery2NOM_PERE: TIBStringField;
    IBQuery2PRENOM_PERE: TIBStringField;
    IBQuery2PERE_CLE_FICHE: TIntegerField;
    IBQuery2PERE_NAISSANCE: TIBStringField;
    IBQuery2PERE_DECES: TIBStringField;
    IBQuery2PERE_SOSA: TFloatField;
    IBQuery2NOM_MERE: TIBStringField;
    IBQuery2PRENOM_MERE: TIBStringField;
    IBQuery2MERE_CLE_FICHE: TIntegerField;
    IBQuery2MERE_NAISSANCE: TIBStringField;
    IBQuery2MERE_DECES: TIBStringField;
    IBQuery2MERE_SOSA: TFloatField;
    IBQuery2PERE_ANNEE: TIntegerField;
    IBQuery2MERE_ANNEE: TIntegerField;
    IBQuery2PERE: TStringField;
    IBQuery2MERE: TStringField;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinData1: TspSkinData;
    spSkinPanel1: TspSkinPanel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    spSkinSpeedButton1: TspSkinSpeedButton;
    procedure FormDestroy(Sender: TObject);
    procedure IBQuery2CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure spSkinSpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
    procedure DoAfterInit;
    procedure DoOpenBase(sBase: string);
  public
    { Déclarations publiques }
    fSkin, Root: string;
    procedure DoInit(sBase: string);
  end;

var
  FMain: TFMain;

implementation

uses U_DM;

{$R *.DFM}

procedure TFMain.FormDestroy(Sender: TObject);
begin
  dm.Free;
end;

procedure TFMain.DoInit(sBase: string);
var
  Save_Cursor: TCursor;
begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass; { Affiche le curseur en forme de sablier }

  DoOpenBase(sBase);
  DoAfterInit;

  Screen.Cursor := Save_Cursor; { Revient toujours à normal }
end;

procedure TFMain.DoOpenBase(sBase: string);
begin
  dm := tdm.create(self);
  try
    dm.doOpenDatabase(sBase);
  except
    dm.Free;
  end;
end;

procedure TFMain.DoAfterInit;
begin

  Caption := dm.fNomIndi + ', ' + dm.fPrenomIndi;
  dm.fRetourDll := 'Ici on peut mettre une chaine qui sera recupéré apres la fermeture de la dll';

  IBQuery2.Close;
  IBQuery2.Params[0].AsInteger := dm.fCleFiche;
  IBQuery2.Params[1].AsInteger := dm.fCleDossier;
  IBQuery2.Open;
end;

procedure TFMain.IBQuery2CalcFields(DataSet: TDataSet);
begin
  IBQuery2PERE.AsString := IBQuery2NOM_PERE.AsString + ', ' + IBQuery2PRENOM_PERE.AsString;
  IBQuery2MERE.AsString := IBQuery2NOM_MERE.AsString + ', ' + IBQuery2PRENOM_MERE.AsString;
end;

procedure TFMain.FormCreate(Sender: TObject);
var
  fKeyRegistry: string;

begin

  fKeyRegistry := '\SOFTWARE\Ancestrologie';

  with TRegIniFile.create do try
    RootKey := HKEY_CURRENT_USER;
    if OpenKey(fKeyRegistry, False) then begin
      fSkin := ReadString('Settings', 'SkinDefault', '');
      Root := ReadString('Path', 'PathAppli', '');
      if Root = '' then begin
        Root := ReadString('Path', 'PathImportExport', '');
        Delete(Root, length(Root), 1);
        while (length(Root) > 2) and (Root[length(Root)] <> '\') do
          Delete(Root, length(Root), 1);
      end;
    end;
  finally
    Free;
  end;

  spSkinData1.ClearSkin;

  if FileExists(fSkin) then
    spSkinData1.LoadFromFile(fSkin);

  // ici mettre la taille initiale car avec les skins, les fenetres se resize
  ClientHeight := 198;
  ClientWidth := 446;
end;

procedure TFMain.spSkinSpeedButton1Click(Sender: TObject);
begin
Close;
end;

end.

