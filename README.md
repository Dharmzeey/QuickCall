# quickcall

## Flutter Project

+ User Location needs to be enabled for optimal functionality

## third party package used
+ getx for state management
+ geolocator to access user location (longitude and latitude)
+ geocoding to access location details from the geolocator response
+ shared_preferences to store and retrieve information on user device
+ url_launcher to launch URL like maps
+ font_awesome_flutter for icons not on flutter (whatsapp) {There is a mix in the use of flutter IconData and FaIcon}
+ app_settings to open the app to enable location

 The backend written in node is here [Here](https://github.com/Alausa2001/QuickCall/)

 The homepage
 

![homepage2](https://github.com/Dharmzeey/QuickCall/assets/68395177/e9280d76-ff61-43cc-9da0-90a7aa756992)
![homepage1](https://github.com/Dharmzeey/QuickCall/assets/68395177/14b54158-65be-4e06-9bce-64016a6d8503)

## Getting Started

The project's lib folder is divided into different sub-folders
+ API (which is where files that make network request or network logic resides)
+ controller (files that are used to manage state)
+ dummy_data (hard-coded general emergency tips)
+ helper (contains the dependencies.dart which loads before the app fully starts)
+ models (files that handle responses from network request and parses them into easy, usable and flutter standard data)
+ routes (file that contains all the internal routing {uses Getx routing})
+ screens (folders that contain files which are rendered for the user's viewing)
+ + emergency (contains screens that deal with emergency)
  + feedback (contains screen files that handle user feedback)
  + onboarding (contains screen files that deal with signing, signup etc)
+ utils (contains utility files that are used all through the app)
+ widgets (files of reusable dart classes for the DRY implementation)
