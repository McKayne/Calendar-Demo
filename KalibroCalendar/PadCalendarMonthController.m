//
//  PadCalendarMonthController.m
//  KalibroCalendar
//
//  Created by для интернета on 17.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadCalendarMonthController.h"
#import "PadCalendarMonth.h"
#import "PadCalendarSortController.h"
#import "PadCalendarAscController.h"
#import "PadDatePickerController.h"

#import <time.h>

@implementation PadCalendarMonthController

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height {
    self = [super init];
    self.year = year;
    self.height = height;
    
    
    return self;
}

- (void)openSortController:(UITapGestureRecognizer *)recognizer {
    UIViewController *dim = [UIViewController new];
    [dim.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f]];
    [self.controller.view addSubview:dim.view];
    
    PadCalendarSortController *asc = [PadCalendarSortController new];
    //self.ascModal = asc;
    //asc.controller = self;
    asc.view.frame = CGRectMake(self.controller.view.frame.size.width / 2 - 125, self.controller.view.frame.size.height / 2 - 125, 250, 250);
    asc.view.layer.cornerRadius = 20.0;
    [self.controller.view addSubview:asc.view];
    [self.controller addChildViewController:asc];
    
}

- (void)openAscController:(UITapGestureRecognizer *)recognizer {
    UIViewController *dim = [UIViewController new];
    [dim.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f]];
    [self.controller.view addSubview:dim.view];
    
    PadCalendarAscController *asc = [PadCalendarAscController new];
    //self.ascModal = asc;
    //asc.controller = self;
    asc.view.frame = CGRectMake(self.controller.view.frame.size.width / 2 - 125, self.controller.view.frame.size.height / 2 - 125, 250, 250);
    asc.view.layer.cornerRadius = 20.0;
    [self.controller.view addSubview:asc.view];
    [self.controller addChildViewController:asc];
    
}

- (void)openDatePicker:(UITapGestureRecognizer *)recognizer {
    UIViewController *dim = [UIViewController new];
    [dim.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f]];
    [self.controller.view addSubview:dim.view];
    
    PadDatePickerController *year = [PadDatePickerController new];
    year.dim = dim;
    year.controller = self.controller;
    year.view.frame = CGRectMake(self.controller.view.frame.size.width / 2 - 250, self.controller.view.frame.size.height / 2 - 125, 500, 250);
    year.view.layer.cornerRadius = 20.0;
    [self.controller.view addSubview:year.view];
    [self.controller addChildViewController:year];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self appendYearLabel];
    
    UIImageView *refreshView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 75, 0, 50, 50)];
    refreshView.image = [UIImage imageNamed:@"refresh.png"];
    [self.view addSubview:refreshView];
    
    UIImageView *sortView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 3 / 4 - 75, 0, 50, 50)];
    sortView.image = [UIImage imageNamed:@"sort.png"];
    [sortView setUserInteractionEnabled:true];
    [sortView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openSortController:)]];
    [self.view addSubview:sortView];
    
    UIImageView *ascView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 75, 0, 50, 50)];
    ascView.image = [UIImage imageNamed:@"asc.png"];
    [ascView setUserInteractionEnabled:true];
    [ascView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openAscController:)]];
    [self.view addSubview:ascView];
    
    self.monthPages = [[NSMutableArray alloc] initWithCapacity:51];
    srand(time(NULL));
    for (int i = 0; i < 12; i++) {
        PadCalendarMonth *page = [[PadCalendarMonth alloc] initWithDefaultYear:2017 month:(i + 1) height:self.height / 2 controller:self];
        self.monthPages[i] = page;
    }
    
    UIPageViewController *pageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    pageView.delegate = self;
    pageView.dataSource = self;
    
    self.currentIndex = 1;
    [pageView setViewControllers:@[self.monthPages[self.currentIndex]] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
    
    pageView.view.frame = CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height / 2);
    [self addChildViewController:pageView];
    [self.view addSubview:pageView.view];
    
    UITableView *ordersList = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 + 7, self.view.frame.size.width, self.view.frame.size.height / 2 - 170)];
    ordersList.dataSource = self;
    ordersList.delegate = self;
    [self.view addSubview:ordersList];
}

- (void)appendYearLabel {
    self.yearLabel = [UILabel new];
    [self.yearLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:32]];
    //[self.yearLabel setBackgroundColor:[UIColor redColor]];
    self.yearLabel.text = [NSString stringWithFormat:@"февраль %ld", self.year];
    [self.yearLabel setUserInteractionEnabled:true];
    [self.yearLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openDatePicker:)]];
    [self.view addSubview:self.yearLabel];
    
    self.yearLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint
     constraintWithItem:self.yearLabel
     attribute:NSLayoutAttributeLeft
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeLeftMargin
     multiplier:1.0
     constant:12.5].active = YES;
    
    [NSLayoutConstraint
     constraintWithItem:self.yearLabel
     attribute:NSLayoutAttributeRight
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeRightMargin
     multiplier:1.0
     constant:0.0].active = YES;
    
    [NSLayoutConstraint
     constraintWithItem:self.yearLabel
     attribute:NSLayoutAttributeTop
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeTopMargin
     multiplier:1.0
     constant:0.0].active = YES;
    
    [NSLayoutConstraint
     constraintWithItem:self.yearLabel
     attribute:NSLayoutAttributeBottom
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeBottomMargin
     multiplier:1.0
     constant:-(self.view.frame.size.height - 120.0)].active = YES;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    self.currentIndex = [self.monthPages indexOfObject:viewController];
    if (self.currentIndex == 0) {
        return nil;
    }
    int previousIndex = abs((self.currentIndex - 1) % [self.monthPages count]);
    self.currentIndex = previousIndex;
    
    return self.monthPages[self.currentIndex];
    //PadCalendarYear *page = [[PadCalendarYear alloc] initWithDefaultYear:self.year height:self.height - 235.0];
    //[page.view setBackgroundColor:[UIColor colorWithRed:((rand() % 256) / 255.0) green:((rand() % 256) / 255.0) blue:((rand() % 256) / 255.0) alpha:1.0]];
    //return page;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    self.currentIndex = [self.monthPages indexOfObject:viewController];
    if (self.currentIndex == [self.monthPages count] - 1) {
        return nil;
    }
    int nextIndex = abs((self.currentIndex + 1) % [self.monthPages count]);
    self.currentIndex = nextIndex;
    
    return self.monthPages[self.currentIndex];
    //PadCalendarYear *page = [[PadCalendarYear alloc] initWithDefaultYear:self.year height:self.height - 235.0];
    //[page.view setBackgroundColor:[UIColor colorWithRed:((rand() % 256) / 255.0) green:((rand() % 256) / 255.0) blue:((rand() % 256) / 255.0) alpha:1.0]];
    //return page;
}

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
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(110, 5, 1, 80)];
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
    distance = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 210, 0, 160, 40)];
    [distance setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
    [distance setTextAlignment:NSTextAlignmentRight];
    [distance setText:@"Замерить потолки"];
    [cell.contentView addSubview:distance];
    
    UIImageView *accept = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 220, 40, 187.5, 32.25)];
    [accept setImage:[UIImage imageNamed:@"accept.png"]];
    [cell.contentView addSubview:accept];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0f;
}

@end
