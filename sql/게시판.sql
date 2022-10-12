--���̺� ����
drop table uploadfile;
drop table comments;
drop table article;

--������ ����
drop sequence article_article_num_seq;
drop sequence comments_comment_num_seq;
drop sequence uploadfile_uploadfile_id_seq;

--Ŀ�´�Ƽ ���̺� ����
create table article (
  article_num           number(6),        -- �Խñ� ��ȣ
  mem_number            number(6),        -- ȸ�� ��ȣ
  article_category      varchar2(10),     -- �Խñ� ī�װ�
  article_title         varchar2(90),     -- �Խñ� ����
  article_contents      varchar2(1500),   -- �Խñ� ����
  attachment            varchar2(1),      -- ÷������ ����
  create_date           date,             -- �Խñ� �ۼ���
  views                 number(5)         -- ��ȸ��
);
--primary key
alter table article add constraint article_article_num_pk primary key(article_num);
--foreign key
alter table article add constraint article_mem_number_fk foreign key(mem_number) references member(mem_number) on delete cascade;
--default
alter table article modify create_date date default sysdate;
alter table article modify views number(5) default 0;
--not null
alter table article modify article_category constraint article_article_category_nn not null;
alter table article modify article_title constraint article_article_title_nn not null;
alter table article modify article_contents constraint article_article_contents_nn not null;
alter table article modify attachment constraint article_attachment_nn not null;

--�Խñ� ��ȣ ������ ����
create sequence article_article_num_seq
increment by 1
start with 1
minvalue 1
maxvalue 999999
nocycle
nocache
noorder;

--��� ���̺� ����
create table comments (
  article_num          number(6),       -- �Խñ� ��ȣ
  comment_group        number(6),       -- ��� �׷�
  comment_num          number(6),       -- ��� ��ȣ
  p_comment_num        number(6),       -- �θ� ��� ��ȣ
  mem_number           number(6),       -- ȸ�� ��ȣ
  comment_contents     varchar2(300),   -- ��� ����
  create_date          date,            -- ��� ������
  comment_indent       number(3)        -- ���� �鿩����
);

--primary key
alter table comments add constraint comments_comment_num_pk primary key(comment_num);
--foreign key
alter table comments add constraint comments_article_num_fk foreign key(article_num) references article(article_num) on delete cascade;
alter table comments add constraint comments_mem_number_fk foreign key(mem_number) references member(mem_number) on delete cascade;
alter table comments add constraint comments_p_comment_num_fk foreign key(p_comment_num) references comments(comment_num) on delete set null;
--default
alter table comments modify create_date date default sysdate;
alter table comments modify comment_indent number default 0;
--not null
alter table comments modify comment_contents constraint comments_comment_contents_nn not null;

--��� ��ȣ ������ ����
create sequence comments_comment_num_seq
increment by 1
start with 1
minvalue 1
maxvalue 999999
nocycle
nocache
noorder;