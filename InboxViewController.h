//
//  InboxViewController.h
//  FriendsWithImages
//
//  Created by Cotten Blackwell on 10/3/15.
//  Copyright © 2015 Cotten Blackwell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPlayer.h>

@interface InboxViewController : UITableViewController

@property (strong, nonatomic) NSArray *messages;
@property (strong, nonatomic) PFObject *selectedMessage;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

- (IBAction)logout:(id)sender;

@end
