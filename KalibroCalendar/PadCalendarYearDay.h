//
//  PadCalendarYearDay.h
//  KalibroCalendar
//
//  Created by для интернета on 25.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef PadCalendarYearDay_h
#define PadCalendarYearDay_h

#import <UIKit/UIKit.h>
#import "PadCalendarYear.h"

@interface PadCalendarYearDay : UIView

@property (strong) PadCalendarYear *year;
@property BOOL isSelected, isWeekend, isToday;
@property (strong) UILabel *dayLabel;

- (instancetype)initWithDay:(NSInteger) day frame:(CGRect)frame isTodayDay:(BOOL)isTodayDay;

@end

#endif /* PadCalendarYearDay_h */
