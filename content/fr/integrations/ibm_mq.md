---
assets:
  dashboards: {}
  monitors: {}
  service_checks: assets/service_checks.json
categories:
  - processing
  - messaging
  - log collection
creates_events: false
ddtype: check
dependencies:
  - 'https://github.com/DataDog/integrations-core/blob/master/ibm_mq/README.md'
display_name: "IBM\_MQ"
git_integration_title: ibm_mq
guid: 873153b6-5184-438a-8a32-1e2d2e490dde
integration_id: ibm-mq
integration_title: "IBM\_MQ"
is_public: true
kind: integration
maintainer: help@datadoghq.com
manifest_version: 1.0.0
metric_prefix: ibm_mq.
metric_to_check: ibm_mq.queue.usage
name: ibm_mq
public_title: "Intégration Datadog/IBM\_MQ"
short_description: "IBM\_MQ est un système de gestion de file d'attente de messages."
support: core
supported_os:
  - linux
---
## Présentation

Ce check surveille [IBM MQ][1].

## Implémentation

### Installation

Le check IBM MQ est inclus avec le paquet de l'[Agent Datadog][2].

Afin d'utiliser le check IBM MQ, vous devez :

1. Vous assurer que le [client IBM MQ][3] est installé (sauf si le serveur IBM MQ est déjà installé)
2. Mettre à jour votre LD_LIBRARY_PATH afin d'inclure l'emplacement des bibliothèques

Par exemple :

```
export LD_LIBRARY_PATH=/opt/mqm/lib64:/opt/mqm/lib:$LD_LIBRARY_PATH
```

*Remarque* : l'Agent 6 utilise Upstart ou systemd pour orchestrer le service datadog-agent. Il est possible que des variables d'environnement doivent être ajoutées aux fichiers de configuration du service aux emplacements par défaut de /etc/init/datadog-agent.conf (Upstart) ou /lib/systemd/system/datadog-agent.service (systemd). Consultez la documentation sur Upstart ou systemd pour en savoir plus sur la configuration de ces paramètres.

Voici un exemple de la configuration utilisée pour systemd :

```yaml
[Unit]
Description="Agent Datadog"
After=network.target
Wants=datadog-agent-trace.service datadog-agent-process.service
StartLimitIntervalSec=10
StartLimitBurst=5

[Service]
Type=simple
PIDFile=/opt/datadog-agent/run/agent.pid
Environment="LD_LIBRARY_PATH=/opt/mqm/lib64:/opt/mqm/lib:$LD_LIBRARY_PATH"
User=dd-agent
Restart=on-failure
ExecStart=/opt/datadog-agent/bin/agent/agent run -p /opt/datadog-agent/run/agent.pid

[Install]
WantedBy=multi-user.target
```

Voici un exemple de la configuration Upstart :

```
description "Datadog Agent"

start on started networking
stop on runlevel [!2345]

respawn
respawn limit 10 5
normal exit 0

console log
env DD_LOG_TO_CONSOLE=false
env LD_LIBRARY_PATH=/opt/mqm/lib64:/opt/mqm/lib:$LD_LIBRARY_PATH

setuid dd-agent

script
  exec /opt/datadog-agent/bin/agent/agent start -p /opt/datadog-agent/run/agent.pid
end script

post-stop script
  rm -f /opt/datadog-agent/run/agent.pid
end script
```

À chaque mise à jour de l'Agent, ces fichiers sont effacés et doivent à nouveau être modifiés.

Si vous utilisez Linux, lorsque le client MQ est installé, vérifiez que l'éditeur de liens du runtime peut trouver les bibliothèques. Par exemple, avec ldconfig :

Précisez l'emplacement de la bibliothèque dans un fichier de configuration ld.

```
sudo sh -c "echo /opt/mqm/lib64 > /etc/ld.so.conf.d/mqm64.conf"
sudo sh -c "echo /opt/mqm/lib > /etc/ld.so.conf.d/mqm.conf"
```

Mettez à jour les liaisons.

```
sudo ldconfig
```

#### Autorisation et authentification

Il existe plusieurs façons de configurer les autorisations dans IBM MQ. Selon votre configuration, créez un utilisateur `datadog` dans MQ avec des autorisations de lecture seule.

