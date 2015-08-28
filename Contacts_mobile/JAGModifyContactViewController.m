//
//  JAGModifyContactViewController.m
//  Contacts_mobile
//
//  Created by Jesse Gatt on 2014-07-14.
//  Copyright (c) 2014 Jesse Gatt. All rights reserved.
//

#import "JAGModifyContactViewController.h"
#import "JAGAPICalls.h"

@interface JAGModifyContactViewController ()

@end

@implementation JAGModifyContactViewController{
    NSString *httpType;
}

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
    if (_contact == nil) {
        _contact = [[JAGContact alloc] init];
        httpType = @"POST";
    }else{
        _firstName.text = _contact.firstname;
        _lastName.text = _contact.lastname;
        _phoneNumber.text = _contact.phonenumber;
        _address.text = _contact.address;
        _email.text = _contact.email;
        httpType = @"PUT";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButton:(id)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButton:(id)sender {
    
    _contact.firstname = _firstName.text;
    _contact.lastname = _lastName.text;
    _contact.phonenumber = _phoneNumber.text;
    _contact.address = _address.text;
    _contact.email = _email.text;
    
    if ([httpType isEqualToString:@"POST"]) {
        [JAGAPICalls postConatct:_contact fromUserID:@"1" completionHandler:^(JAGContact *contact, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self delegate] passContact:contact];
            });
            
            
        }];
    }
    
    if([httpType isEqualToString:@"PUT"]){
        [JAGAPICalls putContact:_contact completionHandler:^(JAGContact *contact, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self delegate] passContact:contact];
            });
        }];
    }
    
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
