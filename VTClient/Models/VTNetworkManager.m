//
//  VTNetworkManager.m
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTNetworkManager.h"
#import "Global.h"
#import "JsonParser.h"
#import "VTMovie.h"

@implementation VTNetworkManager

+(void)SearchMovieByKeyWord:(NSString *)keyword andCallback:(Callback)callback
{
    NSString *basepath = @"video/search!list.do";
    NSString *path = [NSString stringWithFormat:@"%@%@",host_url,basepath];
    NSDictionary *params = @{@"keyword":keyword};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSMutableArray *searches = [NSMutableArray array];
        if ([arr isMemberOfClass:[NSNull class]])
        {
            callback(arr);
            return ;
        }
        for (NSDictionary *movieDic in arr)
        {
            VTMovie *movie = [JsonParser paraserMovieByDic:movieDic];
            [searches addObject:movie];
        }
        callback(searches);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    NSLog(@"SerachMovieByKeyWord and Callback");
}

@end
