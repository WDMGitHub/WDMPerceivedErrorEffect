//
//  ViewController.m
//  DMPerceivedErrorEffect
//
//  Created by demin on 16/8/8.
//  Copyright © 2016年 Demin. All rights reserved.
//

#import "ViewController.h"
#import "DMPerceivedErrorCell.h"

#define DMRowHeight 200

#define DMCount 10

#define DMGetImage(row) [UIImage imageNamed:[NSString stringWithFormat:@"%zd",row]]


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *perceivedErrorTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
}

- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.rowHeight = DMRowHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor blackColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.perceivedErrorTableView = tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return DMCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DMPerceivedErrorCell *cell = [DMPerceivedErrorCell perceivedErrorCellFromXib:tableView];
    cell.backgroundImage.image = DMGetImage(indexPath.row + 1);
    return cell;
}

//滚动监听
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //获取表视图的可见单元格。（可见的视图）
    NSArray *visibleCells = [self.perceivedErrorTableView visibleCells];
    for (DMPerceivedErrorCell *cell in visibleCells) {
        //可见视图设置->背景图片y值
        [cell cellOnTableView:self.perceivedErrorTableView didScrollView:self.view];
    }
}

//视图加载完成再调用scrollViewDidScroll方法
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self scrollViewDidScroll:[[UIScrollView alloc] init]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
