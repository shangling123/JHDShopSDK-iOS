//
//  JHDShopSDK.h
//  JHDOpenShopModule
//
//  Created by 秦红江 on 2021/4/26.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JHDShopSDKDelegate <NSObject>

/// 页面内部需要登陆代理  调用opnelogin 把登陆成功之后的用户信息回调给 sdk 内部
- (void)needLogin:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary *result))completion;


/// 退出登陆回调 通知外部退出登陆
- (void)needLogout:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary *result))completion;

/// 分享
- (void)needShare:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary *result))completion;

/// 页面加载完成
- (void)didFinishNavigation:(NSString *)title estimatedProgress:(double)estimatedProgress canGoBack:(BOOL) canGoBack;

@end


@interface JHDShopSDK : NSObject


@property (nonatomic, copy,nullable) NSDictionary *userInfo;

@property (nonatomic, copy, readonly) NSString *venderId;

@property (nonatomic, copy,nullable) NSString *userName;

@property (nonatomic, copy, readonly) NSString *shopUrl;


- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)shareInstance;

- (void)startWithVenderId:(NSString *)venderId;

+ (BOOL)isWXAppInstalled;

- (void)logout;

- (void)getShopUrl:(NSString *)venderId
           success:(nullable void(^)(NSString *url))success
           failure:(nullable void(^)(NSString *errorMessag))failure;
@end

NS_ASSUME_NONNULL_END
