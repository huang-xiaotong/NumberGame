//
//  judgeArray.m
//  NumberGame
//
//  Created by xyooyy on 14/11/12.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "AsJudgeResult.h"
#import "ViewController.h"
@implementation AsJudgeResult
-(id)init:(NSString *)writeString :(NSString *)randomString
{
    self = [super init];
    if (self) {
        getRandomString = randomString;
        getWriteString = writeString;
    }
    return  self;
}
-(NSString *)judgeResultOut
{
    int sameNumberSamePosition = 0;
    int sameNumberDifferentPosition = 0;
    int sameNumber = 0;
    NSMutableArray *writearray = [[NSMutableArray alloc]init];
    for (int writeIndex = 0; writeIndex<[getWriteString length]; writeIndex++) {
        NSString *data = [getWriteString substringWithRange:NSMakeRange(writeIndex, 1)];
        [writearray addObject:data];
    }
    NSMutableArray *getRandomArray = [[NSMutableArray alloc]init];
    for (int randomIndex = 0; randomIndex<[getRandomString length]; randomIndex++) {
        NSString *data = [getRandomString substringWithRange:NSMakeRange(randomIndex, 1)];
        [getRandomArray addObject:data];
    }
    for (int i = 0; i<[writearray count]; i++) {
        for (int j = 0; j<[getRandomArray count]; j++) {
            if ([writearray[i] isEqualToString:getRandomArray[j]]) {
                sameNumber ++;
            }
        }
        if ([writearray[i] isEqualToString: getRandomArray[i]]) {
            sameNumberSamePosition ++;
        }
    }
    sameNumberDifferentPosition = sameNumber - sameNumberSamePosition;
    NSString *result = [NSString stringWithFormat:@"%dA%dB",sameNumberSamePosition,sameNumberDifferentPosition];
    return result;
}
@end
