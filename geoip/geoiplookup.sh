#!/bin/bash

# Vérification si geoiplookup est installé
if ! command -v geoiplookup &> /dev/null; then
    echo "geoiplookup n'est pas installé. Veuillez l'installer pour exécuter ce script."
    exit 1
fi

# Exécution de la commande fail2ban-client pour obtenir la liste des adresses IP bannies
banned_ips=$(fail2ban-client status npm-docker | grep -A 1000 "Banned IP list:" | cut -d ":" -f2-)

# Initialisation d'un tableau associatif pour stocker les comptages par pays
declare -A counts
declare -A ip_by_country

# Boucle sur les adresses IP bannies
for ip in $banned_ips; do
    # Utilisation de geoiplookup pour obtenir le pays
    country=$(geoiplookup "$ip" | head -1 | cut -d "," -f 2 | tr -d " " | tr -d "'")
    echo "$ip is located in $country"
    # Incrémentation du compteur pour ce pays
    if [ -n "$country" ]; then
        ((counts[$country]++))
		# Stockage de l'adresse IP pour ce pays
        ip_by_country[$country]+="$ip "
    fi
done

# Affichage des résultats
echo "
Statistiques:
"
for country in "${!counts[@]}"; do
    echo "$country: ${counts[$country]}"
done | sort -t ':' -k2nr
# Affichage des adresses IP pour la Suisse
echo "
Adresses IP pour la Suisse:
"
echo "${ip_by_country['Switzerland']}"
