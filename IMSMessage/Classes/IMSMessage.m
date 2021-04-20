//
//  IMSMessage.m
//  test
//
//  Created by cjf on 20/4/2021.
//  Copyright © 2021 cjf. All rights reserved.
//

#import "IMSMessage.h"

NSString *const IMSFormMessageType_Info = @"info";
NSString *const IMSFormMessageType_Success = @"success";
NSString *const IMSFormMessageType_Warning = @"warning";
NSString *const IMSFormMessageType_Error = @"error";

#define kIMSMessageViewHeight 55.0
#define kIMSMessageShowTime 3.0

@interface IMSMessageView ()

@property (nonatomic, weak) UIImageView *pointIMGV;
@property (nonatomic, weak) UILabel *pointLB;

@end

@implementation IMSMessageView

- (instancetype)init {
    if (self = [super init]) {
        self.frame = CGRectMake(0, -kIMSMessageViewHeight, [UIScreen mainScreen].bounds.size.width, kIMSMessageViewHeight);
        self.userInteractionEnabled = YES;

        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(removeAlert)];
        [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
        [self addGestureRecognizer:recognizer];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeAlert)];
        [self addGestureRecognizer:tap];

        [UIView animateWithDuration:.3 delay:0 usingSpringWithDamping:.6 initialSpringVelocity:5.f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, kIMSMessageViewHeight / 2);
        } completion:^(BOOL finished) {
            [self performSelector:@selector(removeAlert) withObject:nil afterDelay:kIMSMessageShowTime];
        }];

        [self createAlert];
    }
    return self;
}

#pragma mark - UI

- (void)createAlert
{
    self.backgroundColor = [UIColor colorWithRed:37/255.0 green:39/255.0 blue:58/255.0 alpha:0.9];
    
    CGFloat iconWidthHeight = 20.0;
    CGFloat spacing = 10.0;

    // 设置提示图标
    UIImageView *alertIMGV = [[UIImageView alloc]initWithFrame:CGRectMake(spacing, IMS_STATUSBAR_HEIGHT + (self.frame.size.height - IMS_STATUSBAR_HEIGHT - iconWidthHeight) / 2, iconWidthHeight, iconWidthHeight)];
    [self addSubview:alertIMGV];
    self.pointIMGV = alertIMGV;

    // 设置提示信息
    UILabel *alertMsg = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(alertIMGV.frame) + spacing, IMS_STATUSBAR_HEIGHT, self.frame.size.width - CGRectGetMaxX(alertIMGV.frame) - spacing * 2, IMS_NAVIGATION_CONTENT_HEIGHT)];
    alertMsg.textColor = [UIColor whiteColor];
    alertMsg.textAlignment = NSTextAlignmentLeft;
    alertMsg.font = [UIFont systemFontOfSize:12.f weight:UIFontWeightMedium];
    alertMsg.numberOfLines = 2;
    [self addSubview:alertMsg];
    self.pointLB = alertMsg;

    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, .5)];
    lineView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    [self addSubview:lineView];
}

#pragma mark - Public Methods

- (void)alertWithType:(IMSMessageType)type message:(nonnull NSString *)message
{
    self.pointLB.text = message;

    if ([type isEqualToString:IMSFormMessageType_Success]) {
//        self.pointIMGV.image = [UIImage bundleImageWithNamed:@"msg_success"];
    } else if ([type isEqualToString:IMSFormMessageType_Error]) {
//        self.pointIMGV.image = [UIImage bundleImageWithNamed:@"msg_error"];
    } else if ([type isEqualToString:IMSFormMessageType_Warning]) {
//        self.pointIMGV.image = [UIImage bundleImageWithNamed:@"msg_warning"];
    } else {
//        self.pointIMGV.image = [UIImage bundleImageWithNamed:@"msg_info"];
    }
}

#pragma mark -  展示提示框

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

#pragma mark - 移除提示框

- (void)removeAlert
{
    [UIView transitionWithView:self duration:0.25 options:0 animations:^{
        self.center = CGPointMake(IMS_SCREEN_WIDTH / 2, -(IMS_NAVIGATIONBAR_HEIGHT/2));
    } completion:^(BOOL finished) {
        [self removeFromSuperview];

        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }];
}

#pragma mark - Setters

- (void)setTextColor:(UIColor *)textColor
{
    self.pointLB.textColor = textColor;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

@end


@interface IMSMessage ()



@end

@implementation IMSMessage

+ (instancetype)shared {
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

@end
