//
//  MHIssuePopMenuView.h
//  Demo
//
//  Created by J on 2017/6/15.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHIssuePopMenuViewConfig.h"

typedef void(^SelectdCompletionBlock)(MHPopMenuData *menuData,NSInteger index);
typedef void(^DisMissBlock)(BOOL disMiss);

typedef void(^willShowBlock)();


@interface MHIssuePopMenuView : UIView

+(void)CreatePopMeunWithConfig:(MHIssuePopMenuViewConfig *)config andWillShowBlock:(willShowBlock)willShowBlock andSelectdCompletionBlock:(SelectdCompletionBlock)block andDisMissBlock:(DisMissBlock)disBlock;

@end
