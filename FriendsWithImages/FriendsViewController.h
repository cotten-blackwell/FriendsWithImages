//
//  FriendsViewController.h
//  FriendsWithImages
//
//  Created by Cotten Blackwell on 10/3/15.
//  Copyright © 2015 Cotten Blackwell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FriendsViewController : UITableViewController

@property (strong, nonatomic) PFRelation *friendsRelation;
@property (strong, nonatomic) NSArray *friends;

@end
