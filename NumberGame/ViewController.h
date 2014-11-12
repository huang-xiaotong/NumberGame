//
//  ViewController.h
//  NumberGame
//
//  Created by xyooyy on 14/11/10.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITextFieldDelegate>
{
    UITextField *writeText;
    UITextField *showText;
    NSMutableArray *systemarray;
    NSMutableArray *writearray;
}
@property int a;
@property int b;
@property int c;
@property int n;
@end
