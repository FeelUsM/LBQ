#!/bin/bash

echo Please  wait a minute...

MD5= 
if [ `which md5 2> /dev/null | grep md5 | wc -c` -ne 0 ]; then 
    MD5=md5
fi
if [ `which md5sum 2> /dev/null | grep md5| wc -c` -ne 0 ]; then 
    MD5=md5sum
fi
if [ "$MD5" =  "" ]; then
    echo  "Error, some  command was not found  on your mashine"
    exit
fi

TASKDIR=LinuxBeginnerQuest

if [ -e $TASKDIR ]; then
	if [ `uname | grep -i cygwin` ]; then
		find . * 2> /dev/null | xargs chmod 777 &> /dev/null
		find . * 2> /dev/null | xargs chmod 777 &> /dev/null
	else
		find . * 2> /dev/null | xargs chmod 700 &> /dev/null
		find . * 2> /dev/null | xargs chmod 700 &> /dev/null
	fi
#    chmod -R 700 $TASKDIR
    rm -rf $TASKDIR
fi
mkdir -p  $TASKDIR
if [ -f ./makeTask   ]; then
    rm ./makeTask
fi
if [ -f ./makeLongLine   ]; then
    rm makeLongLine
fi

for name1 in $LIST;
 do
  mkdir $TASKDIR/$name1;
  for name2 in $LIST;
   do
    mkdir $TASKDIR/$name1/$name2;
    for name3 in $LIST;
     do
      mkdir $TASKDIR/$name1/$name2/$name3
     done
   done
 done

make > /dev/null

LIST="a b c d e f g h i j k l m n o p q r s t y"
LIST_=`echo $LIST | sed 's/ //g'`
LIST_LEN=`echo $LIST_ | wc -c`
LIST_LEN=$(($LIST_LEN-1))
function r_letter {
	local r=$(($RANDOM%$LIST_LEN+1))
	echo -n $LIST_ | cut -c $r
}
function r_path {
	local tmp=`r_letter`/`r_letter`/`r_letter`
	# вероятность совпадения хотябы двух путей 1.6%
	while [ $tmp = $PATH0 -o $tmp = $PATH1 -o $tmp = $PATH2 -o $tmp = $PATH3 -o $tmp = $PATH4 -o $tmp = $PATH5 ]; do
		tmp=`r_letter`/`r_letter`/`r_letter`
	done
	echo $tmp
}

PATH0=`r_path`
PATH1=`r_path`
PATH2=`r_path`
PATH3=`r_path`
PATH4=`r_path`
PATH5=`r_path`

n1=
n2=
n3=
n4=
n5=
n6=
n7=
n8=
n9=

FILENAME0=.secret
FILENAME1=ugauga
FILENAME2=mambo
FILENAME3=`echo $USER| $MD5| cut -f1 -d' '| $MD5`
FILENAME4=sambo
FILENAME5=veryLongLine
FILENAME6=`date|$MD5|cut -c5-9`

#todo
# написать генератор новых случайных чисел
# настроить генератор новых случайных путей
# переделать makeTask на 2 программы
# сделать запутывание при генерации ключей
# придумать имена
# все оттестировать

next_task=0
KEY='................................'

