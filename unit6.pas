unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, ExtCtrls,
  StdCtrls, Unit3, DB;

type

  { TForm5 }

  TForm5 = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure showgrid;
  private

  public

  end;

var
  Form5: TForm5;

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.FormShow(Sender: TObject);
begin

showgrid;

end;

procedure TForm5.showgrid;
begin

 appeals.SQLQuery5.Close;

 appeals.DBConnection.Connected:=True;
 appeals.SQLTransaction1.Active:=True;
 appeals.SQLQuery5.Open;

 appeals.DataSource1.DataSet:=appeals.SQLQuery5;
 DBGrid1.DataSource:=appeals.DataSource1;

 DBGrid1.Columns.Items[1].Width:=120;
 DBGrid1.Columns.Items[7].Width:=180;
 DBGrid1.Columns.Items[0].Visible:=false;
 DBGrid1.Columns.Items[6].Visible:=false;
 DBGrid1.Columns.Items[1].Title.Caption:='Όνομα';
 DBGrid1.Columns.Items[2].Title.Caption:='Ημερομηνία  καταχώρησης';
 DBGrid1.Columns.Items[3].Title.Caption:='Ημερομηνία  αναστολής';
 DBGrid1.Columns.Items[4].Title.Caption:='Ημερομηνία  εξέτασης';
 DBGrid1.Columns.Items[5].Title.Caption:='Ημερομηνία  απόφασης';
 DBGrid1.Columns.Items[7].Title.Caption:='Εισηγητής';

end;


end.

