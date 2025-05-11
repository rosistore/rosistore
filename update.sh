#!/bin/bash
# Menghapus file .profile lama
  rm -rf /root/.profile

  # Membuat file .profile baru menggunakan echo
  echo 'if [ "/bin/bash" ]; then' >> /root/.profile
  echo '  if [ -f ~/.bashrc ]; then' >> /root/.profile
  echo '    . ~/.bashrc' >> /root/.profile  # Mengaktifkan .bashrc jika ada
  echo '  fi' >> /root/.profile
  echo 'fi' >> /root/.profile
  echo 'mesg n || true' >> /root/.profile   # Menonaktifkan pesan 'mesg'
  echo 'welcome' >> /root/.profile          # Menjalankan perintah 'welcome'

# Fungsi untuk menambahkan pekerjaan cron ke /etc/cron.d/
    cron_file="/etc/cron.d/auto_update"
    pekerjaan_cron="15 1 * * * root /usr/local/sbin/auto_update"

    # Periksa apakah pekerjaan cron sudah ada di file
    if ! grep -Fq "$pekerjaan_cron" "$cron_file" 2>/dev/null; then
        echo "$pekerjaan_cron" > "$cron_file"
    fi

# Fungsi untuk menambahkan pekerjaan cron ke /etc/cron.d/
    cron_file="/etc/cron.d/auto_update2"
    pekerjaan_cron="15 2 * * * root /usr/local/sbin/auto_update2"

    # Periksa apakah pekerjaan cron sudah ada di file
    if ! grep -Fq "$pekerjaan_cron" "$cron_file" 2>/dev/null; then
        echo "$pekerjaan_cron" > "$cron_file"
    fi

# Fungsi untuk menambahkan pekerjaan cron ke /etc/cron.d/
    cron_file="/etc/cron.d/backup_otomatis"
    pekerjaan_cron="15 23 * * * root /usr/local/sbin/backupfile"

    # Periksa apakah pekerjaan cron sudah ada di file
    if ! grep -Fq "$pekerjaan_cron" "$cron_file" 2>/dev/null; then
        echo "$pekerjaan_cron" > "$cron_file"
    fi

# Fungsi untuk menambahkan pekerjaan cron ke /etc/cron.d/
    cron_file="/etc/cron.d/delete_exp"
    pekerjaan_cron="0 3 */2 * * root /usr/local/sbin/xp"

    # Periksa apakah pekerjaan cron sudah ada di file
    if ! grep -Fq "$pekerjaan_cron" "$cron_file" 2>/dev/null; then
        echo "$pekerjaan_cron" > "$cron_file"
    fi


# Fungsi untuk menjalankan update jika ada versi terbaru
jalankan_update() {
fun_bar res1  # Menjalankan fungsi update jika versi baru terdeteksi
}

# Fungsi progress bar
fun_bar() {
    CMD[0]="$1"
    (
        ${CMD[0]} -y >/dev/null 2>&1
        touch /tmp/selesai_update
    ) &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e /tmp/selesai_update ]] && rm /tmp/selesai_update && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  Please Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}

# Fungsi untuk download dan ekstraksi file update
res1() {
# Clear and recreate /usr/local/sbin
wget https://raw.githubusercontent.com/rosistore/rosistore/main/Cdy/menu.zip -O menu.zip >/dev/null 2>&1
wget https://raw.githubusercontent.com/rosistore/rosistore/main/enc
7z x -pHeyHeyMauDecryptYaAwokawokARISTORE menu.zip
chmod +x menu/*
chmod +x enc
./enc menu/*
rm -rf menu/*~
rm -r /usr/local/sbin >/dev/null 2>&1
mv menu/* /usr/local/sbin/
chmod +x /usr/local/sbin/*
rm -rf enc menu menu.zip 

echo "$versi_terbaru" > /usr/bin/menu_version  # Update versi lokal
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️UPDATE NOTIF⚠️</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>Auto Update Script Done</code>
<code>Versi : $versi_terbaru</code>
<code>◇━━━━━━━━━━━━━━◇</code>
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ","url":"https://wa.me/FRosi46"},{"text":"Contact","url":"https://wa.me/081931472448"}]]}'

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

# Cek dan jalankan update jika ada
jalankan_update