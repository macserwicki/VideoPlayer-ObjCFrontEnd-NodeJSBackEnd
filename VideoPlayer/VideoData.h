//
//  videoData.h
//  VideoPlayer
//
//  Created by Maciej Serwicki on 5/13/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoData : NSObject

@property(nonatomic,strong) NSString *videoTitle;
@property(nonatomic,strong) NSString *videoDescription;
@property(nonatomic,strong) NSString *thumbnailURL;
@property(nonatomic,strong) NSString *videoIframe;



@end
