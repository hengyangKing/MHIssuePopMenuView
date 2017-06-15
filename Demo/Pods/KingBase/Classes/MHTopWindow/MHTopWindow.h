//
//  MHTopWindow.h
//  musichome
//
//  Created by J on 2017/6/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHTopWindow : UIWindow

+ (instancetype)sharedTopWindow;

/** 点击状态栏的时候调用 */
@property (nonatomic, copy) void (^clickStatusBarBlock)();

/** 状态栏的显示/隐藏 */
@property (nonatomic, assign, getter=isStatusBarHidden) BOOL statusBarHidden;

/** 状态栏的显示样式 */
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

/** 查找当前View中的ScrollView,让UIScrollView滚动到最前面 */
- (void)searchAllScrollViewsInView:(UIView *)view;
@end
