//
//  PadCustomCalendar.h
//  KalibroCalendar
//
//  Created by для интернета on 16.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef PadCustomCalendar_h
#define PadCustomCalendar_h

#import <UIKit/UIKit.h>
#import "CalendarController.h"

@interface PadCustomCalendar : UIView<UITableViewDelegate, UITableViewDataSource>

@property BOOL isPortrait;
@property (strong) CalendarController *calendar;
@property int startFrom, daysTotal, month, todayDay, selected;

- (void)drawArc:(CGPoint) from to:(CGPoint) to red:(float)red green:(float)green blue:(float)blue radius:(float)radius;
- (void)openDatePicker:(UITapGestureRecognizer *)recognizer;
- (void)openMonthPicker:(UIButton *)sender;

@end

#endif /* PadCustomCalendar_h */
