unit Unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, db;

type

  { Treport }

  Treport = class(TDataModule)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ReportConnection: TIBConnection;
    SQLQuery1: TSQLQuery;
    SQLQuery1FULLNAME: TStringField;
    SQLQuery1PERIOD: TStringField;
    SQLQuery1TOTAL: TLargeintField;
    SQLQuery2: TSQLQuery;
    SQLQuery2FULLNAME: TStringField;
    SQLQuery2PERIOD: TSmallintField;
    SQLQuery2TOTAL: TLargeintField;
    SQLQuery3: TSQLQuery;
    SQLQuery3FULLNAME: TStringField;
    SQLQuery3TOTAL: TLargeintField;
    SQLTransaction1: TSQLTransaction;
  private

  public

  end;

var
  report: Treport;

implementation

{$R *.lfm}

end.

