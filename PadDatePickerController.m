//
//  PadDatePickerController.m
//  CeilingsAPI
//
//  Created by user914135 on 2/3/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadDatePickerController.h"
#import "PadCalendarMonthController.h"
//#import "MonthPickerController.h"

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
    
    [self.picker selectRow:self.day - 1 inComponent:0 animated:false];
    [self.picker selectRow:self.month - 1 inComponent:1 animated:false];
    [self.picker selectRow:self.year - 2000 inComponent:2 animated:false];
    
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
    [okButton addTarget:self action: @selector(hidePickerAndApply:) forControlEvents:UIControlEventTouchUpInside];
    
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

- (void)hidePickerAndApply:(UITapGestureRecognizer *)recognizer {
    [self.view removeFromSuperview];
    [self.controller.dim.view removeFromSuperview];
    
    int yearRow = [self.picker selectedRowInComponent:2];
    int year = 2000 + yearRow;
    
    self.controller.year = year;
    switch ([self.picker selectedRowInComponent:0]) {
        case 0:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Январь %d", year]];
            break;
        case 1:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Февраль %d", year]];
            break;
        case 2:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Март %d", year]];
            break;
        case 3:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Апрель %d", year]];
            break;
        case 4:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Май %d", year]];
            break;
        case 5:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Июнь %d", year]];
            break;
        case 6:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Июль %d", year]];
            break;
        case 7:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Август %d", year]];
            break;
        case 8:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Сентябрь %d", year]];
            break;
        case 9:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Октябрь %d", year]];
            break;
        case 10:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Ноябрь %d", year]];
            break;
        case 11:
            [self.controller.navigationItem setTitle:[NSString stringWithFormat:@"Декабрь %d", year]];
    }
    int month = [self.picker selectedRowInComponent:1];
    
    int index = (year - 2000) * 12 + month;
    ((PadCalendarMonthController *) self.controller.monthPages[index]).selected = [self.picker selectedRowInComponent:0] + 1;
    for (int i = 0; i < [self.controller.monthPages count]; i++) {
        if (i == index) {
            ((PadCalendarMonthController *) self.controller.monthPages[index]).calendar.selected = [self.picker selectedRowInComponent:0] + 1;
            [((PadCalendarMonthController *) self.controller.monthPages[index]).calendar setNeedsDisplay];
        } else {
            ((PadCalendarMonthController *) self.controller.monthPages[i]).calendar.selected = [self.picker selectedRowInComponent:0] + 1;
            [((PadCalendarMonthController *) self.controller.monthPages[i]).calendar setNeedsDisplay];
        }
    }
    
    [self.controller setDay:[self.picker selectedRowInComponent:0] + 1];
    [self.controller setMonth:month + 1];
    [self.controller setYear:year];
    //NSLog(@">>>>>%d", self.currentMonth);
    [self.controller fillOrdersList];
    [self.controller.dailyTasksList reloadData];
    
    [self.controller.pageView setViewControllers:@[self.controller.monthPages[index]] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
}

- (void)cancelAction:(UIButton *)sender {
    [self.view removeFromSuperview];
    [self.controller.dim.view removeFromSuperview];
}

@end
