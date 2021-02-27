unit unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  Unit2, Unit3, Unit4, Unit5, DB, ADODB, ExtCtrls;

type
  TLoginForm = class(TForm)
    ButtonLogin: TButton;
    ButtonRegister: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EditName: TEdit;
    EditPassword: TEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    RadioGroup1: TRadioGroup;
    procedure ButtonRegisterClick(Sender: TObject);
    procedure ButtonLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;


implementation

{$R *.dfm}



procedure TLoginForm.ButtonRegisterClick(Sender: TObject);
begin
  RegisterForm.show;
end;

procedure TLoginForm.ButtonLoginClick(Sender: TObject);
var
  username:string;
  password:string;
  realpassword:string;
begin
  username:=trim(EditName.Text);
  password:=trim(EditPassword.Text);
  if (username='') or (password='') then
  begin
    ShowMessage('信息未填写完全');
    exit;
  end;

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
    SQL.Add('select xh,userpassword,therole from users where username=:username');
    Parameters.ParamByName('username').Value:=username;
    open;
    wdxh:=Fieldbyname('xh').AsString;
    if IsEmpty then
    begin
      ShowMessage('用户不存在');
      exit;
    end
    else
    begin
      realpassword:=Fieldbyname('userpassword').AsString;
      if realpassword<>password then
      begin
        ShowMessage('密码错误');
        exit;
      end;

      if (RadioGroup1.Items[RadioGroup1.ItemIndex]='学生') and (Fieldbyname('therole').AsString='0') then
      begin
        Application.CreateForm(TMainForm1, MainForm1);
        MainForm1.Show;
        LoginForm.Hide;
      end
      else if (RadioGroup1.Items[RadioGroup1.ItemIndex]='管理员') and (Fieldbyname('therole').AsString='1') then
      begin
        Application.CreateForm(TMainForm2, MainForm2);
        MainForm2.Show;
        LoginForm.Hide;
      end
      else
      begin
        ShowMessage('角色错误');
      end;

    end;
  end;

end;

end.
