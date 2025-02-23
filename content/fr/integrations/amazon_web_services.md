---
aliases:
  - /fr/integrations/aws/
  - /fr/logs/aws
  - /fr/integrations/faq/revoking-aws-keys-and-enabling-role-delegation-for-the-datadog-aws-integration/
  - /fr/integrations/faq/additional-aws-metrics-min-max-sum
  - /fr/integrations/faq/why-am-i-only-seeing-the-average-values-of-my-custom-aws-cloudwatch-metrics/
categories:
  - cloud
  - aws
  - log collection
ddtype: crawler
dependencies: []
description: Intégrez vos services AWS à Datadog.
doc_link: 'https://docs.datadoghq.com/integrations/amazon_web_services/'
git_integration_title: amazon_web_services
has_logo: true
integration_title: AWS
is_public: true
kind: integration
manifest_version: '1.0'
name: amazon_web_services
public_title: Intégration Datadog/AWS
short_description: Intégrez vos services AWS à Datadog.
version: '1.0'
---
## Présentation

Associez Amazon Web Services (AWS) pour :

* Consulter des mises à jour automatiques de statut AWS dans votre flux
* Obtenir des métriques CloudWatch pour les hosts EC2 sans installer l'Agent
* Appliquer un tag à vos hosts EC2 comportant des informations spécifiques à EC2 (p. ex., leur zone de disponibilité)
* Consulter les événements de maintenance EC2 planifiés dans votre flux
* Recueillir des métriques et des événements CloudWatch depuis de nombreux autres produits AWS

Les intégrations connexes comprennent :

|                                         |                                                                                        |
|-----------------------------------------|----------------------------------------------------------------------------------------|
| [API Gateway][1]                        | Créez, publiez, maintenez et sécurisez des API                                             |
| [Appstream][97]                         | Streaming d'applications entièrement géré sur AWS                                             |
| [AppSync][98]                           | Un service GraphQL offrant des fonctionnalités de synchronisation des données en temps réel et de programmation hors ligne |
| [Athena][99]                            | Service de requêtes interactif sans serveur                                                   |
| [Auto Scaling][2]                        | Configuration du dimensionnement d'EC2                                                                     |
| [Billing][3]                            | Facturation et budgets                                                                    |
| [CloudFront][4]                         | Réseau de diffusion de contenu local                                                         |
| [Cloudhsm][93]                          | Module de sécurité de matériel (HSM) géré                                                 |
| [CloudSearch][6]                        | Accès aux fichiers de log et aux appels d'API AWS                                                  |
| [CloudTrail][5]                         | Accès aux fichiers de log et aux appels d'API AWS                                                  |
| [CodeBuild][92]                         | Service de génération entièrement géré                                                            |
| [CodeDeploy][94]                        | Automatisation des déploiements de code                                                              |
| [Cognito][100]                          | Inscription et connexion utilisateur sécurisées                                                        |
| [Connect][101]                          | Un centre de contacts clients fonctionnant en libre-service et basé sur le cloud                                     |
| [Direct Connect][7]                     | Connexion réseau dédiée à AWS                                                    |
| [DMS][102]                              | Service de migration de base de données                                                             |
| [DocumentDB][95]                        | Base de données compatible avec MongoDB                                                            |
| [Dynamo DB][8]                          | Base de données NoSQL                                                                         |
| [EBS (Elastic Block Store)][11]         | Volumes de stockage permanent par bloc                                                 |
| [EC2 (Elastic Cloud Compute)][13]       | Capacité de calcul redimensionnable dans le cloud                                                |
| [EC2 Spot][103]                         | Exploitation des capacités inutilisées d'EC2                                                  |
| [ECS (Elastic Container Service)][9]    | Service de gestion de conteneurs prenant en charge les conteneurs Docker                           |
| [EFS (Elastic File System)][14]         | Stockage de fichiers partagé                                                                    |
| [EKS][104]                              | Elastic Container Service pour Kubernetes                                               |
| [Elastic Transcoder][105]               | Transcodage de médias et de vidéo dans le cloud                                               |
| [ElastiCache][12]                       | Cache en mémoire dans le cloud                                                           |
| [Elastic Beanstalk][10]                 | Service pour le déploiement et le dimensionnement d'applications et de services Web                        |
| [ELB (Elastic Load Balancing)][15]      | Distribution du trafic entrant d'applications sur plusieurs instances Amazon EC2          |
| [EMR (Elastic Map Reduce)][16]          | Traitement de données avec Hadoop                                                           |
| [ES (Elasticsearch)][17]                | Déploiement, utilisation et mise à l'échelle des clusters Elasticsearch                                      |
| [Firehose][18]                          | Capture et chargement de données de streaming                                                        |
| [Gamelift][106]                         | Hébergement de serveurs de jeux dédiés                                                          |
| [Glue][107]                             | Extraction, transformation et chargement de données pour l'analyse                                        |
| [GuardDuty][108]                        | Détection des menaces intelligente                                                           |
| [Health][109]                           | Visibilité sur l'état de vos ressources, services et comptes AWS                |
| [Inspector][110]                        | Évaluation automatisée de la sécurité                                                          |
| [IOT (Internet of Things)][19]          | Connexion d'appareils IoT à des services cloud                                                |
| [Kinesis][20]                           | Service de traitement en temps réel de grands flux de données distribués                    |
| [KMS (Key Management Service)][21]      | Création et contrôle des clés de chiffrement                                                     |
| [Lambda][22]                            | Service de calcul sans serveur                                                                   |
| [Lex][111]                              | Création de bots de discussion                                                                |
| [Machine Learning][23]                  | Création des modèles d'apprentissage automatique                                                         |
| [MediaConnect][112]                     | Transport de vidéos en direct                                                               |
| [MediaConvert][113]                     | Traitement vidéo pour la diffusion et la distribution multi-écran                                |
| [MediaPackage][114]                     | Préparation et protection de vidéos en vue de leur diffusion sur Internet                               |
| [MediaTailor][115]                      | Insertion évolutive de publicités côté serveur                                                      |
| [MQ][116]                               | Agent de message géré pour ActiveMQ                                                    |
| [Managed Streaming for Kafka][117]      | Conception et exécution d'applications qui utilisent Kafka pour le traitement des données de streaming             |
| [NAT Gateway][118]                      | Autoriser les instances d'un sous-réseau privé à se connecter à Internet ou à d'autres services AWS  |
| [Neptune][119]                          | Service de base de données orienté graph fiable et rapide conçu pour le cloud                                      |
| [OpsWorks][24]                          | Gestion de la configuration                                                               |
| [Polly][25]                             | Service de synthèse vocale                                                                    |
| [RDS (Relational Database Service)][27] | Base de données relationnelle dans le cloud                                                       |
| [Redshift][26]                          | Solution d'entrepôt de données                                                                |
| [Rekognition][120]                      | Analyse d'images et de vidéos pour les applications                                              |
| [Route 53][28]                          | Gestion de noms de domaine et de trafic avec surveillance de la disponibilité                                |
| [S3 (Simple Storage Service)][32]       | Service de stockage dans le cloud hautement disponible et évolutif                                    |
| [SageMaker][121]                        | Algorithmes et modèles d'apprentissage automatique                                                 |
| [SES (Simple Email Service)][29]        | Service économique d'envoi d'e-mails                                    |
| [SNS (Simple Notification System)][30]  | Alertes et notifications                                                               |
| [SQS (Simple Queue Service)][31]        | Service de file d'attente de messagerie                                                                |
| [Storage Gateway][34]                   | Stockage cloud hybride                                                                   |
| [SWF (Simple Workflow Service)][33]     | Gestion de workflows dans le cloud                                                              |
| [VPC (Virtual Private Cloud)][122]      | Lancement de ressources AWS dans un réseau virtuel                                            |
| [Web Application Firewall (WAF)][35]    | Protection des applications Web contre les failles Web les plus courantes                                      |
| [Workspaces][36]                        | Service de bureau sécurisé                                                       |
| [X-Ray][37]                             | Création de traces pour les applications distribuées                                                   |

