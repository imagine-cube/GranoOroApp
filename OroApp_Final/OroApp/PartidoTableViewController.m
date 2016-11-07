//
//  PartidoTableViewController.m
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/28/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import "PartidoTableViewController.h"
#import "PartidoCustomTableViewCell.h"
#import "Jugador.h"
#import "Partido.h"
#import "DetallesJugador.h"
#import "Photo.h"
#import "AddPartidoTableViewController.h"
#import "MainViewController.h"

NSString *const PREFERENCE_OF_THE_USER_TO_SORT_KEY1 = @"SortKey";
NSString *const SORT_KEY_NAME1 = @"fecha";
NSString *const STORYBOARD_ID_OF_PLAYER_TABLE_VIEW1 = @"PartidoTableViewController";
NSString *const STORYBOARD_ID_OF_MENU = @"MenuViewController";
const int SORT_BY_NAME1 = 1;
const int SORT_BY_RATING1 = 0;
NSString *const CELL_ID1 = @"PartidoCustomTableViewCell";
static const int ZERO1 = 0;

NSString *const SORT_KEY_RATING1 = @"fecha";


@interface PartidoTableViewController ()<UISearchBarDelegate >

@property (nonatomic,strong) NSMutableArray *partidosArray;

@end

@implementation PartidoTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCellInTableView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"Oro App";
      [self obtenerPartidos];
    [self registerNotifications];
}


-(void)registerNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillTerminate:) name:UIApplicationWillTerminateNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(printNotification:) name:@"cursoiOSAvanzado" object:nil];
}

-(void)appWillTerminate:(NSNotification*)notification{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"cursoiOSAvanzado" object:nil];
}

-(void)printNotification:(NSNotification*)notification{
    NSDictionary *userInfo = notification.userInfo;
    NSLog(@"%@",[userInfo valueForKey:@"key_notification"]);
}



#pragma mark -CORE DATA METHODS
-(void)obtenerPartidos{
    NSString *sortKey = [[NSUserDefaults standardUserDefaults] objectForKey:PREFERENCE_OF_THE_USER_TO_SORT_KEY1];
    BOOL ascending = [sortKey isEqualToString:SORT_KEY_NAME1   ] ? NO:YES;
    
    if ([sortKey isEqualToString:SORT_KEY_NAME1]) {
        NSLog(@"ENTRO A partido");
    }
    self.partidosArray = [[Partido MR_findAllSortedBy:SORT_KEY_NAME1 ascending:ascending] mutableCopy];
    [self.tableView reloadData];
}


-(void)registerCustomCellInTableView{
    UINib *nib = [UINib nibWithNibName:CELL_ID1 bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_ID1];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.partidosArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PartidoCustomTableViewCell *cell = (PartidoCustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CELL_ID1];
    [self configureCellWithIndexPath:indexPath cell:cell];
    return cell;
}

-(PartidoCustomTableViewCell*)configureCellWithIndexPath:(NSIndexPath*)indexPath cell:(PartidoCustomTableViewCell*)cell{
    
    Partido *partido = self.partidosArray[indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSString *strFecha = [dateFormatter stringFromDate:partido.fecha];
    
   cell.fecha.text = strFecha;
    cell.rival.text = partido.rival;
    cell.tipoPartido.text = partido.descripcion;
    
    [cell.montoTotal setHidden:YES];
    [cell.lblMonto setHidden:YES];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Partido *partidoSelected = self.partidosArray[indexPath.row];
    AddPartidoTableViewController *newBeerTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_OF_PLAYER_TABLE_VIEW1];
    newBeerTableViewController.partido = partidoSelected;
    [self.navigationController pushViewController:newBeerTableViewController animated:YES];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Partido *partidoSelected = self.partidosArray[indexPath.row];
        [partidoSelected MR_deleteEntity];
        [self saveContext];
        [self.partidosArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark -ACTIONS
- (IBAction)registrarPartido:(id)sender {
    AddPartidoTableViewController *newBeer = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_OF_PLAYER_TABLE_VIEW1];
    [self.navigationController pushViewController:newBeer animated:YES];
}


- (IBAction)volver:(id)sender {
    MainViewController  *menu = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_OF_MENU];
    [self.navigationController pushViewController:menu animated:YES];
}


#pragma mark -SEARCH BAR DELEGATE
-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString *)searchText{
    if ([self.searchBar.text length]>ZERO1) {
        [self doSearch];
    }
    else{
        [self obtenerPartidos];
    }
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
    self.searchBar.text = @"";
    self.searchBar.showsCancelButton = NO;
    [self obtenerPartidos];
}


-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.searchBar.showsCancelButton = YES;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
    [self doSearch];
}

-(void)doSearch{
    NSString *searchText = self.searchBar.text;
    self.partidosArray = [[Partido MR_findAllSortedBy:SORT_KEY_NAME1 ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"name contains[c] %@",searchText] inContext:[NSManagedObjectContext MR_defaultContext] ] mutableCopy];
    [self.tableView reloadData];
}

#pragma mark CORE DATA METHODS
-(void)saveContext{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            NSLog(@"You successfully saved you context.");
        }
        else if (error){
            NSLog(@"Error saving context: %@",error.description);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Error" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }];
}

@end
