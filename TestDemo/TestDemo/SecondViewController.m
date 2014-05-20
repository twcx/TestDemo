//
//  SecondViewController.m
//  TestDemo
//
//  Created by 沿途の风景 on 14-3-5.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

#import "MapController.h"
#import "AppDelegate.h"

#import "UIBubbleView.h"
#include <math.h>

typedef int (^MySum) (int,int);



@interface SecondViewController ()

@end

@implementation SecondViewController

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
	
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 30, 100, 61);
    [btn setTitle:@"third" forState:UIControlStateNormal];
    btn.backgroundColor =[UIColor redColor];
    [btn addTarget:self action:@selector(pushThird:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btnMap = [UIButton buttonWithType:UIButtonTypeCustom];
    btnMap.frame = CGRectMake(20, 150, 100, 61);
    btnMap.backgroundColor = [UIColor orangeColor];
    [btnMap setTitle:@"map" forState:UIControlStateNormal];
    [btnMap addTarget:self action:@selector(goToMap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnMap];
    
    
    UIButton *animationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    animationBtn.backgroundColor = [UIColor blueColor];
    animationBtn.frame = CGRectMake(100, 350, 100, 60);
    [animationBtn setTitle:@"animate" forState:UIControlStateNormal];
    [animationBtn addTarget:self action:@selector(animatedWithType:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:animationBtn];
    
    UIButton *sampleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sampleBtn.backgroundColor = [UIColor purpleColor];
    sampleBtn.frame = CGRectMake(100, 250, 100, 60);
    sampleBtn.tag = 99;
    [sampleBtn setTitle:@"sample" forState:UIControlStateNormal];
    [self.view addSubview:sampleBtn];
    
    
    int (^sum) (int,int) = ^(int a, int b) {
        return a + b;
    };
    
    sum (10,10);
    
    NSLog(@"sum is %i",sum(10,10));
    
    MySum sumBlock = ^(int a, int b) {
        return a*b;
    };
    
    sumBlock(5,5);
    NSLog(@"sumBlock is %i",sumBlock(5,5));
    
    
    
    NSString *a = @"12";
    float b = [a floatValue];
    NSLog(@"b=%0.2f",b/100);
    
    
    float c = 2.1;
    if ((int)c != c) {
        NSLog(@"float");
    }
    else {
        NSLog(@"int");
    }
    
    
    NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@"1",@"1",@"2", nil];
    NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:@"3",@"4",@"3", nil];
    
    /*
    arr1 = [NSMutableArray arrayWithArray:arr2];//直接覆盖原有元素，适合数组为0的时候
    NSLog(@"arr1 = %@",arr1);
    
    [arr2 addObjectsFromArray:arr2];//添加另外一个数组的所有元素
    NSLog(@"arr2 = %@",arr2);
    
    NSMutableArray *arr3 = [NSMutableArray arrayWithCapacity:0];
    [arr3 addObjectsFromArray:arr1];
    NSLog(@"arr3 = %@",arr3);
    */
    
    
    //以下方法只用于两个相邻元素相同时删除重复元素
    NSString *valueA = @"1";
    
    for (int i = 0; i < arr1.count; i++) {
        
        if (valueA && [arr1 containsObject:valueA]) {
            NSString *valueB = [arr1 objectAtIndex:i];
            NSInteger index = [arr1 indexOfObject:valueB];
            if (index + 1 < arr1.count) {
                if ([valueA isEqualToString:[arr1 objectAtIndex:index +1]]) {
                    [arr1 removeObjectAtIndex:index];
                }
            }
        }
    }
    NSLog(@"arr1 = %@",arr1);
    
    
    /*添加对象到数组中，如果数组中已有该字符串，则不添加到数组*/
    
    NSMutableArray *arrA = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
    NSMutableArray *arrB = [NSMutableArray arrayWithCapacity:0];
    
    for (int i = 0; i<[arrA count]; i++) {
        NSString * str = [arrA objectAtIndex:i];
        [arrB addObject:str];
        NSInteger index= [arrB indexOfObject:str inRange:NSMakeRange(0, [arrB count] - 1)];
        if(index != NSNotFound) {
            [arrB removeObjectAtIndex:index];
        }
    }
    
    
    //判断字符串是否为纯数字
    NSString *s = @"123ab你好";
    
    //方法一：系统原生态（推荐）
    //digit函数判断字符串是否为纯数字
    //[NSCharacterSet decimalDigitCharacterSet];
    if ([[s stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length > 0) {
        NSLog(@"不是纯数字");
    }
    else {
        NSLog(@"纯数字");
    }
    
    //方法二：正则表达式
    NSString *regex = @"(/^[0-9]*$/)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:s];
    if (isMatch) {
        NSLog(@"纯数字");
    }
    else {
        NSLog(@"不是纯数字");;
    }
    
    NSString *ss = @"1-1";
    ss = [ss stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    NSLog(@"ss = %@",ss);
    
    //数组嵌套字典排序
    NSMutableArray *mutiArray = [NSMutableArray arrayWithCapacity:0];
    NSMutableDictionary *mDict1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"a", nil];
    NSMutableDictionary *mDict2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"3",@"a", nil];
    NSMutableDictionary *mDict3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"a", nil];
    NSMutableDictionary *mDict4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"2",@"a", nil];
    [mutiArray addObject:mDict1];
    [mutiArray addObject:mDict2];
    [mutiArray addObject:mDict3];
    [mutiArray addObject:mDict4];
    
    
    //排序
    NSArray *sortArray = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"a" ascending:YES]];
    [mutiArray sortUsingDescriptors:sortArray];
    NSLog(@"mutiArray = %@",mutiArray);
    
    //去除数组中相同的元素
    
    NSMutableArray *tempArr = [NSMutableArray arrayWithObjects:@"2014年04月14日",@"2",@"2014年04月14日",@"2014年04月14日",@"2014年04月14日",@"2014年04月14日",@"12", nil];
