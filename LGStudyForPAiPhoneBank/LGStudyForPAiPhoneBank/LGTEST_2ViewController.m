//
//  LGTEST_2ViewController.m
//  LGStudyForPAiPhoneBank
//
//  Created by JAMIE-LING on 14-6-30.
//  Copyright (c) 2014年 LG. All rights reserved.
//

#import "LGTEST_2ViewController.h"

@interface LGTEST_2ViewController ()

@end

@implementation LGTEST_2ViewController

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
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];
    // Do any additional setup after loading the view.
    
    
//    int viewWidth = kScreenWidth;
//    int init_x = 0;
//    int init_y = 0;
//    //跳转按钮
//    int butoon_wedth1 = 50;
//    int button_height1 = 25;
    UIButton *testButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [testButton1 setTitle:@"跳转" forState:UIControlStateNormal];
    [testButton1 setFrame:CGRectMake(100, 200, 100, 50)];
    [testButton1 addTarget:self action:@selector(turnToAnotherWeb) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:testButton1];
}

- (void) turnToAnotherWeb
{
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void) viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
