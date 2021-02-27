unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, ADODB;


type
  TRegisterForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ButtonRegister: TButton;
    EditName: TEdit;
    EditPassword: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MaskEditXh: TMaskEdit;
    MaskEditSjh: TMaskEdit;
    Label6: TLabel;
    EditRName: TEdit;
    ADOQuery1: TADOQuery;
    ComboBox1: TComboBox;
    ADOConnection1: TADOConnection;
    procedure ButtonRegisterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterForm: TRegisterForm;

implementation

{$R *.dfm}


procedure TRegisterForm.ButtonRegisterClick(Sender: TObject);
var
  username:string;
  password:string;
  realname:string;
  xh:string;
  xydh:string;
  sjh:string;
begin
  username:=trim(EditName.Text);
  password:=trim(EditPassword.Text);
  realname:=trim(EditRName.Text);
  xh:=trim(MaskEditXh.Text);
  sjh:=trim(MaskEditSjh.Text);
  if (username='') or (password='') then
  begin
    ShowMessage('用户名或密码为空');
    exit;
  end;

  with ADOQuery1 do
     begin
     SQL.Clear;
     SQL.Add('select * from users where username=:username');
     Parameters.ParamByName('username').Value:=username;
     open;
     if not(ADOQuery1.IsEmpty) then
     begin
       ShowMessage('用户已存在');
       exit;
     end;

     SQL.Clear;
     SQL.Add('select xydh from xy where xymc=:xymc');
     Parameters.ParamByName('xymc').Value:= ComboBox1.Text;
     open;
     xydh:=Fieldbyname('xydh').AsString;
          
     if (xydh='') or (realname='') or (xh='') or (sjh='') then
     begin
       ShowMessage('信息未填写完全');
       exit;
     end;

     SQL.Clear;
     SQL.Add('insert into users values(:username,:password,:xh,:therole)');
     Parameters.ParamByName('username').Value:=username;
     Parameters.ParamByName('password').Value:=password;
     Parameters.ParamByName('xh').Value:=xh;
     Parameters.ParamByName('therole').Value:='0';
     ExecSQL;

     SQL.Clear;
     SQL.Add('insert into xs values(:xm,:xh,:xydh,:sjh)');
     Parameters.ParamByName('xm').Value:=realname;
     Parameters.ParamByName('xh').Value:=xh;
     Parameters.ParamByName('xydh').Value:=xydh;
     Parameters.ParamByName('sjh').Value:=sjh;
     ExecSQL;
     ShowMessage('注册成功');
     RegisterForm.Hide;
  end;
end;


procedure TRegisterForm.FormCreate(Sender: TObject);
var xymc:string;
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
     SQL.Add('select xymc from xy');
     open;
     while not eof do
     begin
        xymc:=Fieldbyname('xymc').AsString;
        next;
        ComboBox1.Items.Add(xymc);
     end;
   end;
end;

end.
