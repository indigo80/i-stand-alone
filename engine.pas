unit engine;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  zgl_main,
  zgl_window,
  zgl_screen,
  zgl_timers,
  zgl_render_target,
  zgl_sprite_2d,
  zgl_textures,
  zgl_utils,
  zgl_types,
  IniFiles;

const
  APP_NAME = 'I Stand Alone alpha 0.0.1';

type
  TProcCall = procedure;

type
  TUpdateCall = procedure( dt : Double );

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

procedure TEngineDraw;
begin

end;

procedure TEngineInit;
begin

end;

procedure TEngineUpdate(dt : Double);
begin

end;

procedure TEngineQuit;
begin

end;

function TEngine._GetFPS: string;
begin
  Result := u_IntToStr(zgl_Get(RENDER_FPS));
end;

constructor TEngine.CreateEngine;
var
  IniFile : TIniFile;
  width, height : Integer;
  fullscreen : Boolean;
  vsync : Boolean;
begin
  _DirApp  := utf8_Copy(PAnsiChar(zgl_Get(DIRECTORY_APPLICATION)));
  _DirHome := utf8_Copy(PAnsiChar(zgl_Get(DIRECTORY_HOME)));

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

  zgl_Init();
end;

destructor TEngine.FreeEngine;
begin
  zgl_Destroy();
  Self.Free;
end;



end.
