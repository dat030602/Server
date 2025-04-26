#!/bin/bash

# Định nghĩa các biến
SOURCE="/var/log/odoo/odoo.log"         # File log nguồn
DESTINATION="/data/backup/log"            # Thư mục đích để lưu backup

# Tạo thư mục đích nếu chưa tồn tại
mkdir -p "$DESTINATION"

# Định dạng ngày tháng năm
DATE=$(date +"%d-%m-%Y_%H-%M")

# Đổi tên file log
NEW_LOGFILE="log_${DATE}.log"

# Sao chép file log và đổi tên
cp "$SOURCE" "$DESTINATION/$NEW_LOGFILE"

# Reset file log nguồn về trạng thái rỗng
: > "$SOURCE"