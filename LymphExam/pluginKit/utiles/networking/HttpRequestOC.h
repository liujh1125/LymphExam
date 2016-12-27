//
//  HttpRequestOC.h
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface HttpRequestOC : NSObject

+(void)httpPost:(NSString*)URLString body:(NSDictionary*)httpBody success:(void(^)(id respond))success failure:(void(^)(NSDictionary *errorDic))failure;

+(void)httpUpload:(NSString *)URLString body:(NSDictionary *)httpBody imageData:(UIImage*)image success:(void (^)(id))success failure:(void (^)(NSDictionary *errorDic))failure;

@end
