//
//  AddPartidoTableViewController.m
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/28/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import "AddPartidoTableViewController.h"
#import "Partido.h"
#import "DetallesJugador.h"
#import "Photo.h"
#import "AppDelegate.h"

@interface AddPartidoTableViewController ()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(nonatomic) BOOL isInEditMode;


@end

@implementation AddPartidoTableViewController

#pragma mark VIEW CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tipoPartidoArray  = @[@"Amistoso",@"Campeonato"];
    
    self.tipoPartido.dataSource = self;
    self.tipoPartido.delegate = self;
    
    [self initializeAllObjects];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}


#pragma mark -INITIALIZERS
-(void)initializeAllObjects{
  //  [self addTapInHandImageView];
    [self addCustomButtonsNavigationController];
    [self validateIfBeerExist];
}

-(void)validateIfBeerExist{
    
    if (!self.partido ) {
        
        self.partido.fecha = [NSDate date];
        self.partido.rival = self.rival.text;
        self.partido.descripcion = self.descripcion.text;
        self.partido.hora = self.hora.text;
        self.partido.lugar  = self.lugar.text;

    }
    else{
        self.isInEditMode = YES;
   }
   
    self.title = self.partido.rival ? self.partido.rival : @"Nuevo Partido";
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSString *strFecha = [dateFormatter stringFromDate:[NSDate date]];

    self.rival.text = self.partido.rival;
    self.fecha.text = strFecha;
    self.hora.text = self.partido.hora;
    self.descripcion.text = self.partido.descripcion;
    
    self.lugar.text = self.partido.lugar ;
   }

#pragma mark -CUSTOM NAVIGATION CONTROLLER
-(void)addCustomButtonsNavigationController{
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonAction)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonAction)];
    
    self.navigationItem.leftBarButtonItem = cancelButton;
    self.navigationItem.rightBarButtonItem = doneButton;
}

-(void)cancelButtonAction{
    if (!self.isInEditMode) {
        [self.partido MR_deleteEntity];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doneButtonAction{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Oro App" object:self userInfo:@{@"key_notification":@"Esto es enviado desde una notificacion"}];
    
    Partido *partido = [Partido partidoWithName:self.descripcion.text
                                          rival:self.rival.text
                                           hora:self.hora.text
                                          lugar:self.lugar.text
                                          fecha:self.fecha.text];
    
     [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark CORE DATA METHODS
-(void)saveContext{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            NSLog(@"You successfully saved you context.");
            [self.navigationController popViewControllerAnimated:YES];
        }
        else if (error){
            NSLog(@"Error saving context: %@",error.description);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Error" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }];
}

#pragma mark -TEXT FIELD DELEGATES
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField.text length] > 0) {
        self.title = textField.text;
        self.partido.rival = self.rival.text;
        self.partido.descripcion = self.descripcion.text;
        self.partido.lugar = self.lugar.text;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSDate *dateFromString = [[NSDate alloc] init];
        dateFromString = [dateFormatter dateFromString:self.fecha.text];
        self.partido.fecha = dateFromString;
    }
}

#pragma mark -TEXT VIEW DELEGATE
-(void)textViewDidEndEditing:(UITextView*)textView{
    if ([textView.text length] > 0) {
        self.partido.rival  = textView.text;
        
    }
}


- (IBAction)closeKeyboard:(id)sender {
    [self.view endEditing:YES];
}

// MÉTODO PARA OCULTAR TECLADO CUANDO SE DA RETURN
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    return  _tipoPartidoArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _tipoPartidoArray[row];
}

@end
