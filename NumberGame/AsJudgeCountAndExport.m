//
//  AsJudgeCountAndExport.m
//  NumberGame
//
//  Created by xyooyy on 14/11/13.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "AsJudgeCountAndExport.h"
#import "AsJudgeResult.h"
@implementation AsJudgeCountAndExport
-(NSString*)judgeCountExport :(NSString *)showString :(int)inputcount
{
    NSString* showtext = [[NSString alloc]init];
        if (inputcount == 6) {
        if (![showString isEqualToString:@"4A0B"]) {
            showtext = @"Failure";
        }
        else
            showtext = @"Finish";
    }
    else if ([showString isEqualToString:@"4A0B"]){
        showtext = @"Finish";
    }
    else
        showtext = showString;
    return showtext;
}
@end
