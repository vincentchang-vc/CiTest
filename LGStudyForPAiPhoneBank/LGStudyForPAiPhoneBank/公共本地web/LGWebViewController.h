//
//  LGWebViewController.h
//  LGTest
//
//  Created by LGMacBook on 12-9-12.
//  Copyright (c) 2012年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGWebViewController : UIViewController<UIWebViewDelegate>
{
    UIWebView *_webView;
}

@property (nonatomic, retain) UIWebView *webView;

@end
