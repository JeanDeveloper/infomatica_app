
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infomatica_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:infomatica_app/presentation/screens/home/home_screen.dart';
import 'package:infomatica_app/presentation/widgets/custom_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController _userController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _userController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [

          //CABECERA
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  bottom:50,
                  left: -25,
                  right: -25,
                  height: size.width + 25,
                  child: Container(
                    alignment: const Alignment(0.0, 0.3),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(200)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff294466), Color(0xff294466)],
                        stops: [0.5, 1.0]
                      ),
                    ),
                    child: const Text("¡ INFOMATICA !", style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold) ),
                  )
                ),
              ],
            ),
          ),

          Text(
            "Iniciar Sesion",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),

          //FORM
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Text(
                      textAlign: TextAlign.start,
                      "Usuario",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold
                      )
                    ),

                    SizedBox(height: size.height * .01),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style:Theme.of(context).inputDecorationTheme.labelStyle,
                        controller: _userController,
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(color: Colors.green),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            hintText: "Usuario"),
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      ),
                    ),

                    SizedBox(height: size.height * .05),

                    Text(
                      "Contraseña",
                      style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold)
                    ),

                    SizedBox(height: size.height * .01),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style:Theme.of(context).inputDecorationTheme.labelStyle,
                        controller: _passwordController,
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          hintText: "Contraseña"
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * .03),


                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {

                        if( state is AuthLoged ){
                          Navigator.of(context).pushReplacement( MaterialPageRoute(builder: ( _ ) => const HomeScreen()));
                        }

                        if( state is AuthError ){
                          return showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.error(
                              message: state.message,
                            ),
                          );
                        }

                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return CustomButton(
                            padding: EdgeInsets.symmetric(horizontal: size.width * .3, vertical: size.height * .02),
                            ontap: ( state is AuthLoading )
                              ? null
                              : () {
                                FocusScope.of(context).unfocus();
                                if (_userController.text == "") {
                                  return showTopSnackBar(
                                    Overlay.of(context),
                                    const CustomSnackBar.error(
                                      message: "El usuario es requerido",
                                    ),
                                  );
                                } else if (_passwordController.text == "") {
                                  return showTopSnackBar(
                                    Overlay.of(context),
                                    const CustomSnackBar.error(
                                      message: "La contraseña es requerida",
                                    ),
                                  );
                                } else {
                                  BlocProvider.of<AuthBloc>(context).add(DoLoginEvent(_userController.text, _passwordController.text));
                                }
                              },
                            child: (state is AuthLoading)
                            ? const CircularProgressIndicator()
                            : const Text(
                              "bIngresar",
                              style: TextStyle(
                                color: Colors.white
                              ),
                              textAlign: TextAlign.center
                            ),
                          );
                        },
                      )

                    )

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}