for i in `seq 0 8`; do
	cur_task=next_task
	cur_path=next_path
	if [ $i != 8 ]; then
		next_task=...
		eval n$i=next_task
		
		next_path=...
		eval PATH$i=path
		
		case next_task in
		  1) task="last lines of file $FILENAME6 in  directory $TASKDIR/$next_path."
		  ;;
		  2) task="one file, which is certainly placed in directory $TASKDIR/$next_path"
		  ;;
		  3) task="file ugauga somewere in the directory $TASKDIR"
		  ;;
		  4) task=$'file, which contains a word  "GoodBoy". \nThe file is somewhere in the directory '$TASKDIR', but of course it is not the current one :)'
		  ;;
		  5) task="the file "$TASKDIR/$next_path/$FILENAME3
		  ;;
		  6) task="file, which is placed somewhere in directory "$TASKDIR/$next_path
		  ;;
		  7) task="the second line of file "$TASKDIR/$next_path/$FILENAME5
		  ;;
		  8) task="file "$TASKDIR/$next_path/$FILENAME6" at line 367 from end of file"
		  ;;
		  
		esac
	else
		task=$'... oh, this is final task. \nBut you may assume other numbers of your code, if you read sources.'
	fi
	
	prefix=
	next=next
	case $I in
	0)	next=first
	;;
	2)	prefix="Well, let's go forward."$'\n'
	;;
	5)	prefix="Only 3 tasks are left!"$'\n'
	;;
	7)	next=final
	;;
	8)	prefix="The Quest is complete, congratulations!"$'\n'
	;;
	esac
	
	case cur_task in
	0)
		echo "Welcome To Linux Beginner Quest v0.5" >> $TASKDIR/README
		echo "" >> $TASKDIR/README
		echo "There are 8 tasks here." >> $TASKDIR/README
		echo "After completion each task you will get the code." >> $TASKDIR/README
		echo "When all tasks will be finished, or when you give up, you should send this code to your supervisor." >> $TASKDIR/README
		echo "Your $next task is described in $task" >> $TASKDIR/README
	;;
	1)
		code=`obscurity 1`
		KEY=`echo $KEY | sed 's/(..)(..............................)/'$code'\2/g'`
		./makeLastLine "$prefix Your code is ''$USER $KEY''"$'\n'"Please read your $next task in $task" >
			$TASKDIR/$cur_path/$FILENAME6
	;;
	2)
		code=`obscurity 2`
		KEY=`echo $KEY | sed 's/(..)(..............................)/'$code'\2/g'`
		echo -e "\n $prefix Your code is ''$USER $KEY''"$'\n'"Your $next task is in $task \n" >
			$TASKDIR/$cur_path/.secret
	;;
	3)
		code=`obscurity 3`
		KEY=`echo $KEY | sed 's/(..)(..............................)/'$code'\2/g'`
		echo -e "\n $prefix Your code is ''$USER $KEY''"$'\n'"Your $next task is described in $task \n" >
			$TASKDIR/$cur_path/ugauga
	;;
	4)
		code=`obscurity 4`
		KEY=`echo $KEY | sed 's/(..)(..............................)/'$code'\2/g'`
		echo -e "GoodBoy!\n $prefix Your code is ''$USER $KEY''"$'\n'"Your $next task is in $task \n" >
			$TASKDIR/$cur_path/$FILENAME2
	;;
	5)
		code=`obscurity 5`
		KEY=`echo $KEY | sed 's/(..)(..............................)/'$code'\2/g'`
		echo -e "\n $prefix Your code is ''$USER $KEY''"$'\n'"Your $next task is in $task \n" >
			$TASKDIR/$cur_path/$FILENAME3
		chmod a-r $TASKDIR/$cur_path/$FILENAME3
	;;
	6)
		code=`obscurity 6`
		KEY=`echo $KEY | sed 's/(..)(..............................)/'$code'\2/g'`
		echo -e "\n $prefix Your code is ''$USER $KEY''"$'\n'"The $next task is placed in $task \n" >
			$TASKDIR/$cur_path/$FILENAME4
		chmod a-x $TASKDIR/$cur_path
	;;
	7)
		code=`obscurity 7`
		KEY=`echo $KEY | sed 's/(..)(..............................)/'$code'\2/g'`
		./makeLongLine "$prefix Your code is ''$USER $KEY''"$'\n'"You can find the $next task in " >
			$TASKDIR/$cur_path/$FILENAME5
	;;
	8)
		code=`obscurity 8`
		KEY=`echo $KEY | sed 's/(..)(..............................)/'$code'\2/g'`
		./make367 "$prefix Your code is ''$USER $KEY''"$'\n'"You can find the $next task in " >
			$TASKDIR/$cur_path/$FILENAME5
	;;
	esac
done	
	
