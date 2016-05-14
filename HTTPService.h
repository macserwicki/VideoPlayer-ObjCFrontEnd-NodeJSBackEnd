//
//  HTTPService.h
//  VideoPlayer
//
//  Created by Maciej Serwicki on 5/12/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^onComplete)(NSArray * _Nullable dataArray, NSString * _Nullable errMessage);

@interface HTTPService : NSObject

//Singleton lives in memory for most of the time. Declared one time. Whole app needs access to it. Static.
//Static declaration of our singleton.

+(id)instance ;

//We're sending back a message saying that parse is completed. Sending dataDict, and err.
-(void)getTutorials: (nullable onComplete)completionHandler;


@end
