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
#import "CustomOrderCell.h"

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
        
        self.cells = [[NSMutableArray alloc] initWithCapacity:4];
        for (int i = 0; i < 4; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:1];
            CustomOrderCell *cell = [[CustomOrderCell alloc] initWithArgs:indexPath cells:self.cells];
            self.cells[i] = cell;
        }
        
        self.currentMonth = 1;
        self.currentYear = 2019;
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
        
            CalendarMonthController *month = [[CalendarMonthController alloc] initWithController:self];
            [pageView setViewControllers:@[month] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
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
        if (self.currentMonth > 1) {
            self.currentMonth--;
        } else {
            self.currentYear--;
            self.currentMonth = 12;
        }
        
        CalendarMonthController *month = [[CalendarMonthController alloc] initWithController:self];
        return month;
    } else {
        PadCalendarMonthController *month = [PadCalendarMonthController new];
        return month;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (self.currentMonth < 12) {
            self.currentMonth++;
        } else {
            self.currentYear++;
            self.currentMonth = 1;
        }
        
        CalendarMonthController *month = [[CalendarMonthController alloc] initWithController:self];
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
    if (completed) {
    switch (self.currentMonth) {
        case 1:
            [self.navigationItem setTitle:[NSString stringWithFormat:@"Январь %d", self.currentYear]];
            break;
        case 2:
            [self.navigationItem setTitle:[NSString stringWithFormat:@"Февраль %d", self.currentYear]];
            break;
        case 3:
            [self.navigationItem setTitle:[NSString stringWithFormat:@"Март %d", self.currentYear]];
            break;
        case 4:
            [self.navigationItem setTitle:[NSString stringWithFormat:@"Апрель %d", self.currentYear]];
            break;
        case 5:
            [self.navigationItem setTitle:[NSString stringWithFormat:@"Май %d", self.currentYear]];
            break;
        case 6:
            [self.navigationItem setTitle:[NSString stringWithFormat:@"Июнь %d", self.currentYear]];
            break;
        case 7:
            [self.navigationItem setTitle:@"Июль 2019"];
            break;
        case 8:
            [self.navigationItem setTitle:@"Август 2019"];
            break;
        case 9:
            [self.navigationItem setTitle:@"Сентябрь 2019"];
            break;
        case 10:
            [self.navigationItem setTitle:@"Октябрь 2019"];
            break;
        case 11:
            [self.navigationItem setTitle:@"Ноябрь 2019"];
            break;
        case 12:
            [self.navigationItem setTitle:@"Декабрь 2019"];
    }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return self.cells[indexPath.row];
}

- (void)openSortOptions:(UITapGestureRecognizer *)recognizer {
    DimController *dim = [DimController new];
    [self.view addSubview:dim.view];

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
    DimController *dim = [DimController new];
    [self.view addSubview:dim.view];
    
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
