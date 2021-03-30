# SnapShare
<img src="https://i.imgur.com/2qIlLVe.png" width=750 />

## Demo Video
Click the image below to watch a demo video

[![Demo Video](http://i3.ytimg.com/vi/Zk3euhLTvaQ/hqdefault.jpg)](https://youtu.be/Zk3euhLTvaQ)

## Introduction
SnapShare uses machine learning to make donating your surplus food super easy. There are only 2 steps: Snap and Share. Snap a pic of your surplus food, and the machine learning model will automatically classify it and match a local food bank that needs it. For instance, if you have donuts to donate, the machine learning model will match you with a food bank that needs it the most. Additionally, users can just casually browse a whole list of food banks and be aware of the food desert situation in the local area.

## Inspiration
SnapShare took its inspirations from a popular social media application: SnapChat, which facilitates instant visual communications through photos taken by our smartphones. As an app for social good, SnapShare makes it more convenient for people to donate their food to lower-income people via food banks or shelters. We believe that widening the channel for assisting those who are in need is crucial especially during a pandemic when the unemployment rate soars around the world. We want to offer an integrated system for people to document what they can offer as well as to allocate collective resources to people whose lives might depend on these sustenance in an efficient manner.

<img src="https://i.imgur.com/OL0sAK0.png" width=750 />

## What it does
There are primarily two major interfaces in the app: the snap interface and the share interface. The snap interface allows the users to take photos of their surplus food that subsequently forms a list of supplies that they desire to donate to local charities. The share interface would push recommendations to the users regarding nearby donation locations to facilitate the donation process. In our camera interface,  a CoreML machine learning model by Philip Gaberial is integrated with the user camera. The neural network classifier identifies the object by receiving a buffer image, then outputting the prediction combined with confidence level. Finally, the result is added to your donation list. In the sharing interface, you may choose to donate to the optimized donation location based using Google Search API. 

<img src="https://i.imgur.com/YwicBa2.png" width=750 />

<img src="https://i.imgur.com/e2BjfyX.png" width=750 />

## User Profile
Users could be anyone with spare food and willing to donate it to people who need it. With the app, it becomes much easier for people to know where the locations are for donation and can register the items in a more convenient way. 
Users could also be someone who is willing to donate but not sure how to donate. They could simply use the app to scan and upload, which saves multiple steps that could scare away the potential donors.    

## Challenges we ran into
We were running out of time as we didn’t include another section called the news section in order to educate our users about the world’s increasingly troublesome hunger issue via offering our users the most up to date news about the world’s hunger using Google Search API. We are also hoping to offer the users more options to search as we are planning on including more search parameters within our API in order to produce a more customized query of locations for each user.

## Accomplishments that we're proud of
We successfully integrated a machine learning model into our camera view, allowing the camera to capture the food which the shelters may need and automatically generating a list of supplies. We are also proud of our food banks recommendations with the help of Google Search API that enables the users to select the most convenient locations with the help of search parameters. 

## What we learned
We learnt about integrating our camera interface with the machine learning model and we modified the machine learning model to provide our users with an improved user interface to help them visualize their supply. We also strive to offer the users an accessible way to check out local food banks as well as shelters to guide them through making contributions to charities/welfare programs. 

## What's next for SnapShare
In the future, we plan to bolster our backend of our app by integrating Google Cloud services with Google Search API to include more factors that the user might be interested in knowing more about when donating such as the distance between the users and the donation locations and the most up-to-date information about what they need.

### Acknowledgement
The Stanford Rejects Team would like to thank [kavsoft](https://kavsoft.dev/) for his tutorial on SwiftUI camera view integration. Additionally we would like to thank [ph1ps](https://github.com/ph1ps/Food101-CoreML) for his CoreML Food101 ML Model. Without this model the app won't exist. We are truly standing on the shoulders of giants.
