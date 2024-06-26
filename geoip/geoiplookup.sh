#!/bin/bash

# Tonton Jo - 2024
# Join me on Youtube: https://www.youtube.com/c/tontonjo

# V1.2: List ip's with unknown localisation
# V1.1: Some enhancements, use variables for country, now count total of banned IP's
# V1.0: Initial Release


# Settings
country_to_display=Switzerland

# Vérification si geoiplookup est installé
if ! command -v geoiplookup &> /dev/null; then
    echo "geoiplookup n'est pas installé. Veuillez l'installer pour exécuter ce script."
    exit 1
fi

# Exécution de la commande fail2ban-client pour obtenir la liste des adresses IP bannies et définir leur nombre
banned_ips=$(fail2ban-client status npm-docker | grep -A 1000 "Banned IP list:" | cut -d ":" -f2-)
numberofbannedips=$(echo "$banned_ips" | wc -w)
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

# Affichage des Résultats
echo "
Total des IP bannies: $numberofbannedips

Adresses IP pour $country_to_display:
${ip_by_country["$country_to_display"]}

Localisation inconnue:
${ip_by_country["GeoIPCountryEdition:IPAddressnotfound"]}
"
