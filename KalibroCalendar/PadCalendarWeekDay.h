//
//  PadCalendarWeekDay.h
//  KalibroCalendar
//
//  Created by для интернета on 25.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef PadCalendarWeekDay_h
#define PadCalendarWeekDay_h

#import <UIKit/UIKit.h>
//#import "PadCalendarYear.h"
#import "PadCalendarController.h"

@interface PadCalendarWeekDay : UIView

//@property NSInteger currentYear, currentMonth, currentDay;

@property (strong) PadCalendarController *controller;
//@property (strong) PadCalendarYear *year;
//@property BOOL isSelected, isWeekend, isToday;
//@property (strong) UILabel *dayLabel;

//- (instancetype)initWithDay:(NSInteger)year month:(NSInteger)month day:(NSInteger) day frame:(CGRect)frame isTodayDay:(BOOL)isTodayDay;

@end

#endif /* PadCalendarWeekDay_h */