//    tempArr = [NSMutableArray arrayWithArray:[[NSSet setWithArray:tempArr] allObjects]];
//    NSLog(@"tempArr = %@",tempArr);
    
    //相同元素加到一个数组中（此方法必须先给数组排好序）
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:0];
    
    for (int i = 0; i < tempArr.count; i++) {
        
        NSString *sKey = tempArr[i];
        
        NSMutableArray *secArr = [NSMutableArray arrayWithCapacity:0];
        [secArr addObject:sKey];
        
        [tempArr removeObjectAtIndex:0];
        
        i = -1;
        
        for (int j = 0; j < tempArr.count; j++) {
            
            if ([sKey isEqualToString:tempArr[j]]) {
                
                [secArr addObject:tempArr[j]];
                
                [tempArr removeObjectAtIndex:0];
                j = -1;
            }
            else {
                break;
            }
            
        }
        
        [dataArray addObject:secArr];
    }
    
    NSLog(@"dataArray = %@",dataArray);
    
    
    
    
    
    
    
    
    //NSDate、NSString和时间戳的相互转化
    
    //时间戳转化成NSString类型的时间
    NSString *timeStamp = @"1397009215";
    NSString *dateStr1 = [self longlongToDate:timeStamp withFormat:[self dateFormatterStyle]];
    NSLog(@"dateStr1 = %@",dateStr1);
    
    //NSString类型的时间转化成时间戳
    NSString *dateStr2 = @"2014-04-09 10:06:55";
    NSString *timeStamp2 = [self timeStampFromString:dateStr2 withFormat:[self dateFormatterStyle]];
    NSLog(@"timeStamp2 = %@",timeStamp2);
    
    //NSDate类型的时间转化成时间戳
    NSDate *now = [NSDate date];
    NSLog(@"now = %@",now);
    NSString *nowStr = [NSString stringWithFormat:@"%0.0f",[now timeIntervalSince1970]];
    NSLog(@"nowStr = %@",nowStr);
    
    //时间戳转化成NSDate类型的时间
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue]];
    NSLog(@"date1 = %@",date1);
    
    //NSString类型的时间转化成NSDate类型的时间
    NSDate *date2 = [self dateFromString:dateStr1 withFormat:[self dateFormatterStyle]];
    NSLog(@"date2 = %@",date2);
    
    //NSDate类型的时间转化成NSString类型的时间
    NSString *nowDateStr = [self stringFromDate:now withFormat:[self dateFormatterStyle]];
    NSLog(@"nowDateStr = %@",nowDateStr);
    
    /*
    UIBubbleView *bubble = [[UIBubbleView alloc] initWithFrame:CGRectMake(0, 568-150, 320, 150)];
    bubble.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:bubble];
    */
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 100, 320, 40)];
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    //searchBar.prompt = @"search";
    searchBar.showsSearchResultsButton = YES;
    searchBar.barStyle = UIBarStyleDefault;
    searchBar.delegate = self;
    
    [self.view addSubview:searchBar];
    
    
    NSString *kkk = @"2013-1-1";
    kkk = [kkk stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSLog(@"kkk = %@",kkk);
    
    
    NSArray *plotArr = [NSArray arrayWithObjects:@"1",@"2", nil];
    NSArray *plotValue = @[@{@1:plotArr[0]},
                           @{@2:@2}
                           ];
    NSLog(@"plotValue = %@",plotValue);
    
    NSDictionary *one = plotValue[0];
    NSLog(@"one = %@",one);
    NSString *oneKey = [one objectForKey:@1];
    NSLog(@"oneKey = %@",oneKey);
    
    NSDictionary *two = plotValue[1];
    NSLog(@"two = %@",two);
    NSString *twoKey = [two objectForKey:@2];
    NSLog(@"twoKey = %@",twoKey);
    
    
    
    //删除数组中不同元素，不要再排序（此方法不会乱序）
    NSMutableArray *expArray = [NSMutableArray arrayWithObjects:@"1650.00",@"580.00",@"580.00",@"180.00",@"0.00",@"0.00",@"0.00",@"0.00", nil];
    
    NSMutableArray *secArr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < expArray.count; i++) {
        [secArr addObject:expArray[i]];
        NSInteger index = [secArr indexOfObject:expArray[i] inRange:NSMakeRange(0, [secArr count] - 1)];
        if (index != NSNotFound) {
            [secArr removeObjectAtIndex:index];
        }
    }
    NSLog(@"expArray = %@",expArray);
    NSLog(@"secArr = %@",secArr);
    
    /*
    NSArray *pxArray = [expArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        float a = [obj1 floatValue];
        float b = [obj2 floatValue];
        if (a > b) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if (a < b) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
     */
    
    
    
    
    NSString *num = [self optimizeMinScaleNumber:@"97.1"];
    NSLog(@"num = %@",num);
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passValue:) name:@"noti" object:nil];
    
}

