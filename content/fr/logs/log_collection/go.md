---
title: Collecte de logs Go
kind: documentation
aliases:
  - /fr/logs/languages/go
further_reading:
  - link: 'https://www.datadoghq.com/blog/go-logging/'
    tag: Blog
    text: 'Comment recueillir, standardiser et centraliser des logs Golang'
  - link: logs/processing
    tag: Documentation
    text: Apprendre à traiter vos logs
  - link: logs/processing/parsing
    tag: Documentation
    text: En savoir plus sur le parsing
  - link: logs/explorer
    tag: Documentation
    text: Apprendre à explorer vos logs
  - link: logs/explorer/analytics
    tag: Documentation
    text: Effectuer des analyses de logs
  - link: logs/faq/log-collection-troubleshooting-guide
    tag: FAQ
    text: Dépannage pour la collecte de logs
---
Pour envoyer vos logs Go à Datadog, nous vous recommandons d'activer la journalisation au sein d'un fichier et de le suivre avec l'Agent Datadog. Pour ce faire, nous vous suggérons d'utiliser la configuration suivante avec la bibliothèque de journalisation open source du nom de [logrus][1].

Nous vous encourageons fortement à configurer votre bibliothèque de journalisation afin de générer vos logs au format JSON et d'éviter de créer des [règles de parsing personnalisées][2].

## Configurer votre enregistreur

Pour une configuration Go classique, ouvrez un fichier `main.go` et collez le code suivant :

```go
package main

import (
  log "github.com/Sirupsen/logrus"
)

func main() {

    // utiliser le JSONFormatteur
    log.SetFormatter(&log.JSONFormatter{})

    // enregistrer comme d'habitude un événement avec logrus
    log.WithFields(log.Fields{"string": "foo", "int": 1, "float": 1.1 }).Info("Mon premier événement de golang à stdout")
}
```

Ajoutez des métadonnées à un log est un jeu d'enfant si vous fournissez un objet JSON à afficher dans l'événement du log. 

Ces métadonnées peuvent correspondre à `hostname`, `username`, `customers`, `metric` ou à toute autre information facilitant de dépannage et la compréhension du fonctionnement de votre application Go.

```go
package main

import (
  log "github.com/Sirupsen/logrus"
)

func main() {

    // utiliser JSONFormatter
    log.SetFormatter(&log.JSONFormatter{})

    // enregistrer comme d'habitude un événement avec logrus 
    log.WithFields(log.Fields{"string": "foo", "int": 1, "float": 1.1 }).Info("Mon premier événement de golang à stdout")
  // Pour les métadonnées, un schéma récurrent consiste à réutiliser les champs entre les déclarations de journalisation en réutilisant
  contextualizedLog := log.WithFields(log.Fields{
    "hostname": "staging-1",
    "appname": "foo-app",
    "session": "1ce3f6v"
  })

  contextualizedLog.Info("Événement simple avec des métadonnées globales")

}
```

## Configurer votre Agent Datadog

Créez un fichier `go.d/conf.yaml` dans votre dossier `conf.d/` avec le contenu suivant :

```yaml    
##Section Log
Logs:

    # - type (obligatoire) : type de fichier de la source d'entrée de log (tcp/udp/file).
    #   port / path (obligatoire) : définit le type tcp ou udp du port. Choisit le chemin si le type est défini sur file.
    #   service (obligatoire) : nom du service propriétaire du log.
    #   source (obligatoire) : attribut qui définit l'intégration qui envoie les logs.
    #   sourcecategory (facultatif) : attribut à valeur multiple. Il peut être utilisé pour préciser l'attribut source.
    #   tags (facultatif) : ajoute des tags à chaque log recueilli.

  - type: file
    path: /chemin/vers/votre/log/go.log
    service: go
    source: go
    sourcecategory: sourcecode
```

## Concepts avancés

Voici quelques conseils :

* Attribuez toujours à l'enregistreur un nom correspondant à la fonctionnalité ou au service que vous essayez de fournir.
* Enregistrez beaucoup de données de DEBUG et loguez plus précisément les données INFO, WARNING et FATAL, car il s'agit des niveaux de logs que vous obtiendrez dans vos environnements de production.
* Commencez doucement et essayez de créer d'abord des logs pour les données importantes, plutôt que de voir les choses en grand. Ajoutez ensuite ce qui vous manque après en avoir discuté avec votre équipe.
* Utilisez des métadonnées. Ajoutez du contexte à tous vos logs afin de rapidement filtrer les utilisateurs, les clients ou les attributs métiers capitaux.

## Pour aller plus loin

{{< partial name="whats-next/whats-next.html" >}}

[1]: https://github.com/sirupsen/logrus
[2]: /fr/logs/processing/parsing