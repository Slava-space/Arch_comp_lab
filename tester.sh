#!/bin/bash

echo "Текущий пользователь: $(whoami)"
echo "UID: $UID"
echo "EUID: $EUID"


testCase1() {
	rm -rf /Volumes/$dir_name/*
	echo "Тест №1 запущен:"

	dd if=/dev/zero of=/Volumes/$dir_name/testFile.log bs=1M count=1024 status=none

	echo "Создан 1 файл размера 1024Mb"
	echo ""
	echo "Результат работы скрипта-архиватора:"
	bash /Users/steve/Downloads/script_1.sh -path "$folder" -percent "$perc"
	echo ""
	echo "Тест №1 завершен!"
	echo "/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/"
	echo ""
}
testCase2() {
	rm -rf /Volumes/$dir_name/*
	echo "Тест №2 запущен:"
	echo "Создано 0 файл размера 0"
	echo ""
	echo "Результат работы скрипта-архиватора:"
	bash /Users/steve/Downloads/script_1.sh -path "$folder" -percent "$perc"
	echo ""
	echo "Тест №2 завершен!"
	echo "/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/"
	echo ""
}
testCase3() {
	rm -rf /Volumes/$dir_name/*
	echo "Тест №3 запущен:"

	for i in {1..200}
	do
	dd if=/dev/zero of=/Volumes/$dir_name/testFile_$i.log bs=1M count=8 status=none
	done

	echo "Создано 200 файл размера 8Mb: общий объём 1600Mb"
	echo ""
	echo "Результат работы скрипта-архиватора:"
	bash /Users/steve/Downloads/script_1.sh -path "$folder" -percent "$perc"
	echo ""
	echo "Тест №3 завершен!"
	echo "/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/"
	echo ""
}
testCase4() {
	rm -rf /Volumes/$dir_name/*
	echo "Тест №4 запущен:"

	for i in {1..10}
	do
	dd if=/dev/zero of=/Volumes/$dir_name/testFile_$i.log bs=1M count=80 status=none
	done

	echo "Создано 10 файл размера 80Mb: общий объём 800Mb"
	echo ""
	echo "Результат работы скрипта-архиватора:"
	bash /Users/steve/Downloads/script_1.sh -path "$folder" -percent "$perc"
	echo ""
	echo "Тест №4 завершен!"
	echo "/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/"
	echo ""
}
testCase5() {
	rm -rf /Volumes/$dir_name/*
	echo "Тест №5 запущен:"

	for i in {1..40}
	do
	dd if=/dev/zero of=/Volumes/$dir_name/testFile_$i.log bs=1M count=50 status=none
	done

	echo "Создано 40 файлов размера 50Mb,: общий объём 2000Mb, заполнение диска на ~97.7%"
	echo ""
	echo "Результат работы скрипта-архиватора:"
	bash /Users/steve/Downloads/script_1.sh -path "$folder" -percent "$perc"
	echo ""
	echo "Тест №5 завершен!"
	echo "/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/"
	echo ""
}
testCase6() {
	rm -rf /Volumes/$dir_name/*
	echo "Тест №6 запущен:"

	dd if=/dev/zero of=/Volumes/$dir_name/"test file 1.log" bs=1M count=200 status=none
	dd if=/dev/zero of=/Volumes/$dir_name/test-#@!.log bs=1M count=200 status=none
	dd if=/dev/zero of=/Volumes/$dir_name/%TeSt^file!+.log bs=1M count=200 status=none
	dd if=/dev/zero of=/Volumes/$dir_name/?__2File,Test.log bs=1M count=200 status=none
	dd if=/dev/zero of=/Volumes/$dir_name/"File@&'Te#st.log" bs=1M count=200 status=none

	echo "Создано 5 файлов размера 200Mb, общий объём 1000Mb, с именами:"
	echo "test file 1.log"
	echo "test-#@!.log"
	echo "%TeSt^file!+.log"
	echo "?__2File,Test.log"
	echo "File@&'Te#st.log"

	echo ""
	echo "Результат работы скрипта-архиватора:"
	bash /Users/steve/Downloads/script_1.sh -path "$folder" -percent "$perc"
	echo ""
	echo "Тест №6 завершен!"
	echo "/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/"
	echo ""
}
testCase7() {
	rm -rf /Volumes/$dir_name/*
	echo "Тест №7 запущен:"

	mkdir /Volumes/$dir_name/subdir
	dd if=/dev/zero of=/Volumes/$dir_name/subdir/subTestFile.log bs=1M count=512 status=none

	for i in {1..5}
	do
	dd if=/dev/zero of=/Volumes/$dir_name/testFile_$i.log bs=1M count=80 status=none
	done

	echo "Создана 1 папка объёмом 512Mb, 5 файлов размера 80Mb: общий объём 912Mb"
	echo ""
	echo "Результат работы скрипта-архиватора:"
	bash /Users/steve/Downloads/script_1.sh -path "$folder" -percent "$perc"
	echo ""
	echo "Тест №7 завершен!"
	echo "/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/"
	echo ""
}
testCase8() {
	rm -rf /Volumes/$dir_name/*
	echo "Тест №8 запущен:"


	for i in {1..5}
	do
	dd if=/dev/zero of=/Volumes/$dir_name/testFile_$i.log bs=1M count=80 status=none
	done

	echo "Создано 5 файлов размера 80Mb, общий объём 400Mb"

	touch -t 202401010000 /Volumes/$dir_name/testFile_1.log
	touch -t 202301010000 /Volumes/$dir_name/testFile_2.log
	touch -t 202201010000 /Volumes/$dir_name/testFile_3.log
	touch -t 202101010000 /Volumes/$dir_name/testFile_4.log
	touch -t 202001010000 /Volumes/$dir_name/testFile_5.log

	echo "Изменены даты модификации файлов(Теперь самый новый файл имеет номер 1, самый старый - 5)"

	echo ""
	echo "Результат работы скрипта-архиватора:"
	bash /Users/steve/Downloads/script_1.sh -path "$folder" -percent "$perc"
	echo ""
	echo "Оставшиеся файлы:"
	ls "$folder"
	echo "Тест №8 завершен!"
	echo "/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/"
	echo ""
}


instruction() {
	echo "Используя: $0 -name [название диска] -percent [пороговое значение]"
	echo "Например: $0 -name MyDisk -percent 55"
	echo "Команды:"
	echo "-name  [название создаваемого виртуального диска для тестов]"
	echo "-percent [ввод порогового значения для начала архивации]"
	echo "-help [показывать эту инструкцию]"
	exit 0
}

while [ $# -gt 0 ]; do
	case $1 in
		-name)
			dir_name="$2"
			shift 2
			;;
		-percent)
			perc="$2"
			shift 2
			;;
		-help)
			instruction
			;;
		*)
			echo "Неизвестная команда"
			instruction
			;;
	esac
done

if [ -z "$dir_name" ] || [ -z "$perc" ]; then
	echo "Введены не все обязательные параметры"
	instruction
	exit 1
fi

if [ "$perc" -lt 0 ] || [ "$perc" -gt 100 ]; then
	echo "Вы ввели неправильное число"
	exit 1
fi


hdiutil create -size 2048m -fs ExFAT -volname "$dir_name" ~/$dir_name.dmg
hdiutil attach ~/$dir_name.dmg
echo "Диск смонтирован успешно!"
echo ""

folder="/Volumes/$dir_name"

echo "Создан образ диска, размер: 2048Mb"

testCase1
testCase2
testCase3
testCase4
testCase5
testCase6
testCase7
testCase8

echo "Выполнение тестов завершено!"

rm -rf /Volumes/$dir_name/*
echo "Диск очишен"

hdiutil detach /Volumes/$dir_name
echo "Диск размонтирован"
