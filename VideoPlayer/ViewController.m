//
//  ViewController.m
//  VideoPlayer
//
//  Created by Maciej Serwicki on 5/12/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[HTTPService instance] getTutorials:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errMessage) {
        
        if (dataDict) {
            NSLog(@"Dictioanry: %@", dataDict.debugDescription);
        } else if (errMessage) {
            //display error to user;
            NSLog(@"Error: %@", errMessage.debugDescription);
        }
        
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
