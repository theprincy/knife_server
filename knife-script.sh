#!/bin/bash
# Funzione per la ricerca di un file
function search_file() {
    echo -n "Inserire il nome del file da cercare: "
    read file_name
    echo "Cerco il file $file_name..."
    find / -name $file_name 2>/dev/null
}

# Funzione per la cancellazione di un file
function delete_file() {
    echo -n "Inserire il nome del file da cancellare: "
    read file_name
    echo "Cancello il file $file_name..."
    rm -f $file_name
}

# Funzione per la ricerca di un testo all'interno dei file
function search_text() {
    echo -n "Inserire il testo da cercare: "
    read search_text
    echo "Cerco il testo $search_text..."
    grep -r "$search_text" / 2>/dev/null
}

# Funzione per la modifica di un testo all'interno dei file
function replace_text() {
    echo -n "Inserire il testo da cercare: "
    read search_text
    echo -n "Inserire il testo di sostituzione: "
    read replace_text
    echo "Sostituisco il testo $search_text con $replace_text..."
    grep -rl "$search_text" / | xargs sed -i "s/$search_text/$replace_text/g"
}

# Funzione per il backup di un database
function backup_db() {
    echo -n "Inserire il nome del database da eseguire il backup: "
    read db_name
    echo -n "Inserire il nome del file di backup: "
    read backup_file
    echo "Eseguo il backup del database $db_name in $backup_file..."
    mysqldump $db_name > $backup_file
}

# Funzione per il backup di una cartella
function backup_folder() {
    echo -n "Inserire il nome della cartella da eseguire il backup: "
    read folder_name
    echo -n "Inserire il nome del file di backup: "
    read backup_file
    echo "Eseguo il backup della cartella $folder_name in $backup_file..."
    tar -zcvf $backup_file $folder_name
}

# Funzione per la ricerca dei file contenenti la stringa "@include" nei file con estensione .php
function search_include() {
    echo "Cerco i file contenenti la stringa "@include" nei file con estensione .php..."
    grep -ir --include=*.php '@include' ./*
}

# Funzione per la ricerca dei file contenenti la stringa "preg_replace" nei file con estensione .ico
function search_preg_replace() {
    echo "Cerco i file contenenti la stringa "preg_replace" nei file con estensione .ico..."
    grep -r -i --include=*.ico 'preg_replace' ./*
}

# Funzione per il riavvio del servizio Apache2
function restart_apache() {
    echo "Riavvio il servizio Apache2..."
    service apache2 restart
}

# Funzione per il riavvio del servizio Nginx
function restart_nginx() {
    echo "Riavvio il servizio Nginx..."
    service nginx restart
}

# Funzione per il riavvio del servizio PHP
function restart_php() {
    echo "Riavvio il servizio PHP..."
    service php7.0-fpm restart
}

# Funzione per il riavvio del servizio Postfix
function restart_postfix() {
    echo "Riavvio il servizio Postfix..."
    service postfix restart
}

# Funzione per il riavvio del servizio Dovecot
function restart_dovecot() {
    echo "Riavvio il servizio Dovecot..."
    service dovecot restart
}

# Funzione per la cancellazione delle email dalla coda di Postfix
function delete_postfix_queue() {
    echo "Cancello tutte le email dalla coda di Postfix..."
    postsuper -d ALL
}

# Interfaccia utente per la scelta dell'operazione da eseguire
echo "Scegliere l'operazione da eseguire:"
echo "1. Ricerca di un file"
echo "2. Cancellazione di un file"
echo "3. Ricerca di testo"
echo "4. Modifica di testo nei file"
echo "5. Ricerca dei file contenenti la stringa @include nei file con estensione .php"
echo "6. Ricerca dei file contenenti la stringa preg_replace nei file con estensione .ico"
echo "7. Ricerca dei file contenenti la stringa @include nei file con estensione .php"
echo "8. Ricerca dei file contenenti la stringa preg_replace nei file con estensione .ico"
echo "9. Riavvio del servizio Apache2"
echo "10. Riavvio del servizio Nginx"
echo "11. Riavvio del servizio PHP"
echo "12. Riavvio del servizio Postfix"
echo "13. Riavvio del servizio Dovecot"
echo "14. Cancellazione delle email dalla coda di Postfix"
echo -n "Scelta: "
read choice


# Esecuzione dell'operazione scelta
case $choice in
    1) search_file;;
    2) delete_file;;
    3) search_text;;
    4) replace_text;;
	5) search_include;;
    6) search_preg_replace;;
   7) search_include;;
    8) search_preg_replace;;
    9) restart_apache;;
    10) restart_nginx;;
    11) restart_php;;
    12) restart_postfix;;
    13) restart_dovecot;;
    14) delete_postfix_queue;;
    *) echo "Scelta non valida";;
esac
