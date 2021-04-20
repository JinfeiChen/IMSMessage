//
//  IMSMessage.h
//  test
//
//  Created by cjf on 20/4/2021.
//  Copyright © 2021 cjf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IMSMessageDefine.h"

typedef NSString *IMSMessageType NS_STRING_ENUM;

FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Info; // default.
FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Success;
FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Warning;
FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Error;

NS_ASSUME_NONNULL_BEGIN

@interface IMSMessageView : UIView

@end

@interface IMSMessage : NSObject

@end

NS_ASSUME_NONNULL_END
