//
//  ViewController.m
//  TestDemo
//
//  Created by 沿途の风景 on 13-11-27.
//  Copyright (c) 2013年 Andy. All rights reserved.
//

#import "ViewController.h"
#import "StringHelper.h"
#import "UIBubbleView.h"

#import "SecondViewController.h"

#import "Sample.h"

typedef void(^BlockA)(void);

__attribute__((noinline))
void runBlockA(BlockA block) {
    block();
}

void doBlockA() {
    BlockA block = ^{
        // Empty block
    };
    runBlockA(block);
}

/***********************************************************************************/

//typedef void(^BlockB)(void);
//void foo(int);
//
//__attribute__((noinline))
//void runBlockB(BlockB block) {
//    block();
//}
//
//void doBlockB() {
//    int b = 128;
//    BlockB block = ^{
//        foo(b);
//    };
//    runBlockB(block);
//}

/***********************************************************************************/

//typedef void(^BlockC)(void);
//void foo2(NSString*);
//
//__attribute__((noinline))
//void runBlockC(BlockC block) {
//    block();
//}
//
//void doBlockC() {
//    NSString *c = @"C";
//    BlockC block = ^{
//        foo2(c);
//    };
//    runBlockC(block);
//}

/***********************************************************************************/

#define Block_copy(...) ((__typeof(__VA_ARGS__))_Block_copy((const void *)(__VA_ARGS__)))

//void *_Block_copy(const void *arg);
//
//void *_Block_copy(const void *arg) {
//    return _Block_copy_internal(arg, WANTS_ONE);
//}

/***********************************************************************************/

#define Block_release(...) _Block_release((const void *)(__VA_ARGS__))


/***********************************************************************************/



/***********************************************************************************/

struct Block_descriptor {
    unsigned long int reserved; //保留
    unsigned long int size;
    void (*copy)(void *dst, void *src);
    void (*dispose)(void *);
};

/*
 1.isa指针，所有对象都有该指针，用于实现对象相关的功能。
 2.flags，用于按bit位表示一些block的附加信息，本文后面介绍block copy的实现代码可以看到对该变量的使用。
 3.reserved，保留变量。
 4.invoke，函数指针，指向具体的block实现的函数调用地址。
 5.descriptor， 表示该block的附加描述信息，主要是size大小，以及copy和dispose函数的指针。
 6.variables，capture过来的变量，block能够访问它外部的局部变量，就是因为将这些变量（或变量的地址）复制到了结构体中。
 */

/*
 在objc语言中，共有3中block:
 1._NSConcreteGlobalBlock,全局的静态block，不会访问任何外部变量。
 2._NSConcreteStackBlock，保存在栈中的block，当函数返回时会被销毁。
 3._NSConcreteMallocBlock，保存在堆中的block，当引用计数为0时会被销毁。
 */



struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0 *Desc;
//    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int flags=0) {
//        impl.isa = &_NSConcreteStackBlock;
//        impl.Flags = flags;
//        impl.FuncPtr = fp;
//        Desc = desc;
//    }
    
};

@interface ViewController ()

@property (nonatomic,retain) UIView *contentView;
@property (nonatomic,retain) UIView *panView;
@property (nonatomic) CGPoint beginPoint;
@property (nonatomic) BOOL panDown;
@property (nonatomic) BOOL tapDown;



@end

@implementation ViewController

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
	
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"beep-beep" ofType:@"caf"];
//    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
//    
//    AVAudioPlayer *beep = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
//    [beep prepareToPlay];
//    [beep play];
    
    
    
//    NSURL *url = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"beep-beep" ofType:@"caf"] isDirectory:NO];
//    NSError *error;
//    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
//    if (!player) {
//        NSLog(@"Error loading %@: %@", url, error.localizedDescription);
//    }
//    else {
//        [player prepareToPlay];
//        [player play];
//    }

    
    
