//
//  LGStudyForPAiPhoneBank_Tests.m
//  LGStudyForPAiPhoneBank Tests
//
//  Created by JAMIE-LING on 14-6-30.
//  Copyright (c) 2014年 LG. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PAInterfaceDemo.h"
@interface LGStudyForPAiPhoneBank_Tests : XCTestCase


@end

@implementation LGStudyForPAiPhoneBank_Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
//
//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

//单元测试示例--测试用例1 ：测试初始化对象
- (void) testInit
{
    PAInterfaceDemo *testDemo = [[PAInterfaceDemo alloc] init];
    XCTAssertEqual(testDemo.myId, 1000, @"期望值是1000，实际值是：%d", testDemo.myId);
}

//单元测试示例--测试用例2 ：测试加法的正确性
- (void) testAdd
{
    //...
    NSString *resultSum = [PAInterfaceDemo add:2 and:8];
    XCTAssertEqualObjects(resultSum, @"8", @"期望值是字符串8，实际值是：%@", resultSum);
}

@end
