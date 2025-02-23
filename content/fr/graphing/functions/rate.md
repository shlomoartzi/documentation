---
title: Taux
kind: documentation
---

## Par seconde

| Fonction       | Description                                                | Exemple                        |
| :----          | :-------                                                   | :---------                     |
| `per_second()` | Crée un graphique illustrant le taux de variation de la métrique par seconde. | `per_second(<NOM_MÉTRIQUE>{*})` |


## Par minute

| Fonction       | Description                                                | Exemple                        |
| :----          | :-------                                                   | :---------                     |
| `per_minute()` | Crée un graphique illustrant le taux de variation de la métrique par seconde. | `per_minute(<NOM_MÉTRIQUE>{*})` |

## Par heure

| Fonction     | Description                                              | Exemple                      |
| :----        | :-------                                                 | :---------                   |
| `per_hour()` | Crée un graphique illustrant le taux de variation de la métrique par heure. | `per_hour(<NOM_MÉTRIQUE>{*})` |

## Delta durée

| Fonction | Description                                         | Exemple                |
| :----    | :-------                                            | :---------             |
| `dt()`   | Crée un graphique illustrant la différence temporelle en secondes entre les points envoyés. | `dt(<NOM_MÉTRIQUE>{*})` |

## Delta valeur

| Fonction | Description                    | Exemple                  |
| :----    | :-------                       | :---------               |
| `diff()` | Crée un graphique illustrant le delta de la métrique. | `diff(<NOM_MÉTRIQUE>{*})` |


## Dérivée

| Fonction       | Description                                   | Exemple                        |
| :----          | :-------                                      | :---------                     |
| `derivative()` | Crée un graphique illustrant la dérivée (diff/dt) de la métrique. | `derivative(<NOM_MÉTRIQUE>{*})` |

## Autres fonctions

{{< whatsnext desc="Consultez les autres fonctions disponibles :" >}}
    {{< nextlink href="/graphing/functions/algorithms" >}}Algorithme : mettez en place un système de détection d'anomalies ou de singularités sur votre métrique.{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/arithmetic" >}}Opérations arithmétiques : effectuez des opérations arithmétiques sur votre métrique. {{< /nextlink >}}
    {{< nextlink href="/graphing/functions/count" >}}Total : comptez les valeurs différentes de zéro ou différentes de null de votre métrique. {{< /nextlink >}}
    {{< nextlink href="/graphing/functions/interpolation" >}}Interpolation : saisissez ou définissez des valeurs par défaut pour votre métrique.{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/rank" >}}Rang : sélectionnez seulement un sous-ensemble de métriques. {{< /nextlink >}}
    {{< nextlink href="/graphing/functions/regression" >}}Régression : appliquez une fonction d'apprentissage automatique sur votre métrique.{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/rollup" >}}Cumul : contrôlez le nombre de points bruts utilisés dans votre métrique. {{< /nextlink >}}
    {{< nextlink href="/graphing/functions/smoothing" >}}Lissage : lissez les variations de votre métrique.{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/timeshift" >}}Décalage temporel : modifiez la période d'un point de données de votre métrique. {{< /nextlink >}}
{{< /whatsnext >}}
