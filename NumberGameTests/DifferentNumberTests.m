//
//  DifferentNumberTests.m
//  NumberGame
//
//  Created by xyooyy on 14/11/10.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <XCTest/XCTest.h>
@interface DifferentNumberTests : XCTestCase
@property BOOL flag;
@end

@implementation DifferentNumberTests
@synthesize flag;
- (void)setUp
{
    NSArray *array = [[NSArray alloc]initWithObjects:@"1",@"3",@"3",@"4", nil];
    flag = true;
    for (int i = 0; i<[array count]; i++ ) {
        for (int j = i + 1; j<[array count]; j++) {
            if (array[i] == array[j]) {
                flag = false;
            }
        }
    }
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
    NSLog(@"flag:%hhd",flag);
    XCTAssertFalse(flag,@"differentnumber finish");
}
@end
