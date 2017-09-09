//
//  CLLocationManager+ Extend.h
//  ChildrenLocation
//
//  Created by mac on 2016/8/25.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocationManager (Extend)
+ (void)load ;
- (void)swizzledSetAllowsBackgroundLocationUpdates:(BOOL)allow ;

@end
