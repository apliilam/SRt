unit RM_Additional;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, forms, Process, fileutil,
  ExtCtrls, Graphics, controls, dialogs, base64, StdCtrls,
  LCLType, LCLIntf, intfgraphics, lazcanvas, LCLProc,
  RM_Options, dateutils, Buttons, UTF8Process;

type
  SpeedButtonArray=array of TSpeedButton;


procedure MyPause(p:integer);
procedure ReadTitleFromFile(const FileName: string; var fTitle: string);
procedure FillCanvasColor(Canvas:TCanvas; Color:TColor);
procedure BakePanelControlsToForm(sketchPanel: TPanel; bmp: TBitmap);
function Proportional_TPictureToTImageSizeHeight(Pic:TPicture; Img: TImage): integer; //make proportional TImage size Width
function Proportional_TPictureToTImageSizeWidth(Pic:TPicture; Img: TImage): integer; //make proportional TImage size Width
procedure AddSketchImgToForm(SketchFile: string);
procedure SaveBitmapToJPG(bmp: TBitmap; SaveFileName: string; quality:TJPEGQualityRange);
procedure SetSketchImgProperty(img: TImage);
procedure GoToCropIMG(SrcImg, DstImg: TImage);
procedure SwapIfMinus(var c1,c2:integer);
function RectReSize(FakeRect:TRect; IndexResize: Real):TRect;
procedure RotateBitmap90(Const Bitmap: TBitmap);
procedure RotateTImage(img: TImage);
function CutStringUpTo(str: string; n: integer): string;
function GetDateLastGhange(f: string): TDateTime;
function GetWinVerMajor: integer;
function GetWinVerMinor: integer;
function GetLocaleDateSeparator: string;
function GetLocaleShortDate: string;
function ConvertToSettingDateFormat(inDate:TDate):string;
function ConvertToLocaleDateFormat(inDate:string):TDate;
function GetLocaleLanguage: string;
procedure WriteUserComment(doit:boolean; FileName: string);   // r^ - read as "Release"
procedure SetCountryList;
procedure SetCountryToComboBox(arrComboBox: Array of TComboBox);
procedure SetEthnicityToComboBox(ComboBox: TComboBox);
procedure SetGenderToComboBox(ComboBox: TComboBox);
function arrSort(var A: SpeedButtonArray): SpeedButtonArray;
procedure SetLangButtonTag(SB: TSpeedButton);
procedure ALLFormTurnOff(MasterScrollArr: Array of TScrollBox);
procedure FormTurnOff(MasterScrollbox,ChildScrollbox: TScrollBox; Height: integer);
procedure FormTurnOn(MasterScrollbox,ChildScrollbox: TScrollBox; Height: integer);
function FindScrollBoxMaster: TScrollBox;
procedure ScrollUp;
procedure ScrollDown;
procedure RefPanelToActiveForm(ScrollBox: TScrollBox);
procedure PositionRefAreaPanel;
procedure BitmapUnion;
procedure ChangeSizeBakeText(aListBox: TListBox; bm: TBitmap; desX,desY: integer);
function MouseInSpeedButton(WC:TSpeedButton):boolean;
function MouseInEdit(WC:TEdit):boolean;
procedure POSRefPaneltoPOSRefPanelAREA;
function GetMinHeightRefPanel: integer;
procedure MyRepaint;
function WidthByUser: integer;
function HeightByUser(bmp: TBitmap; W: integer): integer;
procedure WarningA4(ScrollBoxMaster: TScrollBox);
function FileVersion(AFileName: string): string;
function GetAppsCaption: string;
function StrIsInteger(s: String): boolean;
procedure ifSelf_ComboBox(ComboFrom: TObject; ComboTo: TComboBox);
function GetPageName: string;
function GetPageIndex(name: string): integer;
function FileStatus(const fullfilename: string): boolean;
procedure OpenLink(Link: string);

const
  CountryListData =
