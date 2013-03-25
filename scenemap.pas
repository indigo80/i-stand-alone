unit scenemap;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sprite, zglSpriteEngine, basescene, zgl_keyboard, math, zgl_mouse, player;

type

  { TSceneMap }

  TSceneMap = class(TBaseScene)
    asprite, crosshair : TSprite;
    player:TPlayer;
  public
    procedure Init; override;
    procedure Main; override;
    procedure Draw; override;
    procedure Dispose; override;
    procedure KeyboardInput; override;
    procedure MouseInput; override;
  end;

implementation

uses
  engine;

{ TSceneMap }

procedure TSceneMap.Init;
begin
  player:= TPlayer.Create(SpriteEngine, 0);
  Main;
end;

procedure TSceneMap.Main;
begin
  Freeze := False;

end;

procedure TSceneMap.Draw;
begin
  Player.Update;
 SpriteEngine.Draw;

end;

procedure TSceneMap.Dispose;
begin

end;

procedure TSceneMap.KeyboardInput;
begin
  if key_Down(K_UP) Then player.MoveForward();
  if key_Down(K_DOWN) Then player.MoveBackwards();
  if key_Down(K_LEFT) Then player.MoveLeft();
  if key_Down(K_RIGHT) Then player.MoveRight();
  key_ClearState();
end;

procedure TSceneMap.MouseInput;
begin
  player.SetAngle(mouseX, mouseY);
  if mouseDown[0] then player.Fire;
  mouse_ClearState;
end;

end.

