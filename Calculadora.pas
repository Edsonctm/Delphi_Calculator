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
    dotButton: TButton;
    zeroButton: TButton;
    equals: TButton;
    Divide: TButton;
    Multiplica: TButton;
    Subtrai: TButton;
    clearButton: TButton;
    sqreButton: TButton;
    Button19: TButton;
    edVisor: TEdit;
    procedure NumericButtonClick(Sender: TObject);
    procedure BasicOperatorButtonClick(Sender: TObject);
    function CheckOperatorButton(ButtonName: String): Integer;
    procedure Calculate;
    procedure equalsClick(Sender: TObject);
    procedure dotButtonClick(Sender: TObject);
    procedure clearButtonClick(Sender: TObject);
    procedure zeroButtonClick(Sender: TObject);
    procedure sqreButtonClick(Sender: TObject);
    procedure atribuiValor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ValorX: String;
  ValorY: String;
  Operador: Integer;
  LimparVisor: Boolean;

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
  if (edVisor.Text = '0') OR LimparVisor then
  begin
    edVisor.Text := '';
    LimparVisor := false;
  end;
  edVisor.Text := edVisor.Text + TButton(Sender).Caption;
end;

procedure TForm1.sqreButtonClick(Sender: TObject);
begin
  EdVisor.Text := FloatToStr(Sqrt(StrToFloat(EdVisor.Text)));
end;

procedure TForm1.zeroButtonClick(Sender: TObject);
begin
  if Edvisor.Text = '0' then
  Exit;

 Edvisor.Text := Edvisor.Text + '0';
end;

procedure TForm1.BasicOperatorButtonClick(Sender: TObject);
begin
  atribuiValor;

   case CheckOperatorButton(TButton(Sender).Name)  of
    0: Operador := ADICAO;
    1: Operador := SUBTRACAO;
    2: Operador := MULTIPLICACAO;
    3: Operador := DIVISAO;
  end;

  LimparVisor := true;
end;

Function TForm1.CheckOperatorButton(ButtonName: String):Integer;
begin
  result := AnsiIndexStr(ButtonName, ['Soma', 'Subtrai', 'Multiplica', 'Divide']);
end;

procedure TForm1.clearButtonClick(Sender: TObject);
begin
  ValorX := '';
  ValorY := '';
  EdVisor.Text := '0';
end;

procedure TForm1.dotButtonClick(Sender: TObject);
begin
  if Pos(',', edVisor.Text) <> 0 then
    Exit;

  edVisor.Text := edVisor.Text + ',';
end;

procedure TForm1.equalsClick(Sender: TObject);
begin
  atribuiValor;
end;

procedure TForm1.Calculate;
var
  x: Double;
  y: Double;
  result: String;
begin

  x := StrToFloat(ValorX);
  y := StrToFloat(Valory);


  case Operador of
    1: result := FloatToStr(x+y);
    2: result := FloatToStr(x-y);
    3: result := FloatToStr(x*y);
    4:
    begin
      if y = 0 then
        result := 'ERROR'
      else
        result := FloatToStr(x/y);
    end;
  end;

  edVisor.Text := result;

  ValorX := result;
  ValorY := '';
end;

//clicar várias vezes seguidas no operador; Trocar de operador; Percentual;

procedure TForm1.atribuiValor;
begin
  if ValorX = '' then
    ValorX := edVisor.Text
  else
  begin
    ValorY := edVisor.Text;
    Calculate;
  end;
end;
end.
