---
title: Vue Trace
kind: documentation
further_reading:
  - link: tracing/setup/
    tag: Documentation
    text: Découvrir comment configurer le tracing d'APM avec votre application
  - link: tracing/visualization/services_list/
    tag: Documentation
    text: Découvrir la liste des services transmettant des données à Datadog
  - link: tracing/visualization/service
    tag: Documentation
    text: En savoir plus sur les services dans Datadog
  - link: tracing/visualization/resource
    tag: Documentation
    text: Plonger au cœur des traces et des performances de vos ressources
  - link: tracing/visualization/trace
    tag: Documentation
    text: Comprendre comment lire une trace Datadog
---
Affichez une trace individuelle pour voir toutes ses spans et métadonnées associées. Chaque trace peut être affichée sous forme de graphique de performances ou de liste (regroupée par service ou host).

{{< img src="tracing/visualization/trace/trace.png" alt="Trace" responsive="true" style="width:90%;">}}

Calculez les détails du temps d'exécution et ajustez le jeu de couleurs par **service** ou **host**.

{{< img src="tracing/visualization/trace/service_host_display.png" alt="Affichage de host de service" responsive="true" style="width:40%;">}}

Utilisez la molette de la souris pour zoomer sur le graphique :

{{< img src="tracing/visualization/trace/trace_zoom.gif" alt="Erreur de trace" responsive="true" style="width:90%;">}}

L'affichage sous forme de liste regroupe les ressources par service et les trie en fonction du nombre de spans correspondant. Les services sont triés par pourcentage de temps d'exécution relatif mesuré par la trace dans chaque service :

{{< img src="tracing/visualization/trace/trace_list.png" alt="Liste des traces" responsive="true" style="width:90%;">}}

### Plus d'informations

{{< tabs >}}
{{% tab "Métadonnées de span" %}}

Cliquez sur une span dans le graphique de performances pour afficher ses métadonnées en dessous du graphique. En cas d'erreur, la trace de pile est fournie :

{{< img src="tracing/visualization/trace/trace_error.png" alt="Erreur de trace" responsive="true" style="width:90%;">}}

Si vous analysez une trace qui signale une erreur et que les règles de tags à signification particulière sont appliquées, l'erreur s'affiche de façon distincte. Lors de l'envoi de vos traces, vous pouvez ajouter des attributs au paramètre `meta`. 

Certains attributs ont des significations particulières qui se traduisent par un mode d'affichage spécial ou un comportement spécifique dans Datadog :

| Attribut     | Description                                                                                                                                                                        |
| ----          | ------                                                                                                                                                                             |
| `sql.query`   | Permet l'affichage des requêtes SQL dans un format spécial dans l'interface de Datadog.                                                                                                                     |
| `error.msg`   | Permet l'affichage des messages d'erreur dans un format spécial.                                                                                                                                        |
| `error.type`  | Permet l'affichage des types d'erreur dans un format spécial. Exemples de types disponibles : `ValueError` ou `Exception` dans Python, et `ClassNotFoundException` ou `NullPointerException` dans Java. |
| `error.stack` | Permet un affichage plus clair de la trace de pile d'une exception dans l'interface de Datadog (zones rouges, etc.)                                                                                         |

{{< img src="tracing/visualization/trace/trace_error_formating.png" alt="Formatage des erreurs" responsive="true" >}}

{{% /tab %}}
{{% tab "Informations sur le host" %}}

Affichez les informations sur le host qui sont associées à la trace, notamment les tags et les graphiques de host au moment où la trace s'est produite.

{{< img src="tracing/visualization/trace/trace_host_info.png" alt="Informations sur le host de la trace" responsive="true" style="width:90%;">}}

{{% /tab %}}
{{% tab "Logs" %}}

Consultez les logs associés à votre service au moment où la trace s'est produite. Lorsque vous passez le curseur sur un log, une ligne montrant son timestamp est affichée sur le graphique de performances de la trace. Cliquez sur le log pour accéder à la [recherche du Log Explorer][1].

{{< img src="tracing/visualization/trace/trace_logs.png" alt="Logs de trace" responsive="true" style="width:90%;">}}


[1]: /fr/logs/explorer/search
{{% /tab %}}
{{< /tabs >}}

## Pour aller plus loin

{{< partial name="whats-next/whats-next.html" >}}