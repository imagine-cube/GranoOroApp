//
//  AddPartidoTableViewController.h
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/28/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OroDetailViewController.h"



@class Partido;

@interface AddPartidoTableViewController : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic,strong) Partido *partido;

@property (weak, nonatomic) IBOutlet UIView *firstCell;

@property (weak, nonatomic) IBOutlet UITextField *rival;


@property (weak, nonatomic) IBOutlet UITextField *descripcion;

@property (weak, nonatomic) IBOutlet UITextField *fecha;


@property (weak, nonatomic) IBOutlet UITextField *hora;

@property (weak, nonatomic) IBOutlet UITextField *lugar;


@property (weak, nonatomic) IBOutlet UIPickerView *tipoPartido;

@property (strong, nonatomic)NSArray *tipoPartidoArray;

@end
