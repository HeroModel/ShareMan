//
//  ContextModel.m
//  ShareMan
//
//  Created by apple on 2017/9/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ContextModel.h"

@implementation ContextModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.voucherId = value;
    }
}
@end
