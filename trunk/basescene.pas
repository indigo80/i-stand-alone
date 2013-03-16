unit basescene;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, zglSpriteEngine;

type

  { TBaseScene }

  TBaseScene = class(TObject)
  public
    Running : Boolean;
    Freeze  : Boolean;
    SpriteEngine : zglCSEngine2D;
    procedure Init; virtual abstract;
    procedure Main; virtual abstract;
    procedure Draw; virtual abstract;
    procedure Dispose; virtual abstract;
    procedure KeyboardInput; virtual abstract;
    procedure MouseInput; virtual abstract;
    constructor Create;
    destructor Free;
  end;

implementation

{ TBaseScene }

destructor TBaseScene.Free;
begin
  SpriteEngine.Free;
  inherited Free;
end;

constructor TBaseScene.Create();
begin
  SpriteEngine := zglCSEngine2D.Create;
end;

end.

