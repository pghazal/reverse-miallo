//
//  Friend.h
//  reverse-miallo
//
//  Created by macbookpro1 on 25/01/2016.
//  Copyright © 2016 Pierre Ghazal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (strong, nonatomic) NSString* name;

- (instancetype) initWithName:(NSString*) name;

@end
