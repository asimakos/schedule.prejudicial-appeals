unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, db;

type

  { Tappeals }

  Tappeals = class(TDataModule)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBConnection: TIBConnection;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    SQLQuery4: TSQLQuery;
    SQLQuery5: TSQLQuery;
    SQLQuery5DATE_COURT: TDateField;
    SQLQuery5DATE_ENTRY: TDateField;
    SQLQuery5DATE_JUDGEMENT: TDateField;
    SQLQuery5DATE_SUSPENDED: TDateField;
    SQLQuery5ID: TLongintField;
    SQLQuery5NAME: TStringField;
    SQLQuery5PROMOTER_ID: TLongintField;
    SQLQuery6: TSQLQuery;
    SQLQuery6DATE_COURT: TDateField;
    SQLQuery6DATE_ENTRY: TDateField;
    SQLQuery6DATE_JUDGEMENT: TDateField;
    SQLQuery6DATE_SUSPENDED: TDateField;
    SQLQuery6ID: TLongintField;
    SQLQuery6NAME: TStringField;
    SQLQuery6PROMOTER_ID: TLongintField;
    SQLQuery7: TSQLQuery;
    SQLQuery7DATE_COURT: TDateField;
    SQLQuery7DATE_ENTRY: TDateField;
    SQLQuery7DATE_JUDGEMENT: TDateField;
    SQLQuery7DATE_SUSPENDED: TDateField;
    SQLQuery7ID: TLongintField;
    SQLQuery7NAME: TStringField;
    SQLQuery7PROMOTER_ID: TLongintField;
    SQLQuery8: TSQLQuery;
    SQLQuery9: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    SQLTransaction2: TSQLTransaction;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
  private

  public

  end;

var
  appeals: Tappeals;

implementation

{$R *.lfm}

end.

