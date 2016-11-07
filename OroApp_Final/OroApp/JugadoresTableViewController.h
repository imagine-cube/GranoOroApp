//
//  JugadoresTableViewController.h
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/21/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPlayerTableViewController.h"

@interface JugadoresTableViewController : UITableViewController


@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControllerProperty;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


- (IBAction)addPlayer:(id)sender;


@end
