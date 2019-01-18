//
//  CalendarController.m
//  KalibroCalendar
//
//  Created by для интернета on 14.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarController.h"
#import "CustomCalendar.h"
#import "PadCustomCalendar.h"
#import "PadCustomCalendarLandscape.h"

#import "CalendarMonthController.h"
#import "PadCalendarMonthController.h"

#import "CustomSeparator.h"

@implementation CalendarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /*[self.navigationController.navigationBar setTranslucent:false];
    //[self.navigationController.navigationBar setBackgroundColor:[UIColor yellowColor]];*/
    [self.navigationItem setTitle:@"Январь 2019"];

    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"сегодня" style:UIBarButtonItemStylePlain target:nil action:nil]];
    //[self.navigationController setNavigationBarHidden:true animated:true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    //[self.navigationController.navigationBar setBackgroundColor:[UIColor yellowColor]];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        /*CustomCalendar *calendar;
        calendar = [[CustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait) {
            calendar = [[CustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            calendar.isPortrait = true;
        } else {
            calendar = [[CustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30)];
            calendar.isPortrait = false;
        }
        calendar.calendar = self;
        calendar.month = 0;
        calendar.startFrom = 1;
        calendar.daysTotal = 31;
        calendar.todayDay = 17;
        calendar.selected = 23;
        [self.view addSubview:calendar];*/
        
        if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait) {
            UIImageView *calendar = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 5 * 4 + 26, 10, 32, 32)];
            [calendar setImage:[UIImage imageNamed:@"calendar.png"]];
            [self.view addSubview:calendar];
            [calendar setUserInteractionEnabled:true];
            [calendar addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openDatePicker:)]];
        
            //UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            UIPageViewController *pageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
            UIPageControl *pageControl = [UIPageControl new];
            //, currentIndex: Int?, pendingIndex: Int?
        
            pageView.delegate = self;
            pageView.dataSource = self;
        
            self.pages = @[[CalendarMonthController new], [CalendarMonthController new], [CalendarMonthController new]];
            [pageView setViewControllers:@[[CalendarMonthController new]] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
            //[pageView setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
        
            pageView.view.frame = CGRectMake(0, self.view.frame.size.height / 2 / 6, self.view.frame.size.width, self.view.frame.size.height / 2 + 25);
            [self addChildViewController:pageView];
            [self.view addSubview:pageView.view];
        
            pageControl.numberOfPages = 3;
            pageControl.currentPage = 0;

            UITableView *dailyTasksList;
            dailyTasksList = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height / 2)];
            [self.view addSubview:dailyTasksList];
            dailyTasksList.dataSource = self;
        } else {
            
            
            //UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            UIPageViewController *pageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
            UIPageControl *pageControl = [UIPageControl new];
            //, currentIndex: Int?, pendingIndex: Int?
            
            pageView.delegate = self;
            pageView.dataSource = self;
            
            self.pages = @[[CalendarMonthController new], [CalendarMonthController new], [CalendarMonthController new]];
            [pageView setViewControllers:@[[CalendarMonthController new]] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
            //[pageView setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
            
            pageView.view.frame = CGRectMake(0, 0, self.view.frame.size.width / 2, self.view.frame.size.height);
            [self addChildViewController:pageView];
            [self.view addSubview:pageView.view];
            
            pageControl.numberOfPages = 3;
            pageControl.currentPage = 0;
            
            UIImageView *calendar = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 / 5 * 4 + 26, 10, 32, 32)];
            [calendar setImage:[UIImage imageNamed:@"calendar.png"]];
            [self.view addSubview:calendar];
            [calendar setUserInteractionEnabled:true];
            [calendar addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openDatePicker:)]];
            
            UITableView *dailyTasksList;
            dailyTasksList = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, 0, self.view.frame.size.width / 2, self.view.frame.size.height)];
            [self.view addSubview:dailyTasksList];
            dailyTasksList.dataSource = self;
        }
    } else {
        if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait) {
            /*PadCustomCalendar *calendar;
            calendar = [[PadCustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait) {
                calendar = [[PadCustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                calendar.isPortrait = true;
            } else {
                calendar = [[PadCustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30)];
                calendar.isPortrait = false;
            }
            calendar.calendar = self;
            calendar.month = 0;
            calendar.startFrom = 1;
            calendar.daysTotal = 31;
            calendar.todayDay = 17;
            calendar.selected = 23;
            [self.view addSubview:calendar];*/
            UIImageView *calendar = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 5 * 4 + self.view.frame.size.width / 5 / 2 - 32, 10, 64, 64)];
            [calendar setImage:[UIImage imageNamed:@"calendar.png"]];
            [self.view addSubview:calendar];
            [calendar setUserInteractionEnabled:true];
            [calendar addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openDatePicker:)]];
            
            //UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            UIPageViewController *pageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
            UIPageControl *pageControl = [UIPageControl new];
            //, currentIndex: Int?, pendingIndex: Int?
            
            pageView.delegate = self;
            pageView.dataSource = self;
            
            self.pages = @[[PadCalendarMonthController new], [PadCalendarMonthController new], [PadCalendarMonthController new]];
            [pageView setViewControllers:@[[PadCalendarMonthController new]] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
            //[pageView setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
            
            pageView.view.frame = CGRectMake(0, self.view.frame.size.height / 2 / 6, self.view.frame.size.width, self.view.frame.size.height / 2 + 25);
            [self addChildViewController:pageView];
            [self.view addSubview:pageView.view];
            
            pageControl.numberOfPages = 3;
            pageControl.currentPage = 0;
            
            self.ds = [DemoPadDataSource new];
            self.ds.width = self.view.frame.size.width;
            
            UITableView *dailyTasksList;
            dailyTasksList = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height / 2)];
            [self.view addSubview:dailyTasksList];
            dailyTasksList.delegate = self.ds;
            dailyTasksList.dataSource = self.ds;
        } else {
            /*PadCustomCalendar *calendar;
            calendar = [[PadCustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            calendar = [[PadCustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            calendar.isPortrait = true;
            calendar.calendar = self;
            calendar.month = 0;
            calendar.startFrom = 1;
            calendar.daysTotal = 31;
            calendar.todayDay = 17;
            calendar.selected = 23;
            [self.view addSubview:calendar];*/
            /*PadCustomCalendarLandscape *calendar;
            calendar = [[PadCustomCalendarLandscape alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 65)];
            calendar.isPortrait = false;
            calendar.calendar = self;
            calendar.month = 0;
            calendar.startFrom = 1;
            calendar.daysTotal = 31;
            calendar.todayDay = 17;
            calendar.selected = 23;
            [self.view addSubview:calendar];*/
            
            
            
            //UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            UIPageViewController *pageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
            UIPageControl *pageControl = [UIPageControl new];
            //, currentIndex: Int?, pendingIndex: Int?
            
            pageView.delegate = self;
            pageView.dataSource = self;
            
            self.pages = @[[PadCalendarMonthController new], [PadCalendarMonthController new], [PadCalendarMonthController new]];
            [pageView setViewControllers:@[[PadCalendarMonthController new]] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
            //[pageView setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
            
            pageView.view.frame = CGRectMake(0, 0, self.view.frame.size.width * 2 / 3, self.view.frame.size.height);
            [self addChildViewController:pageView];
            [self.view addSubview:pageView.view];
            
            pageControl.numberOfPages = 3;
            pageControl.currentPage = 0;
            
            UIImageView *sort = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2 / 3 / 5 * 2 + self.view.frame.size.width * 2 / 3 / 5 / 2 - 32, 10, 64, 64)];
            [sort setImage:[UIImage imageNamed:@"sort.png"]];
            [self.view addSubview:sort];
            [sort setUserInteractionEnabled:true];
            [sort addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openSortOptions:)]];
            
            UIImageView *asc = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2 / 3 / 5 * 3 + self.view.frame.size.width * 2 / 3 / 5 / 2 - 32, 10, 64, 64)];
            [asc setImage:[UIImage imageNamed:@"asc.png"]];
            [self.view addSubview:asc];
            [asc setUserInteractionEnabled:true];
            [asc addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openAscOptions:)]];
            
            UIImageView *calendar = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2 / 3 / 5 * 4 + self.view.frame.size.width * 2 / 3 / 5 / 2 - 32, 10, 64, 64)];
            [calendar setImage:[UIImage imageNamed:@"calendar.png"]];
            [self.view addSubview:calendar];
            [calendar setUserInteractionEnabled:true];
            [calendar addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openDatePicker:)]];
            
            self.dsl = [DemoPadDataSourceLandscape new];
            self.dsl.width = self.view.frame.size.width;
            self.dsl.height = self.view.frame.size.height;
            
            UITableView *dailyTasksList;
            dailyTasksList = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2 / 3, 0, self.view.frame.size.width / 3, self.view.frame.size.height)];
            [self.view addSubview:dailyTasksList];
            dailyTasksList.delegate = self.dsl;
            dailyTasksList.dataSource = self.dsl;
            
        }
    }
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        CalendarMonthController *month = [CalendarMonthController new];
        return month;
    } else {
        PadCalendarMonthController *month = [PadCalendarMonthController new];
        return month;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        CalendarMonthController *month = [CalendarMonthController new];
        return month;
    } else {
        PadCalendarMonthController *month = [PadCalendarMonthController new];
        return month;
    }
}

