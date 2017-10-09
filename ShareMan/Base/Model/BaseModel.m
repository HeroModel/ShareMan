//
//  BaseModel.m
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
#pragma mark -- 容错方法!!!
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
}
- (void)setNilValueForKey:(NSString *)key
{
    
}
#pragma mark -- 初始化方法:
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end
