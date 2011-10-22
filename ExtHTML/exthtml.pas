{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ExtHTML; 

interface

uses
    functions_html, functions_html_tree, unite_html_resources, 
  LazarusPackageIntf;

implementation

procedure Register; 
begin
end; 

initialization
  RegisterPackage('ExtHTML', @Register); 
end.
