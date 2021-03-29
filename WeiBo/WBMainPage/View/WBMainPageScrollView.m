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
        _recommondTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height) style:UITableViewStyleGrouped];
        _recommondTableView.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        _recommondTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01f)];
    }
    return _recommondTableView;
}

- (UITableView *)favTableView {
    if (!_favTableView) {
        _favTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) style:UITableViewStyleGrouped];
        _favTableView.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        _favTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01f)];
    }
    return _favTableView;
}
@end
