//
//  ThirdViewController.m
//  TestDemo
//
//  Created by 沿途の风景 on 14-3-5.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

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
	
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 30, 100, 61);
    [btn setTitle:@"back" forState:UIControlStateNormal];
    btn.backgroundColor =[UIColor blueColor];
    [btn addTarget:self action:@selector(popSec:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    //加载HTML字符串
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:html baseURL:baseURL];
    
    
    
    
    
}

//执行javascript语句
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView stringByEvaluatingJavaScriptFromString:@""];
}

- (void)popSec:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
