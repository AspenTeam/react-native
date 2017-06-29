/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "RCTNavItem.h"

#import "UIView+React.h"

@implementation RCTNavItem

@synthesize backButtonItem = _backButtonItem;
@synthesize leftButtonItems = _leftButtonItems;
@synthesize rightButtonItems = _rightButtonItems;

- (UIView *)titleView
{
  if (_titleImage) {
    return [[UIImageView alloc] initWithImage:_titleImage];
  } else if (self.reactSubviews != nil && self.reactSubviews.count > 1) {
    return self.reactSubviews[1];
  } else {
    return nil;
  }
}

-(instancetype)init
{
  if (self = [super init]) {
    _leftButtonSystemIcon = NSNotFound;
    _secondLeftButtonSystemIcon = NSNotFound;
    _rightButtonSystemIcon = NSNotFound;
  }
  return self;
}

- (void)setBackButtonTitle:(NSString *)backButtonTitle
{
  _backButtonTitle = backButtonTitle;
  _backButtonItem = nil;
}

- (void)setBackButtonIcon:(UIImage *)backButtonIcon
{
  _backButtonIcon = backButtonIcon;
  _backButtonItem = nil;
}

- (UIBarButtonItem *)backButtonItem
{
  if (!_backButtonItem) {
    if (_backButtonIcon) {
      _backButtonItem = [[UIBarButtonItem alloc] initWithImage:_backButtonIcon
                                                         style:UIBarButtonItemStylePlain
                                                        target:nil
                                                        action:nil];
    } else if (_backButtonTitle.length) {
      _backButtonItem = [[UIBarButtonItem alloc] initWithTitle:_backButtonTitle
                                                         style:UIBarButtonItemStylePlain
                                                        target:nil
                                                        action:nil];
    } else {
      _backButtonItem = nil;
    }
  }
  return _backButtonItem;
}

- (void)setLeftButtonTitle:(NSString *)leftButtonTitle
{
  _leftButtonTitle = leftButtonTitle;
  _leftButtonItems = nil;
}

- (void)setLeftButtonIcon:(UIImage *)leftButtonIcon
{
  _leftButtonIcon = leftButtonIcon;
  _leftButtonItems = nil;
}

- (void)setLeftButtonSystemIcon:(UIBarButtonSystemItem)leftButtonSystemIcon
{
  _leftButtonSystemIcon = leftButtonSystemIcon;
  _leftButtonItems = nil;
}

- (void)setSecondLeftButtonTitle:(NSString *)secondLeftButtonTitle
{
  _secondLeftButtonTitle = secondLeftButtonTitle;
  _leftButtonItems = nil;
}

- (void)setSecondLeftButtonIcon:(UIImage *)secondLeftButtonIcon
{
  _secondLeftButtonIcon = secondLeftButtonIcon;
  _leftButtonItems = nil;
}

- (void)setSecondLeftButtonSystemIcon:(UIBarButtonSystemItem)secondLeftButtonSystemIcon
{
  _secondLeftButtonSystemIcon = secondLeftButtonSystemIcon;
  _leftButtonItems = nil;
}

- (NSArray<UIBarButtonItem *> *)leftButtonItems
{
  if (!_leftButtonItems) {
  NSMutableArray *leftButtonItems = [NSMutableArray array];
    
    UIBarButtonItem *leftBarButtonItem;
    if (_leftButtonIcon) {
      leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithImage:_leftButtonIcon
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(handleLeftButtonPress)];

    } else if (_leftButtonTitle.length) {
      leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:_leftButtonTitle
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(handleLeftButtonPress)];

    } else if (_leftButtonSystemIcon != NSNotFound) {
      leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithBarButtonSystemItem:_leftButtonSystemIcon
                                                    target:self
                                                    action:@selector(handleLeftButtonPress)];
    }

    if  (leftBarButtonItem != nil) {
      [leftButtonItems addObject: leftBarButtonItem];
    }
    
    UIBarButtonItem *secondLeftBarButtonItem;
    if (_secondLeftButtonIcon) {
      secondLeftBarButtonItem =
      [[UIBarButtonItem alloc] initWithImage:_secondLeftButtonIcon
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(handleSecondLeftButtonPress)];

    } else if (_secondLeftButtonTitle.length) {
      secondLeftBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:_secondLeftButtonTitle
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(handleSecondLeftButtonPress)];

    } else if (_secondLeftButtonSystemIcon != NSNotFound) {
      secondLeftBarButtonItem =
      [[UIBarButtonItem alloc] initWithBarButtonSystemItem:_secondLeftButtonSystemIcon
                                                    target:self
                                                    action:@selector(handleSecondLeftButtonPress)];
    }

    if  (secondLeftBarButtonItem != nil) {
      [leftButtonItems addObject: secondLeftBarButtonItem];
    }

    _leftButtonItems = leftButtonItems;
  }
  return _leftButtonItems;
}

- (void)handleLeftButtonPress
{
  if (_onLeftButtonPress) {
    _onLeftButtonPress(nil);
  }
}

