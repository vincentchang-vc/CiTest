//
//  PAInterfaceDemo.m
//  PATestDemo
//
//  Created by LGMacBook on 13-11-11.
//  Copyright (c) 2013年 Pingan. All rights reserved.
//

#import "PAInterfaceDemo.h"

@implementation PAInterfaceDemo
@synthesize myId = _myId;

//单元测试示例--接口1 ：初始化对象
- (id)init
{
    self = [super init];
    if (self) {
        _myId = 1111;
    }
    return self;
}

//单元测试示例--接口2 ：实现加法的接口,返回结果的字符串
+ (NSString *)add:(int )a and:(int)b
{
    int sum = a + b;
    return [NSString stringWithFormat:@"%d", sum];
}

@end
