//
//  CalendarController.h
//  KalibroCalendar
//
//  Created by для интернета on 14.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef CalendarController_h
#define CalendarController_h

#import <UIKit/UIKit.h>
#import "DimController.h"

#import "DemoPadDataSource.h"
#import "DemoPadDataSourceLandscape.h"

@interface CalendarController : UIViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource, UITableViewDelegate, UITableViewDataSource>

@property (strong) DemoPadDataSource *ds;
@property (strong) DemoPadDataSourceLandscape *dsl;
@property (strong) DimController *dim;
@property (strong) NSArray<UIViewController *> *pages;

- (void)openSortOptions:(UITapGestureRecognizer *)recognizer;
- (void)openAscOptions:(UITapGestureRecognizer *)recognizer;

@end


#endif /* CalendarController_h */
