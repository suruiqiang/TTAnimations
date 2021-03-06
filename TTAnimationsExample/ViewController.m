//
//  ViewController.m
//  TTAnimationsExample
//
//  Created by titengjiang on 16/1/24.
//  Copyright © 2016年 sloop. All rights reserved.
//

#import "ViewController.h"
#import <TTAnimations/AnimationHelper.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *animationPicker;
@property (nonatomic,strong) NSArray * animationTypes;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _targetLabel.textColor = [self randomColor ];
    
    _animationTypes = @[
                       
                        @"bounce",
                        @"Flash",
                        @"pulse",
                        @"rubberBand",
                        @"shake",
                        @"swing",
                        @"tada",
                        @"wobble",
                        @"jello",
                        @"bounceIn",
                        @"bounceInDown",
                        @"bounceInLeft",
                        @"bounceInRight",
                        @"bounceInUp",
                        @"bounceOut",
                        @"bounceOutDown",
                        @"bounceOutLeft",
                        @"bounceOutRight",
                        @"bounceOutUp",
                        @"fadeIn",
                        @"fadeInDown",
                        @"fadeInDownBig",
                        @"fadeInLeft",
                        @"fadeInLeftBig",
                        @"fadeInRight",
                        @"fadeInRightBig",
                        @"fadeInUp",
                        @"fadeInUpBig",
                        @"fadeOut",
                        @"fadeOutDown",
                        @"fadeOutDownBig",
                        @"fadeOutLeft",
                        @"fadeOutLeftBig",
                        @"fadeOutRight",
                        @"fadeOutRightBig",
                        @"fadeOutUp",
                        @"fadeOutUpBig",
                        @"flip",
                        @"flipInx",
                        @"flipInY",
                        @"flipOutX",
                        @"flipOutY",
                        
                        @"lightSpeedIn",
                        @"lightSpeedOut",
                        
                        @"RotateIn",
                        @"RotateInDownLeft",
                        @"RotateInDownRight",
                        @"RotateInUpLeft",
                        @"RotateInUpRight",
                        
                        @"RotateOut",
                        @"RotateOutDownLeft",
                        @"RotateOutDownRight",
                        @"RotateOutUpLeft",
                        @"RotateOutUpRight",
                        
                        
                        @"SlideOutUp",
                        @"SlideOutLeft",
                        @"SlideOutRight",
                        @"SlideOutDown",
                        
                        @"SlideInUp",
                        @"SlideInLeft",
                        @"SlideInRight",
                        @"SlideInDown",
                        
                        @"hinge",
                        @"rollIn",
                        @"rollOut",
                        
                        @"zoomIn",
                        @"zoomInDown",
                        @"zoomInLeft",
                        @"zoomInRight",
                        @"zoomInUp",
                        @"zoomOut",
                        @"zoomOutDown",
                        @"zoomOutLeft",
                        @"zoomOutRight",
                        @"zoomOutUp"
                       
                       
                       ];
    
    _animationPicker.dataSource =self;
    _animationPicker.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(UIColor *)randomColor {
    CGFloat hue = arc4random() % 100 / 100.0;
    CGFloat saturation = (arc4random() % 50 / 100) + 0.5;
    CGFloat brightness = (arc4random() % 50 / 100) + 0.5;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

#pragma mark CAAnimationDelegate delegate
-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animation start");
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animation stop");

    
}



#pragma mark datePicker
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _animationTypes.count;
    
}

#pragma mark datasource
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return _animationTypes[row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [AnimationHelper playAnimationOn:_targetLabel animationType:row delegate:self];
    
    
}

@end
