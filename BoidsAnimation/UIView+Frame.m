//
//  UIView+Frame.m
//  AnimationsTutorial
//
//  Created by Training on 9/11/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView(Frame)

- (float)x {
    return self.frame.origin.x;
}

- (float)y {
    return self.frame.origin.y;
}

- (float)width {
    return self.frame.size.width;
}

- (float)height {
    return self.frame.size.height;
}

- (void)setX:(float)newX {
    CGRect newRect = self.frame;
    newRect.origin.x = newX;
    self.frame = newRect;
}

- (void)setY:(float)newY {
    CGRect newRect = self.frame;
    newRect.origin.y = newY;
    self.frame = newRect;
}

- (void)setWidth:(float)newWidth {
    CGRect newRect = self.frame;
    newRect.size.width = newWidth;
    self.frame = newRect;
}

- (void)setHeight:(float)newHeight {
    CGRect newRect = self.frame;
    newRect.size.height = newHeight;
    self.frame = newRect;
}



@end
