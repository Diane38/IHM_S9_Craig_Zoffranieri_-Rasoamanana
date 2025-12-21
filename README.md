# IHM_S9_Craig_Zoffranieri_Rasoamanana

Lien vers la première version des maquettes : https://www.figma.com/design/Fm3B9pOQ6qGpo7jWtHaIRv/IHM?node-id=0-1&p=f&t=MigJL7eLJH3u7nqX-0
Lien vers la deuxieme version de la maquette : https://www.figma.com/design/Fm3B9pOQ6qGpo7jWtHaIRv/IHM?node-id=222-2559&t=69jK9tpr5K7MtJIF-0




Pour lancer l'application, installer Flutter sur VSCode en installant l'extension Flutter
Créer un nouveau projet Flutter, avec CTRL+SHIFT+P
Le SDK Flutter s'installera dans le fichier de votre choix

Si vous ne posséder pas VSCode, une installation manuelle est possible

https://docs.flutter.dev/install/manual

Pour Windows, télécharger le SDK manuellement (un fichier .ZIP)
Et le mettre dans un dossier de votre choix

```
Expand-Archive –Path <sdk_zip_path> -Destination <destination_directory_path>
```
Avec <sdk_zip_path> le chemin vers de votre zip et <destination_directory_path> l'endroit ou mettre votre SDK sans le .zip

Ajouter le <destination_directory_path> dans votre PATH



Pour Linux, télécharger le SDK manuellement (un fichier .ZIP)
Et le mettre dans un dossier de votre choix

Télécharger les pré-requis
```
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

```
Décompresser votre .ZIP dans le dossier de votre choix avec la commande suivante
Avec <sdk_zip_path> le chemin vers de votre zip et <destination_directory_path> l'endroit ou mettre votre SDK sans le .zip
```
tar -xf <sdk_zip_path> -C <destination_directory_path>

```
Ajouter le <destination_directory_path>/bin dans votre PATH
Attention a bien mettre le /bin



Pour lancer, une application deja existante, se mettre dans le dossier contenant les fichiers Flutter et lancer les lignes suivantes
```
Flutter pub get
Flutter run
```
Celle-ci vont lancer le programme et vont demander quel outils utilisé
Chrome
Edge
Votre système

Lancer à votre guise le systeme de votre choix