#!/bin/bash
printf "請輸入您要察看的 GitHub 使用者／組織識別名稱（非顯示名稱）："
read github_user_or_organization_identifier
printf "請輸入您要察看的 Git 版本倉庫名稱（非顯示名稱）："
read github_repo_identifier

curl --include "https://api.github.com/repos/$github_user_or_organization_identifier/$github_repo_identifier/issues"

printf "\n請按 Enter 鍵結束程式。"
read nothing
exit 0
