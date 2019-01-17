//
//  YearPickerController.h
//  KalibroCalendar
//
//  Created by для интернета on 15.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef YearPickerController_h
#define YearPickerController_h

#import <UIKit/UIKit.h>
#import "CalendarController.h"

@interface YearPickerController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong) CalendarController *calendar;
@property (strong) UIPickerView *picker;

- (void)openMonthPicker:(UIButton *)sender;
- (void)cancelAction:(UIButton *)sender;

@end

#endif /* YearPickerController_h */
