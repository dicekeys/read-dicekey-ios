//
//  DKImageProcessor.m
//  ReadDiceKey
//
//  Created by bakhtiyor on 12/02/21.
//

#import <Foundation/Foundation.h>
#import "DKImageProcessor.h"
#import "DKUtils.h"
#include "ImageProcessor.hpp"
#include "ImageProcessorImpl.hpp"

@interface DKImageProcessor ()
- (instancetype)initWithImageProcessorObject:(dicekeys::ImageProcessor *)imageProcessor;
@end

@implementation DKImageProcessor {
    dicekeys::ImageProcessor* _imageProcessor;
}

+ (nullable DKImageProcessor *)create
{
    return [[DKImageProcessor alloc] initWithImageProcessorObject:new dicekeys::ImageProcessorImpl()];
}

- (instancetype)initWithImageProcessorObject:(dicekeys::ImageProcessor *)imageProcessor {
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
    return _imageProcessor->process(dataToUint8Vector(image), width, height);
}

- (nonnull NSData *)overlay:(nonnull NSData *)image
                      width:(int32_t)width
                     height:(int32_t)height
{
    return uint8VectorToData(_imageProcessor->overlay(dataToUint8Vector(image), width, height));
}

- (nonnull NSData *)augmented:(nonnull NSData *)image
                        width:(int32_t)width
                       height:(int32_t)height
{
    return uint8VectorToData(_imageProcessor->augmented(dataToUint8Vector(image), width, height));
}

- (nonnull NSString *)json
{
    return [NSString stringWithCString:_imageProcessor->json().c_str() encoding:NSUTF8StringEncoding];
}

- (BOOL)isFinished
{
    return _imageProcessor->isFinished();
}

- (nonnull NSData *)faceImage:(int32_t)faceIndex
                       height:(int32_t)height
                        bytes:(nonnull NSData *)bytes
{
    return uint8VectorToData(_imageProcessor->faceImage(faceIndex, height, dataToUint8Vector(bytes)));
}

-(void)dealloc {
    delete _imageProcessor;
}

@end
