//
//  judgeCountShowResult.m
//  NumberGame
//
//  Created by xyooyy on 14/11/13.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AsJudgeCountAndExport.h"
@interface judgeCountShowResult : XCTestCase

@end

@implementation judgeCountShowResult

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

- (void)test_input_count_is_6_and_showtext_is_4A0B
{
    AsJudgeCountAndExport *judgeCount = [[AsJudgeCountAndExport alloc]init];
    NSString *showtext = [judgeCount judgeCountExport:@"1234" :@"1234" :6];
    XCTAssertEqualObjects(showtext, @"Finish");
}
-(void)test_input_count_is_6_but_showtext_is_not_4A0B
{
    AsJudgeCountAndExport *judgeCount = [[AsJudgeCountAndExport alloc]init];
    NSString *showtext = [judgeCount judgeCountExport:@"1234" :@"2456" :6];
    XCTAssertEqualObjects(showtext, @"Failure");
}
-(void)test_input_count_is_5_but_showtext_is_4A0B
{
    AsJudgeCountAndExport *judgeCount = [[AsJudgeCountAndExport alloc]init];
    NSString *showtext = [judgeCount judgeCountExport:@"1234" :@"1234" :5];
    NSLog(@"showtext:%@",showtext);
    XCTAssertEqualObjects(showtext, @"Finish");
}
-(void)test_input_count_is_5_and_showtext_is_2A2B
{
    AsJudgeCountAndExport *judgeCount = [[AsJudgeCountAndExport alloc]init];
    NSString *showtext = [judgeCount judgeCountExport:@"1234" :@"1243" :5];
    NSLog(@"showtext:%@",showtext);
    XCTAssertEqualObjects(showtext, @"2A2B");
}
@end
