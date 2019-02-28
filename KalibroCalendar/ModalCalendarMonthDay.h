//
//  ModalCalendarMonthDay.h
//  KalibroCalendar
//
//  Created by для интернета on 28.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef ModalCalendarMonthDay_h
#define ModalCalendarMonthDay_h

#import <UIKit/UIKit.h>
#import "ModalCalendarController.h"

@interface ModalCalendarMonthDay : UIView

@property (strong) ModalCalendarController *controller;
@property NSInteger currentYear, currentMonth, currentDay;

//@property (strong) PadCalendarController *controller;
//@property (strong) PadCalendarYear *year;
@property BOOL isSelected, isWeekend, isToday;
@property (strong) UILabel *dayLabel;

- (instancetype)initWithDay:(NSInteger)year month:(NSInteger)month day:(NSInteger) day frame:(CGRect)frame isTodayDay:(BOOL)isTodayDay;

@end

#endif /* ModalCalendarMonthDay_h */
