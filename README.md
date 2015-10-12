# FriendsWithImages
iPhone app for sending your friends photos or videos that "self-destruct* after 10 seconds...

This app will allow users to send photo or video messages to other users that will be deleted once viewed. 

The app is tab-based and demonstrates my current understanding of UITabBarController, as well as Storyboards, segues, table views, and the View Controller lifecycle. I have used the standard UIImagePickerController to capture photos or videos. Photos are compressed and displayed in UIImage views, and videos are limited to 10 seconds and viewed using the MPMoviePlayerController from the MediaPlayer framework. The back-end of the app is built on Parse.com’s popular cloud storage services, which handles user accounts and file and message storage.

I also refactored this app to implement a more engaging flat design with custom login and sign up screens -- which make use of 3rd-party GitHub improvements for displaying the soft keyboard with better UX. The app has highly customized table view controllers that make up most of the app, including using custom cell layouts. Finally, this app also showcases a few "nice-to-have" features like pull-to-refresh for the Inbox tab, and getting Gravatar images for users.
