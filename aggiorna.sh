#!/bin/bash

#Questo script aggiorna la directory di github (~/Documenti/GitHub_projects/Workspaces)
os=`uname`
pcname=`hostname`

if [ $os == "MINGW64_NT-10.0-19044" ]
then
	cd /c/Users/amede/GitHub_projects/Tesi/
fi

#Controlla che non ci siano aggiornamenti e poi carica le modifiche fatte nello stage
git pull origin main
git add *

#Controlla che non siano stati eliminati dei file dalla directory
log=`git commit -m "aggiornato da $pcname" | awk '/eliminato:/{print $2}'`

#se li trova li elimina da git
for i in $log
	do
		git rm $i; git commit -m "aggiornato da $pcname"
done

#stesso codice ma per il terminale inglese
log=`git commit -m "aggiornato da $pcname" | awk '/deleted:/{print $2}'`

#se li trova li elimina da git
for i in $log
	do
		git rm $i; git commit -m "aggiornato da $pcname"
done

#aggiorna la directory
git push origin main

read -n1 -r -p "Press any key to continue..."


#Token di accesso alla directory: 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


#Codice per clonare repository: git clone https://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@github.com/Requiem98/Workspaces.git