'0=Choose country'+                            '=Выберите страну'+
'|1=Afghanistan'+                              '=Афганистан'+
'|2=Albania'+                                  '=Албания'+
'|3=Algeria'+                                  '=Алжир'+
'|4=American Samoa'+                           '=Американское Самоа'+
'|5=Andorra'+                                  '=Андорра'+
'|6=Angola'+                                   '=Ангола'+
'|7=Anguilla'+                                 '=Ангилья'+
'|8=Antarctica'+                               '=Антарктида'+
'|9=Antigua and Barbuda'+                      '=Антигуа и Барбуда'+
'|10=Argentina'+                               '=Аргентина'+
'|11=Armenia'+                                 '=Армения'+
'|12=Aruba'+                                   '=Аруба'+
'|13=Australia'+                               '=Австралия'+
'|14=Austria'+                                 '=Австрия'+
'|15=Azerbaijan'+                              '=Азербайджан'+
'|16=Bahamas'+                                 '=Багамы'+
'|17=Bahrain'+                                 '=Бахрейн'+
'|18=Bangladesh'+                              '=Бангладеш'+
'|19=Barbados'+                                '=Барбадос'+
'|20=Belarus'+                                 '=Беларусь'+
'|21=Belgium'+                                 '=Бельгия'+
'|22=Belize'+                                  '=Белиз'+
'|23=Benin'+                                   '=Бенин'+
'|24=Bermuda'+                                 '=Бермуды'+
'|25=Bhutan'+                                  '=Бутан'+
'|26=Bolivia'+                                 '=Боливия'+
'|27=Bosnia and Herzegovina'+                  '=Босния и Герцеговина'+
'|28=Botswana'+                                '=Ботсвана'+
'|29=Bouvet Island'+                           '=Остров Буве'+
'|30=Brazil'+                                  '=Бразилия'+
'|31=British Indian Ocean Territory'+          '=Британская территория в Индийском океане'+
'|32=Brunei Darussalam'+                       '=Бруней-Даруссалам'+
'|33=Bulgaria'+                                '=Болгария'+
'|34=Burkina Faso'+                            '=Буркина-Фасо'+
'|35=Burundi'+                                 '=Бурунди'+
'|36=Cambodia'+                                '=Камбоджа'+
'|37=Cameroon'+                                '=Камерун'+
'|38=Canada'+                                  '=Канада'+
'|39=Cape Verde'+                              '=Кабо-Верде'+
'|40=Cayman Islands'+                          '=Острова Кайман'+
'|41=Central African Republic'+                '=Центрально-Африканская Республика'+
'|42=Chad'+                                    '=Чад'+
'|43=Chile'+                                   '=Чили'+
'|44=China'+                                   '=Китай'+
'|45=Christmas Island'+                        '=Остров Рождества'+
'|46=Cocos Keeling Islands'+                   '=Кокосовые (Килинг) острова'+
'|47=Colombia'+                                '=Колумбия'+
'|48=Comoros'+                                 '=Коморы'+
'|49=Congo'+                                   '=Конго'+
'|50=Congo, The Democratic Republic of the'+   '=Конго, Демократическая Республика'+
'|51=Cook Islands'+                            '=Острова Кука'+
'|52=Costa Rica'+                              '=Коста-Рика'+
'|53=Cote d''Ivoire'+                          '=Кот д''Ивуар'+
'|54=Croatia'+                                 '=Хорватия'+
'|55=Cuba'+                                    '=Куба'+
'|56=Cyprus'+                                  '=Кипр'+
'|57=Czech Republic'+                          '=Чешская Республика'+
'|58=Denmark'+                                 '=Дания'+
'|59=Djibouti'+                                '=Джибути'+
'|60=Dominica'+                                '=Доминика'+
'|61=Dominican Republic'+                      '=Доминиканская Республика'+
'|62=East Timor'+                              '=Западный Тимор'+
'|63=Ecuador'+                                 '=Эквадор'+
'|64=Egypt'+                                   '=Египет'+
'|65=El Salvador'+                             '=Эль-Сальвадор'+
'|66=Equatorial Guinea'+                       '=Экваториальная Гвинея'+
'|67=Eritrea'+                                 '=Эритрея'+
'|68=Estonia'+                                 '=Эстония'+
'|69=Ethiopia'+                                '=Эфиопия'+
'|70=Falkland Islands Islas Malvinas'+         '=Фолклендские острова (Мальвинские)'+
'|71=Faroe Islands'+                           '=Фарерские острова'+
'|72=Fiji Islands'+                            '=Фиджи'+
'|73=Finland'+                                 '=Финляндия'+
'|74=France'+                                  '=Франция'+
'|75=French Guiana'+                           '=Французская Гвиана'+
'|76=French Polynesia'+                        '=Французская Полинезия'+
'|77=French Southern and Antarctic Lands'+     '=Французские Южные территории'+
'|78=Gabon'+                                   '=Габон'+
'|79=Gambia'+                                  '=Гамбия'+
'|80=Georgia'+                                 '=Грузия'+
'|81=Germany'+                                 '=Германия'+
'|82=Ghana'+                                   '=Гана'+
'|83=Gibraltar'+                               '=Гибралтар'+
'|84=Greece'+                                  '=Греция'+
'|85=Greenland'+                               '=Гренландия'+
'|86=Grenada'+                                 '=Гренада'+
'|87=Guadeloupe'+                              '=Гваделупа'+
'|88=Guam'+                                    '=Гуам'+
'|89=Guatemala'+                               '=Гватемала'+
'|90=Guinea'+                                  '=Гвинея'+
'|91=Guinea-Bissau'+                           '=Гвинея-Бисау'+
'|92=Guyana'+                                  '=Гайана'+
'|93=Haiti'+                                   '=Гаити'+
'|94=Honduras'+                                '=Гондурас'+
'|95=Hong Kong'+                               '=Гонконг'+
'|96=Hungary'+                                 '=Венгрия'+
'|97=Iceland'+                                 '=Исландия'+
'|98=India'+                                   '=Индия'+
'|99=Indonesia'+                               '=Индонезия'+
'|100=Iran, Islamic Republic of'+              '=Иран, Исламская Республика'+
'|101=Iraq'+                                   '=Ирак'+
'|102=Ireland'+                                '=Ирландия'+
'|103=Israel'+                                 '=Израиль'+
'|104=Italy'+                                  '=Италия'+
'|105=Jamaica'+                                '=Ямайка'+
'|106=Japan'+                                  '=Япония'+
'|107=Jordan'+                                 '=Иордания'+
'|108=Kazakstan'+                              '=Казахстан'+
'|109=Kenya'+                                  '=Кения'+
'|110=Kiribati'+                               '=Кирибати'+
'|111=Korea, Democratic People''s Republic of'+'=Корея, Народно-Демократическая Республика'+
'|112=Korea, Republic of'+                     '=Корея, Республика'+
'|113=Kuwait'+                                 '=Кувейт'+
'|114=Kyrgyzstan'+                             '=Киргизия'+
'|115=Lao People''s Democratic Republic'+      '=Лаос'+
'|116=Latvia'+                                 '=Латвия'+
'|117=Lebanon'+                                '=Ливан'+
'|118=Lesotho'+                                '=Лесото'+
'|119=Liberia'+                                '=Либерия'+
'|120=Libyan Arab Jamahiriya'+                 '=Ливийская Арабская Джамахирия'+
'|121=Liechtenstein'+                          '=Лихтенштейн'+
'|122=Lithuania'+                              '=Литва'+
'|123=Luxembourg'+                             '=Люксембург'+
'|124=Macao SAR'+                              '=Макао'+
'|125=Macedonia, Former Yugoslav Republic of'+ '=Республика Македония'+
'|126=Madagascar'+                             '=Мадагаскар'+
'|127=Malawi'+                                 '=Малави'+
'|128=Malaysia'+                               '=Малайзия'+
'|129=Maldives'+                               '=Мальдивы'+
'|130=Mali'+                                   '=Мали'+
'|131=Malta'+                                  '=Мальта'+
'|132=Marshall Islands'+                       '=Маршалловы острова'+
'|133=Martinique'+                             '=Мартиника'+
'|134=Mauritania'+                             '=Мавритания'+
'|135=Mauritius'+                              '=Маврикий'+
'|136=Mayotte'+                                '=Майотта'+
'|137=Mexico'+                                 '=Мексика'+
'|138=Micronesia, Federated States of'+        '=Микронезия, Федеративные Штаты'+
'|139=Moldova, Republic of'+                   '=Молдова, Республика'+
'|140=Monaco'+                                 '=Монако'+
'|141=Mongolia'+                               '=Монголия'+
'|235=Montenegro'+                             '=Черногория'+
'|142=Montserrat'+                             '=Монтсеррат'+
'|143=Morocco'+                                '=Марокко'+
'|144=Mozambique'+                             '=Мозамбик'+
'|145=Myanmar'+                                '=Мьянма'+
'|146=Namibia'+                                '=Намибия'+
'|147=Nauru'+                                  '=Науру'+
'|148=Nepal'+                                  '=Непал'+
'|149=Netherlands'+                            '=Нидерланды'+
'|150=Netherlands Antilles'+                   '=Антильские Нидерланды'+
'|151=New Caledonia'+                          '=Новая Каледония'+
'|152=New Zealand'+                            '=Новая Зеландия'+
'|153=Nicaragua'+                              '=Никарагуа'+
'|154=Niger'+                                  '=Нигер'+
'|155=Nigeria'+                                '=Нигерия'+
'|156=Niue'+                                   '=Ниуэ'+
'|157=Norfolk Island'+                         '=Остров Норфолк'+
'|158=Northern Mariana Islands'+               '=Северные Марианские острова'+
'|159=Norway'+                                 '=Норвегия'+
'|160=Oman'+                                   '=Оман'+
'|161=Pakistan'+                               '=Пакистан'+
'|162=Palau'+                                  '=Палау'+
'|163=Panama'+                                 '=Панама'+
'|164=Papua New Guinea'+                       '=Папуа-Новая Гвинея'+
'|165=Paraguay'+                               '=Парагвай'+
'|166=Peru'+                                   '=Перу'+
'|167=Philippines'+                            '=Филиппины'+
'|168=Pitcairn Islands'+                       '=Питкерн'+
'|169=Poland'+                                 '=Польша'+
'|170=Portugal'+                               '=Португалия'+
'|171=Puerto Rico'+                            '=Пуэрто-Рико'+
'|172=Qatar'+                                  '=Катар'+
'|173=Reunion'+                                '=Реюньон'+
'|174=Romania'+                                '=Румыния'+
'|175=Russian Federation'+                     '=Россия'+
'|176=Rwanda'+                                 '=Руанда'+
'|177=Saint Helena'+                           '=Святая Елена'+
'|178=Saint Kitts and Nevis'+                  '=Сент-Китс и Невис'+
'|179=Saint Lucia'+                            '=Сент-Люсия'+
'|180=Saint Pierre and Miquelon'+              '=Сент-Пьер и Микелон'+
'|181=Saint Vincent and the Grenadines'+       '=Сент-Винсент и Гренадины'+
'|182=Samoa'+                                  '=Самоа'+
'|183=San Marino'+                             '=Сан-Марино'+
'|184=Sao Tome and Principe'+                  '=Сан-Томе и Принсипи'+
'|185=Saudi Arabia'+                           '=Саудовская Аравия'+
'|186=Senegal'+                                '=Сенегал'+
'|187=Serbia'+                                 '=Сербия'+
'|188=Seychelles'+                             '=Сейшелы'+
'|189=Sierra Leone'+                           '=Сьерра-Леоне'+
'|190=Singapore'+                              '=Сингапур'+
'|191=Slovakia'+                               '=Словакия'+
'|192=Slovenia'+                               '=Словения'+
'|193=Solomon Islands'+                        '=Соломоновы острова'+
'|194=Somalia'+                                '=Сомали'+
'|195=South Africa'+                           '=Южная Африка'+
'|196=Spain'+                                  '=Испания'+
'|197=Sri Lanka'+                              '=Шри-Ланка'+
'|198=Sudan'+                                  '=Судан'+
'|199=Suriname'+                               '=Суринам'+
'|200=Svalbard and Jan Mayen'+                 '=Шпицберген и Ян Майен'+
'|201=Swaziland'+                              '=Свазиленд'+
'|202=Sweden'+                                 '=Швеция'+
'|203=Switzerland'+                            '=Швейцария'+
'|204=Syrian Arab Republic'+                   '=Сирийская Арабская Республика'+
'|205=Taiwan, Province of China'+              '=Тайвань (Китай)'+
'|206=Tajikistan'+                             '=Таджикистан'+
'|207=Tanzania, United Republic of'+           '=Танзания, Объединенная Республика'+
'|208=Thailand'+                               '=Таиланд'+
'|209=Togo'+                                   '=Того'+
'|210=Tokelau'+                                '=Токелау'+
'|211=Tonga'+                                  '=Тонга'+
'|212=Trinidad and Tobago'+                    '=Тринидад и Тобаго'+
'|213=Tunisia'+                                '=Тунис'+
'|214=Turkey'+                                 '=Турция'+
'|215=Turkmenistan'+                           '=Туркмения'+
'|216=Turks and Caicos Islands'+               '=Острова Теркс и Кайкос'+
'|217=Tuvalu'+                                 '=Тувалу'+
'|218=Uganda'+                                 '=Уганда'+
'|219=Ukraine'+                                '=Украина'+
'|220=United Arab Emirates'+                   '=Объединенные Арабские Эмираты'+
'|221=United Kingdom'+                         '=Соединенное Королевство'+
'|222=United States'+                          '=Соединенные Штаты'+
'|223=United States Minor Outlying Islands'+   '=Малые Тихоокеанские отдаленные острова Соединенных Штатов'+
'|224=Uruguay'+                                '=Уругвай'+
'|225=Uzbekistan'+                             '=Узбекистан'+
'|226=Vanuatu'+                                '=Вануату'+
'|227=Venezuela'+                              '=Венесуэла Боливарианская Республика'+
'|228=Vietnam'+                                '=Вьетнам'+
'|229=Virgin Islands, British'+                '=Виргинские острова, Британские'+
'|230=Virgin Islands, U.S.'+                   '=Виргинские острова, США'+
'|231=Wallis and Futuna'+                      '=Уоллис и Футуна'+
'|232=Yemen'+                                  '=Йемен'+
'|233=Zambia'+                                 '=Замбия'+
'|234=Zimbabwe'+                               '=Зимбабве';


  EthnicityListData =
