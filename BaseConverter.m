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

+ (NSString *)DecimalToHexadecimal:(int)decimalNumber
{
    NSMutableDictionary *hexadecimalValues = [[[NSMutableDictionary alloc] init] autorelease];
    
    [hexadecimalValues setObject:@"a" forKey:@"10"];
    
    [hexadecimalValues setObject:@"b" forKey:@"11"];
    
    [hexadecimalValues setObject:@"c" forKey:@"12"];
    
    [hexadecimalValues setObject:@"d" forKey:@"13"];
    
    [hexadecimalValues setObject:@"e" forKey:@"14"];
    
    [hexadecimalValues setObject:@"f" forKey:@"15"];
    
    int resultOfTheDivision = decimalNumber;
    
    int exponent = 16;
    
    NSMutableArray *remaindersOfTheDivision = [[[NSMutableArray alloc] init] autorelease];
    
    int latestRemainder;
    
    while (resultOfTheDivision > 0)
    {
        latestRemainder = resultOfTheDivision % exponent;
        
        resultOfTheDivision = resultOfTheDivision / exponent;
        
        [remaindersOfTheDivision addObject:[NSNumber numberWithInt:latestRemainder]];
        
        NSLog(@"resultOfTheDivision: %i", resultOfTheDivision);
        
        NSLog(@"latestRemainder: %i", latestRemainder);
    }
    
    for(int index = 0; index <= [remaindersOfTheDivision count] - 1; index++)
    {
        NSString *decimalValueAtIndex = [[[NSString alloc] initWithFormat:@"%@", [remaindersOfTheDivision objectAtIndex:index]] autorelease];
        
        NSString *hexadecimalValueAtIndex = [hexadecimalValues objectForKey:decimalValueAtIndex];
        
        if (hexadecimalValueAtIndex == NULL)
        {
            hexadecimalValueAtIndex = decimalValueAtIndex;
        }
        
        [remaindersOfTheDivision replaceObjectAtIndex:index withObject:hexadecimalValueAtIndex];
    }
    
    NSArray *hexadecimalNumber = [[remaindersOfTheDivision reverseObjectEnumerator] allObjects];
    
    return [hexadecimalNumber componentsJoinedByString:@""];
}

+ (int)HexadecimalToDecimal:(NSString *)hexadecimalNumber
{
    NSMutableDictionary *hexadecimalValues = [[[NSMutableDictionary alloc] init] autorelease];
    
    [hexadecimalValues setObject:@"10" forKey:@"a"];
    
    [hexadecimalValues setObject:@"11" forKey:@"b"];
    
    [hexadecimalValues setObject:@"12" forKey:@"c"];
    
    [hexadecimalValues setObject:@"13" forKey:@"d"];
    
    [hexadecimalValues setObject:@"14" forKey:@"e"];
    
    [hexadecimalValues setObject:@"15" forKey:@"f"];
    
    hexadecimalNumber = [hexadecimalNumber lowercaseString];
    
    NSDecimalNumber *decimalNumber = [[[NSDecimalNumber alloc] initWithInteger:0] autorelease];
    
    int base = 16;
    
    for (int index = 0; index < [hexadecimalNumber length]; index++)
    {
        NSString *hexadecimalValueAtIndex = [[[NSString alloc] initWithFormat:@"%C", [hexadecimalNumber characterAtIndex:index]] autorelease];
        
        NSString *decimalValueAtIndex = [hexadecimalValues objectForKey:hexadecimalValueAtIndex];
        
        if (decimalValueAtIndex == NULL)
        {
            decimalValueAtIndex = hexadecimalValueAtIndex;
        }
        
        NSDecimalNumber *resultAtIndex = [[[NSDecimalNumber alloc] initWithString:decimalValueAtIndex] autorelease];
        
        NSNumber *powerOfSixteenAtIndex = [[[NSNumber alloc] initWithInt:pow(base, [hexadecimalNumber length] - 1 - index)] autorelease];
        
        resultAtIndex = [resultAtIndex decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithDecimal:[powerOfSixteenAtIndex decimalValue]]];
        
        decimalNumber = [decimalNumber decimalNumberByAdding:[NSDecimalNumber decimalNumberWithDecimal:[resultAtIndex decimalValue]]];
    }
    
    return [decimalNumber intValue];
}

@end
