//
//  AppDelegate.m
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//


#import "AppDelegate.h"
#import "MainViewController.h"
#import "LeftMessViewController.h"
#import "REFrostedViewController.h"
#import "GFHomeNavViewController.h"
#import "GuideViewController.h"
#import "DetailsPageViewController.h"

@interface AppDelegate ()<REFrostedViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MainViewController * mainVC = [[MainViewController alloc] init];
    
    LeftMessViewController * leftVC = [[LeftMessViewController alloc] init];
    
    GFHomeNavViewController *globalNav = [[GFHomeNavViewController alloc]initWithRootViewController:mainVC];
    
    REFrostedViewController *frostedViewController = [[REFrostedViewController alloc] initWithContentViewController:globalNav menuViewController:leftVC];
    
    frostedViewController.direction = REFrostedViewControllerDirectionLeft;
    
    frostedViewController.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleDark;
    
    frostedViewController.liveBlur = YES;
    
    frostedViewController.delegate = self;
    
       if (![UserDefaults valueForKey:@"first"]) {
            [UserDefaults setValue:@"sd" forKey:@"first"];
                 self.window.rootViewController = [GuideViewController sharedGuideVC];
           
             }else{
                    self.window.rootViewController = frostedViewController;
                 }

    //向微信注册
    [WXApi registerApp:WXAPPID];
    
    //注册友盟
    UMConfigInstance.appKey = APPKey;
    UMConfigInstance.channelId = @"App Store";
    [MobClick startWithConfigure:UMConfigInstance];
    
//    // 网络监测
//    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
//    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        // 当网络状态发生改变的时候调用这个block
//
//        switch (status) {
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//            {
//                MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window  animated:YES];
//                hud.mode = MBProgressHUDModeText;
//                hud.label.text = @"WiFi";
//                [hud hideAnimated:YES afterDelay:1];
//            }
//                break;
//
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//            {
//                MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window  animated:YES];
//                hud.mode = MBProgressHUDModeText;
//                hud.label.text = @"蜂窝网络";
//                [hud hideAnimated:YES afterDelay:1];
//            }
//                break;
//
//            case AFNetworkReachabilityStatusNotReachable:
//            {
//                MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window  animated:YES];
//                hud.mode = MBProgressHUDModeText;
//                hud.label.text = @"网络连接失败";
//                [hud hideAnimated:YES afterDelay:1];
//            }
//                break;
//
//            case AFNetworkReachabilityStatusUnknown:
//            {
//                MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window  animated:YES];
//                hud.mode = MBProgressHUDModeText;
//                hud.label.text = @"网络未知错误";
//                [hud hideAnimated:YES afterDelay:1];
//            }
//                break;
//            default:
//                break;
//        }
//    }];
//    // 开始监控
//    [mgr startMonitoring];
    

    [NSThread sleepForTimeInterval:2.5];//设置启动页面时间
    return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL isSuc = [WXApi handleOpenURL:url delegate:self];
    //    NSLog(@"url %@ isSuc %d",url,isSuc == YES ? 1 : 0);
    return  isSuc;
}
- (void)onReq:(BaseReq *)req
{
    
}
- (void)onResp:(BaseResp *)resp
{
    // 处理 分享请求 回调
//    SendMessageToWXResp *sendResp = (SendMessageToWXResp *)resp;
    NSString * strMsg = [NSString stringWithFormat:@"errorCode: %d",resp.errCode];
//    NSLog(@"strMsg: %@",strMsg);

    NSString * errStr       = [NSString stringWithFormat:@"errStr: %@",resp.errStr];
//    NSLog(@"errStr: %@",errStr);


    NSString * strTitle;
    //判断是微信消息的回调 --> 是支付回调回来的还是消息回调回来的.
    if ([resp isKindOfClass:[SendMessageToWXResp class]])
    {

        // 判断errCode 进行回调处理
        if (resp.errCode == 0)
        {
            strTitle = [NSString stringWithFormat:@"分享成功"];
        }
    }
//    if (sendResp) {
//        switch (sendResp.errCode) {
//            case WXSuccess:
//            {
//                UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"分享成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
//
//                UIAlertAction * dismiss = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//                [alert addAction:dismiss];
//                UIWindow * window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//                window.rootViewController = [[UIViewController alloc]init];
//                window.windowLevel = UIWindowLevelAlert + 1;
//                [window makeKeyAndVisible];
//                [window.rootViewController presentViewController:alert animated:YES completion:nil];
//            }
//                break;
//
//            default:
//            {
//                UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"分享失败" message:nil preferredStyle:UIAlertControllerStyleAlert];
//
//                UIAlertAction * dismiss = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//                [alert addAction:dismiss];
//                UIWindow * window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//                window.rootViewController = [[UIViewController alloc]init];
//                window.windowLevel = UIWindowLevelAlert + 1;
//                [window makeKeyAndVisible];
//                [window.rootViewController presentViewController:alert animated:YES completion:nil];
//            }
//                break;
//        }
//    }
    
}
//- (BOOL) sendReq:(BaseReq*)req
//{
//    return YES;
//}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//            NSLog(@"result = %@",resultDic);
                [Notification postNotificationName:FICAtion object:resultDic];
        }];

        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
//            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
//            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];

    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
