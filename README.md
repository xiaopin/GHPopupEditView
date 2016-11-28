# GHPopupEditView

[![Build](https://img.shields.io/wercker/ci/wercker/docs.svg)]()
[![Platform](https://img.shields.io/badge/platform-iOS%207%2B-blue.svg?style=flat)]()
[![Device](https://img.shields.io/badge/device-iPhone|iPad|iPod-orange.svg?style=flat)]()
[![License](https://img.shields.io/badge/license-GPL%20V3-yellow.svg?style=flat)]()

A popup view for editing information.

## Usage

``` Objective-C
GHPopupEditView *popupView = [[GHPopupEditView alloc] init];
[popupView setTitle:@"编辑 昵称"];
[popupView setPlaceholderString:@"请输入昵称"];
[popupView setKeyboardType:UIKeyboardTypeDefault];
[popupView setOKButtonThemeColor:[UIColor orangeColor]];
[popupView setShouldChangeHandler:^(UITextField *textField, NSRange range, NSString *replacementString) {
    if (range.length == 0) { // add
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[\\w_]+"];
        return [predicate evaluateWithObject:replacementString];
    }
    return YES;
}];
[popupView setVerifyHandler:^(NSString *text) {
    NSString *nickname = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (nickname.length == 0) {
        return @"昵称不能为空";
    }
    return @"";
}];
[popupView setCompletionHandler:^(NSString *text) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"hello %@.", text] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}];
[popupView show];
```

## Requirements

- iOS 7.0+
- Xcode 8.0+

## Installation

Add manually:
- Drag `GHPopupEditView` folder to your project.
- Import header file: `#import "GHPopupEditView.h"`

## License
GHPopupEditView is available under the GPL license. See the LICENSE file for more info.