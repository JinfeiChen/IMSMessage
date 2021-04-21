//
//  UIImage+IMSMessage.m
//  IMSMessage
//
//  Created by cjf on 21/4/2021.
//

#import "UIImage+IMSMessage.h"
#import <IMSMessage/NSBundle+IMSMessage.h>

@implementation UIImage (IMSMessage)

+ (UIImage *)bundleImageWithNamed:(NSString *)imageName
{
    NSBundle *resouceBundle = [NSBundle bundleWithBundleName:@"IMSMessage" podName:@"IMSMessage"];
    return [UIImage imageNamed:imageName inBundle:resouceBundle compatibleWithTraitCollection:nil];
}

@end
