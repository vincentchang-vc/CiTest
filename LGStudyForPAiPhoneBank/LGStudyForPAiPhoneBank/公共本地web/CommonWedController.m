//
//  CommonWedController.m
//  PAiPhoneBank2.0
//
//  Created by xbx on 13-5-17.
//  Copyright (c) 2013年 da zhan. All rights reserved.
//

#import "CommonWedController.h"
#import "IIViewDeckController.h"

#import "PAProgressView.h"

@interface CommonWedController ()
{
    NSString* titleName;
    NSString* loadUrl;
   
    UIWebView* curWebView;
    NSMutableData* webData;
    NSURLConnection* webConnection;
}
@end

@implementation CommonWedController

-(void)cancelRequest
{
    if( webConnection )
    {
        [webConnection cancel];
        [webConnection release];
        webConnection = nil;
    }
}

-(void)dealloc
{
    [titleName release];
    [loadUrl release];
    [webData release];
    [self cancelRequest];
    [super dealloc];
}

-(id)initWebWith:(NSString*)title Url:(NSString*)url
{
    self = [super init];
    if( self )
    {
        titleName = [title retain];
        loadUrl = [url retain];
    }
    return self;
}

-(void)backButtonEvents:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initNavigationBarItem
{
    UIImage *pLeftImage = [UIImage imageNamed:@"common_btn_back.png"];
    
    UIButton* pLeftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 33)];
    [pLeftButton setBackgroundImage:pLeftImage forState:UIControlStateNormal];
    [pLeftButton setTitle:@"返回" forState:UIControlStateNormal];
	[pLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[pLeftButton setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    //[pLeftButton.titleLabel setShadowColor:[UIColor grayColor]];
	pLeftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    //[pLeftButton.titleLabel setShadowOffset:CGSizeMake(0, -1)];
	[pLeftButton addTarget:self action:@selector(backButtonEvents:) forControlEvents:UIControlEventTouchUpInside];
    //[pLeftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    UIBarButtonItem *pLeftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:pLeftButton];
    self.navigationItem.leftBarButtonItem = pLeftButtonItem;
    [pLeftButtonItem release];
    [pLeftButton release];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = titleName;
    [self initNavigationBarItem];
    
    int viewHeight = kScreenHeight-kStatusBarHeight-kNavigationBarHeight;
    curWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,kScreenWidth,viewHeight)];
    //    [curWebView setOpaque:NO];//使网页透明
    //    id scroller = [curWebView.subviews objectAtIndex:0];
    //    for (UIView *tempView in [scroller subviews])
    //    {
    //        if ([[[tempView class] description] isEqualToString:@"UIImageView"])
    //            tempView.hidden = YES;
    //
    //    }
    curWebView.backgroundColor=[UIColor clearColor];
    curWebView.delegate = self;
    //[curWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:loadUrl]]];
    [self.view addSubview:curWebView];
    [curWebView release];
    
    // 修改方式
    NSURL* webUrl_f = [NSURL URLWithString:loadUrl];
#if isHTTPSAllowed==1
    [NSMutableURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[webUrl_f host]];
#endif
	NSURLRequest* request = [NSURLRequest requestWithURL:webUrl_f
											 cachePolicy:NSURLRequestUseProtocolCachePolicy
										 timeoutInterval:30.0];
	webConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [webConnection start];
	//[[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    [PAProgressView showInView:self.view
                 contentString:@"正在加载..."
          withProgressViewType:PAProgressViewTypeActivityIndicatorViewAndString];
    if (webData==nil)
    {
        webData = [[NSMutableData alloc] initWithCapacity:2048];
    }
    [webData setLength:0];
}

/* connection */
-(void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
	[webData appendData:incrementalData];
}

-(void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
    [self cancelRequest];
    [PAProgressView hideForView:self.view];
    NSString* html_f = [[NSString alloc] initWithData:webData
                                             encoding:NSUTF8StringEncoding];
    [curWebView loadHTMLString:html_f
                       baseURL:[NSURL URLWithString:loadUrl]];
    [html_f release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	[self cancelRequest];
    [PAProgressView hideForView:self.view];
}

- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
	[self cancelRequest];
    [PAProgressView hideForView:self.view];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
}

// Web Delegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    webView.scalesPageToFit = YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [PAProgressView hideForView:self.view];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [PAProgressView hideForView:self.view];
}

#pragma mark - IIViewDeckController delegate
- (BOOL)viewDeckControllerWillOpenLeftView:(IIViewDeckController*)viewDeckController animated:(BOOL)animated
{
    return NO;
}

@end
