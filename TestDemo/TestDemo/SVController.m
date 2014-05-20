//
//  SVController.m
//  TestDemo
//
//  Created by 沿途の风景 on 14-3-21.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#import "SVController.h"

@interface SVController ()

@end

@implementation SVController

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
    
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    _sv = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _sv.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_sv];
    
    _sv.contentSize = CGSizeMake(320, [UIScreen mainScreen].bounds.size.height);
    
    
    _txtF1 = [[UITextField alloc] initWithFrame:CGRectMake(60, 200, 200, 40)];
    _txtF1.delegate = self;
    _txtF1.placeholder = @"输入框1";
    _txtF1.borderStyle = UITextBorderStyleRoundedRect;
    _txtF1.keyboardType = UIKeyboardAppearanceDefault;
    [_sv addSubview:_txtF1];
    
    _txtF2 = [[UITextField alloc] initWithFrame:CGRectMake(60, 350, 200, 40)];
    _txtF2.delegate = self;
    _txtF2.placeholder = @"输入框2";
    _txtF2.borderStyle = UITextBorderStyleRoundedRect;
    _txtF2.keyboardType = UIKeyboardAppearanceDefault;
    [_sv addSubview:_txtF2];
    
    [self listenToKeyboard];
    
}

#pragma mark - UITextField delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - 添加键盘监测事件

-(void)listenToKeyboard
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
    
}

-(void) keyboardWillShow:(NSNotification *) note {
    
    NSDictionary* userInfo = [note userInfo];
    
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    
    CGRect keyboardEndFrame;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    
    
    CGRect keyboardFrame = [self.view convertRect:keyboardEndFrame toView:nil];
    
    self.sv.contentInset  =UIEdgeInsetsMake(0,0,keyboardFrame.size.height,0);
    
}

-(void) keyboardWillHide:(NSNotification *) note
{
    self.sv.contentInset  =UIEdgeInsetsMake(0,0,0,0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
