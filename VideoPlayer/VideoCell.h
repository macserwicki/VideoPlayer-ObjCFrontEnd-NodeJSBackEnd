//
//  VideoCell.h
//  VideoPlayer
//
//  Created by Maciej Serwicki on 5/13/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoData;

@interface VideoCell : UITableViewCell

-(void)updateUI:(nonnull VideoData*)video;

@end
