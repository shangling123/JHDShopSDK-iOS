//
//  JHDAppDelegate.m
//  JHDShopSDK-iOS
//
//  Created by qinhongjiang on 06/21/2021.
//  Copyright (c) 2021 qinhongjiang. All rights reserved.
//

#import "JHDAppDelegate.h"
//#import <JHDShopSDK/JHDShopSDK.h>
#import <JHDShopSDK/JHDShopSDK.h>

@implementation JHDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //——————央视频预发—————————
//    Appkey:FFC6C18CFDF2ED444D8D9CDAC33FB490
//    venderId:11709814
//    clientId : 708f695b-3cd8-462c-a0be-5a31029cbe70
//    uniqueKey:b47c73e3-feca-4ec3-9f6f-8d3e3394f287
//    securityCode:com.jdhd.iosapp.prepub
    //——————央视频线上—————————
//    Appkey:
//    venderId:
//    clientId :
//    uniqueKey:
//    securityCode:07:8F:D4:3B:D4:6A:02:C0:04:7C:D6:96:FB:DF:21:9C:CD:27:BB:F0
    //——————通用版预发—————————??
//    Appkey:67598867B9746DD8B89BA8066E2852D8
//    venderId:10877803
//    clientId : 0a68eefd-d02d-41f5-b981-eef9ac9a1f91
//    uniqueKey:A117B039R855HHFAE7ACD48F7A41525B
//    securityCode:CC:com.jdhd.iosapp
    //——————通用版线上—————————
//    Appkey:A084BBFFAFC6A617753A3015E2AA8ECF
//    venderId:10660167
//    clientId : 0811600d-59f7-4318-9990-1d37a8f2c3ef
//    uniqueKey:af35e226-3db0-4cf8-97bd-b398a046deb0
//    securityCode:com.jhd.shop.sdk
    
    
//    old 正式环境
    //Appkey:A084BBFFAFC6A617753A3015E2AA8ECF
    //venderId:10660167
    //clientId : 0811600d-59f7-4318-9990-1d37a8f2c3ef
    //uniqueKey:af35e226-3db0-4cf8-97bd-b398a046deb0
    //bundleId:com.jhd.shop.sdk
    [[JHDShopSDK shareInstance] startWithAppkey:@"A084BBFFAFC6A617753A3015E2AA8ECF"
                                       clientId:@"0811600d-59f7-4318-9990-1d37a8f2c3ef"
                                      uniqueKey:@"af35e226-3db0-4cf8-97bd-b398a046deb0"
                                       venderId:@"10660167"];
    
    // old 预发环境
    //Appkey:67598867B9746DD8B89BA8066E2852D8
    //venderId:10877803
    //clientId : 0a68eefd-d02d-41f5-b981-eef9ac9a1f91
    //uniqueKey:b47c73e3-feca-4ec3-9f6f-8d3e3394f287
    //bundleId:com.jdhd.iosapp
//    [[JHDShopSDK shareInstance] startWithAppkey:@"67598867B9746DD8B89BA8066E2852D8"
//                                       clientId:@"0a68eefd-d02d-41f5-b981-eef9ac9a1f91"
//                                      uniqueKey:@"A117B039R855HHFAE7ACD48F7A41525B"
//                                       venderId:@"10877803"];
    
    // 最新预发
//Appkey:FFC6C18CFDF2ED444D8D9CDAC33FB490
//venderId:11709814
//clientId : 708f695b-3cd8-462c-a0be-5a31029cbe70
//uniqueKey:b47c73e3-feca-4ec3-9f6f-8d3e3394f287
//securityCode:com.jdhd.iosapp.prepub
//    [[JHDShopSDK shareInstance] startWithAppkey:@"FFC6C18CFDF2ED444D8D9CDAC33FB490"
//                                       clientId:@"708f695b-3cd8-462c-a0be-5a31029cbe70"
//                                      uniqueKey:@"b47c73e3-feca-4ec3-9f6f-8d3e3394f287"
//                                       venderId:@"11709814"];
   
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