//    //系统音频ID，用来注册我们将要播放的声音
//    SystemSoundID sameViewSoundID;
//    //音乐文件路径
//    CFURLRef thesoundURL = (__bridge CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"beep-beep" ofType:@"caf"]];
//    //变量SoundID与URL对应
//    AudioServicesCreateSystemSoundID(thesoundURL, &sameViewSoundID);
//    //播放SoundID声音
//    AudioServicesPlaySystemSound(sameViewSoundID);
    
//    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 164, 320, 164)];
//    _contentView.backgroundColor = [UIColor orangeColor];
//    _contentView.clipsToBounds = NO;
//    [self.view addSubview:_contentView];
//    
//    _panView = [[UIView alloc] initWithFrame:CGRectMake(0, 328, 320, 30)];
//    _panView.backgroundColor = [UIColor redColor];
//    _panView.alpha = 0.6;
//    [self.view addSubview:_panView];
//    
//    
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
//    [_panView addGestureRecognizer:panGesture];
//    
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//    [_panView addGestureRecognizer:tapGesture];
//    
//    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 100)];
//    bgView.backgroundColor = [UIColor blueColor];
//    bgView.alpha = 0.6;
//    [self.view addSubview:bgView];
//    bgView.userInteractionEnabled = NO;
//    
//    
//    
//    NSString *str = @" #2# @111 @111 #2222# @11111 #22222# #22# @1 #222222222# ";
//    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
//    
//    NSMutableArray *mArray = [[NSMutableArray alloc] initWithCapacity:0];
//    NSMutableArray *tArray = [[NSMutableArray alloc] initWithCapacity:0];
//
//    NSMutableArray *array =  [NSMutableArray arrayWithArray:[str componentsSeparatedByString:@"@"]];
//    [array removeObject:@""];
//    NSLog(@"array = %@",array);
//
//    for (NSString *string in array) {
//        //NSLog(@"string = %@",string);
//
//        NSArray *arr = [string componentsSeparatedByString:@"#"];
//        //NSLog(@"arr = %@",arr);
//
//        if (arr.count==1) {
//            if (![mArray containsObject:[arr objectAtIndex:0]]) {
//                [mArray addObject:[arr objectAtIndex:0]];
//            }
//        }
//        else if (arr.count > 1)
//        {
//            if (![mArray containsObject:[arr objectAtIndex:0]]) {
//                [mArray addObject:[arr objectAtIndex:0]];
//
//            }
//            for (int i=1; i<arr.count; i++) {
//                if (![tArray containsObject:[arr objectAtIndex:i]]) {
//                    [tArray addObject:[arr objectAtIndex:i]];
//                }
//            }
//        }
//        
//    }
//    
//    [mArray removeObject:@""];
//    [tArray removeObject:@""];
//    //NSLog(@"marray = %@",mArray);
//    //NSLog(@"tarray = %@",tArray);
//
//    
//    
////    NSString *s = @"2013-1-1";
////    NSDate *date = (NSDate *)s;
////    NSLog(@"date=%@",date);
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    
//    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
//    NSString *dateStr = [dateFormatter stringFromDate:datenow];
//    NSLog(@"dateStr=%@",dateStr);
//    NSString *timeSp = [NSString stringWithFormat:@"%ld",(long)[datenow timeIntervalSince1970]];
//    
//    NSLog(@"timeSp=%@", timeSp);
//
//    NSMutableString *muStr = [[NSMutableString alloc] initWithString:@"19901206"];
//    [muStr insertString:@"-" atIndex:4];
//    [muStr insertString:@"-" atIndex:7];
//    NSLog(@"muStr=%@",muStr);
//    
    
    
//    UIBubbleView *bubbleView = [[UIBubbleView alloc] initWithFrame:CGRectMake(0, 100, 320, 200)];
//    bubbleView.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:bubbleView];
    
    
    self.view.backgroundColor = [UIColor blackColor];
    _scr = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _scr.delegate = self;
    //NSLog(@"_scr.frame=%@",NSStringFromCGRect(_scr.frame));
    [self.view addSubview:_scr];
    
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, 320, 300)];
    _img.image = [UIImage imageNamed:@"jump.jpg"];
    _img.center = _scr.center;
    _img.backgroundColor = [UIColor orangeColor];
    _img.userInteractionEnabled = YES;
    [_scr addSubview:_img];
    
    
    CGSize maxSize = _scr.frame.size;
    CGFloat widthRatio = maxSize.width/_img.frame.size.width;
    CGFloat heightRatio = maxSize.height/_img.frame.size.height;
    CGFloat initialZoom = (widthRatio > heightRatio) ? heightRatio : widthRatio;
    NSLog(@"initialZoom = %f",initialZoom);
    /*
     
     ** 设置UIScrollView的最大和最小放大级别（注意如果MinimumZoomScale == MaximumZoomScale，
     
     ** 那么UIScrllView就缩放不了了
     
     */
    [_scr setMinimumZoomScale:initialZoom];
    [_scr setMaximumZoomScale:2];
    // 设置UIScrollView初始化缩放级别
    [_scr setZoomScale:initialZoom];
    
    
    
    
    
