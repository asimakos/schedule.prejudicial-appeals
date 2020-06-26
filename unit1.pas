unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus,Unit2,Unit4,Unit5,Unit6,Unit7,Unit9,Unit10,Unit11;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  Form7.RLReport1.Preview;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  Form8.RLReport1.Preview;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  Form9.RLReport1.Preview;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Form4.Show;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  Form5.Show;
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  Form6.Show;
end;

end.

