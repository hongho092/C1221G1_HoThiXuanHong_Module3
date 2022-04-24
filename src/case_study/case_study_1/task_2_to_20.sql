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
join loai_khach_hang lkh on kh.ma_loai_khach = lkh.ma_loai_khach
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
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, if(hdct.so_luong is null, 0, sum(hdct.so_luong)) as so_luong_dich_di_kem
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
-- select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as tong_dich_vu_kem
-- from hop_dong_chi_tiet hdct 
-- inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
-- group by hdct.ma_dich_vu_di_kem
-- having tong_dich_vu_kem >= (select max(so_luong) from hop_dong_chi_tiet );
    
create or replace view so_luong as     
select sum(hdct.so_luong) as tong_dich_vu_kem
from hop_dong_chi_tiet hdct 
group by hdct.ma_dich_vu_di_kem;
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong)
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having sum(hdct.so_luong) 
in (select max(tong_dich_vu_kem) from so_luong);

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
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
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
        where hd.ngay_lam_hop_dong between "2019/01/01" and "2021/12/31"
        group by hd.ma_nhan_vien);
set sql_safe_updates = 1;
select * from nhan_vien;

-- 17
create or replace view thay_doi_loai_khach as
select kh.ma_khach_hang, lkh.ma_loai_khach, sum(dv.chi_phi_thue + (hdct.so_luong * dvdk.gia)) as tong_tien
from khach_hang kh
join loai_khach_hang lkh on kh.ma_loai_khach = lkh.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where (hd.ngay_lam_hop_dong between "2021/01/01" and "2021/12/31") and ten_loai_khach = "Platinium"
group by kh.ma_khach_hang
having tong_tien >= 10000000;
set sql_safe_updates = 0;
update khach_hang kh, (select ma_khach_hang from thay_doi_loai_khach) as x
set kh.ma_loai_khach = 1
where kh.ma_khach_hang = x.ma_khach_hang;
-- in (select ma_khach_hang 
-- from (select ma_khach_hang from thay_doi_loai_khach) as x);
set sql_safe_updates = 1;

-- = 2
-- and kh.ma_loai_khach
-- in (select thay_doi_loai_khach.ma_loai_khach
-- 	from thay_doi_loai_khach); 

-- 18
set sql_safe_updates = 0;
set foreign_key_checks = off;
delete from khach_hang kh
where kh.ma_khach_hang
in (select hd.ma_khach_hang
    from hop_dong hd
    where year(hd.ngay_lam_hop_dong) < 2021);
set foreign_key_checks = on;
set sql_safe_updates = 1;

-- 19.1 tạo view riêng(chung)
create or replace view thay_doi_gia as
select dvdk.ma_dich_vu_di_kem, dvdk.gia, sum(hdct.so_luong) as so_lan
from hop_dong_chi_tiet hdct
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = 2020
group by hdct.ma_dich_vu_di_kem
having so_lan > 10;
set sql_safe_updates = 0;
update dich_vu_di_kem dvdk
set dvdk.gia = dvdk.gia * 2
where dvdk.ma_dich_vu_di_kem
in (select thay_doi_gia.ma_dich_vu_di_kem
	from thay_doi_gia);
set sql_safe_updates = 1;

-- 19.2 tạo view riêng(tách)
set sql_safe_updates = 0;
update dich_vu_di_kem dvdk, (select ma_dich_vu_di_kem from thay_doi_gia) as x
set dvdk.gia = dvdk.gia * 2
where dvdk.ma_dich_vu_di_kem = x.ma_dich_vu_di_kem;
set sql_safe_updates = 1;

-- 19.3 lồng cả view vào trong điều kiện xóa
set sql_safe_updates = 0;
update dich_vu_di_kem dvdk
set dvdk.gia = dvdk.gia * 2
where dvdk.ma_dich_vu_di_kem 
in (select ma_dich_vu_di_kem 
    from (select dvdk.ma_dich_vu_di_kem, dvdk.gia, sum(hdct.so_luong) as so_lan
          from hop_dong_chi_tiet hdct
          join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
		  join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
          where year(hd.ngay_lam_hop_dong) = 2020
          group by hdct.ma_dich_vu_di_kem
          having so_lan > 10) as x) ;
set sql_safe_updates = 1;

-- 20
select "nhan_vien" as vai_tro, nv.ma_nhan_vien as ma, nv.ho_ten as `ho_ten`, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi 
from nhan_vien nv
union
select "khach_hang" as vai_tro, kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from khach_hang kh; 

-- 21
create or replace view v_nhan_vien as
select nv.*
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where nv.dia_chi like "%Hải Châu" 
and hd.ngay_lam_hop_dong = "2019-12-12";

-- 22
set sql_safe_updates = 0;
update v_nhan_vien 
set v_nhan_vien.dia_chi = "Liên Chiểu"
where v_nhan_vien.dia_chi like "%Hải Châu";
set sql_safe_updates = 1;

