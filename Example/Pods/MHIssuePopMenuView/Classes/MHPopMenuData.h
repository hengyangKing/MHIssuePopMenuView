//
//  MHPopMenuData.h
//  Demo
//
//  Created by J on 2017/6/15.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHPopMenuData : NSObject
@property (nonatomic, retain) NSString *iconName;

@property (nonatomic, retain) NSString *title;

-(instancetype) initWithIconName:(NSString *)iconName andTitle:(NSString *)title;

+(instancetype) CreateLabelIconName:(NSString *)iconName andTitle:(NSString *)title;
@end
