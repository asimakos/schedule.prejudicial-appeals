unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBGrids,
  DateTimePicker,LCLType,DBCtrls,dateutils,Unit3;

type

  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure ShowRecords;
    procedure LoadPromoters;
  private

  public

  end;

var
  Form6: TForm6;
  row_num:integer;

implementation

{$R *.lfm}

{ TForm6 }

procedure TForm6.Button1Click(Sender: TObject);
begin

if (DateTimePicker1.Date > DateTimePicker2.Date) then
begin
   Application.MessageBox('Παρακαλώ επιλέξτε σωστά τις ημερομηνίες!', 'Ενημέρωση',MB_ICONWARNING);
   exit;
end;

appeals.SQLQuery6.Close;
appeals.SQLQuery6.Params.ParamByName('start1').AsDate:=DateTimePicker1.Date;
appeals.SQLQuery6.Params.ParamByName('start2').AsDate:=DateTimePicker2.Date;

appeals.DBConnection.Connected:=True;
appeals.SQLTransaction1.Active:=True;
appeals.SQLQuery6.Open;

appeals.DataSource1.DataSet:=appeals.SQLQuery6;
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

if (appeals.SQLQuery6.RecordCount=0) then
   Application.MessageBox('Δεν βρέθηκαν εγγραφές!', 'Ενημέρωση',MB_ICONWARNING);

end;

procedure TForm6.Button2Click(Sender: TObject);
var
  prom_code:integer;
begin

prom_code:=DBLookupComboBox1.KeyValue;
appeals.SQLTransaction1.Active:=false;
try
appeals.SQLQuery1.SQL.Text:='UPDATE appeals set date_court=:court,date_judgement=:judgement,promoter_id=:code where id='+IntToStr(row_num);

appeals.SQLQuery1.Params.ParamByName('court').AsDate:=DateTimePicker3.Date;
appeals.SQLQuery1.Params.ParamByName('judgement').AsDate:=IncDay(DateTimePicker3.Date,20);
appeals.SQLQuery1.Params.ParamByName('code').AsInteger:=prom_code;

appeals.SQLTransaction1.StartTransaction;
appeals.SQLQuery1.ExecSQL;
appeals.SQLTransaction1.Commit;

ShowRecords;
LoadPromoters;
Application.MessageBox('Η εγγραφή ενημερώθηκε με επιτυχία!', 'Ενημέρωση', MB_ICONINFORMATION);
except
    begin
    showMessage('Παρουσιάστηκε πρόβλημα στην ενημέρωση εγγραφής!');
    appeals.SQLTransaction1.Rollback;
    end;
  end;
  appeals.SQLTransaction1.Active:=True;

end;

procedure TForm6.Button3Click(Sender: TObject);
begin
 if MessageDlg('Επιβεβαίωση', 'Επιθυμείτε να διαγράψετε αυτή την εγγραφή ?', mtConfirmation,[mbYes, mbNo],0) = mrYes then
       begin
 appeals.SQLTransaction1.Active:=false;
      try
 appeals.SQLQuery1.SQL.Text:='DELETE FROM appeals where id='+IntToStr(row_num);
 appeals.SQLTransaction1.StartTransaction;
 appeals.SQLQuery1.ExecSQL;
 appeals.SQLTransaction1.Commit;

 ShowRecords;
 LoadPromoters;
 Application.MessageBox('Η εγγραφή διαγράφτηκε με επιτυχία!', 'Ενημέρωση', MB_ICONINFORMATION);
  except
      begin
    showMessage('Παρουσιάστηκε πρόβλημα στην διαγραφή εγγραφής!');
    appeals.SQLTransaction1.Rollback;
      end;
     end;
  appeals.SQLTransaction1.Active:=True;
       end
 else
   exit;

end;

procedure TForm6.DBGrid1CellClick(Column: TColumn);
begin

 row_num:=DBGrid1.DataSource.DataSet.FieldByName('id').Value;
 DateTimePicker3.Date:=DBGrid1.DataSource.DataSet.FieldByName('date_court').AsDateTime;
 DBLookupComboBox1.ItemIndex:=DBGrid1.DataSource.DataSet.FieldByName('promoter_id').Value-1;

end;

procedure TForm6.FormShow(Sender: TObject);
begin
 ShowRecords;
 LoadPromoters;
end;

procedure TForm6.ShowRecords;
begin

appeals.SQLQuery7.Close;
appeals.DBConnection.Connected:=True;
appeals.SQLTransaction1.Active:=True;

appeals.SQLQuery7.Open;

appeals.DataSource1.DataSet:=appeals.SQLQuery7;
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

procedure TForm6.LoadPromoters;
begin

appeals.SQLQuery4.Close;
appeals.SQLQuery4.SQL.Text:='select id,fullname from promoter';

appeals.SQLQuery4.Open;
appeals.DataSource2.DataSet:=appeals.SQLQuery4;
DBLookupComboBox1.ListSource:=appeals.DataSource2;
DBLookupComboBox1.ScrollListDataset:=True;
DBLookupComboBox1.Style:=csDropDownList;
DBLookupComboBox1.KeyField:='id';
DBLookupComboBox1.DataField:='id';
DBLookupComboBox1.ListField:='fullname';

end;

end.

