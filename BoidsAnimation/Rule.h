//
//  Rule.h
//  BoidsAnimation
//
//  Created by Training on 9/11/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boid.h"
#import "BoidGroup.h"

@interface Rule : NSObject

@property float resultRule;

- (void)applyToBoid:(Boid *)boid inBoidsGroup:(BoidGroup *)boidGroup withDt:(float)dt;



@end
