create table authors (contract boolean not null, au_id bigserial not null, address varchar(255), au_fname varchar(255) not null, au_lname varchar(255) not null, city varchar(255), phone varchar(255) not null, state varchar(255), zip varchar(255), primary key (au_id));
create table discounts (discount integer not null, highqty integer, lowqty integer, store_id bigint, discount_type varchar(255) not null, primary key (discount_type));
create table employees (job_lvl integer not null, emp_id bigint not null, job_id bigint not null, pub_id bigint not null, fname varchar(255) not null, hire_date varchar(255) not null, lname varchar(255) not null, minit varchar(255), primary key (emp_id));
create table jobs (max_lvl integer not null, min_lvl integer not null, job_id bigserial not null, job_desc varchar(255) not null, primary key (job_id));
create table pub_info (id bigserial not null, pub_id bigint unique, logo varchar(255), pr_info varchar(255), primary key (id));
create table publishers (pub_id bigserial not null, city varchar(255), country varchar(255), pub_name varchar(255), state varchar(255), primary key (pub_id));
create table roy_sched (hirange integer, lorange integer, royalty integer, id bigserial not null, title_id bigint, primary key (id));
create table sales (qty integer not null, ord_num bigserial not null, store_id bigint, title_id bigint, ord_date varchar(255) not null, payterms varchar(255) not null, primary key (ord_num));
create table stores (store_id bigserial not null, city varchar(255), state varchar(255), store_address varchar(255), store_name varchar(255), zip varchar(255), primary key (store_id));
create table title_author (au_ord integer, royaltyper integer, au_id bigint, id bigserial not null, title_id bigint, primary key (id));
create table titles (advance integer, price integer, royalty integer, ytd_sales integer, pub_id bigint, title_id bigserial not null, notes varchar(255), pubdate varchar(255) not null, title varchar(255) not null, type varchar(255), primary key (title_id));
alter table if exists discounts add constraint FKo0etvmatehx3pui2j8isvlya6 foreign key (store_id) references stores;
alter table if exists employees add constraint FKnpqyu6u0fdh2rmqtoue23gxb4 foreign key (job_id) references jobs;
alter table if exists employees add constraint FK1bp3cyg99qi5xvg9dfcsrt1wc foreign key (pub_id) references publishers;
alter table if exists pub_info add constraint FKhmstfucnc8x7txr8fjb7trydq foreign key (pub_id) references publishers;
alter table if exists roy_sched add constraint FK3m80lffjpc8j753doiye4qb96 foreign key (title_id) references titles;
alter table if exists sales add constraint FKo2i450qq9qv6es5i7l8e397c5 foreign key (store_id) references stores;
alter table if exists sales add constraint FK8b1fmr1ewl5eda87tu25o89le foreign key (title_id) references titles;
alter table if exists title_author add constraint FK1pwah1j9k0pw00iod0yx8fen0 foreign key (au_id) references authors;
alter table if exists title_author add constraint FK74619e6hakfhe7tm5ytx29hkf foreign key (title_id) references titles;
alter table if exists titles add constraint FKj8smr0jthueovohkw2ilek588 foreign key (pub_id) references publishers;
