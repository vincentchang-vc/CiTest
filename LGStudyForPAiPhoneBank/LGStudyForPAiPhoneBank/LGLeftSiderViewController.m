//
//  LGLeftSiderViewController.m
//  LGStudyForPAiPhoneBank
//
//  Created by LGMacBook on 01-1-1.
//  Copyright (c) 2001年 LG. All rights reserved.
//

#import "LGLeftSiderViewController.h"

@interface LGLeftSiderViewController ()

@end

static LGLeftSiderViewController *shareInstance = nil;

@implementation LGLeftSiderViewController


+ (LGLeftSiderViewController *) shareInstance
{
    return shareInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        shareInstance = self;
    }
    return self;
}


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
	// Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor purpleColor]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
