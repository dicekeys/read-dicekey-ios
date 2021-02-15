//
//  DKImageProcessor.m
//  ReadDiceKey
//
//  Created by bakhtiyor on 12/02/21.
//

#import <Foundation/Foundation.h>
#import "DKImageProcessor.h"
#include "read-dicekey.hpp"

@interface DKImageProcessor ()
- (instancetype)initWithImageProcessorObject:(DiceKeyImageProcessor *)imageProcessor;
@end

@implementation DKImageProcessor {
    DiceKeyImageProcessor* _imageProcessor;
}

+ (nullable DKImageProcessor *)create
{
    return [[DKImageProcessor alloc] initWithImageProcessorObject:new DiceKeyImageProcessor()];
}

- (instancetype)initWithImageProcessorObject:(DiceKeyImageProcessor *)imageProcessor {
    self = [self init];
    if (self != NULL) {
        _imageProcessor = imageProcessor;
    }
    return self;
}

- (BOOL)process:(nonnull NSData *)image
          width:(int32_t)width
         height:(int32_t)height
{
    return _imageProcessor->processRGBAImage(width, height, (const uint32_t *)image.bytes);
}

- (nonnull NSData *)overlay:(nonnull NSData *)image
                      width:(int32_t)width
                     height:(int32_t)height
{
    _imageProcessor->processRGBAImage(width, height, (const uint32_t *)image.bytes);
    NSUInteger size = image.length / sizeof(uint32_t);
    NSData* overlay = [NSData dataWithBytes:new uint32_t[size] length:image.length];
    _imageProcessor->renderAugmentationOverlay(width, height, (uint32_t *)overlay.bytes);
    return overlay;
}

- (nonnull NSData *)augmented:(nonnull NSData *)image
                        width:(int32_t)width
                       height:(int32_t)height
{
    _imageProcessor->processRGBAImage(width, height, (const uint32_t *)image.bytes);
    _imageProcessor->augmentRGBAImage(width, height, (uint32_t *)image.bytes);
    return image;
}

- (nonnull NSString *)json
{
    return [NSString stringWithCString:_imageProcessor->jsonDiceKeyRead().c_str() encoding:NSUTF8StringEncoding];
}

- (BOOL)isFinished
{
    return _imageProcessor->isFinished();
}

- (nonnull NSData *)faceImage:(int32_t)faceIndex
                       height:(int32_t)height
                        bytes:(nonnull NSData *)bytes
{
    return [NSData data];
}

-(void)dealloc {
    delete _imageProcessor;
}

@end