'0=Choose model etnicity'+
'|1=African'+
'|2=African-american'+
'|3=Black'+
'|4=Brazilian'+
'|5=Chinese'+
'|6=Caucasian'+
'|7=East Asian'+
'|8=Hispanic'+
'|9=Japanese'+
'|10=Middle Eastern'+
'|11=Multi-Ethnic'+
'|12=Native American'+
'|13=Pacific Islander'+
'|14=South Asian'+
'|15=Southeast Asian'+
'|16=Other';

  GenderListData =
'0=Male'+
'|1=Female';




implementation

uses RM_main, RM_CropImg, RM_Translate;


function GetPageName: string;
var
  i:integer;
begin
  for i:=0 to Form1.prPageControl.PageCount-1 do
    if Form1.prPageControl.ActivePageIndex=i then result:=Form1.prPageControl.ActivePage.Name;
end;
function GetPageIndex(name: string): integer;
var
  i: integer;
begin
  result:=0;
  for i:=0 to Form1.prPageControl.PageCount-1 do
    if Form1.prPageControl.Pages[i].Name=name then result:=i;
end;

function GetAppsCaption: string;  //caption с версией приложения
begin
 //result:=AppsName+' v'+FileVersion(UTF8Decode(AnsiToUtf8(ParamStr(0))))+' (beta)';
 result:=AppsName+AppsVersion;
end;

procedure WarningA4(ScrollBoxMaster: TScrollBox);   //не работает, потом сделать
var
  Img: TImage;
begin
 Img:=Form1.ImageWarningA4;

  If ScrollBoxMaster.Height<=1414 then
    begin
      Img.Visible:=false;
    end
  else
    begin
      Img.Parent:=Form1.prScrollBoxRef;
      Img.Enabled:=true;
      Img.Visible:=true;
      Img.Align:=alClient;
      Img.Align:=alNone;
      Img.Width:=ScrollBoxMaster.Width;
      Img.Height:=ScrollBoxMaster.Height-1414;
      Img.Left:=0;
      Img.Top:=ScrollBoxMaster.Height-Img.Height;

      Img.BringToFront;

    end;
end;

procedure PositionRefAreaPanel;
var
  RefPanel,RefPanelAREA: TPanel;
begin
  RefPanel:=Form1.prPanelRef;
  RefPanelAREA:=Form1.rPanelRefAREA;
  if RefPanel.ControlCount=0 then
    begin
      RefPanelAREA.BringToFront;
      Form1.prSBDelAllReferences.Visible:=false;
      Form1.prSBrefPanelCollapse.Visible:=false;
    end
  else
    begin
     Form1.prSBDelAllReferences.Visible:=true;
     Form1.prSBrefPanelCollapse.Visible:=true;
     RefPanelAREA.SendToBack;
    end;
end;

procedure POSRefPaneltoPOSRefPanelAREA;
var
  RefPanel,RefPanelAREA: TPanel;
begin
  RefPanel:=Form1.prPanelRef;
  RefPanelAREA:=Form1.rPanelRefAREA;
  RefPanelAREA.Top:=RefPanel.Top;
  RefPanelAREA.Left:=RefPanel.Left;
  RefPanelAREA.Width:=RefPanel.Width;
  RefPanelAREA.Height:=RefPanel.Height;
end;

procedure RefPanelToActiveForm(ScrollBox: TScrollBox);
var
  RefPanel,RefPanelAREA: TPanel;
