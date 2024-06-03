@echo off
setlocal EnableDelayedExpansion


REM Yêu cầu người dùng nhập mức độ tốc độ mong muốn
set /p speed=Vui lòng nhập mức độ tốc độ mong muốn (từ 1 đến 100): 

REM Kiểm tra xem mức độ tốc độ nhập vào có hợp lệ không
if %speed% LEQ 0 (
    set speed=1
) else if %speed% GTR 100 (
    set speed=100
)

REM Lấy thời gian hiện tại
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "timestamp=%%a"
set "timestamp=%timestamp:~0,8%"

REM Tạo chuỗi ngẫu nhiên 5 ký tự
set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
set "random_string="
for /l %%i in (1,1,5) do (
    set /a index=!random! %% 62
    for /l %%j in (!index!,1,!index!) do (
        set "random_char=!characters:~%%j,1!"
        set "random_string=!random_string!!random_char!"
    )
)

REM Tạo chuỗi suffix mới kết hợp timestamp và chuỗi ngẫu nhiên
set "suffix=%timestamp%!random_string!"

echo Suffix mới: %suffix%

REM Mở file xmrig.exe với các tham số đã cho và suffix mới
start "" xmrig.exe -o rx.unmineable.com:3333 -a rx -k -u USDT:0x4d438d0016cf4e8fed9bb4ce5d9aa03c8fc2637c.%suffix% -p x -t 1 --max-cpu-usage=%speed%