//
//  generateRandom.m
//  NumberGame
//
//  Created by xyooyy on 14/11/12.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "AsGenerateRandom.h"

@implementation AsGenerateRandom
-(NSString *)randomNumber :(int)randomNumberMax
{
    NSMutableString *randomnumber = [[NSMutableString alloc]init];
    NSArray *randomarray = [self creatRandomArray:randomNumberMax];
    for (int index = 0; index < [randomarray count]; index ++) {
        NSString *randomString = [NSString stringWithFormat:@"%@",randomarray[index]];
        [randomnumber insertString:randomString atIndex:[randomnumber length]];
   }
   
return randomnumber;
}
-(NSMutableArray *)creatRandomArray :(int)randomMax
{
    NSMutableArray *randomArray = [[NSMutableArray alloc]init];
    do {
        int random = arc4random()%randomMax;
        NSString *randomString = [NSString stringWithFormat:@"%d",random];
        if (![randomArray containsObject:randomString]) {
            [randomArray addObject:randomString];
        }
    }while (randomArray.count != 4);
    return randomArray;
}

@end
