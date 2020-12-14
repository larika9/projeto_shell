#!/bin/bash

function dir (){
	for i in $(ls); do
		if [ -d $i ]; then
			echo " $i"
		fi
	done
}

function arq (){
	for j in $(ls); do
		if [ -f $j ]; then
			echo " $j"
		fi
	done
}


while true; do
	echo "Diretório $(pwd)"
	echo "Lista de arquivos: "
	for i in $(ls); do
		
		if [ -f $i ]; then
			echo " $i"
		fi
	done

	echo "Lista de diretórios: "

	for j in $(ls); do
		if [ -d $j ]; then
			echo " $j"
		fi
	done

	echo "###########################"
	echo " 1 - Entrar no diretório"
	echo " 2 - Voltar um diretório"
	echo " 3 - Listar arquivos por extensão" 
	echo "###########################"
	read -p "Digite uma opção: " opcao
	
	if [ $opcao == "1" ]
		dir
		read -p "Digite um diretório: " dirr
		if test -d $dirr; then
			cd $dirr
		else
			echo "Diretório não encontrado ou não existe"
			sleep 2
		fi
	fi
	
	if [ $opcao == "2" ]; then
		arq	
		dir
		if [ $(pwd) != "/" ]; then
			cd ..
			else
			echo "Último diretório"
			sleep 2
		fi
	if	
	
	if [ $opcao == "3"]; then
		arq 
		read -p "Extensão a ser buscada: " ext
		ls*$ext
	fi
	if [ opcao == "4" ]:
		arq
		ls -l
	
	if [ opcao == "5" ]:
		arq
		read -p "Arquivo a ser pré visualizado: " pre
		cat pre
		
		cat 
done	