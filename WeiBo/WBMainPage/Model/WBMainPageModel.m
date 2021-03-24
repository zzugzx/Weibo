//
//  WBMainPageModel.m
//  WeiBo
//
//  Created by guozhengxing on 2021/3/23.
//

#import "WBMainPageModel.h"
#import "WBMainPageViewController.h"
#import "WBMainPageTableViewCell.h"

@interface WBMainPageModel () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) WBMainPageViewController *viewController;
@property (nonatomic, strong) UITableView *favTableVew;
@property (nonatomic, strong) UITableView *recommondTableVew;
@property (nonatomic, assign) BOOL isRecommondPage;

@end

@implementation WBMainPageModel

- (instancetype)initWithViewController:(WBMainPageViewController *)viewController andFavTableVIew:(UITableView *)favTableView andRecommodTableView:(UITableView *)recommondTableView
{
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
        self.viewController = viewController;
        self.recommondTableVew = recommondTableView;
        self.favTableVew = favTableView;
        
        [self configTableView];
    }
    return self;
}

- (void)configTableView {
    self.favTableVew.delegate = self;
    self.favTableVew.dataSource = self;
    self.recommondTableVew.delegate = self;
    self.recommondTableVew.dataSource = self;
    
    [self.favTableVew registerClass:[WBMainPageTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WBMainPageTableViewCell class])];
    [self.recommondTableVew registerClass:[WBMainPageTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WBMainPageTableViewCell class])];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WBMainPageTableViewCell *cell = nil;
//    if (self.isRecommondPage) {
//        cell = [self.recommondTableVew dequeueReusableCellWithIdentifier:NSStringFromClass([WBMainPageTableViewCell class])];
//    } else {
//        cell = [self.favTableVew dequeueReusableCellWithIdentifier:NSStringFromClass([WBMainPageTableViewCell class])];
//    }
    if (cell == nil) {
        cell = [[WBMainPageTableViewCell alloc] init];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}
@end
