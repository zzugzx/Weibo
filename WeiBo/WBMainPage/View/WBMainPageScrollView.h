//
//  WBMainPageScrollView.h
//  WeiBo
//
//  Created by guozhengxing on 2021/3/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WBMainPageScrollView : UIScrollView

@property (nonatomic, strong) UITableView *recommondTableView;
@property (nonatomic, strong) UITableView *favTableView;

@end

NS_ASSUME_NONNULL_END
