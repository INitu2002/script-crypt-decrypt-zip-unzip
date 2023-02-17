#!/bin/bash
echo -e "\nIntroduceti o optiune: 1 sau 2 sau CTRL/C pt stop"
echo "1) criptare"
echo "2) decriptare"
read optiune
while [ $optiune ]
do
	if [ $optiune -eq 1 ]
	then
		echo "Alegeti algoritmul de criptare:"
		select alg in md4 gost tiger
			do
			if [ -n $alg ]
			then
					echo "   Din ce director doriti sa criptati?"
					~/proiect/faceLS-lDir.sh ~/proiect
					read director
					echo "   Fisierele din directorul $director sunt:"
					~/proiect/faceLS.sh $director
					nrFisNecrpt=0
					for m in $director/*
						do
							if [[ $m != *.nc ]]
							then
								nrFisNecrpt=`expr $nrFisNecrpt + 1`
							fi
						done
					if [ $nrFisNecrpt -eq 0 ]
					then
						echo -e "   Toate fisiserele sunt criptate deja!\n   Nu mai aveti ce cripta!"
						~/proiect/inc1.sh
					else
								echo -e "\n   Doriti sa criptati toate fisierele separat sau arhivandu-le? \n   Separat - Da; Arhivate - Nu"
								read rasp
								if [ $rasp == "Da" ]
								then
									
									for j in $director/*
									do
										~/proiect/ceFisCriptez.sh $j $alg
										if [[ $j != *.nc ]]
										then
											rm $j 2> /dev/null
										fi
									done
									echo -e "\n   Directorul $director contine acum:"
									~/proiect/faceLS.sh $director
								elif [ $rasp == "Nu" ]
								then
									~/proiect/arhivare.sh $director
									echo "   Arhiva este:"
									~/proiect/faceLS.sh $director
									~/proiect/ceDirCriptez.sh $director $alg
									for i in $director/*
									do
										if [[ $i != *.nc ]]
										then
											rm $i 2> /dev/null
										fi
										if [[ $i != *.tar.gz.nc ]]
										then
											rm $i 2> /dev/null
										fi
									done
									echo -e "\n  Directorul $director contine acum:"
									~/proiect/faceLS.sh $director
								fi
							~/proiect/inc1.sh
					fi
			fi
			done
	fi

	if [ $optiune -eq 2 ]
	then
		echo "   Din ce director doriti sa decriptati fisiere?"
		~/proiect/faceLS-lDir.sh ~/proiect
		read director
		echo "   Fisierele din director sunt:"
		~/proiect/faceLS.sh $director
		echo "  Sigur doriti sa decriptati fisierul/fisierele? Da/Nu"
		read rasp
		if [ $rasp == "Da" ]
			then
				for i in $director/*
				do
					if [[ $i == *.tar.gz.nc ]]
					then
						~/proiect/ceDirdecriptez.sh ~/proiect/$director
						~/proiect/dezarhivare.sh ~/proiect/$director
						rm ~/proiect/$director/*.tar.gz
						echo "   $director contine acum:"
						~/proiect/faceLS.sh ~/proiect/$director
					else
						~/proiect/ceDirdecriptez.sh ~/proiect/$director
						break
					fi
				done
			else
				~/proiect/ceDirdecriptez.sh ~/proiect/$director
				echo "   $director contine acum:"
				~/proiect/faceLS.sh $director
		fi
	fi
read optiune
~/proiect/inc1.sh
done

