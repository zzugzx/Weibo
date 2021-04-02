//
//  WBMainPageViewController.m
//  WeiBo
//
//  Created by guozhengxing on 2021/3/22.
//

#import "WBMainPageViewController.h"
#import "UIColor+Extension.h"
#import "HMSegmentedControl.h"
#import "WBMainPageScrollView.h"
#import "WBMainPageModel.h"
#import <Masonry/Masonry.h>


@interface WBMainPageViewController ()


@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) WBMainPageScrollView *scrollView;
@property (nonatomic, strong) WBMainPageModel *mainPageModel;

@end

@implementation WBMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.mainPageModel = [[WBMainPageModel alloc] initWithViewController:self andFavTableVIew:self.scrollView.favTableView andRecommodTableView:self.scrollView.recommondTableView];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    [self setupNavBar];
    
    [self.view addSubview:self.scrollView];
}

- (void)setupNavBar {
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"photo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(photo)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"add"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    [self.navigationController.navigationBar addSubview:self.segmentedControl];
    [self.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.navigationController.navigationBar).offset(125);
        make.right.mas_equalTo(self.navigationController.navigationBar).offset(-125);
        make.top.mas_equalTo(self.navigationController.navigationBar).offset(4);
        make.height.mas_equalTo(40);
    }];
}

- (HMSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"关注", @"推荐"]];
        _segmentedControl.backgroundColor = [UIColor clearColor];
        _segmentedControl.selectionIndicatorHeight = 3.0f;
        _segmentedControl.selectionIndicatorColor = [UIColor colorWithHexString:@"#F84416"];
        _segmentedControl.selectionStyle = HMSegmentedControlTypeText;
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        [_segmentedControl setPageScrollView:self.scrollView];
    }
    return _segmentedControl;
}

- (WBMainPageScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[WBMainPageScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

#pragma mark - Action
- (IBAction)refresh {
    
}

- (IBAction)photo {
    
}

- (IBAction)add {
    
}

@end
