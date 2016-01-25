//
//  Friend.m
//  reverse-miallo
//
//  Created by macbookpro1 on 25/01/2016.
//  Copyright © 2016 Pierre Ghazal. All rights reserved.
//

#import "Friend.h"

@implementation Friend

@synthesize name;

- (instancetype) initWithName:(NSString*) Name {
    self = [super init];
    
    if(self) {
        self.name = Name;
    }
    
    return self;
}

@end
