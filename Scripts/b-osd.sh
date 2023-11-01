vol=$(light -G)
vol=$( printf "%.0f" $vol )
repeatChar() {
    local input="$1"
    local count="$2"
    printf -v myString '%*s' "$count"
    printf '%s\n' "${myString// /$input}"
}


str=$(repeatChar ▰ $(($vol/10))  )
str+=$(repeatChar ▱ $((10-$vol/10)) )

gdbus call --session \
            --dest org.freedesktop.Notifications \
            --object-path /org/freedesktop/Notifications \
            --method org.freedesktop.Notifications.Notify \
            my_app_name \
            42 \
            brightnesssettings \
            "$str" \
            "$vol%" \
            [] \
            {} \
            2000
