//
//  PadCalendarController.h
//  CeilingsAPI
//
//  Created by user914135 on 2/1/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#ifndef PadCalendarController_h
#define PadCalendarController_h

#import <UIKit/UIKit.h>
#import "PadCalendarYearController.h"
#import "PadCalendarMonthController.h"
#import "PadCalendarWeekController.h"
#import "PadCalendarDayController.h"

@interface PadCalendarController : UIViewController

@property (strong) PadCalendarYearController *yearController;
@property (strong) PadCalendarMonthController *monthController;
@property (strong) PadCalendarWeekController *weekController;
@property (strong) PadCalendarDayController *dayController;

@end

#endif /* PadCalendarController_h */
