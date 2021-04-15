//
//  WBContentModel.m
//  WeiBo
//
//  Created by guozhengxing on 2021/4/6.
//

#import "WBContentModel.h"

@implementation WBUserModel

+ (JSONKeyMapper*)keyMapper
{
    return [JSONKeyMapper mapperForSnakeCase];
}

@end

@implementation WBStatusesModel

+ (JSONKeyMapper*)keyMapper
{
    return [JSONKeyMapper mapperForSnakeCase];
}

@end

@implementation WBContentModel

+ (JSONKeyMapper*)keyMapper
{
    return [JSONKeyMapper mapperForSnakeCase];
}

@end
