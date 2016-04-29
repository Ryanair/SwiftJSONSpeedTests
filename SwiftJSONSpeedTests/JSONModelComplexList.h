//
//  JSONModelComplexList.h
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 27/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface JSONModelComplexName: JSONModel

@property (assign, nonatomic) NSString *first;
@property (assign, nonatomic) NSString *last;

@end

@interface JSONModelComplexRegisteredDetails : JSONModel

@property (assign, nonatomic) NSInteger id; // <-- APIs have to be careful not to use ObjC reserved names

@end

@interface JSONModelComplexPerson: JSONModel

@property (assign, nonatomic) JSONModelComplexName* name;
@property (assign, nonatomic) JSONModelComplexRegisteredDetails* registerDetails;

@end

@interface JSONModelComplexList : JSONModel

@property (assign, nonatomic) NSArray<JSONModelComplexPerson*> *people;

@end
