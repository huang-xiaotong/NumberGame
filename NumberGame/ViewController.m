//
//  ViewController.m
//  NumberGame
//
//  Created by xyooyy on 14/11/10.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//
//http://www.cnblogs.com/xmqios/p/3474635.html uitextfield
#import "ViewController.h"
#import "AsJudgeResult.h"
#import "AsGenerateRandom.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize sameNumberSamePosition;
@synthesize sameNumberDifferentPosition;
@synthesize sameNumber;
@synthesize inputCount;
- (void)viewDidLoad
{
    self.title = @"NumberGame";
    inputCount = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    writeText = [self creattextfield:CGRectMake(90, 90, 140, 30) backgroundcolor:[UIColor lightGrayColor] placeholder:@"请输入数字"];
    showText = [self creattextfield:CGRectMake(150, 150, 100, 30) backgroundcolor:[UIColor whiteColor] placeholder:nil];
    showText.delegate = self;
    [self creatbutton:CGRectMake(70, 150, 60, 30) backgroundcolor:[UIColor whiteColor] Target:self Action:@selector(press:)];
    AsGenerateRandom *generateRandom = [[AsGenerateRandom alloc]init];
    randomNumber = [generateRandom randomNumber:10];
    NSLog(@"%@",randomNumber);
    [self setrightbutton];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(NSMutableArray *)creatArray :(int)i
//{
//    NSMutableArray *array = [[NSMutableArray alloc]init];
//    do {
//        int random = arc4random()%i;
//        
//        NSString *randomString = [NSString stringWithFormat:@"%d",random];
//        
//        if (![array containsObject:randomString]) {
//            [array addObject:randomString];
//        }
//    }
//    while (array.count != 4);
//    return array;
//}
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
    if (inputCount <= 6) {
        inputCount++;
    }
    [self judgeResultAndShow];
//    NSString *writedata = writeText.text;
//    writearray = [[NSMutableArray alloc]init];
//    for (int m = 0; m<[writedata length]; m++) {
//        NSString *data = [writedata substringWithRange:NSMakeRange(m, 1)];
//        [writearray addObject:data];
//    }
//    [self judgearray];
//    [self judgeAB];
//    AsJudgeResult *judgeResult = [[AsJudgeResult alloc]init:writeText.text :randomNumber];
}
//-(void)judgearray
//{
//    
//    AsJudgeResult *judge = [[AsJudgeResult alloc]init:writearray :systemarray];
//    sameNumberSamePosition = judge.sameNumberSamePosition;
//    sameNumberDifferentPosition = judge.sameNumberDifferentPosition;
//    sameNumber = judge.sameNumber;
//    sameNumberSamePosition = 0;
//    sameNumberDifferentPosition = 0;
//    sameNumber = 0;
//    for (int i = 0; i<[writearray count]; i++) {
//        for (int j = 0; j<[systemarray count]; j++) {
//            if ([writearray[i] isEqualToString:systemarray[j]]) {
//                sameNumber ++;
//            }
//        }
//        if ([writearray[i] isEqualToString: systemarray[i]]) {
//            sameNumberSamePosition ++;
//        }
//    }
//    sameNumberDifferentPosition = sameNumber - sameNumberSamePosition;

//}
-(void)judgeResultAndShow
{
    AsGenerateRandom *generateRandom = [[AsGenerateRandom alloc]init];
    AsJudgeResult *judgeResult = [[AsJudgeResult alloc]init:writeText.text :randomNumber];
    NSString *showstring = [judgeResult judgeResultOut];
    if (inputCount == 6) {
        if (![showstring isEqualToString:@"4A0B"]) {
            showText.text = @"Failure";
            randomNumber = [generateRandom randomNumber:10];
            inputCount = 0;
        }
        else
            showText.text = @"Finish";
        randomNumber = [generateRandom randomNumber:10];
        inputCount = 0;
    }
    else if ([showstring isEqualToString:@"4A0B"]){
        showText.text = @"Finish";
        randomNumber = [generateRandom randomNumber:10];
        inputCount = 0;
    }
    else
        showText.text = showstring;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}
-(void)setrightbutton
{
    UIBarButtonItem *rightbutton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rule:)];
    [self.navigationItem setRightBarButtonItem:rightbutton];
}
@end
