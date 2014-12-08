---
layout: post
title: Reverse-engineering a simple Radio Streaming App
---
I'm a huge consumer of the radio station *Radio 24/7*, mainly through their iPhone app. Unfortunately it sometimes acts funny; e.g. if I unplug the headphones from my iPhone usually the app using the audio-output will stop playing -- this is not the case with this app, which sometimes can lead to some interesting situations when the app suddenly starts playing when I least expect it.

Thus I have decided to try to reverse-engineer the app to make it better. This is an unusual path to take, but the app has not been updated in ages, so now I'm just being proactive.

# The process

I imagine there are a few steps to go through before the app is ready for deployment:

1. Investigate the possible end-points to use as streaming-source and program information.
2. Outline a simple layout and decide Swift or Objective-C should be used.
3. Development!

I will create a separate post for each step.