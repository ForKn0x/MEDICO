
var verificationCode = '';
var isLoginScreen = true;
var isOTPScreens = false;
var isRegister = true;
bool isUserADoctor = false;

bool showSpinner = false;

List<dynamic> doctorCategories = [
  'Pediatrician',
  'Dermatologist',
  'Ophthalmologist',
  'Cardiologist',
  'Obstetrician',
  'Neurologist',
];

List<Map<String, dynamic>> docCategories=[
  {"icon": "images/Doctor_types/pediatrician.png", "text": "Pediatrician"},
  {"icon": "images/Doctor_types/dermatologist.png", "text": "Dermatologist"},
  {"icon": "images/Doctor_types/ophthalmologist.png", "text": "Ophthalmologist"},
  {"icon": "images/Doctor_types/cardiologist.png", "text": "Cardiologist"},
  {"icon": "images/Doctor_types/obstetrician.png", "text": "Obstetrician"},
  {"icon": "images/Doctor_types/neurologist.png", "text": "Neurologist"},
];


