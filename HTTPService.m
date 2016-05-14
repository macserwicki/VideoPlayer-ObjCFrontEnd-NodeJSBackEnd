//
//  HTTPService.m
//  VideoPlayer
//
//  Created by Maciej Serwicki on 5/12/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService

#define URL_BASE "http://localhost:6069"
#define URL_TUTORIALS "/tutorials"

+(id)instance {
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[HTTPService alloc] init];
        }
    }
    
    return sharedInstance;
    
}

-(void)getTutorials: (nullable onComplete)completionHandler {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s",URL_BASE,URL_TUTORIALS]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      
        if (data != nil) {
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if ( err == nil) {

                completionHandler(json, nil);
            
            } else {
                
                completionHandler(nil, @"Error: Data is corrupt. Try again. 'getTutorials'  JSON is nil");
            }

            
        } else {
            NSLog(@"Err: %@", error.debugDescription);
            completionHandler(nil, @"Problem Retreiving Data From Server");
            //Could Print Out Error Codes
        }
        
        
    }] resume];
    
     
    
}



















@end
