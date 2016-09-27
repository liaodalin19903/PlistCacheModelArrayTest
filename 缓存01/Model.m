//
//  Model.m
//  缓存01
//
//  Created by 优谱德 on 16/9/27.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id)initWithCoder:(NSCoder *)aDecoder {

    self = [super init];
    if (!self) {
        
        return nil;
    }
    
    self.img = [aDecoder decodeObjectForKey:@"img"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    
    return self;
    
}


- (void)encodeWithCoder:(NSCoder *)aCoder {

    [aCoder encodeObject:self.img forKey:@"img"];
    [aCoder encodeObject:self.name forKey:@"name"];
}

+ (Model *)initModelWithDic:(NSDictionary *)dic {

    Model *model = [[Model alloc] init];
    model.img = dic[@"img"];
    model.name = dic[@"name"];
    
    return model;
    
}


@end
