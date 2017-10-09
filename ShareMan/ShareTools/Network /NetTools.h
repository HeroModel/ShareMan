//
//  NetTools.h
//  HoKoI
//
//  Created by iOS 是很高端的 on 2017/2/28.
//  Copyright © 2017年 HoKoI. All rights reserved.
//

#import <Foundation/Foundation.h>


/** 枚举 -> 数据请求结果 */
typedef void(^blockOfSuccess)(id result);
typedef void(^blockOfFailuure)(NSError *error);
typedef void(^blockOfProgress)(NSProgress *uploadProgress);

/** 枚举 -> 数据请求类型 */
typedef NS_ENUM(NSUInteger, NetResopnseStyle){
    NetJSON,
    NetDATA,
    NetXML,
    Net_List_JSON,
    
};
/** 枚举 -> post Request类型 */
typedef NS_ENUM(NSInteger, NetRequestStyle){
    NetBodyJSON,
    NetBodySTRING,
};

@interface NetTools : NSObject
/** GET 请求 */
+ (void)GetNetWithUrl:(NSString *)url
                 body:(id)body
            resopnese:(NetResopnseStyle)resopnese
              hearder:(NSDictionary *)hearders
              success:(blockOfSuccess)sucess
              failure:(blockOfFailuure)failure;


/** POST 请求 */
+ (void)POSTNetWithUrl:(NSString *)url
                  body:(id)body
             bodyStyle:(NetRequestStyle)bodyStyle
             resopnese:(NetResopnseStyle)resopnese
               hearder:(NSDictionary *)hearders
               success:(blockOfSuccess)sucess
               failure:(blockOfFailuure)failure;


+ (void)sendPOSTWithUrl:(NSString *)url
          WithImageData:(NSData *)data
               WithName:(NSString *)string
             parameters:(NSDictionary *)dict
                success:(blockOfSuccess)successBlock
                   fail:(blockOfFailuure)failBlock
               progress:(blockOfProgress)progressBlock;


@end
