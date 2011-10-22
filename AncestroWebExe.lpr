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
  DefObjet in 'DefObjet.pas',
  U_AncestroWeb {FMain},
  U_DMWeb, lazextcomponents, lazfonctions, exthtml,
  extcopy, vampyreimagingpackage, JvXPBarLaz {DM: TDataModule};

var
  fbddpath:String;
{$IFDEF WINDOWS}
  fKeyRegistry: string;

begin

  fKeyRegistry := '\SOFTWARE\'+CST_MANIA;

  with TRegIniFile.create do try
    RootKey := HKEY_CURRENT_USER;
    if OpenKey(fKeyRegistry, False) then begin
        fbddpath := ReadString('Path', 'PathFileNameBdd', '');
      end;
  finally
    Free;
  end;
  {$ELSE}
Begin
  {$ENDIF}
  Application.Initialize;
 // gs_Root := ExtractFileDir(Application.ExeName)+DirectorySeparator+'Plugins/AncestroWeb/';
  //Application.CreateForm(TF_AncestroWeb, F_AncestroWeb);
  if fbddpath = '' Then
  {$IFDEF  LINUX}
    fbddpath := '/var/lib/firebird/2.5/data/Base.FDB';
  {$ELSE}
    fbddpath := ExtractFileDir(Application.ExeName)+DirectorySeparator+'Base.FDB';
  {$ENDIF}
  InitStartDll(PChar(fbddpath));
//  Application.Run;
end.

