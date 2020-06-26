unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DateTimePicker,Unit3,dateutils;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);

  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin

  appeals.SQLTransaction1.Active:=false;

  try
  appeals.SQLQuery1.SQL.Text:='INSERT INTO appeals (name, date_entry, date_suspended)'+
  'VALUES (:name, :entry, :suspended)';

  appeals.SQLQuery1.Params.ParamByName('name').AsString:=Trim(Edit1.Text);
  appeals.SQLQuery1.Params.ParamByName('entry').AsDate:=DateTimePicker1.Date;
  appeals.SQLQuery1.Params.ParamByName('suspended').AsDate:=IncDay(DateTimePicker1.Date,10);

  appeals.SQLTransaction1.StartTransaction;
  appeals.SQLQuery1.ExecSQL;
  appeals.SQLTransaction1.Commit;
  ShowMessage('Η εγγραφή αποθηκεύτηκε με επιτυχία!');
  except
    begin
    showMessage('Παρουσιάστηκε πρόβλημα στην εισαγωγή εγγραφής!');
    appeals.SQLTransaction1.Rollback;
    end;
  end;

  appeals.SQLTransaction1.Active:=True;

end;


end.

