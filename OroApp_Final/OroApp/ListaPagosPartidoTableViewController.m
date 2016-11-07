//
//  ListaPagosPartidoTableViewController.m
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/29/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import "ListaPagosPartidoTableViewController.h"
#import "PagosPartidoTableViewController.h"
#import "PagoPartidoTableViewCell.h"
#import "Jugador.h"
#import "Partido.h"
#import "Pago.h"
#import "DetallesJugador.h"
#import "Photo.h"
#import "AddPagoTableViewController.h"
#import "MainViewController.h"

NSString *const PREFERENCE_OF_THE_USER_TO_SORT_KEY3 = @"SortKey";
NSString *const SORT_KEY_NAME3 = @"monto";
NSString *const STORYBOARD_ID_OF_PLAYER_TABLE_VIEW3 = @"AddPagoTableViewController";
NSString *const STORYBOARD_ID_OF_MENU3 = @"MenuViewController";

const int SORT_BY_NAME3 = 1;
const int SORT_BY_RATING3= 0;
NSString *const CELL_ID3 = @"PagoPartidoTableViewCell";
static const int ZERO2 = 0;
NSString *const SORT_KEY_RATING3 = @"jugador";

@interface ListaPagosPartidoTableViewController ()<UISearchBarDelegate >
@property (nonatomic,strong) NSMutableArray *pagosArray;

@property (nonatomic,strong) NSMutableArray *pagos;

@end

@implementation ListaPagosPartidoTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self registerCustomCellInTableView];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.title = @"Lista Pagos Partido";
    
   self.pagos = [[NSMutableArray alloc] init];
    [self obtenerPagosPartido];
    [self registerNotifications];
}


-(void)registerNotifications{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillTerminate:) name:UIApplicationWillTerminateNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(printNotification:) name:@"Grano Oro App" object:nil];
}

-(void)appWillTerminate:(NSNotification*)notification{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Grano Oro App" object:nil];
}

-(void)printNotification:(NSNotification*)notification{
    
    NSDictionary *userInfo = notification.userInfo;
    NSLog(@"%@",[userInfo valueForKey:@"key_notification"]);
}



#pragma mark -CORE DATA METHODS
-(void)obtenerPagosPartido{
    
    NSString *sortKey = [[NSUserDefaults standardUserDefaults] objectForKey:PREFERENCE_OF_THE_USER_TO_SORT_KEY3];
    BOOL ascending = [sortKey isEqualToString:SORT_KEY_NAME3   ] ? NO:YES;
    
    if ([sortKey isEqualToString:SORT_KEY_NAME3]) {
        NSLog(@"ENTRO A partido");
    }
    
    self.pagosArray = [[Pago MR_findAll] mutableCopy];
    
        for (int i = 0; i < [self.pagosArray count]; i++)
        {
            Pago *pago = [self.pagosArray objectAtIndex:i];
            if(pago.partido == self.partido){
                
              [self.pagos addObject:pago];
            }
        }
    
    if(self.pagos.count > 0){
         NSLog(@"Rival%@",@"eee");
        self.pagosArray = nil;
        
        self.pagosArray = self.pagos;
    }else{
        
        NSLog(@"Rival%@",@"no tiene");
                self.pagosArray = nil; 
              }
    
    [self.tableView reloadData];
}

-(void)registerCustomCellInTableView{
    
    UINib *nib = [UINib nibWithNibName:CELL_ID3 bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_ID3];
    
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
    return self.pagosArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PagoPartidoTableViewCell *cell = (PagoPartidoTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CELL_ID3];
    [self configureCellWithIndexPath:indexPath cell:cell];
    return cell;
}

-(PagoPartidoTableViewCell*)configureCellWithIndexPath:(NSIndexPath*)indexPath cell:(PagoPartidoTableViewCell*)cell{
    
    Pago *pago = self.pagosArray[indexPath.row];
    NSString* monto = [NSNumberFormatter
                                localizedStringFromNumber:pago.monto
                                numberStyle:NSNumberFormatterCurrencyStyle];
    cell.monto.text = monto;
    cell.NombreJugador.text = pago.jugador.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Pago *pagoSelected = self.pagosArray[indexPath.row];
    AddPagoTableViewController *newBeerTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_OF_PLAYER_TABLE_VIEW3];
    
    newBeerTableViewController.pago = pagoSelected;
    [self.navigationController pushViewController:newBeerTableViewController animated:YES];
    
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Partido *partidoSelected = self.pagosArray[indexPath.row];
        [partidoSelected MR_deleteEntity];
        [self saveContext];
        [self.pagosArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (IBAction)volver:(id)sender {
    MainViewController  *menu = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_OF_MENU3];
    [self.navigationController pushViewController:menu animated:YES];
}

#pragma mark -SEARCH BAR DELEGATE
-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString *)searchText{
    
    if ([self.searchBar.text length]>ZERO2) {
        [self doSearch];
    }
    else{
        [self obtenerPagosPartido];
    }
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [self.searchBar resignFirstResponder];
    self.searchBar.text = @"";
    self.searchBar.showsCancelButton = NO;
    [self obtenerPagosPartido];
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
    self.pagosArray = [[Partido MR_findAllSortedBy:SORT_KEY_NAME3 ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"name contains[c] %@",searchText] inContext:[NSManagedObjectContext MR_defaultContext] ] mutableCopy];
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

- (IBAction)registrarPago:(id)sender {
    
    AddPagoTableViewController *nuevoPago = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_OF_PLAYER_TABLE_VIEW3];
    nuevoPago.partido = self.partido;

    [self.navigationController pushViewController:nuevoPago animated:YES];
   
}
@end
