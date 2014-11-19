//
//  HABViewVC.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-23.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABViewVC.h"
#import "TestCell.h"

@interface HABViewVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HABViewVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //    _tableView.backgroundColor = [UIColor yellowColor];
    //    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestCell *cell =
        [HABTableViewCell cellForTableView:tableView withStyle:UITableViewCellStyleDefault];
    cell.textLabel.text = @"dsfdsf";
    cell.habSeparatorStyle = HABTableViewCellSeparatorStyleCustom;
    cell.habSelectionStyle = HABTableViewCellSelectionStyleCustom;
    cell.habSeparatorColor = [UIColor redColor];
    //    cell.habBackGroundColor = [UIColor redColor];
    //    cell.habSelectedBackGroundColor = [UIColor yellowColor];

    [cell reset];
    return cell;
}

@end
