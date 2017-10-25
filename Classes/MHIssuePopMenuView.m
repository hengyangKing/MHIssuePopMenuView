//
//  MHIssuePopMenuView.m
//  Demo
//
//  Created by J on 2017/6/15.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHIssuePopMenuView.h"
#import "UIColor+ImageColor.h"
#import "MHPopMenuCustomButton.h"
#import "MHIssueCancelView.h"
#import "MHIssuePopMenuView+Animation.h"
#import "NSObject+PlaySound.h"

#define Duration 0.2
#define kTitleRatio 0.4
#define kW [UIScreen mainScreen].bounds.size.width
#define kH [UIScreen mainScreen].bounds.size.height
#define HowMucHline 2
#define ButtonWidth kW/HowMucHline
#define ButtonHigh ButtonWidth
#define ButtonTag 200
@interface MHIssuePopMenuView()
{
    UIWindow *_window;
}
@property (nonatomic,copy) DisMissBlock disBlock;
@property (nonatomic,copy) SelectdCompletionBlock selectdBlock;
@property (nonatomic,strong)MHIssuePopMenuViewConfig *config;
@property (nonatomic,weak) UIView *topView;
@property (nonatomic,strong) UIView *blurView;
@property (nonatomic,strong) UIView *containerView;

@end
@implementation MHIssuePopMenuView

+(void)CreatePopMeunWithConfig:(MHIssuePopMenuViewConfig *)config andWillShowBlock:(willShowBlock)willShowBlock andSelectdCompletionBlock:(SelectdCompletionBlock)block andDisMissBlock:(DisMissBlock)disBlock
{
    MHIssuePopMenuView *popView=[[MHIssuePopMenuView alloc]initWithConfig:config];
    popView.selectdBlock=block;
    popView.disBlock=disBlock;
    if (willShowBlock) {
        willShowBlock();
    }
    [popView show];
}
-(instancetype)initWithConfig:(MHIssuePopMenuViewConfig *)config
{
    self=[super initWithFrame:CGRectMake(0, 0, kW, kH)];
    if(self){
        self.config=config;
        if (self.config.topView) {
            [self setTopView:self.config.topView];
        }
        [self initUI];
    }
    return self;
}
-(UIView *)blurView
{
    if (!_blurView) {
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
        ((UIVisualEffectView *)_blurView).frame = self.bounds;
        
        _blurView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin;
    }
    return _blurView;
}
-(UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc]initWithFrame:self.bounds];
        _containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin;
        _containerView.backgroundColor=[UIColor clearColor];
    }
    return _containerView;
}
-(void)initUI
{
    [self addSubview:self.blurView];
    [self addSubview:self.containerView];
    
    UIView *bottomView = [[UIView alloc] init];
    CGFloat DownY = kH - 49;
    [bottomView setTag:10];
    [bottomView setFrame:(CGRect){{0,DownY},{kW,49}}];
    [bottomView setBackgroundColor:self.config.cancelBGViewColor];
    
    CGFloat CANCELw = 28;
    
    MHIssueCancelView *CancelButton = [[MHIssueCancelView alloc] initWithFrame:CGRectMake(CGRectGetWidth(bottomView.bounds)/2 - CANCELw/2, CGRectGetHeight(bottomView.bounds)/2 - CANCELw/2, CANCELw, CANCELw)];
    
//    UIImage *image = [UIImage imageNamed:@"issue_toolbar_close"];
    [CancelButton setImage:self.config.cancelImage];
    [CancelButton setTag:11];
    [bottomView addSubview:CancelButton];
    [self.containerView addSubview:bottomView];
    [self CirculatingItmes];
    NSLog(@"foo");
}
-(void)CirculatingItmes
{
    MHIssueCancelView *CancelButton = (MHIssueCancelView *)[self viewWithTag:11];
    UIView *downView = [CancelButton superview];
    
    typeof(self) weak = self;
    [UIView animateWithDuration:Duration animations:^{
        [weak setAlpha:1];
        CancelButton.transform=CGAffineTransformMakeRotation((M_PI/2)/2);
    }];
    NSInteger index = 0;
    for (MHPopMenuData *Obj in self.config.items) {
        CGFloat buttonX,buttonY;
        buttonX = (index % HowMucHline) * ButtonWidth;
        buttonY = ((index / HowMucHline) * (ButtonHigh +10)) + (kH/8);
        CGRect fromValue = CGRectMake(buttonX, CGRectGetMinY(downView.frame), ButtonWidth, ButtonHigh);
        CGRect toValue = CGRectMake(buttonX, buttonY, ButtonWidth, ButtonHigh);
        if (index == 0) {
            self.config.MaxTopViewY(CGRectGetMinY(toValue));
//            self.config.maxTopViewY = CGRectGetMinY(toValue);
        }
        MHPopMenuCustomButton *button = [self AllockButtonIndex:index];
        button.MenuData = Obj;
        [button setFrame:fromValue];
        double delayInSeconds = index * (0.195 / self.config.items.count);
        CFTimeInterval delay = delayInSeconds + CACurrentMediaTime();
        
        [self StartTheAnimationFromValue:fromValue ToValue:toValue Delay:delay Object:button CompletionBlock:^(BOOL CompletionBlock) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
            [self.containerView addGestureRecognizer:tap];
        } HideDisplay:false];
        index ++;
    }
}

