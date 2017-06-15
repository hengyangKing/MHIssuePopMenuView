//
//  MHIssuePopMenuViewConfig.m
//  Pods
//
//  Created by J on 2017/6/15.
//
//

#import "MHIssuePopMenuViewConfig.h"

@implementation MHIssuePopMenuViewConfig
+(MHIssuePopMenuViewConfig *)defaultConfig
{
    MHIssuePopMenuViewConfig *config=[[MHIssuePopMenuViewConfig alloc]init];
    config.CancelBGViewColor([UIColor colorWithWhite:1.0 alpha:0.1]).CancelBGViewDismissColor([UIColor clearColor]).OpenSound([[NSBundle bundleForClass:[self class]]URLForResource:@"composer_open" withExtension:@"wav"]).CloseSound([[NSBundle bundleForClass:[self class]]URLForResource:@"composer_close" withExtension:@"wav"]).SelectSound([[NSBundle bundleForClass:[self class]]URLForResource:@"composer_select" withExtension:@"wav"]);
    return config;
}

#pragma mark 构建set
-(void)setItems:(NSArray<MHPopMenuData *> *)items
{
    _items=items;
}
-(void)setTopView:(UIView *)topView
{
    _topView=topView;
}
-(void)setMaxTopViewY:(CGFloat)maxTopViewY
{
    _maxTopViewY=maxTopViewY;
}
-(void)setCancelImage:(UIImage *)cancelImage
{
    _cancelImage=cancelImage;
}
-(void)setCancelBGViewColor:(UIColor *)cancelBGViewColor
{
    _cancelBGViewColor=cancelBGViewColor;
}
-(void)setCancelBGViewDismissColor:(UIColor *)cancelBGViewDismissColor
{
    _cancelBGViewDismissColor=cancelBGViewDismissColor;
}
-(void)setOpenSound:(NSURL *)openSound
{
    _openSound=openSound;
}
-(void)setCloseSound:(NSURL *)closeSound
{
    _closeSound=closeSound;
}
-(void)setSelectSound:(NSURL *)selectSound
{
    _selectSound=selectSound;
}
#pragma 重写block
-(MHIssuePopMenuViewConfig *(^)(CGFloat))MaxTopViewY
{
    return ^(CGFloat max){
        self.maxTopViewY=max;
        return self;
    };
}
-(MHIssuePopMenuViewConfig *(^)(UIView *))TopView
{
    
    return ^(UIView *view){
        self.topView=view;
        return self;
    };
}

-(MHIssuePopMenuViewConfig *(^)(NSArray<MHPopMenuData *> *))Items
{
    return ^(NSArray<MHPopMenuData *> *newItems){
        self.items=newItems;
        return self;
    };
}
-(MHIssuePopMenuViewConfig *(^)(UIImage *))CancelButtonImage
{
    return ^(UIImage *newImage){
        self.cancelImage=newImage;
        return self;
    };
}
-(MHIssuePopMenuViewConfig *(^)(UIColor *))CancelBGViewColor
{
    return ^(UIColor *newColor){
        self.cancelBGViewColor=newColor;
        return self;
    };
}
-(MHIssuePopMenuViewConfig *(^)(UIColor *))CancelBGViewDismissColor
{
    return ^(UIColor *newColor){
        self.cancelBGViewDismissColor=newColor;
        return self;
    };
}
-(MHIssuePopMenuViewConfig *(^)(NSURL *))OpenSound
{
    return ^(NSURL *newSound){
        self.openSound=newSound;
        return self;
    };
}
-(MHIssuePopMenuViewConfig *(^)(NSURL *))CloseSound
{
    return ^(NSURL *newSound){
        self.closeSound=newSound;
        return self;
    };
}
-(MHIssuePopMenuViewConfig *(^)(NSURL *))SelectSound
{
    return ^(NSURL *newSound){
        self.selectSound=newSound;
        return self;
    };
}


@end
