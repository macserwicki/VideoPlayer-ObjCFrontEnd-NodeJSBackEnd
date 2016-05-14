//
//  VideoCell.m
//  VideoPlayer
//
//  Created by Maciej Serwicki on 5/13/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "VideoCell.h"



@interface VideoCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;


@end

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.cornerRadius = 2.5;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(1.0, 2.0);
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOpacity = 0.5;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
