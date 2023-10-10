
import 'package:flutter/material.dart';
var backgroundImage ='https://images.unsplash.com/photo-1576518985988-ff8f8fc5a623?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80';
class uploadPage extends StatelessWidget {
  const uploadPage ({super.key});

  @override
    Widget build(BuildContext context) {
    var SecretCatApi;
    var controller = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
      title: Text('뒤로가기'),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      ),
      body:Container(
        alignment: Alignment.center ,
        decoration: BoxDecoration(
        image: DecorationImage(image:NetworkImage(backgroundImage),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken,
        ),
        ),
        ),
        child:Padding(
          padding: const EdgeInsets.all(16),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          TextField(
          controller: controller,
          minLines: 7,
          maxLines: 8,
          decoration: InputDecoration(
            filled: true, fillColor: Colors.white24,
          ),
        ),

        ElevatedButton(onPressed: ()async{
          if (controller.text !=''){
            var secret =await SecretCatApi.addscret(controller.text);
            if (secret != null){
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content:Text("비밀공유성공${secret.secret}")));
              
            }
         
          SecretCatApi.addscret(controller.text);
          } 
        }, child: Text("업로드하기"),
        
        ),
        ]
      ),
      ),
      ),
      );

    }
}