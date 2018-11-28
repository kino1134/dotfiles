# 既存設定ファイルをバックアップする
mv ~/.bash_profile ~/bash_profile_bk
mv ~/.bashrc ~/bashrc_bk

# 各種設定ファイルを配置する
ln bash_profile.sh ~/.bash_profile
ln bashrc.sh ~/.bashrc
[ -f bash_local.sh ] && ln bash_local.sh ~/.bash_local

[ -f id_rsa ] && ln id_rsa ~/.ssh/id_rsa
[ -f id_rsa.pub ] && ln id_rsa.pub ~/.ssh/id_rsa.pub
[ -f ssh_config ] && ln ssh_config ~/.ssh/config
