# 既存設定ファイルをバックアップする
mv ~/.bash_profile ~/bash_profile_bk
mv ~/.bashrc ~/bashrc_bk

# 各種設定ファイルを配置する
ln bash_profile.sh ~/.bash_profile
ln bashrc.sh ~/.bashrc
