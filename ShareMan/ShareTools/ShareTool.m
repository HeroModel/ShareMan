//
//  ShareTool.m
//  ShareMan
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareTool.h"

@implementation ShareTool
#pragma 手机号判断
+ (BOOL)isMobileNum:(NSString *)mobNum {
    //    电信号段:133/149/153/173/177/180/181/189
    //    联通号段:130/131/132/145/155/156/171/175/176/185/186
    //    移动号段:134/135/136/137/138/139/147/150/151/152/157/158/159/178/182/183/184/187/188
    //    虚拟运营商:170
    
    NSString *MOBILE = @"^1(3[0-9]|4[579]|5[0-35-9]|7[0135-8]|8[0-9])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:mobNum];
}
@end
