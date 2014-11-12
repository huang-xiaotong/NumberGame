//
//  ViewController.m
//  NumberGame
//
//  Created by xyooyy on 14/11/10.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//
//http://www.cnblogs.com/xmqios/p/3474635.html uitextfield
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize a;
@synthesize b;
@synthesize c;
@synthesize n;
- (void)viewDidLoad
{
    n = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    writeText = [self creattextfield:CGRectMake(90, 60, 140, 30) backgroundcolor:[UIColor lightGrayColor] placeholder:@"请输入数字"];
    showText = [self creattextfield:CGRectMake(150, 120, 100, 30) backgroundcolor:[UIColor whiteColor] placeholder:nil];
    showText.delegate = self;
    [self creatbutton:CGRectMake(70, 120, 60, 30) backgroundcolor:[UIColor whiteColor] Target:self Action:@selector(press:)];
    systemarray = [self creatArray:10];
    NSLog(@"%@",systemarray);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
-(UITextField *)creattextfield :(CGRect)frame backgroundcolor:(id)color placeholder:(NSString *)write
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.backgroundColor = color;
    textField.placeholder = write;
    textField.clearsOnBeginEditing = YES;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:textField];
    return textField;
}
-(UIButton *)creatbutton :(CGRect)buttonframe backgroundcolor:(id)color Target:(id)target Action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = color;
    button.frame =buttonframe;
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}
-(void)press: (id)sender
{
    if (n <= 6) {
        n++;
    }
    NSString *writedata = writeText.text;
    writearray = [[NSMutableArray alloc]init];
    for (int m = 0; m<[writedata length]; m++) {
        NSString *data = [writedata substringWithRange:NSMakeRange(m, 1)];
        [writearray addObject:data];
    }
    [self judgearray];
    [self judgeAB];
}
-(void)judgearray
{
    a = 0;
    b = 0;
    c = 0;
    for (int i = 0; i<[writearray count]; i++) {
        for (int j = 0; j<[systemarray count]; j++) {
            if ([writearray[i] isEqualToString:systemarray[j]]) {
                c ++;
            }
        }
        if ([writearray[i] isEqualToString: systemarray[i]]) {
            a ++;
        }
    }
    b = c - a;

}
-(void)judgeAB
{
    NSString *showstring = [NSString stringWithFormat:@"%dA%dB",a,b];
    if (n == 6) {
        if (a != 4) {
            showText.text = @"Failure";
            systemarray = [self creatArray:10];
            NSLog(@"1:%@",systemarray);
            n = 0;
        }
        else
            showText.text = @"Finish";
        systemarray = [self creatArray:10];
        NSLog(@"2:%@",systemarray);
        n = 0;
    }
    else if (a == 4){
        showText.text = @"Finish";
        systemarray = [self creatArray:10];
        NSLog(@"3:%@",systemarray);
        n = 0;
    }
    else
        showText.text = showstring;
}
@end
