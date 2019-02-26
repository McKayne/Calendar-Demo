//
//  PadCalendarYearController.m
//  CeilingsAPI
//
//  Created by user914135 on 2/23/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadCalendarYearController.h"
#import "PadCalendarYear.h"
#import "PadDatePickerController.h"

#import <time.h>

@implementation PadCalendarYearController

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height {
    self = [super init];
    self.year = year;
    self.height = height;
    
    
    return self;
}

- (void)openDatePicker:(UITapGestureRecognizer *)recognizer {
    UIViewController *dim = [UIViewController new];
    [dim.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f]];
    [self.controller.view addSubview:dim.view];
    
    PadDatePickerController *year = [PadDatePickerController new];
    year.yearController = self;
    year.dim = dim;
    year.controller = self.controller;
    year.view.frame = CGRectMake(self.controller.view.frame.size.width / 2 - 250, self.controller.view.frame.size.height / 2 - 125, 500, 250);
    year.view.layer.cornerRadius = 20.0;
    [self.controller.view addSubview:year.view];
    [self.controller addChildViewController:year];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self appendYearLabel];
    
    UIImageView *refreshView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 75, 0, 50, 50)];
    refreshView.image = [UIImage imageNamed:@"refresh.png"];
    [self.view addSubview:refreshView];
    
    self.monthPages = [[NSMutableArray alloc] initWithCapacity:51];
    srand(time(NULL));
    for (int i = 0; i <= 50; i++) {
        PadCalendarYear *page = [[PadCalendarYear alloc] initWithDefaultYear:(2000 + i) height:self.height - 235.0 controller:self];
        page.calendarController = self.controller;
        self.monthPages[i] = page;
    }
    
    self.pageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageView.delegate = self;
    self.pageView.dataSource = self;
    
    self.currentIndex = self.year - 2000;
    [self.pageView setViewControllers:@[self.monthPages[self.currentIndex]] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
    
    self.pageView.view.frame = CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height - 120);
    [self addChildViewController:self.pageView];
    [self.view addSubview:self.pageView.view];
}

- (void)appendYearLabel {
    self.yearLabel = [UILabel new];
    [self.yearLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:32]];
    //[self.yearLabel setBackgroundColor:[UIColor redColor]];
    self.yearLabel.text = [NSString stringWithFormat:@"%ld", self.year];
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

@end
