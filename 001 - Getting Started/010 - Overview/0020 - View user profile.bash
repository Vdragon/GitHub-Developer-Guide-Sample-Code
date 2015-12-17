#!/bin/bash
printf "請輸入要查詢的 GitHub 使用者識別名稱（非顯示名稱）："
read github_user_name
curl https://api.github.com/users/${github_user_name}
printf "請按 Enter 鍵結束程式。"
read nothing
exit 0
