//
//  JAGAPICalls.h
//  Contacts_mobile
//
//  Created by Jesse Gatt on 2014-07-14.
//  Copyright (c) 2014 Jesse Gatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAGContact.h"

@interface JAGAPICalls : NSObject

//get contacts from server based on a user id and returns any error and an array of contact objects
+ (void) getContactsByID:(NSString *)user_id completionHandler:(void (^)(NSMutableArray *contacts, NSError *error))completionHandler;


//post new contact to server based on contact and user_id supplied, returns newly created contact and any error that may have occured
+ (void) postConatct: (JAGContact *) contact fromUserID: (NSString *) user_id completionHandler:(void (^)(JAGContact *contact, NSError *error))completionHandler;

//put edited contact to server based on contact provided, returns the edited contact and any error that may have occured
+ (void) putContact: (JAGContact *) contact completionHandler:(void (^)(JAGContact *contact, NSError *error))completionHandler;

@end
