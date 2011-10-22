program AncestroWebExe;

uses
  Forms,
  fonctions_system,
  SysUtils,
  Registry,
  ancestroweb_strings_delphi in 'ancestroweb_strings_delphi.pas',
  DefObjet in 'DefObjet.pas',
  u_ancestroweb in 'u_ancestroweb.pas' {F_AncestroWeb},
  u_dmweb in 'u_dmweb.pas' {DMWeb: TDataModule};

//{$R *.res}

const
  LOCALE_SABBREVLANGNAME = $00000003;   { abbreviated language name }
  LOAD_LIBRARY_AS_DATAFILE = 2;
  HKEY_CURRENT_USER = $80000001;
  KEY_ALL_ACCESS = $000F003F;
  KEY_READ = $000F0019;

var
  fKeyRegistry: string;
  fbddpath:String;

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
  Application.Initialize;
 // gs_Root := ExtractFileDir(Application.ExeName)+DirectorySeparator+'Plugins/AncestroWeb/';
  //Application.CreateForm(TF_AncestroWeb, F_AncestroWeb);
  if fbddpath = '' Then
    fbddpath := ExtractFileDir(Application.ExeName)+DirectorySeparator+'Base.FDB';
  InitStartDll(PChar(fbddpath));
end.
