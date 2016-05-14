//
//  MaterialDesignView.m
//  VideoPlayer
//
//  Created by Maciej Serwicki on 5/13/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "MaterialDesignView.h"

@implementation MaterialDesignView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.cornerRadius = 0;
    self.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(1.0, 2.0);
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOpacity = 0.5;
    
    
}

@end
