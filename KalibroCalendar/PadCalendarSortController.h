//
//  CalendarSortController.h
//  CeilingsAPI
//
//  Created by user914135 on 1/19/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#ifndef CalendarSortController_h
#define CalendarSortController_h

#import <UIKit/UIKit.h>
#import "CalendarController.h"

@interface PadCalendarSortController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property int sortBy;
@property (strong) CalendarController *controller;

@end

#endif /* CalendarSortController_h */
