#!/bin/bash
printf "請輸入您的 GitHub API 身份象徵物(token)："
read github_api_token

printf "請輸入您的 GitHub 識別名稱（非顯示名稱）："
read user_identifier

printf "請輸入版本倉庫識別名稱（非顯示名稱）："
read repository_identifier

printf "請輸入新議題標題："
read issue_title

printf "請輸入新議題內容（於新的一列中輸入「END_OF_ISSUE」再按下 Enter 鍵以繼續）："
while IFS= read -r input_line; do
  if [[ "$input_line" == "END_OF_ISSUE" ]]; then
    break
  fi
  issue_body+="${input_line}\n"
done
# 移除被 "\nEND_OF_ISSUE\n" 新增的最後一列文字（依賴 Bash >4.2-alpha）
# [Delete the last character of a string using string manipulation in shell script - Unix & Linux Stack Exchange](http://unix.stackexchange.com/questions/144298/delete-the-last-character-of-a-string-using-string-manipulation-in-shell-script)
issue_body=${issue_body::-2}

curl --include --header "Authorization: token ${github_api_token}"\
     --data "{ \
               \"title\": \"${issue_title}\", \
               \"body\": \"${issue_body}\", \
               \"labels\": [\"design\"]\
             }" \
     "https://api.github.com/repos/${user_identifier}/${repository_identifier}/issues"

printf "\n請按 Enter 鍵結束程式。"
read nothing
exit 0
