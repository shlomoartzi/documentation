---
assets:
  dashboards: {}
  monitors: {}
  service_checks: assets/service_checks.json
categories:
  - data store
creates_events: false
ddtype: check
dependencies:
  - 'https://github.com/DataDog/integrations-core/blob/master/riakcs/README.md'
display_name: "Riak\_CS"
git_integration_title: riakcs
guid: 55ba6b94-8eeb-486b-aa94-6366a044fdf0
integration_id: riak-cs
integration_title: "Riak\_CS"
is_public: true
kind: integration
maintainer: help@datadoghq.com
manifest_version: 1.0.0
metric_prefix: riakcs.
metric_to_check: riakcs.bucket_list_pool.workers
name: riakcs
process_signatures:
  - riak-cs start
public_title: "Intégration Datadog/Riak\_CS"
short_description: 'Suivez la fréquence et la latence moyenne des opérations GET, PUT et DELETE, ainsi que d''autres opérations operations.'
support: core
supported_os:
  - linux
  - mac_os
  - windows
---
![Dashboard Riak CS][1]

## Présentation

Enregistrez vos métriques Riak CS dans Datadog pour :

* Visualiser les métriques clés de Riak CS
* Corréler les performances de Riak CS avec le reste de vos applications

## Implémentation

Vous trouverez ci-dessous les instructions pour installer et configurer le check lorsque l'Agent est exécuté sur un host. Consultez la [documentation relative aux modèles d'intégration Autodiscovery][2] pour découvrir comment appliquer ces instructions à un environnement conteneurisé.

### Installation

Le check RiakCS est inclus avec le paquet de l'[Agent Datadog][3] : vous n'avez donc rien d'autre à installer sur vos nœuds RiakCS.

### Configuration

1. Modifiez le fichier `riakcs.yamld/conf.` dans le dossier `conf.d/` à la racine du [répertoire de configuration de votre Agent][4].
    Consultez le [fichier d'exemple riakcs.d/conf.yaml][5] pour découvrir toutes les options de configuration disponibles :

    ```yaml
        init_config:

        instances:
          - host: localhost
            port: 8080
            access_id: <YOUR_ACCESS_KEY>
            access_secret: <YOUR_ACCESS_SECRET>
        #   is_secure: true # set to false if your endpoint doesn't use SSL
        #   s3_root: s3.amazonaws.com #
    ```

2. [Redémarrez l'Agent][6] pour commencer à envoyer des métriques RiakCS à Datadog.

### Validation

[Lancez la sous-commande `status` de l'Agent][7] et cherchez `riakcs` dans la section Checks.

## Données collectées
### Métriques
{{< get-metrics-from-git "riakcs" >}}
 inclut la plupart des métriques d'API S3, ainsi que des statistiques relatives à la mémoire. Certaines ont été exclues :

* bucket_acl_(get|put)
* object_acl_(get|put)
* bucket_policy_(get|put|delete)
* _in_(one|total)
* _time_error_*
* _time_100

Toutes ces métriques exclues ainsi que de nombreuses autres (plus de 1 000 métriques au choix) peuvent être ajoutées en les spécifiant dans le
fichier de configuration `riakcs.d/conf.yaml` avec la clé `metrics` dans `instance_config` ; la valeur doit être une liste de noms de métriques.

[Consultez la liste complète des métriques disponibles][9].

### Événements
Le check RiakCS n'inclut aucun événement.

### Checks de service

**riakcs.can_connect** :

Renvoie CRITICAL si l'Agent n'est pas capable de se connecter à l'endpoint Riak CS pour recueillir des métriques. Si ce n'est pas le cas, renvoie OK.

## Dépannage
Besoin d'aide ? Contactez [l'assistance Datadog][10].

## Pour aller plus loin
Pour mieux comprendre comment (ou pourquoi) surveiller la disponibilité et les performances de Riak CS avec Datadog, lisez notre [série d'articles de blog][11] à ce sujet.


[1]: https://raw.githubusercontent.com/DataDog/integrations-core/master/riakcs/images/riakcs_dashboard.png
[2]: https://docs.datadoghq.com/fr/agent/autodiscovery/integrations
[3]: https://app.datadoghq.com/account/settings#agent
[4]: https://docs.datadoghq.com/fr/agent/guide/agent-configuration-files/?tab=agentv6#agent-configuration-directory
[5]: https://github.com/DataDog/integrations-core/blob/master/riakcs/datadog_checks/riakcs/data/conf.yaml.example
[6]: https://docs.datadoghq.com/fr/agent/guide/agent-commands/?tab=agentv6#start-stop-and-restart-the-agent
[7]: https://docs.datadoghq.com/fr/agent/guide/agent-commands/?tab=agentv6#agent-status-and-information
[8]: https://github.com/DataDog/integrations-core/blob/master/riakcs/metadata.csv
[9]: https://github.com/basho/riak_cs/wiki/Riak-cs-and-stanchion-metrics
[10]: https://docs.datadoghq.com/fr/help
[11]: https://www.datadoghq.com/blog/monitor-riak-cs-performance-and-availability


{{< get-dependencies >}}