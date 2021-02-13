//
//  DKUtils.m
//  ReadDiceKey
//
//  Created by bakhtiyor on 12/02/21.
//

#import "DKUtils.h"

std::vector<uint8_t> dataToUint8Vector(NSData *data) {
    NSUInteger size = [data length] / sizeof(uint8_t);
    uint8_t *array = (uint8_t *)[data bytes];
    return std::vector<uint8_t>(array, array + size);
}

NSData *uint8VectorToData(std::vector<unsigned char> v) {
    NSUInteger size = v.size() * sizeof(uint8_t);
    return [[NSData alloc] initWithBytes:v.data() length:size];
}

