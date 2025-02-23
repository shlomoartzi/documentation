---
title: NxLog
name: nxlog
kind: integration
description: 'Configurez NxLog pour rassembler les logs de votre host, de vos conteneurs et de vos services.'
short_description: 'Configurez NxLog pour rassembler les logs de votre host, de vos conteneurs et de vos services.'
categories:
  - Collecte de logs
doc_link: /integrations/nxlog/
aliases:
  - /fr/logs/log_collection/nxlog
has_logo: true
integration_title: nxlog
is_public: true
public_title: Intégration Datadog/NxLog
supported_os:
  - windows
---
## Présentation

Configurez NxLog pour rassembler les logs de votre host, de vos conteneurs et de vos services.

## Implémentation
### Collecte de logs

{{< tabs >}}
{{% tab "Site américain de Datadog" %}}

1. Configurez NXLog afin d'envoyer vos logs à votre plateforme Datadog.
    Remplacez l'ensemble du contenu fichier dans `C:\Program Files\nxlog\conf` par ce qui suit :

    ```
    ## Set the ROOT to the folder your nxlog was installed into,
    ## otherwise it won't start.
    #To change for your own system if necessary
    define ROOT C:\Program Files\nxlog
    #define ROOT_STRING C:\Program Files\nxlog
    #define ROOT C:\Program Files (x86)\nxlog
    Moduledir %ROOT%\modules
    CacheDir %ROOT%\data
    Pidfile %ROOT%\data\nxlog.pid
    SpoolDir %ROOT%\data
    LogFile %ROOT%\data\nxlog.log
    ##Extension to format the message in JSON format
    <Extension json>
        Module xm_json
    </Extension>
    ##Extension to format the message in syslog format
    <Extension syslog>
    Module xm_syslog
    </Extension>
    ########## INPUTS ###########
    ##Input for windows event logs
    <Input syslogs>
        Module      im_msvistalog
    ##For windows 2003 and earlier use the following:
    #    Module      im_mseventlog
    </Input>
    ############ OUTPUTS ##############
    ##TCP output module
    <Output out>
        Module      om_tcp
        Host        intake.logs.datadoghq.com
        Port        10514
        Exec        to_syslog_ietf();
        Exec        $raw_event="<DATADOG_API_KEY> "+$raw_event;
    </Output>
    ############ ROUTES TO CHOOSE #####
    <Route 1>
        Path        syslogs => out
    </Route>
    ```
    N'oubliez pas de remplacer `<DATADOG_API_KEY>` dans le format.

2. Activez le module watchFile de NxLog.
    Pour chaque fichier à surveiller, ajoutez ce qui suit avant la section de sortie :
    ```
    ##Module to watch a file
    <Input FILE_WATCH_1>
      Module im_file
      File "PATH\\TO\\YOUR\\FILE1"
      Exec   $SourceName = '<MY_APPLICATION_NAME>';
      SavePos TRUE

      ##include the message and add meta data
      Exec $Message = $raw_event;
    </Input>
    ```

3. Vérifiez que ces fichiers sont connectés à la section de sortie.
    ```
    <Route file1>
        Path    FILE_WATCH_1,FILE_WATCH_2,... => out
    </Route>
    ```

4. Redémarrez NxLog.
    Ouvrez l'outil d'administration du service :
    `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Services.lnk`.

5. Définissez des tags ou paramètres supplémentaires (facultatif).
    Ajoutez n'importe quel attribut spécifique à vos logs dans chaque section d'entrée de votre fichier de configuration NxLog. Par exemple, pour indiquer la source utilisée dans Datadog afin d'identifier de quelle intégration les logs proviennent, utilisez ce qui suit :

    ```
    Exec        $ddsource = 'mysourcevalue';
    Exec        $ddtags = 'env:test,<KEY>:<VALUE>';
    ```

### Chiffrement TLS avec NxLog

1. Téléchargez la [clé publique pour le chiffrement TLS][1] des logs.