//    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleImage:)];
//    pinchGR.delegate = self;
//    [_img addGestureRecognizer:pinchGR];
    
//    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveImage:)];
//    panGR.delegate = self;
//    panGR.maximumNumberOfTouches = 2;
//    panGR.minimumNumberOfTouches = 2;
//    [_img addGestureRecognizer:panGR];
    
    
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn setFrame:CGRectMake(100, 100, 100, 60)];
//    [btn setTitle:@"菜单" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn.titleLabel setFont:[UIFont systemFontOfSize:20]];
//    [btn addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
//    [btn setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:btn];
    //[btn becomeFirstResponder];
    
    
//    NSLog(@"我在玩手机！");
//    NSLog(@"手机没电了");
//    //[self performSelector:@selector(chargeMyPhone:) withObject:nil afterDelay:10];
//    [self chargeMyPhone:^{
//        NSLog(@"出去逛街！");
//    }];
//    NSLog(@"我在看电视！");
    
    
    
    NSMutableArray *myMutableArr = [[NSMutableArray alloc] init];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"price",@"2",@"number", nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"3",@"price",@"5",@"number", nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"3",@"price",@"1",@"number", nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"price",@"3",@"number", nil];
    [myMutableArr addObject:dic1];
    [myMutableArr addObject:dic2];
    [myMutableArr addObject:dic3];
    [myMutableArr addObject:dic4];
    //NSLog(@"myMutableArr=%@",myMutableArr);
    
    //剔选出price不同的值，并组成数组
    //本例中price等于1和3,arr = (1,3)
//    NSNumber * number;
//    NSMutableArray * arr= [[NSMutableArray alloc]init];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i<[myMutableArr count]; i++)
    {
        
//        number = [[myMutableArr objectAtIndex:i] valueForKey:@"price"];
//        [arr addObject:number];
        
        NSString *price = [myMutableArr[i] objectForKey:@"price"];
        [arr addObject:price];
    }
    
    arr = (NSMutableArray *)[[[NSSet setWithArray:arr] allObjects] sortedArrayUsingSelector:@selector(compare:)];
    //NSLog(@"arr==%@",arr);
