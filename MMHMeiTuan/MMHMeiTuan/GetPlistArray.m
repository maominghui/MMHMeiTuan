//
//  GetPlistArray.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/14.
//  Copyright (c) 2015年 com.nyist. All rights reserved.
//

#import "GetPlistArray.h"

@implementation GetPlistArray

+(NSArray *)arrayWithString:(NSString *)string{

    NSString *plistPath = [[NSBundle mainBundle]pathForResource:string ofType:nil];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:plistPath];
    return array;
}
@end
