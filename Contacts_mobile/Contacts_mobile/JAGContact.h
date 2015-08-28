//
//  JAGContact.h
//  Contacts_mobile
//
//  Created by Jesse Gatt on 2014-07-14.
//  Copyright (c) 2014 Jesse Gatt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JAGContact : NSObject

@property (strong, nonatomic) NSString *contact_id;
@property (strong, nonatomic) NSString *user_id;
@property (strong, nonatomic) NSString *firstname;
@property (strong, nonatomic) NSString *lastname;
@property (strong, nonatomic) NSString *phonenumber;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *email;

//function takes in a dictionary and converts it to contac object
- (JAGContact *)initWithDictionary:(NSDictionary *)dict;
//uses the contact object and returns a json representation of it
@property (NS_NONATOMIC_IOSONLY, getter=getJsonObject, readonly, copy) NSData *jsonObject;

@end
