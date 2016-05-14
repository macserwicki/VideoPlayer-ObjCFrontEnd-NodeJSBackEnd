//
//  VideoViewController.m
//  VideoPlayer
//
//  Created by Maciej Serwicki on 5/14/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoData.h"

@interface VideoViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation VideoViewController
- (IBAction)doneButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView.delegate = self;
    self.titleLabel.text = self.video.videoTitle;
    self.descriptionLabel.text = self.video.videoDescription;
    [self.webView loadHTMLString:self.video.videoIframe baseURL:nil];
    
    
}

//http://stackoverflow.com/questions/6903292/uiwebview-css-injection-using-javascript
-(void)webViewDidFinishLoad:(UIWebView*)webView{
    NSString *css = @".container {position: relative;width: 100%;height: 0;padding-bottom: 56.25%;}.video {position: absolute;top: 0;left: 0;width: 100%;height: 100%;}";
    NSString *js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