/*func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
 pendingIndex = pages.index(of: pendingViewControllers.first!)
 }
 
 func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
 if completed {
 currentIndex = pendingIndex
 if let index = currentIndex {
 pageControl.currentPage = index
 }
 }
 }
*/

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    
    UILabel *timeA = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 67.5, 20)];
    [timeA setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:12]];
    [timeA setTextAlignment:NSTextAlignmentRight];
    switch (indexPath.row) {
        case 0:
            [timeA setText:@"09:00"];
            break;
        case 1:
            [timeA setText:@"14:00"];
            break;
        case 2:
            [timeA setText:@"20:00"];
            break;
        case 3:
            [timeA setText:@"23:53"];
            break;
    }
    [cell.contentView addSubview:timeA];
    
    UILabel *timeB = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 67.5, 20)];
    [timeB setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:12]];
    [timeB setTextAlignment:NSTextAlignmentRight];
    switch (indexPath.row) {
        case 0:
            [timeB setText:@"10:00"];
            break;
        case 1:
            [timeB setText:@"18:00"];
            break;
        case 2:
            [timeB setText:@"20:50"];
            break;
        case 3:
            [timeB setText:@"03:40"];
            break;
    }
    [cell.contentView addSubview:timeB];
    
    CustomSeparator *separator = [[CustomSeparator alloc] initWithFrame:CGRectMake(80, 5, 1, 35)];
    [separator setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0]];
    [cell.contentView addSubview:separator];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 230, 20)];
    [address setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:12]];
    [address setTextAlignment:NSTextAlignmentLeft];
    switch (indexPath.row) {
        case 0:
            [address setText:@"Улица Циолковского 163"];
            break;
        case 1:
            [address setText:@"Улица Плющиха, 37/21 13"];
            break;
        case 2:
            [address setText:@"Улица Сакко и Ванцетти 74"];
            break;
        case 3:
            [address setText:@"Улица Саперов 2"];
            break;
    }
    [cell.contentView addSubview:address];
    
    UILabel *task = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 230, 20)];
    [task setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:12]];
    [task setTextAlignment:NSTextAlignmentLeft];
    [task setText:@"Замерить потолки"];
    [cell.contentView addSubview:task];
    
    UILabel *distance;
    distance = [[UILabel alloc] initWithFrame:CGRectMake(240, 0, 80, 40)];
    [distance setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:12]];
    [distance setTextAlignment:NSTextAlignmentCenter];
    switch (indexPath.row) {
        case 0:
            [distance setText:@"1.43 км"];
            break;
        case 1:
            [distance setText:@"0.89 км"];
            break;
        case 2:
            [distance setText:@"12.71 км"];
            break;
        case 3:
            [distance setText:@"9.08 км"];
            break;
    }
    [cell.contentView addSubview:distance];
    
    return cell;
}

