#!/bin/bash
# https://developer.github.com/guides/getting-started/#basic
printf "請輸入您的 GitHub API 身份象徵物(token)："
read github_api_token
curl --include --header "Authorization: token ${github_api_token}" https://api.github.com/user

exit 0;
