//
//  TimerTool.m
//  HoKol
//
//  Created by iOS 是很高端的 on 2017/5/17.
//  Copyright © 2017年 HoKol. All rights reserved.
//

#import "TimerTool.h"


@implementation TimerTool
+ (NSString *)TimeTransformationString:(NSString *)timerString
{
    NSString *str = timerString;
    //将字符串转化为整型并转换为NSDate
    NSInteger befor = [str intValue];
    //str距离1970年的时间差
    NSDate *beforTime = [NSDate dateWithTimeIntervalSince1970:befor];
    //得到距1970的时间差
    NSTimeInterval late=[beforTime timeIntervalSince1970];
    //得到现在的时间
    NSDate *dat = [NSDate dateWithTimeIntervalSinceNow:0];
    //得到现在时间距1970的时间差
    NSTimeInterval now=[dat timeIntervalSince1970];
    //初始化时间差字符串
    NSString *string = @"";
    //得到发表时间距现在的时间差
    NSTimeInterval cha=now-late;
//    NSDate *detaildate= [NSDate dateWithTimeIntervalSince1970:befor];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"MM-dd"];
    //小于一小时
    if (cha/3600<1) {
        string = [NSString stringWithFormat:@"%f", cha/60];
        string = [string substringToIndex:string.length-7];
        string=[NSString stringWithFormat:@"%@分钟前", string];
    }
    //小于一天
    if (cha/3600>1&&cha/43200<1) {
        string = [NSString stringWithFormat:@"%f", cha/3600];
        string = [string substringToIndex:string.length-7];
        string = [NSString stringWithFormat:@"%@小时前", string];
    }
    //大于一天
    if (cha/43200>1&&cha/86400<1)
    {
        string = [NSString stringWithFormat:@"%f", cha/43200];
        string = [string substringToIndex:string.length-7];
        string = @"昨天";
    }
    if (cha/86400>1)
    {
        string = [NSString stringWithFormat:@"%f", cha/86400];
        string = [string substringToIndex:string.length-7];
        string = [NSString stringWithFormat:@"%@天前", string]; //[dateFormatter stringFromDate:beforTime];
    }
    return string;
}
#pragma mark - 时间戳转换
+ (NSString *)TimeBy:(NSInteger)number
{

    NSTimeInterval time = number;//因为时差问题要加8小时 == 28800 sec

    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];

    //实例化一个NSDateFormatter对象

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    //设定时间格式,这里可以设置成自己需要的格式

    //    @"MM-dd"
    [dateFormatter setDateFormat:[NSString stringWithFormat:@"yyyy-MM-dd  HH:mm:ss"]];

    return [dateFormatter stringFromDate:detaildate];

}
+ (NSString *)TimeByDay:(NSInteger)number
{
    NSTimeInterval time = number;//因为时差问题要加8小时 == 28800 sec
    
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    
    //实例化一个NSDateFormatter对象
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    
    //    @"MM-dd"
    [dateFormatter setDateFormat:[NSString stringWithFormat:@"yyyy-MM-dd"]];
    
    return [dateFormatter stringFromDate:detaildate];
}

//获取当前时间的时间戳
+ (NSInteger)getCurrentTimestamp{
    NSDate * dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval ter =[dat timeIntervalSince1970];
    return ter;
}

//timeString.length-7(因为timeString得到后带6小数,算是小数点的.总共为7为,所以长度减去7);
//NSTimeInterval 时间差;


+ (NSString *)arrayToJSONString:(NSArray *)array
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}


+ (NSString*)ObjectTojsonString:(id)object

{
    
    NSString *jsonString = [[NSString
                             
                             alloc]init];
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization
                        
                        dataWithJSONObject:object
                        
                        options:NSJSONWritingPrettyPrinted
                        
                        error:&error];
    
    if (! jsonData) {
        
//        NSLog(@"error: %@", error);
        
    } else {
        
        jsonString = [[NSString
                       
                       alloc] initWithData:jsonData
                      
                      encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString
                               
                               stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    [mutStr replaceOccurrencesOfString:@" "
     
                            withString:@""
     
                               options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"\n"
     
                            withString:@""
     
                               options:NSLiteralSearch range:range2];
    NSRange range3 = {0, mutStr.length};
    NSString * str = @"\\";
    [mutStr replaceOccurrencesOfString:str withString:@"" options:NSLiteralSearch range:range3];
    
    return mutStr;
    
}

@end
