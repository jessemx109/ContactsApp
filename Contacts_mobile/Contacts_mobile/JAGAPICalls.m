//
//  JAGAPICalls.m
//  Contacts_mobile
//
//  Created by Jesse Gatt on 2014-07-14.
//  Copyright (c) 2014 Jesse Gatt. All rights reserved.
//

#import "JAGAPICalls.h"


const NSString *serverURL = @"http://homestead.app:8000";


@implementation JAGAPICalls



+ (void) getContactsByID:(NSString *)user_id completionHandler:(void (^)(NSMutableArray *contacts, NSError *error))completionHandler
{
    //generate url with server ip, endpoint name, and user_id provided
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/contacts/%@", serverURL, user_id]];
    
    //create and configure nsurlsession
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    
    //turn on network activity
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    //nsurlsession that makes call to server and returns json then converts it to an array of Contact objects
    [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        //turns off network status
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
        
        
        NSError *jsonError;
        
        NSDictionary *serverResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        
        NSMutableArray *contactstemp = serverResponse[@"contacts"];
        
        NSMutableArray *contacts = [[NSMutableArray alloc] init];
        
        if (!jsonError) {
            for (NSDictionary *contact in contactstemp) {
                [contacts addObject:[[JAGContact alloc] initWithDictionary:contact]];
            }
        }

        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(contacts,error);
        });
        
    }] resume];
}


+ (void) postConatct: (JAGContact *) contact fromUserID: (NSString *) user_id completionHandler:(void (^)(JAGContact *contact, NSError *error))completionHandler
{
    //generate url with server ip, endpoint name, and user_id provided
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/contacts/%@", serverURL, user_id]];
    
    
    
    contact.user_id = user_id;
    NSData *jsonData = [contact getJsonObject];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = jsonData;
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    
    //create and configure nsurlsession
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    //turns on network activity indicator
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        
        //sets network status to off
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
        });
        
        NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
        
        
        if (!error && httpResp.statusCode == 200) {
            NSError *jsonError;
            NSDictionary *contactJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            
            JAGContact *newContact;
            if (!jsonError) {
                
                newContact = [[JAGContact alloc] initWithDictionary:contactJSON[@"contact"] ];
                
            }else{
                newContact = [[JAGContact alloc] init];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(newContact, error);
            });
            
            
        } else {
            // alert for error saving / updating note
        }
    }] resume];
    
    
    
    
}


+ (void) putContact: (JAGContact *) contact completionHandler:(void (^)(JAGContact *contact, NSError *error))completionHandler
{
    
    
    //generate url with server ip, endpoint name, and user_id provided
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/contacts/%@", serverURL, contact.contact_id]];
    
    
    
    NSData *jsonData = [contact getJsonObject];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"PUT";
    request.HTTPBody = jsonData;
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    
    //create and configure nsurlsession
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    //turns on network activity indicator
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        
        //sets network status to off
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
        });
        
        NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
        
        
        if (!error && httpResp.statusCode == 200) {
            NSError *jsonError;
            NSDictionary *contactJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            
            JAGContact *newContact;
            if (!jsonError) {
                
                newContact = [[JAGContact alloc] initWithDictionary:contactJSON[@"contact"] ];
                
            }else{
                newContact = [[JAGContact alloc] init];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(newContact, error);
            });
            
            
        } else {
            // alert for error saving / updating note
        }
    }] resume];
    
    
    
    
    
    
}

@end
