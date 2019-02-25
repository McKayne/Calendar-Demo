//
//  ModalOrdersList.m
//  KalibroCalendar
//
//  Created by для интернета on 25.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModalOrdersList.h"

@implementation ModalOrdersList

- (instancetype)initWithDate:(NSInteger)year month:(NSInteger)month day:(NSInteger)day frame:(CGRect)frame {
    self = [super init];
    
    self.year = year;
    self.month = month;
    self.day = day;
    self.frame = frame;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    CGFloat currentWidth = self.frame.size.width * 3 / 4;
    UITableView *ordersList = [[UITableView alloc] initWithFrame:CGRectMake(currentWidth / 4 / 2, 100, currentWidth * 3 / 4, self.frame.size.height / 2)];
    [self.view addSubview:ordersList];
    
    UIImageView *closeView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width * 3 / 4 - 100, 25, 50, 50)];
    closeView.image = [UIImage imageNamed:@"close.png"];
    [self.view addSubview:closeView];
    [closeView setUserInteractionEnabled:true];
    [closeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction:)]];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, self.frame.size.width * 3 / 4 - 50, 100)];
    [dateLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:32]];
    switch (self.month) {
        case 1:
            [dateLabel setText:[NSString stringWithFormat:@"%ld января %ld г.", self.day, self.year]];
            break;
        case 2:
            [dateLabel setText:[NSString stringWithFormat:@"%ld февраля %ld г.", self.day, self.year]];
            break;
        case 3:
            [dateLabel setText:[NSString stringWithFormat:@"%ld марта %ld г.", self.day, self.year]];
            break;
        case 4:
            [dateLabel setText:[NSString stringWithFormat:@"%ld апреля %ld г.", self.day, self.year]];
            break;
        case 5:
            [dateLabel setText:[NSString stringWithFormat:@"%ld мая %ld г.", self.day, self.year]];
            break;
        case 6:
            [dateLabel setText:[NSString stringWithFormat:@"%ld июня %ld г.", self.day, self.year]];
            break;
        case 7:
            [dateLabel setText:[NSString stringWithFormat:@"%ld июля %ld г.", self.day, self.year]];
            break;
        case 8:
            [dateLabel setText:[NSString stringWithFormat:@"%ld августа %ld г.", self.day, self.year]];
            break;
        case 9:
            [dateLabel setText:[NSString stringWithFormat:@"%ld сентября %ld г.", self.day, self.year]];
            break;
        case 10:
            [dateLabel setText:[NSString stringWithFormat:@"%ld октября %ld г.", self.day, self.year]];
            break;
        case 11:
            [dateLabel setText:[NSString stringWithFormat:@"%ld ноября %ld г.", self.day, self.year]];
            break;
        case 12:
            [dateLabel setText:[NSString stringWithFormat:@"%ld декабря %ld г.", self.day, self.year]];
    }
    [self.view addSubview:dateLabel];
}

- (void)closeAction:(UITapGestureRecognizer *)recognizer {
    NSLog(@"CLOSING");
    
    [self.view removeFromSuperview];
    [self.dim.view removeFromSuperview];
}

@end
