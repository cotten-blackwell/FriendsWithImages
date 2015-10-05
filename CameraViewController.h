//
//  CameraViewController.h
//  FriendsWithImages
//
//  Created by Cotten Blackwell on 10/3/15.
//  Copyright © 2015 Cotten Blackwell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CameraViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *videoFilePath;
@property (strong, nonatomic) NSArray *friends;
@property (strong, nonatomic) PFRelation *friendsRelation;
@property (strong, nonatomic) NSMutableArray *recipients;

- (IBAction)cancel:(id)sender;
- (IBAction)send:(id)sender;

-(void)uploadMessage;
-(UIImage *)resizeImage:(UIImage *)image toWidth:(float)width andHeight:(float)height;

@end
