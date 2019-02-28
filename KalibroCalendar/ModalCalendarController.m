//
//  ModalCalendarController.m
//  KalibroCalendar
//
//  Created by для интернета on 27.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModalCalendarController.h"
#import "ModalCalendarMonth.h"

@implementation ModalCalendarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *startLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 3 / 4, 50)];
    [startLabel setTextColor:[UIColor orangeColor]];
    [startLabel setTextAlignment:NSTextAlignmentCenter];
    [startLabel setText:@"НАЧАЛО"];
    [self.view addSubview:startLabel];
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height / 2 - 75, 80, 30)];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelButton setTitle:@"Отмена" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    //[cancelButton.titleLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [self.view addSubview:cancelButton];
    [cancelButton addTarget:self action: @selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *okButton = [[UIButton alloc] initWithFrame:CGRectMake(160, self.view.frame.size.height / 2 - 75, 80, 30)];
    [okButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:okButton];
    [okButton addTarget:self action: @selector(okAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.picker = [[UIPickerView alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width * 3 / 4 - 100, self.view.frame.size.height / 2 - 125)];
    [self.view addSubview:self.picker];
    self.picker.delegate = self;
    self.picker.dataSource = self;
    
    self.pageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageView.delegate = self;
    self.pageView.dataSource = self;
    
    self.dayViews = [NSMutableArray array];
    self.monthPages = [[NSMutableArray alloc] initWithCapacity:12];
    for (int i = 0; i < 12; i++) {
        ModalCalendarMonth *page = [ModalCalendarMonth new];
        page.controller = self;
        page.year = 2019;
        page.month = i + 1;
        self.monthPages[i] = page;
    }
    
    self.currentIndex = 1;
    [self.pageView setViewControllers:@[self.monthPages[self.currentIndex]] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
    
    self.pageView.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height - 100);
    [self addChildViewController:self.pageView];
    [self.view addSubview:self.pageView.view];
    
    [self.pageView.view setHidden:true];
    
    self.yearSelected = false;
    
    /*UIPageViewController *pageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    pageView.delegate = self;
    pageView.dataSource = self;
    
    UIViewController *page = [UIViewController new];
    [page.view setBackgroundColor:[UIColor greenColor]];
    [pageView setViewControllers:@[page] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
    
    pageView.view.frame = CGRectMake(0, 50, self.view.frame.size.width * 3 / 4, self.view.frame.size.height / 2 - 125);
    [self addChildViewController:pageView];
    [self.view addSubview:pageView.view];*/
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 51;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", row + 2000]];
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

- (void)okAction:(UIButton *)sender {
    
    if (!self.yearSelected) {
        
        //NSLog(@)
        
        [self.picker setHidden:true];
        [self.pageView.view setHidden:false];
        
        self.yearSelected = true;
    } else {
        NSLog(@"TEST");
    }
}

@end
