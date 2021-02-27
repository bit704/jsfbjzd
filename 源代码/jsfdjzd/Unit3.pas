unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls,
  Unit5, DBCtrls, ExtCtrls;

type
  TMainForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADODataSetjs: TADODataSet;
    DBGrid1: TDBGrid;
    DataSourcejs: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Editdwmc: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    ADODataSetzdls: TADODataSet;
    DataSourcezdls: TDataSource;
    DBGrid2: TDBGrid;
    ADODataSetdw: TADODataSet;
    DataSourcedw: TDataSource;
    DBGrid3: TDBGrid;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    ComboBox3: TComboBox;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    ComboBox4: TComboBox;
    Button3: TButton;
    Button4: TButton;
    RadioGroup1: TRadioGroup;
    GroupBox4: TGroupBox;
    ComboBox5: TComboBox;
    DBGrid4: TDBGrid;
    Button5: TButton;
    DataSourcedwgc: TDataSource;
    ADODataSetdwgc: TADODataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm1: TMainForm1;

implementation

{$R *.dfm}

procedure TMainForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate; {必须有}
end;

procedure TMainForm1.FormCreate(Sender: TObject);
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
    
  MainForm1.Caption:='大学生竞赛发布及组队系统--当前用户学号:'+wdxh;

  with ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('select jsdh from js');
    open;
    while not eof do
    begin
      ComboBox1.Items.Add(Fieldbyname('jsdh').AsString);  {竞赛下拉框}
      next;
    end;
    
    SQL.Clear;
    SQL.Add('select xm,gh from zdls');
    open;
    while not eof do
    begin
      ComboBox2.Items.Add(Fieldbyname('xm').AsString+'('+Fieldbyname('gh').AsString+')'); {指导老师下拉框}
      next;
    end;

    SQL.Clear;
    SQL.Add('select dwmc,dwdh from dw');
    open;
    while not eof do
    begin
      ComboBox3.Items.Add(Fieldbyname('dwmc').AsString+'('+Fieldbyname('dwdh').AsString+')'); {队伍下拉框}
      ComboBox5.Items.Add(Fieldbyname('dwmc').AsString+'('+Fieldbyname('dwdh').AsString+')');
      next;
    end;

    SQL.Clear;
    SQL.Add('select xm,xs.xh from dwsq,xs,dw where xs.xh=dwsq.cyxh and dwsq.dwdh=dw.dwdh and dw.dzxh=:wdxh');
    Parameters.ParamByName('wdxh').Value:=wdxh;
    open;
    while not eof do
    begin
      ComboBox4.Items.Add(Fieldbyname('xm').AsString+'('+Fieldbyname('xh').AsString+')');  {入队申请下拉框}
      next;
    end;
  end;


  ADODataSetjs.CommandText:='select jsdh 竞赛代号,jsmc 竞赛名称,zbdw 主办单位,begindate 开始日期,enddate 结束日期,teamrule 组队规则 from js';
  ADODataSetjs.Open;
  ADODataSetzdls.CommandText:='select xm 指导老师姓名, gh 工号, xymc 学院, sjh 手机号, zc 职称 from zdls,xy where zdls.xydh=xy.xydh';
  ADODataSetzdls.Open;
  ADODataSetdw.CommandText:='select dwdh 队伍代号,dwmc 队伍名称,xs.xm 队长,js.jsdh 竞赛代号,zdls.xm 指导老师,zt 队伍状态 from dw,xs,js,zdls where xs.xh=dw.dzxh and js.jsdh=dw.jsdh and zdls.gh=dw.zdgh';
  ADODataSetdw.Open;

  with ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('select zt from dw where dzxh=:wdxh');
    Parameters.ParamByName('wdxh').Value:=wdxh;
    open;
    if Fieldbyname('zt').AsString='审核通过' then
    begin
      RadioGroup1.ItemIndex:=1;
    end
    else
    begin
      RadioGroup1.ItemIndex:=0;
    end;
  end;
end;

procedure TMainForm1.Button1Click(Sender: TObject);   {创建队伍}
var
  dwmc:string;
  lsxx:string;
  strs:TStrings;
  dwsl:integer;
  dwdh:string;
  jsdh:string;
  zdgh:string;
begin
  dwmc:=trim(Editdwmc.Text);
  jsdh:=trim(ComboBox1.Text);
  lsxx:=trim(ComboBox2.Text);
  if (dwmc='') or (jsdh='') or (lsxx='') then
  begin
    ShowMessage('信息未填写完全');
    exit;
  end;
  with ADOQuery1 do
  begin
    {创建队伍}
    SQL.Clear;
    SQL.Add('select count(*) c from dw');
    open;
    dwsl:=Fieldbyname('c').AsInteger+1;
    dwdh:=inttostr(dwsl);

    strs:=TStringList.Create;
    strs.Delimiter := '(';
    strs.DelimitedText:=lsxx;
    zdgh:=strs[1];
    zdgh:=copy(zdgh,1,10);

    SQL.Clear;
    SQL.Add('insert into dw values (:dwdh,:dwmc,:dzxh,:jsdh,:zdgh,:zt)');
    Parameters.ParamByName('dwdh').Value:=dwdh;
    Parameters.ParamByName('dwmc').Value:=dwmc;
    Parameters.ParamByName('dzxh').Value:=wdxh;
    Parameters.ParamByName('jsdh').Value:=jsdh;
    Parameters.ParamByName('zdgh').Value:=zdgh;
    Parameters.ParamByName('zt').Value:='组队中';
    ExecSQL;
  end;
  
  ShowMessage('创建成功');

  with ADODataSetdw do
  begin
    Close;
    CommandText:='select dwdh 队伍代号,dwmc 队伍名称,xs.xm 队长,js.jsdh 竞赛代号,zdls.xm 指导老师, zt 队伍状态 from dw,xs,js,zdls where xs.xh=dw.dzxh and js.jsdh=dw.jsdh and zdls.gh=dw.zdgh';
    Open;
  end;
    
  with ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('insert into dwgc values (:dwdh,:wdxh)');
    Parameters.ParamByName('wdxh').Value:=wdxh;
    Parameters.ParamByName('dwdh').Value:=dwdh;
    ExecSQL;
  end;

