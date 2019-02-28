//
//  ViewController.m
//  KalibroCalendar
//
//  Created by для интернета on 14.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import "ViewController.h"
#import "CalendarController.h"
#import "PadCalendarController.h"

#import "ModalTimeChooser.h"
#import "ModalCalendarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@""];
    
    self.calendarButton = [UIButton new];
    [self.view addSubview:self.calendarButton];
    self.calendarButton.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *left = [self.calendarButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0.0];
    NSLayoutConstraint *right = [self.calendarButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0.0];
    NSLayoutConstraint *top = [self.calendarButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0.0];
    NSLayoutConstraint *bottom = [self.calendarButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0.0];
    [left setActive:true];
    [right setActive:true];
    [top setActive:true];
    [bottom setActive:true];
    
    [self.calendarButton setTitle:@"Calendar" forState:UIControlStateNormal];
    [self.calendarButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [self.calendarButton addTarget:self action:@selector(appendCalendar:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)appendCalendar:(UIButton *)sender {
    NSLog(@"Calendar");
    
    //[self.navigationController.navigationBar setBackgroundColor:[UIColor yellowColor]];
    
    //CalendarController *controller = [CalendarController new];
    //[self.navigationController pushViewController:controller animated:true];
    
    //PadCalendarController *calendar = [PadCalendarController new];
    //[self.navigationController pushViewController:calendar animated:true];

    UIViewController *dim = [UIViewController new];
    [dim.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f]];
    [self.view addSubview:dim.view];
    
    /*ModalTimeChooser *time = [[ModalTimeChooser alloc] init];
    time.frame = self.view.frame;
    time.view.frame = CGRectMake(self.view.frame.size.width / 4 / 2, self.view.frame.size.height / 2 / 2, self.view.frame.size.width * 3 / 4, self.view.frame.size.height / 2);
    time.view.layer.cornerRadius = 20.0;
    [self.view addSubview:time.view];
    [self addChildViewController:time];*/
    
    ModalCalendarController *calendar = [[ModalCalendarController alloc] init];
    calendar.frame = self.view.frame;
    calendar.view.frame = CGRectMake(self.view.frame.size.width / 4 / 2, self.view.frame.size.height / 2 / 2, self.view.frame.size.width * 3 / 4, self.view.frame.size.height / 2);
    calendar.view.layer.cornerRadius = 20.0;
    [self.view addSubview:calendar.view];
    [self addChildViewController:calendar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