-- 23
delimiter //
create procedure sp_xoa_khach_hang (in ma_khach_hang int)
begin
delete from khach_hang kh
where kh.ma_khach_hang = ma_khach_hang;
end //
delimiter ;

-- 24
delimiter //
drop procedure if exists sp_2 //
create procedure sp_2 (in ma_hop_dong int, in ma_nhan_vien int, in ma_khach_hang int, in ma_dich_vu int, in ngay_lam_hop_dong date, in ngay_ket_thuc date, in tien_dat_coc int, in tong_tien int)
begin
set @x = (select count(ma_hop_dong) 
		  from hop_dong hd
          where hd.ma_hop_dong = ma_hop_dong
          group by hd.ma_hop_dong);
if ((@x is null)
and (select ma_nhan_vien 
     from nhan_vien nv
     where nv.ma_nhan_vien = ma_nhan-vien)
and (select ma_khach_hang  
     from khach_hang kh
     where kh.ma_khach_hang = ma_khach_hang)
and (select ma_dich_vu 
     from dich_vu dv
     where dv.ma_dich_vu = ma_dich-vu)
and (ngay_ket_thuc > ngay_lam_hop_dong)) 
then
insert into hop_dong
values (ma_hop_dong, ma_nhan_vien, ma_khach_hang, ma_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien);
else
signal sqlstate '45000' set message_text = 'Dữ liệu sai';
end if;
end //
delimiter ;

-- 25
delimiter //
drop trigger if exists tr_1 // 
create trigger tr_1 after delete on hop_dong for each row
begin
set @x = (select count(*) as count from hop_dong);
end //
delimiter ;
set @x = 0;
delete from hop_dong where hop_dong.ma_hop_dong = 10;
select @x as 'Total amount deleted';

-- 26 
delimiter //
drop trigger if exists tr_2 //
create trigger tr_2 after update on hop_dong for each row
begin
if datediff(new.ngay_ket_thuc, old.ngay_lam_hop_dong) < 2 then
signal sqlstate '45000' set message_text = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày.';
end if;
end //
delimiter ;
update `case_study_module3`.hop_dong set ngay_ket_thuc = 2018-12-29 where (ma_hop_dong = 3);

-- 27a

delimiter //
drop function if exists func_1 //
create function func_1() returns int
deterministic
begin
create temporary table temp
(select count(distinct id_dich_vu)
 from hop_dong 
 where ma_dich_vu 
 in (select distinct ma_dich_vu
	 from hop_dong)
 group by ma_dich_vu
 having sum(tong_tien) > 2000000);
 set @tong_so_dich_vu = (select count(*) from temp);
 drop temporary table temp;
 return @tong_so_dich_vu;
 end //
 delimiter ;
 select func_1() as 'Số lượng dịch vụ có tổng tiền trên 2000000';

-- 27b

delimiter //
drop function if exists func_2 //
create function func_2 (ma_khach_hang int) returns int
deterministic
begin
	set@time_dai_nhat = (select max(datediff(hop_dong.ngay_ket_thuc, hop_dong.ngay_lam_hop_dong))
						 from hop_dong
                         where hop_dong.ma_khach_hang = ma_khach_hang);
	return @time_dai_nhat;
end;
-- select func_2(4) as 'Thời gian dài nhất'; 

-- 28
delimiter //
drop procedure if exists sp_3 //
create procedure sp_3()
begin
	declare dich_vu int default 0;
    declare is_done int default 0;
    declare con_tro cursor for
		select dv.ma_dich_vu
        from dich_vu dv
        inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
        inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        where ldv.ten_loai_dich_vu = 'room' and year(hd.ngay_lam_hop_dong) between '2015' and '2025';
	declare continue handler for not found set id_done = 1;
    open con_tro;
	get_list: loop
    fetch from con_tro into dich_vu;
    if is_done = 1 then
    leave get_list;
    end if;
    delete from hop_dong hd where hd.ma_dich_vu = dich_vu;
    delete from dich_vu dv where dich_vu.ma_dich_vu = dich_vu;
	end loop get_list;
	close con_tro;
end //
delimiter ;

delimiter //
create procedure deleteCustomer(in id int)
begin
set foreign_key_checks = off;
delete from khach_hang where ma_khach_hang= id;
set foreign_key_checks = on;
end //
delimiter ;

call delete_customer(8);

delimiter //
create procedure deleteEmployee(in id int)
begin
set foreign_key_checks = off;
delete from nhan_vien where ma_nhan_vien= id;
set foreign_key_checks = on;
end //
delimiter ;

select hop_dong.ma_hop_dong, khach_hang.ho_ten, dich_vu.ten_dich_vu, dich_vu.mo_ta_tien_nghi_khac, dich_vu.chi_phi_thue, 
dich_vu_di_kem.ten_dich_vu_di_kem, hop_dong_chi_tiet.so_luong
from khach_hang
inner join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
inner join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where now() between hop_dong.ngay_lam_hop_dong and hop_dong.ngay_ket_thuc; 

















