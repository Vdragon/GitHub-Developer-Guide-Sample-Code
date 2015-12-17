#!/bin/bash
# https://developer.github.com/guides/getting-started/#basic
printf "請輸入您的使用者識別名稱（非顯示名稱）："
read github_user_name
curl --include --user ${github_user_name} https://api.github.com/user

exit 0;
