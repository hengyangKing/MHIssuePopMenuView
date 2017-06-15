//
//  MHPopMenuSoundDic.m
//  Pods
//
//  Created by J on 2017/6/15.
//
//

#import "MHPopMenuSoundDic.h"
#define kMHPopMenuViewOpenAudioNameKey  @"OpenAudioNamekey"

#define kMHPopMenuViewCloseAudioNameKey @"CloseAudioNamekey"

#define kMHPopMenuViewSelectAudioNameKey @"SelectAudioNameKey"

@implementation MHPopMenuSoundDic
+(MHPopMenuSoundDic *)Sound
{
    MHPopMenuSoundDic *sound=[MHPopMenuSoundDic dictionary];
    sound.OpenSound([[NSBundle bundleForClass:[self class]]URLForResource:@"composer_open" withExtension:@"wav"]).CloseSound([[NSBundle bundleForClass:[self class]]URLForResource:@"composer_close" withExtension:@"wav"]).SelectSound([[NSBundle bundleForClass:[self class]]URLForResource:@"composer_select" withExtension:@"wav"]);

    return sound;
}
-(MHPopMenuSoundDic *(^)(NSURL *))OpenSound
{
    return ^(NSURL *soundurl){
        [self setObject:soundurl forKey:kMHPopMenuViewOpenAudioNameKey];
        return self;
    };
}
-(MHPopMenuSoundDic *(^)(NSURL *))CloseSound
{
    return ^(NSURL *soundurl){
        [self setObject:soundurl forKey:kMHPopMenuViewCloseAudioNameKey];
        return self;
    };
}
-(MHPopMenuSoundDic *(^)(NSURL *))SelectSound
{
    return ^(NSURL *soundurl){
    
        [self setObject:soundurl forKey:kMHPopMenuViewSelectAudioNameKey];
        return self;
    };
}
//-(NSURL *)openSound
//{
//    if ([self.allKeys containsObject:kMHPopMenuViewOpenAudioNameKey]) {
//        return [self objectForKey:kMHPopMenuViewOpenAudioNameKey];
//    }else{
//        return nil;
//    }
//}
//-(NSURL *)closeSound
//{
//    if ([self.allKeys containsObject:kMHPopMenuViewCloseAudioNameKey]) {
//        return [self objectForKey:kMHPopMenuViewCloseAudioNameKey];
//    }else{
//        return nil;
//    }
//}
//-(NSURL *)selectSound
//{
//    if ([self.allKeys containsObject:kMHPopMenuViewSelectAudioNameKey]) {
//        return [self objectForKey:kMHPopMenuViewSelectAudioNameKey];
//    }else{
//        return nil;
//    }
//}







@end
