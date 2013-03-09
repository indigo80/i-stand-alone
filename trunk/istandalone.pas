program istandalone;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp, engine
  { you can add units after this };

type

  { TISA }

  TISA = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

{ TISA }

procedure TISA.DoRun;
var
  Engine : TEngine;
begin

  { Initialize and Create Engine application }
  Engine := TEngine.CreateEngine;
  Terminate;
end;

constructor TISA.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException := True;
end;

destructor TISA.Destroy;
begin
  inherited Destroy;
end;

var
  Application: TISA;
begin
  Application := TISA.Create(nil);
  Application.Title := 'ISA';
  Application.Run;
  Application.Free;
end.

