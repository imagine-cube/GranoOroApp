#import "_Photo.h"

@interface Photo : _Photo {}


+(instancetype) photoWithImage:(UIImage *) image
                       context:(NSManagedObjectContext *) context;



@end
