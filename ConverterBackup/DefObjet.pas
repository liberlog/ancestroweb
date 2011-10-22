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
  classes,
  idGlobal;
procedure InitStartDll(value: Pchar);
function InitTitreDll: Pchar;

const
  // -- Titre de la DLL qui s'affichera dans le menu ADD'ON, a vous d'y mettre votre titre ----------------
  S_TITRE = 'Mon premier Add''on d''Ancestrologie...';

implementation
uses U_Form_Main;

function InitTitreDll: pchar;
begin
  result := PChar(S_TITRE);
end;

procedure InitStartDll(value: Pchar);
{--------------------------------------------------------------------------------------------------------
Cette fonction est celle qui lance la DLL quand on clique sur l'option deu menu des ADD'ons
C'est ici que vous lancez ce que vous voulez

Ne pas supprimer le parametre passé a cette fonction, si vous ne vous en servez pas, ce n'est pas
grave, celui ci recoit le nom et chemin de la base de donnée D ancestrologie
--------------------------------------------------------------------------------------------------------}
var aFMain: TFMain;
  sBase: string;
begin
  sbase := value;
  aFMain := TFMain.create(Application);

  aFMain.DoInit(sbase);
  aFMain.ShowModal;
  aFMain.Free;
end;

exports
  InitTitreDll,
  InitStartDll;
end.

