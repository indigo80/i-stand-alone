unit scenemap;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sprite, zglSpriteEngine, basescene, zgl_keyboard, math, zgl_mouse;

type

  { TSceneMap }

  TSceneMap = class(TBaseScene)
    asprite, crosshair : TSprite;
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
  asprite := TSprite.Create(SpriteEngine, 0);
  crosshair := TSprite.Create(SpriteEngine, 0);
  asprite.LoadImage(GetAppDir + 'gfx\soldier.png');
  crosshair.LoadImage(GetAppDir + 'gfx\crosshair.png');
  asprite.W := 64;
  asprite.H := 64;
  crosshair.W := 36;
  crosshair.H := 36;
  Main;
end;

procedure TSceneMap.Main;
begin
  Freeze := False;
end;

procedure TSceneMap.Draw;
begin
 SpriteEngine.Draw;
end;

procedure TSceneMap.Dispose;
begin

end;

procedure TSceneMap.KeyboardInput;
begin
  if key_Down(K_UP) Then asprite.Y := asprite.Y - 5;
  if key_Down(K_DOWN) Then asprite.Y := asprite.Y + 5;
  if key_Down(K_LEFT) Then asprite.X := asprite.X - 5;
  if key_Down(K_RIGHT) Then asprite.X := asprite.X + 5;
  key_ClearState();
end;

procedure TSceneMap.MouseInput;
begin
  { Postavljanje ugla rotacije prema misu }
  asprite.Angle := arctan2(mouseY - asprite.Y - asprite.W / 2,
                           mouseX - asprite.X - asprite.H / 2) * 180 / pi + 90;
  crosshair.X := mouseX - crosshair.W / 2;
  crosshair.Y := mouseY - crosshair.H / 2;
end;

end.

