{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit LazGDIPlus;

interface

uses
  GdiPlus, GdiPlusHelpers, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('LazGDIPlus', @Register);
end.
