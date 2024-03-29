unit DefObjet;
{--------------------------------------------------------------------------------------------------------
Stucture d un model de dll pour integration dans Ancestrologie

Il vous faut imp�rativement garder les 2 methodes
InitTitreDll
et
InitStartDll

et ne pas changer le parametre pass� dans InitStartDll, celui ci est le nom et le chemin de la
base de donn�es d Ancestrologie
Si vous n avez pas besoin de base de donn�es, ce n est pas grave
--------------------------------------------------------------------------------------------------------}

interface
uses Dialogs,
  Forms,
  fonctions_string,
  classes;
procedure InitStartDll(value: Pchar);
function InitTitreDll: Pchar;
function RetourDll: PInteger;

var gb_isDLL : Boolean = False ;

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
  Result := PInteger(-10)
end;

procedure InitStartDll(value: Pchar);
{--------------------------------------------------------------------------------------------------------
Cette fonction est celle qui lance la DLL quand on clique sur l'option deu menu des ADD'ons
C'est ici que vous lancez ce que vous voulez

Ne pas supprimer le parametre pass� a cette fonction, si vous ne vous en servez pas, ce n'est pas
grave, celui ci recoit le nom et chemin de la base de donn�e D ancestrologie
--------------------------------------------------------------------------------------------------------}
var aFMain: TF_AncestroWeb;
  sBase: string;
begin
  gb_isDLL := True;
  sbase := value;
  aFMain := TF_AncestroWeb.create(Application);
  aFMain.ShowModal;
  aFMain.Free;
end;
end.
