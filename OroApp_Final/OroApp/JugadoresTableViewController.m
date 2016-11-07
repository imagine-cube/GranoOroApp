//
//  JugadoresTableViewController.m
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/21/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import "JugadoresTableViewController.h"
#import "PlayerCustomTableViewCell.h"
#import "Jugador.h"
#import "DetallesJugador.h"
#import "Photo.h"
#import "AddPlayerTableViewController.h"
//wcf service

#define WcfServiceURL [NSURL URLWithString: @"http://granooroapp.imaginelab.co/Service1.svc/json/listaJugadores"]

NSString *const PREFERENCE_OF_THE_USER_TO_SORT_KEY = @"SortKey";
NSString *const SORT_KEY_NAME = @"name";
NSString *const STORYBOARD_ID_OF_PLAYER_TABLE_VIEW = @"PlayerTableViewController";
const int SORT_BY_NAME = 1;
const int SORT_BY_RATING = 0;
NSString *const CELL_ID = @"PlayerCustomTableViewCell";
static const int ZERO = 0;

NSString *const SORT_KEY_RATING = @"Nombre";

@interface JugadoresTableViewController ()<UISearchBarDelegate >

@property (nonatomic,strong) NSMutableArray *playerArray;

@end

@implementation JugadoresTableViewController


- init
{
    self = [super init];
    if (!self) return nil;
    
    // set up other stuff here
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCellInTableView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"Oro App";
    [self getSortPreferencesOfTheUser];
    [self fetchAllPlayers];
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
-(void)fetchAllPlayers{
    NSString *sortKey = [[NSUserDefaults standardUserDefaults] objectForKey:PREFERENCE_OF_THE_USER_TO_SORT_KEY];
    BOOL ascending = [sortKey isEqualToString:SORT_KEY_NAME   ] ? NO:YES;
    self.playerArray = [[Jugador MR_findAllSortedBy:SORT_KEY_NAME ascending:ascending] mutableCopy];
    [self.tableView reloadData];
}



-(void)registerCustomCellInTableView{
    UINib *nib = [UINib nibWithNibName:CELL_ID bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_ID];
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
    return self.playerArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 310;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PlayerCustomTableViewCell *cell = (PlayerCustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
    [self configureCellWithIndexPath:indexPath cell:cell];
    return cell;
}

-(PlayerCustomTableViewCell*)configureCellWithIndexPath:(NSIndexPath*)indexPath cell:(PlayerCustomTableViewCell*)cell{
    
    for(int i=0; i< self.playerArray.count; i++)
    {
        
        Jugador *jugador = self.playerArray[indexPath.row];
        cell.nameBeerLabel.text = [jugador valueForKey:@"name"];
        
        if (jugador.photo.imageFile) {
            cell.beerImage.image = [UIImage imageWithData:jugador.photo.imageFile];
        }
        
        NSString * strApellidos = [NSString stringWithFormat:@"%@ %@",[jugador valueForKey:@"apellido1"], [jugador valueForKey:@"apellido2"]];
        cell.apellidos.text = strApellidos;
        cell.dorsal.text = [jugador valueForKey:@"dorsal"];
        
         return cell;
        
    }
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Jugador *playerSelected = self.playerArray[indexPath.row];
    AddPlayerTableViewController *newPlayerTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_OF_PLAYER_TABLE_VIEW];
    newPlayerTableViewController.jugador = playerSelected;
    [self.navigationController pushViewController:newPlayerTableViewController animated:YES];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Jugador *beerSelected = self.playerArray[indexPath.row];
        [beerSelected MR_deleteEntity];
        [self saveContext];
        [self.playerArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark -USER PREFERENCES METHODS
-(void)getSortPreferencesOfTheUser{
    if (![[NSUserDefaults standardUserDefaults] objectForKey:PREFERENCE_OF_THE_USER_TO_SORT_KEY]) {
        [[NSUserDefaults standardUserDefaults] setObject:SORT_KEY_RATING forKey:PREFERENCE_OF_THE_USER_TO_SORT_KEY];
    }
    else if ([[[NSUserDefaults standardUserDefaults] objectForKey:PREFERENCE_OF_THE_USER_TO_SORT_KEY] isEqualToString:SORT_KEY_NAME]) {
        self.segmentedControllerProperty.selectedSegmentIndex = SORT_BY_NAME;
    }
}


#pragma mark -ACTIONS
- (IBAction)addPlayer:(id)sender {
    AddPlayerTableViewController *newBeer = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_OF_PLAYER_TABLE_VIEW];
    [self.navigationController pushViewController:newBeer animated:YES];
}


-(IBAction)changeValueInSegmentedControl:(id)sender {
    
    [self fetchAllPlayers];
}


#pragma mark -SEARCH BAR DELEGATE
-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString *)searchText{
    if ([self.searchBar.text length]>ZERO) {
        [self doSearch];
    }
    else{
        [self fetchAllPlayers];
    }
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
    self.searchBar.text = @"";
    self.searchBar.showsCancelButton = NO;
    [self fetchAllPlayers];
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
    self.playerArray = [[Jugador MR_findAllSortedBy:SORT_KEY_NAME ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"name contains[c] %@",searchText] inContext:[NSManagedObjectContext MR_defaultContext] ] mutableCopy];
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
