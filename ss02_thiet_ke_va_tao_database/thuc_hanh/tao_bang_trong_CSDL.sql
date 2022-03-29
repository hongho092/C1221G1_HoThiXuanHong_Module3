create database quan_li_diem_thi;

create table quan_li_diem_thi.hoc_sinh(
ma_hoc_sinh varchar(20) primary key,
ten_hoc_sinh varchar(50),
ngay_sinh date,
lop varchar(10),
gt varchar(20)
);

create table quan_li_diem_thi.mon_hoc(
ma_mon_hoc varchar(20) primary key,
ten_mon_hoc varchar(50)
);

create table quan_li_diem_thi.bang_diem(
ma_hoc_sinh varchar(20),
ma_mon_hoc varchar(20),
diem_thi int,
ngay_kiem_tra datetime,
primary key (ma_hoc_sinh, ma_mon_hoc),
foreign key (ma_hoc_sinh) references quan_li_diem_thi.hoc_sinh(ma_hoc_sinh),
foreign key (ma_mon_hoc) references quan_li_diem_thi.mon_hoc(ma_mon_hoc)
);

create table quan_li_diem_thi.giao_vien(
ma_giao_vien varchar(20) primary key,
ten_giao_vien varchar(20),
so_dien_thoai varchar(10)
);

alter table quan_li_diem_thi.mon_hoc
add column ma_giao_vien varchar(20);

alter table quan_li_diem_thi.mon_hoc
add foreign key (ma_giao_vien) references quan_li_diem_thi.giao_vien(ma_giao_vien);









