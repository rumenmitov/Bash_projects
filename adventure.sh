#!/bin/bash

hp=0
attack=0
magic=0
inventory=()
weapons=()

echo "What is your name?"
read name

echo "Welcome $USER! First select your race (1-4):
1 - Human
2 - Dwarf
3 - Elf
4 - Dragonborn "
read race

case $race in
	1)
		hp=$(($hp+2))
		attack=$(($attack+3))
		magic=$(($magic+0))
		;;
	2)
		hp=$(($hp+3))
		attack=$(($attack+1))
		magic=$(($magic+1))
		;;
	3)
		hp=$(($hp+2))
		attack=$(($attack+0))
		magic=$(($magic+3))
		;;
	4)
		hp=$(($hp+1))
		attack=$(($attack+2))
		magic=$(($magic+2))
		;;
esac

sleep 1

echo "Great! Now chose your class (1-4):
1 - Warrior
2 - Cleric
3 - Wizard
4 - Archer "
read class

case $class in
	1)
		hp=$(($hp+5))
		attack=$(($attack+7))
		magic=$(($magic+0))
		inventory=("Shield")
		weapons=("Shortsword")
		;;
	2)
		hp=$(($hp+8))
		attack=$(($attack+1))
		magic=$(($magic+3))
		inventory=("Book of life")
		;;
	3)
		hp=$(($hp+3))
		attack=$(($attack+3))
		magic=$(($magic+6))
		inventory=()
		weapons=("Book of Fire")
		;;
	4)
		hp=$(($hp+4))
		attack=$(($attack+8))
		magic=$(($magic+0))
		inventory=()
		weapons=("Longbow")
		;;
esac

echo "Gearing you up. Your HP: $hp. Your attack: $attack. Your magic: $magic"
echo "Your weapons are:"
for i in "${weapons[@]}"
do
	echo $i
done

echo ".............."
sleep 1
echo "**............"
sleep 1
echo "****.........."
sleep 1
echo "*******......."
sleep 1
echo "*********....."
sleep 1
echo "************.."
sleep 1
echo "**************"
sleep 1

echo "Now that you are all geared up let's get you into your first encounter!
You are ambushed by a goblin!"
sleep 5

goblinHP=10
goblinAttack=1

while [ $goblinHP -gt 0 ]
do
	echo "Your current HP: $hp"
	echo "Goblin attacks you with his scimitar!"
	hp=$(( $hp - $goblinAttack ))
	sleep 2
	if [[ $hp == 0 ]]; then
		echo "You died"
		exit 1
	else
		echo "Quick! Strike back!"
		echo "Which weapon / magic do you wish to use?"
		read weapon
		for i in "${weapons[@]}"
		do
			if [[ $weapon == $i ]]; then
				case $weapon in
					"Shortsword")
						goblinHP=$(( $goblinHP - 4 ))
						echo "You swing your sword!"
						;;
					"Book of Fire")
						goblinHP=$(( $goblinHP - 3 ))
						echo "You cast a fire spell!"
						;;
					"Longbow")
						goblinHP=$(( $goblinHP - 2 ))
						echo "You fire your bow!"
						;;
				esac
			fi
		done


		goblinHP=$(( $goblinHP - $attack ))
	fi
done

echo "Well done! You have survived the goblin attack.
You are ready to begin your adventure!"
