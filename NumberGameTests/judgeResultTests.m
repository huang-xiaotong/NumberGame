//
//  arrayjudgeTests.m
//  NumberGame
//
//  Created by xyooyy on 14/11/10.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AsJudgeResult.h"
@interface judgeResultTests : XCTestCase

@end

@implementation judgeResultTests

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
- (void)test_judge_result_is_0A4B
{
    AsJudgeResult* judge = [[AsJudgeResult alloc]init:@"1234" :@"4321"];
    NSString *judgeResult = [judge judgeResultOut];
    XCTAssertEqualObjects(judgeResult, @"0A4B");
}

@end
