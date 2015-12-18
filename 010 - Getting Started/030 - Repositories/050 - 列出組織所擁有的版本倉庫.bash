#!/bin/bash
printf "請輸入您要察看的 GitHub 組織識別名稱（非顯示名稱）："
read github_organization_identifier


curl --include "https://api.github.com/orgs/${github_organization_identifier}/repos"

printf "\n請按 Enter 鍵結束程式。"
read nothing
exit 0
