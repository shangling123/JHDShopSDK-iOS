//
//  JHDEXLoginViewController.h
//  JHDShopSDK-iOS_Example
//
//  Created by 秦红江 on 2021/6/22.
//  Copyright © 2021 qinhongjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHDEXLoginViewController : UIViewController

- (instancetype)initWithLoginCompletion:(void (^ _Nullable)(NSDictionary *result))completion;


@end

NS_ASSUME_NONNULL_END
