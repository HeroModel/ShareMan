//
//  IDPersonallModel.m
//  ShareMan
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "IDPersonallModel.h"
#import "ContextModel.h"

@implementation IDPersonallModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.strID = value;
    }
    self.tagBean_list = [NSMutableArray array];
    if ([key isEqualToString:@"tagBean"]) {
        NSArray * array = value;
        for (NSDictionary * dic in array) {
            ContextModel * model = [[ContextModel alloc] initWithDic:dic];
            [self.tagBean_list addObject:model];
        }
    }
}
@end
