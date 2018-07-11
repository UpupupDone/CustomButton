//
//  MasterViewController.m
//  CutomButton
//
//  Created by NBCB on 2018/1/24.
//  Copyright © 2018年 MInimalismC. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *arr;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arr = @[@"image 在👈，title 在👉", @"image 在👉 title 在👈", @"image 在👆，title 在👇", @"image 在👇 title 在👆"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.arr.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSInteger section = indexPath.section;
    cell.textLabel.text = self.arr[section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.arr = self.arr;
    vc.pushFlag = section;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
