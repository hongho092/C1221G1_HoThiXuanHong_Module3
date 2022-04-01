use case_study_module3;

-- 2
select * from khach_hang kh
where (year(now()) - year(kh.ngay_sinh) > 18 and year(now()) - year(kh.ngay_sinh) < 50)
and (kh.dia_chi like "%Đà Nẵng" or kh.dia_chi like "%Quảng Trị");

-- 3
select khach_hang.* from khach_hang
where (year(now()) - year(khach_hang.ngay_sinh) > 18 and year(now()) - year(khach_hang.ngay_sinh) < 50)
and (khach_hang.dia_chi like "%Đà Nẵng" or khach_hang.dia_chi like "%Quảng Trị"); 

-- 4
select kh.ma_khach_hang, kh.ho_ten, count(hd.ma_khach_hang) as so_lan_dat_phong
from khach_hang kh 
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach_hang lkh on kh.ma_loai_khach = lkh.ma_loai_khach
where ten_loai_khach = "Diamond"
group by kh.ho_ten
order by  so_lan_dat_phong;

-- 5
select kh.ma_khach_hang, kh.ho_ten, lkh.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
       if (hdct.so_luong is null, dv.chi_phi_thue, sum(dv.chi_phi_thue + (hdct.so_luong * dvdk.gia))) as tong_tien
from khach_hang kh
left join loai_khach_hang lkh on kh.ma_loai_khach = lkh.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong;

-- 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu
not in (select dv.ma_dich_vu 
		from dich_vu dv 
        join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu 
        where hd.ngay_lam_hop_dong between "2021/01/01" and "2021/03/30")
order by dv.dien_tich desc;

-- 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu 
in (select dv.ma_dich_vu
	from dich_vu dv
    join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
    where hd.ngay_lam_hop_dong between "2020/01/01" and "2020/12/31") 
and dv.ma_dich_vu 
not in (select dv.ma_dich_vu
	from dich_vu dv
    join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
    where hd.ngay_lam_hop_dong between "2021/01/01" and "2021/12/31");
 
-- 8
select ho_ten from nhan_vien
group by ho_ten;
select ho_ten from nhan_vien
union
select ho_ten from nhan_vien;
select distinct ho_ten from nhan_vien;

-- 9
select month(hd.ngay_lam_hop_dong) as thang, count(hd.ma_hop_dong) as so_lan_dat
from hop_dong hd 
where year(hd.ngay_lam_hop_dong) = 2021
group by thang
order by thang;

-- 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as so_luong_dich_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong;

-- 11







