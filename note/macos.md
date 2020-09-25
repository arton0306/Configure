## env

### change stupid default setting
*  system preferences => keyboard => Text 把那個智障自動首字大寫取消
*  system preferences => sound => 調整吵死人的警告音(例如在cli中按左鍵，但游標已在最左邊，這時會發出警告音，注意如果把聲音全關掉，警告方式會變成螢幕閃一下…，所以我都調到只剩一點點聽不到的音量)
*  defaults write -g ApplePressAndHoldEnabled -bool false => 讓keyboard按下去時repeat能正常運作
*  Terminal 的 home 和 end 居然是 scroll 到最前/後面，到 terminal 的 preference 中選好一個 profile，然後改它的 keyboard 增加一個 home 和 end 的 key ，對應到的 action 分別為 `\033OH` `\033OF`

### my usage convention
*  可調整速度的播放軟體 => IINA (不要用MPlayerX有mackeeper病毒)
*  影片播放軟體(含各種編碼) => SupremePlayer Lite (待查)
*  掃毒 => malwarebytes
*  Finder的favorite增加home => 進入finder的preference把home也打勾
*  Text Editro => Preference => New Document - Format - Plain text  & Open and Save - When Opening a File - Display HTML files as HTML code instead of formatted text

### path [ref][1]

* for single user: `~/.bash_profile`
* for system level: `/etc/paths.d`

## install popular tools

### visual studio code

1. download the zip, extract the app and put into Application
2. open vscode, press `F1`, type `shell command`, select `Shell command 'code' successfully installed in PATH`
3. vscode will add a symlink `/usr/local/bin/code` to `/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code`

## hotkeys

* maximize window without fullscreen : click green window button when `option` pressed
* move file: copy with `cmd+c`, paste with `cmd+option+v`
* select a path: `cmd + shift + double click`
* open an unauthorized app: `ctrl + click` and open

## homebrew

* install things in `/usr/local/Cellar` and creates the soft links in `/usr/local/bin`
* keg-only: means it was not symlinked into `/usr/local`
*   an example to add soft links for keg-only
*   `brew install llvm`
*   `ln -s "$(brew --prefix llvm)/bin/clang-format" "/usr/local/bin/clang-format"`
*   `ln -s "$(brew --prefix llvm)/bin/clang-tidy" "/usr/local/bin/clang-tidy"`

## refences

[1]:  <https://www.cyberciti.biz/faq/appleosx-bash-unix-change-set-path-environment-variable/>
