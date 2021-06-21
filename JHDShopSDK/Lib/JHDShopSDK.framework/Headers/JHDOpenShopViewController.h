//
//  JHDOpenShopViewController.h
//  JHDOpenShopModule
//
//  Created by 秦红江 on 2021/5/6.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@protocol JHDOpenShopViewControllerDelegate <NSObject>

/// 页面内部需要登陆代理  调用opnelogin 把登陆成功之后的用户信息回调给 sdk 内部
- (void)openShopViewController:(UIViewController *)controller needLogin:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary *result))completion;


/// 退出登陆回调 通知外部退出登陆
- (void)needLogout:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary *result))completion;

/// 分享
- (void)share:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary *result))completion;

@end

@interface JHDOpenShopViewController : UIViewController

- (instancetype)init NS_UNAVAILABLE;

- (nullable instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;

- (instancetype)initWithDelegate:(id <JHDOpenShopViewControllerDelegate>)delegate;

- (instancetype)initWithDelegate:(id <JHDOpenShopViewControllerDelegate>)delegate skuId:(nullable NSString *)skuId NS_DESIGNATED_INITIALIZER;


@end

NS_ASSUME_NONNULL_END
