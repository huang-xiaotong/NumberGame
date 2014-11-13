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
    NSString *randomNumber;
}
@property int inputCount;
@end
