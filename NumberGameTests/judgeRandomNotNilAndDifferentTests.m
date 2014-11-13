//
//  NumberGameTests.m
//  NumberGameTests
//
//  Created by xyooyy on 14/11/10.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AsGenerateRandom.h"
@interface judgeRandomNotNilAndDifferentTests : XCTestCase
{
    BOOL flag;
}
@end

@implementation judgeRandomNotNilAndDifferentTests
- (void)setUp :(NSArray *)array
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
-(void)judgeStringDifferent :(NSString *)string
{
    flag = true;
    for (int i = 0; i < string.length; i++) {
        for (int j = i+1; j < [string length]; j++) {
            if ([[string substringWithRange:NSMakeRange(i, 1)] isEqualToString:[string substringWithRange:NSMakeRange(j, 1)]])
                 {
                flag = false;
            }
        }
    }
}
- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
- (void)test_randomString_is_not_nil
{
    AsGenerateRandom *generaterandom = [[AsGenerateRandom alloc]init];
    NSString *randomstring = [generaterandom randomNumber:10];
    XCTAssertNotNil(randomstring);
}
-(void)test_judge_String_is_different_return_false
{
    NSString *differentString = [[NSString alloc]init];
    differentString = @"1224";
    [self judgeStringDifferent:differentString];
    XCTAssertFalse(flag);
}
-(void)test_judge_String_is_different_return_true
{
    NSString *differentString = [[NSString alloc]init];
    differentString = @"1234";
    [self judgeStringDifferent:differentString];
    XCTAssertTrue(flag);
}
-(void)test_judge_randomstring_is_different_return_true
{
    AsGenerateRandom *generaterandom = [[AsGenerateRandom alloc]init];
    NSString *randomstring = [generaterandom randomNumber:10];
    [self judgeStringDifferent:randomstring];
    XCTAssertTrue(flag);
}
@end
