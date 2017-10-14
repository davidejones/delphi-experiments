unit Unit2;

interface

uses
{$IFDEF WIn32}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;
{$ENDIF}

{$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls,
  QExtCtrls, QComCtrls, QButtons, Types, QTypes,
  Variants,IdIPWatch, IdAntiFreezeBase, IdAntiFreeze,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdTCPServer,
  QMenus, QT;
{$ENDIF}

type
  TForm2 = class(TForm)
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
