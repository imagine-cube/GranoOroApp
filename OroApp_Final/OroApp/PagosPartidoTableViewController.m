//
//  PagosPartidoTableViewController.m
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/29/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import "PagosPartidoTableViewController.h"
#import "PartidoCustomTableViewCell.h"
#import "Jugador.h"
#import "Partido.h"
#import "DetallesJugador.h"
#import "Photo.h"
#import "ListaPagosPartidoTableViewController.h"
#import "MainViewController.h"
#import "Pago.h"

NSString *const PREFERENCE_OF_THE_USER_TO_SORT_KEY2 = @"SortKey";
NSString *const SORT_KEY_NAME2 = @"fecha";
NSString *const STORYBOARD_ID_OF_PLAYER_TABLE_VIEW2 = @"PagoPartidoTableViewController";
NSString *const STORYBOARD_ID_OF_MENU2 = @"MenuViewController";
const int SORT_BY_NAME2 = 1;
const int SORT_BY_RATING2 = 0;
NSString *const CELL_ID2 = @"PartidoCustomTableViewCell";
static const int ZERO2 = 0;

NSString *const SORT_KEY_RATING2 = @"fecha";

@interface PagosPartidoTableViewController () <UISearchBarDelegate >

@property (nonatomic,strong) NSMutableArray *partidosArray;

@property (nonatomic,strong) NSMutableArray *pagosArray;

@property (nonatomic,strong) NSMutableArray *pagos;

@end

@implementation PagosPartidoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // NSLog(@"PROBANDO IDIOMA %@", NSLocalizedString(@"KEY_TEST", nil));
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
}

#pragma mark -CORE DATA METHODS
-(void)obtenerPartidos{
    NSString *sortKey = [[NSUserDefaults standardUserDefaults] objectForKey:PREFERENCE_OF_THE_USER_TO_SORT_KEY2];
    BOOL ascending = [sortKey isEqualToString:SORT_KEY_NAME2   ] ? NO:YES;
    
    self.partidosArray = [[Partido MR_findAllSortedBy:SORT_KEY_NAME2 ascending:ascending] mutableCopy];
    [self.tableView reloadData];
}

-(void)registerCustomCellInTableView{
    UINib *nib = [UINib nibWithNibName:CELL_ID2 bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_ID2];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.partidosArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PartidoCustomTableViewCell *cell = (PartidoCustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CELL_ID2];
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
   
    //self.playerArray = [Partido MR_findAll];
    self.pagosArray = [[Pago MR_findAll] mutableCopy];
    
    NSDecimalNumber* montoTotal = [NSDecimalNumber zero];
    
    
    for (int i = 0; i < [self.pagosArray count]; i++)
    {
        Pago *pago = [self.pagosArray objectAtIndex:i];
        
        
        if(pago.partido == partido){
            
             montoTotal = [montoTotal decimalNumberByAdding:pago.monto];
            
        }
        
    }
    
    NSString* strMonto = [NSNumberFormatter
                       localizedStringFromNumber:montoTotal
                       numberStyle:NSNumberFormatterCurrencyStyle];
    
    cell.montoTotal.text= strMonto;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Partido *partidoSelected = self.partidosArray[indexPath.row];
    ListaPagosPartidoTableViewController *newListaPagoPartidoSeleccionado = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_OF_PLAYER_TABLE_VIEW2];
    newListaPagoPartidoSeleccionado.partido = partidoSelected;
    [self.navigationController pushViewController:newListaPagoPartidoSeleccionado animated:YES];
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

- (IBAction)volver:(id)sender {
    MainViewController  *menu = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_OF_MENU2];
    [self.navigationController pushViewController:menu animated:YES];
}

#pragma mark -SEARCH BAR DELEGATE
-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString *)searchText{
    if ([self.searchBar.text length]>ZERO2) {
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
    self.partidosArray = [[Partido MR_findAllSortedBy:SORT_KEY_NAME2 ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"name contains[c] %@",searchText] inContext:[NSManagedObjectContext MR_defaultContext] ] mutableCopy];
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
