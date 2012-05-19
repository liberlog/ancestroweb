program AncestroWeb;

{$mode Delphi}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uniqueinstance_package, fortes324forlaz, lazflatstyle,
  lazextcomponents, extcopy, U_AncestroWeb, U_DMWeb, DefObjet, ibexpress,
  exthtml;

{$IFDEF WIN32}
{$R *.res}
{$ENDIF}

var ls_PathBdd: AnsiString;
    APath : PChar;

begin
  Application.Initialize;
  Application.CreateForm(TF_AncestroWeb,F_AncestroWeb);
  Application.Run;
end.

