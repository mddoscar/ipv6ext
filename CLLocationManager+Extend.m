//
//  CLLocationManager+ Extend.m
//  ChildrenLocation
//
//  Created by mac on 2016/8/25.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "CLLocationManager+Extend.h"
#import <objc/runtime.h>

@implementation CLLocationManager (Extend)
+ (void)load {
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 9.0) {
        method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"setAllowsBackgroundLocationUpdates:")),
                                       class_getInstanceMethod(self.class, @selector(swizzledSetAllowsBackgroundLocationUpdates:)));
    }
    
}

- (void)swizzledSetAllowsBackgroundLocationUpdates:(BOOL)allow {
    if (allow) {
        NSArray* backgroundModes  = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIBackgroundModes"];
        
        if( backgroundModes && [backgroundModes containsObject:@"location"]) {
            [self swizzledSetAllowsBackgroundLocationUpdates:allow];
        }else{
            NSLog(@"APP想设置后台定位，但APP的info.plist里并没有申请后台定位");
        }
    }else{
        [self swizzledSetAllowsBackgroundLocationUpdates:allow];
    }
}
@end