- (void)openSortOptions:(UITapGestureRecognizer *)recognizer {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Сортировать по" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert.view setTintColor:[UIColor colorWithRed:141.0 / 255.0f green:143.0 / 255.0f blue:140.0 / 255.0f alpha: 1.0f]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Без сортировки ✓" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"По дальности           " style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"По времени начала      " style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"По времени завершения  " style:UIAlertActionStyleDefault handler:nil]];
    
    UIPopoverPresentationController *popoverPresentationController = alert.popoverPresentationController;
    popoverPresentationController.permittedArrowDirections = nil;
    popoverPresentationController.sourceView = self.view;
    popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2, 1, 1);
    [self presentViewController:alert animated:true completion:nil];
    //[self present:alert animated:true completion:nil];
}

- (void)openAscOptions:(UITapGestureRecognizer *)recognizer {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Сортировать" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert.view setTintColor:[UIColor colorWithRed:141.0 / 255.0f green:143.0 / 255.0f blue:140.0 / 255.0f alpha: 1.0f]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"По убыванию     " style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"По возрастанию ✓" style:UIAlertActionStyleDefault handler:nil]];
    
    UIPopoverPresentationController *popoverPresentationController = alert.popoverPresentationController;
    popoverPresentationController.permittedArrowDirections = nil;
    popoverPresentationController.sourceView = self.view;
    popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2, 1, 1);
    [self presentViewController:alert animated:true completion:nil];
    //[self present:alert animated:true completion:nil];
}

@end
