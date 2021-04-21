//
//  IMSMessageType.h
//  IMSMessage
//
//  Created by cjf on 21/4/2021.
//

#import <Foundation/Foundation.h>

typedef NSString *IMSMessageType NS_STRING_ENUM;

FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Default; // msg (no icon)
FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Info; // icon + msg
FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Success; // icon + msg
FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Warning; // icon + msg
FOUNDATION_EXPORT IMSMessageType const IMSMessageType_Error; // icon + msg
