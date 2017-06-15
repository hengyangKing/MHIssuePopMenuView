//
//  NSObject+PlaySound.m
//  Pods
//
//  Created by J on 2017/6/15.
//
//

#import "NSObject+PlaySound.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation NSObject (PlaySound)
-(void)playSound:(NSURL *)url
{
    if (!url) {
        return;
    }
    SystemSoundID soundID=0;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound(soundID);
}
@end
