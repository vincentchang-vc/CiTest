//
//  LGAppDelegate.h
//  LGStudyForPAiPhoneBank
//
//  Created by LGMacBook on 01-1-1.
//  Copyright (c) 2001年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGAppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *_centerController;

}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UINavigationController *centerController;

@end