begin
  RefPanel:=Form1.prPanelRef;
  RefPanelAREA:=Form1.rPanelRefAREA;
  RefPanel.parent:=ScrollBox;
  ScrollBox.Height:=RefPanel.Height+40;
  RefPanel.Top:=20;
  RefPanel.Left:=25;
  RefPanel.Width:=ScrollBox.Width-50;

  RefPanelAREA.Parent:=ScrollBox;
  POSRefPaneltoPOSRefPanelAREA;
  Form1.prSBDelAllReferences.Parent:=ScrollBox;
  Form1.prSBDelAllReferences.Top:=RefPanel.Top+20;
  Form1.prSBDelAllReferences.Left:=(RefPanel.Left-Form1.prSBDelAllReferences.Width) div 2;
  Form1.prSBrefPanelCollapse.Parent:=ScrollBox;
  Form1.prSBrefPanelCollapse.Top:=Form1.prSBDelAllReferences.Top+Form1.prSBrefPanelCollapse.Height+5;
  Form1.prSBrefPanelCollapse.Left:=Form1.prSBDelAllReferences.Left;

  PositionRefAreaPanel;
end;

function GetMinHeightRefPanel: integer;
var
  RefPanel: TPanel;
  i,minHeight: integer;
begin
  minHeight:=90;
  RefPanel:=Form1.prPanelRef;
  if RefPanel.ControlCount<>0 then
    for i:=0 to RefPanel.ControlCount-1 do
        if (RefPanel.Controls[i].Top+RefPanel.Controls[i].Height)>minHeight then
          minHeight:=(RefPanel.Controls[i].Top+RefPanel.Controls[i].Height);
  result:=minHeight;
end;

function FindScrollBoxMaster: TScrollBox;
var
  ScrollBox: TScrollBox;
begin
  case Form1.prPageControl.ActivePage.Name of
    'mr': ////////////////////////////// Model Release
      begin
        ScrollBox:=Form1.mrScrollBox;
      end;
    'mrm': ////////////////////////////// Model Release (minor)
      begin
        ScrollBox:=Form1.mrmScrollBox;
      end;
    'pr': ////////////////////////////// Property Release
      begin
        ScrollBox:=Form1.prScrollBox;
      end;
    'prA': //////////////////////////////
      begin
        ScrollBox:=Form1.prScrollBoxQ;
      end
    else
      begin

      end
    end;
  result:=ScrollBox;
end;

procedure ScrollUp;
begin
  FindScrollBoxMaster.VertScrollBar.Position:= FindScrollBoxMaster.VertScrollBar.Position-35;
end;
procedure ScrollDown;
begin
  FindScrollBoxMaster.VertScrollBar.Position:= FindScrollBoxMaster.VertScrollBar.Position+35;
end;




procedure ALLFormTurnOff(MasterScrollArr: Array of TScrollBox);
var
  i,j: integer;
begin
  for i:=0 to High(MasterScrollArr) do
      for j:=0 to MasterScrollArr[i].ControlCount-1 do
          if MasterScrollArr[i].Controls[j] is TScrollBox then
            begin
              FormTurnOff(MasterScrollArr[i], (MasterScrollArr[i].Controls[j] as TScrollBox), 0);
            end;

end;


procedure FormTurnOff(MasterScrollbox,ChildScrollbox: TScrollBox; Height: integer);
begin
  //ChildScrollbox.Enabled:=false;
  ChildScrollbox.Align:=alBottom;//alNone;
  //ChildScrollbox.Align:=alNone;
  ChildScrollbox.Height:=1;//Height;
  ChildScrollbox.Width:=Height; //0
  ChildScrollbox.Top:=MasterScrollbox.Height;
end;

procedure FormTurnOn(MasterScrollbox,ChildScrollbox: TScrollBox; Height: integer);
begin
  ChildScrollbox.Top:=MasterScrollbox.Height;
  ChildScrollbox.Height:=Height;
  ChildScrollbox.Align:=alTop;
  ChildScrollbox.Enabled:=true;


  //Form1.ScrollBox_Temp.Align:=alBottom;
  //Form1.ScrollBox_Temp.Align:=alBottom;
end;

function arrSort(var A: SpeedButtonArray): SpeedButtonArray;
var
  tempSB: TSpeedButton;
  i,n,min,max: integer;
  Sort: Boolean;
begin
  if Length(A)<>0 then
    begin
      min:=Low(A);
      max:=High(A);
      Sort:=True;
      n:=0;
      while Sort do
        begin
         Sort:=False;
         for i:=min to max-1-n do
           if A[i].Tag>A[i+1].Tag then
             begin
               Sort:=True;
               tempSB:=A[i];
               A[i]:=A[i+1];
               A[i+1]:=tempSB;
             end;
         inc(n);
        end;
    end;
  result:=A;
end;


procedure SetLangButtonTag(SB: TSpeedButton);
var
  sbArr: SpeedButtonArray;
  tempSB: TSpeedButton;
  sbPanel: TPanel;
  i,n: integer;
  s: string;
begin
  if SB.Flat=false then
    begin
      SB.Flat:=true;
    end
  else
    begin
      SB.Flat:=false;
      SB.Tag:=100;
    end;

  //////////////// заносим кнопки в arrow
  sbPanel:=Form1.prPanelLang;
  SetLength(sbArr,0);
  for i:=0 to sbPanel.ControlCount-1 do
    begin
     if (sbPanel.Controls[i] is TSpeedButton) then
      if (sbPanel.Controls[i] as TSpeedButton).Flat=false then
        begin
          SetLength(sbArr,Length(sbArr)+1);
          sbArr[High(sbArr)]:=(sbPanel.Controls[i] as TSpeedButton);
        end;
    end;

  ///////////////// расстановка Tag
  if Length(sbArr)<>0 then
    begin
      if SB.Tag=100 then
        begin
          SB.Tag:=Length(sbArr);
        end
      else
        begin
          tempSB:=SB;
          n:=1;
          for i:=0 to High(sbArr) do
            if sbArr[i].Tag=tempSB.Tag+n then
              begin
                sbArr[i].Tag:=sbArr[i].Tag-1;
                tempSB:=sbArr[i];
                inc(n);
              end;
          SB.Tag:=0;
        end;
    end
  else SB.Tag:=0;

  /////// delete

  //sbArr:=arrSort(sbArr);
  //s:='';
  //Form1.prListBoxFile.Clear;
  //if Length(sbArr)<>0 then
  //  for i:=0 to Length(sbArr)-1 do
  //    begin
  //      s:=s+sbArr[i].HelpKeyword+' tag-'+IntToStr(sbArr[i].Tag)+ #13#10;
  //    end;
  //showmessage(s);
  ///
end;



procedure ScaleBitmap(bitmap: TBitmap; width, height: Integer);
var
  TmpBmp: TBitmap;
begin
  TmpBmp := TBitmap.Create;
  try
    tmpbmp.Width := width;
    tmpbmp.Height := height;
    TmpBmp.Canvas.StretchDraw(Rect(0,0,width,height), Bitmap);
    bmpSave.Assign(TmpBmp);
  finally
    TmpBmp.Free;
  end;
end;



procedure BitmapUnion;
var
  sbArr: SpeedButtonArray;
  imgArr: array of TImage;
  ScrollBoxMaster, ChildScrollbox: TScrollBox;
  i,j,q: integer;
  p,W,H,OldBkMode: integer;
  bmp,bmp3: TBitmap;
