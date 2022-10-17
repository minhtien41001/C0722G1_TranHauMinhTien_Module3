drop database if exists exercise1;
create database exercise1;
use exercise1;

create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat date
);

create table vat_tu(
ma_vat_tu int primary key auto_increment,
ten_vat_tu varchar(45)
);

create table chi_tiet_phieu_xuat(
don_gia_xuat double,
so_luong_xuat int,
so_px int,
ma_vat_tu int,
primary key (don_gia_xuat,so_luong_xuat),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap date
);

create table chi_tiet_phieu_nhap(
don_gia_nhap double,
so_luong_nhap int,
ma_vat_tu int,
so_pn int,
primary key (don_gia_nhap,so_luong_nhap),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_pn) references phieu_nhap(so_pn)
);


 
 create table nha_cung_cap(
ma_nha_cung_cap int primary key auto_increment,
ten_nha_cung_cap varchar(45),
dia_chi varchar(45)
);


create table so_dien_thoai(
ma_nha_cung_cap int,
ma_so_dien_thoai int primary key auto_increment,
so_dien_thoai varchar(13),
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang(
 so_dat_hang int primary key auto_increment,
 ngay_dat_hang date,
 ma_nha_cung_cap int,
 foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
 );
 
 create table chi_tiet_don_dat_hang(
 so_dat_hang int,
 ma_vat_tu int,
 primary key(so_dat_hang,ma_vat_tu),
 foreign key (so_dat_hang) references don_dat_hang(so_dat_hang),
 foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
 );