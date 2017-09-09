//
//  Ipv4v6Util.m
//  ChildrenLocation
//
//  Created by mac on 2016/8/28.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "Ipv4v6Util.h"
#import "GCDAsyncSocket.h"

@implementation Ipv4v6Util
/*
 参考http://blog.csdn.net/piratest/article/details/51684353
 */

- (NSString *)getProperIPWithAddress:(NSString *)ipAddr port:(UInt32)port
{
    NSError *addresseError = nil;
    NSArray *addresseArray = [GCDAsyncSocket lookupHost:ipAddr
                                                   port:port
                                                  error:&addresseError];
    //测试
//    NSArray * trstArr=[GCDAsyncSocket lookupHost:@"https://www.baidu.com/"
//                                             port:80
//                                            error:&addresseError];
    if (addresseError) {
        NSLog(@"");
    }
    
    NSString *ipv6Addr = @"";
    for (NSData *addrData in addresseArray) {
        if ([GCDAsyncSocket isIPv6Address:addrData]) {
            ipv6Addr = [GCDAsyncSocket hostFromAddress:addrData];
        }
    }
    
    if (ipv6Addr.length == 0) {
        ipv6Addr = ipAddr;
    }
    
    return ipv6Addr;
}
+ (NSString *)getProperIPWithAddress:(NSString *)ipAddr port:(UInt32)port
{
    //初始化一下
    NSString * rIpStr=[[[self class] alloc] getProperIPWithAddress:ipAddr port:port];
    return rIpStr;
}

@end