begin
  //////////////// заносим кнопки SpeedButton в arrow
  SetLength(sbArr,0);
  for i:=0 to Form1.prPanelLang.ControlCount-1 do
    begin
      if (Form1.prPanelLang.Controls[i] is TSpeedButton) then
        if (Form1.prPanelLang.Controls[i] as TSpeedButton).Tag<>0 then
          begin
            SetLength(sbArr,Length(sbArr)+1);
            sbArr[High(sbArr)]:=(Form1.prPanelLang.Controls[i] as TSpeedButton);
          end;
    end;
  sbArr:=arrSort(sbArr);

  //////////////// заносим Timage в arrow
  SetLength(imgArr, 0);
  ScrollBoxMaster:=FindScrollBoxMaster;
  for i:=0 to High(sbArr) do
    for j:=0 to ScrollBoxMaster.ControlCount-1 do
      if (ScrollBoxMaster.Controls[j] is TScrollBox) then
        if (ScrollBoxMaster.Controls[j] as TScrollBox).HelpKeyword=sbArr[i].HelpKeyword then
          begin
            //ищем картинку и заносим в массив
            ChildScrollbox:=(ScrollBoxMaster.Controls[j] as TScrollBox);
            for q:=0 to ChildScrollbox.ControlCount-1 do
              if (ChildScrollbox.Controls[q] is TImage) then
                if (ChildScrollbox.Controls[q] as TImage).HelpKeyword=ChildScrollbox.HelpKeyword then
                  begin
                    SetLength(imgArr,Length(imgArr)+1);
                    imgArr[High(imgArr)]:=(ChildScrollbox.Controls[q] as TImage);
                  end;
          end;

  //////////////// склеиваем Bitmap из Timage что в массиве
  //////// Вычисляем W и H of bmp
  W:=0;
  H:=0;
  for i:=0 to High(imgArr) do
    begin
      if imgArr[i].Width>W then W:=imgArr[i].Width;
      H:= H+imgArr[i].Height;
    end;

  W:=1000;
  bmp:= TBitmap.Create;
  bmp.PixelFormat:=pf24bit;
  bmp.Width:= W;
  bmp.Height:= H;
  FillCanvasColor(bmp.Canvas, clWhite);
  OldBkMode := SetBkMode(bmp.Canvas.Handle, TRANSPARENT);

  p:=0;
  for i:=0 to High(imgArr) do
    begin
      bmp.Canvas.Draw(0, p, imgArr[i].Picture.Graphic);
      p:=p+imgArr[i].Height;
    end;

  SetBkMode(bmp.Canvas.Handle, OldBkMode);

  //ScaleBitmap(bmp,WidthByUser,HeightByUser(bmp,WidthByUser));
  bmpSave.Assign(bmp);
  bmp.Destroy;

end;


function WidthByUser: integer;
begin
  result:=Form4.rTrackBar_jpgDimension.Position*100;
end;
function HeightByUser(bmp: TBitmap; W: integer): integer;
var
  AspectRatio: Real;
begin
  AspectRatio:= (bmp.Height)/(bmp.Width);
  result:=Round(WidthByUser*AspectRatio);
end;


procedure SaveBitmapToJPG(bmp: TBitmap; SaveFileName: string; quality:TJPEGQualityRange);
var
  JPG: TJPEGImage;
begin
  JPG := TJPEGImage.Create;
  JPG.Assign(bmp);
  JPG.CompressionQuality:=quality; //0-100
  JPG.SaveToFile(SaveFileName);
  JPG.Free;
end;


procedure SetGenderToComboBox(ComboBox: TComboBox);
var
  sList, subsList:TStringList;
  i,n: integer;
begin
  sList := TStringList.create;
  subsList := TStringList.create;
  try
    sList.text := stringReplace(GenderListData, '|', LineEnding, [rfReplaceAll]);
    for i:=0 to sList.Count-1 do
      begin
        subsList.text := stringReplace(sList.Strings[i], '=', LineEnding, [rfReplaceAll]);
        ComboBox.Items.AddObject(subsList.Strings[1], TObject(strtoint(subsList.Strings[0])));
        ComboBox.ItemIndex:=0;
        subsList.Clear;
      end;
  finally
    subsList.Free;
    sList.free;
  end;
end;

procedure SetEthnicityToComboBox(ComboBox: TComboBox);
var
  sList, subsList:TStringList;
  i,n: integer;
begin
  sList := TStringList.create;
  subsList := TStringList.create;
  try
    sList.text := stringReplace(EthnicityListData, '|', LineEnding, [rfReplaceAll]);
    for i:=0 to sList.Count-1 do
      begin
        subsList.text := stringReplace(sList.Strings[i], '=', LineEnding, [rfReplaceAll]);
        ComboBox.Items.AddObject(subsList.Strings[1], TObject(strtoint(subsList.Strings[0])));
        ComboBox.ItemIndex:=16;
        subsList.Clear;
      end;
  finally
    subsList.Free;
    sList.free;
  end;
end;

procedure SetCountryToComboBox(arrComboBox: Array of TComboBox);
var
  sList, subsList:TStringList;
  i,j,n: integer;
begin
  sList := TStringList.create;
  subsList := TStringList.create;
  try
    sList.text := stringReplace(CountryListData, '|', LineEnding, [rfReplaceAll]);
    for i:=0 to sList.Count-1 do
      begin
        subsList.text := stringReplace(sList.Strings[i], '=', LineEnding, [rfReplaceAll]);
        for j:=0 to Length(arrComboBox)-1 do
          begin
            case arrComboBox[j].HelpKeyword of
              'Eng': n:=1;
              'Rus': n:=2;
            else n:=1 end;
            arrComboBox[j].Items.AddObject(subsList.Strings[n], TObject(strtoint(subsList.Strings[0])));
            arrComboBox[j].ItemIndex:=0;
          end;
        subsList.Clear;
      end;
  finally
    subsList.Free;
    sList.free;
  end;
end;
procedure SetCountryList;
begin
  SetLength(arrCountryComboBox,8);
  arrCountryComboBox[0]:=Form1.prEngComboBox_PCountry;
  arrCountryComboBox[1]:=Form1.prEngComboBox_OCountry;
  arrCountryComboBox[2]:=Form1.prRusComboBox_PCountry;
  arrCountryComboBox[3]:=Form1.prRusComboBox_OCountry;

  arrCountryComboBox[4]:=Form1.mrEngComboBox_PCountry;
  arrCountryComboBox[5]:=Form1.mrEngComboBox_OCountry;
  arrCountryComboBox[6]:=Form1.mrRusComboBox_PCountry;
  arrCountryComboBox[7]:=Form1.mrRusComboBox_OCountry;

  SetCountryToComboBox(arrCountryComboBox);
end;



//// get version Windows
procedure GetWindowsVersion(var Major: integer;
  var Minor: integer);
