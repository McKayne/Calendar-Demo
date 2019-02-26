//
//  PadDatePickerController.h
//  CeilingsAPI
//
//  Created by user914135 on 2/3/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#ifndef PadDatePickerController_h
#define PadDatePickerController_h

#import <UIKit/UIKit.h>
#import "PadCalendarController.h"

#import "PadCalendarYearController.h"

@interface PadDatePickerController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong) PadCalendarYearController *yearController;

@property (strong) UIViewController *dim;
@property int day, month, year;
@property (strong) PadCalendarController *controller;
@property (strong) UIPickerView *picker;
@property (strong) NSArray *months;

- (void)openMonthPicker:(UIButton *)sender;
- (void)cancelAction:(UIButton *)sender;

@end

#endif /* PadDatePickerController_h */
