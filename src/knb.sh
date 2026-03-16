#!/bin/bash

params=null
api="https://rockpaperscissors-miniapp.online:30000/api"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function _get() {
    curl --request GET \
        --url "$api/$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json" \
        --header "authorization: Bearer $params"
}

# 1 - sign: (string): <sign>
# 2 - vk_user_id: (integer): <vk_user_id>
# 3 - vk_ts: (integer): <vk_ts>
# 4 - vk_ref: (string): <vk_ref>
# 5 - access_token_settings: (string): <access_token_settings - default: >
# 6 - are_notifications_enabled: (integer): <are_notifications_enabled - default: 0>
# 7 - is_app_user: (integer): <is_app_user - default: 0>
# 8 - is_favorite: (integer): <is_favorite - default: 0>
# 9 - language: (string): <language - default: ru>
# 10 - platform: (string): <platform - default: desktop_web>
function authenticate() {
    params="vk_access_token_settings=${5:-}&vk_app_id=51476136&vk_are_notifications_enabled=${6:-0}&vk_is_app_user=${7:-0}&vk_is_favorite=${8:-0}&vk_language=${9:-ru}&vk_platform=${10:-desktop_web}&vk_ref=$4&vk_ts=$3&vk_user_id=$2&sign=$1"
    echo "$params"
}

function get_user() {
    _get "user"
}

function get_rating() {
    _get "rating/all"
}

function get_user_packs() {
    _get "pack/userpacks"
}

function get_packs() {
    _get "pack/get"
}
