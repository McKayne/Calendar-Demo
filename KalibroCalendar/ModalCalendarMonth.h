//
//  ModalCalendarMonth.h
//  KalibroCalendar
//
//  Created by для интернета on 27.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef ModalCalendarMonth_h
#define ModalCalendarMonth_h

#import <UIKit/UIKit.h>
#import "ModalCalendarController.h"

@interface ModalCalendarMonth : UIViewController

@property (strong) ModalCalendarController *controller;
@property NSInteger year, month;

@end

#endif /* ModalCalendarMonth_h */
