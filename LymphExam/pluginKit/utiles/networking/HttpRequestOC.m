//
//  HttpRequestOC.m
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

#import "HttpRequestOC.h"
#import "AFURLSessionManager.h"
#import "AFHTTPSessionManager.h"


@implementation HttpRequestOC



+(void)httpPost:(NSString*)URLString body:(NSDictionary*)httpBody success:(void(^)(id respond))success failure:(void(^)(NSDictionary *errorDic))failure{
    
    
    if (![URLString hasPrefix:@"http"]) {
        URLString = [URLString stringByAppendingString:URLString];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *encodeUrlString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager POST:encodeUrlString parameters:httpBody progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@" \n-----------------  \n%@ \n%@ \n%@ \n-----------------",URLString,httpBody,responseObject);
        
        success(responseObject);
        
//        NSDictionary *rspDt = (NSDictionary*)responseObject;
//        NSString *code = [NSString stringWithFormat:@"%@",[rspDt valueForKey:@"code"]];
//        if ([code isEqualToString:@"1"]) {
//            id respondRlt = [rspDt valueForKey:@"result"];
//            
//            success(respondRlt);
//            
//            
//            
//            
//        }else{
//            NSLog(@"msg = %@",[rspDt valueForKey:@"msg"]);
//            
//            NSDictionary *userInfo = @{@"code":[NSString stringWithFormat:@"%@",code],
//                                       @"message":[NSString stringWithFormat:@"%@",[rspDt valueForKey:@"msg"]],};
//            failure(userInfo);
//        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        success(@"");
    }];
    
}

+(void)httpUpload:(NSString *)URLString body:(NSDictionary *)httpBody imageData:(UIImage*)image success:(void (^)(id))success failure:(void (^)(NSDictionary *errorDic))failure{
    

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *encodeUrlString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager POST:encodeUrlString parameters:httpBody constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSData *imgData = UIImagePNGRepresentation(image);
        
        NSString *fileName = [NSString stringWithFormat:@"%.0f.png",[NSDate timeIntervalSinceReferenceDate]];
        
        [formData appendPartWithFileData:imgData name:@"avatar" fileName:fileName mimeType:@"image/png"];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"总大小：%lld,已完成:%lld",uploadProgress.totalUnitCount,uploadProgress.completedUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
//        NSData *rspData = (NSData*)responseObject;
//        NSString *dataStr = [[NSString alloc] initWithData:rspData encoding:NSUTF8StringEncoding];
//        id rspJson = dataStr.JSONValue;
//        NSLog(@" \n-------------------------开始---------------------------------  \n%@ \n%@ \n------------------------结束----------------------------------",URLString,rspJson);
//        NSDictionary *rspDt = (NSDictionary*)rspJson;
//        NSString *code = [NSString stringWithFormat:@"%@",[rspDt valueForKey:@"code"]];
//        if ([code isEqualToString:@"1"]) {
//            id respondRlt = [rspDt valueForKey:@"result"];
//            
//            success(respondRlt);
//            
//        }else{
//            NSLog(@"msg = %@",[rspDt valueForKey:@"msg"]);
//            
//            NSDictionary *userInfo = @{@"code":[NSString stringWithFormat:@"%@",code],
//                                       @"message":[NSString stringWithFormat:@"%@",[rspDt valueForKey:@"msg"]],};
//            failure(userInfo);
//            
//        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}





@end
