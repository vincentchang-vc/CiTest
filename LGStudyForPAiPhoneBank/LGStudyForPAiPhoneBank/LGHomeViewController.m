//
//  LGHomeViewController.m
//  LGStudyForPAiPhoneBank
//
//  Created by LGMacBook on 01-1-1.
//  Copyright (c) 2001年 LG. All rights reserved.
//

#import "LGHomeViewController.h"
#import "CommonWedController.h"
#import "LGWebViewController.h"
#import "LGTEST_2ViewController.h"

@interface LGHomeViewController ()

@end


static LGHomeViewController *staticHomeViewController = nil;

@implementation LGHomeViewController

- (void)dealloc
{
    RELEASE_SAFELY(_webView);
    RELEASE_SAFELY(_bigView);
    [super dealloc];
}

+ (LGHomeViewController *) shareHomeController
{
    @synchronized(self)
    {
        if (staticHomeViewController == nil)
        {
            staticHomeViewController = [[self alloc] init];
        }
    }
    return staticHomeViewController;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    int viewWidth = kScreenWidth;
    int init_x = 0;
    int init_y = 0;
    
    //标题
    int label_height = 44;
    UILabel *oneLabel = [[UILabel alloc] initWithFrame:CGRectMake(init_x, init_y + kStatusBarHeight, viewWidth, label_height)];
    [oneLabel setBackgroundColor:[UIColor orangeColor]];
    [oneLabel setText:@"原生部分-WebView实现交互"];
    [oneLabel setCenter:CGPointMake(viewWidth / 2, label_height / 2)];
    [oneLabel setTextColor:[UIColor whiteColor]];
    [oneLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:oneLabel];
    RELEASE_SAFELY(oneLabel);
    
    //跳转按钮
    int butoon_wedth1 = 50;
    int button_height1 = 25;
    UIButton *testButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [testButton1 setTitle:@"跳转" forState:UIControlStateNormal];
    [testButton1 setFrame:CGRectMake(viewWidth - butoon_wedth1, (oneLabel.frame.size.height - button_height1) / 2, butoon_wedth1, button_height1)];
    [testButton1 addTarget:self action:@selector(turnToAnotherWeb) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:testButton1];
    
    
    int temp_y = 10;    //间隔
    init_y = oneLabel.frame.size.height + temp_y;
    
    //功能按钮2个
    int butoon_wedth = 180;
    int button_height = 30;
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [testButton setTitle:@"载入Web" forState:UIControlStateNormal];
    [testButton setFrame:CGRectMake((viewWidth / 2 - butoon_wedth) / 2 , init_y, butoon_wedth, button_height)];
    [testButton addTarget:self action:@selector(turnToHtmlPage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:testButton];
    
    UIButton *testButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [testButton2 setTitle:@"原生->HTML" forState:UIControlStateNormal];
    [testButton2 setFrame:CGRectMake((viewWidth / 2 - butoon_wedth) / 2  + viewWidth / 2, init_y, butoon_wedth, button_height)];
    [testButton2 addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:testButton2];
    
    init_y += temp_y + button_height;
    
    //bigView
    _bigView = [[UIView alloc] initWithFrame:CGRectMake(0, init_y, viewWidth,kScreenHeight - init_y)];
    [_bigView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:_bigView];
    RELEASE_SAFELY(_bigView);
}

- (void) turnToHtmlPage
{
    RELEASE_SAFELY(_webView);
    if (ISLGWEB)
    {
        _webView = [[LGWebViewController alloc] init];
//        [_webView.view setBounds:CGRectMake(0, 0, _bigView.frame.size.width, _bigView.frame.size.height)];
        [_bigView addSubview:_webView.view];
    }
}

- (void) change
{
    if (_webView == nil)
    {
        return;
    }
    LGWebViewController *testWebView = (LGWebViewController *)_webView;
    [testWebView.webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     "script.text = \"function myFunction() { "
//     "var field = document.getElementById('testId');alert(123);"
     "var field = document.getElementById('testId');"
     "field.value='测试';"
     "field.click.location='test123.html';"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"
     ];
    [testWebView.webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
}

- (void) turnToAnotherWeb
{
//    NSBundle *bundle = [NSBundle mainBundle];
////    NSURL *textFileURL = [bundle URLForResource:@"test123" withExtension:@"html"];
////    NSString *URLSthring = [NSString stringWithContentsOfURL:textFileURL encoding:NSUTF8StringEncoding error:nil];
////    RELEASE_SAFELY(_webView);
////    NSURL *url = [NSURL alloc ] ini
//    _webView = [[CommonWedController alloc] initWebWith:@"测试" Url:@"http://localhost/~LGMacBook/"];
    
    LGTEST_2ViewController *testCTL = [[LGTEST_2ViewController alloc] init];
    

    [self.navigationController pushViewController: testCTL animated:YES];
}

//右侧跳转

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
