import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/author_page.dart';
import 'package:flutter_application_2/pages/secret_page.dart';
import 'package:flutter_application_2/pages/upload_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
           CircleAvatar(
            radius: 56,
            backgroundColor: Colors.white38,
            backgroundImage: AssetImage('assets/images/back.png'),
          ),
          SizedBox(
            height: 36, 
          ),
          Text("비밀듣는 수달이", style: TextStyle(color: Colors.white,fontSize: 34),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text('비밀보기'),
            subtitle: Text('놀러가기'),
            onTap: (){
              Navigator.push(
              context, 
              MaterialPageRoute(
              builder: (context) => AuthorPage()
              ),
              );
            },
            trailing: CircleAvatar(
            radius: 56,
            backgroundColor: Colors.white38,
            backgroundImage: AssetImage('assets/images/back.png'),
          ),
          ),
          SizedBox(height: 24,),
          ListTile(
            tileColor:Colors.white,
            title: Text('작성자들보기'),
            subtitle: Text('놀러가기'),
            trailing: CircleAvatar(
            radius: 56,
            backgroundColor: Colors.white38,
            backgroundImage: AssetImage('assets/images/back.png'),
          ),
            onTap: (){
              Navigator.push(
              context, 
              MaterialPageRoute(
              builder: (context) => SecretPage()),
              );
            },
          ),
          const SizedBox(height: 8,
          ),
          ListTile(
            tileColor:Colors.white,
            title: Text('비밀남기기'),
            subtitle: Text('놀러가기'),
            trailing: CircleAvatar(
            radius: 56,
            backgroundColor: Colors.white38,
            backgroundImage: AssetImage('assets/images/back.png'),
          ),
          onTap: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => uploadPage()
          ),
          
          );
         },
        ), 
       ],
      ),
    ),
   ),
  );
  }
}
