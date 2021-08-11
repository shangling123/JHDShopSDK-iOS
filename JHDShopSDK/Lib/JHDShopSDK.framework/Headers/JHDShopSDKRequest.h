//
//  JHDShopSDKRequest.h
//  JHDShopModule
//
//  Created by 秦红江 on 2021/5/20.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN



@interface JHDShopSDKRequest : NSObject

+ (NSURLSessionDataTask *)POST:(NSString *)path
                    functionId:(NSString *)functionId
                    paramaters:( NSDictionary *__nullable)paramaters
                    completion:(nullable void(^)(id responseObject, NSError *_error))completion;
+ (NSURLSessionDataTask *)GET:(NSString *)path
                   functionId:(NSString *)functionId
                   paramaters:( NSDictionary *__nullable)paramaters
                   completion:(nullable void(^)(id responseObject, NSError *_error))completion;

@end

NS_ASSUME_NONNULL_END