//    NSSet *set = [NSSet setWithArray:arr];
//    NSLog(@"arr = %@",[[set allObjects] sortedArrayUsingSelector:@selector(compare:)]);
//    NSInteger cout = [[set allObjects] count];
    
    //根据arr数值的不同  得到price相同的分组
    NSMutableArray *lastArray = [[NSMutableArray alloc]init];//初始化最终的Array
    
    for (int i = 0; i<arr.count; i++)
    {
        __block  NSMutableArray * tempArray = [NSMutableArray arrayWithCapacity:0];
        [myMutableArr enumerateObjectsUsingBlock:^(NSDictionary * dic, NSUInteger idx, BOOL *stop) {
            
            NSString * name = [dic valueForKey:@"price"];
            NSRange range = [name rangeOfString:[NSString stringWithFormat:@"%@",arr[i]]];
            if (range.length != 0)
            {
                [tempArray addObject:dic];
            }
            
        }];
        //NSLog(@"tempArray = %@",tempArray);
        
        //把得到的分组数组 合并成最终数组
        [lastArray addObject:tempArray];
    }
    
    //NSLog(@"最终的Array = %@",lastArray);
    
    
    
    
//    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"price" ascending:YES]];
//    [myMutableArr sortUsingDescriptors:sortDescriptors];
//    NSLog(@"排序后的数组%@",myMutableArr);
    
    NSString *d1 = @"2013-10";
    NSString *d2 = @"2013-09";
    NSString *d3 = @"2014-01";
    NSString *d4 = @"2013-12";
    NSString *d5 = @"2013-11";
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:d1,d2,d3,d4,d5, nil];
    NSSortDescriptor *sortDescriptors = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    [array sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptors]];
    
    //array = [NSMutableArray arrayWithArray:[[[NSSet setWithArray:array] allObjects] sortedArrayUsingSelector:@selector(compare:options:)]];
    
    NSLog(@"array=%@",array);
    
    
    
    
    NSString *urlStr = @"www.badi.com";
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSLog(@"urlStr = %@",urlStr);
    NSLog(@"url = %@",url);
   
    NSString *newStr = [url absoluteString];
    NSLog(@"newStr = %@",newStr);
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"tagArray",@"topic",@"AtArray",@"member",@"nomarlArray",@"keyword", nil];
    NSLog(@"params=%@",params);
    
    
    
    //数组排序
    NSMutableArray *customArr = [NSMutableArray arrayWithObjects:@"b",@"a",@"d",@"e",@"c", nil];
    
    [customArr sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO]]];
    NSLog(@"customArr=%@",customArr);
    
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    //iOS6
    [dataArray setObject:@"4" atIndexedSubscript:1];
     NSLog(@"dataArray = %@",dataArray);
    
    //通用
    [dataArray replaceObjectAtIndex:1 withObject:@"5"];
    NSLog(@"dataArray = %@",dataArray);
    
    
    //数组嵌套字典排序
    NSMutableArray *mutiArray = [NSMutableArray arrayWithCapacity:0];
    NSMutableDictionary *mDict1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"a", nil];
    NSMutableDictionary *mDict2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"3",@"a", nil];
    NSMutableDictionary *mDict3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"0",@"a", nil];
    NSMutableDictionary *mDict4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"2",@"a", nil];
    [mutiArray addObject:mDict1];
    [mutiArray addObject:mDict2];
    [mutiArray addObject:mDict3];
    [mutiArray addObject:mDict4];
    
    NSArray *sortArray = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"a" ascending:YES]];
    [mutiArray sortUsingDescriptors:sortArray];
    NSLog(@"mutiArray = %@",mutiArray);
    
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            
        });
        
    });
    
    
    // 后台执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       // something
    });
    
    // 主线程执行
    dispatch_async(dispatch_get_main_queue(), ^{
        // something
    });
    
    // 一次性执行
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // code
    });
    // 延迟2秒执行：
    double delayInSeconds = 2.0;
    dispatch_time_t popTime =  dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
       // code
    });
    
    // 自定义queue
    dispatch_queue_t urls_queue = dispatch_queue_create("www.kakatoo.com", NULL);
    dispatch_async(urls_queue, ^{
       // your code
    });
    
    // 让后台2个线程并行执行，然后等2个线程都结束后，再汇总执行结果。
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        // 并行执行的线程一
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        // 并行执行的线程二
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
       // 汇总结果
    });
    
    //静态变量和简单Block
    for (int i = 0; i < 5; i++) {
        
        //[Sample addCount];
        [self addCount];
    }
    
    __block int c = 0;
    void (^foo)(void) = ^{
        c = 1;
        
    };
    foo();
    
    NSLog(@"c = %d",c);
    
    ^{printf("hello world \n");}();
    ^{printf("magic soft");}();
    
    
    [self blockSample];
    
    /*
     *关键字const什么含义？
     *
     int const a1;  // 整形常量  （a是一个常整形数）
     const int a2;  // 整形常量   （a是一个常整形数）
     const int *a3; // 常量整形（指针是常量）（a是一个指向常整形数的指针）
     int *const a4; // 整形常量指针（指针指向的数据是常量）（a是一个指向整形数的常指针）
     int const *a5; // 指针和数据都是常量（a是一个指向常整形数的常指针）
     *
     */
    
    /*
     *前两个的作用是一样，a是一个常整型数。
     第三个意味着a是一个指向常整型数的指针（也就是，整型数是不可修改的，但指针可以）。
     第四个意思a是一个指向整型数的常指针（也就是说，指针指向的整型数是可以修改的，但指针是不可修改的）。
     最后一个意味着a是一个指向常整型数的常指针（也就是说，指针指向的整型数是不可修改的，同时指针也是不可修改的）。
     */
    
    /*
     int i = 5;
     const int *i_p1 = &i;//中const修饰的是*ip, 这表明ip所指向的变量i是const的，类似*ip = 1的操作，编译的时候都会报错
     int const *i_p2 = &i;//同上
     int *const i_p3 = &i;//const修饰的是ip，说明指针本身是const，修改指针指向的变量是合法的，而类似++ip修改指针本身的操作是违法的
     const int *const i_p4 = &i;//指针本身和指向的变量都是const的。前面的const不让修改i_p4的值，后面的const不让修改i_p4的地址
     */
    
    /*
     下面分别用const限定不可变的内容是什么？
     1）const在前面
     const int nValue； //nValue是const
     const char *pContent; //(*pContent是const, pContent可变)
     const char* const pContent; //pContent和*pContent都是const
     
     2）const在后面，与上面的声明对等
     int const nValue; //nValue是const
     char const * pContent; //(*pContent是const, pContent可变)
     char* const pContent; //pContent是const,*pContent可变
     char const* const pContent; //pContent和*pContent都是const
     　　
     答案与分析：
     const和指针一起使用是C语言中一个很常见的困惑之处，在实际开发中，特别是在看别人代码的时候，常常会因为这样而不好判断作者的意图，下面讲一下我的判断原则：
     const只修饰其后的变量，至于const放在类型前还是类型后并没有区别。如：const int a和int const a都是修饰a为const。*不是一种类型，如果*pType之前是某类型，那么pType是指向该类型的指针一个简单的判断方法：指针运算符*，是从右到左，那么如：char const * pContent，可以理解为char const (* pContent)，即* pContent为const，而pContent则是可变的。
     */
    
    NSString const *string = @"1";
    NSLog(@"string -> %p",string);
    string = @"2";
    NSLog(@"string -> %p",string);
    
    NSLog(@"string = %@",string);
    
    const NSString *string1 = @"2";
    string1 = @"3";
    NSLog(@"string1 = %@",string1);
    
    //以上效果一致，*string(x)为const修饰，string(x)可改变，指针指向的变量的值不可变，指针的指向可变
    
    const NSString *const string2 = @"3";
    NSLog(@"string2 = %@",string2);
    //指针的值和地址都不能变
    
    //const在前在后都是一样
    
    /*
     int const * p1,p2;
     p2是const；(*p1)是一整体，因此(*p1)是const，但p1是可变的。int * p1,p2只代表p1是指向整型的指针，要表示p1、p2都是指针是需写成int * p1,* p2。所以无论是* const p1,p2还是const * p1,p2，里面的*都是属于p1的。
     */
    
    /*
     int const * const p1,p2;
     p2是const，是前一个const修饰的，*p1也被前一个const修饰，而p1被后一个const修饰。
     */
    
    /*
     int * const p1,p2;
     p1是const，（* const p1）是整体，所以const不修饰p2。
     */
    
    
    /*
     指针指向及其指向变量的值的变化
     
     const在*的左边，则指针指向的变量的值不可变；在*的右边，则指针的指向不可变。简记为“左定值，右定向”。
     1）指针指向的变量的值不能变，指向可变
     　　int x = 1;
     　　int y = 2;
     　　const int* px = &x;　　int const* px = &x; //这两句表达式一样效果
     　　px = &y; //正确，允许改变指向
     　　*px = 3; //错误，不允许改变指针指向的变量的值
     　　2）指针指向的变量的值可以改变，指向不可变
     　　 int x = 1;
     　　int y = 2;
     　　int* const px = &x;
     　　 　　px = &y; //错误，不允许改变指针指向
     　　*px = 3; //正确，允许改变指针指向的变量的值
     　　3）指针指向的变量的值不可变，指向不可变
     　　 int x = 1;
     　　int y = 2;
     　　const int* const px = &x;　　int const* const px = &x;
     　　 　　px = &y; //错误，不允许改变指针指向
     　　*px = 3; //错误，不允许改变指针指向的变量的值
     
     补充
     
     在c中，对于const定义的指针，不赋初值编译不报错，
     即int* const px;等不会报错。
     但是，在C++中:
     int* const px;和const int* const px;会报错，const int* px;不报错。
     必须初始化指针的指向int* const px = &x;const int* const px=&x;
     强烈建议在初始化时说明指针的指向，防止出现野指针！
     */
    
    
    //标签的用法
    
    //MARK:标签
    
    //TODO:标签
    
    //FIXME:标签
    
    //???:标签
}
#pragma mark - 标签
//MARK:标签
//TODO:标签
//FIXME:标签
//???:标签

