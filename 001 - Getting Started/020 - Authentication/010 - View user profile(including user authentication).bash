#!/bin/bash
# https://developer.github.com/guides/getting-started/#basic
printf "請輸入您的使用者識別名稱（非顯示名稱）："
read github_user_name
printf "請輸入要查詢的 GitHub 使用者識別名稱（非顯示名稱）："
read github_query_user_name
curl --include --user ${github_user_name} https://api.github.com/users/${github_query_user_name}

printf "\n請按 Enter 鍵結束程式。"
read nothing
exit 0;
