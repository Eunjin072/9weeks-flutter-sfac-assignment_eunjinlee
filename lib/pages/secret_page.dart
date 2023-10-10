import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';
var backgroundImage ='https://images.unsplash.com/photo-1590691565311-747bdc916e9b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2680&q=80';

class SecretPage extends StatelessWidget {
  const SecretPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
      title: Text('뒤로가기'),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      ),
      body:Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
        image: DecorationImage(image:NetworkImage(backgroundImage),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken,
        ),
        ),
        ),
        child: FutureBuilder(
        future:SecretCatApi.fetchSecrets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var reversedList = snapshot.data!.reversed.toList();
            return PageView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return FadeInRight(
                  delay: Duration(microseconds: 200),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                         radius: 56,
                         backgroundColor: Colors.white38,
                         backgroundImage: AssetImage('assets/images/back.png'),
                        ),
                        SizedBox(height: 24,),
                        Text(
                          reversedList[index].secret,
                          textAlign: TextAlign.center,
                          style: TextStyle(color:Colors.white,
                          fontSize: 24,
                          ),
                        ),
                        SizedBox(height:8,
                  ),
                        Text(
                          reversedList[index].author?.username??"익명",
                          textAlign: TextAlign.center,
                          style: TextStyle (
                            color: Colors.white,
                            fontSize: 18),
                        ),
                  
                      ],
                    ),
                );
              },
            );
          }
              return CircularProgressIndicator();
          },
                
        ),
      ),
    );
  }
}
    
  