//
//  ViewController.m
//  test3
//
//  Created by liuyaozong on 2021/8/15.
//

#import "ViewController.h"
#import "Dog.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *dic = @{@"name":@"小花",@"age":@"2"};
    Dog *dog = [Dog new];
    [dog setName:@"小狗"];
    [dog age];
    
    Dog *temp = [[Dog alloc] initWithDic:dic];

    NSLog(@"小狗名字是 %@----小狗年龄是 %@",temp.name,temp.age);
    NSDictionary *dic2 = [temp modelConversionDic];
    NSLog(@"转出来的字典是  ---%@",dic2);
}


@end
