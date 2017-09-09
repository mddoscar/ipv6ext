//
//  Ipv4v6Util.h
//  ChildrenLocation
//
//  Created by mac on 2016/8/28.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 ipv4兼容，ipv6方法
 */
@interface Ipv4v6Util : NSObject

- (NSString *)getProperIPWithAddress:(NSString *)ipAddr port:(UInt32)port;
+ (NSString *)getProperIPWithAddress:(NSString *)ipAddr port:(UInt32)port;

@end
