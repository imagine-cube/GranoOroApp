//
//  AddPagoTableViewController.m
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/29/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import "AddPagoTableViewController.h"
#import "Pago.h"
#import "DetallesJugador.h"
#import "Photo.h"
#import "Partido.h"
#import "Jugador.h"


@interface AddPagoTableViewController ()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(nonatomic) BOOL isInEditMode;
@end

@implementation AddPagoTableViewController

#pragma mark VIEW CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];

    _jugadoresArray  = [Jugador MR_findAll];
    
    self.jugadores.dataSource = self;
    self.jugadores.delegate = self;
    
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
    
    [self addCustomButtonsNavigationController];
    [self ValidarPagoPartido];
}

-(void)ValidarPagoPartido{
    
    if (!self.pago ) {
        
        NSDecimalNumber *monto = [NSDecimalNumber decimalNumberWithString:self.monto.text];
        
        self.pago.monto = monto;
        
        self.jugadoresArray = self.jugadoresArray;
        
        if(!self.jugadoresArray){
            
            NSInteger row;
                        UIPickerView *repeatPickerView;
            
                        row = [repeatPickerView selectedRowInComponent:0];
                        self.pago.jugador = [self.jugadoresArray  objectAtIndex:row];
            
        }
        
    }else{
        
        self.isInEditMode = YES;
        
        
        NSString* monto = [NSNumberFormatter
                           localizedStringFromNumber:self.pago.monto
                           numberStyle:NSNumberFormatterCurrencyStyle];
        
        if(!monto){
            self.monto.text = monto;
        }
        
        if(!self.pago.jugador){
        }
    }
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
        [self.pago MR_deleteEntity];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doneButtonAction{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cursoiOSAvanzado" object:self userInfo:@{@"key_notification":@"Esto es enviado desde una notificacion"}];
    
    NSDecimalNumber *monto = [NSDecimalNumber decimalNumberWithString:self.monto.text];
    
    Pago *pago = [Pago pagoWithName:@"Pago de Cuota"
                                    monto:monto
                                    partido:self.partido
                                    jugador:self.jugador];
    
    if (pago) {
        NSLog(@"You successfully saved you context.");
    [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Error" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

#pragma mark CORE DATA METHODS

-(void)saveContext{
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
        
        if (contextDidSave) {
            NSLog(@"You successfully saved you context.");
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        else if (error)
        {
            
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
        NSDecimalNumber *monto = [NSDecimalNumber decimalNumberWithString:self.monto.text];
        self.pago.monto = monto;
    }
}


#pragma mark -TEXT VIEW DELEGATE
-(void)textViewDidEndEditing:(UITextView*)textView{
    
    if ([textView.text length] > 0) {
        
        NSString* monto = [NSNumberFormatter
                           localizedStringFromNumber:self.pago.monto
                           numberStyle:NSNumberFormatterCurrencyStyle];

        monto  = textView.text;
        
        NSDecimalNumber *monto2 = [NSDecimalNumber decimalNumberWithString:monto];
        self.pago.monto = monto2;
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
    return  _jugadoresArray.count;
}


// Se muestra el el picker View de jugadores el nombre y el primer apellido de todos los jugadores registrados.
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    Jugador *jugador = _jugadoresArray[row];
    NSString *jugadorName = [NSString stringWithFormat:@"%@ %@", jugador.name, jugador.apellido1];
    
     NSLog(@"%@",jugadorName);
    self.jugador = jugador;
    return jugadorName;
}
@end