- (void)handleSecondLeftButtonPress
{
  if (_onSecondLeftButtonPress) {
    _onSecondLeftButtonPress(nil);
  }
}

- (void)setRightButtonTitle:(NSString *)rightButtonTitle
{
  _rightButtonTitle = rightButtonTitle;
  _rightButtonItems = nil;
}

- (void)setRightButtonIcon:(UIImage *)rightButtonIcon
{
  _rightButtonIcon = rightButtonIcon;
  _rightButtonItems = nil;
}

- (void)setRightButtonSystemIcon:(UIBarButtonSystemItem)rightButtonSystemIcon
{
  _rightButtonSystemIcon = rightButtonSystemIcon;
  _rightButtonItems = nil;
}

- (void)setSecondRightButtonTitle:(NSString *)secondRightButtonTitle
{
  _secondRightButtonTitle = secondRightButtonTitle;
  _rightButtonItems = nil;
}

- (void)setSecondRightButtonIcon:(UIImage *)secondRightButtonIcon
{
  _secondRightButtonIcon = secondRightButtonIcon;
  _rightButtonItems = nil;
}

- (void)setSecondRightButtonSystemIcon:(UIBarButtonSystemItem)secondRightButtonSystemIcon
{
  _secondRightButtonSystemIcon = secondRightButtonSystemIcon;
  _rightButtonItems = nil;
}

- (void)setThirdRightButtonTitle:(NSString *)thirdRightButtonTitle
{
  _thirdRightButtonTitle = thirdRightButtonTitle;
  _rightButtonItems = nil;
}

- (void)setThirdRightButtonIcon:(UIImage *)thirdRightButtonIcon
{
  _thirdRightButtonIcon = thirdRightButtonIcon;
  _rightButtonItems = nil;
}

- (void)setThirdRightButtonSystemIcon:(UIBarButtonSystemItem)thirdRightButtonSystemIcon
{
  _thirdRightButtonSystemIcon = thirdRightButtonSystemIcon;
  _rightButtonItems = nil;
}

- (UIBarButtonItem *)rightButtonItems
{
  if (!_rightButtonItems) {
    NSMutableArray *rightButtonItems = [NSMutableArray array];

    UIBarButtonItem *rightButtonItem;
    if (_rightButtonIcon) {
      rightButtonItem =
      [[UIBarButtonItem alloc] initWithImage:_rightButtonIcon
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(handleRightButtonPress)];

    } else if (_rightButtonTitle.length) {
      rightButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:_rightButtonTitle
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(handleRightButtonPress)];

    } else if (_rightButtonSystemIcon != NSNotFound) {
      rightButtonItem =
      [[UIBarButtonItem alloc] initWithBarButtonSystemItem:_rightButtonSystemIcon
                                      target:self
                                      action:@selector(handleRightButtonPress)];
    }

    if  (rightButtonItem != nil) {
      [rightButtonItems addObject: rightButtonItem];
    }

    UIBarButtonItem *secondRightButtonItem;
    if (_secondRightButtonIcon) {
      secondRightButtonItem =
      [[UIBarButtonItem alloc] initWithImage:_secondRightButtonIcon
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(handleSecondRightButtonPress)];

    } else if (_secondRightButtonTitle.length) {
      secondRightButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:_secondRightButtonTitle
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(handleSecondRightButtonPress)];

    } else if (_secondRightButtonSystemIcon != NSNotFound) {
      secondRightButtonItem =
      [[UIBarButtonItem alloc] initWithBarButtonSystemItem:_secondRightButtonSystemIcon
                                      target:self
                                      action:@selector(handleSecondRightButtonPress)];
    }

    if  (secondRightButtonItem != nil) {
      [rightButtonItems addObject: secondRightButtonItem];
    }

    UIBarButtonItem *thirdRightButtonItem;
    if (_thirdRightButtonIcon) {
      thirdRightButtonItem =
      [[UIBarButtonItem alloc] initWithImage:_thirdRightButtonIcon
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(handleThirdRightButtonPress)];

    } else if (_thirdRightButtonTitle.length) {
      thirdRightButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:_thirdRightButtonTitle
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(handleThirdRightButtonPress)];

    } else if (_thirdRightButtonSystemIcon != NSNotFound) {
      thirdRightButtonItem =
      [[UIBarButtonItem alloc] initWithBarButtonSystemItem:_thirdRightButtonSystemIcon
                                      target:self
                                      action:@selector(handleThirdRightButtonPress)];
    }

    if  (thirdRightButtonItem != nil) {
      [rightButtonItems addObject: thirdRightButtonItem];
    }

    _rightButtonItems = rightButtonItems;
  }
  return _rightButtonItems;
}

- (void)handleRightButtonPress
{
  if (_onRightButtonPress) {
    _onRightButtonPress(nil);
  }
}

- (void)handleSecondRightButtonPress
{
  if (_onSecondRightButtonPress) {
    _onSecondRightButtonPress(nil);
  }
}

- (void)handleThirdRightButtonPress
{
  if (_onThirdRightButtonPress) {
    _onThirdRightButtonPress(nil);
  }
}

@end
