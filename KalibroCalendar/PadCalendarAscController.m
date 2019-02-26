//
//  CalendarAscController.m
//  CeilingsAPI
//
//  Created by user914135 on 1/19/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadCalendarAscController.h"
//#import "BTServerManager.h"

@implementation PadCalendarAscController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.ascBy = self.controller.ascBy;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 80)];
    [header setTextAlignment:NSTextAlignmentCenter];
    [header setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [header setText:@"Сортировать заказы"];
    [self.view addSubview:header];
    
    UITableView *asc = [[UITableView alloc] initWithFrame:CGRectMake(12.5, 55, 200, 145)];
    [asc setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [asc setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:asc];
    asc.delegate = self;
    asc.dataSource = self;
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 80, 30)];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelButton setTitle:@"Отмена" forState:UIControlStateNormal];
    //[cancelButton.titleLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [self.view addSubview:cancelButton];
    [cancelButton addTarget:self action: @selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *okButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 200, 80, 30)];
    [okButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [self.view addSubview:okButton];
    [okButton addTarget:self action: @selector(performAsc:) forControlEvents:UIControlEventTouchUpInside];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    UIView *back = [UIView new];
    [back setBackgroundColor:[UIColor whiteColor]];
    [cell setSelectedBackgroundView:back];
    //[cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    [cell.textLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:15]];
    
    switch (indexPath.row) {
        case 0:
            [cell.textLabel setText:@"По убыванию"];
            break;
        case 1:
            [cell.textLabel setText:@"По возрастанию"];
    }
    
    if (self.ascBy == indexPath.row) {
        UIImageView *check = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check.png"]];
        CGRect frame = check.frame;
        frame.origin.x = 172.5;
        frame.origin.y = -5;
        check.frame = frame;
        [cell.contentView addSubview:check];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.ascBy = indexPath.row;
    [tableView reloadData];
}

- (void)performAsc:(UITapGestureRecognizer *)recognizer {
    [self.view removeFromSuperview];
    [self.controller.dim.view removeFromSuperview];
    
    /*self.controller.ascBy = self.ascBy;
    [self.controller fillArr];
    if ([self.controller.tasks.orders count] > 1) {
        switch (self.controller.sortBy) {
            case 1:
                [CalendarController qsDistance:self.controller.tasks.orders first:0 last:[self.controller.tasks.orders count] - 1];
                break;
            case 2:
                [CalendarController qsStart:self.controller.tasks.orders first:0 last:[self.controller.tasks.orders count] - 1];
                break;
            case 3:
                [CalendarController qsEnd:self.controller.tasks.orders first:0 last:[self.controller.tasks.orders count] - 1];
        }
        if (self.controller.ascBy == 0 && self.controller.sortBy > 0) {
            self.controller.tasks.orders = [[self.controller.tasks.orders reverseObjectEnumerator] allObjects];
        }
    }
    [self.controller fillOrdersList];
    [self.controller.dailyTasksList reloadData];*/
}

- (void)cancel:(UITapGestureRecognizer *)recognizer {
    [self.view removeFromSuperview];
    [self.controller.dim.view removeFromSuperview];
}

@end
