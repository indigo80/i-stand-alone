unit ourTypes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TList<_T> genericka lista za inventory}

  generic TList<_T>=class(TObject)

  public
    health:Integer;
    currentSeapon: TWeapon;

    constructor Create( _Manager : zglCSEngine2D; _ID : Integer );
  end;

implementation

end.

