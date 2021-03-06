unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, Mask;

type
  TMainForm2 = class(TForm)
    DBGrid1: TDBGrid;
    ADODataSetjs: TADODataSet;
    DataSourcejs: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Editjsmc: TEdit;
    Editzbdw: TEdit;
    Editrule: TEdit;
    MaskEditb: TMaskEdit;
    MaskEdite: TMaskEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DBGrid3: TDBGrid;
    ADODataSetdw: TADODataSet;
    DataSourcedw: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm2: TMainForm2;

implementation

{$R *.dfm}

procedure TMainForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate; {必须有}
end;

procedure TMainForm2.FormCreate(Sender: TObject);
begin
  with ADOConnection1 do
    begin
      Connected := False;
      ConnectionString  := 'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=user1;Initial Catalog=jsfbjzd;password =123456;Data Source=.';
      try
        Connected:=True;  
      except
        ShowMessage('not connected');
        raise;
        Exit;
      end;
    end;

  with ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('select dwmc,dwdh from dw');
    open;
    while not eof do
    begin
      ComboBox1.Items.Add(Fieldbyname('dwmc').AsString+'('+Fieldbyname('dwdh').AsString+')'); {队伍下拉框}
      next;
    end;
  end;

  ADODataSetjs.CommandText:='select jsdh 竞赛代号,jsmc 竞赛名称,zbdw 主办单位,begindate 开始日期,enddate 结束日期,teamrule 组队规则 from js';
  ADODataSetjs.Open;
  ADODataSetdw.CommandText:='select dwdh 队伍代号,dwmc 队伍名称,xs.xm 队长,js.jsdh 竞赛代号,zdls.xm 指导老师,zt 队伍状态 from dw,xs,js,zdls where xs.xh=dw.dzxh and js.jsdh=dw.jsdh and zdls.gh=dw.zdgh';
  ADODataSetdw.Open;
end;

procedure TMainForm2.Button1Click(Sender: TObject);  {发布竞赛}
var
  num:integer;
  jsdh:string;
  jsmc:string;
  zbdw:string;
  begindate:string;
  enddate:string;
  rule:string;
begin
  jsmc:=trim(Editjsmc.Text);
  zbdw:=trim(Editzbdw.Text);
  begindate:=trim(MaskEditb.Text);
  enddate:=trim(MaskEdite.Text);
  rule:=trim(Editrule.Text);

  if (jsmc='') or (zbdw='') or (begindate='') or (enddate='') or (rule='') then
  begin
    ShowMessage('信息没有填写完全');
    exit;
  end;
  with ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('select count(*) c from js');
    open;
    num:=Fieldbyname('c').AsInteger+1;
    jsdh:=inttostr(num);

    SQL.Clear;
    SQL.Add('insert into js values (:jsdh,:jsmc,:zbdw,:begindate,:enddate,:rule)');
    Parameters.ParamByName('jsdh').Value:=jsdh;
    Parameters.ParamByName('jsmc').Value:=jsmc;
    Parameters.ParamByName('zbdw').Value:=zbdw;
    Parameters.ParamByName('begindate').Value:=begindate;
    Parameters.ParamByName('enddate').Value:=enddate;
    Parameters.ParamByName('rule').Value:=rule;
    ExecSQL;

    ShowMessage('发布完成');
  end;
  ADODataSetjs.Close;
  ADODataSetjs.CommandText:='select jsdh 竞赛代号,jsmc 竞赛名称,zbdw 主办单位,begindate 开始日期,enddate 结束日期,teamrule 组队规则 from js';
  ADODataSetjs.Open;
  
end;

procedure TMainForm2.Button2Click(Sender: TObject);  {审核队伍}
var
  strs:TStrings;
  dwdh:string;
  dwxx:string;
begin
  dwxx:=trim(ComboBox1.Text);
  strs:=TStringList.Create;
  strs.Delimiter:='(';
  strs.DelimitedText:=dwxx;
  dwdh:=strs[1];

  with ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('update dw set zt=:zt where dwdh=:dwdh');
    Parameters.ParamByName('dwdh').Value:=dwdh;
    Parameters.ParamByName('zt').Value:='审核通过';
    ExecSQL;
  end;

  ShowMessage('审核通过');

  ADODataSetdw.Close;
  ADODataSetdw.CommandText:='select dwdh 队伍代号,dwmc 队伍名称,xs.xm 队长,js.jsdh 竞赛代号,zdls.xm 指导老师,zt 队伍状态 from dw,xs,js,zdls where xs.xh=dw.dzxh and js.jsdh=dw.jsdh and zdls.gh=dw.zdgh';
  ADODataSetdw.Open;
end;

end.
