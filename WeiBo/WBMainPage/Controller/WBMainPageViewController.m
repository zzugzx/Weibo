//
//  WBMainPageViewController.m
//  WeiBo
//
//  Created by guozhengxing on 2021/3/22.
//

#import "WBMainPageViewController.h"
#import "UIColor+Extension.h"
#import "HMSegmentedControl.h"
#import <Masonry/Masonry.h>


@interface WBMainPageViewController ()

@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@end

@implementation WBMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self setupUI];
    
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavBar];
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

- (IBAction)photo {
    
}

- (IBAction)add {
    
}

- (HMSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"关注", @"推荐"]];
        _segmentedControl.backgroundColor = [UIColor clearColor];
        _segmentedControl.selectionIndicatorHeight = 3.0f;
        _segmentedControl.selectionIndicatorColor = [UIColor colorWithHexString:@"#F84416"];
        _segmentedControl.selectionStyle = HMSegmentedControlTypeText;
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    }
    return _segmentedControl;
}

@end
