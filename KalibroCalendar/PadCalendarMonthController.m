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

#import <time.h>

@implementation PadCalendarMonthController

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height {
    self = [super init];
    self.year = year;
    self.height = height;
    
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self appendYearLabel];
    
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
}

- (void)appendYearLabel {
    self.yearLabel = [UILabel new];
    [self.yearLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:32]];
    //[self.yearLabel setBackgroundColor:[UIColor redColor]];
    self.yearLabel.text = [NSString stringWithFormat:@"февраль %ld", self.year];
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