var
{$IFDEF WIN32}
  lpOS, lpOS2: POsVersionInfo;
{$ELSE}
  l: longint;
{$ENDIF}
begin
{$IFDEF WIN32}
  GetMem(lpOS, SizeOf(TOsVersionInfo));
  lpOs^.dwOSVersionInfoSize := SizeOf(TOsVersionInfo);
  while getVersionEx(lpOS) = false do begin
    GetMem(lpos2, lpos^.dwOSVersionInfoSize + 1);
    lpOs2^.dwOSVersionInfoSize := lpOs^.dwOSVersionInfoSize + 1;
    FreeMem(lpOs, lpOs^.dwOSVersionInfoSize);
    lpOS := lpOs2;
  end;
  Major := lpOs^.dwMajorVersion;
  Minor := lpOs^.dwMinorVersion;
  FreeMem(lpOs, lpOs^.dwOSVersionInfoSize);
{$ELSE}
  l := GetVersion;
  Major := LoByte(LoWord(l));
  Minor := HiByte(LoWord(l));
{$ENDIF}
end;

function GetWinVerMajor: integer;
var
  Major: integer;
  Minor: integer;
begin
  GetWindowsVersion(Major, Minor);
  result:= Major;
end;

function GetWinVerMinor: integer;
var
  Major: integer;
  Minor: integer;
begin
  GetWindowsVersion(Major, Minor);
  result:= Minor;
end;
/////


function FileVersion(AFileName: string): string;
var
  szName: array[0..255] of Char;
  P: Pointer;
  Value: Pointer;
  Len: UINT;
  GetTranslationString: string;
  FFileName: PChar;
  FValid: boolean;
  FSize: DWORD;
  FHandle: DWORD;
  FBuffer: PChar;
begin
  try
    FFileName := StrPCopy(StrAlloc(Length(AFileName) + 1), AFileName);
    FValid := False;
    FSize := GetFileVersionInfoSize(FFileName, FHandle);
    if FSize > 0 then
    try
      GetMem(FBuffer, FSize);
      FValid := GetFileVersionInfo(FFileName, FHandle, FSize, FBuffer);
    except
      FValid := False;
      raise;
    end;
    Result := '';
    if FValid then
      VerQueryValue(FBuffer, '\VarFileInfo\Translation', p, Len)
    else
      p := nil;
    if P <> nil then
      GetTranslationString := IntToHex(MakeLong(HiWord(Longint(P^)),
        LoWord(Longint(P^))), 8);
    if FValid then
    begin
      StrPCopy(szName, '\StringFileInfo\' + GetTranslationString +
        '\FileVersion');
      if VerQueryValue(FBuffer, szName, Value, Len) then
        Result := StrPas(PChar(Value));
    end;
  finally
    try
      if FBuffer <> nil then
        FreeMem(FBuffer, FSize);
    except
    end;
    try
      StrDispose(FFileName);
    except
    end;
  end;
end;

///// get Local Language
function GetLocaleLanguage: string; //example - "ru" or "en"
var
  arr: array [0..20] of Char;
begin
  if GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SISO639LANGNAME, arr, 19) <= 0 then
    arr[0] := #0;
  Result := arr;
end;
/////

function GetLocaleDateSeparator: string; //example - "." or "/"
var
  arr: array [0..20] of Char;
begin
  if GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SDATE, arr, 19) <= 0 then
    arr[0] := #0;
  Result := arr;
end;

function GetLocaleShortDate: string;  //example - "dd.MM.yyyy" or "M/d/yyyy"
var
  arr: array [0..20] of Char;
begin
  if GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SSHORTDATE, arr, 19) <= 0 then
    arr[0] := #0;
  Result := arr;
end;

function ConvertToSettingDateFormat(inDate:TDate):string;
var
  s: string;
begin
  //DateSeparator:= '/';
  s:=FormatDateTime('dd.MM.yyyy', inDate);
  result:= s;
end;

function ConvertToLocaleDateFormat(inDate:string):TDate;
var
  s,sFormat,sLocale,sSeparator: string;
  Ch: Char;
begin
  sLocale:= GetLocaleLanguage;
  sFormat:= ShortDateFormat;
  sSeparator:= DateSeparator;
  DateSeparator := '.';
  ShortDateFormat:= 'dd.MM.yyyy';
  s:=FormatDateTime(Locale_DateFormat, StrToDateTime(inDate));
  ShortDateFormat:= sFormat;
  Ch := sSeparator[1];
  //DateSeparator:= Ch; //proplem not solved
  result:= StrToDate(s);
end;


////////////

procedure MyPause(p:integer);  // p - пауза в милисекукундах
var pp:TDateTime;
    h,m,s,ms:Integer;
begin
  h:=trunc(p/3600000);
  m:=trunc((p-3600000*h)/60000);
  s:=trunc((p-3600000*h-60000*m)/1000);
  ms:=p-3600000*h-60000*m-1000*s;
  pp:=EncodeTime(h,m,s,ms)+now;
  repeat
    application.processmessages;
    sleep(50);
  until now>=pp;
end;

function RavnoDel(s:string):string;
begin
  result:=stringReplace(s, '=', '', [rfReplaceAll]);
end;

function UserCommentStr: string;
var
  ssCountryID, ssEthnicityID: string;
begin
  case GetPageName of
    'mr': ////////////////////////////// Model Release
      begin
        ssCountryID:=IntToStr(Integer(Form1.mrEngComboBox_OCountry.Items.Objects[Form1.mrEngComboBox_OCountry.ItemIndex]));
        ssEthnicityID:=IntToStr(Integer(Form1.mrComboBox_ssEthnicity.Items.Objects[Form1.mrComboBox_ssEthnicity.ItemIndex]));
        result:= 'Type='           +'model'                                  +LineEnding+
                 'Shooting date='  +Form1.mrEngEdit_PShootDate.Text          +LineEnding+
                 'First name='     +RavnoDel(Form1.mrEdit_ssFirstName.Text)  +LineEnding+
                 'Last name='      +RavnoDel(Form1.mrEdit_ssLastName.Text)   +LineEnding+
                 'Gender='         +Form1.mrComboBox__ssGender.Text          +LineEnding+
                 'Birth date='     +Form1.mrEngEdit_ODateBirth.Text          +LineEnding+
                 'Ethnicity='      +ssEthnicityID                            +LineEnding+
                 'Country='        +ssCountryID                              +LineEnding+
                 'Model photo='    +RavnoDel(Form1.mrEdit_ssModelPhoto.Text) +LineEnding+
                 'Note='           +RavnoDel(Form1.mrEdit_ssNote.Text);
      end;
    'mrm': ////////////////////////////// Model Release (minor)
      begin
        result:='';
      end;
    'pr': ////////////////////////////// Property Release
      begin
        ssCountryID:=IntToStr(Integer(Form1.prEngComboBox_OCountry.Items.Objects[Form1.prEngComboBox_OCountry.ItemIndex]));
        result:= 'Type='           +'property'                               +LineEnding+
                 'Shooting date='  +Form1.prEngEdit_ODate.Text               +LineEnding+
                 'Name='           +RavnoDel(prssReleaseName)                +LineEnding+
                 'Property owner=' +RavnoDel(Form1.prEngEdit_OName.Text)     +LineEnding+
                 'Country='        +ssCountryID                              +LineEnding+
                 'Model photo='    +RavnoDel(Form1.prEdit_ssModelPhoto.Text) +LineEnding+
                 'Note='           +RavnoDel(Form1.prEdit_ssNote.Text);
      end;
    'prA': ////////////////////////////// Temp
      begin
        result:='';
      end
    else ////////////////////////////
      begin
        result:='';
      end
    end;
end;

