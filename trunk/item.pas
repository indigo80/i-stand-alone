unit item;

{$mode objfpc}{$H+}

interface

type
  { TItem }

  TItem = class abstract
  private
  protected
    procedure Use(); virtual; abstract;
  public
    inventoryId :Integer;
    weight: Single;
  end;




implementation
{ TItem }

end.



