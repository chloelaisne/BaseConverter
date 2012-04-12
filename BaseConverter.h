//
//  BaseConverter.h
//
//  Created by Chloé Laisné on 4/8/12.
//  Copyright (c) 2012 Chloé Laisné. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseConverter : NSObject

/**
 Convert a number from base 2 to base 10
 @param     int Binary number
 @return    int Decimal number
 */
+ (int)BinaryToDecimal:(int)binaryNumber;

/**
 Convert a number from base 10 to base 2
 @param     int Decimal number
 @return    int Binary number
 */
+ (int)DecimalToBinary:(int)decimalNumber;

/**
 Convert a number from base 10 to base 16
 @param     int Decimal number
 @return    NSString Hexadecimal number
 */
+ (NSString *)DecimalToHexadecimal:(int)decimalNumber;

/**
 Convert a number from base 16 to base 10
 @param     NSString Hexadecimal number
 @return    int Decimal number
 */
+ (int)HexadecimalToDecimal:(NSString *)hexadecimalNumber;

@end
