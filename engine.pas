unit engine;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  zgl_main,
  zgl_window,
  zgl_screen,
  zgl_camera_2d,
  zgl_keyboard,
  zgl_mouse,
  zgl_timers,
  zgl_render_target,
  zgl_sprite_2d,
  zgl_textures,
  zgl_primitives_2d,
  zgl_utils,
  zgl_types,
  IniFiles,
  sprite,
  math;

const
  APP_NAME = 'I Stand Alone [alpha 0.0.1]';

  { TEngine class }

  type
      TEngine = class(TObject)
      private
        _DirApp : string;
        _DirHome : string;
        function _GetFPS : string;
      public
        constructor CreateEngine;
        destructor FreeEngine;
        property FPS : string read _GetFPS;
        property AppDir : string read _DirApp;
        property HomeDir : string read _DirHome;
      end;

implementation

var
  asprite : TSprite;
  crosshair : TSprite;
  //camMain : zglTCamera2D;

procedure TEngineDraw;
begin
  asprite.Draw;
  crosshair.Draw;
end;

procedure TEngineInit;
begin
  asprite.LoadImage('soldier.png');
  crosshair.LoadImage('crosshair.png');
end;

procedure TEngineUpdate(dt : Double);
begin
   wnd_SetCaption(APP_NAME + ' FPS:' + u_IntToStr(zgl_Get(RENDER_FPS)));
end;

procedure TEngineQuit;
begin

end;

procedure TEngineTimer;
begin
end;

procedure TEngineKeyboard;
begin
  if key_Down(K_UP) Then asprite.Y := asprite.Y - 5;
  if key_Down(K_DOWN) Then asprite.Y := asprite.Y + 5;
  if key_Down(K_LEFT) Then asprite.X := asprite.X - 5;
  if key_Down(K_RIGHT) Then asprite.X := asprite.X + 5;
  key_ClearState();
end;

procedure TEngineMouse;
begin
  { Postavljanje ugla rotacije prema misu }
  asprite.Angle := arctan2(mouseY - asprite.Y - asprite.Width div 2,
                           mouseX - asprite.X - asprite.Height div 2) * 180 / pi + 90;
  crosshair.X := mouseX - crosshair.Width div 2;
  crosshair.Y := mouseY - crosshair.Height div 2;
end;

function TEngine._GetFPS: string;
begin
  Result := u_IntToStr(zgl_Get(RENDER_FPS));
end;

constructor TEngine.CreateEngine;
var
  IniFile : TIniFile;
  width, height : Integer;
  fullscreen, vsync : Boolean;
begin
  _DirApp  := utf8_Copy(PAnsiChar(zgl_Get(DIRECTORY_APPLICATION)));
  _DirHome := utf8_Copy(PAnsiChar(zgl_Get(DIRECTORY_HOME)));

  timer_Add(@TEngineTimer, 50);
  timer_Add(@TEngineKeyboard, 10);
  timer_Add(@TEngineMouse, 10);

  zgl_Reg(SYS_LOAD, @TEngineInit);
  zgl_Reg(SYS_DRAW, @TEngineDraw);
  zgl_Reg(SYS_UPDATE, @TEngineUpdate);
  zgl_Reg(SYS_EXIT, @TEngineQuit);

  wnd_SetCaption(APP_NAME);
  wnd_ShowCursor(FALSE);

  // Initialize variables
  width := 800;
  height := 600;
  fullscreen := False;
  vsync := False;

  IniFile := TIniFile.Create(_DirApp + DirectorySeparator + 'config.ini');
  try
    width := IniFile.ReadInteger('Main', 'width', 800);
    height := IniFile.ReadInteger('Main', 'height', 600);
    fullscreen := IniFile.ReadBool('Main', 'fullscreen', False);
    vsync := IniFile.ReadBool('Main', 'vsync', False);
  finally
    IniFile.Free;
  end;

  // Set Options
  scr_SetOptions(width, height, REFRESH_MAXIMUM, fullscreen, vsync);

  // Test
  asprite := TSprite.Create(_DirApp + 'gfx');
  crosshair := TSprite.Create(_DirApp + 'gfx');
  crosshair.Width := 36;
  crosshair.Height := 36;

  zgl_Init();
end;

destructor TEngine.FreeEngine;
begin
  inherited Destroy;
end;



end.

