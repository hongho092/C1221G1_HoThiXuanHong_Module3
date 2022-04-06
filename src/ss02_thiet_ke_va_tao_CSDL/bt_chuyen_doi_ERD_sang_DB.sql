create database quan_ly_xuat_nhap;

use quan_ly_xuat_nhap;

create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat date
);

create table vat_tu(
ma_vtu int primary key auto_increment,
ten_vtu varchar(50)
);

create table chi_tiet_phieu_xuat(
dg_xuat int,
sl_xuat int,
so_px int,
ma_vtu int,
primary key(so_px,ma_vtu),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);

create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap date
);

create table chi_tiet_phieu_nhap(
dg_nhap int,
sl_nhap int,
so_pn int,
ma_vtu int,
primary key(so_pn,ma_vtu),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);

create table don_dat_hang(
so_dh int primary key auto_increment,
ngay_dh date
);

create table chi_tiet_don_dat_hang(
so_dh int,
ma_vtu int,
primary key (so_dh,ma_vtu),
foreign key (so_dh) references don_dat_hang (so_dh),
foreign key (ma_vtu) references vat_tu (ma_vtu)
);

create table nha_cc(
ma_ncc int primary key auto_increment,
ten_ncc varchar(50),
dia_chi varchar(100),
so_dh int,
foreign key (so_dh) references don_dat_hang(so_dh)
);

create table so_dien_thoai(
so_dien_thoai varchar(10) unique,
ma_ncc int,
foreign key (ma_ncc) references nha_cc (ma_ncc)
);