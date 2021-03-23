//
//  ViewController.m
//  WeiBo
//
//  Created by guozhengxing on 2021/3/22.
//

#import "ViewController.h"
#import "WBMainPageViewController.h"

@interface ViewController ()

@property (nonatomic, strong) WBMainPageViewController *mainPageVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController pushViewController:self.mainPageVC animated:YES]; 
}

- (WBMainPageViewController *)mainPageVC {
    if (!_mainPageVC) {
        _mainPageVC = [[WBMainPageViewController alloc] init];
    }
    return _mainPageVC;
}


@end