Remarque : le « Queue Monitoring » doit être activé et défini au minimum sur « Medium ». Ce réglage peut s'effectuer via l'IU MQ ou avec une commande mqsc :

```
> /opt/mqm/bin/runmqsc
5724-H72 (C) Copyright IBM Corp. 1994, 2018.
Starting MQSC for queue manager datadog.


ALTER QMGR MONQ(MEDIUM) MONCHL(MEDIUM)
     1 : ALTER QMGR MONQ(MEDIUM) MONCHL(MEDIUM)
AMQ8005I: IBM MQ queue manager changed.

       :
One MQSC command read.
No commands have a syntax error.
All valid MQSC commands were processed.
```


### Configuration

1. Modifiez le fichier `ibm_mq.d/conf.yaml` dans le dossier `conf.d/` à la racine du
   répertoire de configuration de votre Agent pour commencer à recueillir vos données de performance IBM MQ.
   Consultez le [fichier d'exemple ibm_mq.d/conf.yaml][4] pour découvrir toutes les options de configuration disponibles.

2. [Redémarrez l'Agent][5].

#### Collecte de métriques

Plusieurs options sont disponibles pour configurer IBM MQ, selon la façon dont vous l'utilisez.

`channel` : le canal IBM MQ.
`queue_manager` : le nom du gestionnaire de file d'attente.
`host` : le host sur lequel IBM MQ s'exécute.
`port` : le port exposé par IBM MQ.

Si vous utilisez une configuration reposant sur des identifiants, vous pouvez définir le nom d'utilisateur et le mot de passe.

Si vous utilisez une authentification SSL, vous pouvez la définir.

Enfin, le check surveille uniquement les files d'attente que vous avez définies dans la configuration :

```yaml
queues:
  - APP.QUEUE.1
  - ADMIN.QUEUE.1
```

#### Collecte de logs

La collecte de logs est désactivée par défaut dans l'Agent Datadog. Vous devez l'activer dans `datadog.yaml` :
```
    logs_enabled: true
```

Redirigez ensuite le fichier de configuration vers les bons fichiers de log MQ. Vous pouvez supprimer la mise en commentaire des lignes en bas du fichier de configuration de l'intégration MQ et les modifier comme bon vous semble :

```yaml
logs:
  - type: file
    path: /var/mqm/log/<NOMAPP>/active/AMQERR01.LOG
    service: <NOMAPP>
    source: ibm_mq
    log_processing_rules:
      - type: multi_line
        name: new_log_start_with_date
        pattern: "\d{2}/\d{2}/\d{4}"
```

### Validation

[Lancez la sous-commande `status` de l'Agent][6] et cherchez `ibm_mq` dans la section Checks.

## Données collectées

### Métriques
{{< get-metrics-from-git "ibm_mq" >}}


### Checks de service

Il existe trois checks de service :

`ibm_mq.can_connect` : vérifie si la connexion à IBM MQ est possible.
`ibm_mq.queue_manager` : vérifie si le gestionnaire de files d'attente fonctionne.
`ibm_mq.queue` : vérifie si la file d'attente existe.

### Événements

IBM MQ n'inclut aucun événement.

## Dépannage

Besoin d'aide ? Contactez [l'assistance Datadog][8].

## Pour aller plus loin
Documentation, liens et articles supplémentaires utiles :

* [Surveiller les métriques et les logs d'IBM MQ avec Datadog][9]

[1]: https://www.ibm.com/products/mq
[2]: https://app.datadoghq.com/account/settings#agent
[3]: https://developer.ibm.com/messaging/mq-downloads
[4]: https://github.com/DataDog/integrations-core/blob/master/ibm_mq/datadog_checks/ibm_mq/data/conf.yaml.example
[5]: https://docs.datadoghq.com/fr/agent/guide/agent-commands/?tab=agentv6#start-stop-and-restart-the-agent
[6]: https://docs.datadoghq.com/fr/agent/guide/agent-commands/?tab=agentv6#agent-status-and-information
[7]: https://github.com/DataDog/integrations-core/blob/master/ibm_mq/metadata.csv
[8]: https://docs.datadoghq.com/fr/help
[9]: https://www.datadoghq.com/blog/monitor-ibmmq-with-datadog


{{< get-dependencies >}}