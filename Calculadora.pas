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
    percentButton: TButton;
    edVisor: TEdit;
    BackSpace: TButton;
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
    procedure BackSpaceClick(Sender: TObject);
    procedure percentButtonClick(Sender: TObject);
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
  NovoValor: Boolean;
  StatusError: Boolean;

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
  if StatusError then
    exit;

  NovoValor := true;
  if (edVisor.Text = '0') OR LimparVisor then
  begin
    edVisor.Text := '';
    LimparVisor := false;
  end;
  edVisor.Text := edVisor.Text + TButton(Sender).Caption;
end;

procedure TForm1.percentButtonClick(Sender: TObject);
var
  x, y: Double;
  result: String;
begin
  if StatusError then
    exit;

  atribuiValor;
  if ValorY = '' then
    Exit;

  x := StrToFloat(ValorX);
  y := StrToFloat(Valory);

  case Operador of
    1: result := FloatToStr(x + x * y / 100);
    2: result := FloatToStr(x - x * y / 100);
    3: result := FloatToStr(x * y / 100);
    4:
    begin
      if y = 0 then
        result := 'ERROR'
      else
        result := FloatToStr(x / (y / 100));
    end;
    else result := edVisor.Text;
  end;

  edVisor.Text := result;

  ValorX := result;
  ValorY := '';
  LimparVisor := true;
  NovoValor := false;
end;

procedure TForm1.sqreButtonClick(Sender: TObject);
begin
  if StatusError then
    exit;

  EdVisor.Text := FloatToStr(Sqrt(StrToFloat(EdVisor.Text)));
  ValorX := EdVisor.Text;
end;

procedure TForm1.zeroButtonClick(Sender: TObject);
begin
  if StatusError then
    exit;

  NovoValor := True;
  if Edvisor.Text = '0' then
  Exit;

  if LimparVisor then
  begin
    edVisor.Text := '';
    LimparVisor := false;
  end;
  Edvisor.Text := Edvisor.Text + '0';
end;

procedure TForm1.BackSpaceClick(Sender: TObject);
var
  oldValue: String;
begin
  if StatusError then
    exit;

  if Length(edVisor.Text) = 1 then
  begin
    edVisor.Text := '0';
    exit;
  end;
  oldValue := edVisor.Text;
  Delete(oldValue, Length(oldValue), 1);
  edVisor.Text := oldValue;
  if ValorX <> '' then
    ValorX := edVisor.Text;

end;

procedure TForm1.BasicOperatorButtonClick(Sender: TObject);
begin
  if StatusError then
    exit;

  atribuiValor;
  if not(ValorY = '') then
    Calculate;


   case CheckOperatorButton(TButton(Sender).Name)  of
    0: Operador := ADICAO;
    1: Operador := SUBTRACAO;
    2: Operador := MULTIPLICACAO;
    3: Operador := DIVISAO;
    else Operador := -1;
  end;

  LimparVisor := true;
  NovoValor := false;
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
  Operador := -1;
  StatusError := false;
end;

procedure TForm1.dotButtonClick(Sender: TObject);
begin
  if StatusError then
    exit;

  if (Pos(',', edVisor.Text) <> 0) and not LimparVisor then
    Exit;

  if limparvisor then edVisor.Text := '0';

  edVisor.Text := edVisor.Text + ',';
  NovoValor := false;
  limparvisor := false;
end;

procedure TForm1.equalsClick(Sender: TObject);
begin
  if StatusError then
    exit;

  atribuiValor;
  NovoValor := false;
  if ValorY = '' then
    Exit;
  Calculate;
end;

procedure TForm1.Calculate;
var
  x, y: Double;
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
      begin
         result := 'ERROR';
         StatusError := true;
      end
      else
        result := FloatToStr(x/y);
    end;
    else result := edVisor.Text;
  end;

  edVisor.Text := result;

  ValorX := result;
  ValorY := '';
end;

procedure TForm1.atribuiValor;
begin
  if ValorX = '' then
    ValorX := edVisor.Text
  else if NovoValor then
  begin
    ValorY := edVisor.Text;
  end;
end;
end.
