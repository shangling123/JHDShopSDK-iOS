//
//  JHDEXLoginViewController.m
//  JHDShopSDK-iOS_Example
//
//  Created by 秦红江 on 2021/6/22.
//  Copyright © 2021 qinhongjiang. All rights reserved.
//

#import "JHDEXLoginViewController.h"
#import <JHDShopSDK/JHDShopSDK.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^Completion)(NSDictionary *result);

@interface JHDEXLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (nonatomic, copy) Completion loginCompletion;

@end

@implementation JHDEXLoginViewController


- (instancetype)initWithLoginCompletion:(void (^ _Nullable)(NSDictionary *result))completion {
    self = [super initWithNibName:@"EXJHDLoginViewController" bundle:nil];
    UIStoryboard *borad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [borad instantiateViewControllerWithIdentifier:@"JHDEXLoginViewController"];
    if (self) {
        self.loginCompletion = completion;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)loginButtonClick:(UIButton *)sender {
    
    
    NSString *url = @"https://mock-isv.jd.com/appShop/login";
 
    NSMutableDictionary *paramaters = [NSMutableDictionary dictionary];
    [paramaters setValue:self.userNameTextField.text forKey:@"userName"];
    [paramaters setValue:self.passwordTextField.text forKey:@"passport"];
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
            NSDictionary *cookieDTO = result[@"cookieDTO"];
            if (code == 0 && result[@"cookieDTO"] != [NSNull null] && cookieDTO !=nil) {
                NSString *userName = cookieDTO[@"cookie_value"];
                [JHDShopSDK shareInstance].userName = userName;
                [self openLogin:userName];
            }else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"登录失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alert show];
            }
            
        } else {
            NSString *errorResult = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"error: %@",errorResult);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"登录失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
    }] resume];
}

- (void)openLogin:(NSString *)userName {
    
    NSString *url = @"https://mock-isv.jd.com/appShop/openLogin";
    NSMutableDictionary *paramaters = [NSMutableDictionary dictionary];
    [paramaters setValue:[JHDShopSDK shareInstance].venderId forKey:@"venderId"];
    [paramaters setValue:userName forKey:@"userName"];
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
                self.loginCompletion(result);
                [self dismissViewControllerAnimated:YES completion:nil];
            }else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"登录失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alert show];
            }
            
        } else {
            NSString *errorResult = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"error: %@",errorResult);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"登录失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
    }] resume];
}


@end
