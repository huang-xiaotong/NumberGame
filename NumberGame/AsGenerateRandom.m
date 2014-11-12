//
//  generateRandom.m
//  NumberGame
//
//  Created by xyooyy on 14/11/12.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "AsGenerateRandom.h"

@implementation AsGenerateRandom
-(NSString *)randomNumber :(int)i
{
    NSMutableString *randomnumber = [[NSMutableString alloc]init];
    do{
        int random = arc4random()%i;
        NSString *randomString = [NSString stringWithFormat:@"%d",random];
        for (int scan = 0; scan < randomnumber.length; scan++) {
            if ([randomnumber substringWithRange:NSMakeRange(scan, 1)] != randomString) {
                [randomnumber insertString:randomString atIndex:[randomnumber length]];
            }
        }
//        [randomnumber insertString:randomString atIndex:[randomnumber length]];
//        for (int m = 0; m<randomnumber.length; m++ ) {
//            for (int n = m + 1; n < randomnumber.length; n++) {
//                if ([randomnumber substringWithRange:NSMakeRange(m, 1)] == [randomnumber substringWithRange:NSMakeRange(n, 1)]) {
//                    [randomnumber deleteCharactersInRange:NSMakeRange(m, 1)];
//                }
//        }
//    }
    }while (randomnumber.length != 4);
//    NSArray *randomarray = [self creatArray:10];
//    for (int index = 0; index < [randomarray count]; index ++) {
//        NSString *randomString = [NSString stringWithFormat:@"%@",randomarray[index]];
//        [randomnumber insertString:randomString atIndex:[randomnumber];
//    }
    
return randomnumber;
}
-(NSMutableArray *)creatArray :(int)i
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    do {
        int random = arc4random()%i;

        NSString *randomString = [NSString stringWithFormat:@"%d",random];

        if (![array containsObject:randomString]) {
            [array addObject:randomString];
        }
    }
    while (array.count != 4);
    return array;
}

@end
