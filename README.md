# IHM_S9_Craig_Zoffranieri_Rasoamanana

## Maquettes

- **Première version**  
  [Maquette 1](https://www.figma.com/design/Fm3B9pOQ6qGpo7jWtHaIRv/IHM?node-id=0-1&p=f&t=MigJL7eLJH3u7nqX-0)

- **Deuxième version**  
  [Maquette 2](https://www.figma.com/design/Fm3B9pOQ6qGpo7jWtHaIRv/IHM?node-id=222-2559&t=69jK9tpr5K7MtJIF-0)

---

## Lancement de l’application Flutter

### Méthode recommandée : avec VS Code

1. Installer **Visual Studio Code**
2. Installer l’extension **Flutter**
3. Créer un nouveau projet Flutter :
   - `CTRL + SHIFT + P`
   - `Flutter: New Project`
4. Le SDK Flutter s’installera dans le dossier de votre choix

---

### Installation manuelle (sans VS Code)

Documentation officielle :  
https://docs.flutter.dev/install/manual

---

## Installation du SDK Flutter

### Windows

1. Télécharger le SDK Flutter (fichier `.zip`)
2. Le placer dans un dossier de votre choix
3. Décompresser le SDK avec PowerShell :

```
Expand-Archive –Path <sdk_zip_path> -Destination <destination_directory_path>
```
Avec <sdk_zip_path> le chemin vers de votre zip et <destination_directory_path> l'endroit ou mettre votre SDK sans le .zip

Ajouter le <destination_directory_path> dans votre PATH

### Linux

1. Télécharger le SDK manuellement (un fichier .ZIP)
2. Le mettre dans un dossier de votre choix
3. Télécharger les pré-requis
```
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

```
4. Décompresser votre .ZIP dans le dossier de votre choix avec la commande suivante
Avec <sdk_zip_path> le chemin vers de votre zip et <destination_directory_path> l'endroit ou mettre votre SDK sans le .zip
```
tar -xf <sdk_zip_path> -C <destination_directory_path>

```
5. Ajouter le <destination_directory_path>/bin dans votre PATH
Attention a bien mettre le /bin

### Lancer une application déjà existante

1. Se mettre dans le dossier contenant les fichiers Flutter
2. Lancer les commandes suivantes :
```
Flutter pub get
Flutter run
```
3. Choix de la plateforme de lancement
- Chrome
- Edge
- Votre système local

Lancer à votre guise le systeme de votre choix
