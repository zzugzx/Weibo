//
//  WBContentModel.h
//  WeiBo
//
//  Created by guozhengxing on 2021/4/6.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@class WBUserModel;

@protocol WBStatusesModel <NSObject>
@end



@interface WBUserModel : JSONModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatarLarge;

@end

@interface WBStatusesModel : JSONModel

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *timestampText;
@property (nonatomic, assign) NSUInteger repostsCount;
@property (nonatomic, assign) NSUInteger commentsCount;
@property (nonatomic, assign) NSUInteger attitudesCount;
@property (nonatomic, strong) WBUserModel *user;

@end

@interface WBContentModel : JSONModel

@property (nonatomic, strong) NSArray<WBStatusesModel> *statuses;

@end

NS_ASSUME_NONNULL_END
