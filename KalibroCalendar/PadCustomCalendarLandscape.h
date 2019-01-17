//
//  PadCustomCalendarLandscape.h
//  KalibroCalendar
//
//  Created by для интернета on 17.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef PadCustomCalendarLandscape_h
#define PadCustomCalendarLandscape_h

#import <UIKit/UIKit.h>
#import "CalendarController.h"

@interface PadCustomCalendarLandscape : UIView<UITableViewDelegate, UITableViewDataSource>

@property BOOL isPortrait;
@property (strong) CalendarController *calendar;
@property int startFrom, daysTotal, month, todayDay, selected;

- (void)drawArc:(CGPoint) from to:(CGPoint) to red:(float)red green:(float)green blue:(float)blue radius:(float)radius;
- (void)openDatePicker:(UITapGestureRecognizer *)recognizer;
- (void)openMonthPicker:(UIButton *)sender;

@end

#endif /* PadCustomCalendarLandscape_h */
