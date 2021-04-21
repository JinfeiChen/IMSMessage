//
//  IMSMessage.m
//  test
//
//  Created by cjf on 20/4/2021.
//  Copyright © 2021 cjf. All rights reserved.
//

#import "IMSMessage.h"
#import <Masonry/Masonry.h>
#import <IMSMessage/UIImage+IMSMessage.h>

#define kIMSMessageViewHeight (IMS_STATUSBAR_HEIGHT + 35)
#define kIMSMessageShowTime   2.0

@interface IMSMessageView ()

@property (strong, nonatomic) UIView *bodyView; /**< <#property#> */
@property (nonatomic, strong) UIImageView *pointIMGV;
@property (nonatomic, strong) UILabel *pointLB;

@property (copy, nonatomic) void (^ didShowBlock)(IMSMessageView *messageView); /**< <#property#> */
@property (copy, nonatomic) void (^ didHideBlock)(IMSMessageView *messageView); /**< <#property#> */

@end

@implementation IMSMessageView

- (instancetype)init {
    if (self = [super init]) {
        self.frame = CGRectMake(0, -kIMSMessageViewHeight, [UIScreen mainScreen].bounds.size.width, kIMSMessageViewHeight);
        self.userInteractionEnabled = YES;

        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(removeAlert)];
        [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
        [self addGestureRecognizer:recognizer];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeAlert)];
        [self addGestureRecognizer:tap];

        [self createAlert];
    }
    return self;
}

#pragma mark - UI

- (void)createAlert
{
    _bodyView = [[UIView alloc] init];
    [self addSubview:_bodyView];

    // 设置提示图标
    _pointIMGV = [[UIImageView alloc] init];
    [self.bodyView addSubview:_pointIMGV];

    // 设置提示信息
    UILabel *alertMsg = [[UILabel alloc]init];
    alertMsg.textColor = [UIColor whiteColor];
    alertMsg.textAlignment = NSTextAlignmentLeft;
    alertMsg.font = [UIFont systemFontOfSize:12.f weight:UIFontWeightMedium];
    alertMsg.numberOfLines = 2;
    self.pointLB = alertMsg;
    [self.bodyView addSubview:alertMsg];

    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    lineView.layer.cornerRadius = 2.0f;
    lineView.layer.masksToBounds = YES;
    [self addSubview:lineView];

    CGFloat iconWidthHeight = 20.0;
    CGFloat spacing = 10.0;

    [lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 4));
        make.bottom.mas_equalTo(self).offset(-5);
        make.centerX.mas_equalTo(self);
    }];

    [self.bodyView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self).offset(-15);
        make.left.mas_greaterThanOrEqualTo(spacing);
        make.right.mas_lessThanOrEqualTo(-spacing);
    }];

    [self.pointIMGV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(iconWidthHeight, iconWidthHeight));
        make.left.mas_equalTo(self.bodyView).offset(0);
        make.centerY.mas_equalTo(self.bodyView);
    }];

    [self.pointLB mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(self.bodyView).offset(0);
        make.left.mas_equalTo(self.pointIMGV.mas_right).offset(spacing);
        make.height.mas_greaterThanOrEqualTo(iconWidthHeight);
    }];
}

#pragma mark - Public Methods

- (void)alertWithType:(IMSMessageType)type message:(nonnull NSString *)message
{
    self.pointLB.text = message;

    self.backgroundColor = [UIColor colorWithRed:37 / 255.0 green:39 / 255.0 blue:58 / 255.0 alpha:0.9];
    if ([type isEqualToString:IMSMessageType_Success]) {
        self.pointIMGV.image = [UIImage bundleImageWithNamed:@"msg_success"];
        self.pointIMGV.tintColor = [UIColor greenColor];
        self.pointLB.textColor = [UIColor greenColor];
    } else if ([type isEqualToString:IMSMessageType_Error]) {
        self.pointIMGV.image = [UIImage bundleImageWithNamed:@"msg_error"];
        self.pointIMGV.tintColor = [UIColor redColor];
        self.pointLB.textColor = [UIColor redColor];
    } else if ([type isEqualToString:IMSMessageType_Warning]) {
        self.pointIMGV.image = [UIImage bundleImageWithNamed:@"msg_warning"];
        self.pointIMGV.tintColor = [UIColor orangeColor];
        self.pointLB.textColor = [UIColor orangeColor];
    } else {
        self.pointIMGV.image = [UIImage bundleImageWithNamed:@"msg_info"];
        self.pointIMGV.tintColor = [UIColor grayColor];
        self.pointLB.textColor = [UIColor grayColor];
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

#pragma mark -  展示提示框

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];

    [UIView animateWithDuration:.3 delay:0 usingSpringWithDamping:.6 initialSpringVelocity:5.f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, kIMSMessageViewHeight / 2);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(removeAlert) withObject:nil afterDelay:kIMSMessageShowTime];

        if (self.didShowBlock) {
            self.didShowBlock(self);
        }
    }];
}

#pragma mark - 移除提示框

- (void)removeAlert
{
    [UIView transitionWithView:self duration:0.25 options:0 animations:^{
        self.center = CGPointMake(IMS_SCREEN_WIDTH / 2, -(IMS_NAVIGATIONBAR_HEIGHT / 2));
    } completion:^(BOOL finished) {
        [self removeFromSuperview];

        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

        if (self.didHideBlock) {
            self.didHideBlock(self);
        }
    }];
}

@end

@interface IMSMessage ()

@property (strong, nonatomic) NSMutableArray *msgQueue; /**< <#property#> */

@end

static IMSMessageView *_showingMsgView = nil;
@implementation IMSMessage

+ (instancetype)shared {
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

+ (void)showAlertWithType:(IMSMessageType)type message:(NSString *)message
{
    IMSMessageView *msg = [[IMSMessageView alloc] init];
    [msg alertWithType:type message:message];
    msg.didShowBlock = ^(IMSMessageView *messageView) {
    };
    msg.didHideBlock = ^(IMSMessageView *messageView) {
        _showingMsgView = nil;
        [[IMSMessage shared] checkAlertQueue];
    };

    [[IMSMessage shared].msgQueue addObject:msg];

    if (!_showingMsgView) {
        [[IMSMessage shared] checkAlertQueue];
    }
}

- (void)checkAlertQueue
{
    if (self.msgQueue.count > 0) {
        IMSMessageView *msg = self.msgQueue.firstObject;
        [self.msgQueue removeObject:msg];
        _showingMsgView = msg;
        [msg show];
    } else {
    }
}

#pragma mark - Getters

- (NSMutableArray *)msgQueue
{
    if (!_msgQueue) {
        _msgQueue = [NSMutableArray array];
    }
    return _msgQueue;
}

@end
