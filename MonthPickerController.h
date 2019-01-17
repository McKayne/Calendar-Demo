//
//  MonthPickerController.h
//  KalibroCalendar
//
//  Created by для интернета on 16.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef MonthPickerController_h
#define MonthPickerController_h

#import <UIKit/UIKit.h>
#import "CalendarController.h"

@interface MonthPickerController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong) CalendarController *calendar;
@property (strong) UIPickerView *picker;

- (void)hidePicker:(UIButton *)sender;
- (void)cancelAction:(UIButton *)sender;

@end

#endif /* MonthPickerController_h */
