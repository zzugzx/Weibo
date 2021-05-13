//
//  WBMainPageModel.m
//  WeiBo
//
//  Created by guozhengxing on 2021/3/23.
//

#import "WBMainPageModel.h"
#import "WBMainPageViewController.h"
#import "WBMainPageTableViewCell.h"
#import "WBContentModel.h"

@interface WBMainPageModel () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<WBStatusesModel> *items;
@property (nonatomic, strong) WBMainPageViewController *viewController;
@property (nonatomic, strong) UITableView *favTableView;
@property (nonatomic, strong) UITableView *recommondTableView;


@end

@implementation WBMainPageModel

- (instancetype)initWithViewController:(WBMainPageViewController *)viewController andFavTableVIew:(UITableView *)favTableView andRecommodTableView:(UITableView *)recommondTableView
{
    self = [super init];
    if (self) {
        self.viewController = viewController;
        self.recommondTableView = recommondTableView;
        self.favTableView = favTableView;
        
        [self configTableView];
        [self configData];
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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content" ofType:nil];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    WBContentModel *model = [[WBContentModel alloc] initWithDictionary:dict error:nil];
    self.items = model.statuses;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
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
    [cell refreshWithData:self.items[indexPath.row]];
    return cell;
}
@end
