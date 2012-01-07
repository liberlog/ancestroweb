unit DefObjet;
{--------------------------------------------------------------------------------------------------------
Stucture d un model de dll pour integration dans Ancestrologie

Il vous faut impérativement garder les 2 methodes
InitTitreDll
et
InitStartDll

et ne pas changer le parametre passé dans InitStartDll, celui ci est le nom et le chemin de la
base de données d Ancestrologie
Si vous n avez pas besoin de base de données, ce n est pas grave
--------------------------------------------------------------------------------------------------------}

interface
uses Dialogs,
  Forms,
  fonctions_string,
  classes;
procedure InitStartDll(value: Pchar);
function InitTitreDll: Pchar;
function RetourDll: PInteger;

var gb_updateBase : Boolean = False ;

implementation
uses U_AncestroWeb,
{$IFNDEF FPC}
  AncestroWeb_strings_delphi,
{$ELSE}
  AncestroWeb_strings,
{$ENDIF}
  U_DMWeb;

function InitTitreDll: pchar;
begin
  result := PChar( fs_getCorrectString ( gs_ANCESTROWEB_TITRE ));
end;

function RetourDll: PInteger;
begin
  if gb_updateBase
  Then Result := PInteger(-10)
  Else Result := PInteger(0);
end;

procedure InitStartDll(value: Pchar);
{--------------------------------------------------------------------------------------------------------
Cette fonction est celle qui lance la DLL quand on clique sur l'option deu menu des ADD'ons
C'est ici que vous lancez ce que vous voulez

Ne pas supprimer le parametre passé a cette fonction, si vous ne vous en servez pas, ce n'est pas
grave, celui ci recoit le nom et chemin de la base de donnée D ancestrologie
--------------------------------------------------------------------------------------------------------}
var aFMain: TF_AncestroWeb;
  sBase: string;
begin
  sbase := value;
  aFMain := TF_AncestroWeb.create(Application);
  aFMain.DoInit(sbase);
  aFMain.ShowModal;
  aFMain.Free;
end;
end.
