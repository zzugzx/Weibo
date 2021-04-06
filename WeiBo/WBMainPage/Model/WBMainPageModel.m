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
@property (nonatomic, strong) UITableView *favTableView;
@property (nonatomic, strong) UITableView *recommondTableView;
@property (nonatomic, assign) BOOL isRecommondPage;

@end

@implementation WBMainPageModel

- (instancetype)initWithViewController:(WBMainPageViewController *)viewController andFavTableVIew:(UITableView *)favTableView andRecommodTableView:(UITableView *)recommondTableView
{
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
        self.viewController = viewController;
        self.recommondTableView = recommondTableView;
        self.favTableView = favTableView;
        
        [self configTableView];
        [self configData];
        [self.favTableView reloadData];
        [self.recommondTableView reloadData];
    }
    return self;
}

- (void)configTableView {
    self.favTableView.delegate = self;
    self.favTableView.dataSource = self;
    self.recommondTableView.delegate = self;
    self.recommondTableView.dataSource = self;
    
    [self.favTableView registerClass:[WBMainPageTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WBMainPageTableViewCell class])];
    [self.recommondTableView registerClass:[WBMainPageTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WBMainPageTableViewCell class])];
}

- (void)configData {
    
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
    if (self.isRecommondPage) {
        cell = [self.recommondTableView dequeueReusableCellWithIdentifier:NSStringFromClass([WBMainPageTableViewCell class])];
    } else {
        cell = [self.favTableView dequeueReusableCellWithIdentifier:NSStringFromClass([WBMainPageTableViewCell class])];
    }
    [cell refreshWithData:nil];
    return cell;
}
@end