2. Téléchargez le [certificat d'autorité de certification][2].

3. Ajoutez le module `om_ssl` dans votre configuration NxLog pour activer le transfert sécurisé via le port 10516 :

    ```
    <Output out>
      Module  om_ssl
      Host    intake.logs.datadoghq.com
      Port    10516
      Exec    $raw_event="<YOUR_API_KEY> " + $raw_event;
      CertFile <CERT_DIR>/intake.logs.datadoghq.com.crt
      CAFile   <CERT_DIR>/SFSRootCAG2.pem
      AllowUntrusted FALSE
    </Output>
    ```


[1]: /resources/crt/FULL_intake.logs.datadoghq.com.crt
[2]: https://www.amazontrust.com/repository/SFSRootCAG2.pem
{{% /tab %}}
{{% tab "Site européen de Datadog" %}}

1. Configurez NXLog afin d'envoyer vos logs à votre plateforme Datadog.
    Remplacez l'ensemble du contenu fichier dans `C:\Program Files\nxlog\conf` par ce qui suit :

    ```
    ## Set the ROOT to the folder your nxlog was installed into,
    ## otherwise it won't start.
    #To change for your own system if necessary
    define ROOT C:\Program Files\nxlog
    #define ROOT_STRING C:\Program Files\nxlog
    #define ROOT C:\Program Files (x86)\nxlog
    Moduledir %ROOT%\modules
    CacheDir %ROOT%\data
    Pidfile %ROOT%\data\nxlog.pid
    SpoolDir %ROOT%\data
    LogFile %ROOT%\data\nxlog.log
    ##Extension to format the message in JSON format
    <Extension json>
        Module xm_json
    </Extension>
    ##Extension to format the message in syslog format
    <Extension syslog>
    Module xm_syslog
    </Extension>
    ########## INPUTS ###########
    ##Input for windows event logs
    <Input syslogs>
        Module      im_msvistalog
    ##For windows 2003 and earlier use the following:
    #    Module      im_mseventlog
    </Input>
    ############ OUTPUTS ##############
    ##TCP output module
    <Output out>
        Module      om_tcp
        Host        tcp-intake.logs.datadoghq.eu
        Port        1883
        Exec        to_syslog_ietf();
        Exec        $raw_event="<DATADOG_API_KEY> "+$raw_event;
    </Output>
    ############ ROUTES TO CHOOSE #####
    <Route 1>
        Path        syslogs => out
    </Route>
    ```
    N'oubliez pas de remplacer `<DATADOG_API_KEY>` dans le format.

2. Activez le module watchFile de NxLog.
    Pour chaque fichier à surveiller, ajoutez ce qui suit avant la section de sortie :
    ```
    ##Module to watch a file
    <Input FILE_WATCH_1>
      Module im_file
      File "PATH\\TO\\YOUR\\FILE1"
      Exec   $SourceName = '<MY_APPLICATION_NAME>';
      SavePos TRUE

      ##include the message and add meta data
      Exec $Message = $raw_event;
    </Input>
    ```

3. Vérifiez que ces fichiers sont ajoutés dans la section de sortie :
    ```
    <Route file1>
        Path    FILE_WATCH_1,FILE_WATCH_2,... => out
    </Route>
    ```

4. Redémarrez NxLog.
    Ouvrez l'outil d'administration du service :
    `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Services.lnk`.

5. Définissez des tags ou paramètres supplémentaires (facultatif).
    Ajoutez n'importe quel attribut spécifique à vos logs dans chaque section d'entrée de votre fichier de configuration NxLog. Par exemple, pour indiquer la source utilisée dans Datadog afin d'identifier de quelle intégration les logs proviennent, utilisez ce qui suit :

    ```
    Exec        $ddsource = 'mysourcevalue';
    Exec        $ddtags = 'env:test,<KEY>:<VALUE>';
    ```

### Chiffrement TLS avec NxLog

1. Téléchargez la [clé publique pour le chiffrement TLS][1] des logs.

2. Téléchargez le [certificat d'autorité de certification][2].

3. Ajoutez le module `om_ssl` dans votre configuration NxLog pour activer le transfert sécurisé via le port 443 :

    ```
    <Output out>
      Module  om_ssl
      Host    tcp-intake.logs.datadoghq.eu
      Port    443
      Exec    $raw_event="<DATADOG_API_KEY> " + $raw_event;
      CertFile <CERT_DIR>/intake.logs.datadoghq.eu.crt
      CAFile   <CERT_DIR>/datadog.ca.eu.pem
      AllowUntrusted FALSE
    </Output>
    ```


[1]: /resources/crt/FULL_intake.logs.datadoghq.eu.crt
[2]: /resources/crt/datadog.ca.eu.pem
{{% /tab %}}
{{< /tabs >}}

## Dépannage

Besoin d'aide ? Contactez [l'assistance Datadog][1].

[1]: /fr/help