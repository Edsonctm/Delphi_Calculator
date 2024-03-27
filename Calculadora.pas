unit Calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, StrUtils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Soma: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Divide: TButton;
    Multiplica: TButton;
    Subtrai: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    edVisor: TEdit;
    procedure NumericButtonClick(Sender: TObject);
    procedure BasicOperatorButtonClick(Sender: TObject);
    function CheckOperatorButton(ButtonName: String): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ValorX: Double;
  ValorY: Double;
  Operador: Integer;

const
  ADICAO = 1;
  SUBTRACAO = 2;
  MULTIPLICACAO = 3;
  DIVISAO = 4;
  RAIZ = 5;
  PORCENTO = 6;

implementation

{$R *.dfm}


procedure TForm1.NumericButtonClick(Sender: TObject);
begin
  if Operador > 0 then
  begin
    Operador := 0;
    edVisor.Text := ''
  end;
  edVisor.Text := edVisor.Text + TButton(Sender).Caption;
end;

procedure TForm1.BasicOperatorButtonClick(Sender: TObject);
begin
  ValorX := StrToFloat(edVisor.Text);

  case CheckOperatorButton(TButton(Sender).Name)  of
    0: Operador := ADICAO;
    1: Operador := SUBTRACAO;
    2: Operador := MULTIPLICACAO;
    3: Operador := DIVISAO;
    else ShowMessage('Invalid Operator');
  end;

end;

Function TForm1.CheckOperatorButton(ButtonName: String):Integer;
begin
  result := AnsiIndexStr(ButtonName, ['Soma', 'Subtrai', 'Multiplica', 'Divide']);
end;

end.