- (void)blockSample
{
    void(^block)(void) = ^{
        NSLog(@"I'm a block!");
    };
    
    
    /*
     ***wrong****
     
    void(^block1)(int x) = ^{
        NSLog(@"I'm a block! x = %i",x);
    };
     */
    
    int(^block2)(void) = ^{
        NSLog(@"I'm a block!");
        return 1;
    };
    
    int a = 1;
    void(^block3)(void) = ^{
        NSLog(@"I'm a block! a = %i",a);
    };
    
}

//static int a = 100;(方法外与方法内没什么区别，都是只创建一次)
- (void)addCount
{
    static int b = 100; //只创建一次，就是程序启动的时候
    
    //static int const b = 100; //加上const意味着“只读”，就是不能再给b去写值，否则报错
    
    /*
    __block int b = 100; //每次都创建
    void (^count)(void) = ^{
        b = 101;//通过Block来改变__block定义的变量
    };
    count();
     */
    b ++;
    NSLog(@"b=%d",b);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"_scr.contentOffset.x = %f",_scr.contentOffset.x);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //NSLog(@"......");
    return _img;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    _img.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                 scrollView.contentSize.height * 0.5 + offsetY);
    
    NSLog(@"_img.center=%@",NSStringFromCGPoint(_img.center));
}

