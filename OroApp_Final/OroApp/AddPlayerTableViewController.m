//
//  AddPlayerTableViewController.m
//  OroApp
//
//  Created by Guillermo Azofeifa on 11/22/15.
//  Copyright © 2015 Guillermo Azofeifa. All rights reserved.
//

#import "AddPlayerTableViewController.h"
#import "Jugador.h"
#import "DetallesJugador.h"
#import "Photo.h"

const int TAKE_PHOTO_OPTION = 0;
const int CHOOSE_PHOTO_OPTION = 1;

@interface AddPlayerTableViewController ()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(nonatomic) BOOL isInEditMode;

@end

@implementation AddPlayerTableViewController

#pragma mark VIEW CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    [self addTapInHandImageView];
    [self addCustomButtonsNavigationController];
    [self validateIfJugadorExist];
    
}

-(void)validateIfJugadorExist{
    
    if (!self.jugador) {
        
        self.jugador.fechaModificacion = [NSDate date];
        self.jugador.name = self.txtNombre.text;
        self.jugador.apellido1 = self.txtApellido1.text;
        self.jugador.apellido2 = self.txtApellido2.text;
        
        self.jugador.cedula = self.txtCedula.text;
        self.jugador.edad = self.txtEdad.text;
        self.jugador.dorsal = self.txtDorsal.text;
    }
    else{
        self.isInEditMode = YES;
    
    }
    
    NSString *name = [self.jugador valueForKey:@"Nombre"];
    
    self.title = name ? name : @"Nuevo";
    self.txtNombre.text =name;
    self.txtApellido1.text = [self.jugador valueForKey:@"Apellido1"];
  //  self.txtEdad.text = [self.jugador valueForKey:@"Edad"];
    self.txtDorsal.text = [self.jugador valueForKey:@"Dorsal"];
    self.txtApellido2.text = [self.jugador valueForKey:@"Apelldo2i"];

   if (self.jugador.photo.imageFile) {
       [self setImageForPlayerProfile:[UIImage imageWithData:self.jugador.photo.imageFile]];
   }
    
   }

-(void)setImageForPlayerProfile:(UIImage*)palyerProfileImage{
    self.handImageView.image = palyerProfileImage;
    self.handImageView.backgroundColor = [UIColor clearColor];
}

#pragma mark -RATING CONTROL

#pragma mark -GESTURE
-(void)addTapInHandImageView{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInHandImageView:)];
    [self.handImageView addGestureRecognizer:tapGestureRecognizer];
}

-(void)tapInHandImageView:(UITapGestureRecognizer*)sender{
    [self takePicture];
}

#pragma mark -IMAGE CAPTURE METHODS
-(void)takePicture{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Pick Photo" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Toma la Foto",@"Selecciona la Foto", nil];
    [sheet showInView:self.navigationController.view];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.jugador.photo.imageFile = UIImageJPEGRepresentation(image, 1.0);
    [self setImageForPlayerProfile:image];
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -ACTION SHEET DELEGATE
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UIImagePickerController *imagePicker = [UIImagePickerController new];
    imagePicker.delegate = self;
    switch (buttonIndex) {
        case TAKE_PHOTO_OPTION:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:imagePicker animated:YES completion:nil];
            }
            break;
        case CHOOSE_PHOTO_OPTION:
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePicker animated:YES completion:nil];
        default:
            break;
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
        [self.jugador MR_deleteEntity];
        
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doneButtonAction{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Mensaje de App" object:self userInfo:@{@"key_notification":@"Pago alamcenado correctamente"}];
    
//    [self saveContext];
    
    self.jugador.fechaModificacion = [NSDate date];
    self.jugador.name = self.txtNombre.text;
    self.jugador.apellido1 = self.txtApellido1.text;
    self.jugador.apellido2 = self.txtApellido2.text;
    
    self.jugador.cedula = self.txtCedula.text;
    self.jugador.edad = self.txtEdad.text;
    self.jugador.dorsal = self.txtDorsal.text;
    
//      self.jugador.photo.imageFile = UIImageJPEGRepresentation(self.handImageView.image, 1.0);
    
    if (!self.jugador) {
        Jugador *jugador = [Jugador jugadorWithName:self.txtNombre.text
                                          apellido1:self.txtApellido1.text
                                          apellido2:self.txtApellido2.text
                                               edad:self.txtEdad.text
                                             cedula:self.txtCedula.text
                                             dorsal:self.txtDorsal.text
                                           posicion:@"No definada"
                                              photo: self.handImageView.image
                                posicionAlternativa:@"No definada"];
        
        if(jugador){
            
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else{
        
        [self.jugador MR_deleteEntity];
        
        Jugador *jugador = [Jugador jugadorWithName:self.txtNombre.text
                                          apellido1:self.txtApellido1.text
                                          apellido2:self.txtApellido2.text
                                               edad:self.txtEdad.text
                                             cedula:self.txtCedula.text
                                             dorsal:self.txtDorsal.text
                                           posicion:@"No definada"
                                              photo: self.handImageView.image
                                posicionAlternativa:@"No definada"];
        
        if(jugador){
            
            [self.navigationController popViewControllerAnimated:YES];
        }

        
           }
    
     [self saveContext];
}


#pragma mark CORE DATA METHODS
-(void)saveContext{
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            NSLog(@"El jugador ha sido registrado satisfactoriamente.");
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
        self.jugador.name = self.txtNombre.text;
         self.jugador.apellido1 = self.txtApellido1.text;
         self.jugador.apellido2 = self.txtApellido2.text;
        self.jugador.edad = self.txtEdad.text;
        self.jugador.cedula = self.txtCedula.text;
        self.jugador.dorsal = self.txtDorsal.text;
        self.jugador.posicion = self.txtPosicion.text;
        self.jugador.posicionAlternativa = self.txtPosicionAlternativa.text;
    }
}


#pragma mark -TEXT VIEW DELEGATE
-(void)textViewDidEndEditing:(UITextView*)textView{
    if ([textView.text length] > 0) {
        self.jugador.name = textView.text;
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

@end
