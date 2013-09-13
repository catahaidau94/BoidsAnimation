//
//  Boid.m
//  BoidsAnimation
//
//  Created by Training on 9/11/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import "Boid.h"
#import "UIView+Frame.h"

@implementation Boid

+ (Boid *)createBoid {
    Boid *result = [Boid new];
    result.x = arc4random() % 400;
    result.y = arc4random() % 500;
    //result.velocity = CGPointMake(arc4random() % 40, arc4random() % 50);

    [result setSize:20];
    //result.image = [UIImage imageNamed:@"cat.jpg"];
    
    return result;
}

- (float)getFloat:(float)number{
    
    float randomNumber = (arc4random() % 250) / 500.0 - 0.25;
    
    if (number + randomNumber > 1.0) return 1.0;
    else if (number + randomNumber < 0) return 0;
    else return number + randomNumber;
}

- (void)colorBoid:(UIColor *)color{

    float red, green, blue;
    
    [color getRed:&red green:&green blue:&blue alpha:0];
    
    self.backgroundColor = [UIColor colorWithRed:[self getFloat:red] green:[self getFloat:green]
                                            blue:[self getFloat:blue] alpha:1];
}

- (float)rotation{
    return 0;
}

- (void)update:(float)dt{
    self.x += self.velocity.x * dt;
    self.y += self.velocity.y * dt;
}

- (void)setSize:(float)size{
    self.width = size;
    self.height = size;
}

- (float)size{
    return self.frame.size.width;
}

- (CGPoint)position{
    return CGPointMake(self.x + self.size / 2, self.y + self.size / 2);
}

@end
