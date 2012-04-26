program AncestroWebPlugTests;

{ Remarque importante concernant la gestion de mémoire de DLL : ShareMem doit
  être la première unité de la clause USES de votre bibliothèque ET de votre projet 
  (sélectionnez Projet-Voir source) si votre DLL exporte des procédures ou des
  fonctions qui passent des chaînes en tant que paramètres ou résultats de fonction.
  Cela s'applique à toutes les chaînes passées de et vers votre DLL --même celles
  qui sont imbriquées dans des enregistrements et classes. ShareMem est l'unité 
  d'interface pour le gestionnaire de mémoire partagée BORLNDMM.DLL, qui doit
  être déployé avec vos DLL. Pour éviter d'utiliser BORLNDMM.DLL, passez les 
  informations de chaînes avec des paramètres PChar ou ShortString. }

uses
  SysUtils,
  Classes,
  u_dmweb in 'u_dmweb.pas' {DMWeb: TDataModule},
  Interfaces,
  {$IFDEF FPC}
  ancestroweb_strings in 'ancestroweb_strings.pas', lazextcomponents, lazfonctions, exthtml,
  extcopy, vampyreimagingpackage, JvXPBarLaz,
  {$ELSE}
  ancestroweb_strings_delphi in 'ancestroweb_strings_delphi.pas',
  {$ENDIF}
  DefObjet in 'DefObjet.pas',
  u_ancestroweb in 'u_ancestroweb.pas';

{$IFDEF WIN32}
{$R *.res}
{$ENDIF}

var ls_BDDPathh : String;
exports
  InitTitreDll,
  InitStartDll,
  RetourDll;

begin
  ls_BDDPathh := 'C:\Matthieu\ANCESTROLOGIE.BDD';
  InitStartDll ( @ls_BDDPathh );
end.