//缩放图片
- (void)scaleImage:(id)sender
{
    UIPinchGestureRecognizer *pinch = (UIPinchGestureRecognizer *)sender;
    
//    if (pinch.state == UIGestureRecognizerStateBegan) {
//        NSLog(@"pinch.scale = %f",pinch.scale);
//        lastScale = 1.0;
//    }
//    if (pinch.state == UIGestureRecognizerStateChanged) {
//        CGFloat scale = 1.0 - (lastScale - pinch.scale);
////        NSLog(@"scale=%f",pinch.scale);
//        
//        pinchScale = pinch.scale;
//        
//        CGAffineTransform currentTransform = _img.transform;
//        CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
//        [_img setTransform:newTransform];
//        
//        lastScale = pinch.scale;
//    }
    
    
//    if (pinch.state == UIGestureRecognizerStateEnded) {
//        
//        NSLog(@"_img.frame1 = %@",NSStringFromCGRect(_img.frame));
//        NSLog(@"_scr.frame1 = %@",NSStringFromCGRect(_scr.frame));
//        
//        if (_img.frame.size.width < 320) {
//            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//                
//                _scr.contentOffset = CGPointMake(0, 0);
//                _scr.contentSize = CGSizeMake(0, 0);
//                _img.transform = CGAffineTransformIdentity;
//                return;
//            } completion:nil];
//            
//        }
//        if (_img.frame.size.width > 320) {
//            
//            CGFloat width = _img.frame.size.width;
//            _scr.contentSize = CGSizeMake(width, 0);
//            
//            if (_img.frame.origin.x > 0) {
//                _scr.contentOffset = CGPointMake(-_img.frame.origin.x, 0);
//            }
//            
//            CGRect imgRect = _img.frame;
//            imgRect.origin.x = 0;
//            _img.frame = imgRect;
//            
//            CGFloat height = _img.frame.size.height;
//            if (height > self.view.bounds.size.height + 20) {
//
//                _scr.contentSize = CGSizeMake(width, height);
//                
//                if (_img.frame.origin.y > 0) {
//                    _scr.contentOffset = CGPointMake(-_img.frame.origin.x, _img.frame.origin.y);
//                }
//                
//                CGRect imgRect = _img.frame;
//                imgRect.origin.y = 0;
//                _img.frame = imgRect;
//                
//                [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//                    
//                    CGRect rect = _img.frame;
//                    rect.size.height = self.view.bounds.size.height + 20;
//                    _img.frame = rect;
//                    
//                } completion:nil];
//            }
//        
//        }
//        
//        NSLog(@"_img.frame2 = %@",NSStringFromCGRect(_img.frame));
//        NSLog(@"_scr.frame2 = %@",NSStringFromCGRect(_scr.frame));
//    }
    
    if (pinch.state == UIGestureRecognizerStateEnded) {
        
    }
//
//    CGFloat scale = 1.0 - (lastScale - pinch.scale);
//    CGAffineTransform currentTransform = pinch.view.transform;
//    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
//    
//    [pinch.view setTransform:newTransform];
//    
//    lastScale = pinch.scale;
}

