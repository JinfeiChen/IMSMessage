//
//  IMSMessage.h
//  test
//
//  Created by cjf on 20/4/2021.
//  Copyright © 2021 cjf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <IMSMessage/IMSMessageDefine.h>
#import <IMSMessage/IMSMessageType.h>

NS_ASSUME_NONNULL_BEGIN

@interface IMSMessage : NSObject

+ (void)showAlertWithType:(IMSMessageType)type message:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
