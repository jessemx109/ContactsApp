//
//  JAGContactDetailViewController.h
//  Contacts_mobile
//
//  Created by Jesse Gatt on 2014-07-14.
//  Copyright (c) 2014 Jesse Gatt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JAGContact.h"
#import "JAGModifyContactViewController.h"

@interface JAGContactDetailViewController : UIViewController <passContact>


@property (strong, nonatomic) JAGContact *contact;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *email;

@end
