//
//  NSBundle+IMSMessage.h
//  IMSMessage
//
//  Created by cjf on 21/4/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (IMSMessage)

/**
 获取文件所在name，默认情况下podName和bundlename相同，传一个即可
 
 @param bundleName bundle名字，就是在resource_bundles里面的名字
 @param podName pod的名字
 @return bundle
 */
+ (NSBundle *)IMSMessage_bundleWithBundleName:(NSString *)bundleName podName:(NSString *)podName;

@end

NS_ASSUME_NONNULL_END
