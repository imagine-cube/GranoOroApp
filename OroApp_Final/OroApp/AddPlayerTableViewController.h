//
//  AddPlayerTableViewController.h
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/22/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Jugador;

@interface AddPlayerTableViewController : UITableViewController


@property(nonatomic,strong) Jugador *jugador;

@property (weak, nonatomic) IBOutlet UITableViewCell *firstCell;


@property (weak, nonatomic) IBOutlet UIImageView *handImageView;

@property (weak, nonatomic) IBOutlet UITextField *txtNombre;

@property (weak, nonatomic) IBOutlet UITextField *txtApellido1;

@property (weak, nonatomic) IBOutlet UITextField *txtApellido2;

@property (weak, nonatomic) IBOutlet UITextField *txtCedula;

@property (weak, nonatomic) IBOutlet UITextField *txtEdad;

@property (weak, nonatomic) IBOutlet UITextField *txtDorsal;

@property (weak, nonatomic) IBOutlet UITextField *txtPosicion;

@property (weak, nonatomic) IBOutlet UITextField *txtPosicionAlternativa;

@property (weak, nonatomic) IBOutlet UITextField *txtFechaNacimiento;

@end
