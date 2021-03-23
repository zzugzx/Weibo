//
//  WBMainPageViewController.m
//  WeiBo
//
//  Created by guozhengxing on 2021/3/22.
//

#import "WBMainPageViewController.h"
#import "UIColor+Extension.h"
#import "HMSegmentedControl.h"


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
    
    [self setupSegmentedControl];
}

- (void)setupSegmentedControl {
    HMSegmentedControl *segmented = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"推荐", @"关注"]];
    segmented.frame = CGRectMake(self.view.bounds.size.width / 2 - 100, 4, 200, 40);
    segmented.backgroundColor = [UIColor clearColor];
    segmented.selectionIndicatorHeight = 3.0f;
    segmented.selectionIndicatorColor = [UIColor colorWithHexString:@"#F84416"];
    segmented.selectionStyle = HMSegmentedControlTypeText;
    segmented.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl = segmented;
    [self.navigationController.navigationBar addSubview:segmented];
    
}

- (IBAction)photo {
    
}

- (IBAction)add {
    
}

@end
