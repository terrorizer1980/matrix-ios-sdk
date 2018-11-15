/*
 Copyright 2018 New Vector Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXMegolmBackupAuthData.h"

@implementation MXMegolmBackupAuthData

#pragma mark - MXJSONModel

+ (id)modelFromJSON:(NSDictionary *)JSONDictionary
{
    MXMegolmBackupAuthData *megolmBackupAuthData = [MXMegolmBackupAuthData new];
    if (megolmBackupAuthData)
    {
        MXJSONModelSetString(megolmBackupAuthData.publicKey, JSONDictionary[@"public_key"]);
        MXJSONModelSetDictionary(megolmBackupAuthData.signatures, JSONDictionary[@"signatures"]);
    }

    return megolmBackupAuthData;
}

- (NSDictionary *)JSONDictionary
{
    NSMutableDictionary *JSONDictionary = [NSMutableDictionary dictionary];

    JSONDictionary[@"public_key"] = _publicKey;

    if (_signatures)
    {
        JSONDictionary[@"signatures"] = _signatures;
    }

    return JSONDictionary;
}

- (NSDictionary *)signalableJSONDictionary
{
    return @{
             @"public_key": _publicKey
             };
}

@end
