//
//  UIColor+ImageColor.h
//  Demo
//
//  Created by J on 2017/6/15.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ImageColor)
+ (UIColor*) getPixelColorAtLocation:(CGPoint)point inImage:(UIImage *)image andAlpha:(CGFloat )jAlpha;

@end
