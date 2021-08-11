//
//  JHDViewController.m
//  JHDShopSDK-iOS
//
//  Created by qinhongjiang on 06/21/2021.
//  Copyright (c) 2021 qinhongjiang. All rights reserved.
//

#import "JHDEXRootViewController.h"
#import "JHDEXLoginViewController.h"

#import <JHDShopSDK/JHDShopSDK-umbrella.h>
#import <AFNetworking/AFNetworking.h>

@interface JHDEXRootViewController ()<JHDShopSDKDelegate>

@property (weak, nonatomic) IBOutlet UITextField *venderIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *skuIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *appKeyTextField;
@property (weak, nonatomic) IBOutlet UITextField *clientIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *uniqueKeyTextField;


@end

@implementation JHDEXRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)openShopButtonClick:(UIButton *)sender {
    if (self.venderIdTextField.text) {
        [JHDShopSDK openShop:self delegate:self];

    }
}
- (IBAction)productDetailButtonClick:(UIButton *)sender {
    
    if (self.skuIdTextField.text) {
        [JHDShopSDK openProductDetail:self skuId:self.skuIdTextField.text delegate:self];
    }
}

- (IBAction)logoutButtonClick:(UIButton *)sender {
    [self logout];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)container:(nonnull id)container didFinishNavigation:(nonnull NSString *)title estimatedProgress:(double)estimatedProgress canGoBack:(BOOL)canGoBack {
    
}

- (void)container:(nonnull id)container needLogin:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary * _Nonnull))completion {
    
    JHDEXLoginViewController * loginController = [[JHDEXLoginViewController alloc] initWithLoginCompletion:completion];
    if ([container isKindOfClass:[UIViewController class]]) {
        UIViewController *containerController = (UIViewController *)container;
        [containerController presentViewController:loginController animated:YES completion:nil];
    }
    
    
}

- (void)container:(nonnull id)container needLogout:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary * _Nonnull))completion {
    
    
    [self logout];
    // 调用退出登录接口
}

- (void)container:(nonnull id)container needShare:(nullable NSDictionary *)info completion:(void (^ _Nullable)(NSDictionary * _Nonnull))completion {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"调用分享" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}


/// MARK: - Private

- (void)logout{

    NSString *url = @"https://mock-isv.jd.com/appShop/logout";
    NSMutableDictionary *paramaters = [NSMutableDictionary dictionary];

    [paramaters setValue:[JHDShopSDK shareInstance].userName forKey:@"userName"];
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramaters options:NSJSONWritingPrettyPrinted error:nil];
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
            NSInteger code = [result[@"code"] integerValue];
            if (code == 0) {
                [self openLogout];
            }else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"登出失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alert show];
            }
            
        } else {
            NSString *errorResult = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"error: %@",errorResult);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"登出失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
    }] resume];
}

- (void)openLogout {
        
        NSString *url = @"https://mock-isv.jd.com/appShop/openLogout";
        NSMutableDictionary *paramaters = [NSMutableDictionary dictionary];
        NSString *sessionInfo = [JHDShopSDK shareInstance].userInfo[@"cookie_value"];
        [paramaters setValue:sessionInfo forKey:@"sessionInfo"];
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramaters options:NSJSONWritingPrettyPrinted error:nil];
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
                NSInteger code = [result[@"code"] integerValue];
                if (code == 0) {
                    [[JHDShopSDK shareInstance] logout];
                    [JHDShopSDK openShop:self delegate:self];
                }else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"登出失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                    [alert show];
                }
                
            } else {
                NSString *errorResult = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSLog(@"error: %@",errorResult);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"登出失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alert show];
            }
        }] resume];
}


@end
