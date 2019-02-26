//
//  CalendarAscController.h
//  CeilingsAPI
//
//  Created by user914135 on 1/19/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#ifndef CalendarAscController_h
#define CalendarAscController_h

#import <UIKit/UIKit.h>
#import "CalendarController.h"

@interface PadCalendarAscController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property int ascBy;
@property (strong) CalendarController *controller;

@end

#endif /* CalendarAscController_h */
