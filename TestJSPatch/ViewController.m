//
//  ViewController.m
//  TestJSPatch
//
//  Created by wuwei on 16/7/20.
//  Copyright © 2016年 wuwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* mytableView;
@property(nonatomic,strong)NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    UITableView* tv = [[UITableView alloc]initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
    self.view.backgroundColor = [UIColor clearColor];
    self.mytableView = tv;
    self.mytableView.delegate = self;
    self.mytableView.dataSource = self;
    [self.view addSubview:self.mytableView];
    self.dataSource = @[@"aaaa",@"bbbbb"];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* i=  @"cell";
    UITableViewCell* cell = [tableView  dequeueReusableCellWithIdentifier:i];
    if (cell == nil ) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:i];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%li行",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // cell有三行，当我点击第三行的时候肯定会数组越界导致 crash
    //  还好我在JS里弥补了这个bug，详情请看JS里的处理

    NSString *content = self.dataSource[indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:content delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
