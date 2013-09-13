//
//  Boid.h
//  BoidsAnimation
//
//  Created by Training on 9/11/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Boid : UIImageView

@property UIColor *color;
@property (readonly) CGPoint position;
@property CGPoint velocity;
@property UIView *myView;

+ (Boid *)createBoid;
- (float)rotation;
- (void)colorBoid:(UIColor *)color;
- (void)update:(float)dt;
- (void)setSize:(float)size;
- (float)size;


@end
	