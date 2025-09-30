#!/bin/bash

instruction() {
	echo "Используя: $0 -p [путь до папки] -x [пороговое значение]"
	echo "Например: $0 -p /tmp/log -x 55"
	echo "Команды:"
	echo "-p, --path  [ввод пути до нашей папки]"
	echo "-x, --percent [ввод порогового значения для начала архивации]"
	echo "-h, --help [показывать эту инструкцию]"
	exit 0
}

while [ $# -gt 0 ]; do
	case $1 in
		-p|--path)
			path_dir="$2"
			shift 2
			;;
		-x|--percent)
			perc="$2"
			shift 2
			;;
		-h|--help)
			instruction
			;;
		*)
			echo "Неизвестная команда"
			instruction
			;;
	esac
done

if [ -z "$path_dir" ] || [ -z "$perc" ]; then
	echo "Введены не все обязательные параметры"
	instruction
	exit 1
fi

if [ ! -d "$path_dir" ]; then
	echo "Такой папки нет на устройстве"
	exit 1
fi

if [ "$perc" -lt 0 ] || [ "$perc" -gt 100 ]; then
	echo "Вы ввели неправильное число"
	exit 1
fi

bu_dir="/Users/steve/backupTest"
mkdir -p "$bu_dir"
cnt=0
CurrPerc=$(df "$path_dir" | tail -1 | tr -s ' ' | cut -d' ' -f5 | tr -d '%')
if [ "$CurrPerc" -gt "$perc" ]; then
	mkdir -p "$bu_dir/Temp"
	Temp_dir="$bu_dir/Temp"
	while [ "$CurrPerc" -gt "$perc" ]; do
		Oldest_File=$(ls -tp "$path_dir" | grep -v '/$' | tail -1)
		if [ -z "$Oldest_File" ]; then
      			echo "Нет файлов для архивации"
       			break
    		fi
		mv "$path_dir/$Oldest_File" "$Temp_dir/"
		((cnt++))
		CurrPerc=$(df "$path_dir" | tail -1 | tr -s ' ' | cut -d' ' -f5 | tr -d '%')
	done
    	tar -czf "$bu_dir/Folder.tar.gz" -C "$Temp_dir" .
	rm -rf "$Temp_dir"
	echo "Архивация  закончена было обработано $cnt файлов"
else
	echo "Пороговое значение не превышено"
fi
