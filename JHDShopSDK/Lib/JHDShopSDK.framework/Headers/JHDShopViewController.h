//
//  JHDShopViewController.h
//  JHDShopModule
//
//  Created by 秦红江 on 2021/5/6.
//

#import <UIKit/UIKit.h>
@protocol JHDShopSDKDelegate;


NS_ASSUME_NONNULL_BEGIN



@interface JHDShopViewController : UIViewController

- (instancetype)init NS_UNAVAILABLE;

- (nullable instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
// 默认打店铺首页
- (instancetype)initWithDelegate:(id <JHDShopSDKDelegate>)delegate;
// 默认商品详情页
- (instancetype)initWithDelegate:(id <JHDShopSDKDelegate>)delegate skuId:(nullable NSString *)skuId NS_DESIGNATED_INITIALIZER;


@end

NS_ASSUME_NONNULL_END
