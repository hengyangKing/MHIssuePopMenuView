//
//  MHIssuePopMenuViewConfig.h
//  Pods
//
//  Created by J on 2017/6/15.
//
//

#import <Foundation/Foundation.h>
#import "MHPopMenuData.h"
@interface MHIssuePopMenuViewConfig : NSObject
@property(nonatomic,strong,readonly)UIImage *cancelImage;
@property(nonatomic,assign,readonly)CGFloat maxTopViewY;
@property(nonatomic,strong,readonly)UIView *topView;
@property(nonatomic,retain,readonly)NSArray<MHPopMenuData *> *items;
@property(nonatomic,retain,readonly)UIColor *cancelBGViewColor;
@property(nonatomic,retain,readonly)UIColor *cancelBGViewDismissColor;
@property(nonatomic,strong,readonly)NSURL *openSound;
@property(nonatomic,strong,readonly)NSURL *closeSound;
@property(nonatomic,strong,readonly)NSURL *selectSound;

+(instancetype)defaultConfig;

//顶部视图最大Y值   Top View maximum Y value
@property (nonatomic,copy,readonly)MHIssuePopMenuViewConfig *(^MaxTopViewY)(CGFloat MaxTopViewY);

//自定义的顶部视图   Custom top view
@property (nonatomic,copy,readonly)MHIssuePopMenuViewConfig *(^TopView)(UIView *TopView);

//显示列表
@property(nonatomic,copy,readonly)MHIssuePopMenuViewConfig *(^Items)(NSArray<MHPopMenuData *> *items);

//取消button图片
@property(nonatomic,copy,readonly)MHIssuePopMenuViewConfig *(^CancelButtonImage)(UIImage *cancelButtonImage);


/**
 取消button背景颜色
 */
@property(nonatomic,copy,readonly)MHIssuePopMenuViewConfig *(^CancelBGViewColor)(UIColor *color);

/**
 取消button消失时背景颜色
 */
@property(nonatomic,copy,readonly)MHIssuePopMenuViewConfig *(^CancelBGViewDismissColor)(UIColor *color);

@property(nonatomic,copy,readonly)MHIssuePopMenuViewConfig *(^OpenSound)(NSURL *url);

@property(nonatomic,copy,readonly)MHIssuePopMenuViewConfig *(^CloseSound)(NSURL *url);

@property(nonatomic,copy,readonly)MHIssuePopMenuViewConfig *(^SelectSound)(NSURL *url);



@end
