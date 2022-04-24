create database case_study_module3;

use case_study_module3;

create table vi_tri(
ma_vi_tri int primary key,
ten_vi_tri varchar(45)
);

create table trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(45)
);

create table bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(45)
);

set foreign_key_checks = off;
drop table if exists nhan_vien;
set foreign_key_checks = on;

create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int not null,
ma_trinh_do int not null,
ma_bo_phan int not null,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri) on update cascade on delete cascade,
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do) on update cascade on delete cascade,
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan) on update cascade on delete cascade
);

set foreign_key_checks = off;
ALTER TABLE `case_study_module3`.`nhan_vien` 
CHANGE COLUMN `ma_nhan_vien` `ma_nhan_vien` INT NOT NULL AUTO_INCREMENT ;
set foreign_key_checks = on;

create table loai_khach_hang(
ma_loai_khach int primary key,
ten_loai_khach varchar(45)
);

create table khach_hang(
ma_khach_hang int primary key,
ma_loai_khach int not null,
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
foreign key (ma_loai_khach) references loai_khach_hang(ma_loai_khach)
);

set foreign_key_checks = off;
ALTER TABLE `case_study_module3`.`khach_hang` 
CHANGE COLUMN `ma_khach_hang` `ma_khach_hang` INT NOT NULL AUTO_INCREMENT ;
set foreign_key_checks = on;

create table kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(45)
);

create table loai_dich_vu(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);

create table dich_vu(
ma_dich_vu int primary key,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int not null,
ma_loai_dich_vu int not null,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);

set foreign_key_checks = off;
ALTER TABLE `case_study_module3`.`dich_vu` 
CHANGE COLUMN `ma_dich_vu` `ma_dich_vu` INT NOT NULL AUTO_INCREMENT ;
set foreign_key_checks = on;

create table hop_dong(
ma_hop_dong int primary key,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int not null,
ma_khach_hang int not null,
ma_dich_vu int not null,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu) 
);

set foreign_key_checks = off;
ALTER TABLE `case_study_module3`.`hop_dong` 
CHANGE COLUMN `ma_hop_dong` `ma_hop_dong` INT NOT NULL AUTO_INCREMENT ;
set foreign_key_checks = on;

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key,
ma_hop_dong int not null,
ma_dich_vu_di_kem int not null,
so_luong int not null,
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);






