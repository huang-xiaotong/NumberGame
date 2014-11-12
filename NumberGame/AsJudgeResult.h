//
//  judgeArray.h
//  NumberGame
//
//  Created by xyooyy on 14/11/12.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsJudgeResult : NSObject
{
    NSString *getRandomString;
    NSString *getWriteString;
}
-(id)init:(NSString *)writeString :(NSString *)randomString;
-(NSString *)judgeResultOut;
@end
