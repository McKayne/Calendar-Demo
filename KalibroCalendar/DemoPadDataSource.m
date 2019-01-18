//
//  DemoPadDataSource.m
//  KalibroCalendar
//
//  Created by для интернета on 17.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DemoPadDataSource.h"
#import "CustomSeparator.h"

@implementation DemoPadDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    
    UILabel *timeA = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 67.5, 40)];
    [timeA setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
    [timeA setTextAlignment:NSTextAlignmentRight];
    switch (indexPath.row) {
        case 0:
            [timeA setText:@"09:00"];
            break;
        case 1:
            [timeA setText:@"14:00"];
            break;
        case 2:
            [timeA setText:@"20:00"];
            break;
        case 3:
            [timeA setText:@"23:53"];
            break;
    }
    [cell.contentView addSubview:timeA];
    
    UILabel *timeB = [[UILabel alloc] initWithFrame:CGRectMake(30, 40, 67.5, 40)];
    [timeB setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:20]];
    [timeB setTextAlignment:NSTextAlignmentRight];
    switch (indexPath.row) {
        case 0:
            [timeB setText:@"10:00"];
            break;
        case 1:
            [timeB setText:@"18:00"];
            break;
        case 2:
            [timeB setText:@"20:50"];
            break;
        case 3:
            [timeB setText:@"03:40"];
            break;
    }
    [cell.contentView addSubview:timeB];
    
    CustomSeparator *separator = [[CustomSeparator alloc] initWithFrame:CGRectMake(110, 5, 1, 80)];
    [separator setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0]];
    [cell.contentView addSubview:separator];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(120, 0, 300, 40)];
    [address setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
    [address setTextAlignment:NSTextAlignmentLeft];
    switch (indexPath.row) {
        case 0:
            [address setText:@"Улица Циолковского 163"];
            break;
        case 1:
            [address setText:@"Улица Плющиха, 37/21 13"];
            break;
        case 2:
            [address setText:@"Улица Сакко и Ванцетти 74"];
            break;
        case 3:
            [address setText:@"Улица Саперов 2"];
            break;
    }
    [cell.contentView addSubview:address];
    
    UILabel *task = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 230, 40)];
    [task setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:20]];
    [task setTextAlignment:NSTextAlignmentLeft];
    switch (indexPath.row) {
        case 0:
            [task setText:@"1.43 км"];
            break;
        case 1:
            [task setText:@"0.89 км"];
            break;
        case 2:
            [task setText:@"12.71 км"];
            break;
        case 3:
            [task setText:@"9.08 км"];
            break;
    }
    [cell.contentView addSubview:task];
    
    UILabel *distance;
    distance = [[UILabel alloc] initWithFrame:CGRectMake(self.width - 210, 0, 160, 40)];
    [distance setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
    [distance setTextAlignment:NSTextAlignmentRight];
    [distance setText:@"Замерить потолки"];
    [cell.contentView addSubview:distance];
    
    UIImageView *accept = [[UIImageView alloc] initWithFrame:CGRectMake(self.width - 220, 40, 187.5, 32.25)];
    [accept setImage:[UIImage imageNamed:@"accept.png"]];
    [cell.contentView addSubview:accept];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0f;
}

@end
