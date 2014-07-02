//
//  LGWebViewController.m
//  LGTest
//
//  Created by LGMacBook on 12-9-12.
//  Copyright (c) 2012年 LG. All rights reserved.
//


#import "LGWebViewController.h"

@interface LGWebViewController ()

@end

@implementation LGWebViewController
@synthesize webView = _webView;

- (void)dealloc
{
    RELEASE_SAFELY(_webView);
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*
 NSBundle *bundle = [NSBundle mainBundle];
 NSURL *indexFileURL = [bundle URLForResource:@"RKRichTextView" withExtension:@"html"];
 NSString *text = [NSString stringWithContentsOfURL:indexFileURL encoding:NSUTF8StringEncoding error:nil];
 text = [text stringByReplacingOccurrencesOfString:@"{%content}" withString:richText];
 [self loadHTMLString:text baseURL:nil];
 self.scalesPageToFit = YES;
 self.scrollView.scrollEnabled = NO;
 for(UIView *wview in [[[self subviews] objectAtIndex:0] subviews]) {
 if([wview isKindOfClass:[UIImageView class]]) { wview.hidden = YES; }
 }
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.view setFrame:CGRectMake(0, 0, 320, 460)];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *baseURL = [NSURL fileURLWithPath:[bundle bundlePath]];
    NSURL *textFileURL = [bundle URLForResource:HTML_TEST withExtension:@"html"];
    NSString *URLSthring = [NSString stringWithContentsOfURL:textFileURL encoding:NSUTF8StringEncoding error:nil];
    
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    if (ISURL)
    {
//        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL_STRING]];
        [_webView loadHTMLString:URLSthring baseURL:baseURL];
    }
    else
        [_webView loadHTMLString:URLSthring baseURL:nil];
    
    [_webView setDelegate:self];
    if (OPEN_PAGETOFIT)
    {
        [_webView setScalesPageToFit:YES];
    }

//    [[_webView scrollView] setScrollEnabled:NO];
    
    [self.view addSubview:_webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    //absoluteString 网址转换为字符串
//    NSString *rurl=[[request URL] absoluteString];
    NSString* rurl=[[[request URL]  absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
      NSLog(@"__url = %@", rurl);
    if ([rurl hasPrefix:@"get1:"])
    {
        NSLog(@"url_____1 = %@", rurl);
        //如果是自己定义的协议, 再截取协议中的方法和参数, 判断无误后在这里手动调用oc方法
    
        NSString *get = [rurl substringFromIndex:7];
        UIAlertView *testView = [[UIAlertView alloc] initWithTitle:@"原生弹窗1-得到参数：" message:get delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [testView show];
        RELEASE_SAFELY(testView);
        return NO;
    }
    else
        if ([rurl hasPrefix:@"get2:"])
        {
            NSLog(@"url_____2 = %@", rurl);
            //如果是自己定义的协议, 再截取协议中的方法和参数, 判断无误后在这里手动调用oc方法
            
             NSString *getString = [[self.webView stringByEvaluatingJavaScriptFromString:@"get()"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            UIAlertView *testView = [[UIAlertView alloc] initWithTitle:@"原生弹窗2-得到参数：" message:getString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [testView show];
            RELEASE_SAFELY(testView);
            return NO;
        }
    return true;
}

@end
