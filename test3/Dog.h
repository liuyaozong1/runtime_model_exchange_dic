//
//  Dog.h
//  test3
//
//  Created by liuyaozong on 2021/8/15.
//

#import <Foundation/Foundation.h>

//NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSString * age;
//字典转模型
-(instancetype)initWithDic:(NSDictionary *)dic;
-(NSDictionary *)modelConversionDic;
@end

//NS_ASSUME_NONNULL_END
