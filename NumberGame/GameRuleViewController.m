//
//  GameRuleViewController.m
//  NumberGame
//
//  Created by xyooyy on 14/11/12.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "GameRuleViewController.h"

@interface GameRuleViewController ()

@end

@implementation GameRuleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.title = @"游戏规则";
    self.view.backgroundColor = [UIColor whiteColor];
    ruleText = [[UITextView alloc]initWithFrame:CGRectMake(90, 90, 140, 100)];
//    ruleText.backgroundColor = [UIColor blueColor];
    ruleText.contentInset = UIEdgeInsetsMake(-11, -6, 0, 0);
    
    ruleText.text = @"alkfnvraioianvlrk/n aslkjfdlka/n nvlfjnvl";
    ruleText.delegate = self;
    [self.view addSubview:ruleText];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //隐藏键盘
    [ruleText resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
