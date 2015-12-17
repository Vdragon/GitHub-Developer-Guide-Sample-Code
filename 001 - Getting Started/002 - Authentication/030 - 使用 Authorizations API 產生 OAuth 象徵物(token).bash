#!/bin/bash
# https://developer.github.com/guides/getting-started/#basic
printf "請輸入您的使用者識別名稱（非顯示名稱）："
read github_user_name
curl --include --user ${github_user_name} --data '{"scopes": ["repo", "user"], "note": "用於 GitHub Developer Guide  - Getting Started 的 API 象徵物(token)"}' https://api.github.com/authorizations

exit 0;
