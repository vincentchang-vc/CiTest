//
//  LGHomeViewController.h
//  LGStudyForPAiPhoneBank
//
//  Created by LGMacBook on 01-1-1.
//  Copyright (c) 2001年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonWedController.h"

@interface LGHomeViewController : UIViewController
{
    UIViewController *_webView;
    UIView *_bigView;
}

+ (LGHomeViewController *) shareHomeController;

@end
