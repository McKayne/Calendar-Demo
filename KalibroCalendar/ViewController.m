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
    
    PadCalendarController *calendar = [PadCalendarController new];
    [self.navigationController pushViewController:calendar animated:true];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
