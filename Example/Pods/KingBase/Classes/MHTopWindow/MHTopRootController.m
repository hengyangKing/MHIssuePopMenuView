//
//  MHTopRootController.m
//  musichome
//
//  Created by J on 2017/6/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHTopRootController.h"
#import "MHTopWindow.h"

@class MHTopWindow;
@interface MHTopRootController ()

@end

@implementation MHTopRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ![MHTopWindow sharedTopWindow].clickStatusBarBlock ?  : [MHTopWindow sharedTopWindow].clickStatusBarBlock();
}

#pragma mark - 状态栏
- (BOOL)prefersStatusBarHidden {
    return [MHTopWindow sharedTopWindow].statusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [MHTopWindow sharedTopWindow].statusBarStyle;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    
    return UIStatusBarAnimationSlide;
}



@end
