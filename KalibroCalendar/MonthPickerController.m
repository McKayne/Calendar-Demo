//
//  MonthPickerController.m
//  KalibroCalendar
//
//  Created by для интернета on 16.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonthPickerController.h"

@implementation MonthPickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 80)];
    [header setTextAlignment:NSTextAlignmentCenter];
    [header setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [header setText:@"2019"];
    [self.view addSubview:header];
    //ViewController.performAutolayoutConstants(subview: header, view: view, left: 0, right: 0, top: 0, bottom: -150)
    
    self.picker = [[UIPickerView alloc] initWithFrame:CGRectMake(50, 50, 150, 150)];
    [self.view addSubview:self.picker];
    self.picker.delegate = self;
    self.picker.dataSource = self;
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 80, 30)];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelButton setTitle:@"Отмена" forState:UIControlStateNormal];
    //[cancelButton.titleLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [self.view addSubview:cancelButton];
    //[cancelButton addTarget:self action: @selector(cancel(sender:)), for: .touchUpInside)
    
    UIButton *okButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 200, 80, 30)];
    [okButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [self.view addSubview:okButton];
    [okButton addTarget:self action: @selector(hidePicker:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (row) {
        case 0:
            return [[NSAttributedString alloc] initWithString:@"Январь"];
        case 1:
            return [[NSAttributedString alloc] initWithString:@"Февраль"];
        case 2:
            return [[NSAttributedString alloc] initWithString:@"Март"];
        case 3:
            return [[NSAttributedString alloc] initWithString:@"Апрель"];
        case 4:
            return [[NSAttributedString alloc] initWithString:@"Май"];
        case 5:
            return [[NSAttributedString alloc] initWithString:@"Июнь"];
        case 6:
            return [[NSAttributedString alloc] initWithString:@"Июль"];
        case 7:
            return [[NSAttributedString alloc] initWithString:@"Август"];
        case 8:
            return [[NSAttributedString alloc] initWithString:@"Сентябрь"];
        case 9:
            return [[NSAttributedString alloc] initWithString:@"Октябрь"];
        case 10:
            return [[NSAttributedString alloc] initWithString:@"Ноябрь"];
        default:
            return [[NSAttributedString alloc] initWithString:@"Декабрь"];
    }
}

- (void)hidePicker:(UIButton *)sender {
    NSLog(@"Month");
    
    [self.view removeFromSuperview];
    [self.calendar.dim.view removeFromSuperview];
}



@end
