//
//  BJCPickerViewController.m
//  UIPicker
//
//  Created by Bryan Clark on 4/18/14.
//  Copyright (c) 2014 Bryan Clark. All rights reserved.
//

#import "BJCPickerViewController.h"

@interface BJCPickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *pickerTitles;
@end

@implementation BJCPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set your view's background color here.
    self.view.backgroundColor = [UIColor colorWithRed:0.664 green:0.664 blue:0.664 alpha:1];
    
    //Create the UIPicker
    _pickerView = [[UIPickerView alloc] init];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    _pickerView.frame = CGRectMake(0,
                                   self.view.frame.size.height - _pickerView.frame.size.height,
                                   self.view.frame.size.width,
                                   _pickerView.frame.size.height);
    //Set your picker's background color here - if it's transparent, you'll see the view's background color come through.
    _pickerView.backgroundColor = [UIColor colorWithRed:0.941 green:0.945 blue:0.949 alpha:1.000];
    [self.view addSubview:_pickerView];
    
    //Create the content for the UIPicker
    _pickerTitles = @[@"$10",@"$15", @"$20", @"$25", @"$30", @"$35", @"$40", @"$45", @"$50"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Supporting UIPickerView
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerTitles.count;
}

-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *pickerTitle = _pickerTitles[row];
    
    // Put the attributes in here that you'd like to use.
    // Here's the full list: https://developer.apple.com/library/ios/documentation/uikit/reference/NSAttributedString_UIKit_Additions/Reference/Reference.html
    // I suggest you take a look at the following options:
    // NSForegroundColorAttributeName - changes the type's color.
    // NSKernValueAttributeName - changes the tracking for the string. Note: attributed strings use kerning, not tracking - for Avenir, kerning = tracking * fontSize / 1000
    // NSFontAttributeName - Avenir is my fave, but you know, Comic Sans can also happen. Check out http://iosfonts.com
    // ...the other attribute options are unnecessary for a UIPicker. Easy, yeah? :)
    
    UIFont *pickerFont = [UIFont fontWithName:@"Avenir-Medium" size:15.0f];
    UIColor *pickerTypeColor = [UIColor colorWithWhite:0.1 alpha:1.000];
    CGFloat desiredTracking = 120;
    NSNumber *kerning = [NSNumber numberWithFloat:desiredTracking * pickerFont.pointSize / 1000];
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: pickerTypeColor,
                                 NSFontAttributeName: pickerFont,
                                 NSKernAttributeName: kerning};
    
    return [[NSAttributedString alloc] initWithString:pickerTitle attributes:attributes];
}


@end
