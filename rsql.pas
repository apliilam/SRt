unit rSQL;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ExtCtrls, Forms, windows, StdCtrls,
  EditBtn, SQLite3, SQLiteTable3, dateutils, Dialogs, Variants;

procedure CreateDataBase;
function dbGetValueFromValue(dbnameTable, dbTableColumnIN, dbTableColumnOUT, dbvalue: string):string;
function dbUpdateValue(dbnameTable, dbTableColumnWHERE, dbvalueWHERE, dbTableColumnSET, dbvalueSET: string):boolean;
procedure dbUpdOptions(option, Value: string);
procedure dbUpdFormFields(form, field, Value: string);
procedure dbLoadSignature(dbnameTable, dbForm, dbFormValue, dbGetSignature: string; Img: TImage);
procedure dbGetDate(dbnameTable, dbForm, dbFormValue, dbGetDate: string; aDate: TDateEdit);
function dbGetOptions(dbValue: string): string;
function dbGetFormFields(form, field: string): string;
procedure dbUpdPerson(field1, Value1, field2, Value2: string);
function dbPersonExists(Person: string): boolean;
function dbAddPerson(Person: string): boolean;
procedure dbGetPersonNameList(aListBox:TListBox; aComboBox:TComboBox);
function dbGetPersonValue(EngName, field: string): string;
function dbColumnExists(dbnameTable,dbTableColumn: string): boolean;
procedure dbAddColumn(dbnameTable, dbTableColumn, DefaultValue: string);
procedure dbGetIntegerFormFields(const form, field: string; var I: integer);

var
  sqldb: TSQLiteDatabase;
  SQL_picsTable: TSQLiteTable;
  dbFile: string;


implementation

uses RM_Additional, RM_main, RM_Options, RM_Translate;





procedure CreateDataBase;
var
  s: string;
  i: integer;