//移动图片
- (void)moveImage:(id)sender
{
    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)sender;
    
    CGPoint translatedPoint = [pan translationInView:_scr];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        lastX = _img.center.x;
        lastY = _img.center.y;
    }
    
    translatedPoint = CGPointMake(lastX + translatedPoint.x, lastY + translatedPoint.y);
    _img.center = translatedPoint;
    
    //松手时判断缩放倍数若小于1.7，让图片还原，若大于1.7，让图片全屏
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (pinchScale <= 1.7) {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                //让图片平滑从现有状态还原的关键方法，乘以还原矩阵
                _img.transform = CGAffineTransformIdentity;
                
                //收复起始中心点
                CGPoint p = _scr.center;
                _img.center = p;
                
                
            } completion:nil];
        }
        else {
            
            //缩放倍数大于1.7时，平滑过渡到全屏
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                //当不仅需要旋转角度变换，还需要缩放和位移变换的时候，需要手工写仿射变换矩阵，不能单纯的用CGAffineTransformRotate或者CGAffineTransformScale，其实后两者都是仿射变换矩阵的一部分
                
                CGAffineTransform newTransform=CGAffineTransformMake(_scr.bounds.size.width/_img.bounds.size.width, 0, 0, _scr.bounds.size.width/_img.bounds.size.width, 0, 0);
                
                //设置图片中心点为屏幕的中心点
                
                CGPoint p = _scr.center;
                
                [_img setTransform:newTransform];
                
                [_img setCenter:p];
                
            } completion:nil];
        }
    }
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
//    return ![gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
    return YES;
}



