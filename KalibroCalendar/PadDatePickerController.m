//
//  PadDatePickerController.m
//  KalibroCalendar
//
//  Created by для интернета on 17.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadDatePickerController.h"
#import "MonthPickerController.h"
#import "ModalOrdersList.h"

@implementation PadDatePickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.months = @[@"января", @"февраля", @"марта", @"апреля", @"мая", @"июня", @"июля", @"августа", @"сентября", @"октября", @"ноября", @"декабря"];
    
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 500, 80)];
    [header setTextAlignment:NSTextAlignmentCenter];
    [header setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [header setText:@"Пожалуйста, выберите дату"];
    [self.view addSubview:header];
    //ViewController.performAutolayoutConstants(subview: header, view: view, left: 0, right: 0, top: 0, bottom: -150)
    
    self.picker = [[UIPickerView alloc] initWithFrame:CGRectMake(50, 50, 400, 150)];
    [self.view addSubview:self.picker];
    self.picker.delegate = self;
    self.picker.dataSource = self;
    
    NSDate *today = [NSDate new];
    NSDateFormatter *yearFormatter = [NSDateFormatter new];
    NSDateFormatter *monthFormatter = [NSDateFormatter new];
    NSDateFormatter *dayFormatter = [NSDateFormatter new];
    yearFormatter.dateFormat = @"yyyy";
    monthFormatter.dateFormat = @"MM";
    dayFormatter.dateFormat = @"dd";
    
    [self.picker selectRow:[[dayFormatter stringFromDate:today] integerValue] - 1 inComponent:0 animated:false];
    [self.picker selectRow:[[monthFormatter stringFromDate:today] integerValue] - 1 inComponent:1 animated:false];
    [self.picker selectRow:[[yearFormatter stringFromDate:today] integerValue] - 2000 inComponent:2 animated:false];
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 80, 30)];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelButton setTitle:@"Отмена" forState:UIControlStateNormal];
    //[cancelButton.titleLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [self.view addSubview:cancelButton];
    [cancelButton addTarget:self action: @selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *okButton = [[UIButton alloc] initWithFrame:CGRectMake(410, 200, 80, 30)];
    [okButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [self.view addSubview:okButton];
    [okButton addTarget:self action: @selector(openMonthPicker:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return 31;
        case 1:
            return 12;
        default:
            return 30;
    }
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", row + 1]];
        case 1:
            return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", self.months[row]]];
        default:
            return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", row + 2000]];
    }
}

- (void)openMonthPicker:(UIButton *)sender {
    NSLog(@"Month");
    
    [self.view removeFromSuperview];
    
    ModalOrdersList *orders = [[ModalOrdersList alloc] initWithDate:[self.picker selectedRowInComponent:2] + 2000 month:[self.picker selectedRowInComponent:1] + 1 day:[self.picker selectedRowInComponent:0] + 1 frame:self.controller.view.frame];
    orders.dim = self.dim;
    orders.calendarController = self.controller;
    //year.calendar = self.calendar;
    orders.view.frame = CGRectMake(self.controller.view.frame.size.width / 4 / 2, self.controller.view.frame.size.height / 4 / 2, self.controller.view.frame.size.width * 3 / 4, self.controller.view.frame.size.height * 3 / 4);
    orders.view.layer.cornerRadius = 20.0;
    [self.controller.view addSubview:orders.view];
    [self.controller addChildViewController:orders];
    
    //[self.controller]
    
    //[self.dim.view removeFromSuperview];
    
    /*[self.view removeFromSuperview];
    MonthPickerController *month = [MonthPickerController new];
    month.calendar = self.calendar;
    month.view.frame = CGRectMake(self.calendar.view.frame.size.width / 2 - 125, self.calendar.view.frame.size.height / 2 - 125, 250, 250);
    month.view.layer.cornerRadius = 20.0;
    [self.calendar.view addSubview:month.view];
    [self.calendar addChildViewController:month];*/
}

- (void)cancelAction:(UIButton *)sender {
    [self.view removeFromSuperview];
    [self.dim.view removeFromSuperview];
}

@end
