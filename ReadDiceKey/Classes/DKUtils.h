//
//  DKUtils.h
//  Pods
//
//  Created by bakhtiyor on 12/02/21.
//

#ifdef __cplusplus
#include <vector>

std::vector<uint8_t> dataToUint8Vector(NSData *data);
NSData *uint8VectorToData(std::vector<unsigned char> v);

#endif