procedure WriteUserComment(doit:boolean; FileName: string);   // r^ - read as "Release"
var
  AProcess: TProcess;
  str: string;
begin
  While FileStatus(FileName)=false do MyPause(500);
  if (doit) and (Form4.rCheckBox_UseDate.Checked) then
    begin
      AProcess := TProcess.Create(nil);
      try
        str:= 'RTUC'+EncodeStringBase64(UserCommentStr);
        AProcess.CommandLine := UTF8toSys('sys\exiftool.exe  -overwrite_original -UserComment="'+str+'" "'+FileName+'"');
        AProcess.ShowWindow := swoHIDE;
        AProcess.Execute;
      finally
        AProcess.Free;
      end;
    end;
end;



procedure ReadTitleFromFile(const FileName: string; var fTitle: string);
var
  AProcess: TProcess;
  AStringList: TStringList;
  fDate: TDateTime;
begin
  AProcess := TProcess.Create(nil);
  AStringList := TStringList.Create;
  AProcess.CommandLine := UTF8toSys('sys\exiftool.exe -d "%d.%m.%Y" -s3 -title -createdate "'+FileName+'"');
  AProcess.Options := AProcess.Options + [poUsePipes];
  //AProcess.Options := AProcess.Options + [poNoConsole];     //закоментить чтобы скрывало
  AProcess.ShowWindow := swoHIDE;
  AProcess.Execute;
  AStringList.LoadFromStream(AProcess.Output);
  if AStringList.Count>1 then
    begin
      fTitle:=AStringList.Strings[0];
      //fDate:=StrToDateTime(AStringList.Strings[1]);    // если бы мы брали дату из IPTC
    end
  else
    begin
      fTitle:='';
      //fDate:=StrToDateTime('');
    end;
  AStringList.Free;
  AProcess.Free;
end;

procedure StretchDrawBitmapToBitmap(SourceBitmap, DestBitmap: TBitmap; DestWidth, DestHeight: integer);
var
  DestIntfImage, SourceIntfImage: TLazIntfImage;
  DestCanvas: TLazCanvas;
begin
  DestIntfImage:= TLazIntfImage.Create(0, 0);
  DestIntfImage.LoadFromBitmap(DestBitmap.Handle, 0);
  DestCanvas:= TLazCanvas.Create(DestIntfImage);

  SourceIntfImage:= TLazIntfImage.Create(0, 0);
  SourceIntfImage.LoadFromBitmap(SourceBitmap.Handle, 0);

  DestCanvas.Interpolation:= TFPSharpInterpolation.Create;
  DestCanvas.StretchDraw(0, 0, DestWidth, DestHeight, SourceIntfImage);
  DestBitmap.LoadFromIntfImage(DestIntfImage);

  SourceIntfImage.Free;
  DestCanvas.Interpolation.Free;
  DestCanvas.Free;
  DestIntfImage.Free;
end;


procedure FillCanvasColor(Canvas:TCanvas; Color:TColor);
var
  TempBrush : TBrush;
begin
  TempBrush := TBrush.Create;
  try
    with Canvas do
      begin
        TempBrush.Assign(Brush);
        Brush.Color := Color;
        Brush.Style := bsSolid;
        FillRect(ClipRect);
        Brush.Assign(TempBrush);
      end;
  finally
  TempBrush.Free;
  end;
end;

procedure BakePanelControlsToForm(sketchPanel: TPanel; bmp: TBitmap);
var
  i: integer;
  imgTemp: TImage;
  bmpTemp: TBitmap;
begin
  if sketchPanel.ControlCount>0 then
    for i:=0 to sketchPanel.ControlCount-1 do
      begin
       if sketchPanel.Controls[i] is TImage then
         imgTemp:=(sketchPanel.Controls[i] as TImage);
        bmpTemp:= TBitmap.Create;
        bmpTemp.PixelFormat:=pf4bit;
        bmpTemp.Transparent:=true;
        bmpTemp.Width := imgTemp.Width;
        bmpTemp.Height := imgTemp.Height;
        StretchDrawBitmapToBitmap(imgTemp.Picture.Bitmap, bmpTemp, imgTemp.Width, imgTemp.Height);
        bmp.Canvas.Draw(sketchPanel.Left+imgTemp.Left+2, sketchPanel.Top+imgTemp.Top+2, bmpTemp);
        bmpTemp.Destroy;
      end;
end;


function Proportional_TPictureToTImageSizeHeight(Pic:TPicture; Img: TImage): integer; //make proportional TImage size Height
begin
  result:=Img.Width*Pic.Height div Pic.Width;
end;

function Proportional_TPictureToTImageSizeWidth(Pic:TPicture; Img: TImage): integer; //make proportional TImage size Width
begin
  result:=Img.Height*Pic.Width div Pic.Height;
end;

procedure SetSketchImgProperty(img: TImage);
begin
  img.Proportional := true;
  img.Stretch := true;

  if img.Picture.Width>img.Picture.Height then
    begin
      img.Width := Form1.prPanelRef.Width div 2;
      img.Height:= Proportional_TPictureToTImageSizeHeight(img.Picture, img);
    end;
  if img.Picture.Width<=img.Picture.Height then
    begin
      img.Height := Form1.prPanelRef.Height-10;
      img.Width:= Proportional_TPictureToTImageSizeWidth(img.Picture, img);
    end;
end;

procedure AddSketchImgToForm(SketchFile: string);
var
  img: TImage;
  j: integer;
begin
  if FileExistsUTF8(SketchFile) then
    begin
      j:=Form1.prPanelRef.ControlCount;
      img:= TImage.Create(nil);
      img.Name := 'Sktch_'+IntToStr(j+1);
      img.Left := j*20;
      img.Top := j*20;
      img.Cursor:=crSizeAll;
      img.ShowHint:=true;
      img.Hint:=SketchFile;
      img.ParentShowHint:=false;
      img.Transparent:=true;
      img.HelpKeyword:=SketchFile;
      img.Picture.LoadFromFile(SketchFile);
      img.AntialiasingMode:=amOn;
      img.Parent:=Form1.prPanelRef;

      SetSketchImgProperty(img);

      img.OnMouseWheelDown:= @Form1.MyMouseWheelDown;
      img.OnMouseWheelUp:= @Form1.MyMouseWheelUp;
      img.OnMouseDown := @Form1.MyMouseDown;
      img.OnMouseUp := @Form1.MyMouseUp;
      img.OnMouseMove := @Form1.MyMouseMove;
    end;
end;


procedure GoToCropIMG(SrcImg,DstImg: TImage);
begin
  Form2.Position:=poMainFormCenter;
  Form2.Left:=Form1.Left;
  Form2.Top:=Form1.Top;
  DstImg.Picture.Clear;
  DstImg.Picture.Bitmap:=SrcImg.Picture.Bitmap;

  if (DstImg.Picture.Width>=Screen.Width) or (DstImg.Picture.Height>=Screen.Height) then
    begin
      DstImg.Stretch:=true;
      Form2.WindowState:=wsMaximized;

    end
  else
    begin
      DstImg.Stretch:=false;
      Form2.WindowState:=wsNormal;
      DstImg.Width:=DstImg.Picture.Width;
      DstImg.Height:=DstImg.Picture.Height;
      Form2.Width:=DstImg.Picture.Width;
      Form2.Height:=DstImg.Picture.Height;
    end;
end;

