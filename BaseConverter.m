//
//  BaseConverter.m
//
//  Created by Chloé Laisné on 4/8/12.
//  Copyright (c) 2012 Chloé Laisné. All rights reserved.
//

#import "BaseConverter.h"

@implementation BaseConverter

+ (int)BinaryToDecimal:(int)binaryNumber{
    
    NSString *binaryString = [[[NSString alloc] initWithFormat:@"%i", binaryNumber] autorelease];
    
    NSUInteger binaryStringLength = [binaryString length];
    
    int binaryStringIndex;
    
    NSDecimalNumber *decimalNumber = [[[NSDecimalNumber alloc] initWithInt:0] autorelease];
    
    for (binaryStringIndex = 0; binaryStringIndex < binaryStringLength; binaryStringIndex++) {
        
        NSString *characterAtIndex = [[[NSString alloc] initWithFormat:@"%c", ([binaryString characterAtIndex:binaryStringIndex])] autorelease];
        
        NSDecimalNumber *digitAtIndex = [[[NSDecimalNumber alloc] initWithString:characterAtIndex] autorelease];
        
        NSNumber *powerOfTwoAtIndex = [[[NSNumber alloc] initWithDouble:pow(2, binaryStringLength - 1 - binaryStringIndex)] autorelease];
        
        NSDecimalNumber *resultAtIndex = [digitAtIndex decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithDecimal:[powerOfTwoAtIndex decimalValue]]];
        
        decimalNumber = [decimalNumber decimalNumberByAdding:resultAtIndex];
        
    }
    
    return [decimalNumber intValue];
    
}

+ (int)DecimalToBinary:(int)decimalNumber{
    
    NSDecimalNumber *remainder = [[[NSDecimalNumber alloc] initWithInt:decimalNumber] autorelease];
    
    NSString *binaryNumber = [[[NSString alloc] init] autorelease];
    
    int exponent = 0;
    
    int greatestPowerOfTwo = pow(2, exponent);
    
    while (greatestPowerOfTwo < decimalNumber + 1) {
        
        exponent++;
        
        greatestPowerOfTwo = pow(2, exponent);
        
    }
    
    for (exponent = exponent - 1; exponent >= 0; exponent--) {
        
        NSNumber *powerOfTwoAtExponent = [[[NSNumber alloc] initWithInt:pow(2, exponent)] autorelease];
        
        if ([powerOfTwoAtExponent intValue] <= [remainder intValue]) {
            
            binaryNumber = [binaryNumber stringByAppendingString:@"1"];
            
            remainder = [remainder decimalNumberBySubtracting:[NSDecimalNumber decimalNumberWithDecimal:[powerOfTwoAtExponent decimalValue]]];
            
            
        } else {
            
            binaryNumber = [binaryNumber stringByAppendingString:@"0"];
            
        }
        
    }
    
    return [binaryNumber intValue];
    
}

@end