-(MHPopMenuCustomButton *)AllockButtonIndex:(NSInteger)index
{
    MHPopMenuCustomButton *button = [[MHPopMenuCustomButton alloc] init];
    [button setTag:(index + 1) + ButtonTag];
    [button setAlpha:0.0f];
    [button setTitleColor:[UIColor colorWithWhite:0.38 alpha:1] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectd:) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:button];
    
    return button;
}


-(void)DismissCompletionBlock:(void(^) (BOOL CompletionBlock)) completionBlock{
    
    //清除值
//    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:kUserJoinTopicKeyword];
    
    
    NSInteger index = 0;
    MHIssueCancelView *CancelButton = (MHIssueCancelView *)[self viewWithTag:11];
    UIView *downView = CancelButton.superview;
    
    for (MHPopMenuData *label in self.config.items) {
        MHPopMenuCustomButton *button = (MHPopMenuCustomButton *)[self viewWithTag:(index + 1) + ButtonTag];
        button.MenuData = label;
        CGFloat buttonX,buttonY;
        buttonX = (index % HowMucHline) * ButtonWidth;
        buttonY = ((index / HowMucHline) * (ButtonHigh +10)) + (kH/8);
        
        CGRect toValue = CGRectMake(buttonX, kH, ButtonWidth, ButtonHigh);
        CGRect fromValue = CGRectMake(buttonX, buttonY, ButtonWidth, ButtonHigh);
        double delayInSeconds = (self.config.items.count - index) * (0.195 / self.config.items.count);
        CFTimeInterval delay = delayInSeconds + CACurrentMediaTime();
        
        [UIView animateWithDuration:0.2 animations:^{
            [CancelButton setAlpha:0.1f];
            CancelButton.transform = CGAffineTransformMakeRotation(0);
            [downView setBackgroundColor:self.config.cancelBGViewDismissColor];
        }];
        
        [self StartTheAnimationFromValue:fromValue ToValue:toValue Delay:delay Object:button CompletionBlock:^(BOOL CompletionBlock) {
        } HideDisplay:true];
        index ++;
    }
    [self HidDelay:0.38f CompletionBlock:nil];
}
-(void)setTopView:(UIView *)topView
{
    if (![topView isKindOfClass:[NSNull class]] &&
        [topView isKindOfClass:[UIView class]]) {
        _topView = topView;
        [self.containerView addSubview:_topView];
    }
}
-(void)selectd:(MHPopMenuCustomButton *)button
{
    NSInteger tag = button.tag - (ButtonTag + 1);
    typeof(self) weak = self;
    for (MHPopMenuData *data in self.config.items) {
        NSInteger index = [self.config.items indexOfObject:data];
        MHPopMenuCustomButton *buttons = (MHPopMenuCustomButton *)[self viewWithTag:(index + 1) + ButtonTag];
        if (index == tag) {
            [button SelectdAnimation];
        }else{
            [buttons CancelAnimation];
        }
    }
    [self HidDelay:0.3f CompletionBlock:^(BOOL completion) {
        if (weak.selectdBlock) {
            weak.selectdBlock(button.MenuData,tag);
        }
    }];
    [self playSound:self.config.selectSound];
}

-(void)HidDelay:(NSTimeInterval)delay CompletionBlock:(void(^)(BOOL completion))blcok
{
    MHIssueCancelView *CancelButton = (MHIssueCancelView *)[self viewWithTag:11];
    UIView *downView = [CancelButton superview];
    [self setUserInteractionEnabled:false];
    typeof(self) weak = self;
    [UIView animateKeyframesWithDuration:0.3 delay:0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        [downView setBackgroundColor: self.config.cancelBGViewDismissColor];
        
        CancelButton.transform = CGAffineTransformMakeRotation(0);
        [CancelButton setAlpha:0.1f];
        
    } completion:^(BOOL finished) {
        
    }];
    [UIView animateKeyframesWithDuration:Duration delay:delay options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        
        [weak setAlpha:0.0f];
        
    } completion:^(BOOL finished) {
        [weak removeFromSuperview];
        if (blcok) {
            blcok(finished);
        }
    }];
}

-(void)dismiss{
    
    UIView *button = [self viewWithTag:10];
    [button setUserInteractionEnabled:false];
    [self setUserInteractionEnabled:false];
    typeof(self) weak = self;
    [self DismissCompletionBlock:^(BOOL CompletionBlock) {
        [weak removeFromSuperview];
    }];
    [self playSound:self.config.closeSound];
}
-(void)removeFromSuperview{
    if (self.disBlock) {
        self.disBlock(YES);
    }
    [super removeFromSuperview];
}

-(void)dealloc
{
    [_window.subviews respondsToSelector:@selector(removeFromSuperview)];
    [_window resignKeyWindow];
    [_window removeFromSuperview];
    _window = nil;
}

-(void)show{
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //    window.windowLevel = UIWindowLevelAlert;
    _window.backgroundColor = [UIColor clearColor];
    _window.alpha = 1;
    _window.hidden = false;
    [_window addSubview:self];
    [self playSound:self.config.openSound];
}
@end
