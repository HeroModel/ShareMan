//
//  AccountModel.m
//  ShareMan
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AccountModel.h"

@implementation AccountModel
static AccountModel * accModel = nil;
static dispatch_once_t onceToken;
+ (instancetype)sharedAccountModel
{
    dispatch_once(&onceToken, ^{
        accModel = [[super allocWithZone:NULL]init];
    });
    return accModel;
}
//销毁单利
+ (void)attemptDealloc
{
    onceToken = 0;
    accModel = nil;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.strID = value;
    }
}
@end
