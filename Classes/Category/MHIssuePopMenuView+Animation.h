//
//  MHIssuePopMenuView+Animation.h
//  Demo
//
//  Created by J on 2017/6/15.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHIssuePopMenuView.h"

@interface MHIssuePopMenuView (Animation)
-(void)StartTheAnimationFromValue:(CGRect)fromValue ToValue:(CGRect)toValue Delay:(CFTimeInterval)delay Object:(id)obj CompletionBlock:(void(^) (BOOL CompletionBlock))completionBlock HideDisplay:(BOOL)HideDisplay;
@end
