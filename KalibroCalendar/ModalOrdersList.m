//
//  ModalOrdersList.m
//  KalibroCalendar
//
//  Created by для интернета on 25.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModalOrdersList.h"
#import "PadCalendarSortController.h"
#import "PadCalendarAscController.h"

@implementation ModalOrdersList

- (instancetype)initWithDate:(NSInteger)year month:(NSInteger)month day:(NSInteger)day frame:(CGRect)frame {
    self = [super init];
    
    self.year = year;
    self.month = month;
    self.day = day;
    self.frame = frame;
    
    return self;
}

- (void)openSortController:(UITapGestureRecognizer *)recognizer {
    UIViewController *dim = [UIViewController new];
    [dim.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f]];
    [self.calendarController.view addSubview:dim.view];
    
    PadCalendarSortController *asc = [PadCalendarSortController new];
    //self.ascModal = asc;
    //asc.controller = self;
    asc.view.frame = CGRectMake(self.calendarController.view.frame.size.width / 2 - 125, self.calendarController.view.frame.size.height / 2 - 125, 250, 250);
    asc.view.layer.cornerRadius = 20.0;
    [self.calendarController.view addSubview:asc.view];
    [self.calendarController addChildViewController:asc];
    
}

- (void)openAscController:(UITapGestureRecognizer *)recognizer {
    UIViewController *dim = [UIViewController new];
    [dim.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f]];
    [self.calendarController.view addSubview:dim.view];
    
    PadCalendarAscController *asc = [PadCalendarAscController new];
    //self.ascModal = asc;
    //asc.controller = self;
    asc.view.frame = CGRectMake(self.calendarController.view.frame.size.width / 2 - 125, self.calendarController.view.frame.size.height / 2 - 125, 250, 250);
    asc.view.layer.cornerRadius = 20.0;
    [self.calendarController.view addSubview:asc.view];
    [self.calendarController addChildViewController:asc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    CGFloat currentWidth = self.frame.size.width * 3 / 4;
    UITableView *ordersList = [[UITableView alloc] initWithFrame:CGRectMake(currentWidth / 4 / 2, 100, currentWidth * 3 / 4, self.frame.size.height / 2)];
    ordersList.dataSource = self;
    ordersList.delegate = self;
    [self.view addSubview:ordersList];
    
    UIImageView *sortView = [[UIImageView alloc] initWithFrame:CGRectMake(75, self.frame.size.height * 3 / 4 - 75, 50, 50)];
    sortView.image = [UIImage imageNamed:@"sort.png"];
    [sortView setUserInteractionEnabled:true];
    [sortView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openSortController:)]];
    [self.view addSubview:sortView];
    
    UIImageView *ascView = [[UIImageView alloc] initWithFrame:CGRectMake(currentWidth - 100, self.frame.size.height * 3 / 4 - 75, 50, 50)];
    ascView.image = [UIImage imageNamed:@"asc.png"];
    [ascView setUserInteractionEnabled:true];
    [ascView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openAscController:)]];
    [self.view addSubview:ascView];
    
    UIImageView *closeView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width * 3 / 4 - 100, 25, 50, 50)];
    closeView.image = [UIImage imageNamed:@"close.png"];
    [self.view addSubview:closeView];
    [closeView setUserInteractionEnabled:true];
    [closeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction:)]];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, self.frame.size.width * 3 / 4 - 50, 100)];
    [dateLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:32]];
    switch (self.month) {
        case 1:
            [dateLabel setText:[NSString stringWithFormat:@"%ld января %ld г.", self.day, self.year]];
            break;
        case 2:
            [dateLabel setText:[NSString stringWithFormat:@"%ld февраля %ld г.", self.day, self.year]];
            break;
        case 3:
            [dateLabel setText:[NSString stringWithFormat:@"%ld марта %ld г.", self.day, self.year]];
            break;
        case 4:
            [dateLabel setText:[NSString stringWithFormat:@"%ld апреля %ld г.", self.day, self.year]];
            break;
        case 5:
            [dateLabel setText:[NSString stringWithFormat:@"%ld мая %ld г.", self.day, self.year]];
            break;
        case 6:
            [dateLabel setText:[NSString stringWithFormat:@"%ld июня %ld г.", self.day, self.year]];
            break;
        case 7:
            [dateLabel setText:[NSString stringWithFormat:@"%ld июля %ld г.", self.day, self.year]];
            break;
        case 8:
            [dateLabel setText:[NSString stringWithFormat:@"%ld августа %ld г.", self.day, self.year]];
            break;
        case 9:
            [dateLabel setText:[NSString stringWithFormat:@"%ld сентября %ld г.", self.day, self.year]];
            break;
        case 10:
            [dateLabel setText:[NSString stringWithFormat:@"%ld октября %ld г.", self.day, self.year]];
            break;
        case 11:
            [dateLabel setText:[NSString stringWithFormat:@"%ld ноября %ld г.", self.day, self.year]];
            break;
        case 12:
            [dateLabel setText:[NSString stringWithFormat:@"%ld декабря %ld г.", self.day, self.year]];
    }
    [self.view addSubview:dateLabel];
}

- (void)closeAction:(UITapGestureRecognizer *)recognizer {
    NSLog(@"CLOSING");
    
    [self.view removeFromSuperview];
    [self.dim.view removeFromSuperview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    
    UILabel *timeA = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 67.5, 40)];
    [timeA setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
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
    
    UILabel *timeB = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 67.5, 40)];
    [timeB setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:16]];
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
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(80, 5, 1, 80)];
    [separator setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0]];
    [cell.contentView addSubview:separator];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 300, 40)];
    [address setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
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
    
    UILabel *task = [[UILabel alloc] initWithFrame:CGRectMake(90, 40, 230, 40)];
    [task setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:16]];
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
    distance = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width * 3 / 4 - 310, 0, 160, 40)];
    [distance setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [distance setTextAlignment:NSTextAlignmentRight];
    [distance setText:@"Замерить потолки"];
    [cell.contentView addSubview:distance];
    
    UIImageView *accept = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width * 3 / 4 - 320 + 187.5 * 3 / 4 / 4, 40, 187.5 * 3 / 4, 32.25 * 3 / 4)];
    [accept setImage:[UIImage imageNamed:@"accept.png"]];
    [cell.contentView addSubview:accept];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0f;
}

@end
