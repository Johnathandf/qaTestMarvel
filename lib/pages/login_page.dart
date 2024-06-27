import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';
import 'package:trilhaapp/shered/app_images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var  emailController = TextEditingController(text: "");
  var  senhaController = TextEditingController(text: "");


  // String email ="";
  // String senha = "";
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        backgroundColor:  const Color.fromARGB(255, 0, 0, 0),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const SizedBox(
                  height: 50,),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 5,
                        child: Image.asset(
                          AppImages.qatest,
                          height: 100,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                const SizedBox(
                  height: 20,),
                const Text(
                  "Já tem cadastro?",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,),
                const Text(
                  "Faça seu login e make the change_",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                  ),
              
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child:  TextField(
                    key: const ValueKey("emailTextField"),
                    controller:  emailController,
                    onChanged: (value) {
                      debugPrint(value);
                    },

                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: -5),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 143, 27, 158))),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 143, 27, 158))),
                            
                      hintText: "Email",
                      
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person, 
                        color: Color.fromARGB(255, 143, 27, 158),
                        )),
                  ),
                ),
              
                  const SizedBox(
                    height: 10,
                  ),
                 Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: senhaController,
                      obscureText: isObscureText,
                      
                      onChanged: (value) {
                        debugPrint(value);
                    },
                      style:  TextStyle(color: Colors.white),
                      decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.only(top: -5),
                        enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 143, 27, 158))),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 143, 27, 158))),
                      hintText: "Senha",
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.lock, 
                        color: Color.fromARGB(255, 143, 27, 158),
                        ),
                        suffixIcon: InkWell( 
                          onTap: (){
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                            
                          },

                      child: Icon(
                        isObscureText 
                        ? Icons.visibility_off : Icons.visibility, 
                        color: const Color.fromARGB(255, 143, 27, 158),
                        ),
                      ),
                    ),
                  ),  
                ),
                
                  
                const SizedBox(
                  height: 20,),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        

                        onPressed: (){
                          if (emailController.text.trim() == "email@email.com" && 
                            senhaController.text.trim() == "123"){
                              Navigator.pushReplacement
                              (context, MaterialPageRoute(
                                builder: (context) => const MainPage()));

                        } else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Erro ao efetuar o Login"))
                          );
                          
                        }

                      },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 143, 27, 158))
                        ),
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),  
                        )),
                    ),
                ),
                const SizedBox(
                  height: 30,),
                
                 Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Esqueci minha senha",
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                ),
              
                
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(color: Colors.green),
                    ),
                ),
                Expanded(child: Container())
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}