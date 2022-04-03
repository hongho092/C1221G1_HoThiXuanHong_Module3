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

-- 7c1
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
 
 -- 7.2
 select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where hd.ngay_lam_hop_dong between "2020/01/01" and "2020/12/31"
and dv.ma_dich_vu 
not in (select dv.ma_dich_vu
	    from dich_vu dv
        join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
        where hd.ngay_lam_hop_dong between "2021/01/01" and "2021/12/31")
group by dv.ma_dich_vu;
 
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
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach_hang lkh on lkh.ma_loai_khach = kh.ma_loai_khach
where lkh.ten_loai_khach = "Diamond" and (kh.dia_chi like "%Vinh" or kh.dia_chi like "%Quảng Ngãi");
-- in ("%Vinh", "%Quảng Ngãi");

-- 12
select hd.ma_hop_dong, nv.ho_ten as ho_ten_nhan_vien, kh.ho_ten as ho_ten_khach_hang, kh.so_dien_thoai as sdt_khach_hang, dv.ten_dich_vu, if(hdct.so_luong is null, 0, sum(hdct.so_luong)) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong hd
inner join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
inner join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
-- left join vì có những hợp đồng không có hợp đồng chi tiết.
inner join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
where hd.ngay_lam_hop_dong between "2020/10/01" and "2020/12/31"
and dv.ma_dich_vu 
not in (select dv.ma_dich_vu
	    from dich_vu dv
        join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
        where hd.ngay_lam_hop_dong between "2021/01/01" and "2021/06/01")
group by hd.ma_hop_dong;

-- 13
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as tong_dich_vu_kem
from hop_dong_chi_tiet hdct 
inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having tong_dich_vu_kem >= all(select max(so_luong) from hop_dong_chi_tiet);
    
-- select hdct.ma_dich_vu_di_kem, count(hdct.so_luong) as tong_dich_vu_kem
-- from hop_dong_chi_tiet hdct
-- group by hdct.ma_dich_vu_di_kem;
-- select hdct.ma_dich_vu_di_kem, sum(hdct.so_luong) as tong_dich_vu_kem
-- from hop_dong_chi_tiet hdct
-- group by hdct.ma_dich_vu_di_kem;

-- 	 >	   any	   all
-- 6   6    v		x
-- 7   	    v		v
-- 3   3	x		x
-- 9  		v		v

-- 14
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.so_luong) as so_lan_su_dung
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung = 1
order by hd.ma_hop_dong; 

-- 15.1
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi 
from nhan_vien nv
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
where nv.ma_nhan_vien
in (select hd.ma_nhan_vien 
    from hop_dong hd
    group by hd.ma_nhan_vien
    having count(hd.ma_hop_dong) <= 3);

-- 15.2 
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi 
from nhan_vien nv
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
group by hd.ma_nhan_vien
having count(hd.ma_hop_dong) <= 3;

-- 16
set sql_safe_updates = 0;
delete from nhan_vien nv
where nv.ma_nhan_vien 
not in (select hd.ma_nhan_vien
        from hop_dong hd
	    group by hd.ma_nhan_vien);
set sql_safe_updates = 1;
select * from nhan_vien;

-- 17
create view update_kh as
select kh.ma_khach_hang, lkh.ma_loai_khach, sum(dv.chi_phi_thue + (hdct.so_luong * dvdk.gia)) as tong_tien
from khach_hang kh
join loai_khach_hang lkh on kh.ma_loai_khach = lkh.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where hd.ngay_lam_hop_dong between "2021/01/01" and "2021/12/31"
group by kh.ma_khach_hang
having tong_tien >= 10000000;

update khach_hang kh
set kh.ma_loai_khach = 1
where kh.ma_loai_khach = 2
and kh.ma_loai_khach 
in (select update_kh.ma_loai_khach
	from update_kh); 

-- 18

-- 19

-- 20
select "nhan_vien" as vai_tro, nv.ma_nhan_vien as ma, nv.ho_ten as `ho_ten`, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi 
from nhan_vien nv
union
select "khach_hang" as vai_tro, kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from khach_hang kh;