//
//  ImageViewController.h
//  FriendsWithImages
//
//  Created by Cotten Blackwell on 10/4/15.
//  Copyright © 2015 Cotten Blackwell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ImageViewController : UIViewController

@property (strong, nonatomic) PFObject *message;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
