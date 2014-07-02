//
//  PAProgressView.m
//  PARockPay
//
//  Created by Chen Jacky on 12-12-31.
//  Copyright (c) 2012年 xyh. All rights reserved.
//

#import "PAProgressView.h"

#import <QuartzCore/QuartzCore.h>

#define kPAProgressView_ContentStringFont       [UIFont systemFontOfSize:15]

#define kPAProgressView_RectangleViewAlpha      0.8f

#define kPAProgressView_ShowAnimateWithDuration 0.2f  //动画持续时间

#define kPAProgressView_AnimateDuration         1.8f  //显示时间

@interface PAProgressView()
{
    id                      m_pDelegate;
    
    PAProgressViewType      m_nCurrentProgressType;
    
    UIView                  *m_pRectangleView;
    
    UILabel                 *m_pContent;
    
    UIActivityIndicatorView *m_pLoadingView;
    
    NSTimer                 *m_pTimer;
    NSInteger               m_nTimerCount;
}

+ (PAProgressView *)showInView:(UIView *)view
                 contentString:(NSString *)string
          withProgressViewType:(PAProgressViewType)type
                      delegate:(id)delegate
                      autoHide:(BOOL)autoHide;

- (void)show;
- (void)hide;

- (void)initTimer;
- (void)timerRelease;
- (void)timerMethods;

- (void)show:(UIView *)view contentString:(NSString *)string withProgressViewType:(PAProgressViewType)type;
- (void)show:(UIView *)view contentString:(NSString *)string withProgressViewType:(PAProgressViewType)type delegate:(id)delegate autoHide:(BOOL)autoHide;

- (void)updateProgressType:(PAProgressViewType)type;
- (void)updateContentString:(NSString *)contentString;

- (void)refreshFrameWithString:(NSString *)contentString type:(PAProgressViewType)type showView:(UIView*)view;

@end

@implementation PAProgressView

@synthesize delegate = m_pDelegate;

@synthesize progressType = m_nCurrentProgressType;

#pragma mark - Public Class methods
+ (PAProgressView *)showInView:(UIView *)view
                 contentString:(NSString *)string
{
    return [self showInView:view
              contentString:string
       withProgressViewType:PAProgressViewTypeString
                   delegate:nil
                   autoHide:YES];
}

+ (PAProgressView *)showInView:(UIView *)view
                 contentString:(NSString *)string
                      delegate:(id)delegate
{
    return [self showInView:view
              contentString:string
       withProgressViewType:PAProgressViewTypeString
                   delegate:delegate
                   autoHide:YES];
}

#pragma mark -

+ (PAProgressView *)showInView:(UIView *)view
                 contentString:(NSString *)string
          withProgressViewType:(PAProgressViewType)type
{
    BOOL bAutoHide = NO;
    if (type == PAProgressViewTypeString)
    {
        bAutoHide = YES;
    }
    return [self showInView:view
              contentString:string
       withProgressViewType:type
                   delegate:nil
                   autoHide:bAutoHide];
}

+ (PAProgressView *)showInView:(UIView *)view
                 contentString:(NSString *)string
          withProgressViewType:(PAProgressViewType)type
                      delegate:(id)delegate
{
    BOOL bAutoHide = NO;
    if (type == PAProgressViewTypeString)
    {
        bAutoHide = YES;
    }
    return [self showInView:view
              contentString:string
       withProgressViewType:type
                   delegate:delegate
                   autoHide:bAutoHide];
}

#pragma mark -

+ (void)hideForView:(UIView *)view
{
    UIView *viewToRemove = nil;
    for (UIView *v in [view subviews])
    {
        if ([v isKindOfClass:[PAProgressView class]])
        {
            viewToRemove = v;
            
            PAProgressView *pProgressView = (PAProgressView *)viewToRemove;
            [pProgressView hide];
        }
    }
}

#pragma mark - Private Class methods
+ (PAProgressView *)showInView:(UIView *)view
                 contentString:(NSString *)string
          withProgressViewType:(PAProgressViewType)type
                      delegate:(id)delegate
                      autoHide:(BOOL)autoHide
{
    PAProgressView *pProgressView = [[PAProgressView alloc] init];
    
    [pProgressView show:view
          contentString:string
   withProgressViewType:type
               delegate:delegate
               autoHide:autoHide];
    
    return [pProgressView autorelease];
}