begin
  /// User DataBase
  sqldb:= TSQLiteDatabase.Create(dbFile);
  //sqldb.ExecSQL('PRAGMA synchronous=OFF; PRAGMA journal_mode=OFF;');
  try
    if not sqldb.TableExists('options') then //таблица в БД отсутствует - создаем
      begin
        s:='CREATE TABLE options ';
        s:=s+'(id INTEGER PRIMARY KEY AUTOINCREMENT,';
        s:=s+'FirstStarts TEXT DEFAULT "0",';
        s:=s+'ReleaseIndex TEXT DEFAULT "mr",';
        s:=s+'rSBformENGFlat TEXT DEFAULT "0",';
        s:=s+'rSBformRUSFlat TEXT DEFAULT "-1",';
        s:=s+'rSBformRefFlat TEXT DEFAULT "-1",';
        s:=s+'rSBformENGTag TEXT DEFAULT "1",';
        s:=s+'rSBformRUSTag TEXT DEFAULT "0",';
        s:=s+'rSBformRefTag TEXT DEFAULT "0",';
        s:=s+'SS_Compatibility TEXT DEFAULT "-1",';
        s:=s+'prCheckBoxCopyPrName TEXT DEFAULT "0",';
        s:=s+'OneReleasePerFile TEXT DEFAULT "0",';
        s:=s+'Nearly TEXT DEFAULT "-1",';
        s:=s+'SelfOwner TEXT DEFAULT "0",';
        s:=s+'RadioButton_en TEXT DEFAULT "-1",';
        s:=s+'RadioButton_ru TEXT DEFAULT "0",';
        s:=s+'FormDateFormat TEXT DEFAULT "0",';
        s:=s+'JpgQuality TEXT DEFAULT "85",';
        s:=s+'UseSignature TEXT DEFAULT "0",';
        s:=s+'UseDate TEXT DEFAULT "1",';
        s:=s+'mrCheckBox_autofillMRname TEXT DEFAULT "1",';
        s:=s+'jpgWDimension TEXT DEFAULT "10",';

        s:=s+'temp TEXT DEFAULT "0")';
        sqldb.BeginTransaction;
        sqldb.ExecSQL(s);
        sqldb.ExecSQL('INSERT INTO options (id) VALUES ("1")');
        sqldb.Commit;
      end;

    //sqldb.BeginTransaction;
    //dbAddColumn('options', 'mrCheckBox_autofillMRname', '1');
    //sqldb.Commit;

    if not sqldb.TableExists('formfields') then //таблица в БД отсутствует - создаем
      begin
        s:='CREATE TABLE formfields ';
        s:=s+'(id INTEGER PRIMARY KEY AUTOINCREMENT,';
        s:=s+'form TEXT,'; // prENG
        s:=s+'Pname TEXT,';
        s:=s+'Pname2 TEXT,';
        s:=s+'Pdate TEXT DEFAULT "'+ConvertToSettingDateFormat(today)+'",';
        s:=s+'Psignature TEXT,';
        s:=s+'PsignatureHelp TEXT,';
        s:=s+'PSignatureLeft TEXT,';
        s:=s+'PSignatureTop TEXT,';
        s:=s+'Pphone TEXT,';
        s:=s+'Paddress TEXT,';
        s:=s+'Pcity TEXT,';
        s:=s+'Pstate TEXT,';
        s:=s+'Pzip TEXT,';
        s:=s+'Pcountry TEXT DEFAULT "0",';
        s:=s+'Pemail TEXT,';
        s:=s+'Oname TEXT,';
        s:=s+'Odate TEXT DEFAULT "'+ConvertToSettingDateFormat(today)+'",';
        s:=s+'ODateBirth TEXT DEFAULT "'+ConvertToSettingDateFormat(today)+'",';
        s:=s+'Osignature TEXT,';
        s:=s+'OsignatureHelp TEXT,';
        s:=s+'OSignatureLeft TEXT,';
        s:=s+'OSignatureTop TEXT,';
        s:=s+'Ophone TEXT,';
        s:=s+'Oaddress TEXT,';
        s:=s+'Ocity TEXT,';
        s:=s+'Ostate TEXT,';
        s:=s+'Ozip TEXT,';
        s:=s+'Ocountry TEXT DEFAULT "0",';
        s:=s+'Oemail TEXT,';
        s:=s+'Wname TEXT,';
        s:=s+'Wdate TEXT DEFAULT "'+ConvertToSettingDateFormat(today)+'",';
        s:=s+'Wsignature TEXT,';
        s:=s+'WsignatureHelp TEXT,';
        s:=s+'WSignatureLeft TEXT,';
        s:=s+'WSignatureTop TEXT,';

        s:=s+'PShootDate TEXT DEFAULT "'+ConvertToSettingDateFormat(today)+'",';
        s:=s+'PShootLocation TEXT,';
        s:=s+'PShootDescription TEXT,';
        s:=s+'OGender TEXT DEFAULT "0",';
        s:=s+'OEthnicity TEXT DEFAULT "0",';
        s:=s+'ssNote TEXT,';
        s:=s+'ssModelPhotoPath TEXT,';
        s:=s+'temp TEXT)';

        sqldb.BeginTransaction;
        sqldb.ExecSQL(s);
        // add strings
        sqldb.ExecSQL('INSERT INTO formfields (form) VALUES ("mrENG")');   //1
        sqldb.ExecSQL('INSERT INTO formfields (form) VALUES ("mrRUS")');   //2
        sqldb.ExecSQL('INSERT INTO formfields (form) VALUES ("mrRef")');   //3
        sqldb.ExecSQL('INSERT INTO formfields (form) VALUES ("mrmENG")');  //4
        sqldb.ExecSQL('INSERT INTO formfields (form) VALUES ("mrmRUS")');  //5
        sqldb.ExecSQL('INSERT INTO formfields (form) VALUES ("mrmRef")');  //6
        sqldb.ExecSQL('INSERT INTO formfields (form) VALUES ("prENG")');   //7
        sqldb.ExecSQL('INSERT INTO formfields (form) VALUES ("prRUS")');   //8
        sqldb.ExecSQL('INSERT INTO formfields (form) VALUES ("prRef")');   //9
        /////First Start formfields options
        //prENG
        sqldb.ExecSQL('UPDATE formfields SET PSignatureLeft = "335" WHERE form = "prENG"');  //integer
        sqldb.ExecSQL('UPDATE formfields SET PSignatureTop = "690" WHERE form = "prENG"');
        sqldb.ExecSQL('UPDATE formfields SET OSignatureLeft = "801" WHERE form = "prENG"');
        sqldb.ExecSQL('UPDATE formfields SET OSignatureTop = "690" WHERE form = "prENG"');
        sqldb.ExecSQL('UPDATE formfields SET WSignatureLeft = "335" WHERE form = "prENG"');
        sqldb.ExecSQL('UPDATE formfields SET WSignatureTop = "765" WHERE form = "prENG"');
        //prRUS
        sqldb.ExecSQL('UPDATE formfields SET PSignatureLeft = "335" WHERE form = "prRUS"');  //integer
        sqldb.ExecSQL('UPDATE formfields SET PSignatureTop = "413" WHERE form = "prRUS"');
        sqldb.ExecSQL('UPDATE formfields SET OSignatureLeft = "797" WHERE form = "prRUS"');
        sqldb.ExecSQL('UPDATE formfields SET OSignatureTop = "413" WHERE form = "prRUS"');
        sqldb.ExecSQL('UPDATE formfields SET WSignatureLeft = "355" WHERE form = "prRUS"');
        sqldb.ExecSQL('UPDATE formfields SET WSignatureTop = "497" WHERE form = "prRUS"');


        //mrENG
        sqldb.ExecSQL('UPDATE formfields SET PSignatureLeft = "335" WHERE form = "mrENG"');  //integer
        sqldb.ExecSQL('UPDATE formfields SET PSignatureTop = "635" WHERE form = "mrENG"');
        sqldb.ExecSQL('UPDATE formfields SET OSignatureLeft = "801" WHERE form = "mrENG"');
        sqldb.ExecSQL('UPDATE formfields SET OSignatureTop = "635" WHERE form = "mrENG"');
        sqldb.ExecSQL('UPDATE formfields SET WSignatureLeft = "750" WHERE form = "mrENG"');
        sqldb.ExecSQL('UPDATE formfields SET WSignatureTop = "740" WHERE form = "mrENG"');
        //mrRUS
        sqldb.ExecSQL('UPDATE formfields SET PSignatureLeft = "335" WHERE form = "mrRUS"');  //integer
        sqldb.ExecSQL('UPDATE formfields SET PSignatureTop = "481" WHERE form = "mrRUS"');
        sqldb.ExecSQL('UPDATE formfields SET OSignatureLeft = "790" WHERE form = "mrRUS"');
        sqldb.ExecSQL('UPDATE formfields SET OSignatureTop = "480" WHERE form = "mrRUS"');
        sqldb.ExecSQL('UPDATE formfields SET WSignatureLeft = "748" WHERE form = "mrRUS"');
        sqldb.ExecSQL('UPDATE formfields SET WSignatureTop = "532" WHERE form = "mrRUS"');

        sqldb.Commit;
      end;

    //sqldb.BeginTransaction;
    //dbAddColumn('formfields', 'OGender', '0');
    //dbAddColumn('formfields', 'OEthnicity', '0');
    //sqldb.Commit;

    if not sqldb.TableExists('person') then //таблица в БД отсутствует - создаем
      begin
        s:='CREATE TABLE person ';
        s:=s+'(id INTEGER PRIMARY KEY AUTOINCREMENT,';

        s:=s+'EngName TEXT,';
        s:=s+'EngSignature TEXT,';
        s:=s+'EngPhone TEXT,';
        s:=s+'EngAddress TEXT,';
        s:=s+'EngCity TEXT,';
        s:=s+'EngState TEXT,';
        s:=s+'EngZip TEXT,';
        s:=s+'EngCountry TEXT,';
        s:=s+'EngEmail TEXT,';
        s:=s+'EngDateBirth TEXT DEFAULT "'+ConvertToSettingDateFormat(today)+'",';
        s:=s+'EngGender TEXT DEFAULT "0",';
        s:=s+'EngEthnicity TEXT DEFAULT "16",';
        s:=s+'EngModelPhoto TEXT,';

        s:=s+'RusName TEXT,';
        s:=s+'RusName2 TEXT,';
        s:=s+'RusSignature TEXT,';
        s:=s+'RusPhone TEXT,';
        s:=s+'RusAddress TEXT,';
        s:=s+'RusCity TEXT,';
        s:=s+'RusState TEXT,';
        s:=s+'RusZip TEXT,';
        s:=s+'RusCountry TEXT,';
        s:=s+'RusEmail TEXT,';
        s:=s+'RusGender TEXT DEFAULT "0",';
        s:=s+'RusEthnicity TEXT DEFAULT "16",';

        s:=s+'temp TEXT)';

        sqldb.BeginTransaction;
        sqldb.ExecSQL(s);
        sqldb.Commit;
      end;

    //sqldb.BeginTransaction;
    //dbAddColumn('person', 'EngGender', '0');
    //dbAddColumn('person', 'EngEthnicity', '16');
    //dbAddColumn('person', 'RusGender', '0');
    //dbAddColumn('person', 'RusEthnicity', '16');
    //dbAddColumn('person', 'EngModelPhoto', '');
    //sqldb.Commit;



  //if not sqldb.TableExists('model') then //таблица в БД отсутствует - создаем
  //  begin
  //    s:='CREATE TABLE model ';
  //    s:=s+'(id INTEGER PRIMARY KEY AUTOINCREMENT,';
  //    s:=s+'ENGRUSRef TEXT,';
  //    s:=s+'name TEXT,';
  //    s:=s+'date TEXT,';
  //    //s:=s+'rating INTEGER,';
  //    s:=s+'signature BLOB,';
  //    s:=s+'phone TEXT,';
  //    s:=s+'address TEXT,';
  //    s:=s+'city TEXT,';
  //    s:=s+'state TEXT,';
  //    s:=s+'zip TEXT,';
  //    s:=s+'country TEXT,';
  //    s:=s+'email TEXT,';
  //    s:=s+'ModelPhotoPath TEXT,';
  //    s:=s+'temp TEXT)';
  //    sqldb.ExecSQL(s);
  //    sqldb.ExecSQL('PRAGMA synchronous=OFF; PRAGMA journal_mode=OFF;');
  //  end;
  //if not sqldb.TableExists('photographer') then //таблица в БД отсутствует - создаем
  //  begin
  //    s:='CREATE TABLE photographer ';
  //    s:=s+'(id INTEGER PRIMARY KEY AUTOINCREMENT,';
  //    s:=s+'name TEXT,';
  //    s:=s+'date TEXT,';
  //    //s:=s+'rating INTEGER,';
  //    s:=s+'signature TEXT,';
  //    s:=s+'phone TEXT,';
  //    s:=s+'address TEXT,';
  //    s:=s+'city TEXT,';
  //    s:=s+'state TEXT,';
  //    s:=s+'zip TEXT,';
  //    s:=s+'country TEXT,';
  //    s:=s+'email TEXT,';
  //    s:=s+'temp TEXT)';
  //    sqldb.ExecSQL(s);
  //
  //    //for i := 1 to 2 do
  //      //sqldb.ExecSQL('INSERT INTO models (statusFtp, loginFtp, passFtp, statusHttps, loginHttps, passHttps) VALUES ("", "", "", "", "", "")');
  //  end;
  //sqldb.ExecSQL('INSERT INTO models ("phone") VALUES ("+123131234")');
  //SQL_picsTable:= TSQLiteTable.Create(sqldb,'SELECT hash, filename, title, Discription, keywords, error, temp FROM models');
  //Pic_table:= TSQLiteTable.Create(sqldb,'SELECT id, hash, filename, title, Discription, keywords, error, temp FROM models');
  except

    on E : Exception do
      begin
        //MemoLog.Lines.Add('ERROR: '+E.ClassName+'  ('+E.Message+')');
        MessageBox(0, pChar(Trl_ErrorCreatingTable+LineEnding+'ERROR: '+E.ClassName+'  ('+E.Message+')'),pChar(Trl_Error), MB_OK+MB_ICONERROR);
        Application.Terminate;
      end;
  end;