- (void)chargeMyPhone:(void(^)(void))finishBlock
{
    double delayInSeconds = 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"电充好了！");
        finishBlock();
    });
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(showCurrentTally:) || action == @selector(showAllTally:)) {
        return YES;
    }
    return NO;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)showMenu:(id)sender
{
    NSLog(@"btn is pressed!!!");
    UIButton *btn = (UIButton *)sender;
    
    UIMenuItem *currentTally = [[UIMenuItem alloc] initWithTitle:@"当前账单" action:@selector(showCurrentTally:)];
    UIMenuItem *allTally = [[UIMenuItem alloc] initWithTitle:@"所有账单" action:@selector(showAllTally:)];
    
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setMenuItems:[NSArray arrayWithObjects:currentTally,allTally, nil]];
    [menu setMenuVisible:YES animated:YES];
//    [menu setTargetRect:CGRectMake(50, 55, 0, 0) inView:sender];
    [menu setTargetRect:btn.frame inView:self.view];
    [menu setArrowDirection:UIMenuControllerArrowUp];
    
    [self becomeFirstResponder];
    
}

- (void)showCurrentTally:(id)sender
{
    NSLog(@"showCurrentTally...");
    //[[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
}

- (void)showAllTally:(id)sender
{
    NSLog(@"showAllTally...");
    //[[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
}


- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    
    [UIView animateWithDuration:0.75
                          delay:0.01
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void){
                         
                         if (_tapDown) {
                             _tapDown = NO;
                             
                             _contentView.center = CGPointMake(_contentView.center.x, 245);
                             _panView.center = CGPointMake(_panView.center.x, 254/2 + _contentView.center.y - _panView.frame.size.height);
                         }
                         else {
                             _tapDown = YES;
                             
                             _contentView.center = CGPointMake(_contentView.center.x, 82);
                             _panView.center = CGPointMake(_panView.center.x, 82 + _contentView.center.y + _panView.frame.size.height/2);
                         }
                         
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:_panView];
    
    recognizer.view.center = CGPointMake(recognizer.view.center.x,
                                         recognizer.view.center.y + translation.y);
    _contentView.center = CGPointMake(_contentView.center.x, _contentView.center.y+translation.y);
    
    float y = _contentView.center.y + translation.y;
    if (y < 82) {
        y = 82;
        _contentView.center = CGPointMake(_contentView.center.x, y);
        _panView.center = CGPointMake(_panView.center.x, y + _contentView.center.y + _panView.frame.size.height/2);
    }
    
    if (y > 245) {
        y = 245;
        _contentView.center = CGPointMake(_contentView.center.x, y);
        _panView.center = CGPointMake(_panView.center.x, 254/2 + _contentView.center.y - _panView.frame.size.height);
    }
    
    if (translation.y > 0) {
        _panDown = YES;
    }
    else if (translation.y < 0) {
        _panDown = NO;
    }
    
    //NSLog(@"translation.y = %f",translation.y);
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        float offY = _contentView.center.y;
        //NSLog(@"offY = %f",offY);
        
        [UIView animateWithDuration:0.75
                              delay:0.01
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^(void){
                             
                             if (offY > 120 && _panDown) {
                                 _contentView.center = CGPointMake(_contentView.center.x, 245);
                                 _panView.center = CGPointMake(_panView.center.x, 254/2 + _contentView.center.y - _panView.frame.size.height);
                                 _tapDown = NO;
                             }
                             else {
                                 _contentView.center = CGPointMake(_contentView.center.x, 82);
                                 _panView.center = CGPointMake(_panView.center.x, 82 + _contentView.center.y + _panView.frame.size.height/2);
                                  _tapDown = YES;
                             }
                             
                         } completion:^(BOOL finished) {
                             
                         }];
    }
    
    [recognizer setTranslation:CGPointZero inView:_panView];
}

@end
