//
//  ViewController.m
//  AddressBookDemo
//
//  Created by heihei on 15/12/28.
//  Copyright © 2015年 huiju. All rights reserved.
//

#import "ViewController.h"
#import <Contacts/Contacts.h>
#import <AddressBook/AddressBook.h>

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /**
     *  加入智家狗联系方式
     */
//    [self saveZhiJiaGouContact];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method
//- (void)saveZhiJiaGouContact {
//    
//    //这个变量用于记录授权是否成功，即用户是否允许我们访问通讯录
//    int __block tip=0;
//    //声明一个通讯簿的引用
//    ABAddressBookRef addBook = nil;
//    //因为在IOS6.0之后和之前的权限申请方式有所差别，这里做个判断
//    //创建通讯簿的引用
//    addBook = ABAddressBookCreateWithOptions(NULL, NULL);
//    //创建一个出事信号量为0的信号
//    dispatch_semaphore_t sema=dispatch_semaphore_create(0);
//    //申请访问权限
//    ABAddressBookRequestAccessWithCompletion(addBook, ^(bool greanted, CFErrorRef error)        {
//        //greanted为YES是表示用户允许，否则为不允许
//        if (!greanted) {
//            tip=1;
//        }
//        //发送一次信号
//        dispatch_semaphore_signal(sema);
//    });
//    //等待信号触发
//    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//    if (tip) {
//        //做一个友好的提示
//        UIAlertView * alart = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请您设置允许APP访问您的通讯录\nSettings>General>Privacy" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alart show];
//        return;
//    }
//    
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
//        // 处理上面的ABbook
//        CFRelease(addBook);
//        
//        CNContactStore * contactStroe = [[CNContactStore alloc]init];
//        //检索条件，检索所有名字中有zhang的联系人
//        NSPredicate * predicate = [CNContact predicateForContactsMatchingName:@"智家狗"];
//        //提取数据
//        NSArray * contacts = [contactStroe unifiedContactsMatchingPredicate:predicate keysToFetch:@[CNContactGivenNameKey] error:nil];
//        // 判断通讯录中是否已经含有智家狗联系方式
//        if ([contacts count]) {
//            // 已经存在
//            return;
//        }
//    
//        // 创智家狗联系信息
//        CNMutableContact *contact = [[CNMutableContact alloc] init];
//        // 头像
//        UIImage *logo = [UIImage imageNamed:@"zhiJiaGouHead"];
//        NSData *dataRef = UIImagePNGRepresentation(logo);
//        contact.imageData = dataRef;
//        //设置名字
//        contact.givenName = @"智家狗";
//        //设置姓氏
//        contact.familyName = @"慧居智能";
//        // 号码1
//        CNLabeledValue *phoneNumber1 = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:@"18888888888"]];
//        // 号码2
//        CNLabeledValue *phoneNumber2 = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:@"18888888888"]];
//        // 号码3
//        CNLabeledValue *phoneNumber3 = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:@"18888888888"]];
//        // 号码4
//        CNLabeledValue *phoneNumber4 = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:@"18888888888"]];
//        contact.phoneNumbers = @[phoneNumber1,phoneNumber2,phoneNumber3,phoneNumber4];
//        
//        
//        // 邮箱
//        CNLabeledValue *homeEmail = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:@"327985496@qq.com"];
//        CNLabeledValue *workEmail =[CNLabeledValue labeledValueWithLabel:CNLabelWork value:@"327985496@qq.com"];
//        contact.emailAddresses = @[homeEmail,workEmail];
//        
//        // 地址
//        CNMutablePostalAddress * homeAdress = [[CNMutablePostalAddress alloc]init];
//        homeAdress.street = @"茶园长江工业园区江溪路11号慧居智能有限公司";
//        homeAdress.city = @"南岸区";
//        homeAdress.state = @"重庆市";
//        homeAdress.postalCode = @"40000";
//        contact.postalAddresses = @[[CNLabeledValue labeledValueWithLabel:CNLabelHome value:homeAdress]];
//        
//        // 生日
//        NSDateComponents * birthday = [[NSDateComponents  alloc]init];
//        birthday.day=01;
//        birthday.month=10;
//        birthday.year=1993;
//        contact.birthday = birthday;
//        
//        //初始化方法
//        CNSaveRequest * saveRequest = [[CNSaveRequest alloc]init];
//        //添加联系人
//        [saveRequest addContact:contact toContainerWithIdentifier:nil];
//        
//        // 进行写入操作
//        CNContactStore * store = [[CNContactStore alloc]init];
//        [store executeSaveRequest:saveRequest error:nil];
//    }else {
//        
//        NSArray *array = (__bridge NSArray*)ABAddressBookCopyArrayOfAllPeople(addBook);
//        // 遍历所有的联系人
//        for (id obj in array) {
//            ABRecordRef people = (__bridge ABRecordRef)obj;
//            NSString *firstName = (__bridge NSString*)ABRecordCopyValue(people, kABPersonFirstNameProperty);
//            NSString *lastName = (__bridge NSString*)ABRecordCopyValue(people, kABPersonLastNameProperty);
//            if ([firstName isEqualToString:@"智家狗"] &&[lastName isEqualToString:@"慧居智能"]) {
//                // 智家狗联系方式已经存在
//                return;
//            }
//        }
//        // 保存修改的通讯录对象
//        ABAddressBookSave(addBook, NULL);
//        
//        
//        //创建一个联系人引用
//        ABRecordRef person = ABPersonCreate();
//        NSString *firstName = @"智家狗";
//        NSString *lastName = @"慧居智能";
//        // 电话号码数组
//        NSArray *phones = [NSArray arrayWithObjects:@"123",@"456",nil];
//        // 电话号码对应的名称
//        NSArray *labels = [NSArray arrayWithObjects:@"iphone",@"home",nil];
//        //这里的字段和上面的字段完全相同
//        // 设置名字属性
//        ABRecordSetValue(person, kABPersonFirstNameProperty,(__bridge CFStringRef)firstName, NULL);
//        // 设置姓氏属性
//        ABRecordSetValue(person, kABPersonLastNameProperty, (__bridge CFStringRef)lastName, NULL);
//        // 字典引用
//        ABMultiValueRef dic =ABMultiValueCreateMutable(kABMultiStringPropertyType);
//        // 添加电话号码与其对应的名称内容
//        for (int i = 0; i < [phones count]; i ++) {
//            ABMultiValueIdentifier obj = ABMultiValueAddValueAndLabel(dic,(__bridge CFStringRef)[phones objectAtIndex:i], (__bridge CFStringRef)[labels objectAtIndex:i], &obj);
//        }
//        // 设置phone属性
//        ABRecordSetValue(person, kABPersonPhoneProperty, dic, NULL);
//        CFRelease(dic);
//        // 将新建的联系人添加到通讯录中
//        ABAddressBookAddRecord(addBook, person, NULL);
//        // 保存通讯录数据
//        ABAddressBookSave(addBook, NULL);
//        
//        CFRelease(person);
//        CFRelease(addBook);
//    }
////    CNContact *contact = [CNContact ]
//}

