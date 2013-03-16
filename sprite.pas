unit sprite;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  zgl_textures,
  zgl_render_target,
  zgl_textures_png,
  zgl_textures_jpg,
  zgl_sprite_2d;

type

  { TSprite }

  TSprite = class(TObject)
  private
    _Width : Integer;
    _Height : Integer;
    _X : Integer;
    _Y : Integer;
    _Z : Integer;
    _Angle : Single;
    _Alpha : Byte;
    _Visible : Boolean;
    _tex : zglPTexture;
    _gfxDir : string;
    procedure SetAngle(AValue: Single);
    procedure _SetWidth(Value : Integer);
    procedure _SetHeight(Value : Integer);
    procedure _SetX(Value : Integer);
    procedure _SetY(Value : Integer);
    procedure _SetZ(Value : Integer);
    procedure _SetAlpha(Value : Byte);
    procedure _SetVisible(Value : Boolean);
    procedure _SetAngle(Value : Single);
  public
    constructor Create(const gfxDir : string);
    destructor Free;
    procedure LoadImage(filename : string);
    procedure Update;
    procedure Draw;
    procedure SetAnimationRect(Rect : TRect; PerLine : Integer);
    property Width : Integer read _Width write _SetWidth;
    property Height : Integer read _Height write _SetHeight;
    property X : Integer read _X write _SetX;
    property Y : Integer read _Y write _SetY;
    property Z : Integer read _Z write _SetZ;
    property Alpha : Byte read _Alpha write _SetAlpha;
    property Visible : Boolean read _Visible write _SetVisible;
    property texture : zglPTexture read _tex;
    property Angle : Single read _Angle write SetAngle;
  end;

implementation

{ TSprite }

procedure TSprite._SetWidth(Value: Integer);
begin
  if Value > 0 then _Width := Value;
end;

procedure TSprite.SetAngle(AValue: Single);
begin
  _Angle := AValue;
end;

procedure TSprite._SetHeight(Value: Integer);
begin
  if Value > 0 then _Height := Value;
end;

procedure TSprite._SetX(Value: Integer);
begin
  _X := Value;
end;

procedure TSprite._SetY(Value: Integer);
begin
  _Y := Value;
end;

procedure TSprite._SetZ(Value: Integer);
begin

end;

procedure TSprite._SetAlpha(Value: Byte);
begin
  _Alpha := Value;
end;

procedure TSprite._SetVisible(Value: Boolean);
begin

end;

procedure TSprite._SetAngle(Value: Single);
begin
  _Angle := Value;
end;

constructor TSprite.Create(const gfxDir: string);
begin
  _gfxDir := gfxDir;
  _Width := 64;
  _Height := 64;
  _X := 40;
  _Y := 40;
  _Alpha := 255;
  _Angle := 0;
end;

destructor TSprite.Free;
begin

end;

procedure TSprite.LoadImage(filename: string);
begin
 WriteLn('Citam: '  + _gfxDir + DirectorySeparator + filename);
 if not FileExists(_gfxDir + DirectorySeparator + filename) then
   WriteLn('[Greska!] - Grafika ''' + filename + ''' ne postoji!')
 else
   _tex := tex_LoadFromFile(_gfxDir + DirectorySeparator + filename, $FF000000, TEX_DEFAULT_2D);
end;

procedure TSprite.Update;
begin

end;

procedure TSprite.Draw;
begin
     ssprite2d_Draw(_tex, _X, _Y, _Width, _Height, _Angle, _Alpha);
end;

procedure TSprite.SetAnimationRect(Rect: TRect; PerLine: Integer);
begin

end;

end.

