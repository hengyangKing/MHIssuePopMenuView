//
//  MHPopMenuCustomButton.h
//  Demo
//
//  Created by J on 2017/6/15.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHPopMenuData.h"
@interface MHPopMenuCustomButton : UIButton<CAAnimationDelegate>
@property (nonatomic, retain)MHPopMenuData *MenuData;

-(void)SelectdAnimation;
-(void)CancelAnimation;

@end
