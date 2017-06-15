//
//  MHPopMenuData.m
//  Demo
//
//  Created by J on 2017/6/15.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHPopMenuData.h"

@implementation MHPopMenuData
-(instancetype) initWithIconName:(NSString *)iconName andTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
        self.iconName = iconName;
    }
    return self;
}
+(instancetype)CreateLabelIconName:(NSString *)iconName andTitle:(NSString *)title
{
    MHPopMenuData *data=[[MHPopMenuData alloc]initWithIconName:iconName andTitle:title];
    return data;
}

@end
