//
//  Model.h
//  缓存01
//
//  Created by 优谱德 on 16/9/27.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject <NSCoding>

@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *name;


+ (Model *)initModelWithDic:(NSDictionary *)dic;

@end
