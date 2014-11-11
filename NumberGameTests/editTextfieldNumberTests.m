//
//  editTextfieldNumberTests.m
//  NumberGame
//
//  Created by xyooyy on 14/11/11.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface editTextfieldNumberTests : XCTestCase
@property int i;
@end

@implementation editTextfieldNumberTests
@synthesize i;
- (void)setUp
{
    i = 0;
    int a = 3;
    if (a != 4) {
        i ++;
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
    NSLog(@"i:%d",i);
    XCTAssertEqual(i, 1, @"pressNumber is true");
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
