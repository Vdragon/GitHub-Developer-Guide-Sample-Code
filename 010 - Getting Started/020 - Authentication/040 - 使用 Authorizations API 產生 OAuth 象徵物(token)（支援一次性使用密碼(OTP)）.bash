#!/bin/bash
# https://developer.github.com/guides/getting-started/#basic
printf "請輸入您的使用者識別名稱（非顯示名稱）："
read github_user_name
printf "請輸入您的 GitHub 一次性使用密碼(OTP)："
read github_one_time_password
curl --include --user ${github_user_name} --header "X-GitHub-OTP: ${github_one_time_password}" --data '{"scopes": ["repo", "user"], "note": "用於 GitHub Developer Guide  - Getting Started 的 API 象徵物(token)"}' https://api.github.com/authorizations

printf "\n請按 Enter 鍵結束程式。"
read nothing
exit 0
