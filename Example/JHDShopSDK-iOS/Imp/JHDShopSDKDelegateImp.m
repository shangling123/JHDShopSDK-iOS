//
//  JHDShopSDKDelegateImp.m
//  JHDOpenShopModule_Example
//
//  Created by 秦红江 on 2021/6/1.
//  Copyright © 2021 吴滔. All rights reserved.
//

#import "JHDShopSDKDelegateImp.h"
#import <AFNetworking/AFNetworking.h>

@implementation JHDShopSDKDelegateImp

/// MARK: - JHDOpenShopDelegate

- (void)didFinishNavigation:(nonnull NSString *)title estimatedProgress:(double)estimatedProgress canGoBack:(BOOL)canGoBack {
    /// TODO: 刷新标题 以及返回按钮
}

- (void)needLogin:(NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary * _Nonnull result))completion {

    NSString *url = @"https://mock-isv.jd.com/appShop/openLogin";
    NSDictionary *dict = @{
        
        @"domain":@"shop10166289.m.selling.cn",
        @"newMobile":@"13511073532",
        @"xid":@"selling-app",
        @"imaUrl":@"//img30.360buyimg.com/devcenter/jfs/t16891/269/2314925865/21561/9f5ba770/5af16b5fN37065f4e.jpg",
        @"nickName":@"selling",
    };
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString* jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:120];
    [request setHTTPMethod:@"POST"];
    [request setValue: @"application/json; encoding=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue: @"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody: [jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error && responseObject) {
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            completion(result);
        } else {
            NSString *errorResult = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"error: %@",errorResult);
        }
    }] resume];

}

- (void)needLogout:(NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary * _Nonnull result))completion {
    /// TODO: 调用退出登陆，退出登陆成功回到结果
}

- (void)share:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary * _Nonnull))completion {
    
}

- (void)openShopViewController:(nonnull UIViewController *)controller needLogin:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary * _Nonnull))completion {
//    EXJHDLoginViewController *loginController = [[EXJHDLoginViewController alloc] initWithLoginCompletion:completion];
//    [controller presentViewController:loginController animated:YES completion:nil];
}



- (void)needShare:(NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary * _Nonnull result))completion {
    /// TODO: 调用分享
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享测试" message:@"我要分享" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alert show];
}


@end


