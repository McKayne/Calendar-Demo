//
//  PadDatePickerController.h
//  KalibroCalendar
//
//  Created by для интернета on 17.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef PadDatePickerController_h
#define PadDatePickerController_h

#import <UIKit/UIKit.h>
#import "CalendarController.h"

@interface PadDatePickerController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong) CalendarController *calendar;
@property (strong) UIPickerView *picker;
@property (strong) NSArray *months;

- (void)openMonthPicker:(UIButton *)sender;
- (void)cancelAction:(UIButton *)sender;

@end

#endif /* PadDatePickerController_h */