end;




// функция получения Value1 записи в таблице по Value2 значению в таблице(например получить пароль по логину)
function dbGetValueFromValue(dbnameTable, dbTableColumnIN, dbTableColumnOUT, dbvalue: string):string;
var
  db_table: TSQLiteTable;
  i,r: integer;
begin
  db_table:= TSQLiteTable.Create(sqldb,'SELECT '+dbTableColumnIN+', '+dbTableColumnOUT+' FROM '+dbnameTable);
  try
    result:= '0';
    for i := 0 to db_table.Count-1 do
      if db_table.FieldAsString(0)<>dbvalue then
        begin
          db_table.Next
        end
      else
        begin
          result:= db_table.FieldAsString(1);
        end;
  finally
    db_table.Destroy;
  end;
  //example
  //dbGetValueFromValue('models', 'id', 'name', '1');  // узнаём значение в 'name', где 'id' = 1
end;

function dbUpdateValue(dbnameTable, dbTableColumnWHERE, dbvalueWHERE, dbTableColumnSET, dbvalueSET: string):boolean;
var
  Query: string;
begin
  try
    sqldb.BeginTransaction;//начали
    Query:='UPDATE '+dbnameTable+' SET '+dbTableColumnSET+' = "'+dbvalueSET+'" WHERE '+dbTableColumnWHERE+' = "'+dbvalueWHERE+'"';
    sqldb.ExecSQL(Query);
    sqldb.Commit;//завершли
    result:= true;
  except
    result:= false;
  end;
  //example
  //dbUpdateValue('models', 'id', '1', 'phone', '+7 916 085 58 31');  //update 'phone', где 'id'=1