procedure SwapIfMinus(var c1,c2:integer);
var c:integer;
begin
  if c1>c2 then
    begin
      c:=c1;
      c1:=c2;
      c2:=c;
    end
  else
    begin

    end;
end;

function RectReSize(FakeRect:TRect; IndexResize: Real):TRect;
begin
  result.Left:=Round(FakeRect.Left*IndexResize);
  result.Top:=Round(FakeRect.Top*IndexResize);
  result.Right:=Round(FakeRect.Right*IndexResize);
  result.Bottom:=Round(FakeRect.Bottom*IndexResize);
end;

Procedure RotateBitmap90(Const Bitmap: TBitmap);
var
  tmp: TBitmap;
  src, dst: TLazIntfImage;
  ImgHandle, ImgMaskHandle: HBitmap;
  i, j, t, u, v: integer;
begin
  tmp:= TBitmap.create;
  tmp.Width:= Bitmap.Height;
  tmp.Height:= Bitmap.Width;
  dst:= TLazIntfImage.Create(0, 0);
  dst.LoadFromBitmap(tmp.Handle, tmp.MaskHandle);
  src:= TLazIntfImage.Create(0, 0);
  src.LoadFromBitmap(bitmap.Handle, bitmap.MaskHandle);
  u:= bitmap.width - 1;
  v:= bitmap.height - 1;
  for i:= 0 to u do
    begin
      t:= u - i;
      for j:= 0 to v do
        dst.Colors[j, t]:= src.Colors[i, j];
    end;
  dst.CreateBitmaps(ImgHandle, ImgMaskHandle, false);
  tmp.Handle:= ImgHandle;
  tmp.MaskHandle:= ImgMaskHandle;
  dst.Free;
  bitmap.Assign(tmp);
  tmp.Free;
  src.Free;
End;

Procedure RotateTImage(img: TImage);
var
  MemBMP: TMemoryStream;
  W,H: integer;
begin
  MemBMP := TMemoryStream.Create;
  try
    img.Picture.bitmap.SaveToStream(MemBMP);
    MemBMP.Position:= 0;
    W:= img.Height;
    H:= img.Width;
    img.Height:= H;
    img.Width:= W;
    img.Picture.bitmap.LoadFromStream(MemBMP);
    img.repaint;
  finally
    MemBMP.Free;
  end;
end;

function CutStringUpTo(str: string; n: integer): string;
begin
  if Form4.prCheckBoxUseSS_Compatibility.Checked=true then
    if Length(str)>n then
        UTF8Delete(str, n+1, UTF8Length(str)-n);
  result:=str
end;


function GetDateLastGhange(f: string): TDateTime;   ///  0 способ
begin
  result:=FileDateToDateTime(FileAge(UTF8toSys(f)));
end;




procedure ChangeSizeBakeText(aListBox: TListBox; bm: TBitmap; desX,desY: integer);
var
  i,n,m: integer;
  IndexStr,TitleTemp: string;
begin
  if (aListBox.Count>0) then
    if Form1.prCheckBox_OneReleasePerFile.Checked=true then
      begin
        if aListBox.SelCount<>0 then
          bm.Canvas.TextOut(desX, desY, myF[aListBox.Items.IndexOf(aListBox.GetSelectedText)].Title);
      end
    else
      begin
        case aListBox.Count of
          1..2:
            begin
              m:=20;
              n:=desY;
              bm.Canvas.Font.Size:=12;
            end;
          3..4:
            begin
              m:=16;
              n:=desY-3;
              bm.Canvas.Font.Size:=11;
            end;
          5..5:
            begin
              m:=14;
              n:=desY-5;
              bm.Canvas.Font.Size:=9;
            end
        else
          Showmessage(Trl_CountFilesError_TooManyFiles+#10#13+'('+Trl_mustBeLessThan+IntToStr(5)+Trl__files+')');
        end;
        for i:=0 to aListBox.Count-1 do
          begin
            if aListBox.Count=1 then IndexStr:='' else IndexStr:=IntToStr(i+1)+') ';
            TitleTemp:= myF[i].Title;
            bm.Canvas.TextOut(desX, n, IndexStr+TitleTemp);
            inc(n,m);
          end;
      end;
end;

function MouseInSpeedButton(WC:TSpeedButton):boolean;     //WC:TWincontrol
var x1,x2,y1,y2:INTEGER;
ptm:tpoint;
begin
 ptm:=Mouse.CursorPos;
 x1:=Wc.ClientOrigin.x;
 y1:=Wc.ClientOrigin.y;
 x2:=x1+Wc.ClientWidth;
 y2:=y1+Wc.ClientHeight;
 result:=(ptm.x>=x1) and (ptm.x<=x2) and (ptm.y>=y1)and(ptm.y<=y2);
end;

function MouseInEdit(WC:TEdit):boolean;     //WC:TWincontrol
var x1,x2,y1,y2:INTEGER;
ptm:tpoint;
begin
 ptm:=Mouse.CursorPos;
 x1:=Wc.ClientOrigin.x;
 y1:=Wc.ClientOrigin.y;
 x2:=x1+Wc.ClientWidth;
 y2:=y1+Wc.ClientHeight;
 result:=(ptm.x>=x1) and (ptm.x<=x2) and (ptm.y>=y1)and(ptm.y<=y2);
end;





procedure MyRepaint;
begin
  with Form1 do
    begin
      case GetPageName of
        'mr': ////////////////////////////// Model Release
          begin
            if rSBformENG.Tag<>0 then mrImageFormENG.Repaint;
            if rSBformRUS.Tag<>0 then mrImageFormRUS.Repaint;
            if rSBformRef.Tag<>0 then mrImageFormRef.Repaint;
          end;
        'mrm': ////////////////////////////// Model Release (minor)
          begin

          end;
        'pr': ////////////////////////////// Property Release
          begin
            if rSBformENG.Tag<>0 then prImageFormENG.Repaint;
            if rSBformRUS.Tag<>0 then prImageFormRUS.Repaint;
            if rSBformRef.Tag<>0 then prImageFormRef.Repaint;
          end;
        'prA': //////////////////////////////  Temp
          begin

          end
        else
          begin

          end
        end;
    end;
end;


function StrIsInteger(s: String): boolean;
var
  iValue, iCode: Integer;
begin
  Val(s, iValue, iCode);
  if iCode = 0 then
    result:= true
  else
    result:= false;
end;

procedure ifSelf_ComboBox(ComboFrom: TObject; ComboTo: TComboBox);
begin
  if Form1.rCheckBox_Self.Checked then ComboTo.ItemIndex:=(ComboFrom as TComboBox).ItemIndex;
end;



function FileStatus(const fullfilename: string): boolean;   //true если файл не заблокирован
var
  fl: TFileStream;
begin
  try
    fl:= TFileStream.Create(UTF8toSys(fullfilename), fmOpenReadWrite or fmShareExclusive);
    try
      Result := true;
    finally
      fl.Free;
    end;
  except
    Result := false;
  end;
end;


procedure OpenLink(Link: string);
var
   browser, pars : string;
   myProcess : TProcessUTF8;
begin
   FindDefaultBrowser(Browser, pars);
   myProcess := TProcessUTF8.Create(nil);
   with myProcess do
     try
        CommandLine := Browser + ' ' + Format(pars, [Link]);
        Execute;
     finally
        Free;
     end;
end;


end.
