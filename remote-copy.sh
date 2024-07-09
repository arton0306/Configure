#!/bin/bash
# 文件名：remote-copy.sh

# OSC 52 複製函數
osc52_copy() {
    local encoded
    encoded=$(printf "%s" "$1" | base64 | tr -d '\n')
    esc="\033]52;c;${encoded}\a"
    if [[ -n "$TMUX" ]]; then
        esc="\033Ptmux;\033${esc}\033\\"
    fi
    printf "$esc"
}

# 從標準輸入或文件讀取內容
if [ $# -eq 0 ]; then
    input=$(cat)
else
    input=$(cat "$1")
fi

# 確保所有內容都被讀取
input=$(printf "%s" "$input")

# 複製到剪貼板
osc52_copy "$input"
echo "Content copied to clipboard"

# 顯示複製的內容（用於調試）
echo "Copied content:"
echo "$input"
