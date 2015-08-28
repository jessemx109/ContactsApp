//
//  JAGContactDetailViewController.m
//  Contacts_mobile
//
//  Created by Jesse Gatt on 2014-07-14.
//  Copyright (c) 2014 Jesse Gatt. All rights reserved.
//

#import "JAGContactDetailViewController.h"

@interface JAGContactDetailViewController ()

@end

@implementation JAGContactDetailViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _name.text = [NSString stringWithFormat:@"%@ %@", _contact.firstname, _contact.lastname];
    _phoneNumber.text = _contact.phonenumber;
    _address.text = _contact.address;
    _email.text = _contact.email;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 
 
 
 
 if ([segue.identifier isEqual:@"EditContact"]) {
 
     
     SEL selector = NSSelectorFromString(@"setContact:");
     
     
     UINavigationController *navController = segue.destinationViewController;
     JAGModifyContactViewController *modifyViewController = (JAGModifyContactViewController *)navController.topViewController;
     
     [modifyViewController setDelegate:self];
     
     
     if ([modifyViewController respondsToSelector:selector]) {
         [modifyViewController setValue:_contact forKey:@"contact"];
     }
 
 
 }
 
 
 
 }


- (void)passContact:(JAGContact *)contact
{
    _contact = contact;
    
    _name.text = [NSString stringWithFormat:@"%@ %@", _contact.firstname, _contact.lastname];
    _phoneNumber.text = _contact.phonenumber;
    _address.text = _contact.address;
    _email.text = _contact.email;
    
}

@end
