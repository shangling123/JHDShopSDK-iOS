//
//  JHDShopSDKUtil.h
//  Pods
//
//  Created by 秦红江 on 2021/6/9.
//

#ifndef JHDShopSDKUtil_h
#define JHDShopSDKUtil_h


#endif /* JHDShopSDKUtil_h */


static inline NSBundle * _Nullable JHDShopSDKBundle() {
    NSBundle *baseBundle = [NSBundle bundleForClass:NSClassFromString(@"JHDShopSDK")];
    NSURL *url = [baseBundle URLForResource:@"JHDShopSDK" withExtension:@"bundle"];
    
    if (url) {
        NSBundle *bdl = [NSBundle bundleWithURL:url];
        return bdl;
    }
    return [NSBundle mainBundle];
}


static inline UIImage * _Nullable JHDShopModuleImageNamed(NSString * _Nullable name) {
    NSBundle *bundle = JHDShopSDKBundle();
    UIImage *image = [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    return image;//[UIImage imageNamed:name inBundle:SLCRMUserCenterBundle() compatibleWithTraitCollection:nil];
}

