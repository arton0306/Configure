#!/bin/bash

# 使用範例：
#    - 從文件中複製內容：
#      ./copy_to_clipboard.sh filename.txt
#    - 從標準輸入複製內容：
#      echo "Hello, World!" | ./copy_to_clipboard.sh

osc52_copy() {
    local encoded
    encoded=$(printf "%s" "$1" | base64 | tr -d '\n')
    esc="\033]52;c;${encoded}\a"
    if [[ -n "$TMUX" ]]; then
        esc="\033Ptmux;\033${esc}\033\\"
    fi
    printf "$esc"
}

if [ $# -eq 0 ]; then
    input=$(cat)
else
    input=$(cat "$1")
fi

osc52_copy "$input"
echo "Content copied to clipboard"

echo "Copied content:"
echo "$input"

