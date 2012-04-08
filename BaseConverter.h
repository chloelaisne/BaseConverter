//
//  BaseConverter.h
//
//  Created by Chloé Laisné on 4/8/12.
//  Copyright (c) 2012 Chloé Laisné. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseConverter : NSObject

/**
 Convert a integer from binary to decimal format
 @param     Binary number
 @return    Decimal number
 */
+ (int)BinaryToDecimal:(int)binaryNumber;

/**
 Convert a integer from decimal to binary format
 @param     Decimal number
 @return    Binary number
 */
+ (int)DecimalToBinary:(int)decimalNumber;

@end