end;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
function dbGetOptions(dbValue: string): string;
begin
  result:=dbGetValueFromValue('options', 'id', dbValue, '1');
end;

procedure dbUpdOptions(option, Value: string);
begin
  sqldb.ExecSQL('UPDATE options SET '+option+' = "'+Value+'" WHERE id = "1"');
end;
///
function dbGetFormFields(form, field: string): string;
begin
  result:=dbGetValueFromValue('formfields', 'form', field, form);
end;
procedure dbGetIntegerFormFields(const form, field: string; var I: integer);
var
  s: string;
begin
  //s:=dbGetValueFromValue('formfields', 'form', field, form);
  //
  //if StrIsInteger(s) then
  //  I:= StrToInt(s);
end;

procedure dbUpdFormFields(form, field, Value: string);
begin
  sqldb.ExecSQL('UPDATE formfields SET '+field+' = "'+Value+'" WHERE form = "'+form+'"');
end;
///
procedure dbLoadSignature(dbnameTable, dbForm, dbFormValue, dbGetSignature: string; Img: TImage);
var
  s: string;
begin
  s:=dbGetValueFromValue(dbnameTable, dbForm, dbGetSignature, dbFormValue);
  if (FileExistsUTF8(s)) and (Form4.rCheckBox_UseSignature.Checked) then
    begin
      Img.HelpKeyword:=s;
      Img.Picture.LoadFromFile(s);
    end;
