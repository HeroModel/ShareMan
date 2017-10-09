//
//  TimerTool.h
//  HoKol
//
//  Created by iOS 是很高端的 on 2017/5/17.
//  Copyright © 2017年 HoKol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerTool : NSObject
+ (NSString *)TimeTransformationString:(NSString *)timerString;
+ (NSString *)TimeBy:(NSInteger)number;
+ (NSString *)TimeByDay:(NSInteger)number;
+ (NSInteger)getCurrentTimestamp;
+ (NSString *)arrayToJSONString:(NSArray *)array;
+ (NSString*)ObjectTojsonString:(id)object;
@end