- (void)passValue:(NSNotification *)noti
{
    NSLog(@"noti.dic = %@",(NSDictionary *)noti.object);
}

//取9的最小倍数（条件：9的最小倍数必须大于所传参数）
- (NSString *)optimizeMinScaleNumber:(NSString *)num
{
    int n1 = [num intValue];
    float n2 = [num floatValue];
    
    if (n2 > (float)n1) {
        n1 += 1;
    }
    
    if (n1 % 9 != 0) {
        n1 = (n1 - (n1 % 9)) + 9;
    }
    
    NSString *number = [NSString stringWithFormat:@"%d",n1];
    return number;
}

#pragma mark - UISearchBar:delegate

-(void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"searchBarResultsListButtonClicked...");
    
    searchBar.searchResultsButtonSelected = YES;
    
    
}


#pragma mark - 时间与时间戳的相互转化

//NSString类型的时间转化成时间戳
- (NSString *)timeStampFromString:(NSString *)string withFormat:(NSString *)format
{
    NSDate *date = [self dateFromString:string withFormat:format];
    return [NSString stringWithFormat:@"%0.0f",[date timeIntervalSince1970]];
}

//时间戳转化成NSString类型的时间
- (NSString *)longlongToDate:(NSString *)sender withFormat:(NSString *)format
{
    if ([[self trim:sender] isEqualToString:@""] || sender == nil) {
        return @"";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[sender longLongValue]];
    return [self stringFromDate:date withFormat:format];
}

//清除空格和换行符
- (NSString *)trim:(NSString *)str
{
	return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

//NSString类型的时间转化成NSDate类型的时间
- (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format
{
	NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
	[inputFormatter setDateFormat:format];
	NSDate *date = [inputFormatter dateFromString:string];
	//[inputFormatter release];
	return date;
}

//NSDate类型的时间转化成NSString类型的时间
- (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
	[inputFormatter setDateFormat:format];
    
    NSString *string = [inputFormatter stringFromDate:date];
    //[inputFormatter release];
    return string;
    
}

//时间格式
- (NSString *)dateFormatterStyle
{
	return @"yyyy-MM-dd HH:mm:ss";
    
    /*
     "yyyy-MM-dd"
     "yyyyMMdd"
     "HH:mm:ss"
     "yyyy-MM"
     "yyyy-MM-dd HH:mm:00"
     "yyyy-MM-dd 00:00:00"
     "yyyy-MM-dd 23:59:59"
     "MM月dd日 hh:mm"
     "YYYY年MM月dd日"
     */
}


#pragma mark - 进入第三页

- (void)pushThird:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:[NSDictionary dictionaryWithObjectsAndKeys:@"12",@"text",@"YES",@"value", nil]];
    
    
    NSLog(@"......");
    ThirdViewController *third = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:third animated:YES];
}

#pragma mark - 进入地图

- (void)goToMap
{
    MapController *map = [[MapController alloc] init];
    [self.navigationController pushViewController:map animated:YES];
}

#pragma mark - 动画事件

- (void)animatedWithType:(id)sender
{
    UIButton *btn = (UIButton *)[self.view viewWithTag:99];
    
    [UIView animateWithDuration:1.0 animations:^{
        btn.transform = CGAffineTransformRotate(btn.transform, - M_PI_4);
//        btn.transform = CGAffineTransformScale(btn.transform, 1.5, 1.5);
        
    } completion:nil];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
