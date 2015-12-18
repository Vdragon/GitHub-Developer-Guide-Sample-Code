#!/bin/bash
while [[ "true" ]]; do
printf "請輸入要查詢的 GitHub 使用者識別名稱（非顯示名稱）（按下 Ctrl-C 以結束程式）："
read github_user_name

if [[ -v http_etag ]]; then
  curl_output="$(curl --include --silent --header "If-None-Match: \"${http_etag}\"" https://api.github.com/users/${github_user_name})"
else
  curl_output="$(curl --include --silent https://api.github.com/users/${github_user_name})"
fi


grep_output="$(printf "$curl_output" | grep "^ETag: ".*"$")"
if [[ "$?" == "0" ]]; then
  #printf "testing: grep_output=${grep_output}\n"
  http_etag=${grep_output##ETag: \"} # 移除前段（'ETag: "'）
  #printf "testing: http_etag=${http_etag}\n"
  http_etag=${http_etag::-2} # 移除後段（'"\n'）
  #printf "testing: http_etag=${http_etag}\n"
fi

printf "${curl_output}\n"
done
exit 0