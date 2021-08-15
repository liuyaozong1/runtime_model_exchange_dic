//
//  Dog.m
//  test3
//
//  Created by liuyaozong on 2021/8/15.
//

#import "Dog.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation Dog

//字典转模型
-(instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        for (NSString * key in dic.allKeys) {
            id value = dic[key];
            //注意首字母需要大写
            NSString *methodName = [NSString stringWithFormat:@"set%@:",key.capitalizedString];
            //根据名称获取方法
            SEL seletor = NSSelectorFromString(methodName);
            if (seletor) {
                //消息转发: 在调用 objc_msgSend需要进行一个类型强转,不然会报错
                ((void(*)(id,SEL,id))objc_msgSend)(self,seletor,value);
            }
            
        }
        return self;
    }
    return  nil;
}



//模型转字典

-(NSDictionary *)modelConversionDic {
    unsigned int count = 0;
    //获取当前类的所有属性
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    if (count != 0) {
        //创建字典
        NSMutableDictionary *dic = [@{} mutableCopy];
        for (int i = 0; i < count; i++) {
            //获取属性名称
            const void *propertyName = property_getName(properties[i]);
            //转换成 nsstring
            NSString *name = [[NSString alloc] initWithCString:propertyName encoding:NSUTF8StringEncoding];
            if (name) {
                SEL method = NSSelectorFromString(name);
                if (method) {
                    //获取当前的值
                    id value =  ((id(*)(id,SEL))objc_msgSend)(self,method);
                    //添加到字典中
                    [dic setValue:value forKey:name];
                } else {
                    [dic setValue:@"" forKey:name];
                    
                }
            }
        }
        //释放
        free(properties);
        return  dic;
    }
    return  nil;
}

@end
