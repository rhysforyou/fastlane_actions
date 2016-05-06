# Custom Fastlane Actions

This repo house a few custom actions for [fastlane](http://fastlane.tools) that
I've found helpful in developing iOS apps.

# Actions

## `check_files_identical`

Determine if files are identical

| Key   | Description      | Env Var | Default |
|-------|------------------|---------|---------|
| files | Files to compare |         |         |

## `download_intercom_framework`

Downloads Intercom. This is mainly intended as a workaround for Intercom's lack
of Carthage support.


| Key     | Description                                     | Env Var                | Default      |
|---------|-------------------------------------------------|------------------------|--------------|
| path    | The directory where Intercom will be downloaded | DOWNLOAD_INTERCOM_PATH | ./Frameworks |

## `download_fabric_frameworks`

Downloads Fabric frameworks. Intended as a workaround for their lack of Carthage
support.

| Key           | Description                                       | Env Var                               | Default      |
|---------------|---------------------------------------------------|---------------------------------------|--------------|
| path          | The directory where frameworks will be downloaded | DOWNLOAD_FABRIC_PATH                  | ./Frameworks |
| fabric        | Use Fabric with the spcified version              | DOWNLOAD_FABRIC_FABRIC_VERSION        |              |
| aws_cognito   | Use AWS Cognito with the spcified version         | DOWNLOAD_FABRIC_AWS COGNITO_VERSION   |              |
| answers       | Use Answers with the spcified version             | DOWNLOAD_FABRIC_ANSWERS_VERSION       |              |
| appsee        | Use Appsee with the spcified version              | DOWNLOAD_FABRIC_APPSEE_VERSION        |              |
| crashlytics   | Use Crashlytics with the spcified version         | DOWNLOAD_FABRIC_CRASHLYTICS_VERSION   |              |
| digits_kit    | Use Digits Kit with the spcified version          | DOWNLOAD_FABRIC_DIGITS KIT_VERSION    |              |
| gameanalytics | Use GameAnalytics with the spcified version       | DOWNLOAD_FABRIC_GAMEANALYTICS_VERSION |              |
| mapbox        | Use Mapbox with the spcified version              | DOWNLOAD_FABRIC_MAPBOX_VERSION        |              |
| mopub         | Use MoPub with the spcified version               | DOWNLOAD_FABRIC_MOPUB_VERSION         |              |
| nuance        | Use Nuance with the spcified version              | DOWNLOAD_FABRIC_NUANCE_VERSION        |              |
| optimizely    | Use Optimizely with the spcified version          | DOWNLOAD_FABRIC_OPTIMIZELY_VERSION    |              |
| pubnub        | Use PubNub with the spcified version              | DOWNLOAD_FABRIC_PUBNUB_VERSION        |              |
| stripe        | Use Stripe with the spcified version              | DOWNLOAD_FABRIC_STRIPE_VERSION        |              |
| twitter       | Use Twitter with the spcified version             | DOWNLOAD_FABRIC_TWITTER_VERSION       |              |
