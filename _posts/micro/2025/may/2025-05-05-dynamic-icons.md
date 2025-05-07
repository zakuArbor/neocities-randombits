---
layout: micro
title:  "DuoLingo Dynamic Icons on Android"
date: 2025-05-06
categories: [micro, android] 
published: true
permalink: micro/2025/05/:title
---

Recently, I have been noticing that the icons for Duolingo changes throughout the day depending whether if I have done my daily exercise:

![Duolingo icon changes throughout the day if an exercise has not been done]({{site.baseurl}}/assets/micro/misc/duolingo.png)

Originally I thought this feature is called [adaptive icons](https://developer.android.com/codelabs/basic-android-kotlin-compose-training-change-app-icon#2) due to its name but it is not.
In Android Development, there is a file that contains information about your app such as the permissions, minimum device versions, name of the app and etc in the `AndroidManifest.xml`. 
This file also includes the icon to use for the app if provided. Apparently there is something called [`activity-alias`](https://developer.android.com/guide/topics/manifest/activity-alias-element) 
provides more flexibility and allows you to enter the same activity (i.e. think of it as a page or a view in the app). Essentially you can enable or disable different aliases to swap the icons via `PackageManager.ComponentEnabledSetting` and this is likely the approach that Duolingo 
uses. They probably run some background process that is hopefully scheduled at certain periods of time such as [`WorkerManager`](https://developer.android.com/develop/background-work/background-tasks#background-work). 
I am not too familiar with Android development so most of this is just speculation. It's been many years since I last wrote an Android Application and it was quite primitive ... I hated Android Studio ... it killed my poor underperforming laptop

