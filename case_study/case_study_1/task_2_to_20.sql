use case_study_module3;

-- 2
select nhan_vien.* from nhan_vien
where (nhan_vien.ho_ten like "H%" or nhan_vien.ho_ten like "T%" or nhan_vien.ho_ten like "K%") 
and char_length(nhan_vien.ho_ten) < 15;

-- 3
select khach_hang.* from khach_hang
where (year(now()) - year(khach_hang.ngay_sinh) > 18 and year(now()) - year(khach_hang.ngay_sinh) < 50)
and (khach_hang.dia_chi like "%Đà Nẵng" or khach_hang.dia_chi like "%Quảng Trị"); 

-- 4
select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_hop_dong) as so_lan_dat
from khach_hang
join loai_khach_hang on khach_hang.ma_loai_khach = loai_khach_hang.ma_loai_khach
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where loai_khach_hang.ten_loai_khach = "Diamond"
group by khach_hang.ma_khach_hang
order by so_lan_dat;

-- 5
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach_hang.ten_loai_khach, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, 
       if (hop_dong_chi_tiet.so_luong is null, dich_vu.chi_phi_thue, sum(dich_vu.chi_phi_thue + (hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia))) as tong_tien
from khach_hang
left join loai_khach_hang on khach_hang.ma_loai_khach = loai_khach_hang.ma_loai_khach
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by hop_dong.ma_hop_dong;

-- 6
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
inner join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where dich_vu.ten_dich_vu 
not in (
select dich_vu.ten_dich_vu 
from dich_vu 
inner join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where hop_dong.ngay_lam_hop_dong
between "2021-01-01" AND "2021-03-31")
order by dich_vu.dien_tich desc;

-- 7

-- 8
select nhan_vien.ho_ten from nhan_vien
group by ho_ten;

select distinct ho_ten from nhan_vien;

-- 9








