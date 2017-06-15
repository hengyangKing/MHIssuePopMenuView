//
//  MHPopMenuSoundDic.h
//  Pods
//
//  Created by J on 2017/6/15.
//
//

#import <Foundation/Foundation.h>
@interface MHPopMenuSoundDic : NSMutableDictionary

@property(nonatomic,copy,readonly)MHPopMenuSoundDic *(^OpenSound)(NSURL *url);

@property(nonatomic,copy,readonly)MHPopMenuSoundDic *(^CloseSound)(NSURL *url);

@property(nonatomic,copy,readonly)MHPopMenuSoundDic *(^SelectSound)(NSURL *url);

-(NSURL *)openSound;
-(NSURL *)closeSound;
-(NSURL *)selectSound;

+(MHPopMenuSoundDic *)Sound;

@end
