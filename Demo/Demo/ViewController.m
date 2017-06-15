//
//  ViewController.m
//  Demo
//
//  Created by J on 2017/6/15.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"
#import "MHTopWindow.h"
#import "MHIssuePopMenuView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)show:(UIButton *)sender {
        
    
     NSArray *buttonArray=@[[MHPopMenuData CreateLabelIconName:@"issue_record_n" andTitle:@"录音"],[MHPopMenuData CreateLabelIconName:@"take_video_n" andTitle:@"录视频"],[MHPopMenuData CreateLabelIconName:@"issue_text_n" andTitle:@"发图文"],[MHPopMenuData CreateLabelIconName:@"userOwn_video_n" andTitle:@"发本地视频"]];
    
    MHIssuePopMenuViewConfig *config = [MHIssuePopMenuViewConfig defaultConfig].CancelButtonImage([UIImage imageNamed:@"issue_toolbar_close"]).Items(buttonArray);

    [MHIssuePopMenuView CreatePopMeunWithConfig:config andWillShowBlock:^{
        [[MHTopWindow sharedTopWindow]setStatusBarHidden:YES] ;

    } andSelectdCompletionBlock:^(MHPopMenuData *menuData, NSInteger index) {
        
    } andDisMissBlock:^(BOOL disMiss) {
        [[MHTopWindow sharedTopWindow]setStatusBarHidden:NO] ;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
