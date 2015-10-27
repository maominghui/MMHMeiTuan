//
//  MMHMineModel.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/27.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHMineModel.h"

@implementation MMHMineModel

+(instancetype)mineModel:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
    
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        /**
         *  这个地方如果用KVC 的话有局限性，因为他都是一一对应的，少一个都不行
         */
        //[self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        self.imageName = dict[@"image"];
    }
    return self;
}

@end
