UIPicker
========

Pixel-perfect UIPicker screenshots for your design comps

There's one UIKit element that's missing from just about every PSD / Sketch template: the UIPicker.

Why? Because it's terribly complicated to lay out - I mean, just look at this exploded view of the internals of the thing:

[iOS7 UIPicker - Exploded](http://blog.ittybittyapps.com/images/posts/lifting-the-lid-on-ios-7s-uipicker/UIDatePickeriOS7.png)

For me, pixel-perfect comps are like an itch that I have to scratch - so I made a quick little iOS app that builds a UIPicker for ya. I've engineered it so that designers can easily drop in different color & typeface values.

(Note - I'd love to use the incredible [HexColors](https://github.com/mRs-/HexColors) Cocoapod for this, but Cocoapods is acting wonky for me at the moment.)

Here's the chunks of code that you'll want to play with:

```objectivec
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
```
and:
```objectivec
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
```

The result? A pixel-perfect UIPicker - and code that you can hand to your engineer!
[iOS Screenshot](http://clrk.it/image/0I440k202u21/iOS%20Simulator%20Screen%20shot%20Apr%2018,%202014,%2010.58.33%20AM.png)

