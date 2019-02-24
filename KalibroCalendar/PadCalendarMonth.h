//
//  PadCalendarMonth.h
//  KalibroCalendar
//
//  Created by для интернета on 24.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef PadCalendarMonth_h
#define PadCalendarMonth_h

#import <UIkit/UIKit.h>

@interface PadCalendarMonth : UIViewController

@property NSInteger year;
@property CGFloat height;
@property UIViewController *controller;

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height controller:(UIViewController *)controller;

@end


#endif /* PadCalendarMonth_h */
