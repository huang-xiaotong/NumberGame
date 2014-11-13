//
//  NumberGameTests.m
//  NumberGameTests
//
//  Created by xyooyy on 14/11/10.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AsGenerateRandom.h"
@interface NumberGameTests : XCTestCase
@end

@implementation NumberGameTests
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
- (void)testExample
{
    AsGenerateRandom *generaterandom = [[AsGenerateRandom alloc]init];
    NSString *randomstring = [generaterandom randomNumber:10];
    NSLog(@"randomstring:%@",randomstring);
    XCTAssertNotNil(randomstring);
}
@end
