//
//  ListaPagosPartidoTableViewController.h
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/29/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Partido.h"
#import "AGTCoreDataTableViewController.h"

@interface ListaPagosPartidoTableViewController :  AGTCoreDataTableViewController
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


- (IBAction)registrarPago:(id)sender;

@property(nonatomic,strong) Partido *partido;

@end