#pragma mark - init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        [self setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [self setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0]];
        
        m_pRectangleView = [[UIView alloc] initWithFrame:CGRectMake(60, kScreenHeight * 0.5f, 180, 45)];
        
        [m_pRectangleView.layer setBackgroundColor:[[UIColor colorWithRed:0 green:0 blue:0 alpha:kPAProgressView_RectangleViewAlpha] CGColor]];
        [m_pRectangleView.layer setCornerRadius:10];
        
        [self addSubview:m_pRectangleView];
        [m_pRectangleView release];
        
        m_pLoadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [m_pLoadingView setFrame:CGRectMake(0, 13, 20, 20)];
        [m_pLoadingView setHidden:YES];
        [m_pRectangleView addSubview:m_pLoadingView];
        [m_pLoadingView release];
        
        m_pContent = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, m_pRectangleView.frame.size.width, m_pRectangleView.frame.size.height)];
        [m_pContent setBackgroundColor:[UIColor clearColor]];
        [m_pContent setTextColor:[UIColor whiteColor]];
        [m_pContent setFont:kPAProgressView_ContentStringFont];
        [m_pContent setTextAlignment:NSTextAlignmentCenter];
        [m_pRectangleView addSubview:m_pContent];
        [m_pContent release];
        
        
         
        
    }
    return self;
}

- (void)initTimer
{
    NSDate *date = [NSDate date];
    m_pTimer = [[NSTimer alloc] initWithFireDate:date
                                        interval:1
                                          target:self
                                        selector:@selector(timerMethods)
                                        userInfo:nil
                                         repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:m_pTimer forMode:NSRunLoopCommonModes];
    
    m_nTimerCount = 0;
}
- (void)timerRelease
{
    if(m_pTimer)
    {
        [m_pTimer invalidate];
        [m_pTimer release];
    }
}

- (void)timerMethods
{
    if (m_nTimerCount >= kPAProgressView_AnimateDuration)
    {
        [self timerRelease];
        
        [self hide];
    }
    
    m_nTimerCount++;
}

#pragma mark - methods
- (void)show:(UIView *)view contentString:(NSString *)string withProgressViewType:(PAProgressViewType)type
{
    [self show:view contentString:string withProgressViewType:type delegate:nil autoHide:YES];
}
- (void)show:(UIView *)view contentString:(NSString *)string withProgressViewType:(PAProgressViewType)type delegate:(id)delegate autoHide:(BOOL)autoHide;
{
    [self refreshFrameWithString:string type:type showView:view];
    
    [view addSubview:self];
    
    [m_pContent setText:string];
    
    [self show];
    
     m_pDelegate = delegate;
    
    if ( autoHide )
    {
       [self initTimer];
    }
}

- (void)showInView:(UIView *)view
{
    [self refreshFrameWithString:m_pContent.text type:m_nCurrentProgressType showView:view];
    [view addSubview:self];
    [self show];
}

- (void)show
{
    [self setAlpha:0.0f];
    [UIView animateWithDuration:kPAProgressView_ShowAnimateWithDuration
                     animations:^{
                         [self setAlpha:1.0f];
                     }
                     completion:^(BOOL finished){
                     }];
}

- (void)hide
{
    [self setAlpha:1.0f];
    [UIView animateWithDuration:kPAProgressView_ShowAnimateWithDuration
                     animations:^{
                         [self setAlpha:0.0f];
                     }
                     completion:^(BOOL finished){
                         if (finished)
                         {
                             [self removeFromSuperview];
                             [self setAlpha:1.0f];
                         }
                     }];
    
    
    
    if (m_pDelegate && [m_pDelegate respondsToSelector:@selector(PAProgressViewDismiss:)])
    {
        [m_pDelegate performSelector:@selector(PAProgressViewDismiss:) withObject:self];
    }
}

