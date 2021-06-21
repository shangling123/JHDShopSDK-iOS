//
//  JHDOpenShopView.h
//  JHDOpenShopModule
//
//  Created by 秦红江 on 2021/4/21.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@protocol JHDShopSDKDelegate;

NS_ASSUME_NONNULL_BEGIN





@interface JHDOpenShopView : UIView

@property (nonatomic, assign) BOOL bounces;

//@property (nonatomic, strong, readonly) WKWebView *webView;

@property (nonatomic, assign, readonly) BOOL needShowShare;



- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

- (instancetype)initWithDelegate:(id<JHDShopSDKDelegate>) delegate;

/// 是否可以返回

@property (nonatomic, assign) BOOL canGoBack;


//- (instancetype)initWithFrame:(CGRect)frame url:(NSString *)url userInfo:(NSDictionary *)userInfo;

- (void)loadURL:(NSString *)url skuId:(nullable NSString *)sukId;

- (void)goBack;

- (void)logout;

@end

NS_ASSUME_NONNULL_END
