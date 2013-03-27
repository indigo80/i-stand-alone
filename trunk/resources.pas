unit resources;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, zglSpriteEngine, zgl_textures, zgl_utils, zgl_main;
type

  { TResources-u ovoj klasi ucitavamo sve iz fajlova na pocetku }

  TResources= class
  public
    class var playerTexture, crosshairTexture, healthBar, bulletTexture:zglPTexture;
    constructor Create();
   end;


implementation

{ TResources }
var
  plyee:zglPTexture;
constructor TResources.Create();
begin
  playerTexture:= tex_LoadFromFile(utf8_Copy(PAnsiChar(zgl_Get(DIRECTORY_APPLICATION))) + 'gfx\soldier.png', $FF000000, TEX_DEFAULT_2D);
  crosshairTexture:=tex_LoadFromFile( utf8_Copy(PAnsiChar(zgl_Get(DIRECTORY_APPLICATION))) + 'gfx\crosshair.png', $FF000000, TEX_DEFAULT_2D);
  bulletTexture:=tex_LoadFromFile(utf8_Copy(PAnsiChar(zgl_Get(DIRECTORY_APPLICATION))) + 'gfx\bullet.png', $FF000000, TEX_DEFAULT_2D);
end;

end.

