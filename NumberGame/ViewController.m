//
//  ViewController.m
//  NumberGame
//
//  Created by xyooyy on 14/11/10.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//
//http://www.cnblogs.com/xmqios/p/3474635.html uitextfield
//http://my.oschina.net/joanfen/blog/140143 uitextview
#import "ViewController.h"
#import "GameRuleViewController.h"
#import "AsJudgeResult.h"
#import "AsGenerateRandom.h"
#import "AsJudgeCountAndExport.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize inputCount;
- (void)viewDidLoad
{
    self.title = @"NumberGame";
    inputCount = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    writeText = [self creattextfield:CGRectMake(90, 90, 140, 30) backgroundcolor:[UIColor lightGrayColor] placeholder:@"请输入数字"];
    writeText.delegate = self;
    showText = [self creattextfield:CGRectMake(150, 150, 100, 30) backgroundcolor:[UIColor clearColor] placeholder:nil];
    showText.delegate = self;
    [self creatbutton:CGRectMake(70, 150, 60, 30) backgroundcolor:[UIColor whiteColor] Target:self Action:@selector(judgeResultAndShow:)];
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
-(void)judgeResultAndShow: (id)sender
{
    if (inputCount <= 6) {
        inputCount++;
        NSLog(@"inputcount%d",inputCount);
    }
    AsJudgeResult *judgeResult = [[AsJudgeResult alloc]init:writeText.text :randomNumber];
    NSString *showstring = [judgeResult judgeResultOut];
    AsJudgeCountAndExport *judgecount = [[AsJudgeCountAndExport alloc]init];
    AsGenerateRandom *generateRandom = [[AsGenerateRandom alloc]init];
    NSString *showtext = [judgecount judgeCountExport:showstring :inputCount];
    showText.text = showtext;
    if ([showtext isEqualToString:@"Failure"] | [showtext isEqualToString:@"Finish"]) {
        randomNumber = [generateRandom randomNumber:10];
        inputCount = 0;
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return textField.text.length>=4?NO:YES;
}
-(void)setrightbutton
{
    UIBarButtonItem *rightbutton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rule:)];
    [self.navigationItem setRightBarButtonItem:rightbutton];
}
-(void)rule: (id)sender
{
    GameRuleViewController *gameRule = [[GameRuleViewController alloc]init];
    [self.navigationController pushViewController:gameRule animated:YES];
}
@end
