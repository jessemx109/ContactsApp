
//
//  JAGContact.m
//  Contacts_mobile
//
//  Created by Jesse Gatt on 2014-07-14.
//  Copyright (c) 2014 Jesse Gatt. All rights reserved.
//

#import "JAGContact.h"

@implementation JAGContact


- (JAGContact *)initWithDictionary:(NSDictionary *)dict
{
    _contact_id = dict[@"id"];
    _user_id = dict[@"user_id"];
    _firstname = dict[@"firstname"];
    _lastname = dict[@"lastname"];
    _phonenumber = dict[@"phonenumber"];
    _address = dict[@"address"];
    _email = dict[@"email"];
    
    return self;
}

- (NSData *)getJsonObject
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    dict[@"user_id"] = _user_id;
    dict[@"firstname"] = _firstname;
    dict[@"lastname"] = _lastname;
    dict[@"phonenumber"] = _phonenumber;
    dict[@"address"] = _address;
    dict[@"email"] = _email;
    
    
    return [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    
}


@end
