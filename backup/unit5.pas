unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, CalendarLite,Unit3;

type

  { TForm4 }

  TForm4 = class(TForm)
    CalendarLite1: TCalendarLite;
    procedure CalendarLite1GetHolidays(Sender: TObject; AMonth, AYear: Integer;var Holidays: THolidays);
    procedure CalendarLite1Hint(Sender: TObject; AYear, AMonth, ADay: Word;var AText: String);
    procedure FormShow(Sender: TObject);

  private

  public

  end;

var
  Form4: TForm4;

implementation

{$R *.lfm}

{ TForm4 }



procedure TForm4.CalendarLite1GetHolidays(Sender: TObject; AMonth,
  AYear: Integer; var Holidays: THolidays);
var
  d, m, y: Word;
  e: TDate;
begin
  ClearHolidays(Holidays);
    appeals.SQLQuery8.Close;
    appeals.SQLQuery8.SQL.Text:='select date_court from appeals where date_court IS NOT NULL';

    appeals.DBConnection.Connected:=True;
    appeals.SQLTransaction2.Active:=True;
    appeals.SQLQuery8.Open;

  while not appeals.SQLQuery8.EOF do
    begin
     e:=appeals.SQLQuery8.FieldByName('date_court').AsDateTime;
     DecodeDate(e,y,m,d);
     if m = AMonth then
     begin
      AddHoliday(d, Holidays);
     end;
     appeals.SQLQuery8.Next;
    end;

end;

procedure TForm4.CalendarLite1Hint(Sender: TObject; AYear, AMonth, ADay: Word;
  var AText: String);
var
  d, m, y: Word;
  e: TDate;
begin
  appeals.SQLQuery9.Close;
    appeals.SQLQuery9.SQL.Text:='select date_court,name from appeals where date_court IS NOT NULL';

    appeals.DBConnection.Connected:=True;
    appeals.SQLTransaction2.Active:=True;
    appeals.SQLQuery9.Open;

  while not appeals.SQLQuery9.EOF do
    begin
     e:=appeals.SQLQuery9.FieldByName('date_court').AsDateTime;
     DecodeDate(e,y,m,d);
     if (m = AMonth) and (d=ADay) then
     begin
      AText:=AText+appeals.SQLQuery9.FieldByName('name').AsString+LineEnding;
     end;
     appeals.SQLQuery9.Next;
    end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  CalendarLite1.Date:=Now();
end;



end.

