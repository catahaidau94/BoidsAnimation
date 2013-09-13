//
//  SceneManager.h
//  BoidsAnimation
//
//  Created by Training on 9/11/13.
//  Copyright (c) 2013 Training. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoidGroup.h"

@interface SceneManager : NSObject

@property NSMutableArray *boidsGroups;
@property (strong) NSTimer *timer;
@property UIView *view;

+ (SceneManager *)createSceneManager:(UIView *)view;
- (void)update:(NSTimer *)timer;
- (BoidGroup *)createBoidGroup:(UIColor *)color;

@end
