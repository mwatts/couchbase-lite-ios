//
//  CBLDocumentReplication.m
//  CouchbaseLite
//
//  Copyright (c) 2017 Couchbase, Inc All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "CBLDocumentReplication.h"
#import "CBLDocumentReplication+Internal.h"
#import "CBLReplicator.h"

@implementation CBLDocumentReplication

@synthesize replicator=_replicator, isPush=_isPush, documentID=_documentID, error=_error;

- (instancetype) initWithReplicator: (CBLReplicator*)replicator
                             isPush: (BOOL)isPush
                         documentID: (NSString*)documentID
                              error: (nullable NSError*)error
{
    self = [super init];
    if (self) {
        _replicator = replicator;
        _isPush = isPush;
        _documentID = documentID;
        _error = error;
    }
    return self;
}

@end
