# Better Ride

TransitApp, otherwise known by the new name of BetterRide, is an app designed for public transportation users in the Detroit area to help provide feedback about their ride in a more effective way.


## Background

The city of Detroit has a large problem with transportation. Unreliable bus rides, unsafe stops, late arrivals, or long delays even if they manage to show up at all. Being in the Motor City. 1/3 of Detroiter's do not have access to a car, so they must rely on a public transportation system that is wholly unreliable. BetterRide is meant to provide the riders a way to feel that their feedback is effective and might actually been seen to improve the ride.
Main Function

The main function of BetterRide is to provde a feedback form for transit riders to use. With a seamless flow between pages, the app provides a smooth, simple and accessible way to provide feedback. By choosing the category of complaint, the date of the event, and providing images in your report will help to give the necessary information to the Department of Transportation and other offices related to the rider experience. Our goal is to help the city of Detroit improve public transportation.





## Color Reference
The color scheme used for the BetterRide App

| Color             | Hex                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Example Color | ![#FFFFFF](https://via.placeholder.com/10/FFFFFF?text=+) #FFFFFF|
| Example Color | ![#f8f8f8](https://via.placeholder.com/10/9DD3B3?text=+) #9DD3B3|
| Example Color | ![#00b48a](https://via.placeholder.com/10/17A494?text=+) #17A494|
| Example Color | ![#00d1a0](https://via.placeholder.com/10/004447?text=+) #004447|


## API Reference

#### Utilizing the Twilio Email API, SendGrid, we were able to ensure our feedback was able to be sent to various departments and officials within the Detroit city government.

```http
   "https://api.sendgrid.com/v3/mail/send"
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `apiKey`      | `string` | **Required**. generated code necessary for the API to function properly|
| `to`      | `[string]` | **Required**. Destination email where the information will be sent|
| `from`      | `string` | **Required**. App email that is linked to SendGrid account |
| `subject`      | `string` | Subject of the email being sent |
| `content`      | `string` | **Required**. Body of the email being sent. Can be filled with text and attachements can be added, such as images |





## Deployment
You must install Lottie into XCode in order to run the project: The Documentation can be found here:
https://github.com/airbnb/lottie-ios 

To deploy this project run

```CocoaPods
Add the pod to your Podfile:
  pod 'lottie-ios'
And then run:
  pod install

After installing the cocapod into your project, import Lottie with:
  import Lottie
```


## Acknowledgements
I would like to thank my team (names below) for all of the hard work everyone provided. It was a collaborative effort for this challenge to be completed, and the ideas were not mine alone. 


## Authors

- Nick Melekian - Developer
- Shannon Lane - Designer
- Mallery Heise - Designer
- Anahita Zahertar - Developer
- Andre Brooks - Project Manager


## Swift Documentation

[Documentation](https://developer.apple.com/documentation/swift)