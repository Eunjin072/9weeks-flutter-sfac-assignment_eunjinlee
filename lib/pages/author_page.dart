import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';
var backgroundImage ='https://images.unsplash.com/photo-1590691565311-747bdc916e9b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2680&q=80';

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

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
        future:SecretCatApi.fetchAuthors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==ConnectionState.done){
            return GridView.builder(itemCount: snapshot.data?.length,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
            itemBuilder: (context, index) {
              return ZoomIn(
                delay: Duration(milliseconds: 200*index),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundImage: 
                      NetworkImage(snapshot.data![index].avatar!),
                    ),
                    SizedBox(height: 8,),
                    Text(
                    snapshot.data![index].username,
                    style: TextStyle(color:  Colors.white),
                          ),
                          
                    
                  ],
                ),
              );

            }
            );        
          }
          return SizedBox();
        },
              ),
      ),
    );

        
          }
    
  }