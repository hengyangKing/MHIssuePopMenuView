//
//  MHIssueCancelView.m
//  Demo
//
//  Created by J on 2017/6/15.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHIssueCancelView.h"

@implementation MHIssueCancelView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    
    if (view) {
        return view.superview.superview;
    }else
        return nil;
}
@end
