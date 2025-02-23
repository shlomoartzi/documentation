---
title: Page Service
kind: documentation
further_reading:
  - link: tracing/setup/
    tag: Documentation
    text: Découvrir comment configurer le tracing d'APM avec votre application
  - link: tracing/visualization/services_list/
    tag: Documentation
    text: Découvrir la liste des services transmettant des données à Datadog
  - link: tracing/visualization/resource
    tag: Documentation
    text: Plonger au cœur des traces et des performances de vos ressources
  - link: tracing/visualization/trace
    tag: Documentation
    text: Comprendre comment lire une trace Datadog
---
{{< img src="tracing/visualization/service/detailed_service_page.png" alt="Page détaillée des services" responsive="true" style="width:90%;">}}

## Présentation

Lorsque vous sélectionnez un service sur la page Services, vous accédez aux détails concernant ce service. Un service est un ensemble de processus qui ont la même fonction, par exemple un framework Web ou une base de données (pour découvrir comment définir des services, consultez [Débuter avec l'APM][1]).

Cette page vous permet de consulter :

* [Les états du Service Monitor](#service-monitor)
* [Les graphiques par défaut](#out-of-the-box-graphs)
* [Les ressources associées à ce service][2]

## Service Monitor

Datadog offre une liste de monitors en fonction de votre type de service :

{{< img src="tracing/visualization/service/service_monitors.png" alt="Service Monitors" responsive="true" style="width:90%;">}}

Activez-les directement ou créez vos propres [monitors d'APM][3].

**Remarque**: ajoutez un tag à un monitor avec `service:<NOM_SERVICE>` pour le lier à un service APM.

## Graphiques par défaut

Datadog fournit des graphiques par défaut pour chaque service :

* Requêtes - Choisissez si vous voulez afficher :
    *  Le **nombre total de requêtes**
    *  Le nombre de **requêtes par seconde**
* Latence - Choisissez si vous voulez afficher :
    *  La latence moyenne, au 75e centile, au 90e centile, au 95e centile, au 99e centile ou maximale de vos requêtes tracées
    *  Le **score Apdex** pour les services Web ; [en savoir plus sur Apdex][4]
* Erreur - Choisissez si vous voulez afficher :
    * Le **nombre total d'erreurs**
    * Le nombre **d'erreurs par seconde**
    * Le **taux d'erreur**
* Sous-services : lorsque plusieurs services sont impliqués, un quatrième graphique est disponible. Il décrit la **durée totale**, le **% de temps passé** et la **durée moyenne par requête** de votre service en fonction de *services* ou du *type*. Pour les services comme *Postgres* ou *Redis*, qui sont des opérations "finales" n'appelant pas d'autres services, ce graphique n'est pas disponible.

{{< img src="tracing/visualization/service/out_of_the_box_service_graph.png" alt="Graphiques par défaut pour les services" responsive="true" style="width:90%;">}}

### Export to Timeboard

En haut à droite de chaque graphique, cliquez sur la flèche pour exporter votre graphique dans un [timeboard][5] existant :

{{< img src="tracing/visualization/service/save_to_timeboard.png" alt="Enregister en tant que timeboard" responsive="true" style="width:40%;">}}

### Distribution de la latence

Outre ces graphiques, vous disposez également d'un graphique de distribution de la latence sur les services :

{{< img src="tracing/visualization/service/latency_distribution.png" alt="Distribution de la latence" responsive="true" style="width:90%;">}}

Utilisez le sélecteur en haut à droite de ce graphique pour zoomer sur un centile donné de la distribution de latence :

{{< img src="tracing/visualization/service/latency_distribution_selector.png" alt="Sélection de distribution de latence" responsive="true" style="width:20%;">}}

## Ressources

Consultez la liste de ressources associées à votre service. Les ressources sont des actions particulières pour vos services (généralement des endpoints individuels ou des requêtes). Pour en savoir plus sur les ressources, consultez [Débuter avec l'APM][1]. Triez les ressources de ce service par requêtes, latence, erreurs et durée pour identifier les zones à trafic élevé ou les problèmes potentiels. Notez que ces colonnes de métrique peuvent être personnalisées (voir l'image ci-dessous).

{{< img src="tracing/visualization/service/resources.png" alt="Ressources" responsive="true" style="width:90%;">}}

[Consultez la documentation relative aux ressources pour en savoir plus][2].

### Filtrer la liste des ressources
Filtrez votre liste de ressources avec une requête pour un filtrage textuel de base :

{{< img src="tracing/visualization/service/resources_filtering.gif" alt="Filtrage de ressources" responsive="true" style="width:90%;">}}

### Colonnes

Choisissez ce que vous souhaitez afficher dans votre liste de ressources :

* **Requests** : le nombre absolu de requêtes tracées (par seconde)
* **Avg/p75/p90/p95/p99/Max Latency**: la latence moyenne, au 75e centile, au 90e centile, au 95e centile, au 99e centile ou maximale de vos requêtes tracées.
* **Total time**: le temps d'utilisation total de la ressource
* **Error**: le nombre absolu d'erreurs pour une ressource donnée
* **Error Rate**: le pourcentage d'erreur pour une ressource donnée

{{< img src="tracing/visualization/service/resource_columns.png" alt="Colonnes des ressources" responsive="true" style="width:50%;">}}

## Pour aller plus loin

{{< partial name="whats-next/whats-next.html" >}}

[1]: /fr/tracing/visualization
[2]: /fr/tracing/visualization/resource
[3]: /fr/monitors/monitor_types/apm
[4]: /fr/tracing/guide/configure_an_apdex_for_your_traces_with_datadog_apm
[5]: /fr/graphing/dashboards/timeboard