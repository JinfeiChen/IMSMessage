//
//  IMSMessage.m
//  test
//
//  Created by cjf on 20/4/2021.
//  Copyright © 2021 cjf. All rights reserved.
//

#import "IMSMessage.h"
#import <Masonry/Masonry.h>



#define kIMSMessageViewHeight 55.0
#define kIMSMessageShowTime 3.0

@interface IMSMessageView ()

@property (strong, nonatomic) UIView *bodyView; /**< <#property#> */
@property (nonatomic, strong) UIImageView *pointIMGV;
@property (nonatomic, strong) UILabel *pointLB;

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
    [self addSubview:lineView];
    
    CGFloat iconWidthHeight = 20.0;
    CGFloat spacing = 10.0;
    
    [lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 4));
        make.bottom.mas_equalTo(self).offset(-5);
        make.centerX.mas_equalTo(self);
    }];
    
    [self.bodyView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.bottom.mas_equalTo(self).offset(spacing);
    }];
    
    [self.pointIMGV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(iconWidthHeight, iconWidthHeight));
        make.top.left.mas_equalTo(self.bodyView).offset(0);
    }];
    
    [self.pointLB mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(self).offset(0);
        make.left.mas_equalTo(self.pointIMGV.mas_right).offset(spacing);
    }];
    
}

#pragma mark - Public Methods

- (void)alertWithType:(IMSMessageType)type message:(nonnull NSString *)message
{
    self.pointLB.text = message;

    if ([type isEqualToString:IMSMessageType_Success]) {
//        self.pointIMGV.image = [UIImage bundleImageWithNamed:@"msg_success"];
    } else if ([type isEqualToString:IMSMessageType_Error]) {
//        self.pointIMGV.image = [UIImage bundleImageWithNamed:@"msg_error"];
    } else if ([type isEqualToString:IMSMessageType_Warning]) {
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

static IMSMessageView *_drop = nil; 

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
    if (_drop) {
        [_drop removeFromSuperview];
    }
    _drop = [[IMSMessageView alloc]init];

    if ([type isEqualToString:IMSMessageType_Success]) {
        _drop.backgroundColor = [UIColor lightGrayColor];
        _drop.textColor = [UIColor greenColor];
    } else if ([type isEqualToString:IMSMessageType_Error]) {
        _drop.backgroundColor = [UIColor lightGrayColor];
        _drop.textColor = [UIColor redColor];
    } else if ([type isEqualToString:IMSMessageType_Warning]) {
        _drop.backgroundColor = [UIColor lightGrayColor];
        _drop.textColor = [UIColor orangeColor];
    } else {
        _drop.backgroundColor = [UIColor lightGrayColor];
        _drop.textColor = [UIColor grayColor];
    }
    
    [_drop alertWithType:type message:message];
    [_drop show];
}

@end
