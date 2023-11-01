vol=$(pamixer --get-volume)
icon=''

repeatChar() {
    local input="$1"
    local count="$2"
    printf -v myString '%*s' "$count"
    printf '%s\n' "${myString// /$input}"
}

no_negatives () {
    echo "$(( $1 < 0 ? 0 : $1 ))"
}

if ( [ $(pamixer --get-mute) = 'false' ]  )
then
	str=$(repeatChar ▰  $(no_negatives $(($vol/10)) ))
	str+=$(repeatChar ▱  $(no_negatives $((10-$vol/10)) ))
	icon=volume-level-medium
	vol+=%
	if [ "$vol" = '0%' ]
	then
		icon=volume-level-muted
	fi
else
	str='Muted'
	vol=''
	icon=volume-level-muted
fi




gdbus call --session \
            --dest org.freedesktop.Notifications \
            --object-path /org/freedesktop/Notifications \
            --method org.freedesktop.Notifications.Notify \
            my_app_name \
            42 \
            "$icon" \
            "$str" \
            "$vol" \
            [] \
            {} \
            2000
