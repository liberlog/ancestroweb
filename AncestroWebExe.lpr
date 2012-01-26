program demo;

{$IFDEF FPC}
  {$MODE Delphi}
{$ELSE}
  {$R *.res}
{$ENDIF}

{--------------------------------------------------------------------------------------------------------
Stucture d un model de dll pour integration dans Ancestrologie

Il vous faut impérativement garder cette structure sauf la fenetre Main  qui
n est pas obligatoire
Ainsi que le module DM si vous ne vous servez pas de base de données
--------------------------------------------------------------------------------------------------------}
uses
  Classes,
  {$IFNDEF FPC}
  fonctions_system,
  {$ENDIF}
  {$IFDEF WIN32}
    Registry,
  {$ENDIF}
  SYSUtils,
  Dialogs,
  Forms, Interfaces,
  U_AncestroWeb {FMain},
  U_DMWeb, lazextcomponents, lazfonctions, exthtml,
  extcopy, vampyreimagingpackage, JvXPBarLaz {DM: TDataModule};

var
  fbddpath:String;
BEGIN
  Application.Initialize;
  Application.CreateForm(TDMWeb,DMWeb);
  gs_Soft := CST_LOGIE;
  gs_Root:=ExtractFileDir(Application.ExeName);
  Application.CreateForm(TF_AncestroWeb,F_AncestroWeb);
  F_AncestroWeb.DoInit(fs_FindKey(gs_Soft, 'PathFileNameBdd'));
  F_AncestroWeb.Show;
  Application.Run;
end.

