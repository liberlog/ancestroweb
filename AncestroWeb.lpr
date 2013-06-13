program AncestroWeb;

{$mode Delphi}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  sysutils,
  Interfaces, // this includes the LCL widgetset
  Forms, uniqueinstance_package, lazflatstyle, lazextcomponents, extcopy,
  lazextbuttons, U_AncestroWeb, U_DMWeb, DefObjet, ibexpress, exthtml;

{$IFDEF WIN32}
{$R *.res}
{$ENDIF}

var ls_PathBdd: AnsiString;
    APath : PChar;

begin
  Application.Initialize;
  Application.CreateForm(TF_AncestroWeb,F_AncestroWeb);
  Application.Run;
  //SetHeapTraceOutput (ExtractFilePath (Application.ExeName) + 'heaptrclog.trc');
End.