/**
 *  ios9.0的系统获取权限
 *
 *  @param addbook
 *
 *  @return yes 为有权限  ，no 为无权限
 */
- (BOOL)registRequestAccess {
    
    //这个变量用于记录授权是否成功，即用户是否允许我们访问通讯录
    int __block tip=0;
    //创建一个出事信号量为0的信号
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    //申请访问权限
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (!granted) {
            tip = 1;
        }
        //        //发送一次信号
        dispatch_semaphore_signal(sema);
    } ];
    //等待信号触发
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    if (tip) {
        //做一个友好的提示
        //        UIAlertView * alart = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请您设置允许APP访问您的通讯录\nSettings>General>Privacy" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        //        [alart show];
        return NO;
    }else {
        return YES;
    }
}

- (IBAction)saveForNew:(id)sender {

    CNContactStore * contactStroe = [[CNContactStore alloc]init];
    
    // 权限状态
    CNAuthorizationStatus autorizationStatus = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    switch (autorizationStatus) {
        case CNAuthorizationStatusNotDetermined:
            if (![self registRequestAccess]) return;
            break;
        case CNAuthorizationStatusDenied:
            return;
            break;
        default:
            break;
    }
    // 注册权限
//    int __block tip = 0;
//    [contactStroe requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
//        if (granted) {
//            tip = 1;
//        }
//    }];
    
    //检索条件，检索所有名字中有zhang的联系人
    NSPredicate * predicate = [CNContact predicateForContactsMatchingName:@"钉钉"];
    //提取数据
    NSArray * contacts = [contactStroe unifiedContactsMatchingPredicate:predicate keysToFetch:@[CNContactGivenNameKey,CNContactImageDataKey,CNContactPhoneNumbersKey] error:nil];
    // 判断通讯录中是否已经含有智家狗联系方式
    if ([contacts count]) {
        // 已经存在
        CNMutableContact *contactPerson = [[contacts firstObject] mutableCopy];
        UIImage *head = [UIImage imageWithData:contactPerson.imageData];
        NSLog(@"%@",head);
        return;
    }
//    if (tip) {
//        //做一个友好的提示
//        UIAlertView * alart = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请您设置允许APP访问您的通讯录\nSettings>General>Privacy" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alart show];
//        return;
//    }
    
    // 创智家狗联系信息
    CNMutableContact *contact = [[CNMutableContact alloc] init];
    // 类型
    contact.contactType = CNContactTypePerson;
    // 头像
    contact.imageData = UIImagePNGRepresentation([UIImage imageNamed:@"Default"]);
    //设置名字
    contact.givenName = @"智家狗";
    //设置姓氏
    contact.familyName = @"慧居智能";
    // 号码1
    CNLabeledValue *phoneNumber1 = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:@"18084054448"]];
    // 号码2
    CNLabeledValue *phoneNumber2 = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:@"123456789"]];
    // 号码3
    CNLabeledValue *phoneNumber3 = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:@"18888888888"]];
    // 号码4
    CNLabeledValue *phoneNumber4 = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:@"18888888888"]];
    contact.phoneNumbers = @[phoneNumber1,phoneNumber2,phoneNumber3,phoneNumber4];
    
    
    // 邮箱
    CNLabeledValue *homeEmail = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:@"327985496@qq.com"];
    CNLabeledValue *workEmail =[CNLabeledValue labeledValueWithLabel:CNLabelWork value:@"327985496@qq.com"];
    contact.emailAddresses = @[homeEmail,workEmail];
    
    // 地址
    CNMutablePostalAddress * homeAdress = [[CNMutablePostalAddress alloc]init];
    homeAdress.street = @"茶园长江工业园区江溪路11号慧居智能有限公司";
    homeAdress.city = @"南岸区";
    homeAdress.state = @"重庆市";
    homeAdress.postalCode = @"40000";
    contact.postalAddresses = @[[CNLabeledValue labeledValueWithLabel:CNLabelHome value:homeAdress]];
    
    // 生日
    NSDateComponents * birthday = [[NSDateComponents  alloc]init];
    birthday.day=01;
    birthday.month=10;
    birthday.year=1993;
    contact.birthday = birthday;
    
    //初始化方法
    CNSaveRequest * saveRequest = [[CNSaveRequest alloc]init];
    
    //添加联系人
    [saveRequest addContact:contact toContainerWithIdentifier:nil];
    
    // 进行写入操作
    [contactStroe executeSaveRequest:saveRequest error:nil];
}