## Implémentation
### Installation

La configuration de l'intégration de Datadog à Amazon Web Services nécessite la configuration de la délégation de rôles à l'aide d'AWS IAM. Pour mieux comprendre
le principe de délégation des rôles, reportez-vous au [guide des meilleures pratiques d'AWS IAM][38].

<div class="alert alert-warning">
Les régions GovCloud et Chine ne prennent actuellement pas en charge la délégation de rôle IAM. Si vous effectuez un déploiement dans ces régions, passez directement à la <a href="#configuration">section Configuration</a> ci-dessous.
</div>

1. Créez un nouveau rôle dans la [console IAM d'AWS][39].
2. Sélectionnez le type de rôle `Another AWS account`.
3. Pour Account ID, saisissez `464622532012` (identifiant de compte Datadog). Cela signifie que vous accordez à Datadog un accès en lecture seule à vos données AWS.
4. Décochez la case `Require external ID` et saisissez l'ID généré [dans l'application Datadog][40]. Assurez-vous de ne pas cocher **Require MFA**. *Pour en savoir plus sur l'External ID, consultez [ce document du Guide de l'utilisateur d'IAM][41]*.
5. Cliquez sur `Next: Permissions`.
6. Si vous avez déjà créé la stratégie, sélectionnez-la sur cette page, puis passez à l'étape 12. Si ce n'est pas le cas, cliquez sur `Create Policy` afin d'ouvrir une nouvelle fenêtre.
7. Sélectionnez l'onglet `JSON`. Afin de profiter de toutes les intégrations AWS proposées par Datadog, utilisez l'[extrait de stratégie](#strategie-iam-aws-datadog) sous la zone de texte. Étant donné que d'autres composants sont ajoutés à une intégration, ces autorisations peuvent évoluer.
8. Cliquez sur `Review policy`.
9. Nommez la stratégie `DatadogAWSIntegrationPolicy` ou utilisez le nom de votre choix, et saisissez une description pertinente.
10. Cliquez sur `Create policy`. Vous pouvez ensuite fermer cette fenêtre.
11. Depuis la fenêtre « Create role », actualisez la liste des stratégies et sélectionnez celle que vous venez de créer.
12. Cliquez sur `Next: Review`.
13. Saisissez le nom `DatadogAWSIntegrationRole` ou un nom similaire pour le rôle, ainsi qu'une description pertinente. Cliquez sur `Create role`.

**Étape facultative** : si vous utilisez Terraform, configurez votre stratégie IAM Datadog à l'aide de [l'intégration AWS avec Terraform][42].

#### Stratégie IAM AWS Datadog
Les autorisations énumérées ci-dessous sont incluses dans le document de stratégie à l'aide de wildcards comme `List*` et `Get*`. Si vous avez besoin de stratégies strictes, utilisez les noms d'action complets indiqués et consultez la documentation sur l'API Amazon pour les services requis.

{{< tabs >}}
{{% tab "Toutes les autorisations" %}}
Si vous ne souhaitez pas accorder toutes les autorisations, nous vous recommandons d'utiliser au strict minimum les stratégies **AmazonEC2ReadOnlyAccess** et **CloudWatchReadOnlyAccess**. Pour en savoir plus sur les autorisations, consultez l'onglet **Autorisations de base**.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "apigateway:GET",
        "autoscaling:Describe*",
        "budgets:ViewBudget",
        "cloudfront:GetDistributionConfig",
        "cloudfront:ListDistributions",
        "cloudtrail:DescribeTrails",
        "cloudtrail:GetTrailStatus",
        "cloudwatch:Describe*",
        "cloudwatch:Get*",
        "cloudwatch:List*",
        "codedeploy:List*",
        "codedeploy:BatchGet*",
        "directconnect:Describe*",
        "dynamodb:List*",
        "dynamodb:Describe*",
        "ec2:Describe*",
        "ecs:Describe*",
        "ecs:List*",
        "elasticache:Describe*",
        "elasticache:List*",
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:DescribeTags",
        "elasticloadbalancing:Describe*",
        "elasticmapreduce:List*",
        "elasticmapreduce:Describe*",
        "es:ListTags",
        "es:ListDomainNames",
        "es:DescribeElasticsearchDomains",
        "health:DescribeEvents",
        "health:DescribeEventDetails",
        "health:DescribeAffectedEntities",
        "kinesis:List*",
        "kinesis:Describe*",
        "lambda:AddPermission",
        "lambda:GetPolicy",
        "lambda:List*",
        "lambda:RemovePermission",
        "logs:Get*",
        "logs:Describe*",
        "logs:FilterLogEvents",
        "logs:TestMetricFilter",
        "logs:PutSubscriptionFilter",
        "logs:DeleteSubscriptionFilter",
        "logs:DescribeSubscriptionFilters",
        "rds:Describe*",
        "rds:List*",
        "redshift:DescribeClusters",
        "redshift:DescribeLoggingStatus",
        "route53:List*",
        "s3:GetBucketLogging",
        "s3:GetBucketLocation",
        "s3:GetBucketNotification",
        "s3:GetBucketTagging",
        "s3:ListAllMyBuckets",
        "s3:PutBucketNotification",
        "ses:Get*",
        "sns:List*",
        "sns:Publish",
        "sqs:ListQueues",
        "support:*",
        "tag:GetResources",
        "tag:GetTagKeys",
        "tag:GetTagValues",
        "xray:BatchGetTraces",
        "xray:GetTraceSummaries"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
```
{{% /tab %}}
{{% tab "Autorisations de base" %}}
L'intégration AWS/Datadog de base récupère des données à partir d'AWS CloudWatch. Votre document de stratégie doit au minimum autoriser les actions suivantes :

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "cloudwatch:Get*",
        "cloudwatch:List*",
        "ec2:Describe*",
        "support:*",
        "tag:GetResources",
        "tag:GetTagKeys",
        "tag:GetTagValues"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
```

| Autorisation AWS             | Description                                                                                  |
|----------------------------|----------------------------------------------------------------------------------------------|
| `cloudwatch:ListMetrics`   | Énumère les métriques CloudWatch disponibles.                                                       |
| `cloudwatch:GetMetricData` | Récupère des points de données pour une métrique donnée.                                                        |
| `support:*`               | Ajoute des métriques à propos des limites de service.<br>Nécessite un accès complet, en raison des [limites AWS][1]. |
| `tag:getResources`         | Récupère des tags personnalisés en fonction du type de ressource.                                                            |
| `tag:getTagKeys`           | Récupère des clés de tag selon les régions d'un compte AWS.                                                |
| `tag:getTagValues`         | Récupère les valeurs de tag selon les régions d'un compte AWS.                                              |

L'API Resource Group Tagging vise notamment à réduire le nombre d'appels API requis pour recueillir des tags personnalisés. Pour en savoir plus, consultez la documentation relative aux [stratégies sur les tags][2] sur le site Web d'AWS.


[1]: http://docs.aws.amazon.com/IAM/latest/UserGuide/list_trustedadvisor.html
[2]: http://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/Welcome.html
{{% /tab %}}
{{< /tabs >}}

### Configuration

{{< tabs >}}
{{% tab "Délégation de rôles" %}}

{{< img src="integrations/aws/integrations-aws-secretentry.png" alt="logo" responsive="true">}}

1. Ouvrez le [carré d'intégration AWS][1].
2. Sélectionnez l'onglet **Role Delegation**.
3. Saisissez votre ID de compte AWS **sans tiret**, p. ex. `123456789012` et **non** `1234-5678-9012`. Votre ID de compte est indiqué dans l'ARN du rôle créé durant l'[installation de l'intégration AWS](#installation). Saisissez ensuite le nom du rôle créé. **Remarque** : le nom du rôle saisi dans le carré d'intégration est sensible à la casse et doit correspondre parfaitement au nom de rôle créé sur AWS.
4. Choisissez les services pour lesquels vous souhaitez récupérer des métriques sur le côté gauche de la fenêtre de dialogue. Vous pouvez également ajouter des tags à l'ensemble des hosts et métriques. De même, si vous souhaitez uniquement surveiller un sous-ensemble d'instances EC2 sur AWS, appliquez-leur un tag et indiquez ce tag dans la zone de texte « limite » de cette page.
5. Cliquez sur **Install Integration**.


[1]: https://app.datadoghq.com/account/settings#integrations/amazon_web_services
{{% /tab %}}
{{% tab "GovCloud et Chine" %}}

1. Ouvrez le [carré d'intégration AWS][1].
2. Sélectionnez l'onglet **Access Keys (GovCloud or China Only)**.
3. Saisissez votre clé d'accès et votre clé de secret AWS. **Seules les clés d'accès et de secret pour GovCloud et la Chine sont acceptées.**
4. Choisissez les services pour lesquels vous souhaitez récupérer des métriques sur le côté gauche de la fenêtre de dialogue. Vous pouvez également ajouter des tags à l'ensemble des hosts et métriques. De même, si vous souhaitez uniquement surveiller un sous-ensemble d'instances EC2 sur AWS, appliquez-leur un tag et indiquez ce tag dans la zone de texte « limite » de cette page.
5. Cliquez sur **Install Integration**.


[1]: https://app.datadoghq.com/account/settings#integrations/amazon_web_services
{{% /tab %}}
{{< /tabs >}}

## Collecte de logs

Les logs de service AWS sont recueillis via la fonction Lambda de Datadog. Ce Lambda, qui se déclenche sur les compartiments S3, les groupes de logs CloudWatch et les événements CloudWatch, transmet des logs à Datadog.

Pour commencer à recueillir des logs à partir de vos services AWS :

1. Configurez la [fonction Lambda de Datadog](#configurer-la-fonction-lambda-de-datadog).
2. [Activez la journalisation](#activer-la-journalisation-pour-votre-service-AWS) pour votre service AWS (la plupart des services AWS peuvent se connecter à un compartiment S3 ou à un groupe de logs CloudWatch).
3. Configurez les déclencheurs entraînant l'exécution du lambda. Il existe deux façons de les configurer :

  * [automatiquement](#configurer-automatiquement-des-declencheurs) : Datadog récupère les logs pour les services AWS sélectionnés et les ajoute en tant que déclencheurs pour la fonction Lambda de Datadog. Datadog met également la liste à jour.
  * [manuellement](#configurer-manuellement-des-declencheurs) : configurez vous-même chaque déclencheur via la console AWS.

### Configurer la fonction Lambda de Datadog

Pour ajouter le Lambda de transmission de logs à Datadog sur votre compte AWS, vous pouvez **utiliser le référentiel sans serveur AWS *ou* créer manuellement un nouveau Lambda.**

#### Référentiel sans serveur AWS

Utilisez le [référentiel sans serveur AWS][43] pour déployer la fonction Lambda sur votre compte AWS.

#### Créer manuellement un nouveau Lambda

##### Créer une fonction Lambda

1. Accédez à la [console Lambda][44] et créez une nouvelle fonction :
    {{< img src="logs/aws/create_lambda_function.png" alt="Créer une fonction Lambda" responsive="true" popup="true" style="width:80%;" >}}

2. Sélectionnez **Author from scratch** et saisissez un nom unique pour la fonction.
3. Définissez Runtime sur **Python 2.7**, **Python 3.6** ou **Python 3.7**.
4. Pour `Role`, sélectionnez **Create new role from template(s)** et saisissez un nom unique pour le rôle.
5. Si vous récupérez des logs à partir d'un compartiment S3, sous « Policy templates », sélectionnez **s3 object read-only permissions**.
6. Sélectionnez **Create Function**.
    {{< img src="logs/aws/author_from_scratch.png" alt="Création de A à Z" responsive="true" style="width:80%;" >}}

##### Fournir le code et configurer le Lambda

1. Copiez le code depuis [ce référentiel][45] et collez-le dans le champ de code de la fonction.
2. Assurez-vous que le gestionnaire indique **lambda_function.lambda_handler**.
    {{< img src="logs/aws/select_python.png" alt="Sélectionner Python" responsive="true" style="width:80%;" >}}
3. En haut du script se trouve une section intitulée `#DD_API_KEY: Datadog API Key`. Vous pouvez fournir la clé d'API requise par la fonction Lambda de deux façons différentes :

    * En configurant une variable d'environnement (conseillé)
    * Modifiez directement le code avec votre [clé d'API Datadog][123].
    {{< img src="logs/aws/dd_api_key_setup.png" alt="Configuration clé API DD" responsive="true" popup="true" style="width:80%;" >}}
4. Si vous utilisez le site européen de Datadog, définissez `DD_SITE` sur `datadoghq.eu` en tant que variable d'environnement ou directement dans le code.
5. Faites défiler jusqu'à atteindre **Basic Settings** sous la zone de code intégrée.
6. Définissez la mémoire sur une valeur **proche de 1 Go**.
7. Définissez le délai d'expiration (nous recommandons d'indiquer **120 secondes**).
    {{< img src="logs/aws/basic_settings.png" alt="Réglages de base" responsive="true" style="width:80%;" >}}
8. Définissez Execution Role sur le [rôle créé précédemment][46].
    {{< img src="logs/aws/execution_role.png" alt="Réglages de base" responsive="true" style="width:80%;" >}}
9. Ajoutez la [couche Lambda de Datadog][96] à l'aide de l'ARN suivante. Remplacez `us-east-1` par la région où votre fonction est déployée et remplacez `Python27` par le runtime Python que votre fonction utilise (`Python27`, `Python36`, ou `Python37`).
   ```
   arn:aws:lambda:us-east-1:464622532012:layer:Datadog-Python27:5
   ```
10. Faites défiler vers le haut de la page et cliquez sur **Save**.

#### Tester votre Lambda

1. Cliquez sur **Test**.
2. Sélectionnez **CloudWatch Logs** comme événement de test.
    {{< img src="logs/aws/test_event.png" alt="Événement test" responsive="true" style="width:80%;" >}}
2. Saisissez un nom unique pour l'événement, puis cliquez sur **Create**.
3. Cliquez sur Test et vérifiez qu'aucune erreur ne survient (les logs de test n'apparaîtront pas dans votre plateforme Datadog).

#### Paramètres avancés (rédaction et filtrage facultatifs)

##### Ajouter des règles de filtrage ou de remplacement à l'aide de variables d'environnement

###### Règles de remplacement

Plusieurs options de nettoyage sont disponibles : `REDACT_IP` et `REDACT_EMAIL` trouvent les expressions codées en dur, alors que `DD_SCRUBBING_RULE` permet aux utilisateurs de spécifier une expression régulière.

- Pour utiliser `REDACT_IP`, ajoutez-la comme variable d'environnement et définissez sa valeur sur `true`.
    - Le texte correspondant à `\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}` est remplacé par `xxx.xxx.xxx.xxx`.
- Pour utiliser `REDACT_EMAIL`, ajoutez-la comme variable d'environnement et définissez sa valeur sur `true`.
    - Le texte correspondant à `[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+` est remplacé par `xxxxx@xxxxx.com`.
- Pour utiliser `DD_SCRUBBING_RULE`, ajoutez-la comme variable d'environnement et entrez une expression régulière pour définir sa valeur.
    - Par défaut, le texte correspondant à l'expression régulière spécifiée par l'utilisateur est remplacé par `xxxxx`.
    - Utilisez la variable d'environnement `DD_SCRUBBING_RULE_REPLACEMENT` pour spécifier une valeur en remplacement de `xxxxx`.
- Les règles de nettoyage sont appliquées à l'intégralité du log au format JSON, y compris aux métadonnées automatiquement ajoutées par la fonction Lambda.
- Chaque expression correspondante est remplacée jusqu'à ce qu'aucune correspondance ne soit trouvée dans chaque log.

###### Règles de filtrage

Utilisez les variables d'environnement `EXCLUDE_AT_MATCH` OU `INCLUDE_AT_MATCH` pour filtrer les logs en fonction d'une expression régulière.

- Pour utiliser `EXCLUDE_AT_MATCH`, ajoutez-la comme variable d'environnement et entrez une expression régulière pour définir sa valeur. Les logs correspondant à l'expression régulière sont exclus.
- Pour utiliser `INCLUDE_AT_MATCH`, ajoutez-la comme variable d'environnement et entrez une expression régulière pour définir sa valeur. Les logs non exclus par `EXCLUDE_AT_MATCH` et correspondant à l'expression régulière sont inclus.
- Si un log correspond à la fois aux critères d'inclusion et d'exclusion, il est exclus.
- Les règles de filtrage sont appliquées à l'intégralité du log au format JSON, y compris aux métadonnées automatiquement ajoutées par la fonction.

Pensez à tester votre Lambda après avoir configuré les paramètres avancés pour vérifier qu'aucune erreur ne se produit.

### Activer la journalisation pour votre service AWS

Tous les services AWS qui génèrent des logs dans un compartiment S3 ou un groupe de logs CloudWatch sont pris en charge. Consultez les instructions de configuration spécifiques des services les plus utilisés dans le tableau ci-dessous :

| Service AWS                        | Activer la journalisation de service AWS                                                                    | Envoyer des logs AWS à Datadog                                                   |
|------------------------------------|-------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| [API Gateway][47]                  | [Activer les logs AWS API Gateway][48]                                                               | Collecte de logs [manuelle][49]                                                |
| [Cloudfront][50]                   | [Activer les logs AWS Cloudfront][51]                                                                | Collecte de logs [manuelle][52] et [automatique](#configurer-automatiquement-des-declencheurs) |
| [Cloudtrail][53]                   | [Activer les logs AWS Cloudtrail][54]                                                                | Collecte de logs [manuelle][55]                                                |
| [DynamoDB][56]                     | [Activer les logs AWS DynamoDB][57]                                                                  | Collecte de logs [manuelle][58]                                                |
| [EC2][59]                          | `-`                                                                                             | Utiliser l'[Agent Datadog][60] pour envoyer vos logs à Datadog                   |
| [ECS][61]                          | `-`                                                                                             | [Utiliser l'Agent Docker pour rassembler vos logs][62]                             |
| [Elastic Load Balancing (ELB)][63] | [Activer les logs AWS ELB][64]                                                                       | Collecte de logs [manuelle][65] et [automatique](#configurer-automatiquement-des-declencheurs) |
| [Lambda][66]                       | `-`                                                                                             | Collecte de logs [manuelle][67] et [automatique](#configurer-automatiquement-des-declencheurs) |
| [RDS][68]                          | [Activer les logs AWS RDS][69]                                                                       | Collecte de logs [manuelle][70]                                                |
| [Route 53][71]                     | [Activer les logs AWS Route 53][72]                                                                  | Collecte de logs [manuelle][73]                                                |
| [S3][74]                           | [Activer les logs AWS S3][75]                                                                        | Collecte de logs [manuelle][76] et [automatique](#configurer-automatiquement-des-declencheurs) |
| [SNS][77]                          | Il n'y a pas de « logs SNS ». Traitez les logs et les événements transmis via le service SNS. | Collecte de logs [manuelle][78]                                                |
| [RedShift][79]                     | [Activer les logs AWS Redshift][80]                                                                  | Collecte de logs [manuelle][81] et [automatique](#configurer-automatiquement-des-declencheurs) |
| [VPC][82]                          | [Activer les logs AWS VPC][83]                                                                       | Collecte de logs [manuelle][84]                                                |

### Envoyer des logs de service AWS à Datadog

Vous pouvez choisir entre deux options pour la configuration des déclencheurs de la fonction Lambda de Datadog :

* Configurer manuellement des déclencheurs sur des compartiments S3, des groupes de logs CloudWatch ou des événements CloudWatch.
* Laisser Datadog définir et gérer automatiquement la liste des déclencheurs.

#### Configurer automatiquement des déclencheurs

Si vous stockez des logs dans de nombreux compartiments S3 ou groupes de logs CloudWatch, Datadog peut gérer automatiquement les déclencheurs à votre place.

1. Si vous ne l'avez pas déjà fait, configurez la [fonction Lambda de collecte de logs AWS avec Datadog][85].
2. Le référentiel sans serveur AWS déploie la fonction Lambda sur le compte et crée un rôle, généralement avec un nom comme 'serverlessrepo-Datadog-Log-loglambdaddfunctionRole-xyz'. Toutefois, une stratégie doit être appliquée à ce rôle avec le nombre d'autorisations adéquat. Généralement, le rôle est associé à une stratégie n'ayant pas suffisamment d'autorisations pour que l'enregistrement de la fonction Lambda fonctionne. Ajoutez toutes les autorisations requises énumérées ci-dessous à la stratégie faisant partie du rôle de la fonction Lambda de Datadog en utilisant la [console IAM][86]. Il s'agit des autorisations déjà utilisées dans l'intégration Datadog/AWS. Une autre méthode permettant de mettre à jour les autorisations de la stratégie associée au rôle de la fonction Lambda consiste à associer une deuxième stratégie, celle qui est utilisée par l'intégration Datadog/AWS. Les descriptions ci-dessous donnent des informations sur la manière dont ces autorisations sont utilisées :

    ```
    "cloudfront:GetDistributionConfig",
    "cloudfront:ListDistributions",
    "elasticloadbalancing:DescribeLoadBalancers",
    "elasticloadbalancing:DescribeLoadBalancerAttributes",
    "lambda:AddPermission",
    "lambda:GetPolicy",
    "lambda:RemovePermission",
    "redshift:DescribeClusters",
    "redshift:DescribeLoggingStatus",
    "s3:GetBucketLogging",
    "s3:GetBucketLocation",
    "s3:GetBucketNotification",
    "s3:ListAllMyBuckets",
    "s3:PutBucketNotification",
    "logs:PutSubscriptionFilter",
    "logs:DeleteSubscriptionFilter",
    "logs:DescribeSubscriptionFilters"
    ```

| Autorisation AWS                                        | Description                                                                  |
|-------------------------------------------------------|------------------------------------------------------------------------------|
| `cloudfront:GetDistributionConfig`                    | Récupère le nom du compartiment S3 contenant les logs d'accès CloudFront.             |
| `cloudfront:ListDistributions`                        | Énumère toutes les distributions CloudFront.                                           |
| `elasticloadbalancing:DescribeLoadBalancers`          | Énumère tous les répartiteurs de charge.                                                     |
| `elasticloadbalancing:DescribeLoadBalancerAttributes` | Récupère le nom du compartiment S3 contenant les logs d'accès ELB.                    |
| `lambda:AddPermission`                                | Ajoute une autorisation permettant à un compartiment S3 spécifique de déclencher une fonction Lambda. |
| `lambda:GetPolicy`                                    | Récupère la stratégie Lambda lorsque des déclencheurs doivent être supprimés.                      |
| `lambda:RemovePermission`                             | Supprime des autorisations d'une stratégie Lambda.                                     |
| `redshift:DescribeClusters`                           | Énumère tous les clusters Redshift.                                                  |
| `redshift:DescribeLoggingStatus`                      | Récupère le nom du compartiment S3 contenant les logs Redshift.                      |
| `s3:GetBucketLogging`                                 | Récupère le nom du compartiment S3 contenant les logs d'accès S3.                     |
| `s3:GetBucketLocation`                                | Récupère la région du compartiment S3 contenant les logs d'accès S3.                   |
| `s3:GetBucketNotification`                            | Récupère les configurations existantes de déclenchement de Lambda.                                  |
| `s3:ListAllMyBuckets`                                 | Énumère tous les compartiments S3.                                                         |
| `s3:PutBucketNotification`                            | Ajoute ou supprime un déclencheur Lambda basé sur des événements de compartiment S3.                    |
| `logs:PutSubscriptionFilter`                          | Ajoute un déclencheur Lambda basé sur des événements de log CloudWatch.                          |
| `logs:DeleteSubscriptionFilter`                       | Supprime un déclencheur Lambda basé sur des événements de log CloudWatch.                       |
| `logs:DescribeSubscriptionFilters`                    | Énumère les filtres d'abonnement pour le groupe de logs spécifié.                  |


3. Accédez à l'onglet *Collect Logs* dans le [carré d'intégration AWS][87].
4. Sélectionnez le compte AWS à partir duquel vous souhaitez recueillir des logs, puis saisissez l'ARN du Lambda créé dans la section précédente.
{{< img src="logs/aws/AWSLogStep1.png" alt="Saisie de Lambda" responsive="true" popup="true" style="width:80%;" >}}
5. Cochez les services à partir desquels vous souhaitez recueillir des logs et cliquez sur « Save ». Pour arrêter la collecte de logs d'un service spécifique, décochez la case associée.
{{< img src="logs/aws/AWSLogStep2.png" alt="Sélection de services" responsive="true" popup="true" style="width:80%;" >}}
6. Si vous possédez des logs dans plusieurs régions, vous devez créer des fonctions Lambda supplémentaires dans ces régions et les indiquer dans ce carré.
7. Pour arrêter la collecte de l'ensemble des logs AWS, appuyez sur la *croix* en regard de chaque ARN de Lambda. Tous les déclencheurs de cette fonction seront supprimés.
8. Quelques minutes après cette première configuration, vos logs AWS apparaîtront dans votre [page Log Explorer][88] Datadog, quasiment en temps réel.

#### Configurer manuellement des déclencheurs

##### Collecte de logs depuis un groupe de logs CloudWatch

Si vous stockez des logs dans un groupe de logs CloudWatch, suivez les étapes ci-dessous pour les transmettre à Datadog :

1. Si vous ne l'avez pas déjà fait, configurez la [fonction Lambda de collecte de logs AWS avec Datadog][85].
2. Une fois la fonction Lambda installée, ajoutez manuellement un déclencheur dans la console AWS sur le groupe de logs CloudWatch qui contient vos logs :

{{< img src="integrations/amazon_cloudwatch/cloudwatch_log_collection_1.png" alt="groupes de logs cloudwatch" responsive="true" popup="true" style="width:70%;">}}

   Sélectionnez le groupe de logs CloudWatch correspondant, ajoutez un nom de filtre (vous pouvez toutefois laisser le filtre vide) et ajoutez le déclencheur :
{{< img src="integrations/amazon_cloudwatch/cloudwatch_log_collection_2.png" alt="déclencheur cloudwatch" responsive="true" popup="true" style="width:70%;">}}

Accédez ensuite à votre [section Log de Datadog][88] pour commencer à explorer vos logs !

##### Collecte de logs depuis des compartiments S3

Si vous stockez des logs dans un compartiment S3, suivez les étapes ci-dessous pour les transmettre à Datadog :

1. Si vous ne l'avez pas déjà fait, configurez la [fonction Lambda de collecte de logs AWS avec Datadog][85].
2. Une fois la fonction Lambda installée, ajoutez manuellement un déclencheur dans la console AWS sur le compartiment S3 qui contient vos logs :
    {{< img src="logs/aws/adding_trigger.png" alt="Ajout d'un déclencheur" responsive="true" popup="true"style="width:80%;">}}

3. Sélectionnez le compartiment, puis suivez les instructions d'AWS :
    {{< img src="logs/aws/integration_lambda.png" alt="Intégration Lambda" responsive="true" popup="true" style="width:80%;">}}

4. Définissez le bon type d'événement sur les compartiments S3 :
    {{< img src="logs/aws/object_created.png" alt="Objet créé" responsive="true" popup="true" style="width:80%;">}}

Accédez ensuite à votre [section Log de Datadog][88] pour commencer à explorer vos logs !

## Données collectées

### Métriques
{{< get-metrics-from-git "amazon_web_services" >}}


### Événements

Vous pouvez configurer la collecte d'événements AWS pour chaque service AWS. Consultez la documentation des différents services AWS pour en savoir plus sur la collecte d'événements.

## Dépannage

### Vous constatez un écart entre vos données dans CloudWatch et Datadog ?

Il est important de tenir compte des deux distinctions suivantes :

1. Pour les counters AWS, un graphique défini sur « sum » « 1minute » affiche le nombre total d'occurrences en l'espace d'une minute, soit le taux par minute. Datadog affiche les données brutes à partir des valeurs AWS normalisées par seconde, peu importe l'intervalle sélectionné dans AWS. Cela explique pourquoi la valeur affichée dans Datadog peut être plus faible.
2. Les valeurs minimales, maximales et moyennes n'ont généralement pas la même signification dans AWS et dans Datadog. Dans AWS, les latences moyenne, minimale et maximale correspondent à trois métriques distinctes recueillies. Lorsque Datadog récupère des métriques à partir d'AWS CloudWatch, la latence moyenne est transmise sous la forme de séries temporelles distinctes par ELB. Dans Datadog, lorsque vous sélectionnez les valeurs « min », « max » ou « avg », vous définissez les critères de rassemblement de séries temporelles. Par exemple, si vous cherchez à obtenir `system.cpu.idle` sans appliquer de filtre, une série est envoyée pour chaque host qui renvoie cette métrique. Ces séries doivent être combinées pour être représentées graphiquement. À l'inverse, si vous cherchez à obtenir `system.cpu.idle` pour un seul host, aucune agrégation n'est nécessaire. Les valeurs maximale et moyenne sont identiques.

### Retard des métriques

Lorsque vous utilisez l'intégration AWS, Datadog récupère vos métriques via l'API CloudWatch. Il est possible que les données des métriques AWS accusent un léger retard, en raison des contraintes liées à l'API.

Pour commencer, l'API CloudWatch propose uniquement une analyse métrique par métrique afin d'extraire des données. Les API CloudWatch prévoient une limite de débit qui varie en fonction des informations d'authentification, de la région et du service. Les métriques sont transmises par AWS en fonction du niveau du compte. Par exemple, si vous payez pour des « métriques détaillées » dans AWS, vous y avez accès plus rapidement. Ce niveau de service pour les métriques détaillées s'applique également à la granularité. Ainsi, certaines métriques sont transmises toutes les minutes, tandis que d'autres sont envoyées toutes les cinq minutes.

Datadog vous permet de hiérarchiser certaines métriques d'un compte afin de les récupérer en priorité, en fonction de certaines circonstances. Contactez [l'assistance Datadog][90] pour en savoir plus.

Pour obtenir des métriques quasiment en temps réel, installez l'Agent Datadog sur le host. Pour en savoir plus, consultez l'article de blog de Datadog intitulé [Don't fear the Agent: Agent-based monitoring][91] (en anglais).

### Métriques manquantes

L'API CloudWatch renvoie uniquement les métriques avec des points de données. Ainsi, si un ELB ne possède aucune instance liée, aucune métrique associée à cet ELB n'apparaît dans Datadog.

### Nombre aws.elb.healthy_host_count incorrect

Lorsque l'option d'équilibrage des charges entre zones est activée sur un ELB, toutes les instances liées à cet ELB font partie de toutes les zones de disponibilité (pour CloudWatch). Ainsi, si vous possédez deux instances dans 1a et trois dans ab, la métrique affiche cinq instances par zone de disponibilité.
Puisque cela peut s'avérer contre-intuitif, nous avons ajouté de nouvelles métriques, **aws.elb.healthy_host_count_deduped** et **aws.elb.un_healthy_host_count_deduped**, qui affichent le nombre d'instances saines et non saines par zone de disponibilité, que vous ayez activé ou non l'option d'équilibrage des charges entre zones.

### Certains hosts sont dupliqués durant l'installation de l'Agent ?

Lors de l'installation de l'Agent sur un host AWS, il est possible que des hosts soient dupliqués pendant quelques heures sur la page d'infrastructure si vous avez défini manuellement le hostname dans la configuration de l'Agent. Ces doublons disparaîtront après quelques heures et ne seront pas pris en compte durant la facturation.


[1]: https://docs.datadoghq.com/fr/integrations/amazon_api_gateway
[2]: https://docs.datadoghq.com/fr/integrations/amazon_auto_scaling
[3]: https://docs.datadoghq.com/fr/integrations/amazon_billing
[4]: https://docs.datadoghq.com/fr/integrations/amazon_cloudfront
[5]: https://docs.datadoghq.com/fr/integrations/amazon_cloudtrail
[6]: https://docs.datadoghq.com/fr/integrations/amazon_cloudsearch
[7]: https://docs.datadoghq.com/fr/integrations/amazon_directconnect
[8]: https://docs.datadoghq.com/fr/integrations/amazon_dynamodb
[9]: https://docs.datadoghq.com/fr/integrations/amazon_ecs
[10]: https://docs.datadoghq.com/fr/integrations/amazon_elasticbeanstalk
[11]: https://docs.datadoghq.com/fr/integrations/amazon_ebs
[12]: https://docs.datadoghq.com/fr/integrations/amazon_elasticache
[13]: https://docs.datadoghq.com/fr/integrations/amazon_ec2
[14]: https://docs.datadoghq.com/fr/integrations/amazon_efs
[15]: https://docs.datadoghq.com/fr/integrations/amazon_elb
[16]: https://docs.datadoghq.com/fr/integrations/amazon_emr
[17]: https://docs.datadoghq.com/fr/integrations/amazon_es
[18]: https://docs.datadoghq.com/fr/integrations/amazon_firehose
[19]: https://docs.datadoghq.com/fr/integrations/amazon_iot
[20]: https://docs.datadoghq.com/fr/integrations/amazon_kinesis
[21]: https://docs.datadoghq.com/fr/integrations/amazon_kms
[22]: https://docs.datadoghq.com/fr/integrations/amazon_lambda
[23]: https://docs.datadoghq.com/fr/integrations/amazon_machine_learning
[24]: https://docs.datadoghq.com/fr/integrations/amazon_ops_works
[25]: https://docs.datadoghq.com/fr/integrations/amazon_polly
[26]: https://docs.datadoghq.com/fr/integrations/amazon_redshift
[27]: https://docs.datadoghq.com/fr/integrations/amazon_rds
[28]: https://docs.datadoghq.com/fr/integrations/amazon_route53
[29]: https://docs.datadoghq.com/fr/integrations/amazon_ses
[30]: https://docs.datadoghq.com/fr/integrations/amazon_sns
[31]: https://docs.datadoghq.com/fr/integrations/amazon_sqs
[32]: https://docs.datadoghq.com/fr/integrations/amazon_s3
[33]: https://docs.datadoghq.com/fr/integrations/amazon_swf
[34]: https://docs.datadoghq.com/fr/integrations/amazon_storage_gateway
[35]: https://docs.datadoghq.com/fr/integrations/amazon_waf
[36]: https://docs.datadoghq.com/fr/integrations/amazon_workspaces
[37]: https://docs.datadoghq.com/fr/integrations/amazon_xray
[38]: http://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#delegate-using-roles
[39]: https://console.aws.amazon.com/iam/home#/roles
[40]: https://app.datadoghq.com/account/settings#integrations/amazon_web_services
[41]: http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html
[42]: https://docs.datadoghq.com/fr/integrations/faq/aws-integration-with-terraform
[43]: https://serverlessrepo.aws.amazon.com/applications/arn:aws:serverlessrepo:us-east-1:464622532012:applications~Datadog-Log-Forwarder
[44]: https://console.aws.amazon.com/lambda/home?region=us-east-1
[45]: https://github.com/DataDog/datadog-serverless-functions/blob/master/aws/logs_monitoring/lambda_function.py
[46]: https://docs.datadoghq.com/fr/integrations/amazon_web_services/?tab=allpermissions#create-a-new-lambda-function
[47]: https://docs.datadoghq.com/fr/integrations/amazon_api_gateway
[48]: https://docs.datadoghq.com/fr/integrations/amazon_api_gateway/#log-collection
[49]: https://docs.datadoghq.com/fr/integrations/amazon_api_gateway/#send-logs-to-datadog
[50]: https://docs.datadoghq.com/fr/integrations/amazon_cloudfront
[51]: https://docs.datadoghq.com/fr/integrations/amazon_cloudfront/#enable-cloudfront-logging
[52]: https://docs.datadoghq.com/fr/integrations/amazon_cloudfront/#send-logs-to-datadog
[53]: https://docs.datadoghq.com/fr/integrations/amazon_cloudtrail
[54]: https://docs.datadoghq.com/fr/integrations/amazon_cloudtrail/#enable-cloudtrail-logging
[55]: https://docs.datadoghq.com/fr/integrations/amazon_cloudtrail/#send-logs-to-datadog
[56]: https://docs.datadoghq.com/fr/integrations/amazon_dynamodb
[57]: https://docs.datadoghq.com/fr/integrations/amazon_dynamodb/#enable-dynamodb-logging
[58]: https://docs.datadoghq.com/fr/integrations/amazon_dynamodb/#send-logs-to-datadog
[59]: https://docs.datadoghq.com/fr/integrations/amazon_ec2
[60]: https://docs.datadoghq.com/fr/logs
[61]: https://docs.datadoghq.com/fr/integrations/amazon_ecs
[62]: https://docs.datadoghq.com/fr/integrations/amazon_ecs/#log-collection
[63]: https://docs.datadoghq.com/fr/integrations/amazon_elb
[64]: https://docs.datadoghq.com/fr/integrations/amazon_elb/#enable-aws-elb-logging
[65]: https://docs.datadoghq.com/fr/integrations/amazon_elb/#manual-installation-steps
[66]: https://docs.datadoghq.com/fr/integrations/amazon_lambda
[67]: https://docs.datadoghq.com/fr/integrations/amazon_lambda/#log-collection
[68]: https://docs.datadoghq.com/fr/integrations/amazon_rds
[69]: https://docs.datadoghq.com/fr/integrations/amazon_rds/#enable-rds-logging
[70]: https://docs.datadoghq.com/fr/integrations/amazon_rds/#send-logs-to-datadog
[71]: https://docs.datadoghq.com/fr/integrations/amazon_route53
[72]: https://docs.datadoghq.com/fr/integrations/amazon_route53/#enable-route53-logging
[73]: https://docs.datadoghq.com/fr/integrations/amazon_route53/#send-logs-to-datadog
[74]: https://docs.datadoghq.com/fr/integrations/amazon_s3
[75]: https://docs.datadoghq.com/fr/integrations/amazon_s3/#enable-s3-access-logs
[76]: https://docs.datadoghq.com/fr/integrations/amazon_s3/#manual-installation-steps
[77]: https://docs.datadoghq.com/fr/integrations/amazon_sns
[78]: https://docs.datadoghq.com/fr/integrations/amazon_sns/#send-logs-to-datadog
[79]: https://docs.datadoghq.com/fr/integrations/amazon_redshift
[80]: https://docs.datadoghq.com/fr/integrations/amazon_redshift/#enable-aws-redshift-logging
[81]: https://docs.datadoghq.com/fr/integrations/amazon_redshift/#log-collection
[82]: https://docs.datadoghq.com/fr/integrations/amazon_vpc
[83]: https://docs.datadoghq.com/fr/integrations/amazon_vpc/#enable-vpc-flow-log-logging
[84]: https://docs.datadoghq.com/fr/integrations/amazon_vpc/#log-collection
[85]: https://docs.datadoghq.com/fr/integrations/amazon_web_services/#set-up-the-datadog-lambda-function
[86]: https://console.aws.amazon.com/iam/home#s=Home
[87]: https://app.datadoghq.com/account/settings#integrations/amazon_web_services
[88]: https://app.datadoghq.com/logs
[89]: https://github.com/DataDog/dogweb/blob/prod/integration/amazon_web_services/amazon_web_services_metadata.csv
[90]: https://docs.datadoghq.com/fr/help
[91]: http://www.datadoghq.com/blog/dont-fear-the-agent
[92]: https://docs.datadoghq.com/fr/integrations/amazon_codebuild
[93]: https://docs.datadoghq.com/fr/integrations/amazon_cloudhsm
[94]: https://docs.datadoghq.com/fr/integrations/amazon_codedeploy
[95]: https://docs.datadoghq.com/fr/integrations/amazon_documentdb/
[96]: https://github.com/DataDog/datadog-lambda-layer-python
[97]: http://docs.datadoghq.com/integrations/amazon_appstream/
[98]: http://docs.datadoghq.com/integrations/amazon_appsync/
[99]: http://docs.datadoghq.com/integrations/amazon_athena/
[100]: http://docs.datadoghq.com/integrations/amazon_cognito/
[101]: http://docs.datadoghq.com/integrations/amazon_connect/
[102]: http://docs.datadoghq.com/integrations/amazon_dms/
[103]: http://docs.datadoghq.com/integrations/amazon_ec2_spot/
[104]: http://docs.datadoghq.com/integrations/amazon_eks/
[105]: http://docs.datadoghq.com/integrations/amazon_elastic_transcoder/
[106]: http://docs.datadoghq.com/integrations/amazon_gamelift/
[107]: http://docs.datadoghq.com/integrations/amazon_glue/
[108]: http://docs.datadoghq.com/integrations/amazon_guardduty/
[109]: http://docs.datadoghq.com/integrations/amazon_health/
[110]: http://docs.datadoghq.com/integrations/amazon_inspector/
[111]: http://docs.datadoghq.com/integrations/amazon_lex/
[112]: http://docs.datadoghq.com/integrations/amazon_mediaconnect/
[113]: http://docs.datadoghq.com/integrations/amazon_mediaconvert/
[114]: http://docs.datadoghq.com/integrations/amazon_mediapackage/
[115]: http://docs.datadoghq.com/integrations/amazon_mediatailor/
[116]: http://docs.datadoghq.com/integrations/amazon_mq/
[117]: http://docs.datadoghq.com/integrations/amazon_msk/
[118]: http://docs.datadoghq.com/integrations/amazon_nat_gateway/
[119]: http://docs.datadoghq.com/integrations/amazon_neptune/
[120]: http://docs.datadoghq.com/integrations/amazon_rekognition/
[121]: http://docs.datadoghq.com/integrations/amazon_sagemaker/
[122]: http://docs.datadoghq.com/integrations/amazon_vpc/
[123]: https://app.datadoghq.com/account/settings#api


{{< get-dependencies >}}