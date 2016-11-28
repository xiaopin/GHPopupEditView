//
//  ViewController.m
//  GHPopupEditViewDemo
//
//  Created by nhope on 2016/11/28.
//  Copyright © 2016年 xiaopin. All rights reserved.
//

#import "ViewController.h"
#import "GHPopupEditView.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)buttonAction:(UIButton *)sender {
    GHPopupEditView *popupView = [[GHPopupEditView alloc] init];
    [popupView setTitle:@"编辑 昵称"];
    [popupView setPlaceholderString:@"请输入昵称"];
    [popupView setKeyboardType:UIKeyboardTypeDefault];
    [popupView setOKButtonThemeColor:[UIColor orangeColor]];
    
    // 只能输入大小写字母、数字、下划线
    [popupView setShouldChangeHandler:^(UITextField *textField, NSRange range, NSString *replacementString) {
        if (range.length == 0) { // add
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[\\w_]+"];
            return [predicate evaluateWithObject:replacementString];
        }
        return YES;
    }];
    // 判断用户输入是否合法
    [popupView setVerifyHandler:^(NSString *text) {
        NSString *nickname = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (nickname.length == 0) {
            return @"昵称不能为空";
        }
        return @"";
    }];
    // 完成输入时的回调
    [popupView setCompletionHandler:^(NSString *text) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"hello %@.", text] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }];
    
    [popupView show];
}

@end