- (void)refreshFrameWithString:(NSString *)contentString type:(PAProgressViewType)type showView:(UIView*)view
{
    //180
    CGSize size = [contentString sizeWithFont:kPAProgressView_ContentStringFont];
    
    NSInteger nContentStringWith = size.width;
    
    NSInteger nSpace = 10;
    
    NSInteger viewHeight = kContentHeight;
    if( [view isKindOfClass:[UIWindow class]] )
    {
        viewHeight = kScreenHeight;
    }
    
    switch(type)
    {
        case PAProgressViewTypeString:
        {
            [m_pLoadingView stopAnimating];
            [m_pLoadingView setHidden:YES];
            
            if (nContentStringWith <= 140)
            {
                [m_pRectangleView setFrame:CGRectMake(70,
                                                      viewHeight-108-45,                                                   180,
                                                      45)];
                [m_pContent setFrame:CGRectMake(0,
                                                0,
                                                m_pRectangleView.frame.size.width,
                                                m_pContent.frame.size.height)];
            }
            else
            {
                NSInteger nWidth = nContentStringWith + nSpace * 2;
                NSInteger nX = (kScreenWidth - nWidth) * 0.5f;
                [m_pRectangleView setFrame:CGRectMake(nX,
                                                      viewHeight-108-45,
                                                      nWidth,
                                                      45)];
                
                [m_pContent setFrame:CGRectMake(0,
                                                0,
                                                m_pRectangleView.frame.size.width,
                                                m_pContent.frame.size.height)];
            }
        }
            break;
        case PAProgressViewTypeActivityIndicatorViewAndString:
        {
            [m_pLoadingView startAnimating];
            [m_pLoadingView setHidden:NO];
            

            if (nContentStringWith <= 140)
            {
                [m_pRectangleView setFrame:CGRectMake(70,
                                                      viewHeight-108-45,
                                                      180,
                                                      45)];
                
                NSInteger nSumWidth = m_pLoadingView.frame.size.width + nContentStringWith;
                NSInteger nX = (m_pRectangleView.frame.size.width - nSumWidth) * 0.5f;
                
                [m_pLoadingView setFrame:CGRectMake(nX,
                                                    m_pLoadingView.frame.origin.y,
                                                    m_pLoadingView.frame.size.width,
                                                    m_pLoadingView.frame.size.height)];
                
                [m_pContent setFrame:CGRectMake(m_pLoadingView.frame.origin.x + m_pLoadingView.frame.size.width + nSpace,
                                                m_pContent.frame.origin.y,
                                                nContentStringWith,
                                                m_pContent.frame.size.height)];
            }
            else
            {
                NSInteger nWidth = nContentStringWith + m_pLoadingView.frame.size.width + nSpace * 2;
                NSInteger nRectangleView_X = (kScreenWidth - nWidth) * 0.5f;
                
                [m_pRectangleView setFrame:CGRectMake(nRectangleView_X,
                                                      viewHeight-108-45,
                                                      nWidth,
                                                      45)];
                
                NSInteger nSumWidth = m_pLoadingView.frame.size.width + nContentStringWith;
                NSInteger nX = (m_pRectangleView.frame.size.width - nSumWidth) * 0.5f;
                
                [m_pLoadingView setFrame:CGRectMake(nX,
                                                    m_pLoadingView.frame.origin.y,
                                                    m_pLoadingView.frame.size.width,
                                                    m_pLoadingView.frame.size.height)];
                
                [m_pContent setFrame:CGRectMake(m_pLoadingView.frame.origin.x + m_pLoadingView.frame.size.width,
                                                m_pContent.frame.origin.y,
                                                nContentStringWith,
                                                m_pContent.frame.size.height)];
            }
        }
            break;
        case PAProgressViewTypeCustom:
        {
            
        }
            break;
        default:break;
    }

    
    
}

#pragma mark -
- (void)setProgressType:(PAProgressViewType)progressType
{
    if ([NSThread mainThread])
    {
        [self updateProgressType:progressType];
    }
    else
    {
        [self performSelectorOnMainThread:@selector(updateProgressType:) withObject:[NSNumber numberWithInt:progressType] waitUntilDone:NO];
    }
}

- (void)updateProgressType:(PAProgressViewType)type
{
    m_nCurrentProgressType = type;
}

- (void)setContentString:(NSString *)contentString
{
    if ([NSThread mainThread])
    {
        [self updateContentString:contentString];
    }
    else
    {
        [self performSelectorOnMainThread:@selector(updateContentString:) withObject:contentString waitUntilDone:NO];
    }
}

- (void)updateContentString:(NSString *)contentString
{
    [m_pContent setText:contentString];
}

@end