end;

procedure TMainForm1.Button2Click(Sender: TObject);  {提交申请}
var
  dwxx:string;
  dwdh:string;
  strs:TStrings;
begin
  dwxx:=trim(ComboBox3.Text);
  with ADOQuery1 do
  begin
    strs:=TStringList.Create;
    strs.Delimiter := '(';
    strs.DelimitedText:=dwxx;
    dwdh:=strs[1];
    dwdh:=copy(dwdh,1,5);

    SQL.Clear;
    SQL.Add('insert into dwsq values (:dwdh,:wdxh)');
    Parameters.ParamByName('wdxh').Value:=wdxh;
    Parameters.ParamByName('dwdh').Value:=dwdh;
    ExecSQL;

    ShowMessage('提交成功');
  end;
end;

procedure TMainForm1.Button3Click(Sender: TObject);   {同意入队申请}
var
  xx:string;
  xh:string;
  strs:TStrings;
  dwdh:string;
begin
  xx:=trim(ComboBox4.Text);
  if xx='' then
  begin
    ShowMessage('申请人为空');
    exit;
  end;
  strs:=TStringList.Create;
  strs.Delimiter := '(';
  strs.DelimitedText:=xx;
  xh:=strs[1];
  xh:=copy(xh,1,10);
  with ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('select dwdh from dw where dzxh=:wdxh');
    Parameters.ParamByName('wdxh').Value:=wdxh;
    open;
    dwdh:=Fieldbyname('dwdh').AsString;
    if dwdh='' then
    begin
      ShowMessage('你不是队长');
      exit;
    end;

    SQL.Clear;
    SQL.Add('insert into dwgc values (:dwdh,:cyxh)');
    Parameters.ParamByName('dwdh').Value:=dwdh;
    Parameters.ParamByName('cyxh').Value:=xh;
    ExecSQL;

    SQL.Clear;
    SQL.Add('delete from dwsq where dwdh=:dwdh and cyxh=:cyxh');
    Parameters.ParamByName('dwdh').Value:=dwdh;
    Parameters.ParamByName('cyxh').Value:=xh;
    ExecSQL;
    
    ShowMessage('已同意');

    ComboBox4.Clear;
    SQL.Clear;
    SQL.Add('select xm,xs.xh from dwsq,xs,dw where xs.xh=dwsq.cyxh and dwsq.dwdh=dw.dwdh and dw.dzxh=:wdxh');
    Parameters.ParamByName('wdxh').Value:=wdxh;
    open;
    while not eof do
    begin
      ComboBox4.Items.Add(Fieldbyname('xm').AsString+'('+Fieldbyname('xh').AsString+')');  {入队申请下拉框}
      next;
    end;
    
  end;
end;

procedure TMainForm1.Button4Click(Sender: TObject);   {拒绝入队申请}
var
  xx:string;
  xh:string;
  strs:TStrings;
  dwdh:string;
begin
  xx:=trim(ComboBox4.Text);
  if xx='' then
  begin
    ShowMessage('申请人为空');
    exit;
  end;
  strs:=TStringList.Create;
  strs.Delimiter := '(';
  strs.DelimitedText:=xx;
  xh:=strs[1];
  xh:=copy(xh,1,10);
  with ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('select dwdh from dw where dzxh=:wdxh');
    Parameters.ParamByName('wdxh').Value:=wdxh;
    open;
    dwdh:=Fieldbyname('dwdh').AsString;
    if dwdh='' then
    begin
      ShowMessage('你不是队长');
      exit;
    end;

    SQL.Clear;
    SQL.Add('delete from dwsq where dwdh=:dwdh and cyxh=:cyxh');
    Parameters.ParamByName('dwdh').Value:=dwdh;
    Parameters.ParamByName('cyxh').Value:=xh;
    ExecSQL;

    ShowMessage('已拒绝');
    ComboBox4.Clear;

    SQL.Clear;
    SQL.Add('select xm,xs.xh from dwsq,xs,dw where xs.xh=dwsq.cyxh and dwsq.dwdh=dw.dwdh and dw.dzxh=:wdxh');
    Parameters.ParamByName('wdxh').Value:=wdxh;
    open;
    while not eof do
    begin
      ComboBox4.Items.Add(Fieldbyname('xm').AsString+'('+Fieldbyname('xh').AsString+')');  {入队申请下拉框}
      next;
    end;
  end;

end;

procedure TMainForm1.Button5Click(Sender: TObject);  {查看队伍组成}
var
  dwdh:string;
  dwxx:string;
  strs:TStrings;
begin
  dwxx:=trim(ComboBox5.Text);
  strs:=TStringList.Create;
  strs.Delimiter:='(';
  strs.DelimitedText:=dwxx;
  dwdh:=strs[1];
  dwdh:=copy(dwdh,1,5);

  with ADODataSetdwgc do
  begin
    Close;
    CommandText:='select xm 姓名,cyxh 学号 from dwgc,xs where xs.xh=cyxh and dwdh=:dwdh';
    Parameters.ParamByName('dwdh').Value:=dwdh;
    Open;
  end;
end;

end.
