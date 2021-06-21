//
//  JHDOpenShopWebConfig.h
//  JHDOpenShopModule
//
//  Created by 秦红江 on 2021/6/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHDOpenShopWebConfig : NSObject

@property(nonatomic, copy) NSDictionary *shareConfig;

@property(nonatomic, copy) NSArray *sharePages;

@property(nonatomic, copy) NSString *shareMethod;

@property(nonatomic, copy) NSArray *tabBars;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)shareInstance;
@end

NS_ASSUME_NONNULL_END
