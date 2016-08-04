//
//  ViewController.m
//  CategorySet
//
//  Created by qingsong on 16/8/3.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    @weakify(self)
    [self.testButton touchUpInsideWithBlock:^(id sender) {
       
        [weak_self randomColor];
    }];
    
    UITapGestureRecognizer *tapGestureRecognizer = [UITapGestureRecognizer gestureRecognizerWithActionBlock:^(id gestureRecognizerBlock) {
        
        [weak_self randomColor];
    }];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    UIColor *bgColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    [self.view setBackgroundColor:bgColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
