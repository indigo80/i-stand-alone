unit player;

{$mode objfpc}{$H+}

interface

uses
 Classes,
 SysUtils,
 math,
 zgl_main,
 zgl_utils,
 zglSpriteEngine,
 sprite,
 basescene,
 weapon;

type

  { TPlayer }

  TPlayer = class
  private
    function Collision : Boolean;

  public
    sprite, crosshair, healthBar: TSprite;
    health:Single;
    weight: Single;
    speed: Single;
    stamina: Single;
    inventory : TList;
    currentWeapon: TWeapon;

    constructor Create( _Manager : zglCSEngine2D; _ID : Integer );

    procedure MoveForward();
    procedure MoveBackwards();
    procedure MoveLeft();
    procedure MoveRight();
    procedure Fire();
    procedure SetAngle(mouseX: Integer; mouseY:Integer);
    procedure SetCrosshair();
    procedure Use();
  end;

implementation

constructor TPlayer.Create(_Manager: zglCSEngine2D; _ID: Integer);
begin
  sprite := TSprite.Create(_Manager, 0);
  crosshair := TSprite.Create(_Manager, 0);
  sprite.LoadImage(utf8_Copy(PAnsiChar(zgl_Get(DIRECTORY_APPLICATION))) + 'gfx\soldier.png');
  crosshair.LoadImage( utf8_Copy(PAnsiChar(zgl_Get(DIRECTORY_APPLICATION))) + 'gfx\crosshair.png');
  sprite.W := 64;
  sprite.H := 64;
  crosshair.W := 36;
  crosshair.H := 36;
  health:=100;
  weight:=100;
  speed:=3;
  inventory:=TList.Create;
end;

procedure TPlayer.MoveForward;
begin
      sprite.X := sprite.X + speed*cos((sprite.Angle-90)*pi/180);
      sprite.Y := sprite.Y + speed*sin((sprite.Angle-90)*pi/180);
end;

procedure TPlayer.MoveBackwards;
begin
     sprite.X := sprite.X - speed*cos((sprite.Angle-90)*pi/180);
     sprite.Y := sprite.Y - speed*sin((sprite.Angle-90)*pi/180);
end;

procedure TPlayer.MoveLeft;
begin
     sprite.X := sprite.X - speed*cos((sprite.Angle)*pi/180);
     sprite.Y := sprite.Y - speed*sin((sprite.Angle)*pi/180);
end;

procedure TPlayer.MoveRight;
begin
     sprite.X := sprite.X - speed*cos((sprite.Angle-180)*pi/180);
     sprite.Y := sprite.Y - speed*sin((sprite.Angle-180)*pi/180);
end;

procedure TPlayer.Fire;
begin
     currentWeapon.Fire(sprite.Angle);
end;

procedure TPlayer.SetAngle(mouseX: Integer; mouseY: Integer);
begin
    { Postavljanje ugla rotacije prema misu }
   sprite.Angle := arctan2(mouseY - sprite.Y - sprite.W / 2,
                           mouseX - sprite.X - sprite.H / 2)
                           * 180 / pi
                           + 90;
end;

procedure TPlayer.SetCrosshair;
begin
  crosshair.X := sprite.X + sprite.H / 2 + 100*cos((sprite.Angle-90)*pi/180) - crosshair.W / 2;
  crosshair.Y := sprite.Y + sprite.W / 2 + 100*sin((sprite.Angle-90)*pi/180) - crosshair.W / 2;
end;

function TPlayer.Collision: Boolean;
begin

end;

procedure TPlayer.Use;
begin

end;


end.

