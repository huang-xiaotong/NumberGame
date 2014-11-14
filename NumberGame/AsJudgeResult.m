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
-(NSMutableArray *)WriteArray :(NSString *)writeString
{
    NSMutableArray *writeArray = [[NSMutableArray alloc]init];
    for (int writeIndex = 0; writeIndex<[writeString length]; writeIndex++) {
        NSString *data = [writeString substringWithRange:NSMakeRange(writeIndex, 1)];
        [writeArray addObject:data];
    }
    return writeArray;
}
-(NSMutableArray *)RandomArray :(NSString *)randomString
{
    NSMutableArray *randomArray = [[NSMutableArray alloc]init];
    for (int randomIndex = 0; randomIndex<[randomString length]; randomIndex++) {
        NSString *data = [randomString substringWithRange:NSMakeRange(randomIndex, 1)];
        [randomArray addObject:data];
    }
    return randomArray;
}
-(NSString *)judgeResultOut
{
    int sameNumberSamePosition = 0;
    int sameNumberDifferentPosition = 0;
    int sameNumber = 0;
    NSMutableArray *writearray = [self WriteArray :getWriteString];
    NSMutableArray *getRandomArray = [self RandomArray:getRandomString];
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
