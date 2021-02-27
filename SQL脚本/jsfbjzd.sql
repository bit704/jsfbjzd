-create database jsfbjzd

create table xs
(xm varchar(10) not null,
xh char(10) primary key,
xydh char(3) not null,
sjh char(11) not null
)

create table dw
(dwdh char(5) primary key,
dwmc varchar(20) not null,
dzxh char(10) not null,
jsdh char(5) not null,
zdgh char(10) not null,
zt char(10) not null
)

create table dwgc
(dwdh char(5) not null,
cyxh char(10) not null,
primary key(dwdh,cyxh)
)

create table dwsq
(dwdh char(5) not null,
cyxh char(10) not null,
primary key(dwdh,cyxh)
)


create table js
(jsdh char(5) primary key,
jsmc varchar(50) not null,
zbdw varchar(30),
begindate date not null,
enddate date not null,
teamrule varchar(50) not null
)

create table zdls
(xm varchar(10) not null,
gh char(10) primary key,
xydh char(3) not null,
sjh char(11) not null,
zc varchar(10) not null
)

create table xy
(xydh char(3) primary key,
xymc varchar(20) not null
)


create table users
(username varchar(20) primary key,
userpassword varchar(20) not null,
xh char(10),
therole char(1) not null
)


insert into xs values
('赵明阳','1120180001','001','15636697855'),
('钱及离','1120180002','001','15654123655'),
('孙正义','1120180003','001','13288556645'),
('王琳','1120180004','001',  '18855661254'),
('李一一','1120180005','001','13356568545'),
('周朝阳','1120180006','002','15023599845'),
('吴浩','1120180007','002',  '15156495252'),
('郑首','1120180008','002',  '18864123508'),
('张飞熊','1120180009','002','18865239987'),
('刘琴','1120180010','002',  '15644852366'),
('付瑶琴','1120180011','003','15685366624'),
('石军','1120180012','003',  '13255663218'),
('刘飞','1120180013','003',  '13256985512'),
('李金羽','1120180014','003','15689955647'),
('尤三','1120180015','003',  '13285648426'),
('陈璐','1120180016','004',  '15633525897'),
('冯建荣','1120180017','004','15688987451'),
('乔军','1120180018','004',  '13256998754'),
('贾懿','1120180019','004',  '13266598740'),
('欧阳夏果','1120180020','004','15688215648');

insert into xy values
('001','计算机学院'),
('002','光电学院'),
('003','自动化学院'),
('004','数学学院')

insert into js values
('00001','大学生数学建模竞赛','大学生数学建模竞赛组委会','2020-05-14','2021-01-01','1-3人'),
('00002','第八届“发现杯”全国大学生互联网软件设计大奖赛','工业和信息化部教育与考试中心','2020-09-10','2021-01-31','1-5人'),
('00003','第十一届“工商银行杯”全国大学生金融科技创新大赛','中国工商银行股份有限公司','2020-04-01','2020-09-01','1-2人')

insert into zdls values
('张诗善','1000800001','001','13256897454','教授'),
('王海',  '1000800002','001','15685256322','讲师'),
('李文达','1000800003','002','15684447785','副教授'),
('吴君',  '1000800004','003','18865236544','副教授'),
('邢宏伟','1000800005','004','18825647189','助教')

insert into dw values
('1','新东方','1120180004','00001','1000800004','组队中'),
('2','宝矿力','1120180003','00001','1000800005','组队中'),
('3','小星星','1120180006','00002','1000800003','审核通过')


insert into dwgc values
('1','1120180005'),
('1','1120180006'),
('2','1120180011'),
('2','1120180010'),
('2','1120180012'),
('2','1120180013'),
('3','1120180019'),
('3','1120180020')

insert into dwsq values
('1','1120180007'),
('1','1120180009'),
('2','1120180008')

alter table xs add constraint FK_xs_xydh foreign key (xydh) references xy(xydh)
alter table dw add constraint FK_dw_dzxh foreign key (dzxh) references xs(xh)
alter table dw add constraint FK_dw_jsdh foreign key (jsdh) references js(jsdh)
alter table dw add constraint FK_dw_zdgh foreign key (zdgh) references zdls(gh)
alter table zdls add constraint FK_zdls_xydh foreign key (xydh) references xy(xydh)
alter table dwgc add constraint FK_dwgc_dwdh foreign key (dwdh) references dw(dwdh)
alter table dwgc add constraint FK_dwgc_cyxh foreign key (cyxh) references xs(xh)


insert into users values
('777','777','1120180004','0'),
('123','123','1120180001','0'),
('456','456','','1')


