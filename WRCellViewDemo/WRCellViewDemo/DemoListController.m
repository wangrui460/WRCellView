//
//  DemoListController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/14.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "DemoListController.h"
#import "ViewController.h"
#import "MineInfoController.h"
#import "GaoDeSettingController.h"
#import "NBAController.h"
#import "ExternController.h"

@interface DemoListController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation DemoListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"DemoList";
    [self.view addSubview:self.tableView];
}

#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:nil];
    NSString *str = nil;
    switch (indexPath.row) {
        case 0:
            str = @"常用Style";
            break;
        case 1:
            str = @"微信个人信息";
            break;
        case 2:
            str = @"高德地图我的";
            break;
        case 3:
            str = @"NBA";
            break;
        case 4:
            str = @"添加自定义view";
            break;
        default:
            break;
    }
    cell.textLabel.text = str;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            ViewController *basicVC = [ViewController new];
            [self.navigationController pushViewController:basicVC animated:YES];
        }
            break;
        case 1:
        {
            MineInfoController *mineInfoVC = [MineInfoController new];
            [self.navigationController pushViewController:mineInfoVC animated:YES];
        }
            break;
        case 2:
        {
            GaoDeSettingController *gdSettingVC = [GaoDeSettingController new];
            [self.navigationController pushViewController:gdSettingVC animated:YES];
        }
            break;
        case 3:
        {
            NBAController *nbaVC = [NBAController new];
            [self.navigationController pushViewController:nbaVC animated:YES];
        }
            break;
        case 4:
        {
            ExternController *externVC = [ExternController new];
            [self.navigationController pushViewController:externVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
