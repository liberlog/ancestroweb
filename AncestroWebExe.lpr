program demo;

{$IFDEF FPC}
  {$MODE Delphi}
{$ELSE}
  {$R *.res}
{$ENDIF}

uses
{$IFNDEF FPC}
  fonctions_system,
{$ENDIF}
  Interfaces,Forms,Dialogs,Translations,LCLProc,
  U_AncestroWeb;

{$IFNDEF FPC}
Begin
{$ELSE}
procedure TranslateLCL;
var
PODirectory, Lang, FallbackLang: String;
begin
PODirectory:='AncestroWeb\langues\';
Lang:='';
FallbackLang:='';
LCLGetLanguageIDs(Lang,FallbackLang);
Translations.TranslateUnitResourceStrings('LCLStrConsts',PODirectory+'lclstrconsts.%s.po',Lang,FallbackLang);
end;

Begin
  TranslateLCL;
{$ENDIF}
  Application.Initialize;
  Application.CreateForm(TF_AncestroWeb,F_AncestroWeb);
  F_AncestroWeb.Show;
  Application.Run;
end.

