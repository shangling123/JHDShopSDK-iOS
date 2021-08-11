//
//  JHDShopSDK.h
//  JHDShopModule
//
//  Created by 秦红江 on 2021/4/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*
 店铺sdk 代理
 @see container 类型为 JHDShopview 或 JHDShopViewController 取决于外部使用的页面类型
 */
@protocol JHDShopSDKDelegate <NSObject>

/// 页面内部需要登陆代理  调用opnelogin 把登陆成功之后的用户信息回调给 sdk 内部
- (void)container:(id)container needLogin:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary *result))completion;

/// 退出登陆回调 通知外部退出登陆
- (void)container:(id)container needLogout:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary *result))completion;

/// 分享
- (void)container:(id)container needShare:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary *result))completion;

/// 页面加载完成
- (void)container:(id)container didFinishNavigation:(NSString *)title estimatedProgress:(double)estimatedProgress canGoBack:(BOOL) canGoBack;


@end




@interface JHDShopSDK : NSObject


@property (nonatomic, copy,nullable) NSDictionary *userInfo;

@property (nonatomic, copy, readonly) NSString *venderId;

@property (nonatomic, copy,nullable) NSString *userName;

@property (nonatomic, copy, readonly) NSString *shopUrl;

@property (nonatomic, assign, readonly) BOOL safeVailded;


- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)shareInstance;

- (void)startWithAppkey:(NSString *)appKey
               clientId:(NSString *)clientId
              uniqueKey:(NSString *)uniqueKey
               venderId:(NSString *)venderId;

+ (BOOL)isWXAppInstalled;

- (void)logout;

+ (BOOL)openShop:(UIViewController *)target
        delegate:(id<JHDShopSDKDelegate>) delegate;

+ (BOOL)openProductDetail:(UIViewController *)target
                    skuId:(NSString *)skuId
                 delegate:(id<JHDShopSDKDelegate>) delegate;


- (void)getShopUrl:(NSString *)venderId
           success:(nullable void(^)(NSString *url))success
           failure:(nullable void(^)(NSString *errorMessag))failure;

- (void)safeValidSuccess:(nullable void(^)(void))success
                 failure:(nullable void(^)(NSString *errorMessag))failure;
@end

NS_ASSUME_NONNULL_END
