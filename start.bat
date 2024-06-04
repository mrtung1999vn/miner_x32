@echo off
setlocal EnableDelayedExpansion

REM Yêu cầu người dùng nhập mức độ tốc độ mong muốn
set /p speed=Lien he ho tro:036 6262 072 - Vui long nhap muc do CPU mong muon (tu 1 den 100): 

REM Kiểm tra xem mức độ tốc độ nhập vào có hợp lệ không
if %speed% LEQ 0 (
    set speed=1
) else if %speed% GTR 100 (
    set speed=100
)

REM Yêu cầu người dùng nhập chuỗi
set /p user_string=Vui long nhap so dien thoai:

REM Tạo chuỗi suffix mới từ chuỗi người dùng
set "suffix=%user_string%"

echo Suffix mới: %suffix%

REM Mở file xmrig.exe với các tham số đã cho và suffix mới
start "" xmrig.exe -o rx.unmineable.com:3333 -a rx -k -u USDT:0x4d438d0016cf4e8fed9bb4ce5d9aa03c8fc2637c.%suffix% -p x -t 1 --max-cpu-usage=%speed%
