//
//  JSONModelPerson.h
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 27/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface JSONModelPerson : JSONModel

@property (assign, nonatomic) NSString* first;
@property (assign, nonatomic) NSString* last;
@property (assign, nonatomic) NSInteger registered;

@end
