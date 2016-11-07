#import "Photo.h"

@interface Photo ()

// Private interface goes here.

@end

@implementation Photo

#pragma mark - Properties

-(void) setImage:(UIImage *)image{
    
    // sincronizar con imageData
    self.imageFile = UIImagePNGRepresentation(image);
    
}

-(UIImage *) image{
    
    
    return [UIImage imageWithData:self.imageFile];
    
}

#pragma mark - Class Methods


+(instancetype) photoWithImage:(UIImage *) image
                       context:(NSManagedObjectContext *) context{
    
    Photo *p = [NSEntityDescription insertNewObjectForEntityForName:[Photo entityName]
                                                inManagedObjectContext:context];
    
    p.imageFile = UIImageJPEGRepresentation(image, 0.9);
    
    
    return p;
    
}



@end
