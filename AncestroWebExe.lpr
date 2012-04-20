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
  U_AncestroWeb, sysutils;

{$IFNDEF FPC}
Begin
{$ELSE}
var li_i : UTF8String;
    i : ^Byte;
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
             {
writeln (inttostr(Ord('A'))+ ' ' +inttostr(Ord('Z'))+ ' '+inttostr(Ord('a'))+ ' ' +inttostr(Ord('z')));
  li_i := 'ÿ';
  i := @li_i[1]+1;
  while i^ < 255 do
   Begin
     if li_i[1] in ['A'..'Z','a'..'z'] Then
       write ( ''''+li_i+''',' )
       else
       write ( '#'+IntToStr(i^)+',' );
     inc ( i^ );
   end;
writeln ('');
 Exit;        }
  Application.Initialize;
  Application.CreateForm(TF_AncestroWeb,F_AncestroWeb);
  F_AncestroWeb.Show;
  Application.Run;
end.

