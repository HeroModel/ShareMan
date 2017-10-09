//
//  NetTools.m
//  HoKoI
//
//  Created by iOS 是很高端的 on 2017/2/28.
//  Copyright © 2017年 HoKoI. All rights reserved.
//

#import "NetTools.h"
#import <AFNetworking.h>
#import <CommonCrypto/CommonCrypto.h>


@implementation NetTools
#if 0
+ (void)GetNetWithUrl:(NSString *)url
                 body:(id)body
            resopnese:(NetResopnseStyle)resopnese
              hearder:(NSDictionary *)hearders
              success:(blockOfSuccess)sucess
              failure:(blockOfFailuure)failure

{
    // 1.获取网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 允许https
    manager.securityPolicy.allowInvalidCertificates = YES;
    // 2.请求头的设置
    if (hearders) {
        for (NSString *key in hearders.allKeys) {
            [manager.requestSerializer setValue:hearders[key] forHTTPHeaderField:key];
        }
    }
    
    // 3.设置返回数据的类型
    
    switch (resopnese) {
        case NetJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case NetXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case NetDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    
    // 4.设置响应类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"image/jpeg", @"text/vnd.wap.wml" @"multipart/form-data", nil]];
    
    // 5.ios 9 UTF-8转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    // 6.发送请求
    [manager GET:url parameters:body progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        sucess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        NSLog(@"error -> %@", error);
    }];
    
}

/** POST 请求 */
+ (void)POSTNetWithUrl:(NSString *)url
                  body:(id)body
             bodyStyle:(NetRequestStyle)bodyStyle
             resopnese:(NetResopnseStyle)resopnese
               hearder:(NSDictionary *)hearders
               success:(blockOfSuccess)sucess
               failure:(blockOfFailuure)failure

{
    
    // 1.获取网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 允许https
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    // 2.设置body数据类型
    switch (bodyStyle) {
        case NetBodyJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case NetBodySTRING:
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable * _Nullable error) {
                return parameters;
            }];
            break;
        default:
            break;
    }
    // 3.请求头的设置
    
    if (hearders) {
        for (NSString *key in hearders.allKeys) {
            [manager.requestSerializer setValue:hearders[key] forHTTPHeaderField:key];
        }
    }
    // 4.设置返回数据的类型
    
    switch (resopnese) {
        case NetJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case NetXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case NetDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    // 5.设置响应类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"image/jpeg", @"text/vnd.wap.wml" @"multipart/form-data", @"application/x-javascript", nil]];
    // 6.ios 9 UTF-8转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // 7.发送请求
    [manager POST:url parameters:body progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        sucess(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        NSLog(@"error -> %@", error);
        
    }];
}
#else
/** Get有缓存的网络请求  */
//+ (void)getNetWithUrl:(NSString *)url
//              urlBody:(id)body
//               header:(NSDictionary *)header
//             response:(NetResopnseStyle)response
//              success:(blockOfSuccess)success
//              failure:(blockOfFailuure)failure
//{
//    //创建网络管理者:
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    //请求头的设置:
//    if (header) {
//        for (NSString *key in header.allKeys) {
//            [manager.requestSerializer setValue:header[key] forHTTPHeaderField:key];
//        }
//    }
//    //设置返回数据的类型:
//    switch (response) {
//        case NetJSON:
//            manager.responseSerializer = [AFJSONResponseSerializer serializer];
//            break;
//        case NetXML:
//            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//            break;
//        case NetDATA:
//            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//            break;
//        default:
//            break;
//    }
//    //设置响应数据类型:
//    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"image/jpeg", @"text/vnd.wap.wml", nil]];
//    //转码:iOS9-----新改的
//    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    
//    
//    NSString *cacheFile = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
//    
//    // MD5
//    NSString *theurl = [NetTools cachedFileNameForKey:url];
//    
//    NSString *cachePath = [cacheFile stringByAppendingPathComponent:theurl];
//    
//    //发送请求:
//    [manager GET:url parameters:body progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        BOOL isCache = [NSKeyedArchiver archiveRootObject:responseObject toFile:cachePath];
//        if (isCache) {
//            NSLog(@"缓存成功");
//        }
//        
//        success(responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        failure(error);
//        NSLog(@"%@", error);
//        id data = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
//        NSLog(@"有缓存!");
//        if (data != NULL) {
//            success(data);
//        }
//        
//    }];
//}


//AFURLRequestSerialization
/** Post有缓存的网络请求  */
+ (void)POSTNetWithUrl:(NSString *)url
                  body:(id)body
             bodyStyle:(NetRequestStyle)bodyStyle
             resopnese:(NetResopnseStyle)resopnese
               hearder:(NSDictionary *)hearders
               success:(blockOfSuccess)sucess
               failure:(blockOfFailuure)failure
{
    //创建网络管理者:AFHTTPResponseSerializer
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 允许https
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
   
    
    //设置网络请求超时
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    //设置body数据类型:
    switch (bodyStyle) {
        case NetBodyJSON:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        case NetBodySTRING:
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable * _Nullable error) {
                return parameters;
            }];
            break;
        default:
            break;
    }
    //请求头的设置:
    if (hearders) {
        for (NSString *key in hearders.allKeys) {
            [manager.requestSerializer setValue:hearders[key] forHTTPHeaderField:key];
        }
    }
    //设置返回数据的类型:
    switch (resopnese) {
        case NetJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case NetXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case NetDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        case Net_List_JSON:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        default:
            break;
    }
    //设置响应数据类型:
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json;charset=utf-8", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"image/jpeg", @"text/vnd.wap.wml", @"multipart/form-data", @"application/x-javascript", @"application/json",nil]];
    
    //转码:iOS9-----新改的
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString * cacheFile = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    //MD5
    NSString * theurl = [NetTools cachedFileNameForKey:url];
    NSString * cachePath = [cacheFile stringByAppendingPathComponent:theurl];
    
    //请求https所需加程序:
    manager.securityPolicy.allowInvalidCertificates = YES;

    [manager POST:url parameters:body progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [responseObject writeToFile:cachePath atomically:YES];
        BOOL isCache = [NSKeyedArchiver archiveRootObject:responseObject toFile:cachePath];
        if (isCache) {
            NSLog(@"缓存成功");
        }
        sucess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
//        NSLog(@"%@", error);
        id data = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
        NSLog(@"有缓存");
        if (data != NULL) {
            sucess(data);
        }
        else
        {
            NSLog(@"没有");
        }
    }];


}

+ (NSString *)cachedFileNameForKey:(NSString *)key {
    const char *str = [key UTF8String];
    if (str == NULL) {
        str = "";
    }
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    return filename;
}


+ (void)sendPOSTWithUrl:(NSString *)url WithImageData:(NSData *)data WithName:(NSString *)string parameters:(NSDictionary *)dict success:(blockOfSuccess)successBlock fail:(blockOfFailuure)failBlock progress:(blockOfProgress)progressBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];//初始化请求对象
    
    // 允许https
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//设置服务器允许的请求格式内容
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html;charset=utf-8", @"multipart/form-data", nil];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置时间格式
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
    
    [manager POST:url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:string fileName:fileName mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progressBlock(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock(error);
    }];
    
    
}

#endif
@end
