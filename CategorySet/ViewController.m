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
    self.testButton.touchExtendInset = UIEdgeInsetsMake(-100, -100, -100, -100);

    [self.testButton touchUpInsideWithBlock:^(id sender) {
       
        [weak_self randomColor];
    }];
    
    UIView *touchView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [touchView setBackgroundColor:[UIColor redColor]];
    touchView.touchExtendInset = UIEdgeInsetsMake(-100, -100, -100, -100);
    [self.view addSubview:touchView];
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [UITapGestureRecognizer gestureRecognizerWithActionBlock:^(id gestureRecognizerBlock) {
        
        [weak_self randomColor];
    }];
    [touchView addGestureRecognizer:tapGestureRecognizer];
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Test" message:@"hello world" completion:^(UIAlertView *alertview, NSInteger buttonIndex) {
        
    } cancelButtonTitle:@"取消" otherButtonTitles:@"斯国一", nil];
    
    [alertView show];
    
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
