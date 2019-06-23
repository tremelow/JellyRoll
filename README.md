# ![(French flag)](https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/50px-Flag_of_France.svg.png) Modèle de thèse MathSTIC

*Explications en français*

Ce dépôt contient un modèle latex utilisable pour le manuscrit de thèse de l'[école doctorale MathSTIC](https://ed-mathstic.u-bretagneloire.fr/) de l'[Université Bretagne Loire](https://u-bretagneloire.fr/).

Ce modèle a pour but principal de fournir une première et une quatrième de couverture du manuscrit de thèse intégralement écrites en latex.
Ces couvertures ont été (manuellement) calquées sur le modèle original au format M$ Word fourni par MathSTIC en 2018.
Tandis que la couverture du manuscrit se doit de respecter le format établi par MathSTIC, la disposition du contenu interne du manuscrit est elle plus flexible.
La disposition proposée dans ce modèle est donc donnée à titre d'exemple mais il n'est cependant pas obligatoire de la respecter.


### Structure du dépôt

- `main.tex` contient le squelette du document, aucun texte du manuscrit n'est présent dans ce fichier
- `these-ubl.cls` contient les dépendances, les paramètres de la bibliographie et les paramètres de mise en page globale du manuscrit et de la page de garde
- `Couverture-these/pagedegarde.tex` contient les variables à remplir par l'auteur pour compléter la page de garde, ces variables sont utilisées par le style défini dans `these-ubl.cls`
- `Couverture-these/resume.tex` contient la quatrième de couverture, sa mise en page, et son contenu qui doit être rempli par l'auteur
- Le `Makefile` vous aide à compiler le latex et la bibliographie en un pdf (détails plus bas)
- Les autres dossiers contiennent chacun un chapitre du document


### Remplir la première et quatrième de couverture

Les informations de la page de garde doivent être renseignées dans les variables du fichier `Couverture-these/pagedegarde.tex`.
Modifier la disposition des éléments de la page de garde présente dans `these-ubl.cls` ne devrait  être nécessaire que pour rajouter quelques `\vspace` pour préserver la structure original après avoir renseigné la composition du jury.

Les informations relatives à la quatrième de couverture sont à renseigner dans `Couverture-these/resume.tex`.


#### Changer l'établissement de délivrance du diplôme

Pour la page de garde, vous devez modifier deux variables dans `Couverture-these/pagedegarde.tex` :

- `\unite` contient le nom complet de l'établissement qui délivre le diplôme
- `\logoetablissement` contient le chemin vers l'image du logo de l'établissement, une liste de logos est fournise dans le dossier `Couverture-these/MathSTIC/logo-etablissements/`.

Pour la quatrième de couverture, vous devez remplacer le chemin vers l'image du logo de l'établissement directement dans le `\includegraphics` à la ligne 24 de `Couverture-these/resume.tex`.


### Compiler le latex en pdf

Le `Makefile` fournis vous aide à compiler votre document.
Il utilise `pdflatex` et `biber` pour générer le fichier pdf et peut l'afficher grâce à `evince` sur Linux et `open` sur MacOS.

Compiler votre document avec `pdflatex/biber` :

    make

Afficher le pdf généré :

    make viewpdf

Suppimer tous les fichiers générés, pdf inclus :

    make clean


### Spécificités d'un document multilingue

La liste des langues utilisées est définie à la ligne 28 de `these-ubl.cls` où le paquet `babel` est importé.
Etant donné que la quatrième de couverture contient du français et de l'anglais, il est nécessaire de conserver au moins ces deux langues dans la liste.
Il faut utiliser `\selectlanguage{x}` (où x est `french` ou `english`) pour changer de langue après son insertion.

Si la langue principale du contenu du document est l'anglais, vous devez effectuer quelques modifications au modèle :

- utiliser `\selectlanguage{english}` à la ligne 17 de `main.tex`
- modifier la ligne 350 de `these-ubl.cls` pour remplacer `Partie` par `Part` dans les entêtes
- inclure un résumé en français d'au moins 4 pages




-----

# ![(UK flag)](https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/50px-Flag_of_the_United_Kingdom.svg.png) MathSTIC thesis template

*English explanations*

This repository contains a template for the thesis manuscript of the [MathSTIC doctoral school](https://ed-mathstic.u-bretagneloire.fr/en) of the [Université Bretagne Loire](https://en.u-bretagneloire.fr/).

The main goal of this template is to provide both front and back covers of the thesis manuscript entirely written in latex.
These covers have been (manually) reproduced from the original M$ Word model provided by MathSTIC in 2018.
While the manuscript covers must follow the rules of MathSTIC, the internal layout of the content is more flexible.
The content layout provided in this template is therefore given as an exemple rather than as a  mandatory framework.


#### Structure of the repository

- `main.tex` contains the backbone structure of the document, no content is present in this file
- `these-ubl.cls` contains the package dependencies, bibliography parameters and overall layout specifications including the front cover layout
- `Couverture-these/pagedegarde.tex` contains the variables that must be filled by the author to complete the front cover, these variables are used in pair with the style defined in `these-ubl.cls`
- `Couverture-these/resume.tex` contains the back cover of the document, both its layout and content that must be filled by the author
- The `Makefile` helps you compile the latex and bibliography into a pdf (details below)
- The rest of the directories each contain one chapter of the document


#### Fill the front and back cover

The front cover details must be provided by filling the variables in `Couverture-these/pagedegarde.tex`. Modifying the front cover layout defined in `these-ubl.cls` should only be necessary to preserve the original layout after filling the jury section by adding a few `\vspace`.

The back cover details must be provided in `Couverture-these/resume.tex`.


##### Change the institution that delivers the diploma

For the front cover, you have to modify two variables in `Couverture-these/pagedegarde.tex`:

- `\unite` contains the full name of the institution that delivers the diploma
- `\logoetablissement` contains the path to the image of the logo of the institution, a list of logos is provided for you in the directory `Couverture-these/MathSTIC/logo-etablissements/`

For the back cover, you have to replace the path to the image of the logo of the institution directly in the `\includegraphics` at line 24 of `Couverture-these/resume.tex`.

#### Compile latex into pdf

A `Makefile` is provided to help you compile your document. It uses `pdflatex` and`biber` to generate the pdf file and can display it by using `evince` on Linux or `open` on MacOS.

Compile your document with `pdflatex/biber`:

	make

Display the generated pdf:

	make viewpdf

Remove all generated files, pdf included:

	make clean


#### Particularities of a multilanguage document

The list of used languages is defined at line 28 of `these-ubl.cls` where the package `babel` is imported.
As the back cover contains both French and English, it is necessary to keep at least both these languages in the list.
Use `\selectlanguage{x}` (where x is `french` or `english`) to switch language after its usage.

If the main language of your document is English, you must apply the following changes to the provided template:

- use `\selectlanguage{english}` at line 17 of `main.tex`
- edit line 350 of `these-ubl.cls` to replace `Partie` by `Part` in the headers
- include a summary in French of at least 4 pages


-----
Authors: Louiza Yala (2018-), Pierre-Louis Roman (2019-)

Git repository: https://gitlab.inria.fr/proman/mathstic-thesis-template
