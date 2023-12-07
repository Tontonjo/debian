#!/bin/bash

# Définir le nombre de fichiers à créer
num_files=10000

# Répertoire de travail
working_dir="/root/test_copy"

# Créer x petits fichiers
echo "Création de $num_files petits fichiers..."
for ((i=1; i<=$num_files; i++)); do
  touch "$working_dir/fichier_$i.txt"
done

# Copier les fichiers en mode verbose
echo "Copie en mode verbose :"
mkdir "$working_dir/copie_verbose/"
start_time_verbose=$(date +%s.%N)
cp -v "$working_dir/fichier_"* "$working_dir/copie_verbose/"
end_time_verbose=$(date +%s.%N)
elapsed_time_verbose=$(echo "$end_time_verbose - $start_time_verbose" | bc)

# Copier les fichiers en mode silencieux
echo "Copie en mode silencieux :"
mkdir "$working_dir/copie_silencieuse/"
start_time_silent=$(date +%s.%N)
cp "$working_dir/fichier_"* "$working_dir/copie_silencieuse/"
end_time_silent=$(date +%s.%N)
elapsed_time_silent=$(echo "$end_time_silent - $start_time_silent" | bc)

# Afficher les résultats
echo "Temps écoulé en mode verbose : $elapsed_time_verbose secondes"
echo "Temps écoulé en mode silencieux : $elapsed_time_silent secondes"

# Nettoyer les fichiers créés
rm -rf "$working_dir/"*
