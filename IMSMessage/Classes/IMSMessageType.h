//
//  IMSMessageType.h
//  IMSMessage
//
//  Created by cjf on 21/4/2021.
//

#import <Foundation/Foundation.h>

typedef NSString *IMSMessageType NS_STRING_ENUM;

FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Info; // default.
FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Success;
FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Warning;
FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Error;
