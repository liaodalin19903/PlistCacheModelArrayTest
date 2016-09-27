//
//  CacheManager.h
//  缓存01
//
//  Created by 优谱德 on 16/9/27.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CacheManager : NSObject

+ (CacheManager *)sharedManager;

//
- (NSMutableArray *)getModelArrayFromPath:(NSString *)path withName:(NSString *)name;

- (BOOL)cacheModelArray:(NSMutableArray *)modelArr toPath:(NSString *)path withName:(NSString *)name;

// 清除
- (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;

- (BOOL)clearCachesWithFilePath:(NSString *)path;

- (NSArray *)getAllFileNames:(NSString *)dirPath;

@end
