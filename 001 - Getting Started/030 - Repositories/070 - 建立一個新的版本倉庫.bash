#!/bin/bash
set -x
printf "請輸入您要建立的 Git 版本倉庫識別名稱（非顯示名稱）："
read new_repository_identifier

printf "請問您是否要自動初始化版本倉庫(true/false)？"
read choice_auto_init_repository
while [[ ! ( "${choice_auto_init_repository}" == "false" || "${choice_auto_init_repository}" == "true" ) ]]; do
printf "錯誤：格式錯誤，請重新輸入。\n"
printf "請問您是否要自動初始化版本倉庫(true/false)？"
read choice_auto_init_repository
done

printf "請問您是否要建立私有版本倉庫(true/false)？"
read choice_is_private_repository
while [[ ! ( "${choice_is_private_repository}" == "false" || "${choice_is_private_repository}" == "true" ) ]]; do
printf "格式錯誤，請重新輸入。"
printf "請問您是否要自動初始化版本倉庫(true/false)？"
read choice_is_private_repository
done

printf "請輸入新版本倉庫要使用的 Git 版本追蹤忽略規則範本："
read gitignore_template

printf "請輸入您的 GitHub API 身份象徵物(token)："
read github_api_token

curl --include --header "Authorization: token ${github_api_token}" \
      --data "{ \
        \"name\": \"${new_repository_identifier}\", \
        \"auto_init\": $choice_auto_init_repository, \
        \"private\": $choice_is_private_repository, \
        \"gitignore_template\": \"nanoc\" \
      }" \
      https://api.github.com/user/repos

printf "\n請按 Enter 鍵結束程式。"
read nothing
exit 0
