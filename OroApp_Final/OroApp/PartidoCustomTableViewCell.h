//
//  PartidoCustomTableViewCell.h
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/28/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartidoCustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *fecha;

@property (weak, nonatomic) IBOutlet UILabel *tipoPartido;

@property (weak, nonatomic) IBOutlet UILabel *rival;

@property (weak, nonatomic) IBOutlet UILabel *lblMonto;

@property (weak, nonatomic) IBOutlet UILabel *montoTotal;

@end
