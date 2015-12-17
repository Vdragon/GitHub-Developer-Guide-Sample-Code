#!/bin/bash
printf "請輸入要查詢的 GitHub 使用者識別名稱（非顯示名稱）："
read github_user_name

# -i, --include: (HTTP) Include the HTTP-header in the output. The HTTP-header includes things like server-name, date of the document, HTTP-version and more...
curl --include https://api.github.com/users/${github_user_name}

printf "\n請按 Enter 鍵結束程式。"
read nothing
exit 0;
