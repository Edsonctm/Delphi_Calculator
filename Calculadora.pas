unit Calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    edVisor: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
begin
  edVisor.Text := edVisor.Text + '1';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edVisor.Text := edVisor.Text + '2';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  edVisor.Text := edVisor.Text + '3';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  edVisor.Text := edVisor.Text + '4';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  edVisor.Text := edVisor.Text + '5';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  edVisor.Text := edVisor.Text + '6';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  edVisor.Text := edVisor.Text + '7';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  edVisor.Text := edVisor.Text + '8';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  edVisor.Text := edVisor.Text + '9';
end;

end.
