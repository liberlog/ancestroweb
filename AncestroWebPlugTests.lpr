program AncestroWebPlugTests;

{$mode Delphi}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uniqueinstance_package, lazflatstyle, lazextcomponents, extcopy,
  U_AncestroWeb, U_DMWeb, DefObjet, ibexpress, exthtml;

{$IFDEF WIN32}
{$R *.res}
{$ENDIF}

var ls_PathBdd: AnsiString;
    APath : PChar;

begin
  Application.Initialize;
  ls_PathBdd := 'C:\Matthieu\ANCESTROLOGIE.BDD';
  APath :=Pchar(ls_PathBdd);
  InitStartDll(APath);
  Application.Run;
end.

