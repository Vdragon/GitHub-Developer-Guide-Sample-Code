#!/bin/bash
printf "請輸入要查詢的 GitHub 使用者識別名稱（非顯示名稱）："
read github_user_name
curl https://api.github.com/users/${github_user_name}

exit 0;
