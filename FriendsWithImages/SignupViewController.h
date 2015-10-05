//
//  SignupViewController.h
//  FriendsWithImages
//
//  Created by Cotten Blackwell on 10/3/15.
//  Copyright © 2015 Cotten Blackwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

- (IBAction)signup:(id)sender;
- (IBAction)dismiss:(id)sender;

@end