- (IBAction)saveForOld:(id)sender {
    //这个变量用于记录授权是否成功，即用户是否允许我们访问通讯录
    int __block tip=0;
    //声明一个通讯簿的引用
    ABAddressBookRef addBook = nil;
    //因为在IOS6.0之后和之前的权限申请方式有所差别，这里做个判断
    //创建通讯簿的引用
    addBook = ABAddressBookCreateWithOptions(NULL, NULL);
    //创建一个出事信号量为0的信号
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    //申请访问权限
    ABAddressBookRequestAccessWithCompletion(addBook, ^(bool greanted, CFErrorRef error)        {
        //greanted为YES是表示用户允许，否则为不允许
        if (!greanted) {
            tip=1;
        }
        //发送一次信号
        dispatch_semaphore_signal(sema);
    });
    //等待信号触发
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    if (tip) {
        //做一个友好的提示
        UIAlertView * alart = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请您设置允许APP访问您的通讯录\nSettings>General>Privacy" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alart show];
        return;
    }
    
    NSArray *array = (__bridge NSArray*)ABAddressBookCopyArrayOfAllPeople(addBook);
    // 遍历所有的联系人
    for (id obj in array) {
        ABRecordRef people = (__bridge ABRecordRef)obj;
        NSString *firstName = (__bridge NSString*)ABRecordCopyValue(people, kABPersonFirstNameProperty);
        NSString *lastName = (__bridge NSString*)ABRecordCopyValue(people, kABPersonLastNameProperty);
        if ([firstName isEqualToString:@"智家狗"] &&[lastName isEqualToString:@"慧居智能"]) {
            // 智家狗联系方式已经存在
            return;
        }
    }
    // 保存修改的通讯录对象
    ABAddressBookSave(addBook, NULL);
    
    
    //创建一个联系人引用
    ABRecordRef person = ABPersonCreate();
    NSString *firstName = @"智家狗";
    NSString *lastName = @"慧居智能";
    // 头像
    ABPersonSetImageData(person, (__bridge CFDataRef)UIImageJPEGRepresentation([UIImage imageNamed:@"zhiJiaGouHead1.jpg"], 1), NULL);
    // 电话号码数组
    NSArray *phones = [NSArray arrayWithObjects:@"18084054448",@"456",nil];
    // 电话号码对应的名称
    NSArray *labels = [NSArray arrayWithObjects:@"iphone",@"home",nil];
    //这里的字段和上面的字段完全相同
    // 设置名字属性
    ABRecordSetValue(person, kABPersonFirstNameProperty,(__bridge CFStringRef)firstName, NULL);
    // 设置姓氏属性
    ABRecordSetValue(person, kABPersonLastNameProperty, (__bridge CFStringRef)lastName, NULL);
    // 字典引用
    ABMultiValueRef dic =ABMultiValueCreateMutable(kABMultiStringPropertyType);
    // 添加电话号码与其对应的名称内容
    for (int i = 0; i < [phones count]; i ++) {
        ABMultiValueIdentifier obj = ABMultiValueAddValueAndLabel(dic,(__bridge CFStringRef)[phones objectAtIndex:i], (__bridge CFStringRef)[labels objectAtIndex:i], &obj);
    }
    // 设置phone属性
    ABRecordSetValue(person, kABPersonPhoneProperty, dic, NULL);
    CFRelease(dic);
    // 将新建的联系人添加到通讯录中
    ABAddressBookAddRecord(addBook, person, NULL);
    // 保存通讯录数据
    ABAddressBookSave(addBook, NULL);
    
    CFRelease(person);
    CFRelease(addBook);
}

@end
