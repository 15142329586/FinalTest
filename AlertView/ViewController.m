//
//  ViewController.m
//  navTest
//
//  Created by Cheshi on 2017/9/25.
//  Copyright © 2017年 hehe. All rights reserved.
//

#import "ViewController.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    UIView *naviBackgroundView;
    CGFloat _kMaxContentOffsetY;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"hello";
//    self.navigationController.navigationBar
//    self.navigationController.topViewController
//    self.navigationController.visibleViewController
//    self.navigationController.navigationItem
//    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
     _kMaxContentOffsetY = SCREEN_WIDTH/750.0 * 364 - 64;//最大滑动渐变距离
    
    naviBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, 64)];
    naviBackgroundView.backgroundColor = [UIColor blueColor];
    naviBackgroundView.alpha = 0;
    [self.view addSubview:naviBackgroundView];
    
    
//    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
//    customView.backgroundColor = [UIColor greenColor];
//    [self.navigationController.navigationBar addSubview:customView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 200, 150) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    //设置了代理方法高度，这个设置将无效
    _tableView.rowHeight = 20;
    _tableView.layer.masksToBounds = YES;
    _tableView.layer.cornerRadius = 10;
//    _tableView.rowHeight = UITableViewAutomaticDimension;
    //ios7出现的属性
//    _tableView.estimatedRowHeight = 66;
    _tableView.backgroundColor = [UIColor redColor];
    _tableView.tableFooterView = [UIView new];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TCCardConsumeCellReuseIdentifier"];
    [self.view addSubview:_tableView];
    
    //YES 可以正常运行，如果是NO,崩溃，并控制台打印出This set method should be overridden
//    NSAssert(YES, @"This set method should be overridden");
    //如果不是在主线程，程序崩溃并且控制台会打印出参数2的描述
//    NSAssert(![NSThread isMainThread], @"This method must be called on the main thread");
//    NSAssert(_tableView, @"View must not be nil.");
    
//    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
 
    
//    DISPATCH_QUEUE_CONCURRENT
    //串队列+同步   未开启新线程，任务串行，一个执行完下一个，添加到队列马上执行（不用）
    //并行队列+同步  未开启新线程，只有一个线程，只能一个执行完下一个，添加到队列马上执行（不用）
    
    //并行+异步  可同时开启多个线程，任务交替执行，不一定哪个先执行，任务加到队列之后才执行（用较多）
    //串行+异步  开启一条新线程   任务是串行，所以一个执行完下一个，任务加到队列之后才执行
    
    //主队列 、主线程中执行
    //主队列+同步  互等卡住，不可行（在主线程中调用），主队列
    //主队列+异步  虽然是异步具备开启新线程的能力，但因为是主队列，任务必须在主线程中执行，所以只能一个接一个执行 ，不是马上执行
    
    
    //线程之间的通讯
    
//    NSLog(@"asyncConcurrent---begin");
    
//    dispatch_queue_t queue= dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    
//    dispatch_sync(queue, ^{
//        for (int i = 0; i < 2; ++i) {
//            NSLog(@"1------%@",[NSThread currentThread]);
//        }
//    });
//    
//    dispatch_sync(queue, ^{
//       
//        for (int i = 0; i < 2; ++i) {
//            NSLog(@"2------%@",[NSThread currentThread]);
//        }
//    });
//
//    dispatch_sync(queue, ^{
//      
//        for (int i = 0; i < 2; ++i) {
//            NSLog(@"3------%@",[NSThread currentThread]);
//        }
//    });
//
//    NSLog(@"asyncConcurrent---end");
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        for (int i = 0; i < 2; ++i) {
//            NSLog(@"1------%@",[NSThread currentThread]);
//        }
//        
//        // 回到主线程
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"2-------%@",[NSThread currentThread]);
//        });
//    });
    
    
//    GCD的栅栏方法 dispatch_barrier_async
//    我们有时需要异步执行两组操作，而且第一组操作执行完之后，才能开始执行第二组操作。这样我们就需要一个相当于栅栏一样的一个方法将两组异步执行的操作组给分割起来，当然这里的操作组里可以包含一个或多个任务。这就需要用到dispatch_barrier_async方法在两个操作组间形成栅栏。
   
//    dispatch_queue_t queue = dispatch_queue_create("12312312", DISPATCH_QUEUE_CONCURRENT);
//    
//    dispatch_async(queue, ^{
//        NSLog(@"----1-----%@", [NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"----2-----%@", [NSThread currentThread]);
//    });
//    
//    dispatch_barrier_async(queue, ^{
//        NSLog(@"----barrier-----%@", [NSThread currentThread]);
//    });
//    
//    dispatch_async(queue, ^{
//        NSLog(@"----3-----%@", [NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"----4-----%@", [NSThread currentThread]);
//    });
    
    
//    GCD的延时执行方法 dispatch_after
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 2秒后异步执行这里的代码...
//        NSLog(@"run-----");
//    });
    
    
//    GCD的一次性代码(只执行一次) dispatch_once
//    我们在创建单例、或者有整个程序运行过程中只执行一次的代码时，我们就用到了GCD的dispatch_once方法。使用dispatch_once函数能保证某段代码在程序运行过程中只被执行1次。
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        // 只执行1次的代码(这里面默认是线程安全的)
//    });
    
//    GCD的队列组 dispatch_group
//    有时候我们会有这样的需求：分别异步执行2个耗时操作，然后当2个耗时操作都执行完毕后再回到主线程执行操作。这时候我们可以用到GCD的队列组。
//    我们可以先把任务放到队列中，然后将队列放入队列组中。
//    调用队列组的dispatch_group_notify回到主线程执行操作。
    
//    dispatch_group_t group =  dispatch_group_create();
//    
//    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // 执行1个耗时的异步操作
//    });
//    
//    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // 执行1个耗时的异步操作
//    });
//    
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        // 等前面的异步操作都执行完毕后，回到主线程...
//    });
    
   
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
   
        CGFloat percent = scrollView.contentOffset.y / _kMaxContentOffsetY;
        naviBackgroundView.alpha = percent;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TCCardConsumeCellReuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld  %f  %f",(long)indexPath.row, tableView.estimatedRowHeight,tableView.rowHeight];
    if (indexPath.row == 0) {
        cell.imageView.backgroundColor = [UIColor orangeColor];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 90;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
