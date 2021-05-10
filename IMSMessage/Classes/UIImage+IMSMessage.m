//
//  UIImage+IMSMessage.m
//  IMSMessage
//
//  Created by cjf on 21/4/2021.
//

#import "UIImage+IMSMessage.h"
#import <IMSMessage/NSBundle+IMSMessage.h>

@implementation UIImage (IMSMessage)

+ (UIImage *)IMSMessage_bundleImageWithNamed:(NSString *)imageName
{
    NSBundle *resouceBundle = [NSBundle IMSMessage_bundleWithBundleName:@"IMSMessage" podName:@"IMSMessage"];
    NSLog(@"%@", resouceBundle);
    return [UIImage imageNamed:imageName inBundle:resouceBundle compatibleWithTraitCollection:nil];
}

@end
