//
//  ViewController.m
//  SUTableView
//
//  Created by KevinSu on 16/8/6.
//  Copyright © 2016年 KevinSu. All rights reserved.
//

#import "ViewController.h"
#import "SUTableView.h"
#import "LiveCell.h"

static NSString * liveCellID = @"liveCell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];

}

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[SUTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 150.0;
        [_tableView registerNib:[UINib nibWithNibName:@"LiveCell" bundle:nil] forCellReuseIdentifier:liveCellID];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LiveCell * cell = [self.tableView dequeueReusableCellWithIdentifier:liveCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.descLabel.text = [NSString stringWithFormat:@"第 %ld 个主播频道", indexPath.row + 1];
    return cell;
}



@end
