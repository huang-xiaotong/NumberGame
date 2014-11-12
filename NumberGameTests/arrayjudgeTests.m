//
//  arrayjudgeTests.m
//  NumberGame
//
//  Created by xyooyy on 14/11/10.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <XCTest/XCTest.h>
@interface arrayjudgeTests : XCTestCase
@property int a;
@property int b;
@property int c;
@end

@implementation arrayjudgeTests
@synthesize a;
@synthesize b;
@synthesize c;
- (void)setUp
{
    NSMutableArray *systemarray = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4", nil];
    NSMutableArray *writearray = [[NSMutableArray alloc]initWithObjects:@"1",@"5",@"3",@"4", nil];
    a = 0;
    b = 0;
    c = 0;
    for (int i = 0; i<[writearray count]; i++) {
        for (int j = 0; j<[systemarray count]; j++) {
            if (writearray[i] == systemarray[j]) {
                c ++;
            }
        }
        if (writearray[i] == systemarray[i]) {
            a ++;
        }
    }
    b = c - a;
    NSLog(@"%dA%dB",a,b);

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
    NSLog(@"%dA%dB",a,b);
    XCTAssertEqual(a, 3, @"a is true");
    XCTAssertEqual(b, 0, @"b is true");
    XCTAssertEqual(c, 3, @"c is true");
}

@end
