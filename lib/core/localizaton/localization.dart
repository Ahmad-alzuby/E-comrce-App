import 'package:get/get_navigation/get_navigation.dart';

class MyLocal extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          //On Boardaing
          'welcome': 'مرحبأ',
          'title1': 'اختر منتجاّ',
          'title2': ' العديد من المنتجات',
          'title3': 'ادخل طلبك',
          'title4': 'توصيل سريع',
          'body1':
              'لدينا 100 ألف منتج اختار منتجك  \nمن متجر التجارة الإلكترونية \n الخاص بنا',
          'body2':
              'تم استخدام أفضل أداة تعقب\n لتتبع طلبك. ستعرف مكان\n في الوقت الحالي',
          'body3':
              'تسليم موثوق وسريع. نحن\nنقوم بتسليم منتجك بأسرع\nطريقة ممكنة.',
          'body4':
              'تسليم موثوق وسريع. نحن\nنقوم بتسليم منتجك بأسرع\nطريقة ممكنة.',
          //btn
          'btn': 'متابعه',
          'skip': 'تخطي',
          //login
          'Welcome_Back': 'مرحبا مجدداّ',
          "sign_in_body":
              'قم بتسجيل الدخول بواسطه البريد الاكتروني او حسابات التواصل الاجتماعي ',
          'Email': "البريد الالكتروني",
          'Enter Your Email': 'ادخل البريد الالكتروني',
          'Enter Your PassWord': 'ادخل كلمه المرور',
          'ForgetPaasword': ' نسيت كلمة المرور ',
          'signUp': 'تسجيل الدخول',
          'Dont Have Account': 'ليس لديك حساب بعد؟ ',
          'sign up now': 'انشاء حساب الأن',
          'Join Now!': 'انضم الأن',
          'UserName': 'اسم المستخدم',
          'password': 'كلمه المرور',
          'conferm Passwrod': 'تأكيد كلمة المرور',
          'login': 'تسجيل الدخول',
          'already Have An Account': 'لديك حساب بلفعل؟',
          'Login Now': ' سجل الدخول الأن',
          'logout': 'تسجيل خروج',
          'Enter Your Confirm PassWord': "ادخل تأكيد كلمه المرور",
          'Enter Your  userName': "ادخل أسم الستخدم",
          'Cheek Email': " التحقق من البريد الألكتروني",
          'Order Subtotal': "السعر الأساسي",
          'Discount': "خصم" ,
          'Total Price': "المجموع" ,
          'Cheek': "تحقق",
          'pay':"شراء",
          "forget_password_body":
              "في حال الحساب موجود سوف نرسل رساله لتغير كلمه المرور",
          "we well review your reqest and check if the email exists we well send the url massge":
              'سوف نراجع طلبك في حال وجود الحساب سوف نرسل رساله لتغير كلمه المرور',
          //validetor
          "Not Valid UserName": "اسم مسخدم غير صالح",
          "Not Valid Email": "البريد الألكتروني غير صحيح",
          "Can't Be less Then": "لا يمكن ان يكون الحقل قصير بهذ القدر",
          "Can't Be Larger Then": "لا يمكن ان يكون الحقل كبير بهذ القدر",
          "payment details": "تفاصيل الشراء",

               //categray
          'laptops': "لابتوب",
          'smartphones': "هواتف",
          'skincare': "العنايه بلبشره",
          'fragrances': "عطور",
          'home-decoration': "ديكور منزلي",
          'groceries': "بقوليات",
          //
          'light mode': 'الوضع الفاتح',
          'dark mode': 'الوضع الداكن'
        },
        'en': {
          'title1': 'Chose Product',
          'title2': ' Many Of Prouct',
          'title3': ' track Your Order',
          'title4': ' Fast Delivery',
          'body1':
              'We have 100,000 products.\n Your product has been selected from our\n e-commerce store.',
          'body2':
              "Best Tracker has been Used For\nTrack your order. You'll know where\nyour product is at the moment",
          'body3':
              'Reliable And Fast Delivery. We\nDeliver your product the fastest\nway possible.',
          'body4':
              "Best Tracker has been Used For\nTrack your order. You'll know where\nyour product is at the moment",
          'btn': 'contenio',
          'skip': 'skip',
          'Welcome_Back': 'Welcome Back',
          'pay' :'pay',
          "sign_in_body":
              'Sign In With Your Email And Passowrd Or Continue With Social Medai',
          'Email': 'Email',
          'Enter Your Email': 'Enter Your Email',
          'Enter Your PassWord': 'Enter Your PassWord',
          'ForgetPaasword': 'Forget Passowrd?',
          'signUp': 'sign Up',
          'Dont Have Account': 'Dont Have An Account ?',
          'sign up now': 'Sign Up Now',
          'join Now!': 'Join Now!',
          'UserName': 'user name',
          'password': 'Paasowrd',
          'conferm Passwrod': 'conferm Paasowrd',
          'login': 'login',
          'logout': "log out",

          'already Have An Account': 'already Have An Account?',
          'Login Now': 'Login Now',
          'Enter Your Confirm PassWord': 'Enter Your Confirm PassWord',
          'Cheek Email': "Cheek Email",
          'Cheek': "Cheek",
          'welcome': 'welcome',
          "forget_password_body":
              "if the usre is exists we well send massge to change the password",
          "we well review your reqest and check if the email exists we well send the url massge":
              "we well review your reqest and check if the email exists we well send the url massge",
          //validator
          "Not Valid UserName": "Not Valid UserName",
          "Not Valid Email": "Not Valid Email",
          "Can't Be less Then": "Can't Be lessing like this",
          "Can't Be  Empty": "Can't Be  Empty",
          "Can't Be Larger Then": "Can't Be Large like this",

          //account
          'dark mode': 'dark mode',
          'light mode': 'light mode',
      
        //
          "payment details":  "payment details",

           'Order Subtotal': "Order Subtotal",
          'Discount': "Discount" ,
          'Total Price': "Total Price" ,
          //categray
          'laptops': "laptops",
          'smartphones': "smart phones",
          'skincare': "skincare",
          'fragrances': "fragrances",
          'home-decoration': "home decoration",
          'groceries': "groceries",
        }
      };
}
