//
//  ViewController.m
//  VideoPlayer
//
//  Created by Maciej Serwicki on 5/12/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "ViewController.h"
#import "VideoViewController.h"
#import "HTTPService.h"
#import "VideoCell.h"
#import "VideoData.h"

@interface ViewController ()

//Todo: Could add image caching;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *videoList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.videoList = [[NSArray alloc]init];
    
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        
        if (dataArray) {
            NSLog(@"Dictioanry: %@", dataArray.debugDescription);
            
            NSMutableArray *array = [[NSMutableArray alloc] init];
            
            for (NSDictionary *videoData in dataArray) {
                
                VideoData *video = [[VideoData alloc] init];
                video.videoTitle = videoData[@"title"];
                video.videoIframe = videoData[@"iframe"];
                video.videoDescription = videoData[@"description"];
                video.thumbnailURL = videoData[@"thumbnail"];
                
                [array addObject:video];
                
                
                
                
            }
            
            self.videoList = array;
            [self updateTableViewCells];
            
            
        } else if (errMessage) {
            //display error to user;
            NSLog(@"Error: %@", errMessage.debugDescription);
        }
        
        
    }];
    
    
}

-(void)updateTableViewCells{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoData *video = [self.videoList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"VideoViewController" sender:video];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VideoViewController *viewController = (VideoViewController*)segue.destinationViewController;
    VideoData *videoData = (VideoData*)sender;
    viewController.video = videoData;
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //cell will display
    VideoData *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *videoCell = (VideoCell*)cell;
    [videoCell updateUI: video];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    
    if (!cell) {
        cell = [[VideoCell alloc] init];
    }
    
    
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_videoList count];
}



-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}




@end
