//
//  NumberGameTests.m
//  NumberGameTests
//
//  Created by xyooyy on 14/11/10.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NumberGameTests : XCTestCase
@property NSMutableArray *systemArray;
@property BOOL flag;
@end

@implementation NumberGameTests
@synthesize systemArray;
@synthesize flag;
- (void)setUp
{
    systemArray = [[NSMutableArray alloc]init];
    do {
        int random = arc4random()%10;
        
        NSString *randomString = [NSString stringWithFormat:@"%d",random];
        
        if (![systemArray containsObject:randomString]) {
            [systemArray addObject:randomString];
        }
    }
    while (systemArray.count != 4);
    flag = true;
    for (int i = 0; i<[systemArray count]; i++ ) {
        for (int j = i + 1; j<[systemArray count]; j++) {
            if (systemArray[i] == systemArray[j]) {
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
    NSLog(@"systemArray:%@",systemArray);
    XCTAssertTrue(flag, @"systemArray is true");
}
@end
