# ChromebookのLinux環境の日本語入力自動化スクリプト(Dabian11 Bulls_eye)の環境変数の設定対応
<br> 
<br> 
Chromebook用のリナックス環境がDabian11に変更され、今まで日本語入力用に環境変数を書いていた場所を変えたほうがいいので対応。<br> 
これまでは…<br> 
<br> 
<br> 
/etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf
<br> 
に環境変数を書いていたが、今後は非推奨になる。
<br> 
<br> 
~/.config/environment.d/*.conf
<br> 
<br> 
という場所に環境変数の設定を記述すれば良さそう。<br> 
~/.config/　以下にはデフォルトでは environment.d/ というディレクトリと、*.confという設定ファイルはないので自分で作ることになる。
<br> 
<br> 
以下を参照。<br> 
<br> 
https://chromium.googlesource.com/chromiumos/docs/+/main/containers_and_vms.md#Can-I-set-environment-variables-for-my-container<br> 
<br> 
https://www.freedesktop.org/software/systemd/man/environment.d.html
<br> 
<br> 

# 自動化スクリプトの内容


日本語フォントのインストール<br> 
タイムゾーンと日本語の環境の設定<br> 
fcitxとmozcのインストール<br> 
環境変数の設定<br> 

までを自動化する。<br> 
<br> 
# 使い方
<br> 
CromebookのLinux環境をセットアップする。<br> 
Chromebookの[設定]→[Linux開発環境のセットアップ]を選択。<br> 
セットアップが始まるので終了するまで待つ。<br> 
<br> 
ターミナルが立ち上がったら以下を実行する。<br> 
<br> 
$ git clone　https://github.com/eizawa21/Chromebook_japanese_locale_modified.git<br>
<br> 
<br> 
すると以下のディレクトリが出来ているので確認。<br> 
<br> 
$ ls <br> 
<br> 
Chromebook_japanese_locale_modified
<br> 
<br> 
作成されたディレクトリに移動する。<br> 
<br> 
<br> 
$ cd Chromebook_japanese_locale_modified<br> 
<br> 
移動先のディレクトリでスクリプトがあるか確認。<br> 
<br> 
$ ls<br> 
<br> 
japanese_locale_modified.sh<br> 
<br> 
japanese_locale_modified.shというスクリプトファイルを確認する。<br> 
確認後にchmodコマンドで実行権限を付与する。<br> 
<br> 
$ chmod 777 japanese_locale_modified.sh<br> 
<br> 
権限付与後に、スクリプトを実行する。<br> 
<br> 
$ ./japanese_locale_modified.sh<br> 
<br> 
スクリプトが動作するのでしばらく待つ。<br> 
スクリプト終了後に環境変数の設定を確認。<br> 
設定用にenvironment.dというディレクトリと、105-toshiya.confという設定ファイルが作成されているはず。<br> 
105-toshiya.confというネーミングは気にしないで。<br> 
以下のコマンドを実行して設定ファイルの内容を確認する。<br> 
<br> 
$ cat ~/.config/environment.d/105-toshiya.conf<br> 
<br> 
以下の設定が書き込まれているはず。<br> 
<br> 
GTK_IM_MODULE=fcitx<br> 
QT_IM_MODULE=fcitx<br> 
XMODIFIERS=@im=fcitx<br> 
GDK_BACKEND=x11<br> 
<br> 
次にターミナルを離れて、ChromeOSのランチャーを起動して、Linuxアプリという項目を探すと、Fcitxというアイコンが作成されているのでクリックする。<br> 
たぶん何も起こらないので、またターミナルに戻る。<br> 
以下のコマンドを入力する。<br> 
<br> 
$ fcitx-configtool <br> 
<br> 
GUIの設定アプリが立ち上がるので、左下の[+]アイコンをクリックする。<br> 
検索できるので、mozcと入力すると、上のキーボードレイアウト一覧の場所にMozcという文字が表示されるはず。<br> 
Mozcを選択する。<br> 
<br> 
あとは好みの設定を各自すればいい。<br> 
デフォルトだと、Mozcとアルファベットの切り替えは、Ctr+Shift キーになっている。<br> 
日本語キーボードの人は全角/半角キーに変えるのも有り。<br> 
<br> 
設定終了後にターミナルを落として、ChromeOSの下側のタスクバーにあるターミナルアイコンを右クリックして、[Linuxをシャットダウンする]を選択。<br> 
その後にLinuxを再起動する。<br> 
なにかGUIのテキストエディターを起動して、日本語入力可能になっているか確認する。(VS Code等)<br> 
<br> 
以上で終了。<br> 
とりあえず、Googleさんがデフォルトで日本語入力サポートしてくれるのを願いますｗ<br> 
