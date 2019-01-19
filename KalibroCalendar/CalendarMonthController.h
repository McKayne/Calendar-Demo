//
//  CalendarMonthController.h
//  KalibroCalendar
//
//  Created by для интернета on 17.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef CalendarMonthController_h
#define CalendarMonthController_h

#import <UIKit/UIKit.h>
#import "CalendarController.h"

@interface CalendarMonthController : UIViewController

@property (strong) CalendarController *controller;

- (instancetype)initWithController:(CalendarController *)controller;

@end

#endif /* CalendarMonthController_h */
