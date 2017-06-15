//
//  MHIssuePopMenuView+Animation.m
//  Demo
//
//  Created by J on 2017/6/15.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHIssuePopMenuView+Animation.h"
#import <pop/POP.h>
@implementation MHIssuePopMenuView (Animation)
-(void)StartTheAnimationFromValue:(CGRect)fromValue ToValue:(CGRect)toValue Delay:(CFTimeInterval)delay Object:(id)obj CompletionBlock:(void(^) (BOOL CompletionBlock))completionBlock HideDisplay:(BOOL)HideDisplay{
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    springAnimation.removedOnCompletion = YES;
    springAnimation.beginTime = delay;
    CGFloat springBounciness = 10.f;
    springAnimation.springBounciness = springBounciness;    // value between 0-20
    CGFloat springSpeed = 20.f;
    springAnimation.springSpeed = springSpeed;     // value between 0-20
    springAnimation.toValue = [NSValue valueWithCGRect:toValue];
    springAnimation.fromValue = [NSValue valueWithCGRect:fromValue];
    
    POPSpringAnimation *SpringAnimationAlpha = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
    SpringAnimationAlpha.removedOnCompletion = YES;
    SpringAnimationAlpha.beginTime = delay;
    SpringAnimationAlpha.springBounciness = springBounciness;    // value between 0-20
    
    CGFloat toV,fromV;
    if (HideDisplay) {
        fromV = 1.0f;
        toV = 0.0f;
    }else{
        fromV = 0.0f;
        toV = 1.0f;
    }
    
    SpringAnimationAlpha.springSpeed = springSpeed;     // value between 0-20
    SpringAnimationAlpha.toValue = @(toV);
    SpringAnimationAlpha.fromValue = @(fromV);
    
    [obj pop_addAnimation:SpringAnimationAlpha forKey:SpringAnimationAlpha.name];
    [obj pop_addAnimation:springAnimation forKey:springAnimation.name];
    [springAnimation setCompletionBlock:^(POPAnimation *spring, BOOL Completion) {
        if (!completionBlock) {
            return ;
        }
        completionBlock(Completion);
    }];
    
}

@end
