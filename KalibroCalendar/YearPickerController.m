//
//  YearPickerController.m
//  KalibroCalendar
//
//  Created by для интернета on 15.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YearPickerController.h"
#import "MonthPickerController.h"

@implementation YearPickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 80)];
    [header setTextAlignment:NSTextAlignmentCenter];
    [header setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [header setText:@"Пожалуйста, выберите год"];
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
    [cancelButton addTarget:self action: @selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *okButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 200, 80, 30)];
    [okButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [self.view addSubview:okButton];
    [okButton addTarget:self action: @selector(openMonthPicker:) forControlEvents:UIControlEventTouchUpInside];

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", row + 2015]];
    //return NSAttributedString(string: String(row), attributes: [NSForegroundColorAttributeName: UIColor.white])
}

- (void)openMonthPicker:(UIButton *)sender {
    NSLog(@"Month");
    
    [self.view removeFromSuperview];
    MonthPickerController *month = [MonthPickerController new];
    month.calendar = self.calendar;
    month.view.frame = CGRectMake(self.calendar.view.frame.size.width / 2 - 125, self.calendar.view.frame.size.height / 2 - 125, 250, 250);
    month.view.layer.cornerRadius = 20.0;
    [self.calendar.view addSubview:month.view];
    [self.calendar addChildViewController:month];
}

- (void)cancelAction:(UIButton *)sender {
    [self.view removeFromSuperview];
    [self.calendar.dim.view removeFromSuperview];
}

@end
