//
//  JAGModifyContactViewController.h
//  Contacts_mobile
//
//  Created by Jesse Gatt on 2014-07-14.
//  Copyright (c) 2014 Jesse Gatt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JAGContact.h"

@protocol passContact <NSObject>

@optional
-(void) passContact: (JAGContact *) contact;

@end



@interface JAGModifyContactViewController : UIViewController


@property (strong, nonatomic) JAGContact *contact;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;

@property (retain) id <passContact> delegate;


- (IBAction)cancelButton:(id)sender;
- (IBAction)doneButton:(id)sender;

@end
