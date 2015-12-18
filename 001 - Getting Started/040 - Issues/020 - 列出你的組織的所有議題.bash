#!/bin/bash
printf "請輸入要查詢的組織名稱："
read github_query_organization

printf "請輸入您的 GitHub API 身份象徵物(token)："
read github_api_token

curl --include --header "Authorization: token ${github_api_token}" "https://api.github.com/orgs/${github_query_organization}/issues"

printf "\n請按 Enter 鍵結束程式。"
read nothing
exit 0
