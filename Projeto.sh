  
#!/bin/bash

function diretorio (){
	for i in $(ls); do
		if [ -d $i ]; then
			echo " $i"
		fi
	done
}

function arquivo (){
	for j in $(ls); do
		if [ -f $j ]; then
			echo " $j"
		fi
	done
}


while true; do
    echo "Bem-vindo ao Projeto de Shell Script 2020.2"
	echo "Você está dentro do Diretório $(pwd)"
	echo "Existe essa lista de arquivos: "
	for i in $(ls); do
		
		if [ -f $i ]; then
			echo " $i"
		fi
	done

	echo "Existe essa lista de diretórios: "

	for j in $(ls); do
		if [ -d $j ]; then
			echo " $j"
		fi
	done

	echo "###########################"
	echo " 1 - Entrar no diretório"
	echo " 2 - Voltar um diretório"
	echo " 3 - Listar arquivos por extensão"
    echo " 4 - Editar um arquivo"
    echo " 5 - Visualizar a preview de um arquivo"
    echo " 6 - Deletar um arquivo no sistema"
    echo " 7 - Deletar um diretório no sistema"
    echo " 8 - Fazer backup de um arquivo"
    echo " 9 - Fazer backup de um diretório"
    echo "10 - Ler o conteúdo de um arquivo"
    echo "11 - Visualizar a árvore de um diretório"
   	echo "12 - Visualizar a quantidade de Bytes de um arquivo"
  	echo "13 - Compactar um arquivo"
   	echo "14 - Compactar um diretório"
    echo "15 - Visualizar o arquivo por paginação"
    echo "16 - Criar um arquivo"
    echo "17 - Criar um diretório"
    echo "18 - Mostrar o diretório atual"
	echo "19 - Limpar o terminal"
	echo "20 - Sair do menu"
	echo "###########################"
	read -p "Qual procedimento você deseja executar? Por favor digite a opção abaixo: " opcao
	
	if [ $opcao == "1" ]
		diretorio
		read -p "Qual diretório que deseja entrar? " diretorio
		if test -d $diretorio; then
			cd $diretorio
		else
			echo "O diretório não encontrado ou não existe"
			sleep 2
		fi
    fi
	
	if [ $opcao == "2" ]; then
		arquivo
		diretorio
		if [ $(pwd) != "/" ]; then
			cd ..
        else
		    echo "Último diretório"
		    sleep 2
        fi
	fi	
	
	if [ $opcao == "3"]; then
		arquivo
		read -p "Extensão que deseja buscada: " extensao
		if test -f $extensao; then
			ls*$extensao
        else
            echo "Não foi encontrado nenhuma extensão nesse diretório."
            sleep 2
        fi
    fi


	if [ $opcao == "4" ]:
		arquivo
        read -p "Qual arquivo você deseja editar? " edicao
		if test -f $edicao; then
           	read -p "Prefere editor nano ou vim? " editor
            if [editor == "nano"];then  
                nano $edicao
            else
                vim $edicao
            fi
        else
		    echo "O arquivo não foi encontrado ou não existe."
            sleep 2
        fi
    fi

	if [ $opcao == "5" ]:
		arquivo
		read -p "O arquivo a ser pré-visualizado: " previsao
		if test -f $previsao; then
			head $previsao 
			echo "####################################################################"
            tail $previsao
		else
		    echo "O arquivo não foi encontrado ou não existe."
            sleep 2
        fi
     fi

    if [ $opcao == "6" ]:
        arquivo
		read -p "Escreva qual arquivo você deseja que seja removido na máquina, lembre-se que após deletar esse arquivo não será mais possível recuperar o mesmo, caso não tenha feito o backup. " deleta_arquivo
		if test -f $deletar_arquivo; then
			rm -r $deletar_arquivo
		else
		    echo "O arquivo que você deseja deletar não foi encontrado ou não existe."
            sleep 2
        fi
	 fi

    if [ $opcao == "7" ]:
        diretorio
		read -p "Escreva qual diretório você deseja que seja removido na máquina, lembre-se que após deletar esse diretório não será mais possível recuperar o mesmo, caso não tenha feito o backup. "
		if test -d $deletar_diretorio; then
			rmdir $deletar_diretorio
		else
		    echo "O Diretório que você deseja deletar não foi encontrado ou não existe."
			sleep 2
        fi
	fi

    if [ $opcao == "8" ]:
        arquivo
		read -p "Qual arquivo você deseja que faça o backup? " backup
		if test -f $backup_arquivo; then
			read -p "Escreva como quer salvar esse arquivo: " renomear_backup_arquivo
			cp $backup_arquivo $renomear_backup_arquivo
		else
			echo "O backup não realizado, ocorreu algum erro durante a operação."
            sleep 2
        fi
	fi

	if [ $opcao == "9" ]:
        diretorio
        sudo apt-get install rsync
		read -p "Digite o nome do diretório que deseja fazer o backup. " backup_diretorio
		if test -f $backup_diretorio; then
            mkdir $backup_diretorio.backup
            rsync -r $backup_diretorio / $backup_diretorio.backup
		else
		    echo "O backup não realizado, ocorreu algum erro durante a operação."
            sleep 2
        fi
	fi

    if [ $opcao == "10" ]:
        arquivo
		read -p "Qual arquivo você deseja ler? " arquivo_cat
		if test -f $arquivo_cat; then
			cat $arquivo_cat
		else
		    echo "O arquivo não foi encontrado ou não existe."
            sleep 2
        fi
	fi

    if [ $opcao == "11" ]:
        diretorio
        arquivo
        apt-get install tree
		read -p "Qual diretório você deseja ver em forma de árvore? " diretorio_tree
		if test -f $diretorio_tree; then
            tree /$diretorio_tree
		else
		    echo "O diretório não foi encontrado ou não existe."
            sleep 2
        fi
	fi

    if [ $opcao == "12" ]:
        arquivo
		read -p "Qual arquivo você deseja ver a quantidade de bytes? " arquivo_bytes
		if test -f $arquivo_bytes; then
            wc -c $arquivo_bytes
		else
		    echo "O arquivo não foi encontrado ou não existe."
            sleep 2
        fi
	fi

    if [ $opcao == "13" ]:
        arquivo
        apt-get install zip
		read -p "Qual arquivo você deseja compactar? " arquivo_compact
	    if test -f $arquivo_compact; then
            zip $arquivo_compact
		else
		    echo "O arquivo não foi encontrado ou não existe."
            sleep 2
        fi
	fi

    if [ $opcao == "14" ]:
        diretorio
        arquivo
        apt-get install zip
		read -p "Qual diretório você deseja compactar? " diretorio_compact
		if test -f $diretorio_compact; then
           	zip –r diretorio_compact.zip $diretorio_compact
            read -p "Qual nome deseja para o arquivo que ficará compactado desse diretório? " $renomear_diretorio_compact
                cp diretorio_compact $renomear_diretorio_compact
		else
			echo "O diretório não foi encontrado ou não existe."
            sleep 2
        fi
	fi

	if [ $opcao == "15" ]:
        arquivo
		read -p "Qual arquivo deseja visualizar por páginas? " arquivo_pagina
		if test -f $arquivo_pagina; then
            more $arquivo_pagina
		else
		    echo "O arquivo não foi encontrado ou não existe."
            sleep 2
        fi
	fi

    if [ $opcao == "16" ]:
        arquivo
		read -p "Qual nome do arquivo que deseja criar? " $arquivo_touch
		if test -f $arquivo_touch; then
            touch $arquivo_touch
        fi
	fi

    if [ $opcao == "17" ]:
        diretorio
		read -p "Qual nome do diretório que deseja criar? " $arquivo_mkdir
		if test -f $arquivo_mkdir; then
            mkdir $arquivo_mkdir
        fi
        
	fi

	if [ $opcao == "18" ]; then
		pwd
		sleep 2
    fi

    if [ $opcao == "19" ];then
		clear
    fi

    if [ $opcao == "20" ];then
		exit 1
    fi
done