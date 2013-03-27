unit shot;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, zgl_math_2d;
type

 { TShot }

 TShot = class
 private
 public
   position: zglTPoint2D;
   constructor Create;
 end;
implementation

{ TShot }

constructor TShot.Create;
begin
  position.X:=100;
  position.Y:=200;
end;

end.

