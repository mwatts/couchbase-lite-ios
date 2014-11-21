//
//  CBLDatabase+LocalDocs.h
//  CouchbaseLite
//
//  Created by Jens Alfke on 1/10/12.
//  Copyright (c) 2012-2013 Couchbase, Inc. All rights reserved.
//

#import "CBLDatabase.h"
#import "CBLStatus.h"
@class CBL_Revision;


@interface CBLDatabase (LocalDocs)

- (CBL_Revision*) getLocalDocumentWithID: (NSString*)docID 
                              revisionID: (NSString*)revID;

- (CBL_Revision*) putLocalRevision: (CBL_Revision*)revision
                    prevRevisionID: (NSString*)prevRevID
                          obeyMVCC: (BOOL)obeyMVCC
                            status: (CBLStatus*)outStatus;

- (CBLStatus) deleteLocalDocumentWithID: (NSString*)docID
                             revisionID: (NSString*)revID
                               obeyMVCC: (BOOL)obeyMVCC;

- (NSString*) infoForKey: (NSString*)key;
- (CBLStatus) setInfo: (NSString*)info forKey: (NSString*)key;

@end
