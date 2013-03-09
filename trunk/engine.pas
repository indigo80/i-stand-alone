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
  //camMain : zglTCamera2D;

procedure TEngineDraw;
begin
  pr2d_Rect( 0, 0, 22, 22, $FFFFFF, 510, PR2D_FILL );
  //cam2d_Set(@camMain);
  //tex := tex_LoadFromFile('gfx' + DirectorySeparator + 'ball.png', $FF000000, TEX_DEFAULT_2D);
  //ssprite2d_Draw(tex, 40, 40, 200, 200, 0, 255);

  ssprite2d_Draw(asprite.texture, asprite.X, asprite.Y, asprite.Width, asprite.Height, asprite.Angle, asprite.Alpha);
  //asprite2d_Draw(asprite.texture, 0, 0, 128, 128, 0, 1);
end;

procedure TEngineInit;
begin
  //cam2d_Init(camMain);
  asprite.LoadImage('ball.png');
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
  if key_Down(K_UP) Then asprite.Y := asprite.Y - 10;
  if key_Down(K_DOWN) Then asprite.Y := asprite.Y + 10;
  if key_Down(K_LEFT) Then asprite.X := asprite.X - 10;
  if key_Down(K_RIGHT) Then asprite.X := asprite.X + 10;
  key_ClearState();
end;

procedure TEngineMouse;
begin
  { Postavljanje ugla rotacije prema misu }
  asprite.Angle := arctan2(mouseY - asprite.Y - asprite.Width div 2,
                           mouseX - asprite.X - asprite.Height div 2) * 180 / pi + 90;
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
  wnd_ShowCursor(TRUE);

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



  zgl_Init();
end;

destructor TEngine.FreeEngine;
begin
  inherited Destroy;
end;



end.

