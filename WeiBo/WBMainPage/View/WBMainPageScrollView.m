//
//  WBMainPageScrollView.m
//  WeiBo
//
//  Created by guozhengxing on 2021/3/23.
//

#import "WBMainPageScrollView.h"
#import "UIColor+Extension.h"
#import <Masonry/Masonry.h>

@interface WBMainPageScrollView ()



@end

@implementation WBMainPageScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.recommondTableView];
    [self addSubview:self.favTableView];
}

- (UITableView *)recommondTableView {
    if (!_recommondTableView) {
        _recommondTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height) style:UITableViewStylePlain];
        _recommondTableView.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        _recommondTableView.refreshControl = [[UIRefreshControl alloc] init];
        _recommondTableView.refreshControl.tintColor = [UIColor grayColor];
        _recommondTableView.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
        [_recommondTableView.refreshControl addTarget:self action:@selector(refreshrecommondAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _recommondTableView;
}

- (UITableView *)favTableView {
    if (!_favTableView) {
        _favTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) style:UITableViewStylePlain];
        _favTableView.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        _favTableView.refreshControl = [[UIRefreshControl alloc] init];
        _favTableView.refreshControl.tintColor = [UIColor grayColor];
        _favTableView.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
        [_favTableView.refreshControl addTarget:self action:@selector(refreshfavAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _favTableView;
}

#pragma mark - Action
- (IBAction)refreshrecommondAction:(UIRefreshControl *)refreshControl {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.recommondTableView reloadData];
            if ([refreshControl isRefreshing]) {
                [refreshControl endRefreshing];
            }
        });
}

- (IBAction)refreshfavAction:(UIRefreshControl *)refreshControl {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.favTableView reloadData];
            if ([refreshControl isRefreshing]) {
                [refreshControl endRefreshing];
            }
        });
}
@end
