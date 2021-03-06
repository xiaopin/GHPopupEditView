# GHPopupEditView

[![Build](https://img.shields.io/wercker/ci/wercker/docs.svg)]()
[![Pod Version](https://img.shields.io/badge/pod-1.0.0-blue.svg?style=flat)]()
[![Platform](https://img.shields.io/badge/platform-iOS%207%2B-blue.svg?style=flat)]()
[![Device](https://img.shields.io/badge/device-iPhone|iPad|iPod-orange.svg?style=flat)]()
[![License](https://img.shields.io/badge/license-GPL%20V3-yellow.svg?style=flat)]()

A popup view for editing information.

## Preview

- ![GIF](./demo.gif)
- ![Preview](./preview1.png)
- ![Preview](./preview2.png)

## Usage

``` Objective-C
GHPopupEditView *popupView = [[GHPopupEditView alloc] init];
[popupView setTitle:@"edit nickname"];
[popupView setPlaceholderString:@"Please enter a nickname"];
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
        return @"Nickname can not be empty.";
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

#### Add manually:
- Drag `GHPopupEditView` folder to your project.
- Import header file: `#import "GHPopupEditView.h"`

#### Installation with CocoaPods

Podfile
``` ruby
platform :ios, '7.0'

target 'TargetName' do
    pod 'GHPopupEditView', '~> 1.0.0'
end
```

Then, run the following command:

``` bash
$ pod install
```

## License
`GHPopupEditView` is licensed under the GPL License - see the LICENSE file for details
