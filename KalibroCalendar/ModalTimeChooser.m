//
//  ModalTimeChooser.m
//  KalibroCalendar
//
//  Created by для интернета on 27.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModalTimeChooser.h"

@implementation ModalTimeChooser

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return 24;
        default:
            return 60;
    }
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", row]];
    } else if (row < 10) {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"0%ld", row]];
    } else {
        return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", row]];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 40.0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *startLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width * 3 / 4, 50)];
    [startLabel setTextColor:[UIColor orangeColor]];
    [startLabel setTextAlignment:NSTextAlignmentCenter];
    [startLabel setText:@"НАЧАЛО"];
    [self.view addSubview:startLabel];
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width * 3 / 4 - 100, self.view.frame.size.height / 2 - 125)];
    [self.view addSubview:picker];
    picker.delegate = self;
    picker.dataSource = self;
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height / 2 - 75, 80, 30)];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelButton setTitle:@"Отмена" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    //[cancelButton.titleLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [self.view addSubview:cancelButton];
    [cancelButton addTarget:self action: @selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *okButton = [[UIButton alloc] initWithFrame:CGRectMake(160, self.view.frame.size.height / 2 - 75, 80, 30)];
    [okButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:okButton];
    [okButton addTarget:self action: @selector(performSort:) forControlEvents:UIControlEventTouchUpInside];
}

@end
