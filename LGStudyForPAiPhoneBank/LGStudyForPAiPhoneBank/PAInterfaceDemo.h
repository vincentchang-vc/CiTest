//
//  PAInterfaceDemo.h
//  PATestDemo
//
//  Created by LGMacBook on 13-11-11.
//  Copyright (c) 2013年 Pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAInterfaceDemo : NSObject
{
    int _myId;
}
@property (nonatomic, assign) int myId;

//单元测试示例--接口1 ：初始化对象
- (id)init;

//单元测试示例--接口2 ：实现加法的接口,返回结果的字符串
+ (NSString *)add:(int )a and:(int)b;


@end








