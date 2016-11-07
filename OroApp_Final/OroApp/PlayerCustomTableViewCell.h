//
//  PlayerCustomTableViewCell.h
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/26/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *beerImage;

@property (weak, nonatomic) IBOutlet UILabel *nameBeerLabel;

@property (weak, nonatomic) IBOutlet UILabel *apellidos;

@property (weak, nonatomic) IBOutlet UILabel *dorsal;

@end
