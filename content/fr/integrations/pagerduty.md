---
categories:
  - monitoring
  - notification
ddtype: crawler
dependencies: []
description: Générez des alertes PagerDuty à partir des métriques et des événements Datadog.
doc_link: 'https://docs.datadoghq.com/integrations/pagerduty/'
git_integration_title: pagerduty
has_logo: true
integration_title: PagerDuty
is_public: true
kind: integration
manifest_version: '1.0'
name: pagerduty
public_title: Intégration Datadog/PagerDuty
short_description: Générez des alertes PagerDuty à partir des métriques et des événements Datadog.
version: '1.0'
---
{{< img src="integrations/pagerduty/pagerduty_incident_trends.png" alt="tendances des incidents PagerDuty" responsive="true" popup="true">}}

## Présentation

Associez PagerDuty à Datadog pour :

  * Déclencher et résoudre des incidents depuis votre flux en mentionnant `@pagerduty` dans votre publication
  * Visualiser les incidents et réaffectations de votre flux lorsqu'ils se produisent
  * Être informé quotidiennement des personnes en service

## Implémentation
Consultez [cette documentation][1] sur le site de PagerDuty.

Une fois l'intégration de PagerDuty configurée, vous pouvez consulter les [tendances des incidents Pagerduty][2] personnalisées de Datadog.

## Données collectées
### Métriques

L'intégration PagerDuty n'inclut aucune métrique.

### Événements

Vos événements PagerDuty résolus/déclenchés s'affichent dans votre [flux d'événements][3].

### Checks de service
L'intégration PagerDuty n'inclut aucun check de service.

## Dépannage
### Comment résoudre automatiquement un service PagerDuty lors du rétablissement d'un monitor ?

Vous devez inclure la notification PagerDuty dans le contexte `{{#is_recovery}}` de la section **Say what's happening** de votre monitor, comme suit :

```
{{#is_recovery}}

    Cette notification ne surviendra que lors de la résolution du monitor. 
    En cas de déclenchement de @pagerduty-trigger pour l'alerte, il sera également résolu. 

{{/is_recovery}}
```

### Comment envoyer un message/une notification vers un service spécifique PagerDuty lorsque plusieurs services sont intégrés ?

Ajoutez `@pagerduty-[NomDuService]` dans le message de votre monitor. Si vous commencez la saisie dans la section **Say what's happening** de votre monitor, le nom du service sera automatiquement complété.

{{< img src="integrations/pagerduty/pagerduty_faq_1.png" alt="faq 1 PagerDuty" responsive="true" popup="true">}}

### Pourquoi la description de mon alerte est-elle tronquée dans PagerDuty ?

La longueur des notifications de votre monitor envoyées à PagerDuty est limitée par Datadog. Cette limite est de **1 024 caractères**.

[1]: http://www.pagerduty.com/docs/guides/datadog-integration-guide
[2]: https://app.datadoghq.com/report/pagerduty
[3]: https://docs.datadoghq.com/fr/graphing/event_stream


{{< get-dependencies >}}