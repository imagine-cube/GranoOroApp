//
//  AddPagoTableViewController.h
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/29/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Partido.h"
#import "Jugador.h"

@class Pago;

@interface AddPagoTableViewController : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic,strong) Pago *pago;

@property (strong, nonatomic)NSArray *jugadoresArray;

@property (weak, nonatomic) IBOutlet UITextField *monto;

@property (weak, nonatomic) IBOutlet UIPickerView *jugadores;

@property(nonatomic,strong) Partido *partido;

@property(nonatomic,strong) Jugador *jugador;

@end
