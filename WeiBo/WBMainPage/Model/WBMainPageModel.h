//
//  WBMainPageModel.h
//  WeiBo
//
//  Created by guozhengxing on 2021/3/23.
//

#import <UIKit/UIKit.h>

@class WBMainPageViewController;
NS_ASSUME_NONNULL_BEGIN

@interface WBMainPageModel : NSObject


- (instancetype)initWithViewController:(WBMainPageViewController *)viewController andFavTableVIew:(UITableView *)favTableView andRecommodTableView:(UITableView *)recommondTableView;
@end

NS_ASSUME_NONNULL_END