end;

procedure dbGetDate(dbnameTable, dbForm, dbFormValue, dbGetDate: string; aDate: TDateEdit);
var
  s: string;
begin
  s:=dbGetValueFromValue(dbnameTable, dbForm, dbGetDate, dbFormValue);
  if Length(s)>1 then aDate.Date:= ConvertToLocaleDateFormat(s);
end;
///

/// UPDATE person field2=Value2 WHERE field1=Value1
procedure dbUpdPerson(field1, Value1, field2, Value2: string);
begin
  sqldb.ExecSQL('UPDATE person SET '+field2+' = "'+Value2+'" WHERE '+field1+' = "'+Value1+'"');
end;
///
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
function dbPersonExists(Person: string): boolean;
var
  db_table: TSQLiteTable;
  i: integer;
begin
  result:= false;
  db_table:= TSQLiteTable.Create(sqldb,'SELECT EngName FROM person');
  try
    for i:=0 to db_table.Count-1 do
      if db_table.FieldAsString(0)<>Person then db_table.Next
      else result:= true;
  finally
    db_table.Destroy;
  end;
end;

function dbAddPerson(Person: string): boolean;  // if false, then Person=nil
begin
  try
  if Length(Person)<>0 then
    begin
      if not dbPersonExists(Person) then
        begin
          sqldb.ExecSQL('INSERT INTO person (EngName) VALUES ("'+Person+'")');
          dbUpdPerson('EngName', Person, 'EngCountry', '0');
          dbUpdPerson('EngName', Person, 'RusCountry', '0');
        end;
      result:=true;
    end
  else result:=false;
  finally
  end;
end;

procedure dbGetPersonNameList(aListBox:TListBox; aComboBox:TComboBox);
var
  db_table: TSQLiteTable;
  sList: TStringList;
  i: integer;
begin
  sList:= TStringList.Create;
  db_table:= TSQLiteTable.Create(sqldb,'SELECT EngName FROM person');
  try
    for i:=0 to db_table.Count-1 do
      begin
        sList.Add(db_table.FieldAsString(0));
        db_table.Next;
      end;
    aListBox.Items:=sList;
    aComboBox.Items:=sList;
  finally
    db_table.Destroy;
    sList.Free;
  end;
end;

function dbGetPersonValue(EngName, field: string): string;
begin
  result:=dbGetValueFromValue('person', 'EngName', field, EngName);
end;



function dbColumnExists(dbnameTable,dbTableColumn: string): boolean;
var
  db_table: TSQLiteTable;
  i: integer;
  UpperStr: string;
begin
  result:= false;
  UpperStr:=UpperCase(dbTableColumn);
  db_table:= TSQLiteTable.Create(sqldb,'SELECT * FROM '+dbnameTable);
  try
    for i:=0 to db_table.ColCount-1 do
      if db_table.Columns[i]=UpperStr then result:= true;
  finally
    db_table.Destroy;
  end;
end;

procedure dbAddColumn(dbnameTable, dbTableColumn, DefaultValue: string);
begin
  if dbColumnExists(dbnameTable,dbTableColumn)=false then
  //sqldb.BeginTransaction;
  sqldb.ExecSQL('ALTER TABLE '+dbnameTable+' ADD COLUMN '+dbTableColumn+' TEXT DEFAULT "'+DefaultValue+'"');
  //sqldb.ExecSQL('ALTER TABLE options ADD COLUMN jpgWDimension TEXT DEFAULT "10"');
  //sqldb.Commit;
end;

//////////////////////////////////////////////////////////////////////////////////////////



end.

